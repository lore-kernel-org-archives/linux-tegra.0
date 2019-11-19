From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v1 04/17] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
Date: Tue, 19 Nov 2019 12:08:50 -0800
Message-ID: <d76f4689-5986-9239-9c67-9dd125f6547e@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
 <1574146234-3871-5-git-send-email-skomatineni@nvidia.com>
 <d072bd37-9628-4eb2-1706-a1f640606b8d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d072bd37-9628-4eb2-1706-a1f640606b8d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 11/19/19 11:33 AM, Dmitry Osipenko wrote:
> 19.11.2019 09:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 with mux and gate for
>> each of these clocks.
>>
>> Currently these PMC clocks are registered by Tegra clock driver using
>> clk_register_mux and clk_register_gate by passing PMC base address
>> and register offsets and PMC programming for these clocks happens
>> through direct PMC access by the clock driver.
>>
>> With this, when PMC is in secure mode any direct PMC access from the
>> non-secure world does not go through and these clocks will not be
>> functional.
>>
>> This patch adds these clocks registration with PMC as a clock provider
>> for these clocks. clk_ops callback implementations for these clocks
>> uses tegra_pmc_readl and tegra_pmc_writel which supports PMC programming
>> in secure mode and non-secure mode.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/soc/tegra/pmc.c | 330 ++++++++++++++++++++++++++++++++++++++++=
++++++++
>>   1 file changed, 330 insertions(+)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index 7a5aab0b993b..790a6619ba32 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -13,6 +13,9 @@
>>  =20
>>   #include <linux/arm-smccc.h>
>>   #include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/clkdev.h>
>> +#include <linux/clk/clk-conf.h>
>>   #include <linux/clk/tegra.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/delay.h>
>> @@ -48,6 +51,7 @@
>>   #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>>   #include <dt-bindings/gpio/tegra186-gpio.h>
>>   #include <dt-bindings/gpio/tegra194-gpio.h>
>> +#include <dt-bindings/soc/tegra-pmc.h>
>>  =20
>>   #define PMC_CNTRL			0x0
>>   #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
>> @@ -108,6 +112,7 @@
>>   #define PMC_WAKE2_STATUS		0x168
>>   #define PMC_SW_WAKE2_STATUS		0x16c
>>  =20
>> +#define PMC_CLK_OUT_CNTRL		0x1a8
>>   #define PMC_SATA_PWRGT			0x1ac
>>   #define PMC_SATA_PWRGT_PLLE_IDDQ_VALUE BIT(5)
>>   #define PMC_SATA_PWRGT_PLLE_IDDQ_SWCTL BIT(4)
>> @@ -170,6 +175,78 @@
>>   #define  TEGRA_SMC_PMC_READ	0xaa
>>   #define  TEGRA_SMC_PMC_WRITE	0xbb
>>  =20
>> +struct pmc_clk_mux {
>> +	struct clk_hw	hw;
>> +	unsigned long	offs;
>> +	u32		mask;
>> +	u32		shift;
>> +	/* register lock */
>> +	spinlock_t	*lock;
>> +};
>> +
>> +#define to_pmc_clk_mux(_hw) container_of(_hw, struct pmc_clk_mux, hw)
>> +
>> +struct pmc_clk_gate {
>> +	struct clk_hw	hw;
>> +	unsigned long	offs;
>> +	u32		shift;
>> +	/* register lock */
>> +	spinlock_t	*lock;
>> +};
>> +
>> +#define to_pmc_clk_gate(_hw) container_of(_hw, struct pmc_clk_gate, hw)
>> +
>> +struct pmc_clk_init_data {
>> +	char *mux_name;
>> +	char *gate_name;
>> +	const char **parents;
>> +	int num_parents;
>> +	int mux_id;
>> +	int gate_id;
>> +	char *dev_name;
>> +	u8 mux_shift;
>> +	u8 gate_shift;
>> +	u8 init_parent;
>> +	int init_state;
>> +	struct pmc_clk_mux mux;
>> +	struct pmc_clk_gate gate;
>> +};
>> +
>> +#define PMC_CLK(_num, _mux_shift, _gate_shift, _init_parent, _init_stat=
e)\
>> +	{\
>> +		.mux_name =3D "clk_out_" #_num "_mux",\
>> +		.gate_name =3D "clk_out_" #_num,\
>> +		.parents =3D clk_out ##_num ##_parents,\
>> +		.num_parents =3D ARRAY_SIZE(clk_out ##_num ##_parents),\
>> +		.mux_id =3D TEGRA_PMC_CLK_OUT_ ##_num ##_MUX,\
>> +		.gate_id =3D TEGRA_PMC_CLK_OUT_ ##_num,\
>> +		.dev_name =3D "extern" #_num,\
>> +		.mux_shift =3D _mux_shift,\
>> +		.gate_shift =3D _gate_shift,\
>> +		.init_parent =3D _init_parent,\
>> +		.init_state =3D _init_state,\
>> +	}
>> +
>> +static DEFINE_SPINLOCK(clk_out_lock);
>> +
>> +static const char *clk_out1_parents[] =3D { "clk_m", "clk_m_div2",
>> +	"clk_m_div4", "extern1",
>> +};
>> +
>> +static const char *clk_out2_parents[] =3D { "clk_m", "clk_m_div2",
>> +	"clk_m_div4", "extern2",
>> +};
>> +
>> +static const char *clk_out3_parents[] =3D { "clk_m", "clk_m_div2",
>> +	"clk_m_div4", "extern3",
>> +};
> Why these are unused?
They are used in PMC_CLK macro
>
>> +static struct pmc_clk_init_data tegra_pmc_clks_data[] =3D {
>> +	PMC_CLK(1, 6, 2, 3, 1),
>> +	PMC_CLK(2, 14, 10, 0, 0),
>> +	PMC_CLK(3, 22, 18, 0, 0),
>> +};
>> +
>>   struct tegra_powergate {
>>   	struct generic_pm_domain genpd;
>>   	struct tegra_pmc *pmc;
>> @@ -279,6 +356,9 @@ struct tegra_pmc_soc {
>>   	 */
>>   	const struct tegra_wake_event *wake_events;
>>   	unsigned int num_wake_events;
>> +
>> +	struct pmc_clk_init_data *pmc_clks_data;
>> +	unsigned int num_pmc_clks;
>>   };
>>  =20
>>   static const char * const tegra186_reset_sources[] =3D {
>> @@ -2299,6 +2379,241 @@ static int tegra_pmc_clk_notify_cb(struct notifi=
er_block *nb,
>>   	return NOTIFY_OK;
>>   }
>>  =20
>> +static void pmc_clk_fence_udelay(u32 offset)
>> +{
>> +	tegra_pmc_readl(pmc, offset);
>> +	/* pmc clk propagation delay 2 us */
>> +	udelay(2);
>> +}
>> +
>> +static u8 pmc_clk_mux_get_parent(struct clk_hw *hw)
>> +{
>> +	struct pmc_clk_mux *mux =3D to_pmc_clk_mux(hw);
>> +	int num_parents =3D clk_hw_get_num_parents(hw);
>> +	u32 val;
>> +
>> +	val =3D tegra_pmc_readl(pmc, mux->offs) >> mux->shift;
>> +	val &=3D mux->mask;
>> +
>> +	if (val >=3D num_parents)
>> +		return -EINVAL;
>> +
>> +	return val;
>> +}
>> +
>> +static int pmc_clk_mux_set_parent(struct clk_hw *hw, u8 index)
>> +{
>> +	struct pmc_clk_mux *mux =3D to_pmc_clk_mux(hw);
>> +	u32 val;
>> +	unsigned long flags =3D 0;
>> +
>> +	spin_lock_irqsave(mux->lock, flags);
>> +
>> +	val =3D tegra_pmc_readl(pmc, mux->offs);
>> +	val &=3D ~(mux->mask << mux->shift);
>> +	val |=3D index << mux->shift;
>> +	tegra_pmc_writel(pmc, val, mux->offs);
>> +	pmc_clk_fence_udelay(mux->offs);
>> +
>> +	spin_unlock_irqrestore(mux->lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct clk_ops pmc_clk_mux_ops =3D {
>> +	.get_parent =3D pmc_clk_mux_get_parent,
>> +	.set_parent =3D pmc_clk_mux_set_parent,
>> +	.determine_rate =3D __clk_mux_determine_rate,
>> +};
>> +
>> +static struct clk *
>> +tegra_pmc_clk_mux_register(const char *name, const char * const *parent=
_names,
>> +			   int num_parents, unsigned long flags,
>> +			   struct pmc_clk_mux *mux, unsigned long offset,
>> +			   u32 shift, u32 mask, spinlock_t *lock)
>> +{
>> +	struct clk_init_data init;
>> +
>> +	mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
>> +	if (!mux)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	init.name =3D name;
>> +	init.ops =3D &pmc_clk_mux_ops;
>> +	init.parent_names =3D parent_names;
>> +	init.num_parents =3D num_parents;
>> +	init.flags =3D flags;
>> +
>> +	mux->hw.init =3D &init;
>> +	mux->offs =3D offset;
>> +	mux->mask =3D mask;
>> +	mux->shift =3D shift;
>> +	mux->lock =3D lock;
>> +
>> +	return clk_register(NULL, &mux->hw);
>> +}
>> +
>> +static int pmc_clk_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct pmc_clk_gate *gate =3D to_pmc_clk_gate(hw);
>> +
>> +	return tegra_pmc_readl(pmc, gate->offs) & BIT(gate->shift) ? 1 : 0;
>> +}
>> +
>> +static void pmc_clk_set_state(struct clk_hw *hw, int state)
>> +{
>> +	struct pmc_clk_gate *gate =3D to_pmc_clk_gate(hw);
>> +	u32 val;
>> +	unsigned long flags =3D 0;
>> +
>> +	spin_lock_irqsave(gate->lock, flags);
>> +
>> +	val =3D tegra_pmc_readl(pmc, gate->offs);
>> +	val =3D state ? (val | BIT(gate->shift)) : (val & ~BIT(gate->shift));
>> +	tegra_pmc_writel(pmc, val, gate->offs);
>> +	pmc_clk_fence_udelay(gate->offs);
>> +
>> +	spin_unlock_irqrestore(gate->lock, flags);
>> +}
>> +
>> +static int pmc_clk_enable(struct clk_hw *hw)
>> +{
>> +	pmc_clk_set_state(hw, 1);
>> +
>> +	return 0;
>> +}
>> +
>> +static void pmc_clk_disable(struct clk_hw *hw)
>> +{
>> +	pmc_clk_set_state(hw, 0);
>> +}
>> +
>> +static const struct clk_ops pmc_clk_gate_ops =3D {
>> +	.is_enabled =3D pmc_clk_is_enabled,
>> +	.enable =3D pmc_clk_enable,
>> +	.disable =3D pmc_clk_disable,
>> +};
>> +
>> +static struct clk *
>> +tegra_pmc_clk_gate_register(const char *name, const char *parent_name,
>> +			    unsigned long flags, struct pmc_clk_gate *gate,
>> +			    unsigned long offset, u32 shift, spinlock_t *lock)
>> +{
>> +	struct clk_init_data init;
>> +
>> +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
>> +	if (!gate)
>> +		return ERR_PTR(-ENOMEM);
> Why *gate is a function argument?
for storing corresponding gate register info to use for gate clk_ops
>
>> +
>> +	init.name =3D name;
>> +	init.ops =3D &pmc_clk_gate_ops;
>> +	init.parent_names =3D &parent_name;
>> +	init.num_parents =3D 1;
>> +	init.flags =3D flags;
>> +
>> +	gate->hw.init =3D &init;
>> +	gate->offs =3D offset;
>> +	gate->shift =3D shift;
>> +	gate->lock =3D lock;
>> +
>> +	return clk_register(NULL, &gate->hw);
>> +}
> [snip]
