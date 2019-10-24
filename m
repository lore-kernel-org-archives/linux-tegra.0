From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 28/32] drm/tegra: sor: Use correct I/O pad for DP
Date: Thu, 24 Oct 2019 18:45:30 +0200
Message-ID: <20191024164534.132764-29-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBjb3JyZWN0IEkv
TyBwYWQgbmVlZHMgdG8gYmUgcG93ZXJlZCB1cCBiZWZvcmUgRFAgY2FuIGJlIHVzZWQuIE1ha2UK
c3VyZSB0aGUgY29ycmVjdCBkZWZhdWx0IGlzIHNldCBmb3IgVGVncmEgZ2VuZXJhdGlvbnMgd2hl
cmUgdGhlIEkvTyBwYWQKY2Fubm90IGJlIGRlcml2ZWQgZnJvbSB0aGUgU09SIGluc3RhbmNlLgoK
U2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBiL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYwppbmRleCBhMjQ1YmJiZDYzOGEuLmJmMmUzMTE5OTE2NiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9zb3IuYwpAQCAtMzkzNCw2ICszOTM0LDcgQEAgc3RhdGljIGludCB0ZWdyYV9z
b3JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJCXNvci0+cGFkID0gVEVH
UkFfSU9fUEFEX0xWRFM7CiAJCX0gZWxzZSBpZiAoc29yLT5zb2MtPnN1cHBvcnRzX2RwKSB7CiAJ
CQlzb3ItPm9wcyA9ICZ0ZWdyYV9zb3JfZHBfb3BzOworCQkJc29yLT5wYWQgPSBURUdSQV9JT19Q
QURfTFZEUzsKIAkJfSBlbHNlIHsKIAkJCWRldl9lcnIoJnBkZXYtPmRldiwgInVua25vd24gKERQ
KSBzdXBwb3J0XG4iKTsKIAkJCXJldHVybiAtRU5PREVWOwotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
