Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7116C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Apr 2022 21:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237140AbiDMVUJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Apr 2022 17:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbiDMVUI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Apr 2022 17:20:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2316E5E;
        Wed, 13 Apr 2022 14:17:46 -0700 (PDT)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E6A941F46E52;
        Wed, 13 Apr 2022 22:17:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1649884665;
        bh=CG52Uur5vxx6WW2+Hm5dUFjVdnVffUuObFP79HK5REs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JOQyRGp5WC/z0WyH4PwgJWGANGPxAV6F9g457XzfY/sfpXqISsDDS1oo9gURfuuTN
         I+JSkz0rOp9aSy6C5RYxmVAmIeIfJnwCj0EeHe+UFMDeZEJsifoccZ8F6Q7JD30umS
         RweV7ItbOgmmIkdhYlaOiX7Z7/cO2G3mNSJ4cT1uBvxirVX5nQag4G2Sebw/rACFBk
         plRtft57RsGZXFMjk7e7S8LusYyMICtZQcknCZbk6Jz6RTcbMG/Y20dcmH/cWyjqfp
         JHrHbxNfzJ1HiC17xKwJc24aH1UxYy1dW1SEsYlmcUNRKAIjG4x6YOXPJ38pTc3R7w
         X/5tRwyGqSoog==
Message-ID: <c3af41bc-5d7e-660d-37b6-d0be80cd63b1@collabora.com>
Date:   Thu, 14 Apr 2022 00:17:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Patch v7 2/4] memory: tegra: Add MC error logging on tegra186
 onward
Content-Language: en-US
To:     Ashish Mhetre <amhetre@nvidia.com>, digetx@gmail.com,
        krzysztof.kozlowski@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     vdumpa@nvidia.com, Snikam@nvidia.com
References: <20220413094012.13589-1-amhetre@nvidia.com>
 <20220413094012.13589-3-amhetre@nvidia.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220413094012.13589-3-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/13/22 12:40, Ashish Mhetre wrote:
> +static inline u32 mc_ch_readl(const struct tegra_mc *mc, int ch,
> +			      unsigned long offset)
> +{

return 0 if mc->bcast_ch_regs==NULL

> +	if (ch == MC_BROADCAST_CHANNEL)
> +		return readl_relaxed(mc->bcast_ch_regs + offset);
> +
> +	return readl_relaxed(mc->ch_regs[ch] + offset);
> +}
> +
> +static inline void mc_ch_writel(const struct tegra_mc *mc, int ch,
> +				u32 value, unsigned long offset)
> +{

return if mc->bcast_ch_regs==NULL

> +	if (ch == MC_BROADCAST_CHANNEL)
> +		writel_relaxed(value, mc->bcast_ch_regs + offset);
> +	else
> +		writel_relaxed(value, mc->ch_regs[ch] + offset);
> +}

