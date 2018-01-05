//
//  Document.swift
//  TuTuNotes
//
//  Created by 贺赟生 on 2018/1/4.
//  Copyright © 2018年 贺赟生. All rights reserved.
//

import Cocoa

enum NoteFilesNames:String {
    
    
    case TextFile = "text.rtf" //文本文件名
    
    case AttachmentsDirectory = "Attachments" //附件文件名
}

enum ErrorCode : Int {
    
    /// 无法找到文档
    case CannotFondDocument
    /// 无法访问文档中的任何文件
    case CannotLoadFileWrapper;
    /// 无法加载 text.rtf 文件
    case CannotLoadText
    /// 无法访问 Attachments 文件夹
    case CannotAccessAttachments
    /// 无法保存 text.rtf 文件
    case CannotSaveText
    /// 无法保存附件
    case CannotSaveAttachments
}

let ErrorDomain = "notesErrorDomain"

func error(code : ErrorCode, _ userInfo:[NSObject:AnyObject]? = nil) -> NSError {
    
    return NSError(domain : ErrorDomain ,code : code.rawValue, userInfo:userInfo as? [String : Any])
    
}



class Document: NSDocument {

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
        var text : NSAttributedString = NSAttributedString();
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override var windowNibName: NSNib.Name? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return NSNib.Name("Document")
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

