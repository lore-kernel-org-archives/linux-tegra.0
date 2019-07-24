From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v5 18/24] drm/ast: Provide ddc symlink in connector sysfs
 directory
Date: Wed, 24 Jul 2019 15:59:40 +0200
Message-ID: <0afab6e2f61907409ba13a0ba91b8ee701eb7d74.1563960855.git.andrzej.p@collabora.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org, Jyri Sarha <js>
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDEzICsrKysrKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfbW9kZS5jCmluZGV4IGM3OTIzNjIwMjRhNS4uMWM4OTlhNmU4N2I3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfbW9kZS5jCkBAIC04NjcsNyArODY3LDE0IEBAIHN0YXRpYyBpbnQgYXN0X2Nvbm5l
Y3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJCXJldHVybiAtRU5PTUVNOwogCiAJ
Y29ubmVjdG9yID0gJmFzdF9jb25uZWN0b3ItPmJhc2U7Ci0JZHJtX2Nvbm5lY3Rvcl9pbml0KGRl
diwgY29ubmVjdG9yLCAmYXN0X2Nvbm5lY3Rvcl9mdW5jcywgRFJNX01PREVfQ09OTkVDVE9SX1ZH
QSk7CisJYXN0X2Nvbm5lY3Rvci0+aTJjID0gYXN0X2kyY19jcmVhdGUoZGV2KTsKKwlpZiAoIWFz
dF9jb25uZWN0b3ItPmkyYykKKwkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gYWRkIGRkYyBidXMgZm9y
IGNvbm5lY3RvclxuIik7CisKKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZGV2LCBjb25u
ZWN0b3IsCisJCQkJICAgICZhc3RfY29ubmVjdG9yX2Z1bmNzLAorCQkJCSAgICBEUk1fTU9ERV9D
T05ORUNUT1JfVkdBLAorCQkJCSAgICAmYXN0X2Nvbm5lY3Rvci0+aTJjLT5hZGFwdGVyKTsKIAog
CWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsICZhc3RfY29ubmVjdG9yX2hlbHBl
cl9mdW5jcyk7CiAKQEAgLTg4MSwxMCArODg4LDYgQEAgc3RhdGljIGludCBhc3RfY29ubmVjdG9y
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAllbmNvZGVyID0gbGlzdF9maXJzdF9lbnRy
eSgmZGV2LT5tb2RlX2NvbmZpZy5lbmNvZGVyX2xpc3QsIHN0cnVjdCBkcm1fZW5jb2RlciwgaGVh
ZCk7CiAJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIpOwog
Ci0JYXN0X2Nvbm5lY3Rvci0+aTJjID0gYXN0X2kyY19jcmVhdGUoZGV2KTsKLQlpZiAoIWFzdF9j
b25uZWN0b3ItPmkyYykKLQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gYWRkIGRkYyBidXMgZm9yIGNv
bm5lY3RvclxuIik7Ci0KIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
