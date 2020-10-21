Return-Path: <SRS0=wuJM=D4=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5480C55178
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Oct 2020 23:01:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56BA822249
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Oct 2020 23:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="hdaUtzrB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441842AbgJUXBW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Oct 2020 19:01:22 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5860 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439276AbgJUXBW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Oct 2020 19:01:22 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f90bd640000>; Wed, 21 Oct 2020 15:59:48 -0700
Received: from krlm (172.20.13.39) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct 2020 23:01:22
 +0000
Date:   Wed, 21 Oct 2020 16:01:37 -0700
From:   Sivaram Nair <sivaramn@nvidia.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
CC:     <pdeschrijver@nvidia.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] clk: tegra: bpmp: Clamp clock rates on requests
Message-ID: <20201021230137.GA3933@krlm>
References: <20201021101054.2836146-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201021101054.2836146-1-mperttunen@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603321188; bh=M/AGDHeb6JmQ+yu/XSBNHiMwy7D0SMSWDOU9Iywtgpw=;
        h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
         Content-Type:Content-Disposition:In-Reply-To:X-NVConfidentiality:
         User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=hdaUtzrBEzXuJ96dTPEnqVXnjCdVyZCq4kuElU72CuiuWKZ2ngvrm/O9JeYwuBrgc
         9QMTJsHu/ZhTaiYUC7e6EIynJU+YIs0SC9rYVU8HNSOcfuR12JOAuwZiPtAImFA7Tl
         IjyJ/ZXoUMU+CSoJiI9fFsAKGMh+z3Tm0050RACzAHUm7bQr9AB8u4UrX5NSYjN2NO
         Sm+5eCxuVRQDnJjHwBh1zzg8qgceKOibaGfdqyeB6ydjOEyJs8Ge6PnIfcDu4AesUj
         ErW9X1wRZJLbvP4kj9lf89j5Vg0uvMPiPLj26KHUHBYNMUmGPEUavg/g9I9kFLjL/X
         FELyGvYD8MGCQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 21, 2020 at 01:10:54PM +0300, Mikko Perttunen wrote:
> From: Sivaram Nair <sivaramn@nvidia.com>
> 
> BPMP firmware ABI expects the rate inputs in int64_t. However,
> tegra_bpmp_clk_round_rate() and tegra_bpmp_clk_set_rate() functions
> directly assign 'unsigned long' inputs to a int64_t value causing
> unexpected rounding errors.
> 
> Fix this by clipping the input rate to S64_MAX.
> 
> Signed-off-by: Sivaram Nair <sivaramn@nvidia.com>
> [mperttunen: slight cleanup]
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/clk/tegra/clk-bpmp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> index a66263b6490d..6ecf18f71c32 100644
> --- a/drivers/clk/tegra/clk-bpmp.c
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2016 NVIDIA Corporation
> + * Copyright (C) 2016-2020 NVIDIA Corporation
>   */
>  
>  #include <linux/clk-provider.h>
> @@ -174,7 +174,7 @@ static long tegra_bpmp_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	int err;
>  
>  	memset(&request, 0, sizeof(request));
> -	request.rate = rate;
> +	request.rate = min_t(u64, rate, S64_MAX);
>  
>  	memset(&msg, 0, sizeof(msg));
>  	msg.cmd = CMD_CLK_ROUND_RATE;
> @@ -256,7 +256,7 @@ static int tegra_bpmp_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  	struct tegra_bpmp_clk_message msg;
>  
>  	memset(&request, 0, sizeof(request));
> -	request.rate = rate;
> +	request.rate = min_t(u64, rate, S64_MAX);
>  
>  	memset(&msg, 0, sizeof(msg));
>  	msg.cmd = CMD_CLK_SET_RATE;
> -- 
> 2.28.0
> 

Reviewed-by: Sivaram Nair
