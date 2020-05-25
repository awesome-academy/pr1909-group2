# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.all.destroy_all
User.restore(1)
Book.all.destroy_all
b1 = Book.create!(name:  "Nỗi Nhớ Mùa Hè",
                  describe: "Truyện lấy bối cảnh Việt Nam những năm 1990. Thành phố trong truyện là một thành phố biển hư cấu. Có nhiều chi tiết không sát thực tế.",
                  price: 36000,
                  type_book: "Văn Học",
                  image: Rails.root.join("public/uploads/book/image/1/fairy-tale.jpg").open)
b2 = Book.create!(name:  "Tiểu phú bà",
                 describe: "Trong cuộc họp báo ra mắt sản phẩm mới, Chu Mộ Tu cho vợ mình nghĩ khẩu hiệu cổ động.",
                 price: 48000,
                 type_book: "Tâm Lí",
                 image: Rails.root.join("public/uploads/book/image/11/tieu-phu-ba.jpeg").open)
b3 = Book.create!(name:  "Chỉ Là Anh Giấu Đi",
                 describe: "Nội dung câu chuyện chủ yếu xoay quanh cuộc đời Duy Thanh, một chàng trai lớn lên ở cô nhi viện. Anh gặp Mỹ Hạnh và cả hai bắt đầu yêu nhau.",
                 price: 28000,
                 type_book: "Tiểu Thuyết",
                 image: Rails.root.join("public/uploads/book/image/12/clagd.jpg").open)
b4 = Book.create!(name:  "Mắt biếc",
                 describe: "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản",
                 price: 31000,
                 type_book: "Văn Học",
                 image: Rails.root.join("public/uploads/book/image/14/mat_biec.gif").open)
b5 = Book.create!(name:  "Tâm lí học",
                 describe: "Harry đang chờ đợi ở trường Privet Drive. Hội Phượng Hoàng sắp đến hộ tống nó ra đi an toàn",
                 price: 12500,
                 type_book: "Tâm Lí",
                 image: Rails.root.join("public/uploads/book/image/22/tam-ly-hoc-dam-dong.png").open)
b6 = Book.create!(name:  "Loạn chiến giang hồ",
                 describe: "Vậy là sau khi cô giáo đi, nó lườm tôi",
                 price: 19000,
                 type_book: "Lịch sử",
                 image: Rails.root.join("public/uploads/book/image/3/lcgh_2_0.jpg").open)
b7 = Book.create!(name:  "Đừng làm tội nhau",
                 describe: "Harry đang chờ đợi ở trường Privet Drive. Hội Phượng Hoàng sắp đến hộ tống nó ra đi an toàn",
                 price: 9000,
                 type_book: "Văn Học",
                 image: Rails.root.join("public/uploads/book/image/4/untitled5.png").open)
b8 = Book.create!(name:  "Shut Down",
                 describe: "Harry đang chờ đợi ở trường Privet Drive. Hội Phượng Hoàng sắp đến hộ tống nó ra đi an toàn",
                 price: 64000,
                 type_book: "Truyện Trinh Thám",
                 image: Rails.root.join("public/uploads/book/image/8/morning-glories_19.jpg").open)
b9 = Book.create!(name:  "Tung Hoa",
                 describe: "Harry đang chờ đợi ở trường Privet Drive. Hội Phượng Hoàng sắp đến hộ tống nó ra đi an toàn",
                 price: 29000,
                 type_book: "Kỳ Ảo",
                 image: Rails.root.join("public/uploads/book/image/9/images_0.jpg").open)
b10 = Book.create!(name:  "Bức tranh Việt Nam",
                 describe: "Harry đang chờ đợi ở trường Privet Drive. Hội Phượng Hoàng sắp đến hộ tống nó ra đi an toàn",
                 price: 44000,
                 type_book: "Văn Học",
                 image: Rails.root.join("public/uploads/book/image/5/tranh-phong-canh-lang-que-viet-nam-4.jpg").open)
b11 = Book.create!(name:  "Bức tranh",
                 describe: "Harry đang chờ đợi ở trường Privet Drive. Hội Phượng Hoàng sắp đến hộ tống nó ra đi an toàn",
                 price: 44000,
                 type_book: "Văn Học",
                 image: Rails.root.join("public/uploads/book/image/5/tranh-phong-canh-lang-que-viet-nam-4.jpg").open)
b12 = Book.create!(name:  "Bức tranh 3",
                 describe: "Harry đang chờ đợi ở trường Privet Drive. Hội Phượng Hoàng sắp đến hộ tống nó ra đi an toàn",
                 price: 44000,
                 type_book: "Văn Học",
                 image: Rails.root.join("public/uploads/book/image/5/tranh-phong-canh-lang-que-viet-nam-4.jpg").open)
30.times do |n|
  name = Faker::Name.name
  country = Faker::Address.country
  age = 19
  Author.create!(name: name,
                country: country,
                age: age)
end
30.times do |n|
  name = Faker::Name.name
  address = country = Faker::Address.city
  Publisher.create!(name: name,
                    address: address)
end
