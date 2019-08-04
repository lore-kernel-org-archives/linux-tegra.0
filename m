From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 08/16] drm/sti: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:29 +0200
Message-ID: <20190804201637.1240-9-sam@ravnborg.org>
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

VXNlIHRoZSBkcm1fcGFuZWxfKGVuYWJsZXxkaXNhYmxlfGdldF9tb2RlcykgZnVuY3Rpb25zLgoK
U2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogQmVuamFt
aW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+CkNjOiBWaW5jZW50IEFi
cmlvdSA8dmluY2VudC5hYnJpb3VAc3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3Rp
X2R2by5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8uYyBi
L2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jCmluZGV4IDllNmQ1ZDhiNzAzMC4uZTU1ODcw
MTkwYmY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8uYwpAQCAtMjIxLDggKzIyMSw3IEBAIHN0YXRpYyB2
b2lkIHN0aV9kdm9fZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCiAJd3JpdGVs
KDB4MDAwMDAwMDAsIGR2by0+cmVncyArIERWT19ET0ZfQ0ZHKTsKIAotCWlmIChkdm8tPnBhbmVs
KQotCQlkdm8tPnBhbmVsLT5mdW5jcy0+ZGlzYWJsZShkdm8tPnBhbmVsKTsKKwlkcm1fcGFuZWxf
ZGlzYWJsZShkdm8tPnBhbmVsKTsKIAogCS8qIERpc2FibGUvdW5wcmVwYXJlIGR2byBjbG9jayAq
LwogCWNsa19kaXNhYmxlX3VucHJlcGFyZShkdm8tPmNsa19waXgpOwpAQCAtMjYyLDggKzI2MSw3
IEBAIHN0YXRpYyB2b2lkIHN0aV9kdm9fcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlKQogCWlmIChjbGtfcHJlcGFyZV9lbmFibGUoZHZvLT5jbGspKQogCQlEUk1fRVJST1IoIkZh
aWxlZCB0byBwcmVwYXJlL2VuYWJsZSBkdm8gY2xrXG4iKTsKIAotCWlmIChkdm8tPnBhbmVsKQot
CQlkdm8tPnBhbmVsLT5mdW5jcy0+ZW5hYmxlKGR2by0+cGFuZWwpOworCWRybV9wYW5lbF9lbmFi
bGUoZHZvLT5wYW5lbCk7CiAKIAkvKiBTZXQgTFVUICovCiAJd3JpdGVsKGNvbmZpZy0+bG93Ynl0
ZSwgIGR2by0+cmVncyArIERWT19MVVRfUFJPR19MT1cpOwpAQCAtMzQwLDcgKzMzOCw3IEBAIHN0
YXRpYyBpbnQgc3RpX2R2b19jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCiAJc3RydWN0IHN0aV9kdm8gKmR2byA9IGR2b19jb25uZWN0b3ItPmR2bzsK
IAogCWlmIChkdm8tPnBhbmVsKQotCQlyZXR1cm4gZHZvLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2Rl
cyhkdm8tPnBhbmVsKTsKKwkJcmV0dXJuIGRybV9wYW5lbF9nZXRfbW9kZXMoZHZvLT5wYW5lbCk7
CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
