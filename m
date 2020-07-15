From: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ PATCH v5 3/4] cpufreq: Add Tegra194 cpufreq
 driver
Date: Wed, 15 Jul 2020 18:01:03 +0530
Message-ID: <f2cbe396-6c55-3e22-84b6-fd93db88fab7@nvidia.com>
References: <1594649209-29394-1-git-send-email-sumitg@nvidia.com>
 <1594649209-29394-4-git-send-email-sumitg@nvidia.com>
 <20200715111631.o46qgajh56pjkwfo@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200715111631.o46qgajh56pjkwfo@vireshk-i7>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thank you for the review,

>> Add support for CPU frequency scaling on Tegra194. The frequency
>> of each core can be adjusted by writing a clock divisor value to
>> a MSR on the core. The range of valid divisors is queried from
>> the BPMP.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/cpufreq/Kconfig.arm        |   6 +
>>   drivers/cpufreq/Makefile           |   1 +
>>   drivers/cpufreq/tegra194-cpufreq.c | 397 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 404 insertions(+)
>>   create mode 100644 drivers/cpufreq/tegra194-cpufreq.c
>>
>> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
>> index 15c1a12..f3d8f09 100644
>> --- a/drivers/cpufreq/Kconfig.arm
>> +++ b/drivers/cpufreq/Kconfig.arm
>> @@ -314,6 +314,12 @@ config ARM_TEGRA186_CPUFREQ
>>        help
>>          This adds the CPUFreq driver support for Tegra186 SOCs.
>>
>> +config ARM_TEGRA194_CPUFREQ
>> +     tristate "Tegra194 CPUFreq support"
>> +     depends on ARCH_TEGRA && TEGRA_BPMP
> 
> Shouldn't this depend on ARCH_TEGRA_194_SOC instead ? And I asked you
> to add a default y here itself instead of patch 4/4.
> 
Ok.

>> +     help
>> +       This adds CPU frequency driver support for Tegra194 SOCs.
>> +
>>   config ARM_TI_CPUFREQ
>>        bool "Texas Instruments CPUFreq support"
>>        depends on ARCH_OMAP2PLUS
>> diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
>> index f6670c4..66b5563 100644
>> --- a/drivers/cpufreq/Makefile
>> +++ b/drivers/cpufreq/Makefile
>> @@ -83,6 +83,7 @@ obj-$(CONFIG_ARM_TANGO_CPUFREQ)             += tango-cpufreq.o
>>   obj-$(CONFIG_ARM_TEGRA20_CPUFREQ)    += tegra20-cpufreq.o
>>   obj-$(CONFIG_ARM_TEGRA124_CPUFREQ)   += tegra124-cpufreq.o
>>   obj-$(CONFIG_ARM_TEGRA186_CPUFREQ)   += tegra186-cpufreq.o
>> +obj-$(CONFIG_ARM_TEGRA194_CPUFREQ)   += tegra194-cpufreq.o
>>   obj-$(CONFIG_ARM_TI_CPUFREQ)         += ti-cpufreq.o
>>   obj-$(CONFIG_ARM_VEXPRESS_SPC_CPUFREQ)       += vexpress-spc-cpufreq.o
>>
>> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
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
> 
> You need {} in the if else blocks here because of the comment here.
> 
Ok.

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
>> +
>> +static int tegra194_cpufreq_probe(struct platform_device *pdev)
>> +{
>> +     struct tegra194_cpufreq_data *data;
>> +     struct tegra_bpmp *bpmp;
>> +     int err, i;
>> +
>> +     data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>> +     if (!data)
>> +             return -ENOMEM;
>> +
>> +     data->num_clusters = MAX_CLUSTERS;
>> +     data->tables = devm_kcalloc(&pdev->dev, data->num_clusters,
>> +                                 sizeof(*data->tables), GFP_KERNEL);
>> +     if (!data->tables)
>> +             return -ENOMEM;
>> +
>> +     platform_set_drvdata(pdev, data);
>> +
>> +     bpmp = tegra_bpmp_get(&pdev->dev);
>> +     if (IS_ERR(bpmp))
>> +             return PTR_ERR(bpmp);
>> +
>> +     read_counters_wq = alloc_workqueue("read_counters_wq", __WQ_LEGACY, 1);
>> +     if (!read_counters_wq) {
>> +             dev_err(&pdev->dev, "fail to create_workqueue\n");
>> +             err = -EINVAL;
>> +             goto put_bpmp;
>> +     }
>> +
>> +     for (i = 0; i < data->num_clusters; i++) {
>> +             data->tables[i] = init_freq_table(pdev, bpmp, i);
>> +             if (IS_ERR(data->tables[i])) {
>> +                     err = PTR_ERR(data->tables[i]);
>> +                     goto err_free_res;
>> +             }
>> +     }
>> +
>> +     tegra194_cpufreq_driver.driver_data = data;
>> +
>> +     err = cpufreq_register_driver(&tegra194_cpufreq_driver);
>> +     if (err)
>> +             goto err_free_res;
>> +
>> +     tegra_bpmp_put(bpmp);
>> +
>> +     return err;
> 
> rather just do:
> 
> if (!err)
>          goto put_bpmp;
> 
Sure, will add in next version.

>> +
>> +err_free_res:
>> +     tegra194_cpufreq_free_resources();
>> +put_bpmp:
>> +     tegra_bpmp_put(bpmp);
>> +     return err;
>> +}
> --
> viresh
> 
