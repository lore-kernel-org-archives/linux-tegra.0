From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
Date: Tue, 25 Jul 2017 15:00:19 +0530
Message-ID: <250ddff2-61ef-4e9e-5312-87014bb4b285@codeaurora.org>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>, Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-mediatek@lists.infradead.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Romain Perier <romain.perier@collabora.com>, Daniel Vetter <daniel.vetter@intel.com>, Jyri Sarha <jsarha@ti.com>, Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Peter Senna Tschudin <peter.senna@collabora.com>, Ben Skeggs <bskeggs@redhat.c>
List-Id: linux-tegra@vger.kernel.org

CgpPbiAwNy8yNS8yMDE3IDAxOjMxIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IEl0J3MgZGVh
ZCBjb2RlLCB0aGUgY29yZSBoYW5kbGVzIGFsbCB0aGlzIGRpcmVjdGx5IG5vdy4KPiAKPiBUaGUg
b25seSBzcGVjaWFsIGNhc2UgaXMgbm91dmVhdSBhbmQgdGRhOTg4eCB3aGljaCB1c2VkIG9uZSBm
dW5jdGlvbgo+IGZvciBib3RoIGxlZ2FjeSBtb2Rlc2V0IGNvZGUgYW5kIC1udjUwIGF0b21pYyB3
b3JsZCBpbnN0ZWFkIG9mIDIKPiB2dGFibGVzLiBCdXQgYW1vdW50cyB0byBleGFjdGx5IHRoZSBz
YW1lLgo+IAo+IHYyOiBSZWJhc2Ugb3ZlciB0aGUgcGFuZWwvYnJpZGVnIHJlZmFjdG9yaW5ncyBp
biBzdG0vbHRkYy4KCnMvYnJpZGVnL2JyaWRnZQoKPHNuaXA+CgoKPiAtLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5jICAgICAgIHwgIDEgLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMgICAgICAgICAgfCAgMSAtCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyB8ICAx
IC0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMgICAgICAgICAgICAg
IHwgIDEgLQo+ICAgLi4uL2RybS9icmlkZ2UvbWVnYWNoaXBzLXN0ZHB4eHh4LWdlLWI4NTB2My1m
dy5jICAgfCAgMSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL254cC1wdG4zNDYwLmMgICAg
ICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJhZGUt
cHM4NjIyLmMgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Np
aTkwMnguYyAgICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jICAgICAgICAgICAgICAgICB8ICAxIC0KCkZvciBicmlk
Z2UgY2hhbmdlczoKCkFja2VkLWJ5OiBBcmNoaXQgVGFuZWphIDxhcmNoaXR0QGNvZGVhdXJvcmEu
b3JnPgoKQXJjaGl0CgotLSAKUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBt
ZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0
aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
