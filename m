From: <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
Date: Wed, 11 Sep 2019 07:18:07 +0000
Message-ID: <a2aca46a-8eb9-d8a8-de42-9850a8a8f44c@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
 <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
 <20190910151055.GX21254@piout.net>
 <CACRpkda4mmpbPWa2nD93CvD6HWzcTUDzyyLdQxC2gNB7XiJF3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkda4mmpbPWa2nD93CvD6HWzcTUDzyyLdQxC2gNB7XiJF3w@mail.gmail.com>
Content-Language: en-US
Content-ID: <91BD4C01564D5B4796147CA97CB4AEED@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, alexandre.belloni@bootlin.com
Cc: tmaimon77@gmail.com, nsekhar@ti.com, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, khilman@baylibre.com, Ludovic.Desroches@microchip.com, linux-imx@nxp.com, u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp, marc.zyngier@arm.com, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org, khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, kernel@pengutronix.de, mark.rutland@arm.com, jhogan@kernel.org, palmer@sifive.com, eric@anholt.net, thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org, ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org, jonathanh@nvidia.com, bgolaszewski@baylibre.com, kgene@kernel.org, alexandre.torgue@st.com, linux-arm-
List-Id: linux-tegra@vger.kernel.org



On 11.09.2019 03:03, Linus Walleij wrote:
> External E-Mail
> 
> 
> On Tue, Sep 10, 2019 at 4:11 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>> On 10/09/2019 16:08:26+0100, Sudeep Holla wrote:
>>> On Tue, Sep 10, 2019 at 02:51:50PM +0000, Claudiu.Beznea@microchip.com wrote:
> 
>>> In that case, why can't we identify capability that with the compatibles
>>> for this timer IP ?
>>>
>>> IOW, I don't like the proposal as it's hardware limitation.
>>
>> To be clear, bot timers are exactly the same but can't be clocksource
>> and clockevent at the same time. Why would we have different compatibles
>> for the exact same IP?
> 
> In that case why not just pick the first one you find as clocksource
> and the second one as clock event? As they all come to the
> same timer of init function two simple local state variables can
> solve that:
> 
> static bool registered_clocksource;
> static bool registered_clockevent;
> 
> probe(timer) {
>    if (!registered_clocksource) {
>        register_clocksource(timer);
>        registrered_clocksource = true;
>        return;
>    }
>    if (!registered_clockevent) {
>        register_clockevent(timer);
>        registered_clockevent = true;
>        return;
>    }
>    pr_info("surplus timer %p\n", timer);
> }
> 

That was also my proposal for the driver I'm sending this series for (see
[1]) but it has been proposed to implement a mechanism similar to this one
in this series (see [2] and [3]).

Thank you,
Claudiu Beznea

[1]
https://lore.kernel.org/lkml/1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com/
[2]
https://lore.kernel.org/lkml/a738fce5-1108-34d7-d255-dfcb86f51c56@linaro.org/
[3]
https://lore.kernel.org/lkml/2f831f1b-c87d-48bd-cf02-2ebb334b964c@linaro.org/

> Clocksource and clockevent are natural singletons so there is
> no need to handle more than one of each in a driver for identical
> hardware.
> 
> With the Integrator AP timer there is a real reason to select one over
> the other but as I replied to that patch it is pretty easy to just identify
> which block has this limitation by simply commenting out the IRQ
> line for it from the device tree.
> 
> Maybe there is something about this I don't understand.
> 
> Yours,
> Linus Walleij
> 
