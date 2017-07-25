From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
Date: Tue, 25 Jul 2017 17:01:36 +0300
Message-ID: <3211906.qXAXzL790j@avalon>
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
Cc: nopsys.com@freedesktop.org, one.org@freedesktop.org, Martyn Welch <martyn.welch@collabora.co.uk>, Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org, DRI Development <dri-devel@lists.freedesktop.org>, virtualization@lists.linux-foundation.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-mediatek@lists.infradead.org, Gerd Hoffmann <kraxel@redhat.com>, Romain Perier <romain.perier@collabora.com>, Daniel Vetter <daniel.vetter@intel.com>, Jyri Sarha <jsarha@ti.com>, Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene>
List-Id: linux-tegra@vger.kernel.org

SGkgRGFuaWVsLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUdWVzZGF5IDI1IEp1bCAy
MDE3IDEwOjAxOjIxIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gSXQncyBkZWFkIGNvZGUsIHRoZSBj
b3JlIGhhbmRsZXMgYWxsIHRoaXMgZGlyZWN0bHkgbm93Lgo+IAo+IFRoZSBvbmx5IHNwZWNpYWwg
Y2FzZSBpcyBub3V2ZWF1IGFuZCB0ZGE5ODh4IHdoaWNoIHVzZWQgb25lIGZ1bmN0aW9uCj4gZm9y
IGJvdGggbGVnYWN5IG1vZGVzZXQgY29kZSBhbmQgLW52NTAgYXRvbWljIHdvcmxkIGluc3RlYWQg
b2YgMgo+IHZ0YWJsZXMuIEJ1dCBhbW91bnRzIHRvIGV4YWN0bHkgdGhlIHNhbWUuCj4gCj4gdjI6
IFJlYmFzZSBvdmVyIHRoZSBwYW5lbC9icmlkZWcgcmVmYWN0b3JpbmdzIGluIHN0bS9sdGRjLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
PgoKW3NuaXBdCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUx
MV9kcnYuYyAgICAgICB8ICAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1k
YWMuYyAgICAgICAgICAgICAgfCAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwu
YyAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYyAgICAgICAgICB8ICAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9h
dG9taWNfaGVscGVyLmMgICAgICAgICAgICAgICAgfCA3OSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmMgICAgICAgICAgIHwgIDEg
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2x2ZHNjb24uYyAgICAgICAgICB8
ICAxIC0KCkZvciB0aGUgYWJvdmUsCgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBp
bmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
