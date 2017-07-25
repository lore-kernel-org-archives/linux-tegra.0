From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
Date: Tue, 25 Jul 2017 22:42:38 +0800
Message-ID: <20170725144237.GF29754@dragon>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
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

T24gVHVlLCBKdWwgMjUsIDIwMTcgYXQgMTA6MDE6MjFBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBJdCdzIGRlYWQgY29kZSwgdGhlIGNvcmUgaGFuZGxlcyBhbGwgdGhpcyBkaXJlY3Rs
eSBub3cuCj4gCj4gVGhlIG9ubHkgc3BlY2lhbCBjYXNlIGlzIG5vdXZlYXUgYW5kIHRkYTk4OHgg
d2hpY2ggdXNlZCBvbmUgZnVuY3Rpb24KPiBmb3IgYm90aCBsZWdhY3kgbW9kZXNldCBjb2RlIGFu
ZCAtbnY1MCBhdG9taWMgd29ybGQgaW5zdGVhZCBvZiAyCj4gdnRhYmxlcy4gQnV0IGFtb3VudHMg
dG8gZXhhY3RseSB0aGUgc2FtZS4KPiAKPiB2MjogUmViYXNlIG92ZXIgdGhlIHBhbmVsL2JyaWRl
ZyByZWZhY3RvcmluZ3MgaW4gc3RtL2x0ZGMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci4uLgo+ICBkcml2ZXJzL2dwdS9kcm0venRl
L3p4X2hkbWkuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgZHJpdmVycy9ncHUvZHJt
L3p0ZS96eF90dmVuYy5jICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIGRyaXZlcnMvZ3B1
L2RybS96dGUvenhfdmdhLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQoKQWNrZWQtYnk6
IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
