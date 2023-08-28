Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4B3C83F19
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Aug 2023 10:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjH1KR5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Aug 2023 06:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbjH1KRf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Aug 2023 06:17:35 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA70119B
        for <linux-tegra@vger.kernel.org>; Mon, 28 Aug 2023 03:17:24 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68a410316a2so2130609b3a.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Aug 2023 03:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693217844; x=1693822644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5eZsxRxv+CQTRUY7A/T7Jkd4dX0Ikc5XaKyAkP131uo=;
        b=To/JKiCa2vTswPz+vcuEe9l1osMwbns2sF0xYnhfBBoe0lG5Z7w4ekpCaEmHlP/0Je
         Iej4LW0sbaMP5RkUoW3mqytTouTf6mYvAAkMya4XQoqtZ7+LOH3Yv0OSIMt4lIdfJthY
         EOBE1q69DG/phunf5iFI7y5aqs20Qc7M0YMsE/qEIdxaZxCZEa1V3YnXDHY6gsN2xqXl
         yCorBOZ9MNrNWL71cv4UFotVAWaD7GcCdJ+387W6Uf4Br6fKgLKoGZH+wQm8utatzx+n
         ZR/2s28mBVN6vJtLVnCtaXINLPwAxSZuwsyR9LbyrclQtH6eXb4W3oIPxrq+khYZ+Wxt
         7YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693217844; x=1693822644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eZsxRxv+CQTRUY7A/T7Jkd4dX0Ikc5XaKyAkP131uo=;
        b=eqnyEz+KYQetehjGaA0QeOqGkbC9xGNrf4sPaf2w6U4heKkKB6fvwh8qLll2JN2w3o
         md3o26sGv1c5JyOSqcrjy+i+1TrAq8TY8X30A23aPc8jdvjaJoNPmgzmCKaaGEwlN190
         CLr7+6HcTAsYmeeTSfOzhJQJ7Mc2fl31CH6qa0m4ddYPxtAOtP0QNpQPoTOaRfGMe9GD
         k8XOvRDRNX+73hAjZDIddwdjpiqL3Il8FriBJNlYtxYC981jOuxVH01I9rPJ/9jUbpxH
         fwJGorR+uu45oKIu0oKjkIRBzekoE/HTL2/JrhsCU0FHLAplyZQbgHSh/7KXl7zhorIV
         BSMw==
X-Gm-Message-State: AOJu0YyhXSVNW2fy17GHTEEWzZ7YVFiodT5bF3KqmPqKHaYg/j1tioCD
        1fL4wxkGbsaZs5Bb6AGscf9H6A==
X-Google-Smtp-Source: AGHT+IG5eYyKxQ7v4BeSYTP68ZLyOM0a+2UD6jhzG4o1aaQzmzh48JM6+NSHjC/PrFyhQzDxn0ocYQ==
X-Received: by 2002:a05:6a20:2449:b0:13f:3d25:d83 with SMTP id t9-20020a056a20244900b0013f3d250d83mr24662771pzc.19.1693217844123;
        Mon, 28 Aug 2023 03:17:24 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id t25-20020a63a619000000b0056da0ae25cdsm6984680pge.80.2023.08.28.03.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 03:17:23 -0700 (PDT)
Date:   Mon, 28 Aug 2023 15:47:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rafael@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [Patch v2] cpufreq: tegra194: remove opp table in exit hook
Message-ID: <20230828101721.zq5vlc53p5umi63c@vireshk-i7>
References: <20230825111617.8069-1-sumitg@nvidia.com>
 <20230828061115.vsepgtexyv3hvffu@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828061115.vsepgtexyv3hvffu@vireshk-i7>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28-08-23, 11:41, Viresh Kumar wrote:
> On 25-08-23, 16:46, Sumit Gupta wrote:
> > Add exit hook and remove OPP table when the device gets unregistered.
> > This will fix the error messages when the CPU FREQ driver module is
> > removed and then re-inserted. It also fixes these messages while
> > onlining the first CPU from a policy whose all CPU's were previously
> > offlined.
> > 
> >  debugfs: File 'cpu5' in directory 'opp' already present!
> >  debugfs: File 'cpu6' in directory 'opp' already present!
> >  debugfs: File 'cpu7' in directory 'opp' already present!
> > 
> > Fixes: f41e1442ac5b ("cpufreq: tegra194: add OPP support and set bandwidth")
> > Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> > ---
> > 
> > v1[1] -> v2:
> > - updated commit description.
> > 
> > [1] https://lore.kernel.org/lkml/20230809153455.29056-1-sumitg@nvidia.com/
> > 
> >  drivers/cpufreq/tegra194-cpufreq.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> > index c90b30469165..66a9c23544db 100644
> > --- a/drivers/cpufreq/tegra194-cpufreq.c
> > +++ b/drivers/cpufreq/tegra194-cpufreq.c
> > @@ -454,6 +454,8 @@ static int tegra_cpufreq_init_cpufreq_table(struct cpufreq_policy *policy,
> >  		if (ret < 0)
> >  			return ret;
> >  
> > +		dev_pm_opp_put(opp);
> > +
> 
> Missed this earlier, can you please do this in a separate patch please
> ?

I have pushed rest of this commit and dropped this part. Send it
separately. Thanks.

-- 
viresh
