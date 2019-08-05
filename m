From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v1 04/16] drm/imx: fix opencoded use of drm_panel_*
Date: Mon, 05 Aug 2019 11:34:24 +0200
Message-ID: <1564997664.3056.11.camel@pengutronix.de>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-5-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190804201637.1240-5-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>, Seung-Woo Kim <sw0312.kim>
List-Id: linux-tegra@vger.kernel.org

T24gU3VuLCAyMDE5LTA4LTA0IGF0IDIyOjE2ICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4g
VXNlIHRoZSBkcm1fcGFuZWxfZ2V0X21vZGVzKCkgZnVuY3Rpb24gdG8gZ2V0IHRoZSBtb2Rlcy4K
PiAKPiBUaGlzIHBhdGNoIGxlYXZlIG9uZSB0ZXN0IGZvciB0aGUgZnVuY3Rpb24gcG9pbnRlcjoK
PiAgICAgcGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMKPiAKPiBUaGlzIGlzIHVzZWQgdG8gY2hlY2sg
aWYgdGhlIHBhbmVsIG1heSBoYXZlIGFueSBtb2Rlcy4KPiBUaGVyZSBpcyBubyBkaXJlY3QgcmVw
bGFjZW1lbnQuCj4gV2UgbWF5IGJlIGFibGUgdG8ganVzdCBjaGVjayB0aGF0IGRybV9wYW5lbF9n
ZXRfbW9kZXMoKSByZXR1cm4gPiAwLAo+IGJ1dCBhcyB0aGlzIGlzIG5vdCB0aGUgc2FtZSBmdW5j
dGlvbmFsaXR5IGl0IGlzIGxlZnQgZm9yIGxhdGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBl
bmd1dHJvbml4LmRlPgo+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+
Cj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+Cj4g
Q2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiBDYzogTlhQIExpbnV4IFRl
YW0gPGxpbnV4LWlteEBueHAuY29tPgo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKCkFja2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
PgoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
