From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 21/36] drm/tegra: dc: Do not needlessly deassert reset
Date: Tue, 20 Jan 2015 11:48:40 +0100
Message-ID: <1421750935-4023-22-git-send-email-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkNvbW1pdCA5YzAxMjcw
MDRmZjQgKCJkcm0vdGVncmE6IGRjOiBBZGQgcG93ZXJnYXRlIHN1cHBvcnQiKSBjaGFuZ2VkIHRo
ZQpkcml2ZXIncyAtPnByb2JlKCkgaW1wbGVtZW50YXRpb24gdG8gZGVhc3NlcnQgdGhlIG1vZHVs
ZSByZXNldCwgYW5kIHdpdGgKdGhlcmUgYmVpbmcgbm9ib2R5IGVsc2UgdG8gYXNzZXJ0IGl0IHVu
dGlsIC0+cmVtb3ZlKCkgdGhlcmUgaXMgbm8gbmVlZAp0byBkZWFzc2VydCBhZ2FpbiBsYXRlciBv
bi4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKaW5kZXggNDYyOTQ1YWJkZWQyLi44NDZkYWY0OGNm
NjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kYy5jCkBAIC0xMTYwLDEwICsxMTYwLDYgQEAgc3RhdGljIHZvaWQgdGVn
cmFfY3J0Y19wcmVwYXJlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAogCWRybV9jcnRjX3ZibGFu
a19vZmYoY3J0Yyk7CiAKLQkvKiBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiAqLwotCXJlc2V0X2Nv
bnRyb2xfZGVhc3NlcnQoZGMtPnJzdCk7Ci0JdXNsZWVwX3JhbmdlKDEwMDAwLCAyMDAwMCk7Ci0K
IAlpZiAoZGMtPnBpcGUpCiAJCXN5bmNwdCA9IFNZTkNQVF9WQkxBTksxOwogCWVsc2UKLS0gCjIu
MS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
