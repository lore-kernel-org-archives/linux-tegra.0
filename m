From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: Add missing include of linux/erron.h and
 linux/types.h
Date: Tue, 16 Aug 2011 09:27:05 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA25328@HQMAIL01.nvidia.com>
References: <1313471744.5824.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1313471744.5824.2.camel@phoenix>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "Russell King - ARM Linux (linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org)" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

QXhlbCBMaW4gd3JvdGUgYXQgTW9uZGF5LCBBdWd1c3QgMTUsIDIwMTEgMTE6MTYgUE06DQo+IElu
Y2x1ZGUgbGludXgvZXJyb24uaCB0byBmaXggYmVsb3cgYnVpbGQgZXJyb3IuDQouLi4NCj4gSW5j
bHVkZSBsaW51eC90eXBlcy5oIHRvIGZpeCBiZWxvdyBidWlsZCBlcnJvci4NCi4uLg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBeGVsIExpbiA8YXhlbC5saW5AZ21haWwuY29tPg0KPiAtLS0NCj4gVGhpcyBw
YXRjaCBpcyBhZ2FpbnN0IGxpbnV4LW5leHQgKG5leHQtMjAxMTA4MTUpLCBpdCBmaXhlcyB0aGUg
YnVpbGQgZXJyb3Igd2l0aCAibWFrZQ0KPiB0ZWdyYV9kZWZjb25maWciLg0KDQpBeGVsLA0KDQpJ
IHBvc3RlZCB0aGlzIHNhbWUgdGhpbmcgYSBsaXR0bGUgd2hpbGUgYmFjay4gUnVzc2VsbCBhc2tl
ZCBtZSB0byBwZXJmb3JtDQpzb21lIHJld29yayBvbiBncGlvLmggdGhhdCByZW1vdmVkIHRoZSBu
ZWVkIGZvciBlcnJuby5oIGluc3RlYWQuIEkgZGlkDQp0aGF0IGluOg0KDQpodHRwOi8vd3d3LnNw
aW5pY3MubmV0L2xpc3RzL2xpbnV4LXRlZ3JhL21zZzAxOTk2Lmh0bWwNCg0KSSdtIGp1c3Qgd2Fp
dGluZyBmb3IgYW4gQWNrIGZyb20gR3JhbnQgTGlrZWx5IG9uIHRoZSBHUElPIGRyaXZlciBjaGFu
Z2VzLA0KYW5kIHRoZW4gd2lsbCBwbGFjZSB0aGUgc2VyaWVzIGludG8gdGhlIEFSTSBwYXRjaCBz
eXN0ZW0gYXMgUnVzc2VsbA0KcmVxdWVzdGVkLg0KDQpUaGFua3MgZm9yIGNhcmluZyBhYm91dCBU
ZWdyYSBjb21waWxlIGlzc3VlczotKQ0KDQotLSANCm52cHVibGljDQoNCg==
