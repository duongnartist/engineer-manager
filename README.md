# Engineer Manager
The best guideline for Engineer Manager

## 1. Mục tiêu

### 1.1. Lý thuyết

- Đảm bảo chất lượng sản phẩm: code sạch, tuân thủ convention, kiểm soát bug, hạn chế tech debt.
- Đảm bảo bảo mật: tránh rò rỉ dữ liệu nhạy cảm, tuân thủ quy trình commit & review.
- Đảm bảo tiến độ: velocity ổn định trong mỗi sprint 2 tuần, cân bằng feature & tech debt.
- Đảm bảo sự phối hợp: Developer, QA/QC, Leader, Manager, PO làm việc minh bạch, trách nhiệm rõ ràng, không blame.
- Đảm bảo quy trình chuẩn hóa: từ Git Flow, commit, review, lint/format, đến release & QA test → team có chung ngôn ngữ và công cụ.

### 1.2. Thực tế

- Tốc độ ưu tiên số 1 → hoàn thành nhanh để kịp deadline, ra mắt sớm.
- Chất lượng vừa đủ → code và test đảm bảo không crash, không bug nghiêm trọng trong sản phẩm demo/production.
- Giảm overhead → quy trình commit, review, QA/QC rút gọn, tập trung task critical.
- Linh hoạt → chấp nhận tech debt có kiểm soát, xử lý sau release nếu cần.

## 2. Thực hiện

### 2.1. Quy trình phát triển (Làm việc với Developers)

### 2.1.1. Nhánh chính

- `main` or `master` → chứa code ổn định, đã release.
- `develop` → chứa code đang phát triển, luôn có thể chạy được.

### 2.1.2. Nhánh phụ

- `feature/*` → phát triển tính năng mới.
- `hotfix/*` → sửa lỗi gấp trên main.
- `release/*` → chuẩn bị bản release (fix bug nhỏ, cập nhật version).

### 2.1.3. Quy trình Work Flow

#### 2.1.3.1. Bắt đầu 1 tính năng

```sh
git checkout develop
git pull
git checkout -b feature/user_name/ticket_id-ticket_title
```

#### 2.1.3.1. Làm việc & commit

- Commit theo format: `[ABC-123] Mô tả ngắn gọn thay đổi`

#### 2.1.3.1. Gửi Pull Request (PR)

- Khi xong tính năng → tạo PR từ `feature/*` → `develop`.
- Code review + chạy CI.

#### 2.1.3.2. Chuẩn bị Release

```sh
git checkout develop
git checkout -b release/1.0.0
```

- Test, fix bug nhỏ.
- Merge vào `main` + tạo tag `1.0.0`.
- Merge ngược vào `develop` để đồng bộ.

#### 2.1.3.3. Sửa lỗi gấp (Hotfix)

```sh
git checkout main
git checkout -b hotfix/1.0.1
```

- Sửa lỗi → merge vào main và develop.

### 2.1.4. Quy tắc commit

- Format: [ABC-123] Mô tả ngắn gọn
- Ví dụ: `[ABC-123] Thêm màn hình đăng nhập`

### 2.1.5. Quy tắc merge

- Không commit trực tiếp vào main và develop.
- Luôn tạo PR và có ít nhất 1 người review.
- Merge bằng Squash & Merge để giữ commit lịch sử gọn gàng.

### 2.1.6. Quy tắc Review Code

#### 2.1.6.1. Nguyên tắc chung

- Mỗi PR phải được ít nhất 1 reviewer duyệt trước khi merge.
- Reviewer cần xem xét cả logic, code style, bảo mật, performance.
- Thảo luận qua comment, tránh sửa trực tiếp code của người khác (trừ lỗi nhỏ rõ ràng).

#### 2.1.6.2. Checklist Review

- ✅ Code chạy được, không gây crash.
- ✅ Tuân thủ coding convention (lint + format).
- ✅ Không commit secret/key/token.
- ✅ Viết code dễ hiểu, có comment nếu logic phức tạp.
- ✅ Tên biến, hàm, class rõ ràng, đúng chính tả.
- ✅ Có unit test (nếu cần).
- ✅ Performance hợp lý, không gây leak memory, block UI.

#### 2.1.6.2. Cách phản hồi

- Nên: đề xuất cải tiến với giải thích ngắn gọn.
- Không nên: chê trách cá nhân, chỉ tập trung vào code.
- Nếu PR quá lớn → yêu cầu tách nhỏ để dễ review.

#### 2.1.6.3. Trách nhiệm của Reviewer

- Kiểm tra CI/CD pass hoặc build number trong ticket.
- Đảm bảo code mới không phá vỡ backward compatibility.
- Khi approved → đồng nghĩa với việc bạn chịu trách nhiệm cùng tác giả nếu có bug lọt qua.

## 2.2. Quản lý Tasks (Làm việc với Manager)

### 2.2.1 Một số nguyên tắc trước khi định nghĩa

