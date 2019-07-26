From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v6 06/24] drm/msm/hdmi: Provide ddc symlink in hdmi connector
 sysfs directory
Date: Fri, 26 Jul 2019 19:23:00 +0200
Message-ID: <e745e470255a39adebdfffcacbecd0c9198417f5.1564161140.git.andrzej.p@collabora.com>
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
Cc: amd-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Alexios Zavras <alexios.zavras@intel.com>
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pX2Nvbm5lY3Rvci5jIHwgNiAr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWlfY29ubmVjdG9yLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaV9jb25uZWN0b3IuYwppbmRleCAwN2I0Y2I4Nzdk
ODIuLjFmMDMyNjJiOGE1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hk
bWlfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWlfY29ubmVj
dG9yLmMKQEAgLTQ1MCw4ICs0NTAsMTAgQEAgc3RydWN0IGRybV9jb25uZWN0b3IgKm1zbV9oZG1p
X2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBoZG1pICpoZG1pKQogCiAJY29ubmVjdG9yID0gJmhkbWlf
Y29ubmVjdG9yLT5iYXNlOwogCi0JZHJtX2Nvbm5lY3Rvcl9pbml0KGhkbWktPmRldiwgY29ubmVj
dG9yLCAmaGRtaV9jb25uZWN0b3JfZnVuY3MsCi0JCQlEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEp
OworCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhoZG1pLT5kZXYsIGNvbm5lY3RvciwKKwkJ
CQkgICAgJmhkbWlfY29ubmVjdG9yX2Z1bmNzLAorCQkJCSAgICBEUk1fTU9ERV9DT05ORUNUT1Jf
SERNSUEsCisJCQkJICAgIGhkbWktPmkyYyk7CiAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNv
bm5lY3RvciwgJm1zbV9oZG1pX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCiAJY29ubmVjdG9y
LT5wb2xsZWQgPSBEUk1fQ09OTkVDVE9SX1BPTExfQ09OTkVDVCB8Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
