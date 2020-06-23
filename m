From: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ Patch v3 3/4] cpufreq: Add Tegra194 cpufreq
 driver
Date: Tue, 23 Jun 2020 10:49:18 +0530
Message-ID: <ed6956a3-3f77-2943-6387-5affc25b59d2@nvidia.com>
References: <1592775274-27513-1-git-send-email-sumitg@nvidia.com>
 <1592775274-27513-4-git-send-email-sumitg@nvidia.com>
 <20200622072052.uryxo4hri6gzrkku@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200622072052.uryxo4hri6gzrkku@vireshk-i7>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Viresh,

Thank you for the review. please find my reply inline.


>> +++ b/drivers/cpufreq/tegra194-cpufreq.c
>> @@ -0,0 +1,403 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved
> 
>                      2020
> 
>> + */
>> +
>> +#include <linux/cpu.h>
>> +#include <linux/cpufreq.h>
>> +#include <linux/delay.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +
>> +#include <asm/smp_plat.h>
>> +
>> +#include <soc/tegra/bpmp.h>
>> +#include <soc/tegra/bpmp-abi.h>
>> +
>> +#define KHZ                     1000
>> +#define REF_CLK_MHZ             408 /* 408 MHz */
>> +#define US_DELAY                500
>> +#define US_DELAY_MIN            2
>> +#define CPUFREQ_TBL_STEP_HZ     (50 * KHZ * KHZ)
>> +#define MAX_CNT                 ~0U
>> +
>> +/* cpufreq transisition latency */
>> +#define TEGRA_CPUFREQ_TRANSITION_LATENCY (300 * 1000) /* unit in nanoseconds */
>> +
>> +#define LOOP_FOR_EACH_CPU_OF_CLUSTER(cl) for (cpu = (cl * 2); \
>> +                                     cpu < ((cl + 1) * 2); cpu++)
> 
> Both latency and this loop are used only once in the code, maybe just open code
> it. Also you should have passed cpu as a parameter to the macro, even if it
> works fine without it, for better readability.
> 
Ok, i will open code the loop in next version. For latency value, i feel 
named macro makes readability better. So, prefer keeping it.

>> +
>> +u16 map_freq_to_ndiv(struct mrq_cpu_ndiv_limits_response *nltbl, u32 freq)
> 
> Unused routine
> 
Sure, will remove it.

