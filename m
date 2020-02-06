From: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>
Subject: RE: [PATCH v2 4/9] ASoC: tegra: add Tegra210 based I2S driver
Date: Thu, 6 Feb 2020 17:06:47 +0000
Message-ID: <90ae7badcb3441daa8144233de8f6825@AcuMS.aculab.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-5-git-send-email-spujar@nvidia.com>
 <3a586a6b-5f53-dc44-b9fc-67c633c626ef@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3a586a6b-5f53-dc44-b9fc-67c633c626ef-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Dmitry Osipenko' <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "perex-/Fr2/VpizcU@public.gmane.org" <perex-/Fr2/VpizcU@public.gmane.org>, "tiwai-IBi9RG/b67k@public.gmane.org" <tiwai-IBi9RG/b67k@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogZiBEbWl0cnkgT3NpcGVua28NCj4gU2VudDogMDYgRmVicnVhcnkgMjAyMCAxNjo1OQ0K
PiANCj4gMzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6DQo+IC4uLg0K
PiA+ICtzdGF0aWMgY29uc3QgaW50IHRlZ3JhMjEwX2NpZl9mbXRbXSA9IHsNCj4gPiArCTAsDQo+
ID4gKwlURUdSQV9BQ0lGX0JJVFNfMTYsDQo+ID4gKwlURUdSQV9BQ0lGX0JJVFNfMzIsDQo+ID4g
K307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3QgaW50IHRlZ3JhMjEwX2kyc19iaXRfZm10W10g
PSB7DQo+ID4gKwkwLA0KPiA+ICsJSTJTX0JJVFNfMTYsDQo+ID4gKwlJMlNfQklUU18zMiwNCj4g
PiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBpbnQgdGVncmEyMTBfaTJzX3NhbXBsZV9z
aXplW10gPSB7DQo+ID4gKwkwLA0KPiA+ICsJMTYsDQo+ID4gKwkzMiwNCj4gPiArfTsNCj4gDQo+
IHN0YXRpYyBjb25zdCAqdW5zaWduZWQqIGludD8NCg0KT3IgZ2V0IHJpZCBvZiB0aGUgdGFibGUg
bG9va3VwcyBjb21wbGV0ZWx5Lg0KQXNzdW1pbmcgdGhlIGluZGV4IGlzIG5ldmVyIHplcm8gdGhl
biB0aGUgdmFsdWUNCmNhbiBiZSBjYWxjdWxhdGVkIGFzIChjb25zdF9hICsgY29uc3RfYiAqIGlu
ZGV4KS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxl
eSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0
aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==
