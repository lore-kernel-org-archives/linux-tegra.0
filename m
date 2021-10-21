Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CA5C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 21:37:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A4EE61251
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 21:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhJUVj4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 17:39:56 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:50820 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231573AbhJUVj4 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 17:39:56 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Hb16V1VVQz6R;
        Thu, 21 Oct 2021 23:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1634852258; bh=yUVhaB9gtZqOXRJVOA05HW9hkegVAWRPf9/Fb5zzqus=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=koVud3mbFV4o0HzcOfuSsIcS2ECm/kLSoXQuf6z+NYoTkDHLtnIDgnSecJEiUNeAG
         k8Gq9vQVQwbPEFuKm+OcqpAvsi8aPWmV7qrHRqy5gCAA9aJJFQohoOJskWET0G+/V2
         uJP6WgJN4GyL+oeOlCXdnNJE0XUtBWBSciWfN5nBIDY4MJuiilWEiDQIsk4QYU8oMF
         90eZLNEzek9jTdfc3WL059gNWPMM1BEDAfYZASi4QDODXSaR3MHXZzsw4oPS7rX7zI
         nHW1GSvIEeK+bV4sfwoS28azb/E5jKp5WQ0bk+nyxlegxVsUiR05LKa5+FmQ45IDxe
         UdsSfk89OopjQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Thu, 21 Oct 2021 23:37:36 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
Message-ID: <YXHdoFAgGlxoI0Jx@qmqm.qmqm.pl>
References: <20211021115501.14932-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021115501.14932-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 21, 2021 at 02:55:01PM +0300, Dmitry Osipenko wrote:
> Older device-trees don't specify padctrl interrupt and xhci-tegra driver
> now fails to probe with -EINVAL using those device-trees. Check interrupt
> presence and disallow runtime PM suspension if it's missing to fix the
> trouble.
[...]
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1454,10 +1454,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  		goto put_padctl;
>  	}
>  
> -	tegra->padctl_irq = of_irq_get(np, 0);
> -	if (tegra->padctl_irq <= 0) {
> -		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
> -		goto put_padctl;
> +	/* Older device-trees don't specify padctrl interrupt */
> +	if (of_property_read_bool(np, "interrupts")) {

Does this catch "interrupts-extended"?

> +		tegra->padctl_irq = of_irq_get(np, 0);
> +		if (tegra->padctl_irq <= 0) {
> +			err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
> +			goto put_padctl;
> +		}

Best Regards
Micha³ Miros³aw