- Story points không phải là giờ hay ngày → nó phản ánh độ phức tạp, rủi ro, effort.
- Velocity team = tổng điểm trung bình mà team hoàn thành trong 2–3 sprint gần nhất.
- Mỗi developer có `bandwidth` khác nhau tùy level, kinh nghiệm, công cụ quen thuộc.

### 2.2.2. Tham chiếu velocity theo level Developer (2 tuần / sprint)

**Level** | **Velocity** | **Note**
-- | -- | --
**Junior Dev** | ~8 – 12 points | Dành nhiều thời gian học, review, fix lỗi sau review. Thích hợp task nhỏ (1–3 points).
**Middle Dev** | ~12 – 16 points | Đã tự chủ phần lớn task, xử lý được task cỡ trung bình (3–5 points).
**Senior Dev** | ~16 – 20 points | Xử lý task phức tạp (5–8 points), dẫn dắt, review code, hỗ trợ junior/middle.

⚠️ Velocity cá nhân chỉ là ước lượng. Điều quan trọng là velocity của team, không nên dùng để so sánh cá nhân.

### 2.2.3. Velocity của Release Engineer

Release Engineer thường không code nhiều feature, mà tập trung vào:
- CI/CD pipelines.
- Quản lý build, deployment.
- Quản lý release note, versioning, hotfix gấp.

👉 Vì công việc mang tính support và có thể bùng phát ở giai đoạn release, nên velocity tính theo capacity riêng:

**Role** | **Velocity** | **Note**
-- | -- | --
**Release Engineer** | ~8 – 16 points | Task chủ yếu là build/release automation, hotfix, config. Points dao động mạnh theo chu kỳ release. (không ổn định)

### 2.2.4. Cách áp dụng trong thực tế

- Dùng 2–3 sprint đầu tiên để đo velocity thực tế của team → hiệu chỉnh lại.
- Không fix cứng velocity từng người → chỉ làm guideline khi planning.
- Trong sprint planning, nên để:
    - **Junior**: 2–3 task nhỏ, clear scope.
	- **Middle**: 3–5 task trung bình.
	- **Senior**: 2–4 task phức tạp + review code.
	- **Release Engineer**: phân bổ vào cuối sprint (khi cần release).

👉 Gợi ý: Nếu team bạn có khoảng 5 người (2 junior, 2 middle, 1 senior) → velocity team cho 1 sprint 2 tuần sẽ khoảng 44–76 points là hợp lý.

## 2.3. Phân bổ Tasks (Làm việc với Product Owner)

### 2.3.1. Cách tiếp cận khi nói chuyện với PO

- Không dùng ngôn ngữ kỹ thuật thuần túy (refactor, clean code, migrate, CI/CD…).
- Chuyển tech debt thành risk & business impact: downtime, performance chậm, security risk, cost tăng khi thêm feature.
- Luôn gắn tech debt vào giá trị dài hạn cho sản phẩm.

### 2.3.2. Các mô hình phổ biến để phân bổ effort cho tech debt

#### 2.3.1. Fixed percentage (ổn định)

- Luôn dành 15–20% velocity mỗi sprint cho tech debt.
- Ví dụ: Sprint velocity team là 100 points → dành 15–20 points cho tech debt.
- Ưu điểm: Có budget ổn định, dễ quản lý.
- Nhược điểm: Nếu tech debt quá lớn thì xử lý lâu.

#### 2.3.2. Time-boxed iteration

- Mỗi 5–6 sprint, dành trọn 1 sprint để xử lý tech debt, bug, refactor.
- Ưu điểm: Giải quyết triệt để, PO cũng thấy rõ kết quả.
- Nhược điểm: Business có thể bị delay feature trong sprint đó.

#### 2.3.3. Embedded in backlog

- Tech debt được viết thành user story hoặc task cụ thể, đưa vào backlog như feature.
- Ví dụ:
    - “As a developer, I need to migrate networking lib to Retrofit 3 to reduce maintenance risk”.
    - PO sẽ ưu tiên dựa trên impact.
- Ưu điểm: Minh bạch, PO nhìn thấy debt rõ ràng.
- Nhược điểm: Dễ bị PO hạ ưu tiên.

### 2.3.3. Khi nào nên push mạnh với PO

- Khi tech debt ảnh hưởng trực tiếp đến roadmap:
	- Release chậm do build tốn nhiều thời gian.
	- Không scale được khi user tăng.
	- Bug tái diễn nhiều lần.
	- Rủi ro bảo mật.
- Khi đó, nên trình bày với PO bằng con số:
	- Chúng ta mất 2 ngày để fix bug do legacy lib. Nếu refactor sẽ tốn 5 ngày nhưng tiết kiệm 2 ngày mỗi sprint.

### 2.3.4. Cách trade-off khi trao đổi

