Return-Path: <SRS0=wB+u=CT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EB4C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 02:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B53620BED
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 02:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="FGEuZKaL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730729AbgIJCVb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Sep 2020 22:21:31 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1881 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730784AbgIJCSJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 22:18:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f598cb20000>; Wed, 09 Sep 2020 19:17:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 09 Sep 2020 19:18:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 09 Sep 2020 19:18:06 -0700
Received: from [10.19.100.126] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 02:18:04 +0000
Subject: Re: [PATCH] phy: tegra: xusb: fix xusb backwards compatibility
To:     Peter Geis <pgwipeout@gmail.com>, <linux-tegra@vger.kernel.org>
CC:     Nagarjuna Kristam <nkristam@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Matias Zuniga <matias.nicolas.zc@gmail.com>
References: <20200908150124.31336-1-pgwipeout@gmail.com>
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <91d24891-6e89-a075-8dd8-d6a55797c3c2@nvidia.com>
Date:   Thu, 10 Sep 2020 10:18:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908150124.31336-1-pgwipeout@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599704242; bh=l63OBdrfOIPwsU4M2Po3yz9vGED7sqTfmAdCuBGG8cU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=FGEuZKaLGk/WyNuzgoA56GOZjNpMTZ/STb9/AY9/bKIMdY2NK3qmdWCl7FPm+L81I
         hNs2xMOdsKS8K+XEvDYZi4j9q7x9x/eElvdzrRydWEYEQrpqBTzHG+YecoXcHO17Q7
         dLWhPwII7jUcGD0mtcRN1g6PvOjBKTOsyQ6hCTvADndZBsI4ZVjSGhaKV1SHhJf1Sq
         Vj62+frgQVnKy0RsVls0mloDNwfbyMc0OLDHjgsdFhrTyipGN09LGVRf3pk/ZGdcCx
         N5pm8vopBsQUSrx1DRqmbV4duxYfWG9dx8GyoJvBz6KOm5x83XdiQquGQycQvnLTCv
         QlsVX99zd/3tQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Peter,
Thanks for your patch. If an OTG capable port doesn't have a way to detect its
initial role based on cable detection, I think it's somehow dangerous to give
the port to host controller. When the port is enabled for host role, platform
starts supplying VBUS to the connector. If the connector happens to be connected
to a host role port which is supplying VBUS as well, there could be some damage
to the board which doesn't have proper protection.

Thanks,
JC

On 9/8/20 11:01 PM, Peter Geis wrote:
> Prior to implementing role switch support, all enabled ports enumerated
> as host devices.
> With role switch support enabled, device trees with otg ports which have
> not been updated with usb-role-switch support now bail out during
> enumeration.
> This disables all xhci ports tied to the affected phy.
> 
> Retain backwards compatibility by forcing host mode on otg ports which
> are missing the usb-role-switch flag.
> Disable ports explicitly defined as peripheral mode that are missing the
> usb-role-switch flag.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> Reported-by: Matias Zuniga <matias.nicolas.zc@gmail.com>
> 
> Fixes: e8f7d2f409a1 ("phy: tegra: xusb: Add usb-phy support")
> ---
>  drivers/phy/tegra/xusb.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index de4a46fe1763..c36dce13e0c6 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -734,10 +734,12 @@ static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
>  			err = tegra_xusb_setup_usb_role_switch(port);
>  			if (err < 0)
>  				return err;
> +		} else if (usb2->mode == USB_DR_MODE_PERIPHERAL) {
> +			dev_err(&port->dev, "mandatory usb-role-switch not found for %s mode, disabling port\n", modes[usb2->mode]);
> +			usb2->mode = USB_DR_MODE_UNKNOWN;
>  		} else {
> -			dev_err(&port->dev, "usb-role-switch not found for %s mode",
> -				modes[usb2->mode]);
> -			return -EINVAL;
> +			dev_warn(&port->dev, "usb-role-switch not found for %s mode, forcing host\n", modes[usb2->mode]);
> +			usb2->mode = USB_DR_MODE_HOST;
>  		}
>  	}
>  
> 
