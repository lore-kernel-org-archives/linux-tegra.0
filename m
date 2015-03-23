From: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V2 1/3] gpu: host1x: Reduce host1x job allocation size
Date: Mon, 23 Mar 2015 19:39:07 +0000
Message-ID: <2253e92cd45c4b33913a45011c4ce823@HQMAIL102.nvidia.com>
References: <1425606712-15986-1-git-send-email-davidu@nvidia.com>
 <0e36c4295adc4f2daae9715cd0dde87d@HQMAIL102.nvidia.com>
 <CAAVeFuK4NOrfCcX846rgPdViR6Ur4pSrrVihiV7KP1kRf15kdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuK4NOrfCcX846rgPdViR6Ur4pSrrVihiV7KP1kRf15kdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Alexandre Courbot' <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRyZSBDb3VyYm90
IFttYWlsdG86Z251cm91QGdtYWlsLmNvbV0NCj4gU2VudDogTW9uZGF5LCBNYXJjaCAyMywgMjAx
NSAxMjowOSBBTQ0KPiBUbzogRGF2aWQgVW5nDQo+IENjOiBhaXJsaWVkQGxpbnV4LmllOyBsaW51
eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7DQo+IHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbTsgc3dh
cnJlbkB3d3dkb3Rvcmcub3JnOyBBcnRvIE1lcmlsYWluZW47DQo+IFRlcmplIEJlcmdzdHJvbQ0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDEvM10gZ3B1OiBob3N0MXg6IFJlZHVjZSBob3N0MXgg
am9iIGFsbG9jYXRpb24gc2l6ZQ0KPiANCj4gVGhlIHNlcmllcyBsb29rcyBvayB0byBtZSwgdGhl
IG9ubHkgcHJvYmxlbSBJIHNlZSBpcyB0aGF0IHdlIGFyZSBsYWNraW5nDQo+IG1lYW5zIHRvIHRo
b3JvdWdobHkgdGVzdCBob3N0MXggcGF0Y2hlcyBhY3Jvc3MgYWxsIHRoZSBzdXBwb3J0ZWQgVGVn
cmENCj4gY2hpcHMuDQo+IA0KPiBDb3VsZCB5b3UgZGV0YWlsIHdoYXQga2luZCBvZiB0ZXN0aW5n
IHRoaXMgcGF0Y2ggc2VyaWVzIGhhcyB1bmRlcmdvbmUsIGFuZA0KPiB3aGljaCBjaGlwcy9ib2Fy
ZHMgaGF2ZSBiZWVuIHRlc3RlZD8NCg0KVGVzdGVkIHRoZSBob3N0MXggY2hhbm5lbCB0ZXN0cyBm
b3IgVDEzMiBvbiBBNDQuDQpBbHNvIHJhbiBQYXVsJ3MgRUlNVCBzZXQgdXAgd2hpY2ggb25seSB0
ZXN0cyBib290aW5nIGtlcm5lbCB0byBjb25zb2xlIGZvciBUMjAvVDMwL1QxMTQvVDEyNCBhbmQg
UUVNVQ0KDQo=
