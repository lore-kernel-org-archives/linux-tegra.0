From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 07/16] drm/mxsfb: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:28 +0200
Message-ID: <20190804201637.1240-8-sam@ravnborg.org>
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

VXNlIHRoZSBkcm1fcGFuZWxfZ2V0X21vZGVzKCkgZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4KQ2M6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgpDYzogU2hhd24gR3VvIDxz
aGF3bmd1b0BrZXJuZWwub3JnPgpDYzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4
LmRlPgpDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4K
Q2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KQ2M6IE5YUCBMaW51eCBUZWFt
IDxsaW51eC1pbXhAbnhwLmNvbT4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9vdXQuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9vdXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9t
eHNmYl9vdXQuYwppbmRleCAyMzFkMDE2YzZmNDcuLmJlMzZmNGQ2Y2M5NiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX291dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
eHNmYi9teHNmYl9vdXQuYwpAQCAtMzAsNyArMzAsNyBAQCBzdGF0aWMgaW50IG14c2ZiX3BhbmVs
X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCQkJZHJtX2Nvbm5l
Y3Rvcl90b19teHNmYl9kcm1fcHJpdmF0ZShjb25uZWN0b3IpOwogCiAJaWYgKG14c2ZiLT5wYW5l
bCkKLQkJcmV0dXJuIG14c2ZiLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2RlcyhteHNmYi0+cGFuZWwp
OworCQlyZXR1cm4gZHJtX3BhbmVsX2dldF9tb2RlcyhteHNmYi0+cGFuZWwpOwogCiAJcmV0dXJu
IDA7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
