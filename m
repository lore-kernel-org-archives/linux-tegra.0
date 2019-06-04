From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpu: host1x: Do not output error message for deferred probe
Date: Tue,  4 Jun 2019 17:31:50 +0200
Message-ID: <20190604153150.22265-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gZGVmZXJyaW5n
IHByb2JlLCBhdm9pZCBsb2dnaW5nIGEgY29uZnVzaW5nIGVycm9yIG1lc3NhZ2UuIFdoaWxlIGF0
Cml0LCBtYWtlIHRoZSBlcnJvciBtZXNzYWdlIG1vcmUgaW5mb3JtYXRpb25hbC4KClNpZ25lZC1v
ZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvaG9zdDF4L2Rldi5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYyBi
L2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYwppbmRleCBjNTVlMmQ2MzQ4ODcuLjVhM2Y3OTcyNDBk
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2hvc3QxeC9kZXYuYwpAQCAtMjQ3LDggKzI0NywxMSBAQCBzdGF0aWMgaW50IGhvc3QxeF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJaG9zdC0+Y2xrID0gZGV2bV9jbGtf
Z2V0KCZwZGV2LT5kZXYsIE5VTEwpOwogCWlmIChJU19FUlIoaG9zdC0+Y2xrKSkgewotCQlkZXZf
ZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0IGNsb2NrXG4iKTsKIAkJZXJyID0gUFRSX0VS
Uihob3N0LT5jbGspOworCisJCWlmIChlcnIgIT0gLUVQUk9CRV9ERUZFUikKKwkJCWRldl9lcnIo
JnBkZXYtPmRldiwgImZhaWxlZCB0byBnZXQgY2xvY2s6ICVkXG4iLCBlcnIpOworCiAJCXJldHVy
biBlcnI7CiAJfQogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
