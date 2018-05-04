From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/4] drm/tegra: dc: Free syncpoint on errors
Date: Fri,  4 May 2018 15:37:04 +0200
Message-ID: <20180504133707.22451-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIGFuIGVycm9yIGhh
cHBlbnMgZHVyaW5nIGRpc3BsYXkgY29udHJvbGxlciBpbml0aWFsaXphdGlvbiwgdGhlIGhvc3Qx
eApzeW5jcG9pbnQgcHJldmlvdXNseSByZXF1ZXN0ZWQgd291bGQgYmUgbGVha2VkLiBQcm9wZXJs
eSBjbGVhbiB1cCB0aGUKc3luY3BvaW50IGFsb25nIHdpdGggdGhlIG90aGVyIHJlc291cmNlcy4K
ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwppbmRleCBmMjA2NDhmNThlNDkuLmM4NDNmMTEwNDNkYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2RjLmMKQEAgLTE5MjUsNiArMTkyNSw4IEBAIHN0YXRpYyBpbnQgdGVncmFfZGNf
aW5pdChzdHJ1Y3QgaG9zdDF4X2NsaWVudCAqY2xpZW50KQogCQlpb21tdV9ncm91cF9wdXQoZGMt
Pmdyb3VwKTsKIAl9CiAKKwlob3N0MXhfc3luY3B0X2ZyZWUoZGMtPnN5bmNwdCk7CisKIAlyZXR1
cm4gZXJyOwogfQogCi0tIAoyLjE3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
