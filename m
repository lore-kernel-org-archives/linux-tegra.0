From: <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 0/7] add support for clocksource/clockevent DT selection
Date: Wed, 2 Oct 2019 13:35:47 +0000
Message-ID: <620a19d5-73b8-709d-9eec-49274ac23e51@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <c3a68a08-d134-cd28-c8af-f757628e07f1@linaro.org>
 <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <72edc5fd-df05-cba5-5aa7-39da1709415b@microchip.com>
Content-Language: en-US
Content-ID: <DE320C98F40CBC4891F6ABBA6ED802E1@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, nsekhar@ti.com, bgolaszewski@baylibre.com, monstr@monstr.eu, john@phrozen.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, lftan@altera.com, tglx@linutronix.de, vgupta@synopsys.com, marc.zyngier@arm.com, patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, shc_work@mail.ru, kgene@kernel.org, krzk@kernel.org, ysato@users.sourceforge.jp, liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.co
Cc: uclinux-h8-devel@lists.sourceforge.jp, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-oxnas@groups.io, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org, nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi Daniel,

Taking into account that Rob doesn't agree with the solution proposed in
this series do you think there is a chance to merge this driver as is?

If you have other suggestion I am open to try it.

Thank you,
Claudiu Beznea

On 26.09.2019 11:42, Claudiu Beznea wrote:
> 
> 
> On 25.09.2019 20:19, Daniel Lezcano wrote:
>> External E-Mail
>>
>>
>> Hi Claudiu,
>>
>> On 10/09/2019 15:47, Claudiu Beznea wrote:
>>> Hi,
>>>
>>> This series adds support to permit the selection of clocksource/clockevent
>>> via DT.
>>
>> Thanks for the proposal and taking care of making some progress on this.
>>
>> I just wanted to let you know I've been traveling but the series is in
>> my pipe and I did not forget it. I'll comment it next week.
> 
> Hi Daniel,
> 
> No problem. Thank you for letting me know.
> 
> Claudiu
> 
>>
>>  -- Daniel
>>
>>
