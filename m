From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 17/23] drm/ast: Provide ddc symlink in connector sysfs
 directory
Date: Tue, 23 Jul 2019 11:09:04 +0200
Message-ID: <20190723090904.GC787@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d3651bd2fd8ba69b8380304bca4c629a8c1da4e9.1562843413.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <d3651bd2fd8ba69b8380304bca4c629a8c1da4e9.1562843413.git.andrzej.p@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.c>
List-Id: linux-tegra@vger.kernel.org

SGkgQW5kcnplai4KCk9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDAxOjI2OjQ0UE0gKzAyMDAsIEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiBVc2UgdGhlIGRkYyBwb2ludGVyIHByb3ZpZGVk
IGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBp
ZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMgfCA5ICsrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKPiBp
bmRleCBmZmNjYmVmOTYyYTQuLjFjYTliYzRhYTNiYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMKPiBAQCAtODkwLDYgKzg5MCwxMSBAQCBzdGF0aWMgaW50IGFzdF9jb25uZWN0b3JfaW5pdChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKPiAgCWNvbm5l
Y3RvciA9ICZhc3RfY29ubmVjdG9yLT5iYXNlOwo+ICsJYXN0X2Nvbm5lY3Rvci0+aTJjID0gYXN0
X2kyY19jcmVhdGUoZGV2KTsKPiArCWlmICghYXN0X2Nvbm5lY3Rvci0+aTJjKQo+ICsJCURSTV9F
UlJPUigiZmFpbGVkIHRvIGFkZCBkZGMgYnVzIGZvciBjb25uZWN0b3JcbiIpOwo+ICsKPiArCWNv
bm5lY3Rvci0+ZGRjID0gJmFzdF9jb25uZWN0b3ItPmkyYy0+YWRhcHRlcjsKPiAgCWRybV9jb25u
ZWN0b3JfaW5pdChkZXYsIGNvbm5lY3RvciwgJmFzdF9jb25uZWN0b3JfZnVuY3MsIERSTV9NT0RF
X0NPTk5FQ1RPUl9WR0EpOwo+ICAKPiAgCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0
b3IsICZhc3RfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CkFnYWluLCBhc3NpZ25pbmcgYmVmb3Jl
IGRybV9jb25uZWN0b3JfaW5pdCgpLgpJIGRpZCBub3QgYXVkaXQgdGhlIHJlbWFpbmluZyBwYXRj
aGVzIC0geW91IGdvdCB0aGUgaWRlYS4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
