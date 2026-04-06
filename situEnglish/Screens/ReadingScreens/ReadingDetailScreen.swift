import AVFoundation
import Combine
import SwiftUI

struct ReadingDetailScreen: View {
    let lesson: ReadingLesson
    @StateObject private var audioPlayer = ReadingAudioPlayer()
    @State private var isSaved = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.Layout.xxl) {
                headerSection
                storySection
                vocabularySection
            }
            .padding(Spacing.Layout.lg)
        }
        .background(Color.appBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    toggleAudio()
                } label: {
                    AppIcon(
                        name: audioPlayer.isSpeaking ? "stop.fill" : "speaker.wave.2.fill",
                        size: .md,
                        color: .appForeground
                    )
                }

                Button {
                    isSaved.toggle()
                } label: {
                    AppIcon(
                        name: isSaved ? "bookmark.fill" : "bookmark",
                        size: .md,
                        color: .appForeground
                    )
                }
            }
        }
        .onDisappear {
            audioPlayer.stop()
        }
    }
}

private extension ReadingDetailScreen {
    var headerSection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.md) {
            AppText(lesson.title, style: .h1, color: .appForeground)
        }
    }

    var storySection: some View {
        Group {
            if lesson.kind == .dialogue {
                VStack(spacing: Spacing.Layout.md) {
                    ForEach(Array(lesson.dialogue.enumerated()), id: \.element.id) { index, line in
                        AppDialogueMessageCard(
                            speaker: line.speaker,
                            message: line.message,
                            isAccent: index.isMultiple(of: 2)
                        )
                    }
                }
            } else {
                AppText(
                    lesson.content,
                    style: .bodyText,
                    color: .appForeground
                )
            }
        }
    }

    var vocabularySection: some View {
        VStack(alignment: .leading, spacing: Spacing.Layout.lg) {
            AppText("Vocabulary", style: .h3, color: .appForeground)

            VStack(spacing: Spacing.Layout.md) {
                ForEach(lesson.vocabulary) { item in
                    AppVocabularyCard(
                        word: item.word,
                        definition: item.definition
                    )
                }
            }
        }
    }

    func toggleAudio() {
        audioPlayer.toggle(text: lesson.content)
    }
}

final class ReadingAudioPlayer: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
    @Published var isSpeaking = false

    private let synthesizer = AVSpeechSynthesizer()

    override init() {
        super.init()
        synthesizer.delegate = self
    }

    func toggle(text: String) {
        if synthesizer.isSpeaking {
            stop()
            return
        }

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = preferredVoice()
        utterance.rate = 0.47
        utterance.pitchMultiplier = 0.92

        synthesizer.speak(utterance)
        isSpeaking = true
    }

    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
        isSpeaking = false
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        isSpeaking = false
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        isSpeaking = false
    }

    private func preferredVoice() -> AVSpeechSynthesisVoice? {
        AVSpeechSynthesisVoice(language: "en-US")
    }
}
