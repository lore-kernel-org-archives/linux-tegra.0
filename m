From: Vincent ABRIOU <vincent.abriou@st.com>
Subject: Re: [PATCH 7/8] drm: Nuke drm_atomic_helper_connector_dpms
Date: Tue, 8 Aug 2017 10:05:11 +0000
Message-ID: <462c98df-2633-3c61-9ae6-e567780941c0@st.com>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170725080122.20548-8-daniel.vetter@ffwll.ch>
Content-Language: en-US
Content-ID: <C1D66642F494334E83389CC9FEAF0D3A@st.com>
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
Cc: Martyn Welch <martyn.welch@collabora.co.uk>, Neil Armstrong <narmstrong@baylibre.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Romain Perier <romain.perier@collabora.com>, Daniel Vetter <daniel.vetter@intel.com>, Jyri Sarha <jsarha@ti.com>, Marek Vasut <marex@denx.de>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Xinliang
List-Id: linux-tegra@vger.kernel.org

DQoNCk9uIDA3LzI1LzIwMTcgMTA6MDEgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+IEl0J3Mg
ZGVhZCBjb2RlLCB0aGUgY29yZSBoYW5kbGVzIGFsbCB0aGlzIGRpcmVjdGx5IG5vdy4NCj4gDQo+
IFRoZSBvbmx5IHNwZWNpYWwgY2FzZSBpcyBub3V2ZWF1IGFuZCB0ZGE5ODh4IHdoaWNoIHVzZWQg
b25lIGZ1bmN0aW9uDQo+IGZvciBib3RoIGxlZ2FjeSBtb2Rlc2V0IGNvZGUgYW5kIC1udjUwIGF0
b21pYyB3b3JsZCBpbnN0ZWFkIG9mIDINCj4gdnRhYmxlcy4gQnV0IGFtb3VudHMgdG8gZXhhY3Rs
eSB0aGUgc2FtZS4NCj4gDQo+IHYyOiBSZWJhc2Ugb3ZlciB0aGUgcGFuZWwvYnJpZGVnIHJlZmFj
dG9yaW5ncyBpbiBzdG0vbHRkYy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KDQpbLi4uXQ0KDQo+ICAgZHJpdmVycy9ncHUvZHJt
L3N0aS9zdGlfZHZvLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3N0aS9zdGlfaGRhLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJp
dmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jICAgICAgICAgICAgICAgICAgICAgfCAgMSAtDQoN
CkFja2VkLWJ5OiBWaW5jZW50IEFicmlvdSA8dmluY2VudC5hYnJpb3VAc3QuY29tPg0KDQpCUg0K
VmluY2VudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
