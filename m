From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 1/3] ARM: Tegra: Device Tree Support: Update how sdhci
 devices	are initialized
Date: Wed, 11 May 2011 21:13:31 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04986AA2C2@HQMAIL01.nvidia.com>
References: <20110511231905.10362.12844.stgit@riker>
 <20110511232637.10362.84551.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110511232637.10362.84551.stgit@riker>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-a
Cc: "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Sm9obiBCb25lc2lvIHdyb3RlIGF0IFdlZG5lc2RheSwgTWF5IDExLCAyMDExIDU6MjcgUE06DQo+
IFRoaXMgcGF0Y2ggY2hhbmdlcyBob3cgc2RoY2kgZGV2aWNlcyBhcmUgaW5pdGlhbGl6ZWQgc28g
dGhhdCBhIGxhdGVyIHBhdGNoIGNhbg0KPiBlYXNpbHkgYWRkIHN1cHBvcnQgZm9yIGkyYyBkZXZp
ZXMuDQo+Li4uDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXRlZ3JhL2JvYXJkLWR0LmMg
Yi9hcmNoL2FybS9tYWNoLXRlZ3JhL2JvYXJkLWR0LmMNCj4uLi4NCj4gKyNpbmNsdWRlIDxtYWNo
L3NkaGNpLmg+DQo+Li4uDQo+ICsjaW5jbHVkZSAiZ3Bpby1uYW1lcy5oIg0KDQpJIGRvbid0IHRo
aW5rIGVpdGhlciBvZiB0aG9zZSBoZWFkZXJzIGFyZSBuZWVkZWQgYW55IG1vcmUuDQoNCk90aGVy
d2lzZSwgbG9va3MgZ29vZC4NCg0KLS0gDQpudnB1YmxpYw0KDQo=
