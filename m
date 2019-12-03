From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 9/9] drm/tegra: Run hub cleanup on ->remove()
Date: Tue,  3 Dec 2019 17:19:14 +0100
Message-ID: <20191203161914.1312555-9-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBjYWxsIHRvIHRl
Z3JhX2Rpc3BsYXlfaHViX2NsZWFudXAoKSB0aGF0IHRha2VzIGNhcmUgb2YgZGlzYWJsaW5nIHRo
ZQp3aW5kb3cgZ3JvdXBzIGlzIG1pc3NpbmcgZnJvbSB0aGUgZHJpdmVyJ3MgLT5yZW1vdmUoKSBj
YWxsYmFjay4gQ2FsbCBpdAp0byBtYWtlIHN1cmUgdGhlIHJ1bnRpbWUgUE0gcmVmZXJlbmNlIGNv
dW50cyBmb3IgdGhlIGRpc3BsYXkgY29udHJvbGxlcnMKYXJlIGJhbGFuY2VkLgoKU2lnbmVkLW9m
Zi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdGVncmEvZHJtLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kcm0uYwppbmRleCA3YTE2YjUxZWFhMmQuLmY0NTVjZTcxZTg1ZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kcm0uYwpAQCAtMTI0MSw2ICsxMjQxLDkgQEAgc3RhdGljIGludCBob3N0MXhfZHJtX3Jl
bW92ZShzdHJ1Y3QgaG9zdDF4X2RldmljZSAqZGV2KQogCWRybV9hdG9taWNfaGVscGVyX3NodXRk
b3duKGRybSk7CiAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKIAorCWlmICh0ZWdyYS0+
aHViKQorCQl0ZWdyYV9kaXNwbGF5X2h1Yl9jbGVhbnVwKHRlZ3JhLT5odWIpOworCiAJZXJyID0g
aG9zdDF4X2RldmljZV9leGl0KGRldik7CiAJaWYgKGVyciA8IDApCiAJCWRldl9lcnIoJmRldi0+
ZGV2LCAiaG9zdDF4IGRldmljZSBjbGVhbnVwIGZhaWxlZDogJWRcbiIsIGVycik7Ci0tIAoyLjIz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
