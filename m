From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] gpu: host1x: Fix syncpt array index check
Date: Tue,  7 Mar 2017 17:42:34 +0200
Message-ID: <20170307154234.6246-1-mperttunen@nvidia.com>
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
To: thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

VGhlIGluZGV4IG92ZXJmbG93IGNoZWNrIGluIGhvc3QxeF9zeW5jcHRfZ2V0IHdhcyBpbmNvcnJl
Y3QsCmFuZCB3b3VsZCByZXR1cm4gYSBwb2ludGVyIHBhc3QgdGhlIHN5bmNwdCBhcnJheSBpZiB0
aGUKc3luY3B0IGluZGV4IGdpdmVuIHdhcyB0aGUgdG90YWwgbnVtYmVyIG9mIHN5bmNwdHMuIEZp
eAp0aGlzLgoKU2lnbmVkLW9mZi1ieTogTWlra28gUGVydHR1bmVuIDxtcGVydHR1bmVuQG52aWRp
YS5jb20+Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L3N5bmNwdC5jIHwgNiArKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvaG9zdDF4L3N5bmNwdC5jIGIvZHJpdmVycy9ncHUvaG9zdDF4L3N5bmNwdC5j
CmluZGV4IDI1YzExYTg1MDUwYi4uMzIzNmMzZDIxYTE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9ob3N0MXgvc3luY3B0LmMKKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L3N5bmNwdC5jCkBAIC00
ODQsMTAgKzQ4NCwxMCBAQCB1bnNpZ25lZCBpbnQgaG9zdDF4X3N5bmNwdF9uYl9tbG9ja3Moc3Ry
dWN0IGhvc3QxeCAqaG9zdCkKIAogc3RydWN0IGhvc3QxeF9zeW5jcHQgKmhvc3QxeF9zeW5jcHRf
Z2V0KHN0cnVjdCBob3N0MXggKmhvc3QsIHVuc2lnbmVkIGludCBpZCkKIHsKLQlpZiAoaG9zdC0+
aW5mby0+bmJfcHRzIDwgaWQpCisJaWYgKGlkIDwgaG9zdC0+aW5mby0+bmJfcHRzKQorCQlyZXR1
cm4gaG9zdC0+c3luY3B0ICsgaWQ7CisJZWxzZQogCQlyZXR1cm4gTlVMTDsKLQotCXJldHVybiBo
b3N0LT5zeW5jcHQgKyBpZDsKIH0KIEVYUE9SVF9TWU1CT0woaG9zdDF4X3N5bmNwdF9nZXQpOwog
Ci0tIAoyLjExLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
