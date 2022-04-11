Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE013C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Apr 2022 03:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239522AbiDKDCu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 10 Apr 2022 23:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiDKDCt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 10 Apr 2022 23:02:49 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879865FB5
        for <linux-tegra@vger.kernel.org>; Sun, 10 Apr 2022 20:00:33 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d15so12692631pll.10
        for <linux-tegra@vger.kernel.org>; Sun, 10 Apr 2022 20:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NsvfzGeEol9JMCZvR8qAUpetZ3eFv1g/vaks5It4CXI=;
        b=FeiONeMfEmPzhMQUNqHY3YPc7caljS+ajmTS1XxQZu85GJQMTY3yM238/EGGfsNhpy
         yWWv5IvrCLmmJJaOcYIpnIW7S/iRCZvKd7mP43qMxtacteESLPrr0/jS/TtzjJ1228mh
         +n+DWkbXxjKkUiOGTNOcb+fDpo8mUyM1Zk2zccAi5qYgJjlkmFT4JZPoFYu9U7IazGxK
         rDZcTcXLCrjJH2SfZPnvO6ri01ql5B7fyeuHWHGVUBuxZgkTtppiuopCqkK/dMovhILT
         rc8Jai0TCPJSfrQ9RHsRFPsepMnfCSSUYt5cplUUdUPUMzN9P95JjqIVwAepLHlP8HyG
         vIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NsvfzGeEol9JMCZvR8qAUpetZ3eFv1g/vaks5It4CXI=;
        b=4Z80J7hROf+F6V9Mg5qLWtgDafT2AeX7Qf5RrfcfD6wt678f3avyPLz+hzwvmOwm2a
         BziypX33quRg9vgMduNeqbUmSSHLKo4ny9V6+cxLMu8Z3zOdA88iazyaZYEcXfdw3Is2
         x63t+KdjP0+y8cD99QUgAYQ+cDDPeJUYi3e1Rzn6iLvU2XBzNzvzWGa7KpHD3Eu/8/vD
         aIoM7K8tGlZvER+tO3b6384Pis5FbIyqStW5HfALuyrLmrVDLdXIq/RKfTOH6I4AJPKW
         xHpNqvrFfSo4T7upWmYasZu8V1cNZCycWRSrxAFiAGBb7sPV4NQQO3nFYnEATghwxXTz
         l6xQ==
X-Gm-Message-State: AOAM530rqeWl5UAK5RACULlCsc6sJF3PEVJPJpRmx/vQbG0trGdkiiwu
        yUNEfbPbfu1wvUaYKDMc8VakNw==
X-Google-Smtp-Source: ABdhPJyn0uAbcnzlSZQYk17M60n6PnmWB/qODT42/eYir2XUp+Rm9EXWzkmA8vcNpN+lNI+FHiKbKA==
X-Received: by 2002:a17:90a:430d:b0:1bc:f340:8096 with SMTP id q13-20020a17090a430d00b001bcf3408096mr33747085pjg.93.1649646033047;
        Sun, 10 Apr 2022 20:00:33 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id o32-20020a635d60000000b0039cd48c7f6asm10016236pgm.32.2022.04.10.20.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 20:00:32 -0700 (PDT)
Date:   Mon, 11 Apr 2022 08:30:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        treding@nvidia.com, jonathanh@nvidia.com, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ksitaraman@nvidia.com,
        sanjayc@nvidia.com, bbasu@nvidia.com
Subject: Re: [Patch v4 0/4] Tegra234 cpufreq driver support
Message-ID: <20220411030030.eqq4a2xgidexowzq@vireshk-i7>
References: <20220405130119.4697-1-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405130119.4697-1-sumitg@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 05-04-22, 18:31, Sumit Gupta wrote:
> This patchset adds driver support for Tegra234 cpufreq.
> Also, added soc data and ops to support multiple SoC's and variants
> which have similar logic to {get|set} cpu frequency as Tegra194 in
> the same driver.
> >From cpufreq point, main difference between Tegra194 and Tegra234 are:
>  1) Tegra234 uses MMIO for frequency requests and not sysreg like T194.
>  2) MPIDR affinity info in Tegra234 is different from Tegra194.
>  3) Register bits of pllp_clk_count and core_clk_count are swapped.
> So, added ops hooks for Tegra234.

Applied. Thanks.

-- 
viresh
