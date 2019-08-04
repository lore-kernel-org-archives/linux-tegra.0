From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 01/16] drm/bridge: tc358767: fix opencoded use of
 drm_panel_*
Date: Sun,  4 Aug 2019 22:16:22 +0200
Message-ID: <20190804201637.1240-2-sam@ravnborg.org>
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

UmVwbGFjZSBvcGVuIGNvZGVkIHZlcnNpb24gd2l0aCBjYWxsIHRvIGRybV9wYW5lbF9nZXRfbW9k
ZXMoKS4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBOZWlsIEFybXN0cm9uZyA8
bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28u
c2U+CkNjOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgMTAgKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rj
MzU4NzY3LmMKaW5kZXggNDJmMDNhOTg1YWMwLi5jZWJjOGU2MjA4MjAgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMKQEAgLTEzMTIsNyArMTMxMiw3IEBAIHN0YXRpYyBpbnQgdGNfY29ubmVj
dG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVj
dCB0Y19kYXRhICp0YyA9IGNvbm5lY3Rvcl90b190Yyhjb25uZWN0b3IpOwogCXN0cnVjdCBlZGlk
ICplZGlkOwotCXVuc2lnbmVkIGludCBjb3VudDsKKwlpbnQgY291bnQ7CiAJaW50IHJldDsKIAog
CXJldCA9IHRjX2dldF9kaXNwbGF5X3Byb3BzKHRjKTsKQEAgLTEzMjEsMTEgKzEzMjEsOSBAQCBz
dGF0aWMgaW50IHRjX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikKIAkJcmV0dXJuIDA7CiAJfQogCi0JaWYgKHRjLT5wYW5lbCAmJiB0Yy0+cGFuZWwt
PmZ1bmNzICYmIHRjLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2RlcykgewotCQljb3VudCA9IHRjLT5w
YW5lbC0+ZnVuY3MtPmdldF9tb2Rlcyh0Yy0+cGFuZWwpOwotCQlpZiAoY291bnQgPiAwKQotCQkJ
cmV0dXJuIGNvdW50OwotCX0KKwljb3VudCA9IGRybV9wYW5lbF9nZXRfbW9kZXModGMtPnBhbmVs
KTsKKwlpZiAoY291bnQgPiAwKQorCQlyZXR1cm4gY291bnQ7CiAKIAllZGlkID0gZHJtX2dldF9l
ZGlkKGNvbm5lY3RvciwgJnRjLT5hdXguZGRjKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
