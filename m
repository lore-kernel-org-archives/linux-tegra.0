From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
Date: Thu, 24 Jan 2019 10:46:47 +0100
Message-ID: <20190124094646.GR3271@phenom.ffwll.local>
References: <20190116181018.GA27364@ravnborg.org>
 <20190117210334.13234-1-daniel.vetter@ffwll.ch>
 <20190123170015.GA23138@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190123170015.GA23138@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>, DRI Development <dri-devel@lists.freedesktop.org>, virtualization@lists.linux-foundation.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org, nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.or
List-Id: linux-tegra@vger.kernel.org

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDY6MDA6MTVQTSArMDEwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIERhbmllbC4KPiAKPiBPbiBUaHUsIEphbiAxNywgMjAxOSBhdCAxMDowMzozNFBN
ICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gSGF2aW5nIHRoZSBwcm9iZSBoZWxwZXIg
c3R1ZmYgKHdoaWNoIHByZXR0eSBtdWNoIGV2ZXJ5b25lIG5lZWRzKSBpbgo+ID4gdGhlIGRybV9j
cnRjX2hlbHBlci5oIGZpbGUgKHdoaWNoIGF0b21pYyBkcml2ZXJzIHNob3VsZCBuZXZlciBuZWVk
KSBpcwo+ID4gY29uZnVzaW5nLiBTcGxpdCB0aGVtIG91dC4KPiA+IAo+ID4gVG8gbWFrZSBzdXJl
IEkgYWN0dWFsbHkgYWNoaWV2ZWQgdGhlIGdvYWwgaGVyZSBJIHdlbnQgdGhyb3VnaCBhbGwKPiA+
IGRyaXZlcnMuIEFuZCBpbmRlZWQsIGFsbCBhdG9taWMgZHJpdmVycyBhcmUgbm93IGZyZWUgb2YK
PiA+IGRybV9jcnRjX2hlbHBlci5oIGluY2x1ZGVzLgo+IAo+IEhvdyBhcmUgdGhlIHBsYW5zIHRv
IGdldCB0aGlzIHBhdGNoc2V0IG1lcmdlZD8KPiBUaGVyZSB3ZXJlIGRlcGVuZGVuY2llcyBvbiBv
bmdpbmcgZHJtUC5oIHJlbW92YWwgaW4gaTkxNSBJSVJDPwo+IEkgZ3Vlc3MgbXkgIk1pbmltaXpl
IGRybVAuaCBkZXBlbmRlbmNpZXMiIHBhdGNoLXNldCBhbHNvIGhhdmUgYSByb2xlIGluIHRoaXMu
CgpXb3JraW5nIG9uIGl0LCBhIHB1bGwgcmVxdWVzdCBnb3QgbG9zdC4gSSBvcmlnaW5hbGx5IHdh
bnRlZCB0byBnZXQgdGhpcwphbGwgcmVzb2x2ZWQgdGhpcyB3ZWVrLCBwcm9iYWJseSBnb2luZyB0
byBiZSBuZXh0IHdlZWsgbm93IDotKAotRGFuaWVsCgoKPiBUaGlzIGRvZXMgbm90IGhvbGQgdXAg
YW55IHdvcmsgb2YgbWluZSwgbWFpbmx5IHdhbnRlZCB0byBtYWtlCj4gc3VyZSB0aGlzIHdhcyBu
b3QgbG9zdCBiZXR3ZWVuIGFsbCB0aGUgb3RoZXIgcGF0Y2hlcy4KPiAKPiAJU2FtCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
