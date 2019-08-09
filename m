From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v8 10/21] clk: tegra: clk-super: Add restore-context
 support
Date: Fri, 9 Aug 2019 10:08:50 -0700
Message-ID: <12250cae-8850-ff1d-91b1-0a50cdab6fa1@nvidia.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-11-git-send-email-skomatineni@nvidia.com>
 <4e33bad9-8d5a-dcd7-c75e-db5843c9be4a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4e33bad9-8d5a-dcd7-c75e-db5843c9be4a@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/9/19 5:17 AM, Dmitry Osipenko wrote:
> 09.08.2019 2:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch implements restore_context for clk_super_mux and clk_super.
>>
>> During system supend, core power goes off the and context of Tegra
>> CAR registers is lost.
>>
>> So on system resume, context of super clock registers are restored
>> to have them in same state as before suspend.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-super.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super=
.c
>> index e2a1e95a8db7..74c9e913e41c 100644
>> --- a/drivers/clk/tegra/clk-super.c
>> +++ b/drivers/clk/tegra/clk-super.c
>> @@ -124,9 +124,18 @@ static int clk_super_set_parent(struct clk_hw *hw, =
u8 index)
>>   	return err;
>>   }
>>  =20
>> +static void clk_super_mux_restore_context(struct clk_hw *hw)
>> +{
>> +	struct clk_hw *parent =3D clk_hw_get_parent(hw);
>> +	int parent_id =3D clk_hw_get_parent_index(hw, parent);
>> +
>> +	clk_super_set_parent(hw, parent_id);
> All Super clocks have a divider, including the "MUX". Thus I'm wondering
> if there is a chance that divider's configuration may differ on resume
> from what it was on suspend.

tegra_clk_register_super_mux which uses tegra_clk_super_mux_ops doesn't=20
do divider rate programming.

I believe you are referring to sclk_divider, cclklp_divider,=20
cclkg_divider...

these are registered as clk_divider and are restored during clk_divider=20
resume.

>> +}
>> +
>>   static const struct clk_ops tegra_clk_super_mux_ops =3D {
>>   	.get_parent =3D clk_super_get_parent,
>>   	.set_parent =3D clk_super_set_parent,
>> +	.restore_context =3D clk_super_mux_restore_context,
>>   };
>>  =20
>>   static long clk_super_round_rate(struct clk_hw *hw, unsigned long rate=
,
>> @@ -162,12 +171,24 @@ static int clk_super_set_rate(struct clk_hw *hw, u=
nsigned long rate,
>>   	return super->div_ops->set_rate(div_hw, rate, parent_rate);
>>   }
>>  =20
>> +static void clk_super_restore_context(struct clk_hw *hw)
>> +{
>> +	struct tegra_clk_super_mux *super =3D to_clk_super_mux(hw);
>> +	struct clk_hw *div_hw =3D &super->frac_div.hw;
>> +	struct clk_hw *parent =3D clk_hw_get_parent(hw);
>> +	int parent_id =3D clk_hw_get_parent_index(hw, parent);
>> +
>> +	super->div_ops->restore_context(div_hw);
>> +	clk_super_set_parent(hw, parent_id);
>> +}
>> +
>>   const struct clk_ops tegra_clk_super_ops =3D {
>>   	.get_parent =3D clk_super_get_parent,
>>   	.set_parent =3D clk_super_set_parent,
>>   	.set_rate =3D clk_super_set_rate,
>>   	.round_rate =3D clk_super_round_rate,
>>   	.recalc_rate =3D clk_super_recalc_rate,
>> +	.restore_context =3D clk_super_restore_context,
>>   };
>>  =20
>>   struct clk *tegra_clk_register_super_mux(const char *name,
>>
