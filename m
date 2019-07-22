From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V6 09/21] clk: tegra: clk-super: Fix to enable PLLP
 branches to CPU
Date: Mon, 22 Jul 2019 00:12:49 -0700
Message-ID: <d9bbe208-6cd3-6a28-3e43-fdd566699b1d@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-10-git-send-email-skomatineni@nvidia.com>
 <0c86cd7f-81b5-40c5-6f1e-796e8f13b522@gmail.com>
 <042f4b43-7b9c-533d-2548-d903b34363da@nvidia.com>
 <7933a83c-3208-b551-d41d-70285ae528e3@nvidia.com>
 <f6ac50af-c3a5-1fef-2e0d-a9ecadeb2495@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f6ac50af-c3a5-1fef-2e0d-a9ecadeb2495@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 7/21/19 11:32 PM, Dmitry Osipenko wrote:
> 22.07.2019 6:17, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/21/19 3:39 PM, Sowjanya Komatineni wrote:
>>> On 7/21/19 2:16 PM, Dmitry Osipenko wrote:
>>>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> This patch has a fix to enable PLLP branches to CPU before changing
>>>>> the CPU clusters clock source to PLLP for Gen5 Super clock.
>>>>>
>>>>> During system suspend entry and exit, CPU source will be switched
>>>>> to PLLP and this needs PLLP branches to be enabled to CPU prior to
>>>>> the switch.
>>>>>
>>>>> On system resume, warmboot code enables PLLP branches to CPU and
>>>>> powers up the CPU with PLLP clock source.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>  =C2=A0 drivers/clk/tegra/clk-super.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
>>>>>  =C2=A0 drivers/clk/tegra/clk-tegra-super-gen4.c |=C2=A0 4 ++--
>>>>>  =C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
4 ++++
>>>>>  =C2=A0 3 files changed, 17 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/tegra/clk-super.c
>>>>> b/drivers/clk/tegra/clk-super.c
>>>>> index 39ef31b46df5..d73c587e4853 100644
>>>>> --- a/drivers/clk/tegra/clk-super.c
>>>>> +++ b/drivers/clk/tegra/clk-super.c
>>>>> @@ -28,6 +28,9 @@
>>>>>  =C2=A0 #define super_state_to_src_shift(m, s) ((m->width * s))
>>>>>  =C2=A0 #define super_state_to_src_mask(m) (((1 << m->width) - 1))
>>>>>  =C2=A0 +#define CCLK_SRC_PLLP_OUT0 4
>>>>> +#define CCLK_SRC_PLLP_OUT4 5
>>>>> +
>>>>>  =C2=A0 static u8 clk_super_get_parent(struct clk_hw *hw)
>>>>>  =C2=A0 {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_clk_super_mux *mux =3D t=
o_clk_super_mux(hw);
>>>>> @@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw
>>>>> *hw, u8 index)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (index =3D=
=3D mux->div2_index)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 index =3D mux->pllx_index;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Enable PLLP branches to CPU before select=
ing PLLP source
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0 if ((mux->flags & TEGRA_CPU_CLK) &&
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((index =3D=3D CCLK_SRC_P=
LLP_OUT0) || (index =3D=3D
>>>>> CCLK_SRC_PLLP_OUT4)))
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_clk_set_pllp_out_cp=
u(true);
>>>> Should somewhere here be tegra_clk_set_pllp_out_cpu(false) when
>>>> switching from PLLP?
>>> PLLP may be used for other CPU clusters.
>> Though to avoid flag and check needed to make sure other CPU is not
>> using before disabling PLLP branch to CPU.
>>
>> But leaving it enabled shouldn't impact much as clock source mux is
>> after this in design anyway.
>>
>> But can add as well if its clear that way.
> The TRM doc says "The CPU subsystem supports a switch-cluster mode
> meaning that only one of the clusters can be active at any given time".
>
> Given that cluster-switching isn't supported in upstream, I don't think
> that you need to care about the other cluster at all, at least for now.
>
> The cluster-switching implementation in upstream is very complicated
> because it requires a special "hotplugging" CPU governor, which
> apparently no other platform needs.
>
> [snip]

This patch enables PLLP branches to CPU for both CPUG & CPULP if they=20
use PLLP source.

So, to disable PLLP out CPU when not in use, we still need check for=20
other cluster because during resume both LP CPU and G CPU gets restored.=20
CPUG runs from PLLP on resume and when it does super clk restore for LP=20
CPU which may not be using PLLP, but as both uses same super mux=20
clk_ops, without check (for PLLP branch to CPU in use) disabling PLLP=20
branch to CPU during LP CPU restore looses clock to CPU G as well which=20
is running from PLLP.

Will add check and disable PLLP if not in use in next version... this=20
need extern flag as well to mark PLLP usage with either of CPU's.
