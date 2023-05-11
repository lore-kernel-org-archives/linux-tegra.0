Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56848C77B7F
	for <linux-tegra@archiver.kernel.org>; Thu, 11 May 2023 09:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237161AbjEKJDa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 May 2023 05:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236884AbjEKJD2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 May 2023 05:03:28 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D304E2735
        for <linux-tegra@vger.kernel.org>; Thu, 11 May 2023 02:03:24 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1aaf21bb42bso59639945ad.2
        for <linux-tegra@vger.kernel.org>; Thu, 11 May 2023 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683795804; x=1686387804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KF4j5CyhhoHly7+6zDRQTpQulB4Hs5tNYwEh9vRMQE4=;
        b=YmMs7kjfKYYyWyHfwvZwAmtTSWbCMXhCWgomqWLAPDAsZRi64dbY2KaLyqNhBvZPmm
         rrdYp9XxXXgh/1u99nnw05S7wQ0QMJPxenxtGZLtOxN9oGPv+LIDh5Ys5DQnuPydZWKL
         NKPqrBsExnT+2Xay3TcqFK5ysa/ntjZBh+mXFb0umsel20kq3YxMZpYGD/5UV8p/xFEF
         ZFqtjjpqCsY3RCGdmssXPlqrehroYi21G+e8SB+0oOFJGcpfJx6DlPJI48BB1YhPSMGd
         RsW7hE660zXX0HTlak5fLQgKJi4UdE7bv+KjaUl4HFEjn5/twn1wkldlarVKmsdu9MmT
         YZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683795804; x=1686387804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF4j5CyhhoHly7+6zDRQTpQulB4Hs5tNYwEh9vRMQE4=;
        b=liWwNE9gzjhfvuPxZCL0W3BJO9FajaKc3k9bNGuZorQqTDC7yHNpafOW23hZn+0Fvk
         Zgg+DquFJCfoEAb2vkQTDmLzlAmndIG5jxvm8op68ehVVtAC/6sVqAvGNBgz9H5UebQE
         +6k+4F5A+1/Ls9EewALFQVwdevJp/9If1mI3suLqS7mIgwjXqKCugcLLDX91DeQWtGrh
         sg+z7BwWEs97j+Kk1yvem6bl9eRuBHpnF1q6HYs6uvzyYF5mXApY8IjbUXv0+JB2a1+l
         T0qYUalD6ed0roUgorg5mu0/qa638YPHfFCGJap9NFUNUQsmemWhgXGRCjij94AU78ms
         Vldg==
X-Gm-Message-State: AC+VfDyAeH7xnn+ogqSCMHf6H5PAJvx7b+Z2zzGqpz3/aU7F96UpBR++
        J/eD22h+ga+Huy2JLOsOzcU84AXJrJbPd3oZHv4=
X-Google-Smtp-Source: ACHHUZ63/YRTo/PA+R0p5ahIhniwqM2nvsGADq/sNcmBmY7IgJvtr8ka1R9fQKWxbAW6e3OL95ZS2w==
X-Received: by 2002:a17:902:e545:b0:1ac:a661:a4c9 with SMTP id n5-20020a170902e54500b001aca661a4c9mr10103193plf.33.1683795804247;
        Thu, 11 May 2023 02:03:24 -0700 (PDT)
Received: from localhost ([122.172.82.60])
        by smtp.gmail.com with ESMTPSA id q23-20020a170902789700b001a64a2b790fsm5318967pll.164.2023.05.11.02.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 02:03:23 -0700 (PDT)
Date:   Thu, 11 May 2023 14:33:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sumit Gupta <sumitg@nvidia.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra194: Fix an error handling path in
 tegra194_cpufreq_probe()
Message-ID: <20230511090321.sqlni5cf3rpmh7sg@vireshk-i7>
References: <30b17e2219abc3a9a137d28bb51e53732bba5103.1682428267.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30b17e2219abc3a9a137d28bb51e53732bba5103.1682428267.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25-04-23, 15:11, Christophe JAILLET wrote:
> If the probe needs to be deferred, some resources still need to be
> released. So branch to the error handling path instead of returning
> directly.
> 
> Fixes: f41e1442ac5b ("cpufreq: tegra194: add OPP support and set bandwidth")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only
> ---
>  drivers/cpufreq/tegra194-cpufreq.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index c8d03346068a..36dad5ea5947 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -686,8 +686,10 @@ static int tegra194_cpufreq_probe(struct platform_device *pdev)
>  
>  	/* Check for optional OPPv2 and interconnect paths on CPU0 to enable ICC scaling */
>  	cpu_dev = get_cpu_device(0);
> -	if (!cpu_dev)
> -		return -EPROBE_DEFER;
> +	if (!cpu_dev) {
> +		err = -EPROBE_DEFER;
> +		goto err_free_res;
> +	}
>  
>  	if (dev_pm_opp_of_get_opp_desc_node(cpu_dev)) {
>  		err = dev_pm_opp_of_find_icc_paths(cpu_dev, NULL);

Applied. Thanks.

-- 
viresh
