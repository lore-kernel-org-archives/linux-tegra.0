From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 01/16] drm/bridge: tc358767: fix opencoded use of
 drm_panel_*
Date: Mon, 5 Aug 2019 13:53:00 +0200
Message-ID: <20190805115300.GA16513@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-2-sam@ravnborg.org>
 <1564997756.3056.13.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1564997756.3056.13.camel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org, Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Alexios Zavras <alexios.zavras@intel.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.com>, Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.
List-Id: linux-tegra@vger.kernel.org

SGkgUGhpbGlwcC4KCk9uIE1vbiwgQXVnIDA1LCAyMDE5IGF0IDExOjM1OjU2QU0gKzAyMDAsIFBo
aWxpcHAgWmFiZWwgd3JvdGU6Cj4gT24gU3VuLCAyMDE5LTA4LTA0IGF0IDIyOjE2ICswMjAwLCBT
YW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiBSZXBsYWNlIG9wZW4gY29kZWQgdmVyc2lvbiB3aXRoIGNh
bGwgdG8gZHJtX3BhbmVsX2dldF9tb2RlcygpLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiBDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpk
YUBzYW1zdW5nLmNvbT4KPiA+IENjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJy
ZS5jb20+Cj4gPiBDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgo+ID4gQ2M6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KPiA+IENj
OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCAxMCArKysrLS0tLS0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+ID4gaW5kZXggNDJmMDNhOTg1YWMwLi5jZWJjOGU2MjA4
MjAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+ID4gQEAgLTEzMTIsNyAr
MTMxMiw3IEBAIHN0YXRpYyBpbnQgdGNfY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKQo+ID4gIHsKPiA+ICAJc3RydWN0IHRjX2RhdGEgKnRjID0gY29u
bmVjdG9yX3RvX3RjKGNvbm5lY3Rvcik7Cj4gPiAgCXN0cnVjdCBlZGlkICplZGlkOwo+ID4gLQl1
bnNpZ25lZCBpbnQgY291bnQ7Cj4gPiArCWludCBjb3VudDsKPiAKPiBUaGlzIGxvb2tzIGxpa2Ug
aXQgYWxzbyBmaXhlcyBhIHBvdGVudGlhbCBidWcgLi4uCgpnZXRfbW9kZXMoKSByZXR1cm4gZWl0
aGVyIDAgb3IgbnVtYmVyIG9mIG1vZGVzLgpUaGUgbmVnYXRpdmUgcmV0dXJuIHZhbHVlcyBjb21l
IGludG8gcGxheSBpbiBkcm1fcGFuZWxfZ2V0X21vZGVzKCkgd2hlbgpwYW5lbCBmb3IgZXhhbXBs
ZSBzIE5VTEwuCgpJIHdpbGwgYWRkIHRoaXMgdG8gY2hhbmdlbG9nIGJlZm9yZSBJIGFwcGx5IHRv
IGF2b2lkIGFueQptaXN1bmRlcnN0YW5kaW5nLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
