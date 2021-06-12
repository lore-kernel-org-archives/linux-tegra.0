Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D485C48BCF
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Jun 2021 07:34:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DA65610E9
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Jun 2021 07:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhFLHg4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 12 Jun 2021 03:36:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:59384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230470AbhFLHg4 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Jun 2021 03:36:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DCFE610A1;
        Sat, 12 Jun 2021 07:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623483297;
        bh=j02hdfqwU93O0q7tZ7pAROB9/8BHnXp4ZiC7oLVYs7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nQoOnWgNBBYwPF+s+v/MUYUF42Pj6BdYJ8AI9zH6Rdh0EN1mF3zGPzigdGmByWQxR
         4Wf9qe3ePF4JRMqyCwhbfiEOOBdsO+MnjDCP3mi/1wnwscA3HA4IEbLUETcKg3/NtB
         2wi7P6iDk54NYMzAEqwqllZYJU80eLf3CdrvCYAKbn4CdPYxPqBONw4gJ4uYioxBTL
         1TsEoYAV2DbZamRamEub3GqZDbfNMUD4MKN+fKayQVVFDPZRj+BZ8JSq43VTuaKI3v
         0G71qJdE9Dde4N5We8E7zIpqqA+K4LEUA/kQ0nh9asssdl2hO6LsZU01MtnLd3ibQF
         w5T8nLtNBAwYg==
Date:   Sat, 12 Jun 2021 15:34:50 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] usb: chipidea: tegra: Delay PHY suspending
Message-ID: <20210612073450.GB4580@Peter>
References: <20210609120404.3991-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609120404.3991-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21-06-09 15:04:04, Dmitry Osipenko wrote:
> The ChipIdea driver enters into suspend immediately after seeing a
> VBUS disconnection. Some devices need an extra delay after losing
> VBUS, otherwise VBUS may be floating, preventing the PHY's suspending
> by the VBUS detection sensors. This problem was found on Tegra30 Asus
> Transformer TF700T tablet device, where the USB PHY wakes up immediately
> from suspend because VBUS sensor continues to detect VBUS as active after
> disconnection. A minimum delay of 20ms is needed in order to fix this
> issue, hence add 25ms delay before suspending the PHY.
> 
> Reported-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> index 60361141ac04..d1359b76a0e8 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> @@ -255,6 +256,13 @@ static int tegra_ehci_hub_control(struct ci_hdrc *ci, u16 typeReq, u16 wValue,
>  
>  static void tegra_usb_enter_lpm(struct ci_hdrc *ci, bool enable)
>  {
> +	/*
> +	 * Give hardware time to settle down after VBUS disconnection,
> +	 * otherwise PHY may wake up from suspend immediately.
> +	 */
> +	if (enable)
> +		msleep(25);
> +

How could you know 25ms is enough for other Tegra designs?
Could you poll VBUS wakeup threshold register to ensure the
wakeup will not occur? The similar design exists at function:
hw_wait_vbus_lower_bsv.

-- 

Thanks,
Peter Chen

