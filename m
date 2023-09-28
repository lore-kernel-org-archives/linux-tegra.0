Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAC7CE7B07
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Sep 2023 07:05:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjI1HFv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Sep 2023 03:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjI1HFu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Sep 2023 03:05:50 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156F7B7
        for <linux-tegra@vger.kernel.org>; Thu, 28 Sep 2023 00:05:49 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-692b2bdfce9so9739818b3a.3
        for <linux-tegra@vger.kernel.org>; Thu, 28 Sep 2023 00:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695884748; x=1696489548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrlIZw5qja4JqqyR+qcaKYLNZ4ub2lqDzG6RTlB/DIQ=;
        b=VXgfD9XaxeF/63XgRHFT/wxooGGjwigre/IKZ3thmGDBWqHMRj8WJbQZ+FJFMKrzRz
         1xGgpJeL/3zgeH7cwGGfAEQ0tj6R8CDLy3aLQmOywDHM88lGZmNWpZv8Jbs/tWgRL+Fb
         Scshc0vJcZQ7G1oFlkoFgV9mbd73ladCvyHws7+XZItsoNkkH8CJg8OXCCOs88kZrCqn
         oVuSNMb4DNJ858GCovzDcO4wLQjyPeEZ79kYZ8msTytispHzsj/b9MRIr7K36DV+ENUO
         cPrqJ4vgCY5/DS6A0dsZCn67isYWGdlgm8bMWBt5dVNGvMZIFFvm6G2Pn3kWs1lPD2Ak
         3TtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695884748; x=1696489548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrlIZw5qja4JqqyR+qcaKYLNZ4ub2lqDzG6RTlB/DIQ=;
        b=jFhhvjjv0PHUIEHVrrQ5oweMF1qh+KY88Q7XfNdaxdk7NuutsQ7yQ1lcmFmh0xd0up
         CPEjgX3XGzvnfnrSvpQlpkoHF0O05F0kDimDoO2323+S40Ub25q6MFi5tsG69ECsb7BG
         p0ihkAOOLxytRpEZenDSq+SuWvdbE6VDE+Fe94im8vdlUhdE0RXc/bVMR1YM5DymyYnz
         3+SHRnyIruwSmYQjyT3b1UwP8b96o4I/+ZLsC24eSGDRDClcukGMocsvnPnbZw8BlPvi
         yTZFhvst4C4/Gf+wbAb2ScZTbAYA6vXRwyb2IqJkkSvvEkVhbYKVzNCBliib8bcga7K0
         HqIw==
X-Gm-Message-State: AOJu0YzholeMCjPJSv0YmSK9MnuFnH7TjYwQxodVnFVVaSLzxuS1ZDKm
        bNs9kLpqOhS7ra7yHy5tjQlXLCB4F0aG/6OcAgI=
X-Google-Smtp-Source: AGHT+IFkhgWod0clEQ5v67I4kF7osyGMadaETWiWbfHAflJHTZy3NiF4g4a1a+48SnTo7y0HALWaTw==
X-Received: by 2002:a05:6a00:22c6:b0:68a:59c6:c0a6 with SMTP id f6-20020a056a0022c600b0068a59c6c0a6mr472441pfj.24.1695884748490;
        Thu, 28 Sep 2023 00:05:48 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id y19-20020aa78053000000b006889348ba6esm7162087pfm.127.2023.09.28.00.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 00:05:47 -0700 (PDT)
Date:   Thu, 28 Sep 2023 12:35:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rafael@kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        treding@nvidia.com, jonathanh@nvidia.com, bbasu@nvidia.com,
        amiettinen@nvidia.com
Subject: Re: [Patch v2 1/2] cpufreq: tegra194: save CPU data to avoid
 repeated SMP calls
Message-ID: <20230928070545.b7l367qi2q4rynji@vireshk-i7>
References: <20230901164113.29139-1-sumitg@nvidia.com>
 <20230901164113.29139-2-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901164113.29139-2-sumitg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 01-09-23, 22:11, Sumit Gupta wrote:
> @@ -131,19 +132,10 @@ static int tegra234_get_cpu_ndiv(u32 cpu, u32 cpuid, u32 clusterid, u64 *ndiv)
>  static void tegra234_set_cpu_ndiv(struct cpufreq_policy *policy, u64 ndiv)
>  {

> +	for_each_cpu_and(cpu, policy->cpus, cpu_online_mask)

(Yes this is existing code, but ..) you don't need to perform AND with
cpu_online_mask as policy->cpus should only contain currently online CPUs.

Please check if you ever see it differently.

> +	data->cpu_data = devm_kcalloc(&pdev->dev, data->soc->num_clusters *
> +				      data->soc->maxcpus_per_cluster,
> +				      sizeof(struct tegra_cpu_data), GFP_KERNEL);

This should be: sizeof(*data->cpu_data) instead. Didn't checkpatch complain
about it ?

-- 
viresh
