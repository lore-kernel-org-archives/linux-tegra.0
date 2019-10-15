From: <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 0/7] add support for clocksource/clockevent DT selection
Date: Tue, 15 Oct 2019 09:23:35 +0000
Message-ID: <7071b6fa-f7ed-c879-4a43-44100dbe6121@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
 <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
 <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
 <187d7020-fbe9-7984-2358-8a70faef019f@microchip.com>
 <14df6e5d-19ef-4ebc-fd11-9953bc3fc44e@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <14df6e5d-19ef-4ebc-fd11-9953bc3fc44e@linaro.org>
Content-Language: en-US
Content-ID: <BFEA965B7AA9B54388AC67448362747B@namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, nsekhar@ti.com, bgolaszewski@baylibre.com, monstr@monstr.eu, john@phrozen.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, lftan@altera.com, tglx@linutronix.de, vgupta@synopsys.com, marc.zyngier@arm.com, patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, shc_work@mail.ru, kgene@kernel.org, krzk@kernel.org, ysato@users.sourceforge.jp, liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, nios2-dev@lists.rocketboards.org, linux-snps-arc@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, linux-amlogic@lists.infradead.org, openbmc@lists.ozlabs.org, linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

SGkgRGFuaWVsLA0KDQpPbiAxMy4xMC4yMDE5IDIxOjE2LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToN
Cj4gSGkgQ2xhdWRpdSwNCj4gDQo+IHNvcnJ5IGZvciB0aGUgZGVsYXksIEkgd2FzIE9vTyBhZ2Fp
bi4NCg0KTm8gcHJvYmxlbSwgdGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lg0KDQo+IA0KPiBPbiAw
My8xMC8yMDE5IDEyOjQzLCBDbGF1ZGl1LkJlem5lYUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4N
Cj4+DQo+PiBPbiAwMi4xMC4yMDE5IDE2OjM1LCBDbGF1ZGl1IEJlem5lYSB3cm90ZToNCj4+PiBI
aSBEYW5pZWwsDQo+Pj4NCj4+PiBUYWtpbmcgaW50byBhY2NvdW50IHRoYXQgUm9iIGRvZXNuJ3Qg
YWdyZWUgd2l0aCB0aGUgc29sdXRpb24gcHJvcG9zZWQgaW4NCj4+PiB0aGlzIHNlcmllcyBkbyB5
b3UgdGhpbmsgdGhlcmUgaXMgYSBjaGFuY2UgdG8gbWVyZ2UgdGhpcyBkcml2ZXIgYXMgaXM/DQo+
Pg0KPj4gU29ycnksIEkgd2FzIHRhbGtpbmcgaGVyZSBhYm91dCB0aGUgZHJpdmVyIGF0IFsxXS4N
Cj4+DQo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNTUyNTgwNzcyLTg0OTkt
MS1naXQtc2VuZC1lbWFpbC1jbGF1ZGl1LmJlem5lYUBtaWNyb2NoaXAuY29tLw0KPiANCj4gRGFt
biEgNyBtb250aHMgb2xkLiBJJ20gdHJ1bHkgc29ycnkgd2UgZG8gbm90IGhhdmUgcHJvZ3Jlc3Mg
b24gdGhpcy4gTGV0DQo+IGZpeCB0aGlzIG9uY2UgYW5kIGZvciBhbGwuDQo+IA0KPiBJbiB0aGUg
ZHJpdmVyOg0KPiANCj4gcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImNsb2NrLWZy
ZXF1ZW5jeSIsICZmcmVxKTsNCj4gDQo+IEl0IGlzIHVuY2xlYXIgaG93IGlzIHVzZWQgdGhpcyBw
cm9wZXJ0eS4gSXQgc2hvdWxkIGJlIHRoZSBmcmVxdWVuY3kNCj4gZHJpdmluZyB0aGUgdGltZXIs
IGJ1dCBjYW4gd2UgZ2V0IGZyb20gYSBjbGtfZ2V0X3JhdGUoKSBhbmQgYSBmaXhlZCBkaXZpZGVy
Pw0KPiANCg0KVGhlIHRpbWVyIGNvdWxkIGJlIGRyaXZlbiBieSAyIGNsb2NrIHNvdXJjZXMsIG9u
ZSBpcyBjYWxsZWQgcGVyaXBoZXJhbA0KY2xvY2sgYW5kIGlzIHRoZSBjbG9jayB0aGF0IGlzIGFs
c28gZHJpdmluZyB0aGUgSVAgaXRzZWxmLCBhbmQgb25lIGlzDQpjYWxsZWQgZ2VuZXJpYyBjbG9j
ayAodGhpcyBjb3VsZCBkcml2ZSBvbmx5IHRoZSB0aW1lciBpdHNlbGYpIGFuZCBzaG91bGQgYmUN
CmF0IGxlYXN0IDMgdGltZXMgbG93ZXIgdGhhbiB0aGUgcGVyaXBoZXJhbCBjbG9jay4NCg0KV2Ug
Y291bGQgY2hvb3NlIHRoZSBjbG9jayBkcml2aW5nIHRoZSB0aW1lciBieSBzZXR0aW5nIHRoZSBQ
SVQ2NEJfTVIuU0dDTEsNCmJpdCAoMCAtIG1lYW5zIHRoZSB0aW1lciBpdHNlbGYgaXMgZHJpdmVu
IGJ5IHBlcmlwaGVyYWwgY2xvY2ssIDEgLSBtZWFucw0KdGhlIHRpbWVyIGlzIGRyaXZlbiBieSB0
aGUgZ2VuZXJpYyBjbG9jaykuDQoNClRoZSB0aW1lciBjbG9jayBzb3VyY2UgY291bGQgYmUgZGl2
aWRlZCBieSBNUi5QUkVTICsgMS4NCg0KU28sIEkgdXNlZCB0aGUgY2xvY2stZnJlcXVlbmN5IERU
IGJpbmRpbmcgdG8gbGV0IHVzZXIgY2hvb3NlIHRoZSB0aW1lcidzDQpmcmVxdWVuY3kuIEJhc2Vk
IG9uIHRoZSB2YWx1ZSBwcm92aWRlZCB2aWEgdGhpcyBEVCBiaW5kaW5nIHRoZSBiZXN0IGNsb2Nr
DQpzb3VyY2UgYW5kIHByZXNjYWxlciBpcyBjaG9zZW4gdmlhIG1jaHBfcGl0NjRiX3ByZXNfcHJl
cGFyZSgpIGZ1bmN0aW9uLg0KDQpBcyB0aGUgZGF0YXNoZWV0IGZvciB0aGUgcHJvZHVjdCB0aGF0
IGlzIHVzaW5nIHRoaXMgSVAgaXMgb3BlbiBub3csIEknbQ0KaW5zZXJ0aW5nIGhlcmUgYSBsaW5r
IHRvIGl0IFsxXS4NCg0KVGhhbmsgeW91LA0KQ2xhdWRpdSBCZXpuZWENCg0KWzFdDQpodHRwOi8v
d3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2VuL0RldmljZURvYy9TQU05WDYwLURhdGEtU2hl
ZXQtRFM2MDAwMTU3OUEucGRmDQoNCj4gDQo=
