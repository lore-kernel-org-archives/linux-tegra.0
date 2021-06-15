Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04A4C2B9F4
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 03:01:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADB0E61004
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 03:01:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFODDh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Jun 2021 23:03:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:51132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230238AbhFODDh (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Jun 2021 23:03:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45500613BF;
        Tue, 15 Jun 2021 01:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623719165;
        bh=5nFeD8wP5nu+m9jfAlQJ3IU5zCr3m3wHffbBI/kxC+g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cI0ZAUKHSteG8ONkxc/ThavDvsqJrcD7JO88Gz0X6tpJrYNU2wmC/2o/xkDa/y6j9
         iJ9Gqybh+cDoKlXzAVCKsS9rHrBF5jFABJQtk1r6rtL4b6jS1brCwgIYKV28I5Qwjr
         VzM0WzzU+ezTwKaz1JMLDneEq61gkoynFFKhD7ohJ07ygzltuie4V0sxPFZW920cuI
         EoapArbKqYaii6i4hOQ8LKXWphvea2grXo+uOKXbd8TAGSogP/NAj0dnQK6lPCxvB/
         E/ihC2iZt7F+2jXHzsd/tEEpgzmeHJcG+K3lHpsJUS9XVhtGABjWwR4gZF+3yqqKTG
         +l7y6DGl/8XTg==
Date:   Tue, 15 Jun 2021 09:06:00 +0800
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
Message-ID: <20210615010600.GB28352@nchen>
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

Reviewed-by: Peter Chen <peter.chen@kernel.org>
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
>  	utmi_phy_clk_disable(phy);
>  
>  	/* PHY won't resume if reset is asserted */
> -- 
> 2.30.2
> 

-- 

Thanks,
Peter Chen

