Return-Path: <SRS0=h/hb=EB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DFFC55178
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 15:05:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B08F20773
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 15:05:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783066AbgJZPFk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Oct 2020 11:05:40 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42281 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1783064AbgJZPFj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 11:05:39 -0400
Received: (qmail 1193324 invoked by uid 1000); 26 Oct 2020 11:05:38 -0400
Date:   Mon, 26 Oct 2020 11:05:38 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-tegra: Fix error handling in
 tegra_ehci_probe()
Message-ID: <20201026150538.GA1192191@rowland.harvard.edu>
References: <20201026090657.49988-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026090657.49988-1-tangbin@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 26, 2020 at 05:06:57PM +0800, Tang Bin wrote:
> If the function platform_get_irq() failed, the negative value
> returned will not be detected here. So fix error handling in
> tegra_ehci_probe().
> 
> Fixes: 79ad3b5add4a ("usb: host: Add EHCI driver for NVIDIA Tegra SoCs")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/usb/host/ehci-tegra.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
> index 75a075daf..7b0efaf15 100644
> --- a/drivers/usb/host/ehci-tegra.c
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -479,9 +479,9 @@ static int tegra_ehci_probe(struct platform_device *pdev)
>  	u_phy->otg->host = hcd_to_bus(hcd);
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (!irq) {
> -		err = -ENODEV;
> -		goto cleanup_phy;
> +	if (irq < 0) {
> +		err = irq;
> +		goto cleanup_phy;
>  	}
>  
>  	otg_set_host(u_phy->otg, &hcd->self);

Acked-by: Alan Stern <stern@rowland.harvard.edu>

The "if (!irq)" statement occurs at least one other driver in this 
directory.  Would you like to submit a patch for ehci-xilinx-of.c as 
well?

Alan Stern
