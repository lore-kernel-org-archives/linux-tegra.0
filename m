From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 02/16] drm/exynos: fix opencoded use of drm_panel_*
Date: Sun, 1 Dec 2019 12:32:21 +0100
Message-ID: <20191201113221.GB8753@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-3-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-3-sam@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>, linux-arm-kernel@list
List-Id: linux-tegra@vger.kernel.org

T24gU3VuLCBBdWcgMDQsIDIwMTkgYXQgMTA6MTY6MjNQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IGRybV9wYW5lbF9hdHRhY2goKSB3aWxsIGNoZWNrIGlmIHRoZXJlIGlzIGEgY29udHJv
bGxlcgo+IGFscmVhZHkgYXR0YWNoZWQgLSBkcm9wIHRoZSBjaGVjayBpbiB0aGUgZHJpdmVyLgo+
IAo+IFVzZSBkcm1fcGFuZWxfZ2V0X21vZGVzKCkgc28gdGhlIGRyaXZlciBubyBsb25nZXIgdXNl
cyB0aGUgZnVuY3Rpb24KPiBwb2ludGVyLgoKQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgoKCVNh
bQoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4g
Q2M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPiBDYzogSm9vbnlvdW5nIFNoaW0g
PGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgo+IENjOiBTZXVuZy1Xb28gS2ltIDxzdzAzMTIua2lt
QHNhbXN1bmcuY29tPgo+IENjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcu
Y29tPgo+IENjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgo+IENjOiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RwaS5jIHwgNCArKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcGkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcGkuYwo+IGluZGV4IDNjZWJiMTllYzFjNC4u
NTQ3OWZmNzFjYmM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9kcGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcGku
Ywo+IEBAIC00Myw3ICs0Myw3IEBAIGV4eW5vc19kcGlfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCj4gIHsKPiAgCXN0cnVjdCBleHlub3NfZHBpICpj
dHggPSBjb25uZWN0b3JfdG9fZHBpKGNvbm5lY3Rvcik7Cj4gIAo+IC0JaWYgKGN0eC0+cGFuZWwg
JiYgIWN0eC0+cGFuZWwtPmNvbm5lY3RvcikKPiArCWlmIChjdHgtPnBhbmVsKQo+ICAJCWRybV9w
YW5lbF9hdHRhY2goY3R4LT5wYW5lbCwgJmN0eC0+Y29ubmVjdG9yKTsKPiAgCj4gIAlyZXR1cm4g
Y29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7Cj4gQEAgLTg1LDcgKzg1LDcgQEAgc3RhdGljIGlu
dCBleHlub3NfZHBpX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+
ICAJfQo+ICAKPiAgCWlmIChjdHgtPnBhbmVsKQo+IC0JCXJldHVybiBjdHgtPnBhbmVsLT5mdW5j
cy0+Z2V0X21vZGVzKGN0eC0+cGFuZWwpOwo+ICsJCXJldHVybiBkcm1fcGFuZWxfZ2V0X21vZGVz
KGN0eC0+cGFuZWwpOwo+ICAKPiAgCXJldHVybiAwOwo+ICB9Cj4gLS0gCj4gMi4yMC4xCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
