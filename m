From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 0/7] add support for clocksource/clockevent DT selection
Date: Fri, 18 Oct 2019 22:24:32 +0200
Message-ID: <8e9f709f-2ded-c666-26e0-9235d6107c34@linaro.org>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
 <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
 <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
 <187d7020-fbe9-7984-2358-8a70faef019f@microchip.com>
 <14df6e5d-19ef-4ebc-fd11-9953bc3fc44e@linaro.org>
 <7071b6fa-f7ed-c879-4a43-44100dbe6121@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <7071b6fa-f7ed-c879-4a43-44100dbe6121@microchip.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Claudiu.Beznea@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, nsekhar@ti.com, bgolaszewski@baylibre.com, monstr@monstr.eu, john@phrozen.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, lftan@altera.com, tglx@linutronix.de, vgupta@synopsys.com, marc.zyngier@arm.com, patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, shc_work@mail.ru, kgene@kernel.org, krzk@kernel.org, ysato@users.sourceforge.jp, liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, baohua@kernel.org, Nicolas.Ferre@microchip.com, alexandre.belloni@bo
Cc: uclinux-h8-devel@lists.sourceforge.jp, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-oxnas@groups.io, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org, nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

CkhpIENsYXVkaXUsCgpPbiAxNS8xMC8yMDE5IDExOjIzLCBDbGF1ZGl1LkJlem5lYUBtaWNyb2No
aXAuY29tIHdyb3RlOgoKWyAuLi4gXQoKPiBUaGUgdGltZXIgY2xvY2sgc291cmNlIGNvdWxkIGJl
IGRpdmlkZWQgYnkgTVIuUFJFUyArIDEuCj4gCj4gU28sIEkgdXNlZCB0aGUgY2xvY2stZnJlcXVl
bmN5IERUIGJpbmRpbmcgdG8gbGV0IHVzZXIgY2hvb3NlIHRoZSB0aW1lcidzCj4gZnJlcXVlbmN5
LiBCYXNlZCBvbiB0aGUgdmFsdWUgcHJvdmlkZWQgdmlhIHRoaXMgRFQgYmluZGluZyB0aGUgYmVz
dCBjbG9jawo+IHNvdXJjZSBhbmQgcHJlc2NhbGVyIGlzIGNob3NlbiB2aWEgbWNocF9waXQ2NGJf
cHJlc19wcmVwYXJlKCkgZnVuY3Rpb24uCgpJJ20gd2lsbGluZyB0byB0YWtlIHRoZSBkcml2ZXIg
YnV0IEkgZG91YnQgdGhlIHB1cnBvc2Ugb2YgdGhlCmNsb2NrLWZyZXF1ZW5jeSBpcyB0byBsZXQg
dGhlIHVzZXIgY2hvb3NlIHRoZSBmcmVxdWVuY3kuCgoKWyAuLi4gXQoKCi0tIAogPGh0dHA6Ly93
d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBB
Uk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9M
aW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0
ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
