From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v1 07/16] drm/mxsfb: fix opencoded use of drm_panel_*
Date: Mon, 05 Aug 2019 11:20:41 +0200
Message-ID: <a6833b84301dfb5f73a2f4caaf7d482d@agner.ch>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-8-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190804201637.1240-8-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>Sean Paul <s>
List-Id: linux-tegra@vger.kernel.org

T24gMjAxOS0wOC0wNCAyMjoxNiwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IFVzZSB0aGUgZHJtX3Bh
bmVsX2dldF9tb2RlcygpIGZ1bmN0aW9uLgoKTG9va3MgZ29vZCB0byBtZSwKCkFja2VkLWJ5OiBT
dGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KCi0tClN0ZWZhbgoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxt
YXJleEBkZW54LmRlPgo+IENjOiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiBDYzog
U2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgo+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1
ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxA
cGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4K
PiBDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+IENjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL214c2Zi
L214c2ZiX291dC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2Zi
X291dC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfb3V0LmMKPiBpbmRleCAyMzFk
MDE2YzZmNDcuLmJlMzZmNGQ2Y2M5NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhz
ZmIvbXhzZmJfb3V0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfb3V0LmMK
PiBAQCAtMzAsNyArMzAsNyBAQCBzdGF0aWMgaW50IG14c2ZiX3BhbmVsX2dldF9tb2RlcyhzdHJ1
Y3QKPiBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAkJCWRybV9jb25uZWN0b3JfdG9fbXhz
ZmJfZHJtX3ByaXZhdGUoY29ubmVjdG9yKTsKPiAgCj4gIAlpZiAobXhzZmItPnBhbmVsKQo+IC0J
CXJldHVybiBteHNmYi0+cGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMobXhzZmItPnBhbmVsKTsKPiAr
CQlyZXR1cm4gZHJtX3BhbmVsX2dldF9tb2RlcyhteHNmYi0+cGFuZWwpOwo+ICAKPiAgCXJldHVy
biAwOwo+ICB9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
