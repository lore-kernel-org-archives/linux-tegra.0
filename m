From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Date: Wed, 5 Feb 2020 11:17:04 +0000
Message-ID: <VI1PR04MB5327AF1B75732C9E24988A2F8B020@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20200127023548.27107-1-pgwipeout@gmail.com>
 <20200131052716.GA30672@b29397-desktop>
 <CAMdYzYqwz9HLsjvc1hDmovzWqiV_Vswe57d_gWhwBnvb2aNPyQ@mail.gmail.com>
 <20200201061330.GA9178@b29397-desktop>
 <CAMdYzYrbvsTunwxJLcC_-ZhczsQfyDLOjTnZ+eorb325qO-QhA@mail.gmail.com>
 <20200204074419.GA6681@b29397-desktop>
 <CAMdYzYo8Vgw8h=LtfLnQNF4j-rVzgKJTp1hCyf7BFKrdhAhAHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMdYzYo8Vgw8h=LtfLnQNF4j-rVzgKJTp1hCyf7BFKrdhAhAHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

IA0KPiA+ID4gPiBTZWNvbmQsIHlvdSBtYXkgY2hlY2sgaWYgdG91Y2ggb3Rnc2Mgd2lsbCBoYW5n
IG9yIGRlYWRsb2NrIHRoZSBzeXN0ZW0uDQo+ID4gPiA+IElmIHlvdSBjYW4ndCB0b3VjaCBvdGdz
YyB3aGVuIHBvcnRzYy5waGNkID0gMCwgeW91IG1heSBuZWVkIHRoZQ0KPiA+ID4gPiBmbGFnIENJ
X0hEUkNfRFVBTF9ST0xFX05PVF9PVEcsIGFmYWlrLCBmZXcgU29DcyBjYW4ndCB0b3VjaCBvdGdz
Yw0KPiA+ID4gPiBpZiBpdCBzdXBwb3J0cyBkdWFsLXJvbGUuDQo+ID4gPg0KPiA+ID4gSSBhZGRl
ZCBzb21lIHRyYWNlcyB0byB0aGUgZHJpdmVyLCBhbmQgaXQgZG9lc24ndCBhY3R1YWxseSBhcHBl
YXIgdG8NCj4gPiA+IGJlIGEgcmVnaXN0ZXIgcmVhZC93cml0ZSB0aGF0IGlzIGJyZWFraW5nIHRo
aW5ncy4gKE5vdCBkaXJlY3RseQ0KPiA+ID4gYW55d2F5cykuDQo+ID4gPiBUaGUgaGFuZyBvY2N1
cnMgYWZ0ZXIgaXQgZW51bWVyYXRlcyB0aGUgdXNiIGdhZGdldHMgYW5kIGh1Yi4NCj4gPiA+IFN0
aWxsIHRyeWluZyB0byB0cmFjayBkb3duIGV4YWN0bHkgd2hlcmUgdGhlIGhhbmcgb2NjdXJzLg0K
PiA+ID4NCj4gPg0KPiA+IFRyeSB0byBzZWUgaWYgaXQgaXMgcmVsYXRlZCB0byBydW50aW1lIHBv
d2VyIG1hbmFnZW1lbnQuDQo+IA0KPiBUaGF0J3MgaXQhDQo+IFRoZXJlIGRvZXNuJ3QgYXBwZWFy
IHRvIGJlIGEgbWV0aG9kIHRvIGRpc2FibGUgUE0gaW5zaWRlIHRoZSBjaGlwaWRlYSBkcml2ZXIu
DQo+IERvIHlvdSBoYXZlIGEgc3VnZ2VzdGlvbiBvbiBob3cgdG8gZG8gaXQsIGFzaWRlIGZyb20g
dGhlIGdsb2JhbCBtZXRob2Q/DQo+IA0KIA0KDQpTZWUgZHJpdmVycy91c2IvY2hpcGlkZWEvY2lf
aGRyY19pbXguYyBmb3IgcmVmZXJlbmNlIHBsZWFzZS4NCg0KUGV0ZXINCg==
