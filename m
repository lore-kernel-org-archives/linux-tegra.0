Return-Path: <SRS0=mUr2=ED=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF75C56201
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 21:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDBB824743
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 21:59:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQlIzqq+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbgJ1V7D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729251AbgJ1V7C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Oct 2020 17:59:02 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F73C0613CF
        for <linux-tegra@vger.kernel.org>; Wed, 28 Oct 2020 14:59:02 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id x1so1118490oic.13
        for <linux-tegra@vger.kernel.org>; Wed, 28 Oct 2020 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VZhYQ3voGqU0Lqb72CUJ0+414mJOlhh3pEzgjKJchCU=;
        b=AQlIzqq+EQcYPj5CWxqiwiFcK/jJlWiKiIxPbpguHDF8liq04//dXkC/VkMeKbQhfL
         MA1h/bMSt2QQzjBxIyrAvF3GvOKbKOvtfP4IBQRyNu+8R/3xJb7DNgJzeFGwa7ACdmwV
         OKs14hlGABh/mcmGFivQN+xhq2tugVHEDfnjW4nTzXVX4GFepqHp6JVtEFVDv7oybu8a
         IvwPXyB8FN13O258g/5k60wmej6NiCyxTJnc5xU7aBW8ZpR8UKyDAp5ryHOMxCE8DCtL
         z9WeliQDBqqT119hHCd6CwnGUrF2S+1v+p9E5XN5tjwgWqzO2/6+LGicEGH8SVKnBxtW
         WQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VZhYQ3voGqU0Lqb72CUJ0+414mJOlhh3pEzgjKJchCU=;
        b=pCbooMGW/G6KPyNUC5Lyk8cj57niFzMyHTD/nmWrnpw+hRxHy17wH5YPs3dz9jRi8y
         foOkUDgn//tspHkxV2dUBJN25fya9h2TcPwj2fRDvpy7y5J7mCWOP1kg+3co1Ipm9WXn
         8pIxzKLD7hqDu6E0XLRdfkxXATWlxBGbzTGQ8xowFA5JufqI+ydHHaRXCxbTNNHOetdk
         fQGaCnSxTQdTK7ZvmlhDRK3HUYx+kqiOVbGNTQeu28VmvHRSUepMoC6r/MmPLf/RQ+Sp
         Zfs3aoIsSxprtqHjUSFFE8+AFMmlTIPXdG4HBh+3Yehi9fm2MgvVH1jCPcMrEH/468x1
         UuzQ==
X-Gm-Message-State: AOAM531fhvWmLOdbTHWkUGeZbpSgd+DshMxLUub3FHybIo0CoVopBj8W
        S32v3UYgscthq2teyPP93dQitw8hi2Ob8Q==
X-Google-Smtp-Source: ABdhPJzmx5He1K5nH+KMxuqqoFSYMQNrCd2NRiKRBjul6UvJgdmjyKWuA7j+CU74D92TX7GCqNfyMA==
X-Received: by 2002:a17:90a:5885:: with SMTP id j5mr5701260pji.117.1603865416676;
        Tue, 27 Oct 2020 23:10:16 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id 21sm4645316pfw.36.2020.10.27.23.10.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 23:10:15 -0700 (PDT)
Date:   Wed, 28 Oct 2020 11:40:14 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rjw@rjwysocki.net, sudeep.holla@arm.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, bbasu@nvidia.com,
        ksitaraman@nvidia.com
Subject: Re: [PATCH v3] cpufreq: tegra194: get consistent cpuinfo_cur_freq
Message-ID: <20201028061014.xy6dkwitcnmw3sng@vireshk-i7>
References: <1602668171-30104-1-git-send-email-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602668171-30104-1-git-send-email-sumitg@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 14-10-20, 15:06, Sumit Gupta wrote:
> Frequency returned by 'cpuinfo_cur_freq' using counters is not fixed
> and keeps changing slightly. This change returns a consistent value
> from freq_table. If the reconstructed frequency has acceptable delta
> from the last written value, then return the frequency corresponding
> to the last written ndiv value from freq_table. Otherwise, print a
> warning and return the reconstructed freq.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
> 
> Sending only this patch as other patch not required after the change
> to convert 'pr_warn' to 'pr_info' in cpufreq core for unlisted freq.
> Changelog
> v1[2] -> v3:
> - Removed unwanted checks for cpu_online and max cluster number
> - Used WARN_ON_ONCE to avoid print flooding.
> 
> v1[1] -> v2:
> - Minor changes to improve comments and reduce debug prints.
> - Get freq table from cluster specific data instead of policy.
> 
> [2] https://marc.info/?l=linux-tegra&m=160216218511280&w=2
> [1] https://marc.info/?l=linux-arm-kernel&m=160028821117535&w=2
> 
>  drivers/cpufreq/tegra194-cpufreq.c | 62 ++++++++++++++++++++++++++++++++------
>  1 file changed, 53 insertions(+), 9 deletions(-)

Applied. Thanks.

-- 
viresh
