From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 05/26] drm/panel: add drm_connector argument to
 get_modes()
Date: Tue, 3 Dec 2019 14:25:04 +0100
Message-ID: <CACRpkdb9c__FUBWE6j6g9uFwYRE6CrX8gu2gbHZ-xPpZ+YkF6Q@mail.gmail.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-6-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191202193230.21310-6-sam@ravnborg.org>
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
Lm9yZz4gd3JvdGU6Cgo+IFRvZGF5IHRoZSBicmlkZ2UgY3JlYXRlcyB0aGUgZHJtX2Nvbm5lY3Rv
ciwgYnV0IHRoYXQgaXMgcGxhbm5lZAo+IHRvIGJlIG1vdmVkIHRvIHRoZSBkaXNwbGF5IGRyaXZl
cnMuCj4gVG8gZmFjaWxpdGF0ZSB0aGlzLCB1cGRhdGUgZHJtX3BhbmVsX2Z1bmNzLmdldF9tb2Rl
cygpIHRvCj4gdGFrZSBkcm1fY29ubmVjdG9yIGFzIGFuIGFyZ3VtZW50Lgo+IEFsbCBwYW5lbCBk
cml2ZXJzIGltcGxlbWVudGluZyBnZXRfbW9kZXMoKSBhcmUgdXBkYXRlZC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogVGhpZXJyeSBSZWRp
bmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4K
PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KPiBDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4g
Q2M6IFN0ZWZhbiBNYXZyb2RpZXYgPHN0ZWZhbkBvbGltZXguY29tPgo+IENjOiBSb2JlcnQgQ2hp
cmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4gQ2M6ICJHdWlkbyBHw7xudGhlciIgPGFneEBz
aWd4Y3B1Lm9yZz4KPiBDYzogUHVyaXNtIEtlcm5lbCBUZWFtIDxrZXJuZWxAcHVyaS5zbT4KClRo
aXMgbG9va3MgcmVhc29uYWJsZSB0byBtZS4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
