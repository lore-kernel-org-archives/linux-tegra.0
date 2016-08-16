From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v4 0/3] ASoC/ARM: tegra: apalis t30/tk1/colibri t30:
 sgtl5000 audio
Date: Tue, 16 Aug 2016 13:55:28 +0000
Message-ID: <1471355726.4197.6.camel@toradex.com>
References: <1466298002-12576-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1466298002-12576-1-git-send-email-marcel.ziswiler@toradex.com>
Content-Language: en-US
Content-ID: <70A6365D2B87604AACE26E962D53577E@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "prarit@redhat.com" <prarit@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "broonie@kernel.org" <broonie@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "ttynkkynen@nvidia.com" <ttynkkynen@nvidia.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "perex@perex.cz" <perex@perex.cz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

T24gU3VuLCAyMDE2LTA2LTE5IGF0IDAyOjU5ICswMjAwLCBNYXJjZWwgWmlzd2lsZXIgd3JvdGU6
DQo+IFRoaXMgc2VyaWVzIGFkZHMvaW50ZWdyYXRlcyBGcmVlc2NhbGUgU0dUTDUwMDAgYW5hbG9n
dWUgYXVkaW8gY29kZWMNCj4gc3VwcG9ydC4NCj4gDQo+IENoYW5nZXMgaW4gdjQ6DQo+IC0gc2lt
cGxlLWF1ZGlvLWNhcmQgZG9lcyBzdGlsbCBub3QgYWxsb3cgZm9yIG1vcmUgYWR2YW5jZWQgdXNl
IGNhc2VzDQo+IMKgIGxpa2UgVGVncmEgU29Dcw0KPiAtIGZ1cnRoZXIgcGxhdGZvcm0gZHJpdmVy
cyBoYXZlIGJlZW4gYWNjZXB0ZWQgc2luY2UgbXkgbGFzdCBhdHRlbXB0DQo+IMKgIChlLmcuIHJ0
NTY3NyBvbmUpDQo+IC0gcmVsZXZhbmNlIGZvciBvbmUgZnVydGhlciBib2FyZCB0aGUgbmV3IFRv
cmFkZXggQXBhbGlzIFRLMQ0KPiAtIGRyb3AgdW51c2VkIHNvdW5kL2phY2suaCBpbmNsdWRlDQo+
IC0gaW4gdGVncmFfc2d0bDUwMDBfZHJpdmVyX3JlbW92ZSgpIHBhc3MgcmV0dXJuIHZhbHVlIG9m
DQo+IMKgIHNuZF9zb2NfdW5yZWdpc3Rlcl9jYXJkKCkgb24gdG8gY2FsbGVyDQo+IC0gbm8gbG9u
Z2VyIHNldCBvd25lciBwcm9wZXJ0eSBpbiBwbGF0Zm9ybV9kcml2ZXIgdG8gVEhJU19NT0RVTEUN
Cj4gLSByZS1iYXNlZC9yZXNlbmQNCj4gDQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gcmV2ZXJ0IHRv
IG5vdCB1c2luZyBzaW1wbGUtYXVkaW8tY2FyZCBiZWluZyBpbmNvbXBhdGlibGUgd2l0aCB0ZWdy
YQ0KPiAtIHJlYmFzZWQgdG8gZm9yLW5leHQNCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gdXNp
bmcgc2ltcGxlLWF1ZGlvLWNhcmQgYXMgc3VnZ2VzdGVkIGJ5IEZhYmlvDQo+IA0KPiBNYXJjZWwg
Wmlzd2lsZXIgKDMpOg0KPiDCoCBBU29DOiB0ZWdyYTogYWRkIHRlZ3JhIHNndGw1MDAwIG1hY2hp
bmUgZHJpdmVyDQo+IMKgIEFSTTogdGVncmE6IGFwYWxpcy9jb2xpYnJpIHQzMDogaW50ZWdyYXRl
IGF1ZGlvDQo+IMKgIEFSTTogdGVncmE6IGVuYWJsZSBzZ3RsNTAwMCBhdWRpbw0KPiANCj4gwqAu
Li4vYmluZGluZ3Mvc291bmQvbnZpZGlhLHRlZ3JhLWF1ZGlvLXNndGw1MDAwLnR4dCB8wqDCoDQy
ICsrKysNCj4gwqBhcmNoL2FybS9ib290L2R0cy90ZWdyYTMwLWFwYWxpcy5kdHNpwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHzCoMKgNDkgKysrKysNCj4gwqBhcmNoL2FybS9ib290L2R0cy90
ZWdyYTMwLWNvbGlicmkuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfMKgwqA0OSArKysr
Kw0KPiDCoGFyY2gvYXJtL2NvbmZpZ3MvdGVncmFfZGVmY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB8wqDCoMKgMSArDQo+IMKgc291bmQvc29jL3RlZ3JhL0tjb25m
aWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHzCoMKgMTEgKysNCj4gwqBzb3VuZC9zb2MvdGVncmEvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB8wqDCoMKgMiArDQo+IMKgc291
bmQvc29jL3RlZ3JhL3RlZ3JhX3NndGw1MDAwLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHwgMjEyDQo+ICsrKysrKysrKysrKysrKysrKysrKw0KPiDCoDcgZmlsZXMgY2hh
bmdlZCwgMzY2IGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL252aWRpYSx0ZWdyYS1hdWRpby0NCj4g
c2d0bDUwMDAudHh0DQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy90ZWdyYS90ZWdy
YV9zZ3RsNTAwMC5jDQoNCldpdGggTWFyayBmaW5hbGx5IGhhdmluZyBwdWxsZWQgdGhlIGZpcnN0
IHBhdGNoIG9mIHRoaXMgc2VyaWVzIChodHRwczovDQovbGttbC5vcmcvbGttbC8yMDE2LzgvMTUv
Mjk3KSBJJ20gd29uZGVyaW5nIHdoZXRoZXIgdGhlIHNlY29uZCBhbmQNCnRoaXJkIHBhdGNoIGFy
ZSBub3cgYmVpbmcgcHVsbGVkIHZpYSB0ZWdyYSB0cmVlPyBPciBzaG91bGQgSSByYXRoZXIgcmUt
DQpzdWJtaXQgdGhvc2UgYXMgYSBuZXcgdjUgcGF0Y2ggc2V0PwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
