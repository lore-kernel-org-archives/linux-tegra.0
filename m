Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCAAC83F16
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Aug 2023 09:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbjH2JEP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Aug 2023 05:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234408AbjH2JDt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Aug 2023 05:03:49 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC2D1A4
        for <linux-tegra@vger.kernel.org>; Tue, 29 Aug 2023 02:03:46 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68a3f1d8be2so3282229b3a.3
        for <linux-tegra@vger.kernel.org>; Tue, 29 Aug 2023 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693299826; x=1693904626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ORZiB94/bjq/zwPr1B87oo/KGJsoCMW7VqIJI5SB3aI=;
        b=uFfiEzXN0A0a2rGrhDxfqXkk8Xtd96BTxJxumJSKxcYnL2WuJkpp5xKIrByXK0nLQ7
         /kJBnmekbrxYuJ4kBakDaTcM5VBuhcnp1qNqjflhUudi3FlHetF+ed2ZatOuvJbjzjJM
         K5LrH251uaGUa7N6mYzYZKnvkOFOBX3TKmdG8TJF27oz1GDTMuehJeCzDHYQHtdpXRlM
         Dj5RHD5tMUaAVyXX7cKdtBdPEzitDJPl2Q1n+GBtvBhnDZd+OolcsfYQdFvt5VhiOUPp
         wsniCq7Tgk2+8vbre7gVz0Yc4DARe384FymQP+IgJU2Ib0aYFJNeL8zuhBTI9PxlIybh
         G1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693299826; x=1693904626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORZiB94/bjq/zwPr1B87oo/KGJsoCMW7VqIJI5SB3aI=;
        b=ax9pdIhllANKCgs6056COS28NbOKftuAikLSit1d5Px9iXbYoslaDXbMVWjm5hkLlg
         HtImdB2PxaI/12uwiFj6+m6wPTTp0TZuENZRS+02JXlyq2QMA+czxZ6WNHKFTg62keoD
         5OrCSpv1Xujo0xJHsuemXd/FTVv4HnXHcPyAOexPezYJQCQ0BI4uuFMks+OaSbAg0Euf
         nIqhYGbrTwjuY0PmvyjuFOGXnhfFg1h+LHvOHNxpXGGEeJYqWvRRG9NMH0C3Vc+WGWzu
         0Vnoozh77w5IPWL+1bBef6rdPwgr+fBri5rY369ZX1XdvjohuVx8phVbFDGMdz0rs8OD
         CRxA==
X-Gm-Message-State: AOJu0Yw3P3V9S37e1+0or9lIcOx+Wuxll/I31MQOLDqZRfTr1M5HMs6n
        axc31ILF7tF/l8C6kiMHeZLbrw==
X-Google-Smtp-Source: AGHT+IGxIYjt92oKdEgN1Tkfh7Y6aYrB5m136ynE5+UkbRi5VNPnmqvDRiUhxAz6JBCEoOZgUqOUGw==
X-Received: by 2002:a05:6a00:cc1:b0:68a:570f:e36a with SMTP id b1-20020a056a000cc100b0068a570fe36amr29336238pfv.4.1693299826001;
        Tue, 29 Aug 2023 02:03:46 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id t25-20020aa79399000000b0068be4ce33easm8199639pfe.96.2023.08.29.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 02:03:45 -0700 (PDT)
Date:   Tue, 29 Aug 2023 14:33:43 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rafael@kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        treding@nvidia.com, jonathanh@nvidia.com, bbasu@nvidia.com
Subject: Re: [Patch v2] cpufreq: tegra194: fix warning due to missing opp_put
Message-ID: <20230829090343.kyyfsienwo4aiu2p@vireshk-i7>
References: <20230829084322.30558-1-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829084322.30558-1-sumitg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29-08-23, 14:13, Sumit Gupta wrote:
> Fix the warning due to missing dev_pm_opp_put() call and hence
> wrong refcount value. This causes below warning message when
> trying to remove the module.
> 
>  Call trace:
>   dev_pm_opp_put_opp_table+0x154/0x15c
>   dev_pm_opp_remove_table+0x34/0xa0
>   _dev_pm_opp_cpumask_remove_table+0x7c/0xbc
>   dev_pm_opp_of_cpumask_remove_table+0x10/0x18
>   tegra194_cpufreq_exit+0x24/0x34 [tegra194_cpufreq]
>   cpufreq_remove_dev+0xa8/0xf8
>   subsys_interface_unregister+0x90/0xe8
>   cpufreq_unregister_driver+0x54/0x9c
>   tegra194_cpufreq_remove+0x18/0x2c [tegra194_cpufreq]
>   platform_remove+0x24/0x74
>   device_remove+0x48/0x78
>   device_release_driver_internal+0xc8/0x160
>   driver_detach+0x4c/0x90
>   bus_remove_driver+0x68/0xb8
>   driver_unregister+0x2c/0x58
>   platform_driver_unregister+0x10/0x18
>   tegra194_ccplex_driver_exit+0x14/0x1e0 [tegra194_cpufreq]
>   __arm64_sys_delete_module+0x184/0x270
> 
> Fixes: f41e1442ac5b ("cpufreq: tegra194: add OPP support and set bandwidth")
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  drivers/cpufreq/tegra194-cpufreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index 88ef5e57ccd0..9d7e1d58f6e5 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -450,6 +450,7 @@ static int tegra_cpufreq_init_cpufreq_table(struct cpufreq_policy *policy,
>  		if (IS_ERR(opp))
>  			continue;
>  
> +		dev_pm_opp_put(opp);
>  		ret = dev_pm_opp_enable(cpu_dev, pos->frequency * KHZ);
>  		if (ret < 0)
>  			return ret;

Applied. Thanks.

-- 
viresh
