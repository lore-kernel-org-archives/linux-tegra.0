From: <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
Date: Wed, 2 Oct 2019 13:32:44 +0000
Message-ID: <e78e7520-213c-8075-d71e-b8db2ebdceb7@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
 <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
 <20190910151055.GX21254@piout.net>
 <CACRpkda4mmpbPWa2nD93CvD6HWzcTUDzyyLdQxC2gNB7XiJF3w@mail.gmail.com>
 <a2aca46a-8eb9-d8a8-de42-9850a8a8f44c@microchip.com>
 <20190930143246.GA19967@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190930143246.GA19967@bogus>
Content-Language: en-US
Content-ID: <2405F53375D403478DD0705798481038@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: robh@kernel.org
Cc: tmaimon77@gmail.com, linus.walleij@linaro.org, nsekhar@ti.com, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, khilman@baylibre.com, Ludovic.Desroches@microchip.com, linux-imx@nxp.com, u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp, marc.zyngier@arm.com, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org, khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, kernel@pengutronix.de, mark.rutland@arm.com, alexandre.belloni@bootlin.com, jhogan@kernel.org, palmer@sifive.com, eric@anholt.net, thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org, ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org, jonathanh@nvidia.com, bgolaszewski@baylibre.co
List-Id: linux-tegra@vger.kernel.org



On 30.09.2019 17:32, Rob Herring wrote:
> On Wed, Sep 11, 2019 at 07:18:07AM +0000, Claudiu.Beznea@microchip.com wrote:
>>
>>
>> On 11.09.2019 03:03, Linus Walleij wrote:
>>> External E-Mail
>>>
>>>
>>> On Tue, Sep 10, 2019 at 4:11 PM Alexandre Belloni
>>> <alexandre.belloni@bootlin.com> wrote:
>>>> On 10/09/2019 16:08:26+0100, Sudeep Holla wrote:
>>>>> On Tue, Sep 10, 2019 at 02:51:50PM +0000, Claudiu.Beznea@microchip.com wrote:
>>>
>>>>> In that case, why can't we identify capability that with the compatibles
>>>>> for this timer IP ?
>>>>>
>>>>> IOW, I don't like the proposal as it's hardware limitation.
>>>>
>>>> To be clear, bot timers are exactly the same but can't be clocksource
>>>> and clockevent at the same time. Why would we have different compatibles
>>>> for the exact same IP?
>>>
>>> In that case why not just pick the first one you find as clocksource
>>> and the second one as clock event? As they all come to the
>>> same timer of init function two simple local state variables can
>>> solve that:
>>>
>>> static bool registered_clocksource;
>>> static bool registered_clockevent;
>>>
>>> probe(timer) {
>>>    if (!registered_clocksource) {
>>>        register_clocksource(timer);
>>>        registrered_clocksource = true;
>>>        return;
>>>    }
>>>    if (!registered_clockevent) {
>>>        register_clockevent(timer);
>>>        registered_clockevent = true;
>>>        return;
>>>    }
>>>    pr_info("surplus timer %p\n", timer);
>>> }
>>>
>>
>> That was also my proposal for the driver I'm sending this series for (see
>> [1]) but it has been proposed to implement a mechanism similar to this one
>> in this series (see [2] and [3]).
> 
> This comes up over and over, and the answer is still no. Either each 
> block is identical and doesn't matter which one is used for what or 
> there is some h/w difference that you should describe. 

There are no hardware differences in my case. The block just cannot work at
the same time  as clocksource and clockevent. And on SAM9X60's we want to
use it as clockevent for high resolution timers support.

> 
> If you want something that would even be considered to put into DT, 
> then define something BSD or other OS's could use too. (That's not a 
> suggestion to respin this with generalized names.)
> 
> Rob
> 
> 
