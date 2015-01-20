From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 10/36] drm/tegra: dc: No longer disable planes at CRTC disable
Date: Tue, 20 Jan 2015 11:48:29 +0100
Message-ID: <1421750935-4023-11-git-send-email-thierry.reding@gmail.com>
References: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBEUk0gY29yZSBz
aG91bGQgdGFrZSBjYXJlIG9mIGRpc2FibGluZyBhbGwgdW5uZWVkZWQgcGxhbmVzLCBzbyB0aGVy
ZQppcyBubyBuZWVkIHRvIGRvIHRoaXMgZXhwbGljaXRseS4KClNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2RjLmMgfCAxNCAtLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2RjLmMKaW5kZXggMGMyOTcyZTRiNDFhLi45Y2VlNjQ2NWI3NTMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdy
YS9kYy5jCkBAIC0xMDAxLDIwICsxMDAxLDYgQEAgc3RhdGljIGludCB0ZWdyYV9kY193YWl0X2lk
bGUoc3RydWN0IHRlZ3JhX2RjICpkYywgdW5zaWduZWQgbG9uZyB0aW1lb3V0KQogc3RhdGljIHZv
aWQgdGVncmFfY3J0Y19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIHsKIAlzdHJ1Y3Qg
dGVncmFfZGMgKmRjID0gdG9fdGVncmFfZGMoY3J0Yyk7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRy
bSA9IGNydGMtPmRldjsKLQlzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZTsKLQotCWRybV9mb3JfZWFj
aF9sZWdhY3lfcGxhbmUocGxhbmUsICZkcm0tPm1vZGVfY29uZmlnLnBsYW5lX2xpc3QpIHsKLQkJ
aWYgKHBsYW5lLT5jcnRjID09IGNydGMpIHsKLQkJCXRlZ3JhX3dpbmRvd19wbGFuZV9kaXNhYmxl
KHBsYW5lKTsKLQkJCXBsYW5lLT5jcnRjID0gTlVMTDsKLQotCQkJaWYgKHBsYW5lLT5mYikgewot
CQkJCWRybV9mcmFtZWJ1ZmZlcl91bnJlZmVyZW5jZShwbGFuZS0+ZmIpOwotCQkJCXBsYW5lLT5m
YiA9IE5VTEw7Ci0JCQl9Ci0JCX0KLQl9CiAKIAlpZiAoIXRlZ3JhX2RjX2lkbGUoZGMpKSB7CiAJ
CXRlZ3JhX2RjX3N0b3AoZGMpOwotLSAKMi4xLjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
