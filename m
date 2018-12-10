From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: drm/nouveau: tegra: Call nouveau_drm_device_init()
Date: Mon, 10 Dec 2018 15:14:30 +0000
Message-ID: <cbcda039118aadb6278bd21227b01cda6ef42bee.camel@toradex.com>
References: <20181123121151.17766-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181123121151.17766-1-thierry.reding@gmail.com>
Content-Language: en-US
Content-ID: <9CEA8A71EB6D62488A5BECAE91B9105D@eurprd05.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "bskeggs@redhat.com" <bskeggs@redhat.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

T24gRnJpLCAyMDE4LTExLTIzIGF0IDEzOjExICswMTAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToN
Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IEFzIHBh
cnQgb2YgY29tbWl0IGNmZWE4OGE0ZDg2NiAoImRybS9ub3V2ZWF1OiBTdGFydCB1c2luZyBuZXcg
ZHJtX2Rldg0KPiBpbml0aWFsaXphdGlvbiBoZWxwZXJzIiksIHRoZSBpbml0aWFsaXphdGlvbiBv
ZiB0aGUgTm91dmVhdSBEUk0NCj4gZGV2aWNlDQo+IHdhcyByZXdvcmtlZCBhbmQgYWxvbmcgdGhl
IHdheSB0aGUgcGxhdGZvcm0gZHJpdmVyIGluaXRpYWxpemF0aW9uIHdhcw0KPiBsZWZ0IGluY29t
cGxldGUuIEFkZCBhIGNhbGwgdG8gbm91dmVhdV9kcm1fZGV2aWNlX2luaXQoKSB0byBtYWtlIHN1
cmUNCj4gYWxsIG9mIHRoZSBzdHJ1Y3R1cmVzIGFyZSBwcm9wZXJseSBpbml0aWFsaXplZC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+DQo+
IFJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPg0KDQpUZXN0ZWQtYnk6
IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0KDQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyB8IDYgKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfZHJtLmMNCj4gaW5kZXggMmIyYmFmNmUwZTBkLi5kMjkyOGQ0M2YyOWEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYw0KPiBAQCAtMTE3MSwxMCAr
MTE3MSwxNiBAQCBub3V2ZWF1X3BsYXRmb3JtX2RldmljZV9jcmVhdGUoY29uc3Qgc3RydWN0DQo+
IG52a21fZGV2aWNlX3RlZ3JhX2Z1bmMgKmZ1bmMsDQo+ICAJCWdvdG8gZXJyX2ZyZWU7DQo+ICAJ
fQ0KPiAgDQo+ICsJZXJyID0gbm91dmVhdV9kcm1fZGV2aWNlX2luaXQoZHJtKTsNCj4gKwlpZiAo
ZXJyKQ0KPiArCQlnb3RvIGVycl9wdXQ7DQo+ICsNCj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShw
ZGV2LCBkcm0pOw0KPiAgDQo+ICAJcmV0dXJuIGRybTsNCj4gIA0KPiArZXJyX3B1dDoNCj4gKwlk
cm1fZGV2X3B1dChkcm0pOw0KPiAgZXJyX2ZyZWU6DQo+ICAJbnZrbV9kZXZpY2VfZGVsKHBkZXZp
Y2UpOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
