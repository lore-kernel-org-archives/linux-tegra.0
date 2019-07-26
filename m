From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v6 19/24] drm/bridge: dumb-vga-dac: Provide ddc symlink in
 connector sysfs directory
Date: Fri, 26 Jul 2019 19:23:13 +0200
Message-ID: <ebb75e71b8b7c8d65d54a947a03fd21b8969fb3a.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org, Maxime Ripard <mripard@kernel.>
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMgfCA2ICsrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwppbmRleCBkMzI4ODViOTA2YWUuLjhlZjY1Mzlh
ZTc4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jCkBAIC0xMTEsOCArMTEx
LDEwIEBAIHN0YXRpYyBpbnQgZHVtYl92Z2FfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlk
Z2UpCiAKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnZnYS0+Y29ubmVjdG9yLAogCQkJCSAm
ZHVtYl92Z2FfY29uX2hlbHBlcl9mdW5jcyk7Ci0JcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGJy
aWRnZS0+ZGV2LCAmdmdhLT5jb25uZWN0b3IsCi0JCQkJICZkdW1iX3ZnYV9jb25fZnVuY3MsIERS
TV9NT0RFX0NPTk5FQ1RPUl9WR0EpOworCXJldCA9IGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2Rk
YyhicmlkZ2UtPmRldiwgJnZnYS0+Y29ubmVjdG9yLAorCQkJCQkgICZkdW1iX3ZnYV9jb25fZnVu
Y3MsCisJCQkJCSAgRFJNX01PREVfQ09OTkVDVE9SX1ZHQSwKKwkJCQkJICB2Z2EtPmRkYyk7CiAJ
aWYgKHJldCkgewogCQlEUk1fRVJST1IoIkZhaWxlZCB0byBpbml0aWFsaXplIGNvbm5lY3Rvclxu
Iik7CiAJCXJldHVybiByZXQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
