From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/tegra: Use PTR_ERR_OR_ZERO in tegra_gem_create()
Date: Tue, 25 Sep 2018 01:35:51 +0000
Message-ID: <1537839351-104885-1-git-send-email-yuehaibing@huawei.com>
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
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

VXNlIFBUUl9FUlJfT1JfWkVSTyByYXRoZXIgdGhhbiBpZihJU19FUlIoLi4uKSkgKyBQVFJfRVJS
CgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIHwgNSArLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYwppbmRleCBlMjIzNTJj
Li4wNTZmNzQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCkBAIC00OTcsMTAgKzQ5Nyw3IEBAIHN0YXRpYyBp
bnQgdGVncmFfZ2VtX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICpkYXRhLAog
CiAJYm8gPSB0ZWdyYV9ib19jcmVhdGVfd2l0aF9oYW5kbGUoZmlsZSwgZHJtLCBhcmdzLT5zaXpl
LCBhcmdzLT5mbGFncywKIAkJCQkJICZhcmdzLT5oYW5kbGUpOwotCWlmIChJU19FUlIoYm8pKQot
CQlyZXR1cm4gUFRSX0VSUihibyk7Ci0KLQlyZXR1cm4gMDsKKwlyZXR1cm4gUFRSX0VSUl9PUl9a
RVJPKGJvKTsKIH0KIAogc3RhdGljIGludCB0ZWdyYV9nZW1fbW1hcChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtLCB2b2lkICpkYXRhLAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
