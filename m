Return-Path: <SRS0=jf4o=B7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAABC433E3
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 05:22:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BA862177B
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Aug 2020 05:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GUWTB/OP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgHUFWO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Aug 2020 01:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgHUFWN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Aug 2020 01:22:13 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5C5C061386
        for <linux-tegra@vger.kernel.org>; Thu, 20 Aug 2020 22:22:13 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q93so448558pjq.0
        for <linux-tegra@vger.kernel.org>; Thu, 20 Aug 2020 22:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gJPbQJM9jJ86fcPi19ptKXRC2I1mbN7SAmvcRcwLux0=;
        b=GUWTB/OPy3T59+AQh2JxbbvVrkeifOpDos6Tl7NzF8Gqy4ZMTHKMc47U7wH+wDn0/T
         llxnOfpSBGYj9LpPZ0bz+BC3OI3nD/k22wBJhUeiE4dwfBQrzkz8M4U8LmuoWl4vH8ZF
         R0OxWA0qHvfuazjTQG/R2CVQFoGbUcsOFO/JaBZkqMCvkuyg+dxADzhkum0aZUPaTxkU
         9pILLtAuLcx06h/ekAAhFuJNM3KWrZX8ZFrQWOVZ0aWjGGUzjn4PurNzxFeFB4weYjWa
         y5S5gdxtPgeJNJ0vWLbCFLt7Fek3naJjcLIaYC2EZJJDqI/KVNlkyDLSiN8flRgjwSZt
         21LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gJPbQJM9jJ86fcPi19ptKXRC2I1mbN7SAmvcRcwLux0=;
        b=W3GGsz/i5HTCJIxCruRwFWKPLNP6VAh39dyq924D9dlBM1A8paBlfvTTXw+WlL+wyP
         CSqZqKty/2b+f+e8cGIpt7aClGWt/GI6zGHVSyyyfb/II2BySCLzdZgzJn+eiN+y0xK/
         aMxEl8jk8L+jB8LJ6rNHblwVSwHJo35NJchOPUIrkbKAyLCl0/qjbinSOogak4pVespl
         uLI1+SEp3dYvt+5ToXQPRl/+pQ1rglbMKbgey8NbalZvWS6y8vyrzJbqLjwrABM+61mv
         tgnykpx/so6a7jmoEpxnvPCtEHiHMM1hSjn+j7XaosPGeR4+MvBYXichuGNSiLJ1MNJ4
         +PVQ==
X-Gm-Message-State: AOAM533ERVnVPtlj3OObCGJozUfdiHoljaXK/tOQYsb/lDJcg7Y6pXaH
        wRKgVfXo0XVo69IL4B8pRhKDRg==
X-Google-Smtp-Source: ABdhPJxbHY56srGn6G5rqtXaD33bgNntHBcb5EblCKiLBWgFl5HHCNv12wCAR5ncDzWqdj65SHLbDQ==
X-Received: by 2002:a17:90a:6d96:: with SMTP id a22mr1070139pjk.165.1597987332523;
        Thu, 20 Aug 2020 22:22:12 -0700 (PDT)
Received: from localhost ([122.172.43.13])
        by smtp.gmail.com with ESMTPSA id s67sm940535pfs.117.2020.08.20.22.22.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 22:22:11 -0700 (PDT)
Date:   Fri, 21 Aug 2020 10:52:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     rjw@rjwysocki.net, Sudeep Holla <sudeep.holla@arm.com>
Cc:     Sumit Gupta <sumitg@nvidia.com>, catalin.marinas@arm.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bbasu@nvidia.com, wangkefeng.wang@huawei.com
Subject: Re: [Patch] cpufreq: replace cpu_logical_map with read_cpuid_mpir
Message-ID: <20200821052209.efturkzs2kp4nbcn@vireshk-i7>
References: <1597174997-22505-1-git-send-email-sumitg@nvidia.com>
 <20200820053945.xlwtpkvbt4o23flk@vireshk-i7>
 <20200820123711.GA19989@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820123711.GA19989@bogus>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20-08-20, 13:37, Sudeep Holla wrote:
> On Thu, Aug 20, 2020 at 11:09:45AM +0530, Viresh Kumar wrote:
> > On 12-08-20, 01:13, Sumit Gupta wrote:
> > > Commit eaecca9e7710 ("arm64: Fix __cpu_logical_map undefined issue")
> > > fixes the issue with building tegra194 cpufreq driver as module. But
> > > the fix might cause problem while supporting physical cpu hotplug[1].
> > > 
> > > This patch fixes the original problem by avoiding use of cpu_logical_map().
> > > Instead calling read_cpuid_mpidr() to get MPIDR on target cpu.
> > > 
> > > [1] https://lore.kernel.org/linux-arm-kernel/20200724131059.GB6521@bogus/
> > > 
> > > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > > Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> > > ---
> > >  drivers/cpufreq/tegra194-cpufreq.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > Applied. Thanks.
> 
> Just to confirm, is this going as a fix ? We want to drop exporting
> cpu_logical_map in v5.9 so this needs to go as fix. I missed it earlier,
> actually,
> 
> Fixes: df320f89359c ("cpufreq: Add Tegra194 cpufreq driver")
> is appropriate here so that we can drop export symbol which was part of
> Commit eaecca9e7710 ("arm64: Fix __cpu_logical_map undefined issue")
> as a workaround to  fix the build.

Okay.

Rafael: Please pick this patch directly for next rc with 

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
