From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 09/16] drm/tegra: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:30 +0200
Message-ID: <20190804201637.1240-10-sam@ravnborg.org>
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

VXNlIHRoZSBkcm1fcGFuZWxfZ2V0X21vZGVzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbT4KQ2M6IEpvbmF0aGFuIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5j
b20+CkNjOiBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvb3V0cHV0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKaW5kZXggMjc0Y2I5NTVlMmUxLi41MmI4
Mzk2ZWMyZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKQEAgLTIzLDcgKzIzLDcgQEAgaW50IHRl
Z3JhX291dHB1dF9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCiAJICogaWdub3JlIGFueSBvdGhlciBtZWFucyBvZiBvYnRhaW5pbmcgYSBtb2RlLgog
CSAqLwogCWlmIChvdXRwdXQtPnBhbmVsKSB7Ci0JCWVyciA9IG91dHB1dC0+cGFuZWwtPmZ1bmNz
LT5nZXRfbW9kZXMob3V0cHV0LT5wYW5lbCk7CisJCWVyciA9IGRybV9wYW5lbF9nZXRfbW9kZXMo
b3V0cHV0LT5wYW5lbCk7CiAJCWlmIChlcnIgPiAwKQogCQkJcmV0dXJuIGVycjsKIAl9Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
