
import Foundation

extension String {
    func formatterFromDateISO8601() -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withTimeZone, .withDashSeparatorInDate, .withColonSeparatorInTime]
        
        if let date = isoFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            dateFormatter.timeZone = TimeZone.current
            
            let formattedDateString = dateFormatter.string(from: date)
            return formattedDateString
        } else {
            return "Formato de data inválido"
        }
    }
}
