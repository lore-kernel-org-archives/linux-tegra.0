From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] drm/tegra: gem: oops in error handling
Date: Fri, 16 Jan 2015 13:43:42 +0300
Message-ID: <20150116104342.GA4860@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

a2ZyZWUoRVJSX1BUUigtRU5PTUVNKSkgd2lsbCBub3Qgd29yayB2ZXJ5IHdlbGwuCgpTaWduZWQt
b2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2dlbS5jCmluZGV4IDg3NzdiN2YuLjI4MjE1ZTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMKQEAgLTI0NCwx
MCArMjQ0LDggQEAgc3RhdGljIGludCB0ZWdyYV9ib19nZXRfcGFnZXMoc3RydWN0IGRybV9kZXZp
Y2UgKmRybSwgc3RydWN0IHRlZ3JhX2JvICpibykKIAlmb3JfZWFjaF9zZyhzZ3QtPnNnbCwgcywg
c2d0LT5uZW50cywgaSkKIAkJc2dfZG1hX2FkZHJlc3MocykgPSBzZ19waHlzKHMpOwogCi0JaWYg
KGRtYV9tYXBfc2coZHJtLT5kZXYsIHNndC0+c2dsLCBzZ3QtPm5lbnRzLCBETUFfVE9fREVWSUNF
KSA9PSAwKSB7Ci0JCXNndCA9IEVSUl9QVFIoLUVOT01FTSk7CisJaWYgKGRtYV9tYXBfc2coZHJt
LT5kZXYsIHNndC0+c2dsLCBzZ3QtPm5lbnRzLCBETUFfVE9fREVWSUNFKSA9PSAwKQogCQlnb3Rv
IHJlbGVhc2Vfc2d0OwotCX0KIAogCWJvLT5zZ3QgPSBzZ3Q7CiAKQEAgLTI1Niw2ICsyNTQsNyBA
QCBzdGF0aWMgaW50IHRlZ3JhX2JvX2dldF9wYWdlcyhzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBz
dHJ1Y3QgdGVncmFfYm8gKmJvKQogcmVsZWFzZV9zZ3Q6CiAJc2dfZnJlZV90YWJsZShzZ3QpOwog
CWtmcmVlKHNndCk7CisJc2d0ID0gRVJSX1BUUigtRU5PTUVNKTsKIHB1dF9wYWdlczoKIAlkcm1f
Z2VtX3B1dF9wYWdlcygmYm8tPmdlbSwgYm8tPnBhZ2VzLCBmYWxzZSwgZmFsc2UpOwogCXJldHVy
biBQVFJfRVJSKHNndCk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
