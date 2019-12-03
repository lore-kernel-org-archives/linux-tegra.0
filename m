From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 08/26] drm/panel: drop drm_device from drm_panel
Date: Tue, 3 Dec 2019 14:27:34 +0100
Message-ID: <CACRpkdbiyVcUDrxuCK_wgsB6Vn+XZptsc9H3zB0cXxjeOtw+Ug@mail.gmail.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-9-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191202193230.21310-9-sam@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stefan Mavrodiev <stefan@olimex.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>Linux ARM <l>
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCBEZWMgMiwgMjAxOSBhdCA4OjMzIFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6Cgo+IFRoZSBwYW5lbCBkcml2ZXJzIHVzZWQgZHJtX3BhbmVsLmRybSBmb3Ig
dHdvIHB1cnBvc2VzOgo+IDEpIEFyZ3VtZW50IHRvIGRybV9tb2RlX2R1cGxpY2F0ZSgpCj4gMikg
ZHJtLT5kZXYgd2FzIHVzZWQgaW4gZXJyb3IgbWVzc2FnZXMKPgo+IFRoZSBmaXJzdCB1c2FnZSBp
cyByZXBsYWNlZCB3aXRoIGRybV9jb25uZWN0b3IuZGV2Cj4gLSBkcm1fY29ubmVjdG9yIGlzIGFs
cmVhZHkgY29ubmVjdGVkIHRvIGEgZHJtX2RldmljZQo+ICAgYW5kIHdlIGhhdmUgYSB2YWxpZCBj
b25uZWN0b3IKPgo+IFRoZSBzZWNvbmQgdXNhZ2UgaXMgcmVwbGFjZWQgd2l0aCBkcm1fcGFuZWwu
ZGV2Cj4gLSB0aGlzIG1ha2VzIGRyaXZlcnMgbW9yZSBjb25zaXN0ZW50IGluIHRoZWlyIGRldiBh
cmd1bWVudAo+ICAgdXNlZCBmb3IgZGV2X2VycigpIGFuZCBmcmllbmRzCj4KPiBXaXRoIHRoZXNl
IHJlcGxhY2VtZW50cyB0aGVyZSBhcmUgbm8gbW9yZSB1c2VzIG9mIGRybV9wYW5lbC5kcm0sCj4g
c28gaXQgaXMgcmVtb3ZlZCBmcm9tIHN0cnVjdCBkcm1fcGFuZWwuCj4gV2l0aCB0aGlzIGNoYW5n
ZSBkcm1fcGFuZWxfYXR0YWNoKCkgYW5kIGRybV9wYW5lbF9kZXRhY2goKQo+IG5vIGxvZ25lciBo
YXMgYW55IHVzZSBhcyB0aGV5IGFyZSBlbXB0eSBmdW5jdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0
aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+Cj4gQ2M6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IENjOiBT
dGVmYW4gTWF2cm9kaWV2IDxzdGVmYW5Ab2xpbWV4LmNvbT4KPiBDYzogUm9iZXJ0IENoaXJhcyA8
cm9iZXJ0LmNoaXJhc0BueHAuY29tPgo+IENjOiAiR3VpZG8gR8O8bnRoZXIiIDxhZ3hAc2lneGNw
dS5vcmc+Cj4gQ2M6IFB1cmlzbSBLZXJuZWwgVGVhbSA8a2VybmVsQHB1cmkuc20+CgpSZXZpZXdl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
