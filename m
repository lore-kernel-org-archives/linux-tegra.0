From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v1 01/16] drm/bridge: tc358767: fix opencoded use of
 drm_panel_*
Date: Mon, 05 Aug 2019 11:35:56 +0200
Message-ID: <1564997756.3056.13.camel@pengutronix.de>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-2-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190804201637.1240-2-sam@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jerne>
List-Id: linux-tegra@vger.kernel.org

T24gU3VuLCAyMDE5LTA4LTA0IGF0IDIyOjE2ICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4g
UmVwbGFjZSBvcGVuIGNvZGVkIHZlcnNpb24gd2l0aCBjYWxsIHRvIGRybV9wYW5lbF9nZXRfbW9k
ZXMoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
Cj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gQ2M6IE5laWwgQXJt
c3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8
TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBKb25hcyBLYXJsbWFuIDxq
b25hc0Brd2lib28uc2U+Cj4gQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9s
Lm5ldD4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgMTAgKysr
Ky0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiBpbmRleCA0MmYwM2E5ODVhYzAuLmNl
YmM4ZTYyMDgyMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiBAQCAtMTMxMiw3
ICsxMzEyLDcgQEAgc3RhdGljIGludCB0Y19jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpCj4gIHsKPiAgCXN0cnVjdCB0Y19kYXRhICp0YyA9IGNvbm5l
Y3Rvcl90b190Yyhjb25uZWN0b3IpOwo+ICAJc3RydWN0IGVkaWQgKmVkaWQ7Cj4gLQl1bnNpZ25l
ZCBpbnQgY291bnQ7Cj4gKwlpbnQgY291bnQ7CgpUaGlzIGxvb2tzIGxpa2UgaXQgYWxzbyBmaXhl
cyBhIHBvdGVudGlhbCBidWcgLi4uCgo+ICAJaW50IHJldDsKPiAgCj4gIAlyZXQgPSB0Y19nZXRf
ZGlzcGxheV9wcm9wcyh0Yyk7Cj4gQEAgLTEzMjEsMTEgKzEzMjEsOSBAQCBzdGF0aWMgaW50IHRj
X2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAg
CQlyZXR1cm4gMDsKPiAgCX0KPiAgCj4gLQlpZiAodGMtPnBhbmVsICYmIHRjLT5wYW5lbC0+ZnVu
Y3MgJiYgdGMtPnBhbmVsLT5mdW5jcy0+Z2V0X21vZGVzKSB7Cj4gLQkJY291bnQgPSB0Yy0+cGFu
ZWwtPmZ1bmNzLT5nZXRfbW9kZXModGMtPnBhbmVsKTsKPiAtCQlpZiAoY291bnQgPiAwKQoKLi4u
IHdoZW4gLmdldF9tb2RlcyByZXR1cm5zIGEgbmVnYXRpdmUgdmFsdWUuCgo+IC0JCQlyZXR1cm4g
Y291bnQ7Cj4gLQl9Cj4gKwljb3VudCA9IGRybV9wYW5lbF9nZXRfbW9kZXModGMtPnBhbmVsKTsK
PiArCWlmIChjb3VudCA+IDApCj4gKwkJcmV0dXJuIGNvdW50Owo+ICAKPiAgCWVkaWQgPSBkcm1f
Z2V0X2VkaWQoY29ubmVjdG9yLCAmdGMtPmF1eC5kZGMpOwoKUmV2aWV3ZWQtYnk6IFBoaWxpcHAg
WmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpyZWdhcmRzClBoaWxpcHAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
