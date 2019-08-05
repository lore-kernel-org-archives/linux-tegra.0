From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v1 05/16] drm/fsl-dcu: fix opencoded use of drm_panel_*
Date: Mon, 05 Aug 2019 11:16:26 +0200
Message-ID: <8567eb4c916a0b1d134bd62112a11903@agner.ch>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-6-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190804201637.1240-6-sam@ravnborg.org>
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

T24gMjAxOS0wOC0wNCAyMjoxNiwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IFVzZSBkcm1fcGFuZWxf
Z2V0X21vZGVzKCkgdG8gYWNjZXNzIG1vZGVzLgo+IFRoaXMgaGFzIGEgbmljZSBzaWRlIGVmZmVj
dCB0byBzaW1wbGlmeSB0aGUgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgo+
IENjOiBBbGlzb24gV2FuZyA8YWxpc29uLndhbmdAbnhwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMgfCAxMCArLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMKPiBiL2RyaXZlcnMv
Z3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jCj4gaW5kZXggMjc5ZDgzZWFmZmMwLi5h
OTJmZDZjNzBiMDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2Rj
dV9kcm1fcmdiLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZnNsLWRjdS9mc2xfZGN1X2RybV9y
Z2IuYwo+IEBAIC02NSwxNyArNjUsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0
b3JfZnVuY3MKPiBmc2xfZGN1X2RybV9jb25uZWN0b3JfZnVuY3MgPSB7Cj4gIHN0YXRpYyBpbnQg
ZnNsX2RjdV9kcm1fY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQo+ICB7Cj4gIAlzdHJ1Y3QgZnNsX2RjdV9kcm1fY29ubmVjdG9yICpmc2xfY29ubmVj
dG9yOwo+IC0JaW50ICgqZ2V0X21vZGVzKShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gLQlp
bnQgbnVtX21vZGVzID0gMDsKPiAgCj4gIAlmc2xfY29ubmVjdG9yID0gdG9fZnNsX2RjdV9jb25u
ZWN0b3IoY29ubmVjdG9yKTsKPiAtCWlmIChmc2xfY29ubmVjdG9yLT5wYW5lbCAmJiBmc2xfY29u
bmVjdG9yLT5wYW5lbC0+ZnVuY3MgJiYKPiAtCSAgICBmc2xfY29ubmVjdG9yLT5wYW5lbC0+ZnVu
Y3MtPmdldF9tb2Rlcykgewo+IC0JCWdldF9tb2RlcyA9IGZzbF9jb25uZWN0b3ItPnBhbmVsLT5m
dW5jcy0+Z2V0X21vZGVzOwo+IC0JCW51bV9tb2RlcyA9IGdldF9tb2Rlcyhmc2xfY29ubmVjdG9y
LT5wYW5lbCk7Cj4gLQl9Cj4gLQo+IC0JcmV0dXJuIG51bV9tb2RlczsKPiArCXJldHVybiBkcm1f
cGFuZWxfZ2V0X21vZGVzKGZzbF9jb25uZWN0b3ItPnBhbmVsKTsKCk9oLCB0aGF0IG9sZCBjb2Rl
IGxvb2tzIHJhdGhlciBtZXNzeS4gVGhhbmtzIGZvciB0aGUgc2ltcGxpZmljYXRpb24hCgpUaGlz
IGJlaGF2ZXMgc2xpZ2h0bHkgZGlmZmVyZW50IHNpbmNlIGl0IG5vdyByZXR1cm5zIC1FSU5WQUwg
b3IgLUVOT1NZUywKYnV0IHRoYXQgaXMgd2hhdCB3ZSB3YW50LgoKQWNrZWQtYnk6IFN0ZWZhbiBB
Z25lciA8c3RlZmFuQGFnbmVyLmNoPgoKLS0KU3RlZmFuCgo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50
IGZzbF9kY3VfZHJtX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
