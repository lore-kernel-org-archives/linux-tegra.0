From: JinGoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH] video: Add a callback 'notify_after' for backlight control
Date: Tue, 09 Aug 2011 08:32:45 +0000 (GMT)
Message-ID: <7656563.495631312878759566.JavaMail.weblogic@epml12>
Reply-To: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
MIME-version: 1.0
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org" <lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>, "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "jnien-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <jnien-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBsaW51eC1mYmRldi1vd25lckB2
Z2VyLmtlcm5lbC5vcmcgW21haWx0bzpsaW51eC1mYmRldi0NCj4gb3duZXJAdmdlci5rZXJuZWwu
b3JnXSBPbiBCZWhhbGYgT2YgZGlsZWVAbnZpZGlhLmNvbQ0KPiBTZW50OiBUdWVzZGF5LCBBdWd1
c3QgMDksIDIwMTEgMTE6MzAgQU0NCj4gVG86IHJwdXJkaWVAcnBzeXMubmV0OyBsZXRoYWxAbGlu
dXgtc2gub3JnOyBha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnOw0KPiBhcnVuLm11cnRoeUBzdGVy
aWNzc29uLmNvbTsgcm1vcmVsbEBudmlkaWEuY29tOw0KPiBsaW51cy53YWxsZWlqQHN0ZXJpY3Nz
b24uY29tDQo+IENjOiBqbmllbkBudmlkaWEuY29tOyBzd2FycmVuQG52aWRpYS5jb207IGxpbnV4
LWZiZGV2QHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsg
bGludXgtdGVncmFAdmdlci5rZXJuZWwub3JnOyBEaWxhbiBMZWUNCj4gU3ViamVjdDogW1BBVENI
XSB2aWRlbzogQWRkIGEgY2FsbGJhY2sgJ25vdGlmeV9hZnRlcicgZm9yIGJhY2tsaWdodA0KPiBj
b250cm9sDQo+IA0KPiBGcm9tOiBEaWxhbiBMZWUgPGRpbGVlQG52aWRpYS5jb20+DQo+IA0KPiBX
ZSBuZWVkIGEgY2FsbGJhY2sgdG8gZG8gc29tZSB0aGluZ3MgYWZ0ZXIgcHdtX2VuYWJsZSwgcHdt
X2Rpc2FibGUNCj4gYW5kIHB3bV9jb25maWcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEaWxhbiBM
ZWUgPGRpbGVlQG52aWRpYS5jb20+DQoNClJldmlld2VkLWJ5OiBKaW5nb28gSGFuIDxqZzEuaGFu
QHNhbXN1bmcuY29tPg0KDQpJIHJldmlld2VkIGFuZCB0ZXN0ZWQgdGhlIHBhdGNoLg0KSXQgd29y
a3MgcHJvcGVybHkuDQoNClRoYW5rcywNCkppbmdvbyBIYW4NCg0K
