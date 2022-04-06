Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0ACC433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Apr 2022 17:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238550AbiDFRO1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Apr 2022 13:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238574AbiDFROV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Apr 2022 13:14:21 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415824DAF99
        for <linux-tegra@vger.kernel.org>; Wed,  6 Apr 2022 07:37:23 -0700 (PDT)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 59CFC1F43AFB;
        Wed,  6 Apr 2022 15:37:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1649255841;
        bh=oYbhhKf585FGxtfFi8U5NPanPDke0qUq43aCdjprdg4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=D1bjXlub0DKhAHX9eC1Mskz0kpNJlgDL3vTdlnllLhD33qQf2iGfE9ZEhza4pUxMf
         tgdezZsYawteXM2vOiBoXJbdPVKM6QJgytCw3zlpSfcSjNGmIsUrxs+7lfUmsHCLoG
         OY6jDqxHEkn0wesscJL/7V/51VUrEQChxdGJgQvwKaxc8E2wTCaH4BqZi5MOVa9LS9
         27xppc8hPVukIL1s/r4HHGV30lYkXOqIdSCd0xW0eBviSb1tXE15EkD3dj61meZQ4L
         L4b7wKDcxOUqYOZwlJscF0phZBpMIJIFm7BdMQG0otle3ANi12iYU7S/ogHdca8n1R
         ZfKi145lqJWfw==
Message-ID: <89c70eab-da76-36f7-0576-0122a7861c9c@collabora.com>
Date:   Wed, 6 Apr 2022 17:37:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARM: tegra_defconfig: Fix enabling of the Tegra VDE
 driver
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>
References: <20220406135920.129589-1-jonathanh@nvidia.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220406135920.129589-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/6/22 16:59, Jon Hunter wrote:
> Commit 8bd4aaf438e3 ("media: staging: tegra-vde: De-stage driver") moved
> the Tegra VDE driver out of staging and updated the Kconfig symbol for
> enabling the driver from CONFIG_TEGRA_VDE to CONFIG_VIDEO_TEGRA_VDE.
> However, the tegra_defconfig was not updated and so the driver is no
> longer enabled by default. Furthermore, now that the Tegra VDE driver
> has been moved under the Kconfig symbol CONFIG_V4L_MEM2MEM_DRIVERS, it
> is now also necessary to enable CONFIG_V4L_MEM2MEM_DRIVERS in order to
> enable CONFIG_VIDEO_TEGRA_VDE. Fix this by ensuring that
> CONFIG_V4L_MEM2MEM_DRIVERS and CONFIG_VIDEO_TEGRA_VDE are both enabled
> in the tegra_defconfig.
> 
> Fixes: 8bd4aaf438e3 ("media: staging: tegra-vde: De-stage driver")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm/configs/tegra_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
> index 289d022acc4b..c209722399d7 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -286,7 +286,8 @@ CONFIG_SERIO_NVEC_PS2=y
>  CONFIG_NVEC_POWER=y
>  CONFIG_NVEC_PAZ00=y
>  CONFIG_STAGING_MEDIA=y
> -CONFIG_TEGRA_VDE=y
> +CONFIG_V4L_MEM2MEM_DRIVERS=y
> +CONFIG_VIDEO_TEGRA_VDE=y
>  CONFIG_CHROME_PLATFORMS=y
>  CONFIG_CROS_EC=y
>  CONFIG_CROS_EC_I2C=m

There are per-existing patches updating the defconfigs, unfortunately
they were not applied together with the driver patches.

https://patchwork.ozlabs.org/project/linux-tegra/patch/20220220204623.30107-8-digetx@gmail.com/

https://patchwork.ozlabs.org/project/linux-tegra/patch/20220220204623.30107-9-digetx@gmail.com/
