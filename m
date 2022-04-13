Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE82C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Apr 2022 21:16:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239185AbiDMVSl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Apr 2022 17:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239261AbiDMVS0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Apr 2022 17:18:26 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA4292D35;
        Wed, 13 Apr 2022 14:13:54 -0700 (PDT)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 487CF1F47439;
        Wed, 13 Apr 2022 22:13:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1649884433;
        bh=jxlKm99U/UPLaaIgYY+cOIy8yVUVHupya5DGpvsJmv8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WTVwrRUBAlVUJe03iZNT+D6B+4Wz6JJndEbHIU7RMAvLz5LlShIYqAS/TWhOu7ejm
         +AIHEQ1F9w/EorEnyjC+pKfnDmpXLJqTHKtdy+kZJhtIE94J/ntESzMIfILcAxKU0S
         8QBjuk/Kw+1+a4Anh41t/zmQxN461SITs4785f2AYqRINcACguvsj5nHQkf7RCnstg
         f0zjxS2yexOSHOSFw1RkoebQOKctRmxbx5Y6LQ02l0vJDoKqHZMQ+W8sLs1xDauXvu
         HMCIT22ghkt/Odg8RxoTCYNHnLJ43cd/8S26Mdo1Kq8Eyh6SqEU9ydxL8AcAkEjlkm
         adEEgfPbV5lLA==
Message-ID: <eeb513c9-f010-c45b-bca6-a10c96691147@collabora.com>
Date:   Thu, 14 Apr 2022 00:13:49 +0300
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
> +irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>  {
>  	struct tegra_mc *mc = data;
> +	unsigned int bit, channel;
>  	unsigned long status;
> -	unsigned int bit;
>  
> -	/* mask all interrupts to avoid flooding */
> -	status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmask;
> +	if (mc->soc->num_channels) {
> +		u32 global_status;
> +		int err;
> +
> +		global_status = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, MC_GLOBAL_INTSTATUS);

This will crash if mc->bcast_ch_regs = ERR_PTR(-EINVAL) for older dtbs.
