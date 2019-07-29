From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 11/24] drm/imx: imx-tve: Provide ddc symlink in
 connector's sysfs
Date: Mon, 29 Jul 2019 11:20:42 +0200
Message-ID: <1564392042.7633.1.camel@pengutronix.de>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <1c660776741760b8094484268b670a09da8a9042.1564161140.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1c660776741760b8094484268b670a09da8a9042.1564161140.git.andrzej.p@collabora.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Alexios Zavras <alexios.zavras@intel.com>
List-Id: linux-tegra@vger.kernel.org

T24gRnJpLCAyMDE5LTA3LTI2IGF0IDE5OjIzICswMjAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3og
d3JvdGU6Cj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25u
ZWN0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVq
LnBAY29sbGFib3JhLmNvbT4KCkFja2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1
dHJvbml4LmRlPgoKcmVnYXJkcwpQaGlsaXBwCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaW14
L2lteC10dmUuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14
LXR2ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtdHZlLmMKPiBpbmRleCA2NDk1MTU4Njhm
ODYuLjViYmZhYTJjZDBmNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC10
dmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LXR2ZS5jCj4gQEAgLTQ4NCw4ICs0
ODQsMTAgQEAgc3RhdGljIGludCBpbXhfdHZlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpk
cm0sIHN0cnVjdCBpbXhfdHZlICp0dmUpCj4gIAo+ICAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRk
KCZ0dmUtPmNvbm5lY3RvciwKPiAgCQkJJmlteF90dmVfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7
Cj4gLQlkcm1fY29ubmVjdG9yX2luaXQoZHJtLCAmdHZlLT5jb25uZWN0b3IsICZpbXhfdHZlX2Nv
bm5lY3Rvcl9mdW5jcywKPiAtCQkJICAgRFJNX01PREVfQ09OTkVDVE9SX1ZHQSk7Cj4gKwlkcm1f
Y29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZHJtLCAmdHZlLT5jb25uZWN0b3IsCj4gKwkJCQkgICAg
JmlteF90dmVfY29ubmVjdG9yX2Z1bmNzLAo+ICsJCQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9W
R0EsCj4gKwkJCQkgICAgdHZlLT5kZGMpOwo+ICAKPiAgCWRybV9jb25uZWN0b3JfYXR0YWNoX2Vu
Y29kZXIoJnR2ZS0+Y29ubmVjdG9yLCAmdHZlLT5lbmNvZGVyKTsKPiAgCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
