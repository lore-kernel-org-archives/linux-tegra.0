From: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V3 1/4] ARM: tegra30: clocks: Fix pciex clock
 registration
Date: Wed, 12 Jun 2013 12:41:38 +0530
Message-ID: <C79B248886DD134989C8FF6B096A91AB91CF1615C6@BGMAIL01.nvidia.com>
References: <1370372252-4332-1-git-send-email-jagarwal@nvidia.com>
 <51AE3B18.9010604@wwwdotorg.org> <20130611221709.8816.15602@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130611221709.8816.15602@quantum>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Mike Turquette' <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Juha Tukkinen <jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krishna Thota <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

PiBRdW90aW5nIFN0ZXBoZW4gV2FycmVuICgyMDEzLTA2LTA0IDEyOjA4OjA4KQ0KPiA+IE9uIDA2
LzA0LzIwMTMgMTI6NTcgUE0sIEpheSBBZ2Fyd2FsIHdyb3RlOg0KPiA+ID4gUmVnaXN0ZXJpbmcg
cGNpZXggYXMgcGVyaXBoZXJhbCBjbG9jayBpbnN0ZWFkIG9mIGZpeGVkIGNsb2NrIGFzDQo+ID4g
PiB0ZWdyYV9wZXJpaF9yZXNldF9hc3NlcnQoZGVhc3NlcnQpIGFwaSBvZiB0aGlzIGNsb2NrIGFw
aSBnaXZlcw0KPiA+ID4gd2FybmluZyBhbmQgdWx0aW1hdGVseSBkb2VzIG5vdCBzdWNjZWVkIHRv
IGFzc2VydChkZWFzc2VydCkuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmF5IEFnYXJ3
YWwgPGphZ2Fyd2FsQG52aWRpYS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IFBhdGNoIGlzIGJhc2Vk
IG9uIHJlbW90ZXMvZ2l0b3Jpb3VzX3RoaWVycnlyZWRpbmdfbGludXgvdGVncmEvbmV4dCBhbmQN
Cj4gc2hvdWxkIGJlIGFwcGxpZWQgb24gdG9wIG9mIHRoaXMuDQo+ID4NCj4gPiBGb3IgdGhpcyBj
aGFuZ2UsIE1pa2UgbWF5IGFzIHdlbGwgYXBwbHkgaXQgZGlyZWN0bHkgdG8gdGhlIGNsb2NrIHRy
ZWUuDQo+ID4gVGhpZXJyeSBjYW4gdGhlbiBwaWNrIGl0IHVwIHdoZW4gaGUgcmViYXNlcyBoaXMg
dGVncmEvbmV4dCB0cmVlLg0KPiA+DQo+ID4gVGhhdCBzYWlkLCBJIGRvbid0IHRoaW5rIHlvdSBz
aG91bGQgbmVlZCBhbnkgb2YgdGhlDQo+ID4gVEVHUkFfQ0xLX0RVUExJQ0FURSgpIGVudHJpZXM7
IHRoZSBQQ0llIGRyaXZlciBzaG91bGQgZ2V0IGl0cyBjbG9ja3MNCj4gPiBmcm9tIGRldmljZSB0
cmVlIG5vdywgYW5kIGhlbmNlIHRoZSBkcml2ZXIgbmFtZSBpbiB0aGUgY2xvY2sNCj4gPiByZWdp
c3RyYXRpb24gc2hvdWxkbid0IGJlIG5lY2Vzc2FyeS4gQWxsIG9mIHRoZXNlDQo+ID4gVEVHUkFf
Q0xLX0RVUExJQ0FURSgpIGVudHJpZXMgc2hvdWxkIGJlIHJlbW92ZWQgZW4gbWFzcyBzb21ldGlt
ZQ0KPiBzb29uDQo+ID4gd2l0aCBsdWNrLiBTbywgY2FuIHlvdSBzaW1wbHkgbGVhdmUgdGhlIHR3
byBURUdSQV9DTEtfRFVQTElDQVRFKCkNCj4gPiBlbnRyaWVzIHVudG91Y2hlZCwgcmF0aGVyIHRo
YW4gY2hhbmdpbmcgdGhlbT8NCj4gDQo+IFBpbmcgb24gdGhpcyBwYXRjaC4gIEkgY2FuIHRha2Ug
aXQgdGhyb3VnaCBteSB0cmVlLCBidXQgaXMgdGhlcmUgZ29pbmcgdG8gYmUNCj4gcmV3b3JrIGJh
c2VkIG9uIFN0ZXBoZW4ncyBjb21tZW50cz8NCg0KSGkgTWlrZSwNCkkgaGF2ZSB1cGxvYWRlZCBu
ZXh0IHZlcnNpb24gVjQgb2YgdGhpcyBwYXRjaCBhZnRlciB0YWtpbmcgY2FyZSBvZiB0aGlzIGNv
bW1lbnQuDQo=
