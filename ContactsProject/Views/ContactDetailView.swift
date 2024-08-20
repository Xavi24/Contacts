import SwiftUI

struct ContactDetailView: View {
    let contact: ContactModel
    @State private var selectedColor: Color = .blue
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 20) {

                    VStack {
                        Spacer()
                        Circle()
                            .fill(Color.gray)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8)
                            .overlay(
                                Text(getInitials(from: contact.name))
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            )
                        
                        // Contact Name
                        Text(contact.name)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Button(action: {
                            }) {
                                VStack(alignment: .center) {
                                    Image(systemName: "message.fill")
                                        .font(.title2)
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 5))
                                        .foregroundColor(.white)
                                    Text("message")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.top, 2)
                                }
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 20))
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius:8))
                            }
                            
                            Button(action: {
                                // Action for call
                            }) {
                                VStack(alignment: .center) {
                                    Image(systemName: "phone.fill")
                                        .font(.title2)
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 5))
                                        .foregroundColor(.white)
                                    Text("call")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.top, 2)
                                }
                                .padding(EdgeInsets(top: 0, leading: 30, bottom: 5, trailing: 30))
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius:8))
                            }
                            
                            Button(action: {
                            }) {
                                VStack(alignment: .center) {
                                    Image(systemName: "envelope.fill")
                                        .font(.title2)
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 5))
                                        .foregroundColor(.white)
                                    Text("mail")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.top, 2)
                                }
                                .padding(EdgeInsets(top: 0, leading: 30, bottom: 5, trailing: 30))
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius:8))
                            }
                        }
                    }
                    .frame(height: geometry.size.height * 0.6)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemGray4))
                    
                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "phone.circle.fill")
                                .font(.title2)
                                .foregroundColor(.gray)
                            VStack(alignment: .leading) {
                                Text("mobile")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(contact.phone)
                                    .font(.body)
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        HStack {
                            Image(systemName: "envelope.circle.fill")
                                .font(.title2)
                                .foregroundColor(.gray)
                            VStack(alignment: .leading) {
                                Text("work")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(contact.email)
                                    .font(.body)
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "house.circle.fill")
                                .font(.title2)
                                .foregroundColor(.gray)
                            VStack(alignment: .leading) {
                                Text("address")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text("\(contact.address.street), \(contact.address.suite), \(contact.address.city), \(contact.address.zipcode)")
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "globe")
                                .font(.title2)
                                .foregroundColor(.gray)
                            VStack(alignment: .leading) {
                                Text("website")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(contact.website)
                                    .font(.body)
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        HStack {
                            Image(systemName: "briefcase.circle.fill")
                                .font(.title2)
                                .foregroundColor(.gray)
                            VStack(alignment: .leading) {
                                Text("company")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(contact.company.name)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                Text(contact.company.catchPhrase)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarTitleDisplayMode(.inline)
        .background(TransparentNavigationBar())
    }
    
    private func getInitials(from name: String) -> String {
            let nameComponents = name.split(separator: " ")
            guard let firstInitial = nameComponents.first?.first,
                  let lastInitial = nameComponents.last?.first else {
                return String(name.prefix(2))
            }
            return "\(firstInitial)\(lastInitial)"
        }
}

struct TransparentNavigationBar: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        if let navigationController = controller.navigationController {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }
}

