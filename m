Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D855C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Feb 2022 14:37:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbiBXOiP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Feb 2022 09:38:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232269AbiBXOiP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Feb 2022 09:38:15 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB5FAA2FA
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 06:37:44 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id 88BEC1F453A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1645713463;
        bh=Zx4F9X8fGqxYV9rhZY1arpmhDtauhJvbhcpjrlgP63c=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SwVt6GLYU6nLZDVOrr28+xKl17al80wZ0MEsRgT7c4XLojaMaQyNvPor7/3jZBZiM
         W1heAoJZxtjur84CH1S/0jnULeiCd6Pams7M48IKET4jz8XRvIx/Cne14NlY8LCcaC
         P6Lk1MGgRjmi3lJbgqTp2jLr3vV3f+eGXLJaJixB5m6oantficWBRz1lpNYxr+Ul+E
         SdJSr1r56VOHvfG/8dEkAdlrNf6RU5I68GArZpp3R85lQZwsuLybgc6NY49cZt9p8G
         6He1oMPzcfmounvy0vhkIkOhXyRmpsFbpWEW4lgWig9Mz3Fm/2tbyiys++MKJIXPV7
         mpNP2U7jWBjNg==
Message-ID: <d9b9f39a-2605-b634-a8ca-627be8274d9e@collabora.com>
Date:   Thu, 24 Feb 2022 17:37:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] soc/tegra: fuse: Explicitly cast to/from __iomem
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20220224122728.459608-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220224122728.459608-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 2/24/22 15:27, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> sparse is picky about casts between different address spaces. A cast to
> plain void * needs to be accompanied by a __force modifier and casting
> back to void __iomem * needs to be explicit to avoid warnings.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 88724b78a84c ("soc/tegra: fuse: Use resource-managed helpers")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
> index 10d2ae99babd..aa94fda282f4 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -202,8 +202,8 @@ static const struct nvmem_cell_info tegra_fuse_cells[] = {
>  
>  static void tegra_fuse_restore(void *base)
>  {
> +	fuse->base = (void __iomem *)base;
>  	fuse->clk = NULL;
> -	fuse->base = base;
>  }
>  
>  static int tegra_fuse_probe(struct platform_device *pdev)
> @@ -213,7 +213,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	int err;
>  
> -	err = devm_add_action(&pdev->dev, tegra_fuse_restore, base);
> +	err = devm_add_action(&pdev->dev, tegra_fuse_restore, (void __force *)base);
>  	if (err)
>  		return err;
>  

Thank you, I had the same change on my mind.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
