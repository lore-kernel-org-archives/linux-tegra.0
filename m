Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29105C43467
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 10:33:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCC342145D
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602153185;
	bh=DnkULCFZoQ6y7MdvkalvclQUq9yoIYYQBdcPMkbHKco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gIMoPDV4BoSZWVXi9tMAGYgG1O7I8DBTLUAiQXqsUSCNTp9WeeBaVlM6HtLSird1o
	 vzDHv1cNYyPZ7sA/R8ZvjOkixSxcZkn8uPUs7AqygB1FSuYQAvuY/0nemzBeEUayvt
	 MS0rcolmyIox8XkEwf/raCSeOcOMu3R/RmZ+OKsM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgJHKdF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 06:33:05 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37448 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgJHKdF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Oct 2020 06:33:05 -0400
Received: by mail-wm1-f68.google.com with SMTP id j136so5972286wmj.2;
        Thu, 08 Oct 2020 03:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6LrOBjyvywzVUOxBpR/Sw7dDdwdJuhXEZt1TnYIWH2M=;
        b=c8tfhKsA3IfSZpA2px1ZmvmD6bq+pUGG1nnpnmBOExTvrXNKRLBj0KMpvtTY7tkMSV
         aTmHKTaabhi3JrnDWN90H/CHVUoKwoWYPeqeyuB/Oa+ZzBeG4JKthdAZxb7/wSFXD0e7
         d77hla3w5BZnvxANb9cQQgB5PFj7WnJNEM1hZ/qjSd1p642tALlbL+DNvI2HE2+gRmnP
         nnJkrJNcWWHXPW8mDWqmm/J71eWChLmmBGFkLyvm8D9UbA/Ev9zpk8X57XAcs10QqQ2H
         JkW9PuprzILkNrc8i7Knr1xOFbNJOdwn6SzHb6zMd50tUCd4/OUGyTfPz0dUMip7E4FH
         cJbA==
X-Gm-Message-State: AOAM530D5eTDmmcabRJaeWRBfQUcdbvc+NOTivgcwK5i1IxtDiLKI8Kg
        YYZ3FwuLFOX8LelxM9/4tDI=
X-Google-Smtp-Source: ABdhPJzO/bFr02oV4N6sBlulFdDN5Lzq/N6FBazS8wv6RmatRPJWxe4RliBw38pguvFgKgQpd4Lbzw==
X-Received: by 2002:a1c:44e:: with SMTP id 75mr8136588wme.117.1602153182410;
        Thu, 08 Oct 2020 03:33:02 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id r68sm1056563wmr.37.2020.10.08.03.33.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 03:33:01 -0700 (PDT)
Date:   Thu, 8 Oct 2020 12:32:58 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] memory: tegra: Sort tegra210_swgroups by reg address
Message-ID: <20201008103258.GA16358@kozik-lap>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-4-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201008003746.25659-4-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 07, 2020 at 05:37:44PM -0700, Nicolin Chen wrote:
> This is a cleanup change to prepare for new swgroups.

What type of cleanup? Any functional change?

> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/memory/tegra/tegra210.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
> index e8a7d266802c..b400802c9f14 100644
> --- a/drivers/memory/tegra/tegra210.c
> +++ b/drivers/memory/tegra/tegra210.c
> @@ -1020,32 +1020,32 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
>  };
>  
>  static const struct tegra_smmu_swgroup tegra210_swgroups[] = {
> -	{ .name = "dc",        .swgroup = TEGRA_SWGROUP_DC,        .reg = 0x240 },
> -	{ .name = "dcb",       .swgroup = TEGRA_SWGROUP_DCB,       .reg = 0x244 },
>  	{ .name = "afi",       .swgroup = TEGRA_SWGROUP_AFI,       .reg = 0x238 },
>  	{ .name = "avpc",      .swgroup = TEGRA_SWGROUP_AVPC,      .reg = 0x23c },
> -	{ .name = "hda",       .swgroup = TEGRA_SWGROUP_HDA,       .reg = 0x254 },
> +	{ .name = "dc",        .swgroup = TEGRA_SWGROUP_DC,        .reg = 0x240 },
> +	{ .name = "dcb",       .swgroup = TEGRA_SWGROUP_DCB,       .reg = 0x244 },
>  	{ .name = "hc",        .swgroup = TEGRA_SWGROUP_HC,        .reg = 0x250 },
> +	{ .name = "hda",       .swgroup = TEGRA_SWGROUP_HDA,       .reg = 0x254 },
> +	{ .name = "isp2",      .swgroup = TEGRA_SWGROUP_ISP2,      .reg = 0x258 },
>  	{ .name = "nvenc",     .swgroup = TEGRA_SWGROUP_NVENC,     .reg = 0x264 },
>  	{ .name = "ppcs",      .swgroup = TEGRA_SWGROUP_PPCS,      .reg = 0x270 },
>  	{ .name = "sata",      .swgroup = TEGRA_SWGROUP_SATA,      .reg = 0x274 },
> -	{ .name = "isp2",      .swgroup = TEGRA_SWGROUP_ISP2,      .reg = 0x258 },
> +	{ .name = "vi",        .swgroup = TEGRA_SWGROUP_VI,        .reg = 0x280 },
> +	{ .name = "vic",       .swgroup = TEGRA_SWGROUP_VIC,       .reg = 0x284 },
>  	{ .name = "xusb_host", .swgroup = TEGRA_SWGROUP_XUSB_HOST, .reg = 0x288 },
>  	{ .name = "xusb_dev",  .swgroup = TEGRA_SWGROUP_XUSB_DEV,  .reg = 0x28c },
> -	{ .name = "isp2b",     .swgroup = TEGRA_SWGROUP_ISP2B,     .reg = 0xaa4 },
> -	{ .name = "tsec",      .swgroup = TEGRA_SWGROUP_TSEC,      .reg = 0x294 },
>  	{ .name = "a9avp",     .swgroup = TEGRA_SWGROUP_A9AVP,     .reg = 0x290 },

I must say I cannot find the order. By name - not. By swgroup name -
not. By register - not.

What is the order then?

Best regards,
Krzysztof


> -	{ .name = "gpu",       .swgroup = TEGRA_SWGROUP_GPU,       .reg = 0xaac },
> +	{ .name = "tsec",      .swgroup = TEGRA_SWGROUP_TSEC,      .reg = 0x294 },
>  	{ .name = "sdmmc1a",   .swgroup = TEGRA_SWGROUP_SDMMC1A,   .reg = 0xa94 },
>  	{ .name = "sdmmc2a",   .swgroup = TEGRA_SWGROUP_SDMMC2A,   .reg = 0xa98 },
>  	{ .name = "sdmmc3a",   .swgroup = TEGRA_SWGROUP_SDMMC3A,   .reg = 0xa9c },
>  	{ .name = "sdmmc4a",   .swgroup = TEGRA_SWGROUP_SDMMC4A,   .reg = 0xaa0 },
> -	{ .name = "vic",       .swgroup = TEGRA_SWGROUP_VIC,       .reg = 0x284 },
> -	{ .name = "vi",        .swgroup = TEGRA_SWGROUP_VI,        .reg = 0x280 },
> +	{ .name = "isp2b",     .swgroup = TEGRA_SWGROUP_ISP2B,     .reg = 0xaa4 },
> +	{ .name = "gpu",       .swgroup = TEGRA_SWGROUP_GPU,       .reg = 0xaac },
>  	{ .name = "nvdec",     .swgroup = TEGRA_SWGROUP_NVDEC,     .reg = 0xab4 },
>  	{ .name = "ape",       .swgroup = TEGRA_SWGROUP_APE,       .reg = 0xab8 },
> -	{ .name = "nvjpg",     .swgroup = TEGRA_SWGROUP_NVJPG,     .reg = 0xac0 },
>  	{ .name = "se",        .swgroup = TEGRA_SWGROUP_SE,        .reg = 0xabc },
> +	{ .name = "nvjpg",     .swgroup = TEGRA_SWGROUP_NVJPG,     .reg = 0xac0 },
>  	{ .name = "axiap",     .swgroup = TEGRA_SWGROUP_AXIAP,     .reg = 0xacc },
>  	{ .name = "etr",       .swgroup = TEGRA_SWGROUP_ETR,       .reg = 0xad0 },
>  	{ .name = "tsecb",     .swgroup = TEGRA_SWGROUP_TSECB,     .reg = 0xad4 },
> -- 
> 2.17.1
> 
