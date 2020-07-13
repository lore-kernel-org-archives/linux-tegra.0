From: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ PATCH v4 3/4] cpufreq: Add Tegra194 cpufreq
 driver
Date: Mon, 13 Jul 2020 19:59:28 +0530
Message-ID: <0d04d2c8-8f87-ecc7-9bd6-633d84b60e8b@nvidia.com>
References: <1593186236-12760-1-git-send-email-sumitg@nvidia.com>
 <1593186236-12760-4-git-send-email-sumitg@nvidia.com>
 <20200629061639.7cwxfi64drkof6yu@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200629061639.7cwxfi64drkof6yu@vireshk-i7>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



> 
> On 26-06-20, 21:13, Sumit Gupta wrote:
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
> 
> This will call destroy_workqueue() eventually and it will crash your
> kernel.
> 
> Apart from this, this stuff looks okay. Don't resend the patch just
> yet (and if required, send only this patch using --in-reply-to flag
> for git send email). Lets wait for an Ack from Rob for the first two
> patches.
> 
Sorry for the delayed response as i was on PTO.
Thank you for the feedback.

Have posted a v5 based on v4 patch set.

>> +     }
>> +
> 
> --
> viresh
> 
