Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131A4ECAAA1
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Oct 2022 14:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235866AbiJ0OAY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Oct 2022 10:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235628AbiJ0OAW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Oct 2022 10:00:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C193CBEC;
        Thu, 27 Oct 2022 07:00:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6022D6234A;
        Thu, 27 Oct 2022 14:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A921C433D6;
        Thu, 27 Oct 2022 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666879219;
        bh=hEfenjypfr9PQANvFTqoZNt7f/1ncVngiLP5vgkBhbY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c6bcYhImAgLwNndQAB/4Ur3RxA+AaRWA6ntnX2BS4koJnNEWl7rZvIHZMV/mJLs3m
         pJiXkCE/qvSCBCii75y59U2tyhdaYMyB7Mh3c75dVtC5C0fKR/Dr6M0ICpzyXXg9m0
         sJE8kxznmPDe02m1dLu1uKZsoyzObKClEAArjEu0=
Date:   Thu, 27 Oct 2022 16:00:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jim Lin <jilin@nvidia.com>
Cc:     mathias.nyman@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Petlozu Pravareshwar <petlozup@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH v5 3/3] xhci: tegra: USB2 pad power controls
Message-ID: <Y1qO8cN4+kJVk2f5@kroah.com>
References: <20221027133127.27592-1-jilin@nvidia.com>
 <20221027133127.27592-4-jilin@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027133127.27592-4-jilin@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 27, 2022 at 09:31:27PM +0800, Jim Lin wrote:
> Program USB2 pad PD controls during port connect/disconnect, port
> suspend/resume, and test mode, to reduce power consumption on
> disconnect or suspend.
> 
> Signed-off-by: Petlozu Pravareshwar <petlozup@nvidia.com>
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> Signed-off-by: Jim Lin <jilin@nvidia.com>

Who is the author here?  These do not seem to be in the correct order if
you are the author, right?

> 
> ---
> v2: Fix issue that wrong tegra->phys[] may be accessed on tegra124
> v3: No change on copyright
> v4: Remove hcd_to_tegra_xusb() function which is used only once.
> v5: Update .hub_control in tegra_xhci_overrides (xhci-tegra.c)
>     Invoke xhci_hub_control() directly (xhci-tegra.c)
> 
>  drivers/usb/host/xhci-tegra.c | 131 +++++++++++++++++++++++++++++++++-
>  1 file changed, 130 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index c8af2cd2216d..f685bb7459ba 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -189,6 +189,13 @@ struct tegra_xusb_context_soc {
>  	} fpci;
>  };
>  
> +enum tegra_xhci_phy_type {
> +	USB3_PHY,
> +	USB2_PHY,
> +	HSIC_PHY,
> +	MAX_PHY_TYPES,
> +};
> +
>  struct tegra_xusb_soc {
>  	const char *firmware;
>  	const char * const *supply_names;
> @@ -274,6 +281,7 @@ struct tegra_xusb {
>  
>  	bool suspended;
>  	struct tegra_xusb_context context;
> +	u32 enable_utmi_pad_after_lp0_exit;

This is a bitfield, how do we know it will fit in a u32?  What is the
range you are putting in here?

thanks,

greg k-h
