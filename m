From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 07/20] clk: tegra: clk-periph: Add save and restore
 support
Date: Fri, 2 Aug 2019 13:37:50 -0700
Message-ID: <d8d2732f-8fde-4702-edab-67edf459ec3d@nvidia.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-8-git-send-email-skomatineni@nvidia.com>
 <c703b4fc-9ebb-0fd4-11de-80974b5c3842@gmail.com>
 <614e3fec-cfa2-9e49-6130-d6de253acf03@nvidia.com>
 <92e95688-1984-9967-d47c-57380466a0f2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <92e95688-1984-9967-d47c-57380466a0f2@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/2/19 1:20 PM, Dmitry Osipenko wrote:
> 02.08.2019 21:43, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 8/2/19 5:32 AM, Dmitry Osipenko wrote:
>>> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> This patch implements save and restore context for peripheral fixed
>>>> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
>>>> peripheral clock ops.
>>>>
>>>> During system suspend, core power goes off and looses the settings
>>>> of the Tegra CAR controller registers.
>>>>
>>>> So during suspend entry clock and reset state of peripherals is saved
>>>> and on resume they are restored to have clocks back to same rate and
>>>> state as before suspend.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/clk/tegra/clk-periph-fixed.c | 33
>>>> ++++++++++++++++++++++++++++++++
>>>>  =C2=A0 drivers/clk/tegra/clk-periph-gate.c=C2=A0 | 34
>>>> +++++++++++++++++++++++++++++++++
>>>>  =C2=A0 drivers/clk/tegra/clk-periph.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 37
>>>> ++++++++++++++++++++++++++++++++++++
>>>>  =C2=A0 drivers/clk/tegra/clk-sdmmc-mux.c=C2=A0=C2=A0=C2=A0 | 28 +++++=
++++++++++++++++++++++
>>>>  =C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++++
>>>>  =C2=A0 5 files changed, 138 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c
>>>> b/drivers/clk/tegra/clk-periph-fixed.c
>>>> index c088e7a280df..21b24530fa00 100644
>>>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>>>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>>>> @@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct clk_hw
>>>> *hw,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (unsigned long)rate;
>>>>  =C2=A0 }
>>>>  =C2=A0 +static int tegra_clk_periph_fixed_save_context(struct clk_hw =
*hw)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_fixed *fixed =3D
>>>> to_tegra_clk_periph_fixed(hw);
>>>> +=C2=A0=C2=A0=C2=A0 u32 mask =3D 1 << (fixed->num % 32);
>>> This could be BIT(fixed->num % 32).
>>>
>>>> +=C2=A0=C2=A0=C2=A0 fixed->enb_ctx =3D readl_relaxed(fixed->base +
>>>> fixed->regs->enb_reg) &
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 mask;
>>>> +=C2=A0=C2=A0=C2=A0 fixed->rst_ctx =3D readl_relaxed(fixed->base +
>>>> fixed->regs->rst_reg) &
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 mask;
>>> The enb_ctx/rst_ctx are booleans, while you assigning an integer value
>>> here. You're getting away here because bool is an 32bit unsigned int,
>>> but you shouldn't rely on it and always explicitly convert to a bool.
>>>
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> +static void tegra_clk_periph_fixed_restore_context(struct clk_hw *hw)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_fixed *fixed =3D
>>>> to_tegra_clk_periph_fixed(hw);
>>>> +=C2=A0=C2=A0=C2=A0 u32 mask =3D 1 << (fixed->num % 32);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (fixed->enb_ctx)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_relaxed(mask, fixed=
->base + fixed->regs->enb_set_reg);
>>>> +=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_relaxed(mask, fixed=
->base + fixed->regs->enb_clr_reg);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 udelay(2);
>>> Will be better to read out and compare the hardware's state with the
>>> restored one, then bail out if the state is unchanged.
>>>
>>> Shouldn't it be fence_udelay()?
>>>
>>>> +=C2=A0=C2=A0=C2=A0 if (!fixed->rst_ctx) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udelay(5); /* reset propog=
ation delay */
>>> Why delaying is done before the writing to the reset register?
>> During SC7 exit, peripheral reset state is set to POR state. So some
>> peripherals will already be in reset state and making sure of
>> propagation delay before releasing from reset.
>>
>> It should be rst_clr_reg. will fix in next rev
>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_relaxed(mask, fixed=
->base + fixed->regs->rst_reg);
>>> I'm not quite sure what's going on here, this looks wrong.
>>>
>>> 1. rst_reg points to RST_DEVICES_x
>>> 2. Each bit of RST_DEVICES_x represents the reset-assertion state of
>>> each individual device
>>> 3. By writing to rst_reg, all (!) devices are deasserted, except the on=
e
>>> device which corresponds to the mask
>>> 4. The reset is asserted for a single device, while !fixed->rst_ctx
>>> means that it actually should be deasserted (?)
>>>
>>> Apparently you should use rst_set_reg / rst_clr_reg.
>> Yes, It should be rst_clr_reg. will fix in next rev
>>>> +=C2=A0=C2=A0=C2=A0 }
>>> What about the case where rst_ctx=3Dtrue?
>> ON SC7 exit, state of RST_DEV will be POR state where most peripherals
>> will already be in reset state.
>>
>> Few of them which are not in reset state in POR values are those that
>> need to stay de-asserted across the boot states anyway.
> Okay, sounds reasonable.
>
> BTW, it would be nice if you could add a brief clarifying comment to the
> code for each of the questions asked during of the review.
OK, Will add comments in code ...
