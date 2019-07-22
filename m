From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V6 09/21] clk: tegra: clk-super: Fix to enable PLLP
 branches to CPU
Date: Sun, 21 Jul 2019 20:17:14 -0700
Message-ID: <7933a83c-3208-b551-d41d-70285ae528e3@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-10-git-send-email-skomatineni@nvidia.com>
 <0c86cd7f-81b5-40c5-6f1e-796e8f13b522@gmail.com>
 <042f4b43-7b9c-533d-2548-d903b34363da@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <042f4b43-7b9c-533d-2548-d903b34363da@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 7/21/19 3:39 PM, Sowjanya Komatineni wrote:
>
> On 7/21/19 2:16 PM, Dmitry Osipenko wrote:
>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> This patch has a fix to enable PLLP branches to CPU before changing
>>> the CPU clusters clock source to PLLP for Gen5 Super clock.
>>>
>>> During system suspend entry and exit, CPU source will be switched
>>> to PLLP and this needs PLLP branches to be enabled to CPU prior to
>>> the switch.
>>>
>>> On system resume, warmboot code enables PLLP branches to CPU and
>>> powers up the CPU with PLLP clock source.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>> =C2=A0 drivers/clk/tegra/clk-super.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
>>> =C2=A0 drivers/clk/tegra/clk-tegra-super-gen4.c |=C2=A0 4 ++--
>>> =C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +=
+++
>>> =C2=A0 3 files changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/tegra/clk-super.c=20
>>> b/drivers/clk/tegra/clk-super.c
>>> index 39ef31b46df5..d73c587e4853 100644
>>> --- a/drivers/clk/tegra/clk-super.c
>>> +++ b/drivers/clk/tegra/clk-super.c
>>> @@ -28,6 +28,9 @@
>>> =C2=A0 #define super_state_to_src_shift(m, s) ((m->width * s))
>>> =C2=A0 #define super_state_to_src_mask(m) (((1 << m->width) - 1))
>>> =C2=A0 +#define CCLK_SRC_PLLP_OUT0 4
>>> +#define CCLK_SRC_PLLP_OUT4 5
>>> +
>>> =C2=A0 static u8 clk_super_get_parent(struct clk_hw *hw)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_clk_super_mux *mux =3D to_c=
lk_super_mux(hw);
>>> @@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw=20
>>> *hw, u8 index)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (index =3D=3D=
 mux->div2_index)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 index =3D mux->pllx_index;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Enable PLLP branches to CPU before selectin=
g PLLP source
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 if ((mux->flags & TEGRA_CPU_CLK) &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((index =3D=3D CCLK_SRC_PLL=
P_OUT0) || (index =3D=3D=20
>>> CCLK_SRC_PLLP_OUT4)))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_clk_set_pllp_out_cpu(=
true);
>> Should somewhere here be tegra_clk_set_pllp_out_cpu(false) when
>> switching from PLLP?
> PLLP may be used for other CPU clusters.

Though to avoid flag and check needed to make sure other CPU is not=20
using before disabling PLLP branch to CPU.

But leaving it enabled shouldn't impact much as clock source mux is=20
after this in design anyway.

But can add as well if its clear that way.

>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~((super_state_to_src_mask(mux)=
) << shift);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D (index & (super_state_to_src_ma=
sk(mux))) << shift;
>>> =C2=A0 diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c=20
>>> b/drivers/clk/tegra/clk-tegra-super-gen4.c
>>> index cdfe7c9697e1..cd208d0eca2a 100644
>>> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
>>> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
>>> @@ -180,7 +180,7 @@ static void __init tegra_super_clk_init(void=20
>>> __iomem *clk_base,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_info->num_ccl=
k_g_parents,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARE=
NT,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_base + CCLKG_=
BURST_POLICY,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 4, 8, 0, NULL);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_CPU_CLK, 4, 8, 0, NULL)=
;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 clk =3D tegra_clk_register_super_mux("cclk_g",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_info->cclk_g_=
parents,
>>> @@ -201,7 +201,7 @@ static void __init tegra_super_clk_init(void=20
>>> __iomem *clk_base,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_info->num_ccl=
k_lp_parents,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARE=
NT,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_base + CCLKLP=
_BURST_POLICY,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 4, 8, 0, NULL);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_CPU_CLK, 4, 8, 0, NULL)=
;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 clk =3D tegra_clk_register_super_mux("cclk_lp",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_info->cclk_lp=
_parents,
>>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>>> index ac6de3a0b91f..c357b49e49b0 100644
>>> --- a/drivers/clk/tegra/clk.h
>>> +++ b/drivers/clk/tegra/clk.h
>>> @@ -694,6 +694,9 @@ struct clk *tegra_clk_register_periph_data(void=20
>>> __iomem *clk_base,
>>> =C2=A0=C2=A0 * Flags:
>>> =C2=A0=C2=A0 * TEGRA_DIVIDER_2 - LP cluster has additional divider. Thi=
s flag=20
>>> indicates
>>> =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 that this is LP cluster clock.
>>> + * TEGRA_CPU_CLK - This flag indicates this is CPU cluster clock.=20
>>> To use PLLP
>>> + * for CPU clock source, need to enable PLLP branches to CPU by=20
>>> setting the
>>> + * additional bit PLLP_OUT_CPU for gen5 super clock.
>>> =C2=A0=C2=A0 */
>>> =C2=A0 struct tegra_clk_super_mux {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_hw=C2=A0=C2=A0=C2=A0 hw;
>>> @@ -710,6 +713,7 @@ struct tegra_clk_super_mux {
>>> =C2=A0 #define to_clk_super_mux(_hw) container_of(_hw, struct=20
>>> tegra_clk_super_mux, hw)
>>> =C2=A0 =C2=A0 #define TEGRA_DIVIDER_2 BIT(0)
>>> +#define TEGRA_CPU_CLK=C2=A0=C2=A0=C2=A0 BIT(1)
>> I'd name this TEGRA210_CPU_CLK for clarity.
>>
>>> =C2=A0 extern const struct clk_ops tegra_clk_super_ops;
>>> =C2=A0 struct clk *tegra_clk_register_super_mux(const char *name,
>>>
>> Will be better to move the tegra_clk_set_pllp_out_cpu() definition into
>> this patch, otherwise this looks inconsistent for reviewer.
> ok, Will move to this patch
