From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v5 08/24] drm/mediatek: Provide ddc symlink in hdmi connector
 sysfs directory
Date: Wed, 24 Jul 2019 15:59:30 +0200
Message-ID: <5dbf162d824f9b6909b2a203aa050ccab05ae155.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Armijn Hemel <armijn@tjaldur.nl>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@l
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMTYgKysrKysr
KystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCmluZGV4IGNlOTFiNjEzNjRlYi4uY2M0
YWI4YjA3MGE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwpAQCAtMTUwLDcgKzE1
MCw2IEBAIHN0cnVjdCBtdGtfaGRtaSB7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVjdCBw
aHkgKnBoeTsKIAlzdHJ1Y3QgZGV2aWNlICpjZWNfZGV2OwotCXN0cnVjdCBpMmNfYWRhcHRlciAq
ZGRjX2FkcHQ7CiAJc3RydWN0IGNsayAqY2xrW01US19IRE1JX0NMS19DT1VOVF07CiAJc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgbW9kZTsKIAlib29sIGR2aV9tb2RlOwpAQCAtMTIxNywxMCArMTIx
NiwxMCBAQCBzdGF0aWMgaW50IG10a19oZG1pX2Nvbm5fZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uKQogCXN0cnVjdCBlZGlkICplZGlkOwogCWludCByZXQ7CiAKLQlpZiAoIWhk
bWktPmRkY19hZHB0KQorCWlmICghY29ubi0+ZGRjKQogCQlyZXR1cm4gLUVOT0RFVjsKIAotCWVk
aWQgPSBkcm1fZ2V0X2VkaWQoY29ubiwgaGRtaS0+ZGRjX2FkcHQpOworCWVkaWQgPSBkcm1fZ2V0
X2VkaWQoY29ubiwgY29ubi0+ZGRjKTsKIAlpZiAoIWVkaWQpCiAJCXJldHVybiAtRU5PREVWOwog
CkBAIC0xMjk5LDkgKzEyOTgsMTAgQEAgc3RhdGljIGludCBtdGtfaGRtaV9icmlkZ2VfYXR0YWNo
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJc3RydWN0IG10a19oZG1pICpoZG1pID0gaGRt
aV9jdHhfZnJvbV9icmlkZ2UoYnJpZGdlKTsKIAlpbnQgcmV0OwogCi0JcmV0ID0gZHJtX2Nvbm5l
Y3Rvcl9pbml0KGJyaWRnZS0+ZW5jb2Rlci0+ZGV2LCAmaGRtaS0+Y29ubiwKLQkJCQkgJm10a19o
ZG1pX2Nvbm5lY3Rvcl9mdW5jcywKLQkJCQkgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBKTsKKwly
ZXQgPSBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoYnJpZGdlLT5lbmNvZGVyLT5kZXYsICZo
ZG1pLT5jb25uLAorCQkJCQkgICZtdGtfaGRtaV9jb25uZWN0b3JfZnVuY3MsCisJCQkJCSAgRFJN
X01PREVfQ09OTkVDVE9SX0hETUlBLAorCQkJCQkgIGhkbWktPmNvbm4uZGRjKTsKIAlpZiAocmV0
KSB7CiAJCWRldl9lcnIoaGRtaS0+ZGV2LCAiRmFpbGVkIHRvIGluaXRpYWxpemUgY29ubmVjdG9y
OiAlZFxuIiwgcmV0KTsKIAkJcmV0dXJuIHJldDsKQEAgLTE1MTMsOSArMTUxMyw5IEBAIHN0YXRp
YyBpbnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10a19oZG1pICpoZG1pLAogCX0K
IAlvZl9ub2RlX3B1dChyZW1vdGUpOwogCi0JaGRtaS0+ZGRjX2FkcHQgPSBvZl9maW5kX2kyY19h
ZGFwdGVyX2J5X25vZGUoaTJjX25wKTsKKwloZG1pLT5jb25uLmRkYyA9IG9mX2ZpbmRfaTJjX2Fk
YXB0ZXJfYnlfbm9kZShpMmNfbnApOwogCW9mX25vZGVfcHV0KGkyY19ucCk7Ci0JaWYgKCFoZG1p
LT5kZGNfYWRwdCkgeworCWlmICghaGRtaS0+Y29ubi5kZGMpIHsKIAkJZGV2X2VycihkZXYsICJG
YWlsZWQgdG8gZ2V0IGRkYyBpMmMgYWRhcHRlciBieSBub2RlXG4iKTsKIAkJcmV0dXJuIC1FSU5W
QUw7CiAJfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
