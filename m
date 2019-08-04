From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 03/16] drm/exynos: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:24 +0200
Message-ID: <20190804201637.1240-4-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrab>
List-Id: linux-tegra@vger.kernel.org

Q2FsbCB2aWEgZHJtX3BhbmVsX2dldF9tb2RlcygpLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29t
PgpDYzogSm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgpDYzogU2V1bmct
V29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4KQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5n
bWluLnBhcmtAc2Ftc3VuZy5jb20+CkNjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgpD
YzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgpDYzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5l
bC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKaW5kZXggNjkyNmNlZTkxYjM2Li4zNmIwMmI0
NTZkOWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2ku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKQEAgLTE0NjAs
NyArMTQ2MCw3IEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9nZXRfbW9kZXMoc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZXh5bm9zX2RzaSAqZHNpID0gY29ubmVjdG9y
X3RvX2RzaShjb25uZWN0b3IpOwogCiAJaWYgKGRzaS0+cGFuZWwpCi0JCXJldHVybiBkc2ktPnBh
bmVsLT5mdW5jcy0+Z2V0X21vZGVzKGRzaS0+cGFuZWwpOworCQlyZXR1cm4gZHJtX3BhbmVsX2dl
dF9tb2Rlcyhkc2ktPnBhbmVsKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
