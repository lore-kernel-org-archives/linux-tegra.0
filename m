From: <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 0/7] add support for clocksource/clockevent DT selection
Date: Thu, 3 Oct 2019 10:43:14 +0000
Message-ID: <187d7020-fbe9-7984-2358-8a70faef019f@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
 <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
 <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
Content-Language: en-US
Content-ID: <51816439DDB2EA498830860703402E31@namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, nsekhar@ti.com, bgolaszewski@baylibre.com, monstr@monstr.eu, john@phrozen.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, lftan@altera.com, tglx@linutronix.de, vgupta@synopsys.com, marc.zyngier@arm.com, patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, shc_work@mail.ru, kgene@kernel.org, krzk@kernel.org, ysato@users.sourceforge.jp, liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, nios2-dev@lists.rocketboards.org, linux-snps-arc@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, linux-amlogic@lists.infradead.org, openbmc@lists.ozlabs.org, linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

DQoNCk9uIDAyLjEwLjIwMTkgMTY6MzUsIENsYXVkaXUgQmV6bmVhIHdyb3RlOg0KPiBIaSBEYW5p
ZWwsDQo+IA0KPiBUYWtpbmcgaW50byBhY2NvdW50IHRoYXQgUm9iIGRvZXNuJ3QgYWdyZWUgd2l0
aCB0aGUgc29sdXRpb24gcHJvcG9zZWQgaW4NCj4gdGhpcyBzZXJpZXMgZG8geW91IHRoaW5rIHRo
ZXJlIGlzIGEgY2hhbmNlIHRvIG1lcmdlIHRoaXMgZHJpdmVyIGFzIGlzPw0KDQpTb3JyeSwgSSB3
YXMgdGFsa2luZyBoZXJlIGFib3V0IHRoZSBkcml2ZXIgYXQgWzFdLg0KDQpbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8xNTUyNTgwNzcyLTg0OTktMS1naXQtc2VuZC1lbWFpbC1jbGF1
ZGl1LmJlem5lYUBtaWNyb2NoaXAuY29tLw0KDQo+IA0KPiBJZiB5b3UgaGF2ZSBvdGhlciBzdWdn
ZXN0aW9uIEkgYW0gb3BlbiB0byB0cnkgaXQuDQo+IA0KPiBUaGFuayB5b3UsDQo+IENsYXVkaXUg
QmV6bmVhDQo+IA0KPiBPbiAyNi4wOS4yMDE5IDExOjQyLCBDbGF1ZGl1IEJlem5lYSB3cm90ZToN
Cj4+DQo+Pg0KPj4gT24gMjUuMDkuMjAxOSAyMDoxOSwgRGFuaWVsIExlemNhbm8gd3JvdGU6DQo+
Pj4gRXh0ZXJuYWwgRS1NYWlsDQo+Pj4NCj4+Pg0KPj4+IEhpIENsYXVkaXUsDQo+Pj4NCj4+PiBP
biAxMC8wOS8yMDE5IDE1OjQ3LCBDbGF1ZGl1IEJlem5lYSB3cm90ZToNCj4+Pj4gSGksDQo+Pj4+
DQo+Pj4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0byBwZXJtaXQgdGhlIHNlbGVjdGlvbiBv
ZiBjbG9ja3NvdXJjZS9jbG9ja2V2ZW50DQo+Pj4+IHZpYSBEVC4NCj4+Pg0KPj4+IFRoYW5rcyBm
b3IgdGhlIHByb3Bvc2FsIGFuZCB0YWtpbmcgY2FyZSBvZiBtYWtpbmcgc29tZSBwcm9ncmVzcyBv
biB0aGlzLg0KPj4+DQo+Pj4gSSBqdXN0IHdhbnRlZCB0byBsZXQgeW91IGtub3cgSSd2ZSBiZWVu
IHRyYXZlbGluZyBidXQgdGhlIHNlcmllcyBpcyBpbg0KPj4+IG15IHBpcGUgYW5kIEkgZGlkIG5v
dCBmb3JnZXQgaXQuIEknbGwgY29tbWVudCBpdCBuZXh0IHdlZWsuDQo+Pg0KPj4gSGkgRGFuaWVs
LA0KPj4NCj4+IE5vIHByb2JsZW0uIFRoYW5rIHlvdSBmb3IgbGV0dGluZyBtZSBrbm93Lg0KPj4N
Cj4+IENsYXVkaXUNCj4+DQo+Pj4NCj4+PiAgLS0gRGFuaWVsDQo+Pj4NCj4+Pg0K
