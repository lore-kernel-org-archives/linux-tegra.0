From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v8 08/21] clk: tegra: periph: Add restore_context support
Date: Fri, 9 Aug 2019 09:55:59 -0700
Message-ID: <1ef367a5-2f2f-dc66-1e26-9038af235e36@nvidia.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-9-git-send-email-skomatineni@nvidia.com>
 <5a5f9fb9-9cdd-5d91-4b0e-9bdb95b2625e@gmail.com>
 <0f8259d8-08f2-671c-331c-fe2d83518be0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0f8259d8-08f2-671c-331c-fe2d83518be0@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/9/19 5:20 AM, Dmitry Osipenko wrote:
> 09.08.2019 14:55, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 09.08.2019 2:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> This patch implements restore_context support for clk-periph and
>>> clk-sdmmc-mux clock operations to restore clock parent and rates
>>> on system resume.
>>>
>>> During system suspend, core power goes off and looses the context
>>> of the Tegra clock controller registers.
>>>
>>> So on system resume, clocks parent and rate are restored back to
>>> the context before suspend based on cached data.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/clk/tegra/clk-periph.c    | 18 ++++++++++++++++++
>>>   drivers/clk/tegra/clk-sdmmc-mux.c | 12 ++++++++++++
>>>   2 files changed, 30 insertions(+)
>>>
>>> diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-per=
iph.c
>>> index 58437da25156..c9d28cbadccc 100644
>>> --- a/drivers/clk/tegra/clk-periph.c
>>> +++ b/drivers/clk/tegra/clk-periph.c
>>> @@ -3,6 +3,7 @@
>>>    * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
>>>    */
>>>  =20
>>> +#include <linux/clk.h>
>>>   #include <linux/clk-provider.h>
>>>   #include <linux/export.h>
>>>   #include <linux/slab.h>
>>> @@ -99,6 +100,20 @@ static void clk_periph_disable(struct clk_hw *hw)
>>>   	gate_ops->disable(gate_hw);
>>>   }
>>>  =20
>>> +static void clk_periph_restore_context(struct clk_hw *hw)
>>> +{
>>> +	struct tegra_clk_periph *periph =3D to_clk_periph(hw);
>>> +	const struct clk_ops *div_ops =3D periph->div_ops;
>>> +	struct clk_hw *div_hw =3D &periph->divider.hw;
>>> +	struct clk_hw *parent =3D clk_hw_get_parent(hw);
>>> +	int parent_id =3D clk_hw_get_parent_index(hw, parent);
>>> +
>>> +	if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
>>> +		div_ops->restore_context(div_hw);
>>> +
>>> +	clk_periph_set_parent(hw, parent_id);
>>> +}
>>> +
>>>   const struct clk_ops tegra_clk_periph_ops =3D {
>>>   	.get_parent =3D clk_periph_get_parent,
>>>   	.set_parent =3D clk_periph_set_parent,
>>> @@ -108,6 +123,7 @@ const struct clk_ops tegra_clk_periph_ops =3D {
>>>   	.is_enabled =3D clk_periph_is_enabled,
>>>   	.enable =3D clk_periph_enable,
>>>   	.disable =3D clk_periph_disable,
>>> +	.restore_context =3D clk_periph_restore_context,
>>>   };
>>>  =20
>>>   static const struct clk_ops tegra_clk_periph_nodiv_ops =3D {
>>> @@ -116,6 +132,7 @@ static const struct clk_ops tegra_clk_periph_nodiv_=
ops =3D {
>>>   	.is_enabled =3D clk_periph_is_enabled,
>>>   	.enable =3D clk_periph_enable,
>>>   	.disable =3D clk_periph_disable,
>>> +	.restore_context =3D clk_periph_restore_context,
>>>   };
>>>  =20
>>>   static const struct clk_ops tegra_clk_periph_no_gate_ops =3D {
>>> @@ -124,6 +141,7 @@ static const struct clk_ops tegra_clk_periph_no_gat=
e_ops =3D {
>>>   	.recalc_rate =3D clk_periph_recalc_rate,
>>>   	.round_rate =3D clk_periph_round_rate,
>>>   	.set_rate =3D clk_periph_set_rate,
>>> +	.restore_context =3D clk_periph_restore_context,
>>>   };
>>>  =20
>>>   static struct clk *_tegra_clk_register_periph(const char *name,
>>> diff --git a/drivers/clk/tegra/clk-sdmmc-mux.c b/drivers/clk/tegra/clk-=
sdmmc-mux.c
>>> index a5cd3e31dbae..8db48966b100 100644
>>> --- a/drivers/clk/tegra/clk-sdmmc-mux.c
>>> +++ b/drivers/clk/tegra/clk-sdmmc-mux.c
>>> @@ -194,6 +194,17 @@ static void clk_sdmmc_mux_disable(struct clk_hw *h=
w)
>>>   	gate_ops->disable(gate_hw);
>>>   }
>>>  =20
>>> +static void clk_sdmmc_mux_restore_context(struct clk_hw *hw)
>>> +{
>>> +	struct clk_hw *parent =3D clk_hw_get_parent(hw);
>>> +	unsigned long parent_rate =3D clk_hw_get_rate(parent);
>>> +	unsigned long rate =3D clk_hw_get_rate(hw);
>>> +	int parent_id =3D clk_hw_get_parent_index(hw, parent);
>>> +
>>> +	clk_sdmmc_mux_set_parent(hw, parent_id);
>>> +	clk_sdmmc_mux_set_rate(hw, rate, parent_rate);
>> For the periph clocks you're restoring rate at first and then the
>> parent, while here it's the other way around. I'm wondering if there is
>> any difference in practice and thus whether rate's divider need to be
>> set to a some safe value before switching to a new parent that has a
>> higher clock rate than the old parent.
> Although, I guess that all peripheral clocks should be disabled at this
> point of resume. Correct?

by the time restore happens, peripheral clocks are enabled but held in=20
reset state.

For non-boot clocks, doing divider programming before parent source is=20
preferred.

For sdmmc clock, programming parent before divisor is allowed.

Also, clk_sdmmc_mux_set_rate gets parent MUX selection thru register=20
read so restoring parent prior to this will have right divisor based on=20
rate and parent.

>>> +}
>>> +
>>>   static const struct clk_ops tegra_clk_sdmmc_mux_ops =3D {
>>>   	.get_parent =3D clk_sdmmc_mux_get_parent,
>>>   	.set_parent =3D clk_sdmmc_mux_set_parent,
>>> @@ -203,6 +214,7 @@ static const struct clk_ops tegra_clk_sdmmc_mux_ops=
 =3D {
>>>   	.is_enabled =3D clk_sdmmc_mux_is_enabled,
>>>   	.enable =3D clk_sdmmc_mux_enable,
>>>   	.disable =3D clk_sdmmc_mux_disable,
>>> +	.restore_context =3D clk_sdmmc_mux_restore_context,
>>>   };
>>>  =20
>>>   struct clk *tegra_clk_register_sdmmc_mux_div(const char *name,
>>>
