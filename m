From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v6 13/24] drm: zte: Provide ddc symlink in hdmi connector
 sysfs directory
Date: Fri, 26 Jul 2019 19:23:07 +0200
Message-ID: <93facd1fa05d7a66294537f640b3e452cf1abea2.1564161140.git.andrzej.p@collabora.com>
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
Cc: amd-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS96dGUvenhfaGRtaS5jIHwgNiArKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3p0ZS96eF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0venRlL3p4X2hk
bWkuYwppbmRleCBhNTBmNWExZjA5YjguLmI5OGExNDIwZGNkMyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3p0ZS96eF9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3p0ZS96eF9oZG1p
LmMKQEAgLTMxOSw4ICszMTksMTAgQEAgc3RhdGljIGludCB6eF9oZG1pX3JlZ2lzdGVyKHN0cnVj
dCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCB6eF9oZG1pICpoZG1pKQogCiAJaGRtaS0+Y29ubmVj
dG9yLnBvbGxlZCA9IERSTV9DT05ORUNUT1JfUE9MTF9IUEQ7CiAKLQlkcm1fY29ubmVjdG9yX2lu
aXQoZHJtLCAmaGRtaS0+Y29ubmVjdG9yLCAmenhfaGRtaV9jb25uZWN0b3JfZnVuY3MsCi0JCQkg
ICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpOworCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2Rk
Yyhkcm0sICZoZG1pLT5jb25uZWN0b3IsCisJCQkJICAgICZ6eF9oZG1pX2Nvbm5lY3Rvcl9mdW5j
cywKKwkJCQkgICAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAorCQkJCSAgICAmaGRtaS0+ZGRj
LT5hZGFwKTsKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJmhkbWktPmNvbm5lY3RvciwKIAkJ
CQkgJnp4X2hkbWlfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
