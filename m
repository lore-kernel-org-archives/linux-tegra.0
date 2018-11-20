From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/atomic: Create and use
 __drm_atomic_helper_crtc_reset() everywhere
Date: Tue, 20 Nov 2018 10:30:28 +0100
Message-ID: <1542706228.6467.1.camel@pengutronix.de>
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shirish S <shirish.s@amd.com>, Anthony Koo <Anthony.Koo@amd.com>, Thomas Hellstrom <thellstrom@vmware.com>, linux-rockchip@lists.infradead.org, Tony Cheng <Tony.Cheng@amd.com>, David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Mali DP Maintainers <malidp@foss.arm.com>, Ben Skeggs <bskeggs@redhat.com>, linux-arm-msm@vger.kernel.org, VMwa
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCAyMDE4LTExLTEyIGF0IDE2OjAxICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPiBXZSBhbHJlYWR5IGhhdmUgX19kcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQo
KSBhbmQKPiBfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0KCksIGV4dGVuZCB0aGlzIHRv
IGNydGMgYXMgd2VsbC4KPiAKPiBNb3N0IGRyaXZlcnMgYWxyZWFkeSBoYXZlIGEgZ3B1IHJlc2V0
IGhvb2ssIGNvcnJlY3QgaXQuCj4gTm91dmVhdSBhbHJlYWR5IGltcGxlbWVudGVkIGl0cyBvd24g
X19kcm1fYXRvbWljX2hlbHBlcl9jcnRjX3Jlc2V0KCksCj4gY29udmVydCBpdCB0byB0aGUgY29t
bW9uIG9uZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgpbLi4uXQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaW14L2lwdXYzLWNydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5j
Cj4gaW5kZXggN2Q0YjcxMGI4MzdhLi44YmMzNmYwZDJiNmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lw
dXYzLWNydGMuYwo+IEBAIC0xMjAsMTIgKzEyMCw5IEBAIHN0YXRpYyB2b2lkIGlteF9kcm1fY3J0
Y19yZXNldChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gIAkJbWVtc2V0KHN0YXRlLCAwLCBzaXpl
b2YoKnN0YXRlKSk7Cj4gIAl9IGVsc2Ugewo+ICAJCXN0YXRlID0ga3phbGxvYyhzaXplb2YoKnN0
YXRlKSwgR0ZQX0tFUk5FTCk7Cj4gLQkJaWYgKCFzdGF0ZSkKPiAtCQkJcmV0dXJuOwo+IC0JCWNy
dGMtPnN0YXRlID0gJnN0YXRlLT5iYXNlOwo+ICAJfQo+ICAKPiAtCXN0YXRlLT5iYXNlLmNydGMg
PSBjcnRjOwo+ICsJX19kcm1fYXRvbWljX2hlbHBlcl9jcnRjX3Jlc2V0KGNydGMsICZzdGF0ZS0+
YmFzZSk7Cj4gIH0KPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmlteF9kcm1f
Y3J0Y19kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCA5MmVjYjliZjk4MmMuLmE3NDNlNWVk
MTE3NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRj
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAt
MTE5LDEyICsxMTksOSBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfcmVzZXQoc3RydWN0IGRy
bV9jcnRjICpjcnRjKQo+ICAJCW1lbXNldChzdGF0ZSwgMCwgc2l6ZW9mKCpzdGF0ZSkpOwo+ICAJ
fSBlbHNlIHsKPiAgCQlzdGF0ZSA9IGt6YWxsb2Moc2l6ZW9mKCpzdGF0ZSksIEdGUF9LRVJORUwp
Owo+IC0JCWlmICghc3RhdGUpCj4gLQkJCXJldHVybjsKPiAtCQljcnRjLT5zdGF0ZSA9ICZzdGF0
ZS0+YmFzZTsKPiAgCX0KPiAgCj4gLQlzdGF0ZS0+YmFzZS5jcnRjID0gY3J0YzsKPiArCV9fZHJt
X2F0b21pY19oZWxwZXJfY3J0Y19yZXNldChjcnRjLCAmc3RhdGUtPmJhc2UpOwo+ICB9Cj4gIAo+
ICBzdGF0aWMgc3RydWN0IGRybV9jcnRjX3N0YXRlICptdGtfZHJtX2NydGNfZHVwbGljYXRlX3N0
YXRlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKCkZvciB0aGUgaW14LWRybSBhbmQgbWVkaWF0ZWsg
ZHJpdmVycywKCkFja2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
PgoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
