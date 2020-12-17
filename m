Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA65C2BB9A
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 15:51:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCC7D23998
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 15:51:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbgLQPuo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 10:50:44 -0500
Received: from netrider.rowland.org ([192.131.102.5]:34963 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728125AbgLQPuo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 10:50:44 -0500
Received: (qmail 280741 invoked by uid 1000); 17 Dec 2020 10:50:03 -0500
Date:   Thu, 17 Dec 2020 10:50:03 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] usb: host: ehci-tegra: Remove the driver
Message-ID: <20201217155003.GA280158@rowland.harvard.edu>
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217094007.19336-8-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 17, 2020 at 12:40:06PM +0300, Dmitry Osipenko wrote:
> The ChipIdea driver now provides USB2 host mode support for NVIDIA Tegra
> SoCs. The ehci-tegra driver is obsolete now, remove it and redirect the
> older Kconfig entry to the CI driver.
> 
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/host/Kconfig      |   8 +-
>  drivers/usb/host/Makefile     |   1 -
>  drivers/usb/host/ehci-tegra.c | 604 ----------------------------------
>  3 files changed, 6 insertions(+), 607 deletions(-)
>  delete mode 100644 drivers/usb/host/ehci-tegra.c
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 31e59309da1f..318315602337 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -269,9 +269,13 @@ config USB_EHCI_HCD_AT91
>  config USB_EHCI_TEGRA
>  	tristate "NVIDIA Tegra HCD support"
>  	depends on ARCH_TEGRA
> -	select USB_EHCI_ROOT_HUB_TT
> -	select USB_TEGRA_PHY
> +	select USB_CHIPIDEA
> +	select USB_CHIPIDEA_HOST
> +	select USB_CHIPIDEA_TEGRA
>  	help
> +	  This option is deprecated now and the driver was removed, use
> +	  USB_CHIPIDEA_TEGRA instead.
> +
>  	  This driver enables support for the internal USB Host Controllers
>  	  found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.

It doesn't really make sense to say "... the driver was removed..."
and then in the next paragraph say "This driver enables...".  You
should change the second paragraph to begin: "Enable support for...".

That's a minor matter, though, and you can easily fix it in the next
patch version.  Everything else is okay.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
