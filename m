From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] drm/atomic: Create and use
 __drm_atomic_helper_crtc_reset() everywhere
Date: Mon, 12 Nov 2018 16:36:41 +0100
Message-ID: <2475529.N6HtQ5V54z@phil>
References: <20181112150114.18395-1-maarten.lankhorst@linux.intel.com>
 <20181112150114.18395-2-maarten.lankhorst@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181112150114.18395-2-maarten.lankhorst@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Mali DP Maintainers <malidp@foss.arm.com>, nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

QW0gTW9udGFnLCAxMi4gTm92ZW1iZXIgMjAxOCwgMTY6MDE6MTQgQ0VUIHNjaHJpZWIgTWFhcnRl
biBMYW5raG9yc3Q6Cj4gV2UgYWxyZWFkeSBoYXZlIF9fZHJtX2F0b21pY19oZWxwZXJfY29ubmVj
dG9yX3Jlc2V0KCkgYW5kCj4gX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldCgpLCBleHRl
bmQgdGhpcyB0byBjcnRjIGFzIHdlbGwuCj4gCj4gTW9zdCBkcml2ZXJzIGFscmVhZHkgaGF2ZSBh
IGdwdSByZXNldCBob29rLCBjb3JyZWN0IGl0Lgo+IE5vdXZlYXUgYWxyZWFkeSBpbXBsZW1lbnRl
ZCBpdHMgb3duIF9fZHJtX2F0b21pY19oZWxwZXJfY3J0Y19yZXNldCgpLAo+IGNvbnZlcnQgaXQg
dG8gdGhlIGNvbW1vbiBvbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIGIvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwo+IGluZGV4IGZiNzBmYjQ4NmZiZi4uZDJkNWFh
Njc2MDg0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fdm9wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3Zv
cC5jCj4gQEAgLTEwNzEsMTMgKzEwNzEsMTQgQEAgc3RhdGljIHZvaWQgdm9wX2NydGNfZGVzdHJv
eShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gIAo+ICBzdGF0aWMgdm9pZCB2b3BfY3J0Y19yZXNl
dChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gIHsKPiArCXN0cnVjdCByb2NrY2hpcF9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlID0KPiArCQlremFsbG9jKHNpemVvZigqY3J0Y19zdGF0ZSksIEdGUF9L
RVJORUwpOwo+ICsKPiAgCWlmIChjcnRjLT5zdGF0ZSkKPiAgCQlfX2RybV9hdG9taWNfaGVscGVy
X2NydGNfZGVzdHJveV9zdGF0ZShjcnRjLT5zdGF0ZSk7Cj4gIAlrZnJlZShjcnRjLT5zdGF0ZSk7
Cj4gIAo+IC0JY3J0Yy0+c3RhdGUgPSBremFsbG9jKHNpemVvZihzdHJ1Y3Qgcm9ja2NoaXBfY3J0
Y19zdGF0ZSksIEdGUF9LRVJORUwpOwo+IC0JaWYgKGNydGMtPnN0YXRlKQo+IC0JCWNydGMtPnN0
YXRlLT5jcnRjID0gY3J0YzsKPiArCV9fZHJtX2F0b21pY19oZWxwZXJfY3J0Y19yZXNldChjcnRj
LCAmY3J0Y19zdGF0ZS0+YmFzZSk7Cj4gIH0KPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgZHJtX2NydGNf
c3RhdGUgKnZvcF9jcnRjX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCgpm
b3IgdGhlIFJvY2tjaGlwLXBhcnQKQWNrZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRl
Y2guZGU+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
