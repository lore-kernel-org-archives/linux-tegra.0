From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
Date: Tue, 25 Jul 2017 10:59:17 +0200
Message-ID: <1500973157.4101.13.camel@pengutronix.de>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170725080122.20548-8-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>, Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org, DRI Development <dri-devel@lists.freedesktop.org>, virtualization@lists.linux-foundation.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-mediatek@lists.infradead.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Romain Perier <romain.perier@collabora.com>, Daniel Vetter <daniel.vetter@intel.com>, Jyri Sarha <jsarha@ti.com>, Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Peter Senna Tschudin <peter>
List-Id: linux-tegra@vger.kernel.org

T24gVHVlLCAyMDE3LTA3LTI1IGF0IDEwOjAxICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
IEl0J3MgZGVhZCBjb2RlLCB0aGUgY29yZSBoYW5kbGVzIGFsbCB0aGlzIGRpcmVjdGx5IG5vdy4K
PiAKPiBUaGUgb25seSBzcGVjaWFsIGNhc2UgaXMgbm91dmVhdSBhbmQgdGRhOTg4eCB3aGljaCB1
c2VkIG9uZSBmdW5jdGlvbgo+IGZvciBib3RoIGxlZ2FjeSBtb2Rlc2V0IGNvZGUgYW5kIC1udjUw
IGF0b21pYyB3b3JsZCBpbnN0ZWFkIG9mIDIKPiB2dGFibGVzLiBCdXQgYW1vdW50cyB0byBleGFj
dGx5IHRoZSBzYW1lLgo+IAo+IHYyOiBSZWJhc2Ugb3ZlciB0aGUgcGFuZWwvYnJpZGVnIHJlZmFj
dG9yaW5ncyBpbiBzdG0vbHRkYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4KWy4uLl0KPiAgZHJpdmVycy9ncHUvZHJtL2lteC9pbXgt
bGRiLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9pbXgv
aW14LXR2ZS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBkcml2ZXJzL2dwdS9kcm0v
aW14L3BhcmFsbGVsLWRpc3BsYXkuYyAgICAgICAgICAgICB8ICAxIC0KPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYyAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICAgICAgICAgICAgIHwgIDEgLQoKQWNrZWQt
Ynk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpyZWdhcmRzClBoaWxp
cHAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
