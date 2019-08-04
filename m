From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 06/16] drm/msm: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:27 +0200
Message-ID: <20190804201637.1240-7-sam@ravnborg.org>
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

VXNlIHRoZSBmdW5jdGlvbiBkcm1fcGFuZWxfZ2V0X21vZGVzKCkuCgpTaWduZWQtb2ZmLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBBbGV4aW9zIFphdnJhcyA8YWxleGlv
cy56YXZyYXNAaW50ZWwuY29tPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXgu
ZGU+CkNjOiBBbGxpc29uIFJhbmRhbCA8YWxsaXNvbkBsb2h1dG9rLm5ldD4KQ2M6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEVucmljbyBXZWlnZWx0IDxpbmZvQG1ldHV4Lm5l
dD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNfY29ubmVjdG9y
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNfY29u
bmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNfY29ubmVj
dG9yLmMKaW5kZXggZWNlZjRmNWI5ZjI2Li4wZTIxMjUyZmQxZDYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9tZHA0L21kcDRfbHZkc19jb25uZWN0b3IuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNfY29ubmVjdG9yLmMKQEAgLTU1LDcg
KzU1LDcgQEAgc3RhdGljIGludCBtZHA0X2x2ZHNfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCWlmIChwYW5lbCkgewogCQlkcm1fcGFuZWxfYXR0
YWNoKHBhbmVsLCBjb25uZWN0b3IpOwogCi0JCXJldCA9IHBhbmVsLT5mdW5jcy0+Z2V0X21vZGVz
KHBhbmVsKTsKKwkJcmV0ID0gZHJtX3BhbmVsX2dldF9tb2RlcyhwYW5lbCk7CiAKIAkJZHJtX3Bh
bmVsX2RldGFjaChwYW5lbCk7CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
