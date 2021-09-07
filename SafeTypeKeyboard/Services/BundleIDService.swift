//
//  BundleIDService.swift
//  SafeTypeKeyboard
//
//  Created by Jessi Febria on 05/09/21.
//

import Foundation

final class BundleIDService {
    
    static let bundleDictionary:[String:String] = ["com.apple.Fitness":"Activity","com.apple.AppStore":"AppStore", "com.apple.iBooks":"Books","com.apple.calculator":"Calculator","com.apple.mobilecal":"Calendar","com.apple.camera":"Camera","com.apple.clips":"Clips","com.apple.mobiletimer":"Clock","com.apple.compass":"Compass","com.apple.MobileAddressBook":"Contacts","com.apple.facetime":"FaceTime","com.apple.DocumentsApp":"Files","com.apple.mobileme.fmf1":"FindFriends","com.apple.mobileme.fmip1":"FindiPhone","com.apple.mobilegarageband":"GarageBand","com.apple.Health":"Health","com.apple.Home":"Home","com.apple.iCloudDriveApp":"iCloudDrive","com.apple.iMovie":"iMovie","com.apple.MobileStore":"iTunesStore","com.apple.itunesu":"iTunes","com.apple.mobilemail":"Mail","com.apple.Maps":"Maps","com.apple.MobileSMS":"Messages","com.apple.measure":"Measure","com.apple.Music":"Music","com.apple.news":"News","com.apple.mobilenotes":"Notes","com.apple.mobilephone":"Phone","com.apple.mobileslideshow":"Photos","com.apple.Photo-Booth":"PhotoBooth","com.apple.podcasts":"Podcasts","com.apple.reminders":"Reminders","com.apple.mobilesafari":"Safari","com.apple.Preferences":"Settings","is.workflow.my.app":"Shortcuts","com.apple.stocks":"Stocks","com.apple.tips":"Tips","com.apple.tv":"TV","com.apple.videos":"Videos","com.apple.VoiceMemos":"VoiceMemos","com.apple.Passbook":"Wallet","com.apple.Bridge":"Watch","com.apple.weather":"Weather","com.facebook.Facebook":"Facebook","com.google.ios.youtube":"YouTube","net.whatsapp.WhatsApp":"WhatsApp","com.facebook.Messenger":"Messenger","com.skype.skype":"Skype","com.burbn.instagram":"Instagram","com.viber":"Viber","com.atebits.Tweetie2":"Twitter","com.google.Maps":"GoogleMaps","com.google.GoogleMobile":"Google","com.google.chrome.ios":"Chrome","com.google.Gmail":"Gmail","com.sgiggle.Tango":"Tango","com.google.Translate":"Translate","jp.naver.line":"LINE","com.google.b612":"GoogleEarth","com.midasplayer.apps.candycrushsaga":"CandyCrush","com.kiloo.subwaysurfers":"SubwaySurf","com.getdropbox.Dropbox":"Dropbox","com.toyopagroup.picaboo":"Snapchat","com.ebay.iphone":"eBay","com.pandora":"Pandora","com.yahoo.messenger":"Y!Messenger","com.flexilis.security":"Lookout","com.google.GooglePlus":"Google+","com.linkedin.LinkedIn":"LinkedIn","com.waze.iphone":"Waze","com.kik.chat":"Kik","com.imangi.templerun2":"TempleRun2","com.imangi.templerun":"TempleRun","com.netflix.Netflix":"Netflix","com.blackberry.bbm1":"BBM","com.yahoo.Aerogram":"YahooMail","com.spotify.client":"Spotify","com.apple.store.Jolly":"AppleStore","com.opera.OperaMini":"OperaMini","com.vstudio.camera360":"Camera360","com.ookla.speedtest":"Speedtest","com.tunein.TuneInRadio":"TuneInRadio","com.adobe.PSMobile":"PSExpress","com.soundcloud.TouchApp":"SoundCloud","com.amazon.Amazon":"Amazon","com.apple.Pages":"Pages","com.google.Drive":"Drive","com.outfit7.talkingtom2":"TalkingTom2","com.apple.Numbers":"Numbers","com.apple.Keynote":"Keynote","com.tencent.xin":"WeChat","com.microsoft.wlx":"Messenger","com.nimbuzz.Nimbuzz":"Nimbuzz","com.aviary.Photo-Editor":"Aviary","com.booking.BookingApp":"Booking.com","com.anchorfree.hss":"HotspotVPN","com.supercell.magic":"ClashofClans","com.picsart.studio":"PicsArt","ph.telegra.Telegraph":"Telegram","com.outerspaceapps.itranslate":"iTranslate","com.badoo.Badoo":"Badoo","com.mcafee.gti.ThreatFeed":"ThreatFeed","com.bumptechnologies.bump":"Bump","com.rovio.angrybirdsfree":"AngryBirds","com.melodis.soundhound.free":"SoundHound","com.apple.Remote":"Remote","com.ucweb.ucbrowser.iphone.international":"UCBrowser","net.wooga.diamonddash":"DiamondDash","com.halfbrick.jetpack":"Jetpack","tv.lifechurch.bible":"Bible","com.fingersoft.hillclimbracing":"HillClimb","com.imdb.imdb":"IMDb","com.lianjie.VideoDownloaderFree":"FreeVideo","com.ubercab.UberClient":"Uber","com.supercell.soil":"HayDay","com.niksoftware.snapseedforipad":"Snapseed","com.appsneon.videodlfree":"Download","com.midasplayer.apps.farmheroessaga":"FarmHeroesSaga","com.tumblr.tumblr":"Tumblr","com.zedge.Zedge":"ZEDGE","com.ultimake.smartsync":"Sync.ME","com.groupon.grouponapp":"Groupon","com.vine.iphone":"Vine","com.evernote.iPhone.Evernote":"Evernote","com.google.hangouts":"Hangouts","com.microsoft.skydrive":"OneDrive","com.badrobot.actionmoviefx":"ActionMovie","com.rovio.angrybirdsrio":"AngryBirds","com.naveenium.foursquare":"Foursquare","com.keek.keek":"Keek","com.tripadvisor.LocalPicks":"TripAdvisor","com.cnn.iphone":"CNN","com.myrete.WhosHere":"WhosHere","com.lianjie.PrivateVideoFree2":"FreeVideo","org.wikimedia.wikipedia":"Wikipedia","com.midasplayer.apps.candycrushsodasaga":"CandyCrush","com.yahoo.flickr":"Flickr","com.iwilab.KakaoTalk":"KakaoTalk","com.gameloft.despicableme2":"MinionRush","com.olx.olx":"OLX","com.teamviewer.rc":"TeamViewer","com.teamviewer.teamviewer":"TeamViewer","com.google.Docs":"Docs","com.microsoft.onenote":"OneNote","com.microsoft.Office.Powerpoint":"PowerPoint"]
    
    func bundleToPlatform(_ bundleID : String) -> String{
    
        if let result = BundleIDService.bundleDictionary[bundleID] {
            return result
        } else {
            return bundleToPlatformWhereBundleIsNotInDictionary(bundleID)
        }
        
    }
    
    
    func bundleToPlatformWhereBundleIsNotInDictionary(_ bundleID : String) -> String {
        
        /**
         If bundleID is not in the dictionary, this func will executed.
         Input:
            "com.teamviewer.teamviewer"
         Output :
            Teamviewer Teamviewer
         */
        
        var start = bundleID.startIndex
        
        if let tryStart = bundleID.firstIndex(of: ".") {
            start = tryStart
        } else {
            return bundleID.capitalized.trimmingCharacters(in: .whitespaces)
        }
        
        let end = bundleID.endIndex
        let range = start..<end

        var platform = String(bundleID[range])

        platform = platform.replacingOccurrences(of: ".", with: " ", options: NSString.CompareOptions.literal, range: nil)

        return platform.capitalized.trimmingCharacters(in: .whitespaces)
        
    }
    
}
