From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/5 V2] ARM: tegra: paz00: add clocks required for usb
 operation
Date: Tue, 9 Aug 2011 11:35:45 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04A0687335@HQMAIL01.nvidia.com>
References: <cover.1312735430.git.marvin24@gmx.de>
 <76f31183766f1edce1230a925ced1c986dbdf028.1312742856.git.marvin24@gmx.de>
 <201108092029.17546.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201108092029.17546.marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

TWFyYyBEaWV0cmljaCB3cm90ZSBhdCBUdWVzZGF5LCBBdWd1c3QgMDksIDIwMTEgMTI6MjkgUE06
DQo+IFRoZXNlIGNsb2NrcyBhcmUgcmVxdWlyZWQgZm9yIHVzYiBvcGVyYXRpb24uDQo+IC0tLQ0K
PiAgYXJjaC9hcm0vbWFjaC10ZWdyYS9ib2FyZC1wYXowMC5jIHwgICAgNiArKysrKysNCj4gIDEg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtdGVncmEvYm9hcmQtcGF6MDAuYyBiL2FyY2gvYXJtL21h
Y2gtdGVncmEvYm9hcmQtcGF6MDAuYw0KPiBpbmRleCA0NTExMWY2Li44OWEzZGRhIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL2FybS9tYWNoLXRlZ3JhL2JvYXJkLXBhejAwLmMNCj4gKysrIGIvYXJjaC9h
cm0vbWFjaC10ZWdyYS9ib2FyZC1wYXowMC5jDQo+IEBAIC0xNDUsNiArMTQ1LDEyIEBAIHN0YXRp
YyBfX2luaXRkYXRhIHN0cnVjdCB0ZWdyYV9jbGtfaW5pdF90YWJsZSBwYXowMF9jbGtfaW5pdF90
YWJsZVtdID0gew0KPiAgCS8qIG5hbWUJCXBhcmVudAkJcmF0ZQkJZW5hYmxlZCAqLw0KPiAgCXsg
InVhcnRhIiwJInBsbF9wIiwJMjE2MDAwMDAwLAl0cnVlIH0sDQo+ICAJeyAidWFydGQiLAkicGxs
X3AiLAkyMTYwMDAwMDAsCXRydWUgfSwNCj4gKw0KPiArCXsgInBsbF9wX291dDQiLAkicGxsX3Ai
LAkyNDAwMDAwMCwJdHJ1ZSB9LA0KDQpEbyB5b3UgbmVlZCB0aGUgcGxsX3Bfb3V0NCBlbnRyeT8g
V2hhdCdzIHRoYXQgZHJpdmluZz8gQ2hlY2sgaW4NCi9zeXMva2VybmVsL2RlYnVnL2Nsb2NrL2Ns
b2NrX3RyZWUgKC9zeXMva2VybmVsL2RlYnVnIGlzIGRlYnVnZnMpLg0KDQotLSANCm52cHVibGlj
DQoNCg==
