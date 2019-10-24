From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 01/32] drm/tegra: Add missing kerneldoc for struct drm_dp_link
Date: Thu, 24 Oct 2019 18:45:03 +0200
Message-ID: <20191024164534.132764-2-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBkcm1fZHBfbGlu
ayBzdHJ1Y3R1cmUgdHJhY2tzIGNhcGFiaWxpdGllcyBvbiB0aGUgRFAgbGluay4gQWRkIHNvbWUK
a2VybmVsZG9jIHRvIGV4cGxhaW4gd2hhdCBlYWNoIG9mIGl0cyBmaWVsZHMgbWVhbnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9kcC5oIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmggYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZHAuaAppbmRleCA4ODg0MmZkMjVhYmYuLjFjZjI1MmU3MzA5YSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2RwLmgKQEAgLTExLDYgKzExLDEzIEBAIHN0cnVjdCBkcm1fZHBfYXV4OwogCiAj
ZGVmaW5lIERQX0xJTktfQ0FQX0VOSEFOQ0VEX0ZSQU1JTkcgKDEgPDwgMCkKIAorLyoqCisgKiBz
dHJ1Y3QgZHJtX2RwX2xpbmsgLSBEUCBsaW5rIGNhcGFiaWxpdGllcworICogQHJldmlzaW9uOiBE
UCBzcGVjaWZpY2F0aW9uIHJldmlzaW9uIHN1cHBvcnRlZCBvbiB0aGUgbGluaworICogQHJhdGU6
IG1heGltdW0gY2xvY2sgcmF0ZSBzdXBwb3J0ZWQgb24gdGhlIGxpbmsKKyAqIEBudW1fbGFuZXM6
IG1heGltdW0gbnVtYmVyIG9mIGxhbmVzIHN1cHBvcnRlZCBvbiB0aGUgbGluaworICogQGNhcGFi
aWxpdGllczogYml0bWFzayBvZiBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkIG9uIHRoZSBsaW5rCisg
Ki8KIHN0cnVjdCBkcm1fZHBfbGluayB7CiAJdW5zaWduZWQgY2hhciByZXZpc2lvbjsKIAl1bnNp
Z25lZCBpbnQgcmF0ZTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
