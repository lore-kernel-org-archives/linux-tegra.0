From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 4/9] soc: tegra: pmc: Add generic PM domain support
Date: Mon, 2 Mar 2015 16:55:25 +0800
Message-ID: <54F4257D.20804@nvidia.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com> <1421216372-8025-5-git-send-email-vinceh@nvidia.com> <CAAVeFuKAk44_ohL=0Qb47wwK5-8rxjvxExjQbfrshjc1J_zZug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuKAk44_ohL=0Qb47wwK5-8rxjvxExjQbfrshjc1J_zZug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On 02/12/2015 04:56 PM, Alexandre Courbot wrote:
> On Wed, Jan 14, 2015 at 3:19 PM, Vince Hsu<vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>  wrote:
>> From: Thierry Reding<treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The PM domains are populated from DT, and the PM domain consumer devices are
>> also bound to their relevant PM domains by DT.
>>
>> Signed-off-by: Thierry Reding<treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> [vinceh: make changes based on Thierry and Peter's suggestions]
>> Signed-off-by: Vince Hsu<vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/soc/tegra/pmc.c                     | 589 ++++++++++++++++++++++++++++
>>   include/dt-bindings/power/tegra-powergate.h |  30 ++
>>   2 files changed, 619 insertions(+)
>>   create mode 100644 include/dt-bindings/power/tegra-powergate.h
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index 4bdc654bd747..0779b0ba6d3d 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -17,6 +17,8 @@
>>    *
>>    */
>>
>> +#define DEBUG
>> +
>>   #include <linux/kernel.h>
>>   #include <linux/clk.h>
>>   #include <linux/clk/tegra.h>
>> @@ -27,15 +29,20 @@
>>   #include <linux/init.h>
>>   #include <linux/io.h>
>>   #include <linux/of.h>
>> +#include <linux/of_platform.h>
>>   #include <linux/of_address.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_domain.h>
>>   #include <linux/reboot.h>
>> +#include <linux/regulator/consumer.h>
>>   #include <linux/reset.h>
>> +#include <linux/sched.h>
>>   #include <linux/seq_file.h>
>>   #include <linux/spinlock.h>
>>
>>   #include <soc/tegra/common.h>
>>   #include <soc/tegra/fuse.h>
>> +#include <soc/tegra/mc.h>
>>   #include <soc/tegra/pmc.h>
>>
>>   #define PMC_CNTRL                      0x0
>> @@ -83,6 +90,30 @@
>>
>>   #define GPU_RG_CNTRL                   0x2d4
>>
>> +#define MAX_CLK_NUM            5
>> +#define MAX_RESET_NUM          5
>> +#define MAX_SWGROUP_NUM                5
>> +
>> +struct tegra_powergate {
>> +       struct generic_pm_domain base;
>> +       struct tegra_pmc *pmc;
>> +       unsigned int id;
>> +       const char *name;
>> +       struct list_head head;
>> +       struct device_node *of_node;
>> +       struct clk *clk[MAX_CLK_NUM];
>> +       struct reset_control *reset[MAX_RESET_NUM];
>> +       struct tegra_mc_swgroup *swgroup[MAX_SWGROUP_NUM];
>> +       bool need_vdd;
>> +       struct regulator *vdd;
>> +};
>> +
>> +static inline struct tegra_powergate *
>> +to_powergate(struct generic_pm_domain *domain)
>> +{
>> +       return container_of(domain, struct tegra_powergate, base);
>> +}
>> +
>>   struct tegra_pmc_soc {
>>          unsigned int num_powergates;
>>          const char *const *powergates;
>> @@ -92,8 +123,10 @@ struct tegra_pmc_soc {
>>
>>   /**
>>    * struct tegra_pmc - NVIDIA Tegra PMC
>> + * @dev: pointer to parent device
>>    * @base: pointer to I/O remapped register region
>>    * @clk: pointer to pclk clock
>> + * @soc: SoC-specific data
>>    * @rate: currently configured rate of pclk
>>    * @suspend_mode: lowest suspend mode available
>>    * @cpu_good_time: CPU power good time (in microseconds)
>> @@ -107,9 +140,12 @@ struct tegra_pmc_soc {
>>    * @cpu_pwr_good_en: CPU power good signal is enabled
>>    * @lp0_vec_phys: physical base address of the LP0 warm boot code
>>    * @lp0_vec_size: size of the LP0 warm boot code
>> + * @powergates: list of power gates
>>    * @powergates_lock: mutex for power gate register access
>> + * @nb: bus notifier for generic power domains
>>    */
>>   struct tegra_pmc {
>> +       struct device *dev;
>>          void __iomem *base;
>>          struct clk *clk;
>>
>> @@ -130,7 +166,12 @@ struct tegra_pmc {
>>          u32 lp0_vec_phys;
>>          u32 lp0_vec_size;
>>
>> +       struct tegra_powergate *powergates;
>>          struct mutex powergates_lock;
>> +       struct notifier_block nb;
>> +
>> +       struct list_head powergate_list;
>> +       int power_domain_num;
>>   };
>>
>>   static struct tegra_pmc *pmc = &(struct tegra_pmc) {
>> @@ -353,6 +394,8 @@ int tegra_pmc_cpu_remove_clamping(int cpuid)
>>          if (id < 0)
>>                  return id;
>>
>> +       usleep_range(10, 20);
>> +
>>          return tegra_powergate_remove_clamping(id);
>>   }
>>   #endif /* CONFIG_SMP */
>> @@ -387,6 +430,317 @@ void tegra_pmc_restart(enum reboot_mode mode, const char *cmd)
>>          tegra_pmc_writel(value, 0);
>>   }
>>
>> +static bool tegra_pmc_powergate_is_powered(struct tegra_powergate *powergate)
>> +{
>> +       u32 status = tegra_pmc_readl(PWRGATE_STATUS);
>> +
>> +       if (!powergate->need_vdd)
>> +               return (status & BIT(powergate->id)) != 0;
>> +
>> +       if (IS_ERR(powergate->vdd))
>> +               return false;
>> +       else
>> +               return regulator_is_enabled(powergate->vdd);
> status is only needed if !powervate->need_vdd. In the other case you
> will have read PWRGATE_STATUS for nothing.
>
> Actually, I would have (intuitively) expected that if need_vdd is
> true, then both the right status bit must be set *and* the regulator
> must be enabled, but reading the rest of this patch seems to confirm
> that this is not the case. May I then suggest to rename "need_vdd"
> into something more directly reflecting this, like "is_vdd".
Yes, will rename to "is_vdd".

>
>> +}
>> +
>> +static int tegra_pmc_powergate_set(struct tegra_powergate *powergate,
>> +                                  bool new_state)
>> +{
>> +       u32 status, mask = new_state ? BIT(powergate->id) : 0;
>> +       bool state = false;
>> +
>> +       mutex_lock(&pmc->powergates_lock);
>> +
>> +       /* check the current state of the partition */
>> +       status = tegra_pmc_readl(PWRGATE_STATUS);
>> +       if (status & BIT(powergate->id))
>> +               state = true;
> state = !!(status & BIT(powergate->id)) ?
OK.

>
>> +
>> +       /* nothing to do */
>> +       if (new_state == state) {
>> +               mutex_unlock(&pmc->powergates_lock);
>> +               return 0;
>> +       }
>> +
>> +       /* toggle partition state and wait for state change to finish */
>> +       tegra_pmc_writel(PWRGATE_TOGGLE_START | powergate->id, PWRGATE_TOGGLE);
>> +
>> +       while (1) {
>> +               status = tegra_pmc_readl(PWRGATE_STATUS);
>> +               if ((status & BIT(powergate->id)) == mask)
>> +                       break;
>> +
>> +               usleep_range(10, 20);
>> +       }
> Might be nice to have a timeout and error report here, just in case...
OK.

>
>> +
>> +       mutex_unlock(&pmc->powergates_lock);
>> +
>> +       return 0;
>> +}
>> +
>> +static int
>> +tegra_pmc_powergate_remove_clamping(struct tegra_powergate *powergate)
>> +{
>> +       u32 mask;
>> +
>> +       /*
>> +        * The Tegra124 GPU has a separate register (with different semantics)
>> +        * to remove clamps.
>> +        */
>> +       if (tegra_get_chip_id() == TEGRA124) {
>> +               if (powergate->id == TEGRA_POWERGATE_3D) {
> if (tegra_get_chip_id() == TEGRA124 &&
>      powergate->id == TEGRA_POWERGATE_3D) ?
Yes, I should rebase this series onto the patch below that gets rid of 
the chip ID checking though.

http://patchwork.ozlabs.org/patch/426997/


>
>> +                       tegra_pmc_writel(0, GPU_RG_CNTRL);
>> +                       return 0;
>> +               }
>> +       }
>> +
>> +       /*
>> +        * Tegra 2 has a bug where PCIE and VDE clamping masks are
>> +        * swapped relatively to the partition ids
>> +        */
>> +       if (powergate->id == TEGRA_POWERGATE_VDEC)
>> +               mask = (1 << TEGRA_POWERGATE_PCIE);
>> +       else if (powergate->id == TEGRA_POWERGATE_PCIE)
>> +               mask = (1 << TEGRA_POWERGATE_VDEC);
>> +       else
>> +               mask = (1 << powergate->id);
> If this is only a Tegra 2 issue, shouldn't we test for the chip ID as well?
Actually according to TRM, the later Tegra SoCs all have this swapping. 
So we should
revise the comment instead.

>> +
>> +       tegra_pmc_writel(mask, REMOVE_CLAMPING);
>> +
>> +       return 0;
>> +}
>> +
>> +static int tegra_pmc_powergate_enable_clocks(
>> +               struct tegra_powergate *powergate)
>> +{
>> +       int i, err;
>> +
>> +       for (i = 0; i < MAX_CLK_NUM; i++) {
>> +               if (!powergate->clk[i])
>> +                       break;
>> +
>> +               err = clk_prepare_enable(powergate->clk[i]);
>> +               if (err)
>> +                       goto out;
>> +       }
>> +
>> +       return 0;
>> +
>> +out:
>> +       while(i--)
>> +               clk_disable_unprepare(powergate->clk[i]);
>> +       return err;
>> +}
>> +
>> +static void tegra_pmc_powergate_disable_clocks(
>> +               struct tegra_powergate *powergate)
>> +{
>> +       int i;
>> +
>> +       for (i = 0; i < MAX_CLK_NUM; i++) {
>> +               if (!powergate->clk[i])
>> +                       break;
> nit: shouldn't we disable the clocks in the reverse order of their enabling?
This is not a hard requirement AFAIK. Actually in the documentation, the 
order to disable
clocks is the same as the order when enabling them.

>
>> +
>> +               clk_disable_unprepare(powergate->clk[i]);
>> +       }
>> +}
>> +
>> +static int tegra_pmc_powergate_mc_flush(struct tegra_powergate *powergate)
>> +{
>> +       int i, err;
>> +
>> +       for (i = 0; i < MAX_SWGROUP_NUM; i++) {
>> +               if (!powergate->swgroup[i])
>> +                       break;
>> +
>> +               err = tegra_mc_flush(powergate->swgroup[i]);
>> +               if (err)
>> +                       return err;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int tegra_pmc_powergate_mc_flush_done(struct tegra_powergate *powergate)
>> +{
>> +       int i, err;
>> +
>> +       for (i = 0; i < MAX_SWGROUP_NUM; i++) {
>> +               if (!powergate->swgroup[i])
>> +                       break;
>> +
>> +               err = tegra_mc_flush_done(powergate->swgroup[i]);
>> +               if (err)
>> +                       return err;
>> +       }
>> +
>> +       return 0;
>> +
>> +}
>> +
>> +static int tegra_pmc_powergate_reset_assert(
>> +               struct tegra_powergate *powergate)
>> +{
>> +       int i, err;
>> +
>> +       for (i = 0; i < MAX_RESET_NUM; i++) {
>> +               if (!powergate->reset[i])
>> +                       break;
>> +
>> +               err = reset_control_assert(powergate->reset[i]);
>> +               if (err)
>> +                       return err;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int tegra_pmc_powergate_reset_deassert(
>> +               struct tegra_powergate *powergate)
>> +{
>> +       int i, err;
>> +
>> +       for (i = 0; i < MAX_RESET_NUM; i++) {
>> +               if (!powergate->reset[i])
>> +                       break;
>> +
>> +               err = reset_control_deassert(powergate->reset[i]);
>> +               if (err)
>> +                       return err;
>> +       }
> Same remark for the reset assert/deassert order.
Like the clk enable/disable order, this should be fine. :)

>
>> +
>> +       return 0;
>> +}
>> +
>> +static int get_regulator(struct tegra_powergate *powergate)
> Name confusingly close to regulator_get, please prefix.
OK.

>
>> +{
>> +       struct platform_device *pdev;
>> +
>> +       if (!powergate->need_vdd)
>> +               return -EINVAL;
>> +
>> +       if (powergate->vdd && !IS_ERR(powergate->vdd))
>> +               return 0;
>> +
>> +       pdev = of_find_device_by_node(powergate->of_node);
>> +       if (!pdev)
>> +               return -EINVAL;
>> +
>> +       powergate->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
>> +       if (IS_ERR(powergate->vdd))
>> +               return -EINVAL;
>> +
>> +       return 0;
>> +}
>> +
>> +static int tegra_pmc_powergate_power_on(struct generic_pm_domain *domain)
>> +{
>> +       struct tegra_powergate *powergate = to_powergate(domain);
>> +       struct tegra_pmc *pmc = powergate->pmc;
>> +       int err;
>> +
>> +       dev_dbg(pmc->dev, "> %s(domain=%p)\n", __func__, domain);
>> +       dev_dbg(pmc->dev, "  name: %s\n", domain->name);
>> +
>> +       if (powergate->need_vdd) {
>> +               err = get_regulator(powergate);
>> +               if (!err) {
>> +                       err = regulator_enable(powergate->vdd);
>> +               }
>> +       } else {
>> +               err = tegra_pmc_powergate_set(powergate, true);
>> +       }
>> +       if (err < 0)
>> +               goto out;
>> +       udelay(10);
>> +
>> +       err = tegra_pmc_powergate_enable_clocks(powergate);
>> +       if (err)
>> +               goto out;
>> +       udelay(10);
>> +
>> +       err = tegra_pmc_powergate_remove_clamping(powergate);
>> +       if (err)
>> +               goto out;
>> +       udelay(10);
>> +
>> +       err = tegra_pmc_powergate_reset_deassert(powergate);
>> +       if (err)
>> +               goto out;
>> +       udelay(10);
>> +
>> +       err = tegra_pmc_powergate_mc_flush_done(powergate);
>> +       if (err)
>> +               goto out;
>> +       udelay(10);
>> +
>> +       tegra_pmc_powergate_disable_clocks(powergate);
>> +
>> +       return 0;
>> +
>> +/* XXX more error handing */
>> +out:
>> +       dev_dbg(pmc->dev, "< %s() = %d\n", __func__, err);
>> +       return err;
>> +}
>> +
>> +static int tegra_pmc_powergate_power_off(struct generic_pm_domain *domain)
>> +{
>> +       struct tegra_powergate *powergate = to_powergate(domain);
>> +       struct tegra_pmc *pmc = powergate->pmc;
>> +       int err;
>> +
>> +       dev_dbg(pmc->dev, "> %s(domain=%p)\n", __func__, domain);
>> +       dev_dbg(pmc->dev, "  name: %s\n", domain->name);
>> +
>> +       /* never turn off this partition */
> s/this partition/these partitions
OK.

>
>> +       switch (powergate->id) {
>> +       case TEGRA_POWERGATE_CPU:
>> +       case TEGRA_POWERGATE_CPU1:
>> +       case TEGRA_POWERGATE_CPU2:
>> +       case TEGRA_POWERGATE_CPU3:
>> +       case TEGRA_POWERGATE_CPU0:
>> +       case TEGRA_POWERGATE_C0NC:
>> +       case TEGRA_POWERGATE_IRAM:
>> +               dev_dbg(pmc->dev, "not disabling always-on partition %s\n",
>> +                       domain->name);
>> +               err = -EINVAL;
>> +               goto out;
>> +       }
>> +
>> +       err = tegra_pmc_powergate_enable_clocks(powergate);
>> +       if (err)
>> +               goto out;
>> +       udelay(10);
>> +
>> +       err = tegra_pmc_powergate_mc_flush(powergate);
>> +       if (err)
>> +               goto out;
>> +       udelay(10);
>> +
>> +       err = tegra_pmc_powergate_reset_assert(powergate);
>> +       if (err)
>> +               goto out;
>> +       udelay(10);
>> +
>> +       tegra_pmc_powergate_disable_clocks(powergate);
>> +       udelay(10);
>> +
>> +       if (powergate->vdd)
>> +               err = regulator_disable(powergate->vdd);
>> +       else
>> +               err = tegra_pmc_powergate_set(powergate, false);
>> +       if (err)
>> +               goto out;
>> +
>> +       return 0;
>> +
>> +/* XXX more error handling */
>> +out:
>> +       dev_dbg(pmc->dev, "< %s() = %d\n", __func__, err);
>> +       return err;
>> +}
>> +
>>   static int powergate_show(struct seq_file *s, void *data)
>>   {
>>          unsigned int i;
>> @@ -429,6 +783,231 @@ static int tegra_powergate_debugfs_init(void)
>>          return 0;
>>   }
>>
>> +static struct generic_pm_domain *
>> +tegra_powergate_of_xlate(struct of_phandle_args *args, void *data)
>> +{
>> +       struct tegra_pmc *pmc = data;
>> +       struct tegra_powergate *powergate;
>> +
>> +       dev_dbg(pmc->dev, "> %s(args=%p, data=%p)\n", __func__, args, data);
>> +
>> +       list_for_each_entry(powergate, &pmc->powergate_list, head) {
>> +               if (!powergate->base.name)
>> +                       continue;
>> +
>> +               if (powergate->id == args->args[0]) {
>> +                       dev_dbg(pmc->dev, "< %s() = %p\n", __func__, powergate);
>> +                       return &powergate->base;
>> +               }
>> +       }
>> +
>> +       dev_dbg(pmc->dev, "< %s() = -ENOENT\n", __func__);
>> +       return ERR_PTR(-ENOENT);
>> +}
>> +
>> +static int of_get_clks(struct tegra_powergate *powergate)
> This function (and the few following ones) should also get a less
> ambiguous name.
OK.

>
>> +{
>> +       struct clk *clk;
>> +       int i;
>> +
>> +       for (i = 0; i < MAX_CLK_NUM; i++) {
>> +               clk = of_clk_get(powergate->of_node, i);
>> +               if (IS_ERR(clk)) {
>> +                       if (PTR_ERR(clk) == -ENOENT)
>> +                               break;
>> +                       else
>> +                               return PTR_ERR(clk);
> ... they should also probably free the resources they managed to
> acquire in case of error.
Will add a error path to handle the error and clk_put the clocks.

Thanks,
Vince

>
> I cannot comment on the DT bindings - Peter and Thierry are probably
> the best persons for that. I just wonder if we should not define them
> all under a global power-domains node that would be the only one to
> match the compatible property whereas the childs would define the
> individual domains (a bit like pinmux definitions). But globally the
> idea seems sound to me.
