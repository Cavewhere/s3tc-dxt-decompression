DynamicLibrary {
    name: "s3tc-dxt-decompression"

//    readonly property string rpath: buildDirectory

    Depends { name: "cpp" }
    Depends { name: "bundle" }

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

    Properties {
        condition: qbs.targetOS.contains("macos")
        cpp.sonamePrefix: qbs.installRoot + "/lib"
    }

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: ["."]
//        cpp.rpaths: [product.rpath]
    }

    Group {
        fileTagsFilter: ["dynamiclibrary"]
        condition: qbs.buildVariant == "release"
        qbs.install: qbs.targetOS.contains("windows")
    }

    Group {
        fileTagsFilter: ["bundle.content"]
        qbs.install: bundle.isBundle
        qbs.installSourceBase: product.buildDirectory
        qbs.installDir: "lib"
        qbs.installPrefix: ""
    }

}