- Nếu PO muốn đẩy nhanh feature → đề xuất chỉ làm critical debt (gây bug, crash, security risk).
- Nếu roadmap có buffer → đề xuất xử lý nhiều hơn debt.
- Luôn nhấn mạnh: xử lý tech debt không phải luxury, mà là insurance để giữ velocity ổn định.

### 2.3.5. Một format nói chuyện gợi ý

```
Hi [PO], hiện tại team đang có một số tech debt [mô tả ngắn]. Nếu không xử lý, mỗi khi thêm feature A, chúng ta sẽ tốn thêm [X ngày]. Đề xuất dành 20% effort mỗi sprint để xử lý tech debt. Như vậy, chúng ta đảm bảo tốc độ phát triển feature ổn định và giảm rủi ro trong các release tới.
```

## 2.4. Quy tắc làm việc với QA/QC

### 2.4.1. Quy tắc chung

- Tôn trọng 2 chiều: QA không chỉ là “người tìm bug”, mà là đối tác chất lượng sản phẩm.
- Minh bạch: Dev cần viết rõ ràng commit, PR, task description; QA cần ghi bug cụ thể, dễ reproduce.
- Trao đổi sớm: QA được involve từ khi grooming và planning, không phải đợi đến cuối sprint.

### 2.4.2. Trước khi Dev giao task cho QA

- Self-checklist của Dev:
    - Code build thành công, không crash.
	- Pass lint, unit test, integration test.
	- Feature đã test trên thiết bị/giả lập chính.
	- Không commit secret/token.
	- Update doc hoặc release note nếu có thay đổi.
- Environment rõ ràng: staging, test account, mock data (nếu có).
- Definition of Done (DoD): Task chưa xong không giao QA.

### 2.4.3. Trong quá trình QA test

- QA cần ghi bug rõ ràng:
	- Steps to reproduce.
	- Expected result vs Actual result.
	- Environment (OS, app version, device).
	- Screenshot / Video / Log (nếu có).
	- Bug phải được gắn priority/severity (Critical, Major, Minor, Trivial).
- Nếu bug liên quan requirement chưa rõ ràng → QA trao đổi lại với PO/Dev trước khi log chính thức.

### 2.4.4. Khi Dev nhận bug từ QA

- Dev cần reproduce lại bug trước.
- Nếu không reproduce được → báo lại QA với log / môi trường.
- Không đóng bug mà không giải thích → luôn update trạng thái với comment.
- Fix xong → push lên branch → tạo PR → tag QA để verify lại.

### 2.4.5. Trách nhiệm 2 bên

#### 2.4.5.1. Developer

- Viết code clean, dễ test.
- Viết unit test, automation test khi có thể.
- Giao task kèm hướng dẫn test (test case chính).
- Bổ sung thêm các version, build, tool hỗ trợ.

#### 2.4.5.2. QA/QC

- Viết test case rõ ràng, maintain regression test suite.
- Ưu tiên test tính năng impact lớn trước.
- Báo cáo bug dựa trên severity, không phải cảm tính.

### 2.4.6. Quy trình Bug Lifecycle (trạng thái chuẩn)

1.	New → QA tạo bug.
2.	Open → Leader duyệt, assign cho Dev.
3.	In Progress → Dev fix.
4.	Fixed → Dev báo đã fix, đẩy lên branch.
5.	Ready for Retest → QA verify.
6.	Closed → QA confirm ok.
7.	Reopen → QA thấy bug chưa fix hoặc tái hiện lại.

### 2.4.7. Một số best practices

- Bug Critical/Blocker cần được xử lý trong 24h.
- QA nên test song song khi Dev đang làm feature (early testing).
- Mỗi sprint nên có Bug Triage Meeting (15 phút) để review bug, ưu tiên fix.
- No blame culture: bug là vấn đề của team, không đổ lỗi cá nhân.

## 3. Kết luận

### 3.1. Lý thuyết

- Developer → Code sạch, test trước khi giao, phối hợp QA/QC.
- QA/QC → Test có kế hoạch, log bug chi tiết, ưu tiên theo severity.
- Leader → Điều phối công việc, review code, gỡ vướng mắc kỹ thuật.
- Manager → Quản lý tiến độ, nguồn lực, đảm bảo đúng cam kết.
- PO → Xác định ưu tiên, rõ ràng yêu cầu, cân bằng feature và tech debt.

### 3.2. Thực tế

- Developer: Code nhanh, sạch vừa đủ, tự test cơ bản trước khi giao.
- QA/QC: Ưu tiên test case critical, skip minor để không chặn release.
- Leader: Quyết định nhanh, giảm vòng lặp review, tập trung unblock team.
- Manager: Cân đối nguồn lực, bảo vệ team khỏi scope creep.
- PO: Rõ ràng yêu cầu cốt lõi, chấp nhận trade-off chất lượng/phạm vi để kịp tiến độ.

👉 Chung mục tiêu: giao sản phẩm chất lượng, đúng tiến độ, không blame, cùng chịu trách nhiệm.