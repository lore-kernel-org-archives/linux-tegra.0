From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v1 4/9] ARM: tegra: Enable UDC on TrimSlice
Date: Thu, 6 Jul 2017 12:51:37 +0000
Message-ID: <1499345493.4445.12.camel@toradex.com>
References: <cover.1499273075.git.digetx@gmail.com>
         <82321d32d968c6b9481a77fbecae8c0756d37f0f.1499273075.git.digetx@gmail.com>
         <20170706012409.GD24420@b29397-desktop>
         <d23f841a-f46d-bf3f-cdb6-9d9c033e80bd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d23f841a-f46d-bf3f-cdb6-9d9c033e80bd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Content-ID: <A8F76B76A29FBF47BA473EDFB8621E35-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "marvin24-Mmb7MZpHnFY@public.gmane.org" <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-usb-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "Peter.Chen-3arQi8VN3Tc@public.gmane.org" <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCAyMDE3LTA3LTA2IGF0IDEzOjI0ICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
DQo+IE9uIDA2LjA3LjIwMTcgMDQ6MjQsIFBldGVyIENoZW4gd3JvdGU6DQo+ID4gT24gV2VkLCBK
dWwgMDUsIDIwMTcgYXQgMDg6MTk6NTNQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOg0K
PiA+ID4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmctRERtTE0xK2FkY3JRVDBkWlIrQWxm
QUBwdWJsaWMuZ21hbmUNCj4gPiA+IC5vcmc+DQo+ID4gPiANCj4gPiA+IE92ZXJyaWRlIHRoZSBj
b21wYXRpYmxlIHN0cmluZyBvZiB0aGUgZmlyc3QgVVNCIGNvbnRyb2xsZXIgdG8NCj4gPiA+IGVu
YWJsZQ0KPiA+ID4gZGV2aWNlIG1vZGUuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFRo
aWVycnkgUmVkaW5nIDx0cmVkaW5nLUREbUxNMSthZGNyUVQwZFpSK0FsZkFAcHViDQo+ID4gPiBs
aWMuZ21hbmUub3JnPg0KPiA+ID4gLS0tDQo+ID4gPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL3RlZ3Jh
MjAtdHJpbXNsaWNlLmR0cyB8IDIgKysNCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvdGVn
cmEyMC10cmltc2xpY2UuZHRzDQo+ID4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMjAtdHJp
bXNsaWNlLmR0cw0KPiA+ID4gaW5kZXggYjkwMmFiNTk0YWZhLi45NmI0ZjNmOTgyN2IgMTAwNjQ0
DQo+ID4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy90ZWdyYTIwLXRyaW1zbGljZS5kdHMNCj4g
PiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMjAtdHJpbXNsaWNlLmR0cw0KPiA+ID4g
QEAgLTMzNiw3ICszMzYsOSBAQA0KPiA+ID4gwqAJfTsNCj4gPiA+IMKgDQo+ID4gPiDCoAl1c2JA
YzUwMDAwMDAgew0KPiA+ID4gKwkJY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmEyMC11ZGMiOw0K
PiA+ID4gwqAJCXN0YXR1cyA9ICJva2F5IjsNCj4gPiA+ICsJCWRyX21vZGUgPSAib3RnIjsNCj4g
PiANCj4gPiBJZiB0aGlzIGJvYXJkIHN1cHBvcnRzIHBlcmlwaGVyYWwtb25seSwgeW91IG5lZWQg
dG8NCj4gPiBzZXQgZHJfbW9kZSBhcyAicGVyaXBoZXJhbCIuDQo+ID4gDQo+IA0KPiBJdCBzaG91
bGQgc3VwcG9ydCBPVEcsIGJ1dCB3ZSBhcmVuJ3QgZ29pbmcgdG8gaW1wbGVtZW50IHRoZSBob3N0
IG1vZGUNCj4gc3dpdGNoIGZvcg0KPiBub3cuIFN0ZXBoZW4gY2xhaW1zIHRoYXQgdGhlIGhvc3Qg
bW9kZSBpcyB3b3JraW5nIHdpdGggdGhlIHRlZ3JhLWVoY2kgDQo+IGRyaXZlciwgaXQNCj4gd291
bGQgYmUgbmljZSBpZiBhbnlvbmUgY291bGQgY29uZmlybSB0aGlzLg0KDQpJIGNhbiBjb25maXJt
IHRoYXQgb24gQ29saWJyaSBUMjAsIEFwYWxpcy9Db2xpYnJpIFQzMCBhbmQgQXBhbGlzIFRLMQ0K
aG9zdCBtb2RlIHdvcmtzIGp1c3QgZmluZSB3aXRoIHRoZSByZWd1bGFyIHRlZ3JhLWVoY2kgZHJp
dmVyLg0KDQpJJ20gYWJvdXQgdG8gZ2l2ZSB5b3VyIHBhdGNoIHNldCBhIHRyeSBvbiB0aG9zZSBi
b2FyZHMgYXMgd2VsbCBhbmQgd2lsbA0KZ2l2ZSBmdXJ0aGVyIGZlZWRiYWNrLg==
