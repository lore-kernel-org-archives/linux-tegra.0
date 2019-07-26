From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v6 08/24] drm/mediatek: Provide ddc symlink in hdmi connector
 sysfs directory
Date: Fri, 26 Jul 2019 19:23:02 +0200
Message-ID: <5fda698fc3c352efac47de9140e793f5a947156c.1564161140.git.andrzej.p@collabora.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Alexios Zavras <alexios.zavras@intel.com>, Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.in
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgNyArKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pLmMKaW5kZXggY2U5MWI2MTM2NGViLi5mNDE5NzY1YjdjYzAg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCkBAIC0xMjk5LDkgKzEyOTksMTAgQEAg
c3RhdGljIGludCBtdGtfaGRtaV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlk
Z2UpCiAJc3RydWN0IG10a19oZG1pICpoZG1pID0gaGRtaV9jdHhfZnJvbV9icmlkZ2UoYnJpZGdl
KTsKIAlpbnQgcmV0OwogCi0JcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGJyaWRnZS0+ZW5jb2Rl
ci0+ZGV2LCAmaGRtaS0+Y29ubiwKLQkJCQkgJm10a19oZG1pX2Nvbm5lY3Rvcl9mdW5jcywKLQkJ
CQkgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBKTsKKwlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXRf
d2l0aF9kZGMoYnJpZGdlLT5lbmNvZGVyLT5kZXYsICZoZG1pLT5jb25uLAorCQkJCQkgICZtdGtf
aGRtaV9jb25uZWN0b3JfZnVuY3MsCisJCQkJCSAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAor
CQkJCQkgIGhkbWktPmRkY19hZHB0KTsKIAlpZiAocmV0KSB7CiAJCWRldl9lcnIoaGRtaS0+ZGV2
LCAiRmFpbGVkIHRvIGluaXRpYWxpemUgY29ubmVjdG9yOiAlZFxuIiwgcmV0KTsKIAkJcmV0dXJu
IHJldDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
