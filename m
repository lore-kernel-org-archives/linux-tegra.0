Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCA7C48BE8
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 03:01:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B23C061055
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 03:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhFODDh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Jun 2021 23:03:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:51134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230239AbhFODDh (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Jun 2021 23:03:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5E20611AB;
        Tue, 15 Jun 2021 01:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623719122;
        bh=JowlqCnPSb4zz316zjuQPncCWVeSVEJsJRR6AJAI1SE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FtZQP1L3wOJJQ3lQRa2yCPA79Dj1fEvpClc3UBsJNhL/ydK/dIdi7RAXlq7aiHl+4
         KfxN293mMtTchVS+AZCvuFFNolo8Ho3YA/csiLLs/rM0TFwmZ5TFbAEL2xFmZV77wJ
         Lj9LtrZ9R+GmIRRpcJB4TAhJT2HfvoPSanuCBJ37oK5Gatmx5as3Rh0Nphj7EsY5ur
         Src7pu9r2MT+7RboovQmnX18jreeLiLL15t86RVaJqI6EP8OzSOYIQJCaOZK/yR38+
         baN7BwXVOiIRVCDve3dDel5iX7uBs6V7hjVoaGp4q1DPqgu4igQvGw6TXXPexDuGAd
         Q/5DntGx/u5iw==
Date:   Tue, 15 Jun 2021 09:05:16 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] usb: phy: tegra: Wait for VBUS wakeup status
 deassertion on suspend
Message-ID: <20210615010516.GA28352@nchen>
References: <20210613145936.9902-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210613145936.9902-1-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21-06-13 17:59:35, Dmitry Osipenko wrote:
> Some devices need an extra delay after losing VBUS, otherwise VBUS may
> be detected as active at suspend time, preventing the PHY's suspension
> by the VBUS detection sensor. This problem was found on Asus Transformer
> TF700T (Tegra30) tablet device, where the USB PHY wakes up immediately
> from suspend because VBUS sensor continues to detect VBUS as active after
> disconnection. We need to poll the PHY's VBUS wakeup status until it's
> deasserted before suspending PHY in order to fix this minor trouble.
> 
> Fixes: 35192007d28d ("usb: phy: tegra: Support waking up from a low power mode")
> Reported-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> index fc5c6cab58ba..ff482c694200 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -64,6 +64,7 @@
>  #define   A_VBUS_VLD_WAKEUP_EN			BIT(30)
>  
>  #define USB_PHY_VBUS_WAKEUP_ID			0x408
> +#define   VBUS_WAKEUP_STS			BIT(10)
>  #define   VBUS_WAKEUP_WAKEUP_EN			BIT(30)
>  
>  #define USB1_LEGACY_CTRL			0x410
> @@ -645,6 +646,15 @@ static int utmi_phy_power_off(struct tegra_usb_phy *phy)
>  	void __iomem *base = phy->regs;
>  	u32 val;
>  
> +	/*
> +	 * Give hardware time to settle down after VBUS disconnection,
> +	 * otherwise PHY will immediately wake up from suspend.
> +	 */
> +	if (phy->wakeup_enabled && phy->mode != USB_DR_MODE_HOST)
> +		readl_relaxed_poll_timeout(base + USB_PHY_VBUS_WAKEUP_ID,
> +					   val, !(val & VBUS_WAKEUP_STS),
> +					   5000, 100000);
> +

Where will clear VBUS_WAKEUP_STS? Or it will be cleared by HW after VBUS lower than
B Session Valid?

-- 

Thanks,
Peter Chen