>> +{
>> +     return DIV_ROUND_UP(freq * nltbl->pdiv * nltbl->mdiv,
>> +                         nltbl->ref_clk_hz / KHZ);
>> +}
> 
>> +static int tegra194_cpufreq_init(struct cpufreq_policy *policy)
>> +{
>> +     struct tegra194_cpufreq_data *data = cpufreq_get_driver_data();
>> +     int cl = get_cpu_cluster(policy->cpu);
>> +     u32 cpu;
>> +
>> +     if (cl >= data->num_clusters)
>> +             return -EINVAL;
>> +
>> +     policy->cur = tegra194_fast_get_speed(policy->cpu); /* boot freq */
>> +
>> +     /* set same policy for all cpus in a cluster */
>> +     LOOP_FOR_EACH_CPU_OF_CLUSTER(cl)
>> +             cpumask_set_cpu(cpu, policy->cpus);
>> +
>> +     policy->freq_table = data->tables[cl];
>> +     policy->cpuinfo.transition_latency = TEGRA_CPUFREQ_TRANSITION_LATENCY;
>> +
>> +     return 0;
>> +}
> 
>> +static int tegra194_cpufreq_set_target(struct cpufreq_policy *policy,
>> +                                    unsigned int index)
>> +{
>> +     struct cpufreq_frequency_table *tbl = policy->freq_table + index;
>> +
>> +     on_each_cpu_mask(policy->cpus, set_cpu_ndiv, tbl, true);
> 
> I am still a bit confused. While setting the frequency you are calling this
> routine for each CPU of the policy (cluster). Does that mean that CPUs within a
> cluster can actually run at different frequencies at any given point of time ?
> 
> If cpufreq terms, a cpufreq policy represents a group of CPUs that change
> frequency together, i.e. they share the clk line. If all CPUs in your system can
> do DVFS separately, then you must have policy per CPU, instead of cluster.
> 
T194 supports four CPU clusters, each with two cores. Each CPU cluster 
is capable of running at a specific frequency sourced by respective 
NAFLL to provide cluster specific clocks. Individual cores within a 
cluster write freq in per core register. Cluster h/w forwards the 
max(core0, core1) request to per cluster NAFLL.

>> +static void tegra194_cpufreq_free_resources(void)
>> +{
>> +     flush_workqueue(read_counters_wq);
> 
> Why is this required exactly? I see that you add the work request and
> immediately flush it, then why would you need to do this separately ?
> 
Ya, will remove flush_workqueue().

>> +     destroy_workqueue(read_counters_wq);
>> +}
>> +
>> +static struct cpufreq_frequency_table *
>> +init_freq_table(struct platform_device *pdev, struct tegra_bpmp *bpmp,
>> +             unsigned int cluster_id)
>> +{
>> +     struct cpufreq_frequency_table *freq_table;
>> +     struct mrq_cpu_ndiv_limits_response resp;
>> +     unsigned int num_freqs, ndiv, delta_ndiv;
>> +     struct mrq_cpu_ndiv_limits_request req;
>> +     struct tegra_bpmp_message msg;
>> +     u16 freq_table_step_size;
>> +     int err, index;
>> +
>> +     memset(&req, 0, sizeof(req));
>> +     req.cluster_id = cluster_id;
>> +
>> +     memset(&msg, 0, sizeof(msg));
>> +     msg.mrq = MRQ_CPU_NDIV_LIMITS;
>> +     msg.tx.data = &req;
>> +     msg.tx.size = sizeof(req);
>> +     msg.rx.data = &resp;
>> +     msg.rx.size = sizeof(resp);
>> +
>> +     err = tegra_bpmp_transfer(bpmp, &msg);
> 
> So the firmware can actually return different frequency tables for the clusters,
> right ? Else you could have received the table only once and used it for all the
> CPUs.
> 
Yes, frequency tables are returned per cluster by BPMP firmware. In T194 
SOC, currently same table values are used for all clusters. This might 
change in future.

>> +     if (err)
>> +             return ERR_PTR(err);
>> +
>> +     /*
>> +      * Make sure frequency table step is a multiple of mdiv to match
>> +      * vhint table granularity.
>> +      */
>> +     freq_table_step_size = resp.mdiv *
>> +                     DIV_ROUND_UP(CPUFREQ_TBL_STEP_HZ, resp.ref_clk_hz);
>> +
>> +     dev_dbg(&pdev->dev, "cluster %d: frequency table step size: %d\n",
>> +             cluster_id, freq_table_step_size);
>> +
>> +     delta_ndiv = resp.ndiv_max - resp.ndiv_min;
>> +
>> +     if (unlikely(delta_ndiv == 0))
>> +             num_freqs = 1;
>> +     else
>> +             /* We store both ndiv_min and ndiv_max hence the +1 */
>> +             num_freqs = delta_ndiv / freq_table_step_size + 1;
>> +
>> +     num_freqs += (delta_ndiv % freq_table_step_size) ? 1 : 0;
>> +
>> +     freq_table = devm_kcalloc(&pdev->dev, num_freqs + 1,
>> +                               sizeof(*freq_table), GFP_KERNEL);
>> +     if (!freq_table)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     for (index = 0, ndiv = resp.ndiv_min;
>> +                     ndiv < resp.ndiv_max;
>> +                     index++, ndiv += freq_table_step_size) {
>> +             freq_table[index].driver_data = ndiv;
>> +             freq_table[index].frequency = map_ndiv_to_freq(&resp, ndiv);
>> +     }
>> +
>> +     freq_table[index].driver_data = resp.ndiv_max;
>> +     freq_table[index++].frequency = map_ndiv_to_freq(&resp, resp.ndiv_max);
>> +     freq_table[index].frequency = CPUFREQ_TABLE_END;
>> +
>> +     return freq_table;
>> +}
> 
> --
> viresh
> 
