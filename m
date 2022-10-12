Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02988C4332F
	for <linux-tegra@archiver.kernel.org>; Wed, 12 Oct 2022 03:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiJLDHj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 Oct 2022 23:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJLDHh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 Oct 2022 23:07:37 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601589C7F7
        for <linux-tegra@vger.kernel.org>; Tue, 11 Oct 2022 20:07:34 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id x6so15019410pll.11
        for <linux-tegra@vger.kernel.org>; Tue, 11 Oct 2022 20:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNJfRDpcAKr8ACE2m9HF/GFLqzPGRxixlVowBczXTN8=;
        b=LJGbU33DU05/QCkrNRdRZMPdtH86dbxeLyFu56M3N6Dy7DlkQKw6F3+VvZKMrtjWkp
         XFlr1rznO7kd0CNzyXGywLJdYpa/I4gxBkep+Gozw9w+Jw/UEMBSgvqvXl+4JkPo84Bt
         OEp15uaNtDBL4WRg/7nl/WLZ4sPwy3365ZLUhAYOU1E7ygM6rwkhvKriM1KDV0ZEjVsI
         65TPwGnC3orOVCp/TIhDs+hQ65kXGuZpwYmOh0KZXVIWOVvslYWwZANEze3+1EQx7qDj
         egtTLWTS1sxL+ZRhf6VUjJ/zj9rygzOwIATQOTa6NzXIahGpY7n5PzNy4aXT2xNfRTaz
         Fq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNJfRDpcAKr8ACE2m9HF/GFLqzPGRxixlVowBczXTN8=;
        b=iv1HBbm9QXjsgN+9tXSkzHmls0IuPJpskk/B6AcPR81bAAXYOie1PQqNVH3BjDC8f5
         TcwA7YXNsbuHjWVAK85T7hySR2qsRUK5T06D73NbmL3jd26txwrjKmUsYs/J1A338/Y6
         PDhV/KcJ2JCmVtMJbOld0ijoZ+NfmFXJWXQG4rVSy0Wfxg4DqE/HjFcGkc5ENdG8QhVr
         cwtIrtDz0UbwwO5UnbMefyDVrkHzpP1twDgNhK5rFYb5AkXX/fn4V/J1S76ylGgkJpGF
         df5fQXzeYqrE/jEbpzQwj0osNMSJVlomJGI2b101gt/HDJzbnYTF1RAAlcsAvVOJ2wWz
         pM7Q==
X-Gm-Message-State: ACrzQf2dIHmFy8aDwTNkL5A0Q/3y4fctRoauZLa5oAEHVnxSvZi8ApyF
        eRmNKAtwZiSvbK+OrZ9kekHwKA==
X-Google-Smtp-Source: AMsMyM4SI9rtKMOewPCH+amLCTl8+42jCoz9oy7gWSooXLChf8G5zzs73Jwjwref8q3ms7C9ce4NiA==
X-Received: by 2002:a17:90b:17cf:b0:20d:72eb:fd0c with SMTP id me15-20020a17090b17cf00b0020d72ebfd0cmr2550871pjb.217.1665544053822;
        Tue, 11 Oct 2022 20:07:33 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id l7-20020a17090a660700b002037a4e913bsm283774pjj.44.2022.10.11.20.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 20:07:32 -0700 (PDT)
Date:   Wed, 12 Oct 2022 08:37:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra194: Fix module loading
Message-ID: <20221012030729.avte3mhtzat36nme@vireshk-i7>
References: <20221011153243.133712-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011153243.133712-1-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11-10-22, 16:32, Jon Hunter wrote:
> When the Tegra194 CPUFREQ driver is built as a module it is not
> automatically loaded as expected on Tegra194 devices. Populate the
> MODULE_DEVICE_TABLE to fix this.
> 
> Fixes: df320f89359c ("cpufreq: Add Tegra194 cpufreq driver")

Added:

    Cc: v5.9+ <stable@vger.kernel.org> # v5.9+

> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/cpufreq/tegra194-cpufreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index c2004cae3f02..4596c3e323aa 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -589,6 +589,7 @@ static const struct of_device_id tegra194_cpufreq_of_match[] = {
>  	{ .compatible = "nvidia,tegra239-ccplex-cluster", .data = &tegra239_cpufreq_soc },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, tegra194_cpufreq_of_match);
>  
>  static struct platform_driver tegra194_ccplex_driver = {
>  	.driver = {

Applied. Thanks.

-- 
viresh
