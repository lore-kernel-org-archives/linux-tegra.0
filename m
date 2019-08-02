From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 07/20] clk: tegra: clk-periph: Add save and restore
 support
Date: Fri, 2 Aug 2019 23:20:54 +0300
Message-ID: <92e95688-1984-9967-d47c-57380466a0f2@gmail.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-8-git-send-email-skomatineni@nvidia.com>
 <c703b4fc-9ebb-0fd4-11de-80974b5c3842@gmail.com>
 <614e3fec-cfa2-9e49-6130-d6de253acf03@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <614e3fec-cfa2-9e49-6130-d6de253acf03@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

02.08.2019 21:43, Sowjanya Komatineni пишет:
> 
> On 8/2/19 5:32 AM, Dmitry Osipenko wrote:
>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>> This patch implements save and restore context for peripheral fixed
>>> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
>>> peripheral clock ops.
>>>
>>> During system suspend, core power goes off and looses the settings
>>> of the Tegra CAR controller registers.
>>>
>>> So during suspend entry clock and reset state of peripherals is saved
>>> and on resume they are restored to have clocks back to same rate and
>>> state as before suspend.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/clk/tegra/clk-periph-fixed.c | 33
>>> ++++++++++++++++++++++++++++++++
>>>   drivers/clk/tegra/clk-periph-gate.c  | 34
>>> +++++++++++++++++++++++++++++++++
>>>   drivers/clk/tegra/clk-periph.c       | 37
>>> ++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/tegra/clk-sdmmc-mux.c    | 28 +++++++++++++++++++++++++++
>>>   drivers/clk/tegra/clk.h              |  6 ++++++
>>>   5 files changed, 138 insertions(+)
>>>
>>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c
>>> b/drivers/clk/tegra/clk-periph-fixed.c
>>> index c088e7a280df..21b24530fa00 100644
>>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>>> @@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct clk_hw
>>> *hw,
>>>       return (unsigned long)rate;
>>>   }
>>>   +static int tegra_clk_periph_fixed_save_context(struct clk_hw *hw)
>>> +{
>>> +    struct tegra_clk_periph_fixed *fixed =
>>> to_tegra_clk_periph_fixed(hw);
>>> +    u32 mask = 1 << (fixed->num % 32);
>> This could be BIT(fixed->num % 32).
>>
>>> +    fixed->enb_ctx = readl_relaxed(fixed->base +
>>> fixed->regs->enb_reg) &
>>> +             mask;
>>> +    fixed->rst_ctx = readl_relaxed(fixed->base +
>>> fixed->regs->rst_reg) &
>>> +             mask;
>> The enb_ctx/rst_ctx are booleans, while you assigning an integer value
>> here. You're getting away here because bool is an 32bit unsigned int,
>> but you shouldn't rely on it and always explicitly convert to a bool.
>>
>>> +    return 0;
>>> +}
>>> +
>>> +static void tegra_clk_periph_fixed_restore_context(struct clk_hw *hw)
>>> +{
>>> +    struct tegra_clk_periph_fixed *fixed =
>>> to_tegra_clk_periph_fixed(hw);
>>> +    u32 mask = 1 << (fixed->num % 32);
>>> +
>>> +    if (fixed->enb_ctx)
>>> +        writel_relaxed(mask, fixed->base + fixed->regs->enb_set_reg);
>>> +    else
>>> +        writel_relaxed(mask, fixed->base + fixed->regs->enb_clr_reg);
>>> +
>>> +    udelay(2);
>> Will be better to read out and compare the hardware's state with the
>> restored one, then bail out if the state is unchanged.
>>
>> Shouldn't it be fence_udelay()?
>>
>>> +    if (!fixed->rst_ctx) {
>>> +        udelay(5); /* reset propogation delay */
>> Why delaying is done before the writing to the reset register?
> 
> During SC7 exit, peripheral reset state is set to POR state. So some
> peripherals will already be in reset state and making sure of
> propagation delay before releasing from reset.
> 
> It should be rst_clr_reg. will fix in next rev
> 
>>
>>> +        writel_relaxed(mask, fixed->base + fixed->regs->rst_reg);
>> I'm not quite sure what's going on here, this looks wrong.
>>
>> 1. rst_reg points to RST_DEVICES_x
>> 2. Each bit of RST_DEVICES_x represents the reset-assertion state of
>> each individual device
>> 3. By writing to rst_reg, all (!) devices are deasserted, except the one
>> device which corresponds to the mask
>> 4. The reset is asserted for a single device, while !fixed->rst_ctx
>> means that it actually should be deasserted (?)
>>
>> Apparently you should use rst_set_reg / rst_clr_reg.
> Yes, It should be rst_clr_reg. will fix in next rev
>>> +    }
>> What about the case where rst_ctx=true?
> 
> ON SC7 exit, state of RST_DEV will be POR state where most peripherals
> will already be in reset state.
> 
> Few of them which are not in reset state in POR values are those that
> need to stay de-asserted across the boot states anyway.

Okay, sounds reasonable.

BTW, it would be nice if you could add a brief clarifying comment to the
code for each of the questions asked during of the review.
