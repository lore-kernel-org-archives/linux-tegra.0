From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] drm/tegra: fix locking of SET_TILING ioctl
Date: Thu, 12 Nov 2015 16:09:56 +0900
Message-ID: <1447312196-11470-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, Terje Bergstrom <tbergstrom@nvidia.com>
Cc: linux-tegra@vger.kernel.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

ZHJtX2dlbV9vYmplY3RfdW5yZWZlcmVuY2UoKSBub3cgZXhwZWN0cyBvYmotPmRldi0+c3RydWN0
X211dGV4IHRvIGJlCmhlbGQuIFVzZSB0aGUgbmV3bHktaW50cm9kdWNlZCBkcm1fZ2VtX29iamVj
dF91bnJlZmVyZW5jZV91bmxvY2tlZCgpCndoaWNoIGhhbmRsZXMgbG9ja2luZyBmb3IgdXMuCgpJ
ZiB3ZSBkb24ndCBkbyB0aGlzIGRybV9nZW1fb2JqZWN0X3VucmVmZXJlbmNlKCkgd2lsbCBnZXQg
bm9pc3kgYWJvdXQKc3RydWN0X211dGV4IG5vdCBiZWluZyBoZWxkIGV2ZXJ5IHRpbWUgd2UgY2Fs
bCB0aGUgU0VUX1RJTElORyBpb2N0bC4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90
IDxhY291cmJvdEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kcm0uYwppbmRleCBjYzQ4MzM0ZWYxNjQuLmMwYWU4OTg2NTk1OCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9k
cm0uYwpAQCAtNjgzLDcgKzY4Myw3IEBAIHN0YXRpYyBpbnQgdGVncmFfZ2VtX3NldF90aWxpbmco
c3RydWN0IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqZGF0YSwKIAliby0+dGlsaW5nLm1vZGUgPSBt
b2RlOwogCWJvLT50aWxpbmcudmFsdWUgPSB2YWx1ZTsKIAotCWRybV9nZW1fb2JqZWN0X3VucmVm
ZXJlbmNlKGdlbSk7CisJZHJtX2dlbV9vYmplY3RfdW5yZWZlcmVuY2VfdW5sb2NrZWQoZ2VtKTsK
IAogCXJldHVybiAwOwogfQotLSAKMi42LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
