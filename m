From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 18/21] drm/tegra: Use drm_fb_helper_fill_info
Date: Tue, 26 Mar 2019 14:20:05 +0100
Message-ID: <20190326132008.11781-18-daniel.vetter@ffwll.ch>
References: <20190326132008.11781-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190326132008.11781-1-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

QW5vdGhlciBkcml2ZXIgdGhhdCBkaWRuJ3Qgc2V0IGZiaW5mby0+Zml4LmlkIGJlZm9yZS4KCnYy
OiBGaXggc3ViamVjdCBhbmQgcmViYXNlCgpBY2tlZC1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRp
bmdAbnZpZGlhLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29t
PgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KQ2M6IGxpbnV4LXRl
Z3JhQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYi5jIHwgNCAr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2ZiLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZmIuYwppbmRleCAwYTRjZTA1ZTAwYWIuLjFkZDgzYTc1N2RiYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL2ZiLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2ZiLmMK
QEAgLTI1NSwxMSArMjU1LDkgQEAgc3RhdGljIGludCB0ZWdyYV9mYmRldl9wcm9iZShzdHJ1Y3Qg
ZHJtX2ZiX2hlbHBlciAqaGVscGVyLAogCWhlbHBlci0+ZmIgPSBmYjsKIAloZWxwZXItPmZiZGV2
ID0gaW5mbzsKIAotCWluZm8tPnBhciA9IGhlbHBlcjsKIAlpbmZvLT5mYm9wcyA9ICZ0ZWdyYV9m
Yl9vcHM7CiAKLQlkcm1fZmJfaGVscGVyX2ZpbGxfZml4KGluZm8sIGZiLT5waXRjaGVzWzBdLCBm
Yi0+Zm9ybWF0LT5kZXB0aCk7Ci0JZHJtX2ZiX2hlbHBlcl9maWxsX3ZhcihpbmZvLCBoZWxwZXIs
IGZiLT53aWR0aCwgZmItPmhlaWdodCk7CisJZHJtX2ZiX2hlbHBlcl9maWxsX2luZm8oaW5mbywg
aGVscGVyLCBzaXplcyk7CiAKIAlvZmZzZXQgPSBpbmZvLT52YXIueG9mZnNldCAqIGJ5dGVzX3Bl
cl9waXhlbCArCiAJCSBpbmZvLT52YXIueW9mZnNldCAqIGZiLT5waXRjaGVzWzBdOwotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
