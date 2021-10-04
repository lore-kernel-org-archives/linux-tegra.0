Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D46C433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 06:37:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A72576120F
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 06:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhJDGjH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 02:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232585AbhJDGjG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 02:39:06 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E658FC0613EC
        for <linux-tegra@vger.kernel.org>; Sun,  3 Oct 2021 23:37:17 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id k26so13631541pfi.5
        for <linux-tegra@vger.kernel.org>; Sun, 03 Oct 2021 23:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bo1AfZo2B0G6Qf7w5hIV2g2F/2qOqHeUUj32w/8pRyc=;
        b=J3FCPjvQ91Zm759hElGSstImuWo8dJLPQDskX+6fCdq3JReSGPzaXKZXpW3MNeqWKX
         16MDjPnmnbrgXjqL/fV39uX8nNjZ+UTYivCHqN0/2e2fXYC0YLiphn0Mb+eM+nRoWBW0
         /bUNr/naX+9Fwm2wqSRwg3bppRTkGdPjl534m7oTPeAvljymvWRUKWNDjK0g0ZD9AamN
         Z0rQ3+Gwahr0TY32w0/VpP3EcpnghufANXZ8IGhyjX4uCskP7buX//DwX8cPD9k8O9Cd
         9cfsBrPXeGAtXX1m6acV0+nXxcLM5ZRB/vXjfUF0F4sNbxUfJB6Mq+vC54JKfXmGRfbR
         W93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bo1AfZo2B0G6Qf7w5hIV2g2F/2qOqHeUUj32w/8pRyc=;
        b=MAb36YK1qoSmUSbK3R67i3dp9wDa8Vy/6YxEyHfUozus+7VDHAENwbDRXXg1ddr2n5
         xVev4KmA816q6uR/VY5NKuMBPuOFBoETeTSW1VlqFVDRVqFFJXcSuMVkjPW/fYd/FAS5
         YNGwS6i3buXUqLh2IW8El06CRyyQZyR9dwzBsAFzaGWKiC3jtUjxPjHjiVoTNsJpM44F
         NC61sKmIyXgc7gdip/JRi8MNw5e1xLfRNZInJT06f6lTbjR+PKtsONYHld4cmNx4oeeu
         2aa9myj90AssvSbZbk7/PXEUFPisOHAyN2nFfBdOFABWNO5NsZxfWfihKuYm3K3x4YCl
         s4Hw==
X-Gm-Message-State: AOAM533Qz3si+PdpROmDq9U5DGXZBjg51QuIc2dbGQ73zr/MakBJtvsC
        ry9pNg6LxNvVuefbxiONESYKkA==
X-Google-Smtp-Source: ABdhPJy2PwdNkXBTM1trCwQuWiBzmQKtgRp85HM5DKtIzNpf5iMj9DZTHKHrtExQWgDfVT9U3l1Dfg==
X-Received: by 2002:aa7:914d:0:b0:44c:61e3:99b9 with SMTP id 13-20020aa7914d000000b0044c61e399b9mr3417268pfi.65.1633329437232;
        Sun, 03 Oct 2021 23:37:17 -0700 (PDT)
Received: from localhost ([122.171.247.18])
        by smtp.gmail.com with ESMTPSA id n9sm13233203pjk.3.2021.10.03.23.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 23:37:16 -0700 (PDT)
Date:   Mon, 4 Oct 2021 12:07:14 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     rafael@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        krzysztof.kozlowski@canonical.com, lorenzo.pieralisi@arm.com,
        robh@kernel.org, kw@linux.com, p.zabel@pengutronix.de,
        rui.zhang@intel.com, daniel.lezcano@linaro.org, amitk@kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 4/5] cpufreq: tegra186/tegra194: Handle errors in BPMP
 response
Message-ID: <20211004063714.5bux4hwv3lchibnn@vireshk-i7>
References: <20210915085517.1669675-1-mperttunen@nvidia.com>
 <20210915085517.1669675-4-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915085517.1669675-4-mperttunen@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 15-09-21, 11:55, Mikko Perttunen wrote:
> The return value from tegra_bpmp_transfer indicates the success or
> failure of the IPC transaction with BPMP. If the transaction
> succeeded, we also need to check the actual command's result code.
> Add code to do this.
> 
> While at it, explicitly handle missing CPU clusters, which can
> occur on floorswept chips. This worked before as well, but
> possibly only by accident.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 4 ++++
>  drivers/cpufreq/tegra194-cpufreq.c | 8 +++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)

Should I apply it alone ?

-- 
viresh
