Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE5CC433ED
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 06:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CB13610A5
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 06:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhDAGt2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 02:49:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:36262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232565AbhDAGtQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 1 Apr 2021 02:49:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2006A610A5;
        Thu,  1 Apr 2021 06:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617259756;
        bh=Hhp02BDYFoPZ7/j9E5Md/2IuILswyJ5r7RdCPV+U47w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=onj8inPvOhaCKXVInG9Tn/7/DE5X3bUbeScYXRgfk3lF/pDtQnEIugcfOi6x0TDrA
         +UC7Cg79GFTvv/mKxkzFUaE44kvxbtoMUpSapqUSlbFGp0IszWZeJ7z5nkK6WXy8p/
         hCrbH+08vhBaLl/j2P0lijOntLuGhEdTRVG/ionIY94gUUAt0b9sYkzo004xf3HzJX
         ABxKy+TQpYLP/O3HsUKW9jJyLZM4bxmwlMCdXQ+7q0bCtnBCJCGYErzKgeAjzggZ7q
         YKT4Tuk8zY1xH9FOiChKIDkNRGH2vh3AvswjJA1xumrH1/6ioTyXBKY0Os9gI7s0/L
         r1dd803h8S4WQ==
Date:   Thu, 1 Apr 2021 12:19:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 11/13] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra186
Message-ID: <YGVs5/57Z+6zKuQa@vkoul-mobl.Dlink>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-12-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325164057.793954-12-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25-03-21, 17:40, Thierry Reding wrote:
> From: JC Kuo <jckuo@nvidia.com>
> 
> This commit implements Tegra186/Tegra194 XUSB PADCTL/AO wake and
> sleepwalk operations.
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 558 +++++++++++++++++++++++++++++-
>  1 file changed, 557 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
> index 5d64f69b39a9..6378bf722745 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2016-2019, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2016-2020, NVIDIA CORPORATION.  All rights reserved.
>   */
>  
>  #include <linux/delay.h>
> @@ -113,6 +113,117 @@
>  #define  ID_OVERRIDE_FLOATING			ID_OVERRIDE(8)
>  #define  ID_OVERRIDE_GROUNDED			ID_OVERRIDE(0)
>  
> +/* XUSB AO registers */
> +#define XUSB_AO_USB_DEBOUNCE_DEL		(0x4)
> +#define   UHSIC_LINE_DEB_CNT(x)			(((x) & 0xf) << 4)
> +#define   UTMIP_LINE_DEB_CNT(x)			((x) & 0xf)
> +
> +#define XUSB_AO_UTMIP_TRIGGERS(x)		(0x40 + (x) * 4)
> +#define   CLR_WALK_PTR				(1 << 0)
> +#define   CAP_CFG				(1 << 1)
> +#define   CLR_WAKE_ALARM			(1 << 3)
> +
> +#define XUSB_AO_UHSIC_TRIGGERS(x)		(0x60 + (x) * 4)
> +#define   HSIC_CLR_WALK_PTR			(1 << 0)
> +#define   HSIC_CLR_WAKE_ALARM			(1 << 3)
> +#define   HSIC_CAP_CFG				(1 << 4)
> +
> +#define XUSB_AO_UTMIP_SAVED_STATE(x)		(0x70 + (x) * 4)
> +#define   SPEED(x)				((x) & 0x3)
> +#define     UTMI_HS				SPEED(0)
> +#define     UTMI_FS				SPEED(1)
> +#define     UTMI_LS				SPEED(2)
> +#define     UTMI_RST				SPEED(3)
> +
> +#define XUSB_AO_UHSIC_SAVED_STATE(x)		(0x90 + (x) * 4)
> +#define   MODE(x)				((x) & 0x1)
> +#define   MODE_HS				MODE(0)
> +#define   MODE_RST				MODE(1)
> +
> +#define XUSB_AO_UTMIP_SLEEPWALK_CFG(x)		(0xd0 + (x) * 4)
> +#define XUSB_AO_UHSIC_SLEEPWALK_CFG(x)		(0xf0 + (x) * 4)
> +#define   FAKE_USBOP_VAL			(1 << 0)
> +#define   FAKE_USBON_VAL			(1 << 1)
> +#define   FAKE_USBOP_EN				(1 << 2)
> +#define   FAKE_USBON_EN				(1 << 3)
> +#define   FAKE_STROBE_VAL			(1 << 0)
> +#define   FAKE_DATA_VAL				(1 << 1)
> +#define   FAKE_STROBE_EN			(1 << 2)
> +#define   FAKE_DATA_EN				(1 << 3)
> +#define   WAKE_WALK_EN				(1 << 14)
> +#define   MASTER_ENABLE				(1 << 15)
> +#define   LINEVAL_WALK_EN			(1 << 16)

BIT() or GENMASK() please

> +static inline void ao_writel(struct tegra186_xusb_padctl *priv, u32 value, unsigned int offset)
> +{
> +	dev_dbg(priv->base.dev, "ao %08x < %08x\n", offset, value);

Too many debug prints in this patch as well...

With the nits fixed:

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
