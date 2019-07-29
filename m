From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 10/24] drm/imx: imx-ldb: Provide ddc symlink in
 connector's sysfs
Date: Mon, 29 Jul 2019 11:20:57 +0200
Message-ID: <1564392057.7633.2.camel@pengutronix.de>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <bcfe39a0333df951a7d160b3a946c2c32e7eac7f.1564161140.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <bcfe39a0333df951a7d160b3a946c2c32e7eac7f.1564161140.git.andrzej.p@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Armijn Hemel <armijn@tjaldur.nl>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashuk>
List-Id: linux-tegra@vger.kernel.org

T24gRnJpLCAyMDE5LTA3LTI2IGF0IDE5OjIzICswMjAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3og
d3JvdGU6Cj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25u
ZWN0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVq
LnBAY29sbGFib3JhLmNvbT4KCkFja2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1
dHJvbml4LmRlPgoKVGhhbmtzIQoKcmVnYXJkcwpQaGlsaXBwCgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vaW14L2lteC1sZGIuYyB8IDcgKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaW14L2lteC1sZGIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jCj4gaW5kZXgg
ZGU2MmE0Y2Q0ODI3Li5kYjQ2MWI2YTI1N2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2lteC9pbXgtbGRiLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYwo+IEBA
IC00NjIsOSArNDYyLDEwIEBAIHN0YXRpYyBpbnQgaW14X2xkYl9yZWdpc3RlcihzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtLAo+ICAJCSAqLwo+ICAJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmaW14
X2xkYl9jaC0+Y29ubmVjdG9yLAo+ICAJCQkJJmlteF9sZGJfY29ubmVjdG9yX2hlbHBlcl9mdW5j
cyk7Cj4gLQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRybSwgJmlteF9sZGJfY2gtPmNvbm5lY3RvciwK
PiAtCQkJCSZpbXhfbGRiX2Nvbm5lY3Rvcl9mdW5jcywKPiAtCQkJCURSTV9NT0RFX0NPTk5FQ1RP
Ul9MVkRTKTsKPiArCQlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZHJtLCAmaW14X2xkYl9j
aC0+Y29ubmVjdG9yLAo+ICsJCQkJCSAgICAmaW14X2xkYl9jb25uZWN0b3JfZnVuY3MsCj4gKwkJ
CQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTLAo+ICsJCQkJCSAgICBpbXhfbGRiX2NoLT5k
ZGMpOwo+ICAJCWRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoJmlteF9sZGJfY2gtPmNvbm5l
Y3RvciwgZW5jb2Rlcik7Cj4gIAl9Cj4gIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
