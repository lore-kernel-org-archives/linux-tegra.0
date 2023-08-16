Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCFAC41513
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Aug 2023 03:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241617AbjHPDhL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Aug 2023 23:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241627AbjHPDeq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Aug 2023 23:34:46 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD5D268A
        for <linux-tegra@vger.kernel.org>; Tue, 15 Aug 2023 20:34:06 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-26b41d5e440so1881989a91.2
        for <linux-tegra@vger.kernel.org>; Tue, 15 Aug 2023 20:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692156845; x=1692761645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ho1xWswzBWJltnP/BgRf3hz1gdYQ11cx/yP6Mw3g24A=;
        b=AvwkA4rhY++l1fdplBqLVW9V0Yf1RabjiCG4Ur1B9uMzSFJNgCIwOAnUbbfyT5FAyj
         /DOWFRLsPgb0adunCBhYZcAF8Ko5KuJXBH4CR8eLO0Rkr8jCnYsafTtUodM/F4eqpaIQ
         svt6RSf9W6a1FpJ8Fi9JMR3QwtTgEcjACulfMNzui6PjWkNX1pmas4PdvzzpF8gr/Sjv
         IC1nME7h63APgDdHxfk0PKLI03GzhF82M5R8liLllCe11j9orcofvtdBTmaueN88lrRs
         c6Glx6brkzcKIUXl8D9Ra4sC91jJCdr4gI1mm4p7lYG7osIUONnqPIsIGuQiwLk2FeKQ
         rcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692156845; x=1692761645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ho1xWswzBWJltnP/BgRf3hz1gdYQ11cx/yP6Mw3g24A=;
        b=QXctSuZ0MqzC0CQkaFs8KST8AeMi38Kk1L9dU7yfqPovI9Fhli63oBz04qcHiy3VAx
         dBz4ER12KOapC8uNkzH0yS5VK3mETfmhMSzW7fTLLnsaWS9S/bacGHBi4ES+0XKzNIMz
         w5zDDnOpWRO18c6b4AunIZrUqXBLajYpwOcpfbczmj+V6fzji3+wAqlkuCyz6aj1ypqc
         FtSfL6EmS31pP/1yjM7MWGVj6Q4aixfmAs/2/S+yaD//uhqjqZ+lYEN7QZZfGfBSo0cY
         3z4O+lZK0P9EKV0/Pl6YW9H79dn7AZSXdgeUOevaNpCiC84gUvTiHDDFlF1OFClR9mQM
         AT+g==
X-Gm-Message-State: AOJu0Yw3dTOx6gW14fmXWgv6QyWZdyGLQE9SgtCs6lkXW8J5zUiPb4Gd
        L6Ye43WPZnp4gdUA6r4DZjjjRA==
X-Google-Smtp-Source: AGHT+IE//fl6CddVHalArQMa0Mdw/URP8nlgbkZBQEqW7OjkOWkOa9Y9KgVkLH4F4KlTfbv3QhgkCA==
X-Received: by 2002:a17:90a:69a1:b0:262:e742:f419 with SMTP id s30-20020a17090a69a100b00262e742f419mr348551pjj.47.1692156845560;
        Tue, 15 Aug 2023 20:34:05 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id 16-20020a17090a031000b002696aeb72e5sm13108238pje.2.2023.08.15.20.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 20:34:04 -0700 (PDT)
Date:   Wed, 16 Aug 2023 09:04:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rafael@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [Patch] cpufreq: tegra194: remove opp table in exit hook
Message-ID: <20230816033402.3abmugb5goypvllm@vireshk-i7>
References: <20230809153455.29056-1-sumitg@nvidia.com>
 <20230810053127.y4wmumlggkro7r66@vireshk-i7>
 <17b11665-874a-5b06-bc97-70f5202f238b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b11665-874a-5b06-bc97-70f5202f238b@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 14-08-23, 23:43, Sumit Gupta wrote:
> On 10/08/23 11:01, Viresh Kumar wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On 09-08-23, 21:04, Sumit Gupta wrote:
> > > Add exit hook and remove OPP table when all the CPU's in a policy
> > > are offlined. It will fix the below error messages when onlining
> > > first CPU from a policy whose all CPU's were previously offlined.
> > > 
> > >   debugfs: File 'cpu5' in directory 'opp' already present!
> > >   debugfs: File 'cpu6' in directory 'opp' already present!
> > >   debugfs: File 'cpu7' in directory 'opp' already present!
> > > 
> > > Fixes: f41e1442ac5b ("cpufreq: tegra194: add OPP support and set bandwidth")
> > > Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> > > ---
> > >   drivers/cpufreq/tegra194-cpufreq.c | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> > > index c90b30469165..66a9c23544db 100644
> > > --- a/drivers/cpufreq/tegra194-cpufreq.c
> > > +++ b/drivers/cpufreq/tegra194-cpufreq.c
> > > @@ -454,6 +454,8 @@ static int tegra_cpufreq_init_cpufreq_table(struct cpufreq_policy *policy,
> > >                if (ret < 0)
> > >                        return ret;
> > > 
> > > +             dev_pm_opp_put(opp);
> > > +
> > >                freq_table[j].driver_data = pos->driver_data;
> > >                freq_table[j].frequency = pos->frequency;
> > >                j++;
> > > @@ -508,6 +510,16 @@ static int tegra194_cpufreq_init(struct cpufreq_policy *policy)
> > >        return 0;
> > >   }
> > > 
> > > +static int tegra194_cpufreq_exit(struct cpufreq_policy *policy)
> > > +{
> > > +     struct device *cpu_dev = get_cpu_device(policy->cpu);
> > > +
> > > +     dev_pm_opp_remove_all_dynamic(cpu_dev);
> > > +     dev_pm_opp_of_cpumask_remove_table(policy->related_cpus);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >   static int tegra194_cpufreq_set_target(struct cpufreq_policy *policy,
> > >                                       unsigned int index)
> > >   {
> > > @@ -535,6 +547,7 @@ static struct cpufreq_driver tegra194_cpufreq_driver = {
> > >        .target_index = tegra194_cpufreq_set_target,
> > >        .get = tegra194_get_speed,
> > >        .init = tegra194_cpufreq_init,
> > > +     .exit = tegra194_cpufreq_exit,
> > >        .attr = cpufreq_generic_attr,
> > >   };
> > 
> > If it is only about hotplugging of the CPUs, then you can also do this I guess.
> > 
> > commit 263abfe74b5f ("cpufreq: dt: Implement online/offline() callbacks")

You should do this as well, this makes hotplugging paths much faster. i.e. on
top of this patch.

> > But since your driver is capable of being built as a module, I suggest you try
> > to build it as one and insert remove it multiple times. It must cause you some
> > trouble as you don't implement an .exit() before this patch.
> > 
> > Eventually, I think you need to do both, what this patch and 263abfe74b5f do.
> > Just that the reasons need to be correct for both the changes.
> > 
> > --
> > viresh
> 
> Hi Viresh,
> I got the same message on inserting and removing the module multiple times
> as you suggested. After applying this change, the message is not coming. So,
> the current change is resolving both scenarios as __cpufreq_offline() calls
> either exit() or offline().
> I can update the commit message to mention both scenarios and keep change as
> it is?
> 
>   cpufreq_remove_dev
>   |-__cpufreq_offline
>   |--tegra194_cpufreq_exit
> 
>   cpuhp_cpufreq_offline
>   |-__cpufreq_offline
>   |--tegra194_cpufreq_exit

-- 
viresh
