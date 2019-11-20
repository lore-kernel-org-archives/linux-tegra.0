From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v1 04/17] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
Date: Wed, 20 Nov 2019 11:09:08 -0800
Message-ID: <eff0e0f5-a94d-cca5-3558-247d1d90d28d@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
 <1574146234-3871-5-git-send-email-skomatineni@nvidia.com>
 <d072bd37-9628-4eb2-1706-a1f640606b8d@gmail.com>
 <d76f4689-5986-9239-9c67-9dd125f6547e@nvidia.com>
 <a87a08c1-5104-a534-89c4-73463c08abba@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a87a08c1-5104-a534-89c4-73463c08abba@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 11/20/19 9:46 AM, Dmitry Osipenko wrote:
> 19.11.2019 23:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 11/19/19 11:33 AM, Dmitry Osipenko wrote:
>>> 19.11.2019 09:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 with mux and gate for
>>>> each of these clocks.
>>>>
>>>> Currently these PMC clocks are registered by Tegra clock driver using
>>>> clk_register_mux and clk_register_gate by passing PMC base address
>>>> and register offsets and PMC programming for these clocks happens
>>>> through direct PMC access by the clock driver.
>>>>
>>>> With this, when PMC is in secure mode any direct PMC access from the
>>>> non-secure world does not go through and these clocks will not be
>>>> functional.
>>>>
>>>> This patch adds these clocks registration with PMC as a clock provider
>>>> for these clocks. clk_ops callback implementations for these clocks
>>>> uses tegra_pmc_readl and tegra_pmc_writel which supports PMC programmi=
ng
>>>> in secure mode and non-secure mode.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/soc/tegra/pmc.c | 330
>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  =C2=A0 1 file changed, 330 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>> index 7a5aab0b993b..790a6619ba32 100644
>>>> --- a/drivers/soc/tegra/pmc.c
>>>> +++ b/drivers/soc/tegra/pmc.c
>>>> @@ -13,6 +13,9 @@
>>>>  =C2=A0 =C2=A0 #include <linux/arm-smccc.h>
>>>>  =C2=A0 #include <linux/clk.h>
>>>> +#include <linux/clk-provider.h>
>>>> +#include <linux/clkdev.h>
>>>> +#include <linux/clk/clk-conf.h>
>>>>  =C2=A0 #include <linux/clk/tegra.h>
>>>>  =C2=A0 #include <linux/debugfs.h>
>>>>  =C2=A0 #include <linux/delay.h>
>>>> @@ -48,6 +51,7 @@
>>>>  =C2=A0 #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>>>>  =C2=A0 #include <dt-bindings/gpio/tegra186-gpio.h>
>>>>  =C2=A0 #include <dt-bindings/gpio/tegra194-gpio.h>
>>>> +#include <dt-bindings/soc/tegra-pmc.h>
>>>>  =C2=A0 =C2=A0 #define PMC_CNTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0
>>>>  =C2=A0 #define=C2=A0 PMC_CNTRL_INTR_POLARITY=C2=A0=C2=A0=C2=A0 BIT(17=
) /* inverts INTR
>>>> polarity */
>>>> @@ -108,6 +112,7 @@
>>>>  =C2=A0 #define PMC_WAKE2_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x168
>>>>  =C2=A0 #define PMC_SW_WAKE2_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x16c
>>>>  =C2=A0 +#define PMC_CLK_OUT_CNTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x1a8
>>>>  =C2=A0 #define PMC_SATA_PWRGT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1ac
>>>>  =C2=A0 #define PMC_SATA_PWRGT_PLLE_IDDQ_VALUE BIT(5)
>>>>  =C2=A0 #define PMC_SATA_PWRGT_PLLE_IDDQ_SWCTL BIT(4)
>>>> @@ -170,6 +175,78 @@
>>>>  =C2=A0 #define=C2=A0 TEGRA_SMC_PMC_READ=C2=A0=C2=A0=C2=A0 0xaa
>>>>  =C2=A0 #define=C2=A0 TEGRA_SMC_PMC_WRITE=C2=A0=C2=A0=C2=A0 0xbb
>>>>  =C2=A0 +struct pmc_clk_mux {
>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw=C2=A0=C2=A0=C2=A0 hw;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned long=C2=A0=C2=A0=C2=A0 offs;
>>>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mask=
;
>>>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shif=
t;
>>>> +=C2=A0=C2=A0=C2=A0 /* register lock */
>>>> +=C2=A0=C2=A0=C2=A0 spinlock_t=C2=A0=C2=A0=C2=A0 *lock;
>>>> +};
>>>> +
>>>> +#define to_pmc_clk_mux(_hw) container_of(_hw, struct pmc_clk_mux, hw)
>>>> +
>>>> +struct pmc_clk_gate {
>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw=C2=A0=C2=A0=C2=A0 hw;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned long=C2=A0=C2=A0=C2=A0 offs;
>>>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shif=
t;
>>>> +=C2=A0=C2=A0=C2=A0 /* register lock */
>>>> +=C2=A0=C2=A0=C2=A0 spinlock_t=C2=A0=C2=A0=C2=A0 *lock;
> Why clk_out_lock is needed at all? CCLK framework already takes care of
> the clock's locking and then nothing else in PMC code uses that lock to
> avoid races, thus that spinlock doesn't do anything useful and should be
> removed from both mux and gate.
Will remove spinlock in next version.
>>>> +};
>>>> +
>>>> +#define to_pmc_clk_gate(_hw) container_of(_hw, struct pmc_clk_gate, h=
w)
>>>> +
>>>> +struct pmc_clk_init_data {
>>>> +=C2=A0=C2=A0=C2=A0 char *mux_name;
>>>> +=C2=A0=C2=A0=C2=A0 char *gate_name;
>>>> +=C2=A0=C2=A0=C2=A0 const char **parents;
>>>> +=C2=A0=C2=A0=C2=A0 int num_parents;
>>>> +=C2=A0=C2=A0=C2=A0 int mux_id;
>>>> +=C2=A0=C2=A0=C2=A0 int gate_id;
>>>> +=C2=A0=C2=A0=C2=A0 char *dev_name;
>>>> +=C2=A0=C2=A0=C2=A0 u8 mux_shift;
>>>> +=C2=A0=C2=A0=C2=A0 u8 gate_shift;
>>>> +=C2=A0=C2=A0=C2=A0 u8 init_parent;
>>>> +=C2=A0=C2=A0=C2=A0 int init_state;
>>>> +=C2=A0=C2=A0=C2=A0 struct pmc_clk_mux mux;
>>>> +=C2=A0=C2=A0=C2=A0 struct pmc_clk_gate gate;
>>>> +};
>>>> +
>>>> +#define PMC_CLK(_num, _mux_shift, _gate_shift, _init_parent,
>>>> _init_state)\
>>>> +=C2=A0=C2=A0=C2=A0 {\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mux_name =3D "clk_out_" #=
_num "_mux",\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gate_name =3D "clk_out_" =
#_num,\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .parents =3D clk_out ##_nu=
m ##_parents,\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_parents =3D ARRAY_SIZ=
E(clk_out ##_num ##_parents),\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mux_id =3D TEGRA_PMC_CLK_=
OUT_ ##_num ##_MUX,\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gate_id =3D TEGRA_PMC_CLK=
_OUT_ ##_num,\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dev_name =3D "extern" #_n=
um,\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mux_shift =3D _mux_shift,=
\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gate_shift =3D _gate_shif=
t,\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .init_parent =3D _init_par=
ent,\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .init_state =3D _init_stat=
e,\
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +static DEFINE_SPINLOCK(clk_out_lock);
>>>> +
>>>> +static const char *clk_out1_parents[] =3D { "clk_m", "clk_m_div2",
>>>> +=C2=A0=C2=A0=C2=A0 "clk_m_div4", "extern1",
>>>> +};
>>>> +
>>>> +static const char *clk_out2_parents[] =3D { "clk_m", "clk_m_div2",
>>>> +=C2=A0=C2=A0=C2=A0 "clk_m_div4", "extern2",
>>>> +};
>>>> +
>>>> +static const char *clk_out3_parents[] =3D { "clk_m", "clk_m_div2",
>>>> +=C2=A0=C2=A0=C2=A0 "clk_m_div4", "extern3",
>>>> +};
>>> Why these are unused?
>> They are used in PMC_CLK macro
> Looks like it will better to define those three structs directly,
> without the PMC_CLK macro.
>
> [snip]
ok, will define structs directly in next version.
