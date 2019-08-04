From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 02/16] drm/exynos: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:23 +0200
Message-ID: <20190804201637.1240-3-sam@ravnborg.org>
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

ZHJtX3BhbmVsX2F0dGFjaCgpIHdpbGwgY2hlY2sgaWYgdGhlcmUgaXMgYSBjb250cm9sbGVyCmFs
cmVhZHkgYXR0YWNoZWQgLSBkcm9wIHRoZSBjaGVjayBpbiB0aGUgZHJpdmVyLgoKVXNlIGRybV9w
YW5lbF9nZXRfbW9kZXMoKSBzbyB0aGUgZHJpdmVyIG5vIGxvbmdlciB1c2VzIHRoZSBmdW5jdGlv
bgpwb2ludGVyLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgpDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgpDYzogSm9vbnlvdW5nIFNoaW0g
PGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgpDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBz
YW1zdW5nLmNvbT4KQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+
CkNjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgpDYzogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPgpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHBpLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2RwaS5jCmluZGV4IDNjZWJiMTllYzFjNC4uNTQ3OWZmNzFjYmM2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHBpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RwaS5jCkBAIC00Myw3ICs0Myw3IEBAIGV4eW5vc19k
cGlfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCiB7
CiAJc3RydWN0IGV4eW5vc19kcGkgKmN0eCA9IGNvbm5lY3Rvcl90b19kcGkoY29ubmVjdG9yKTsK
IAotCWlmIChjdHgtPnBhbmVsICYmICFjdHgtPnBhbmVsLT5jb25uZWN0b3IpCisJaWYgKGN0eC0+
cGFuZWwpCiAJCWRybV9wYW5lbF9hdHRhY2goY3R4LT5wYW5lbCwgJmN0eC0+Y29ubmVjdG9yKTsK
IAogCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZDsKQEAgLTg1LDcgKzg1LDcgQEAg
c3RhdGljIGludCBleHlub3NfZHBpX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQogCX0KIAogCWlmIChjdHgtPnBhbmVsKQotCQlyZXR1cm4gY3R4LT5wYW5lbC0+ZnVu
Y3MtPmdldF9tb2RlcyhjdHgtPnBhbmVsKTsKKwkJcmV0dXJuIGRybV9wYW5lbF9nZXRfbW9kZXMo
Y3R4LT5wYW5lbCk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
