import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Blog: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://jaesung-0o0.github.io/blog")!
    var name = "ㅈㅅㅇㄱ"
    var description = "Swift Fundamentals"
    var language: Language { .korean }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try Blog()
    .publish(
        using: [
            .addMarkdownFiles(),
            .copyResources(),
            .generateHTML(withTheme: .foundation),
            .generateRSSFeed(including: [.posts]),
            .generateSiteMap(),
            .deploy(
                using: .gitHub(
                    "jaesung-0o0/blog",
                    branch: "main",
                    useSSH: false
                )
            )
        ]
    )
