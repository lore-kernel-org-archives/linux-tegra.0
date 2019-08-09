From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v8 05/21] clk: tegra: pll: Save and restore pll context
Date: Fri, 9 Aug 2019 11:50:33 -0700
Message-ID: <9096cbca-f647-b0af-2ab8-d48769555c3e@nvidia.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-6-git-send-email-skomatineni@nvidia.com>
 <68f65db6-44b7-1c75-2633-4a2fffd62a92@gmail.com>
 <dd20aa34-d838-40c4-9edd-bbe5973053f3@nvidia.com>
 <2eecf4ff-802d-7e0e-d971-0257fae4e3a2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2eecf4ff-802d-7e0e-d971-0257fae4e3a2@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/9/19 10:50 AM, Dmitry Osipenko wrote:
> 09.08.2019 20:39, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 8/9/19 4:33 AM, Dmitry Osipenko wrote:
>>> 09.08.2019 2:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> This patch implements save and restore of PLL context.
>>>>
>>>> During system suspend, core power goes off and looses the settings
>>>> of the Tegra CAR controller registers.
>>>>
>>>> So during suspend entry pll context is stored and on resume it is
>>>> restored back along with its state.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/clk/tegra/clk-pll.c | 88 ++++++++++++++++++++++++++++-=
----------------
>>>>  =C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>>>  =C2=A0 2 files changed, 58 insertions(+), 32 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>>>> index 1583f5fc992f..e52add2bbdbb 100644
>>>> --- a/drivers/clk/tegra/clk-pll.c
>>>> +++ b/drivers/clk/tegra/clk-pll.c
>>>> @@ -1008,6 +1008,28 @@ static unsigned long clk_plle_recalc_rate(struc=
t clk_hw *hw,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rate;
>>>>  =C2=A0 }
>>>>  =C2=A0 +static void tegra_clk_pll_restore_context(struct clk_hw *hw)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_pll *pll =3D to_clk_pll(hw);
>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *parent =3D clk_hw_get_parent(hw);
>>>> +=C2=A0=C2=A0=C2=A0 unsigned long parent_rate =3D clk_hw_get_rate(pare=
nt);
>>>> +=C2=A0=C2=A0=C2=A0 unsigned long rate =3D clk_hw_get_rate(hw);
>>>> +=C2=A0=C2=A0=C2=A0 u32 val;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (clk_pll_is_enabled(hw))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (pll->params->set_defaults)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pll->params->set_defaults(=
pll);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 clk_pll_set_rate(hw, rate, parent_rate);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!__clk_get_enable_count(hw->clk))
>>> What about orphaned clocks? Is enable_count > 0 for them?
>> There are no orphaned pll clocks.
> Sorry, I meant the "clk_ignore_unused".

clocks with CLK_IGNORE_UNUSED are taken care by clk driver.

clk_disable_unused checks for clocks with this flag and if they are not=20
enabled it will enable them.

So by the time suspend happens enable_count is > 0
