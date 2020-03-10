DynamicLibrary {
    name: "s3tc-dxt-decompression"

    consoleApplication: true

    Depends { name: "cpp" }

    files: [
        "*.h",
        "*.cpp"
    ]

    Properties {
        condition: qbs.targetOS.contains("windows")
        cpp.defines: [
            "S3TC_LIB"
        ]
    }

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: ["."]
    }

    Group {
        fileTagsFilter: ["dynamiclibrary"]
        condition: qbs.buildVariant == "release"
        qbs.install: qbs.targetOS.contains("windows")
    }

}
