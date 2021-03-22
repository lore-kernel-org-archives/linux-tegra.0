Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F4BC433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 11:16:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AADBC61990
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 11:16:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCVLQB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 22 Mar 2021 07:16:01 -0400
Received: from mga03.intel.com ([134.134.136.65]:18325 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230239AbhCVLPu (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Mar 2021 07:15:50 -0400
IronPort-SDR: jMTwT692utJOlRRq09ynxbXbqoceqjChbM1sd5jchBRcuJw+sXMH4OIOpDcsj31Ne3NX+FsXPY
 YM+TWdJ3U1eQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190277867"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="190277867"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 04:15:49 -0700
IronPort-SDR: OZYOA7tC0CHfja+cK3Xk0PnYeZUrqfiub50aZ+Gl01U3wJwp2DiEO7xYO89sTqz0sRPFjKq3Tv
 V9uFY11KGI5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; 
   d="scan'208";a="513270783"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 22 Mar 2021 04:15:47 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 22 Mar 2021 13:15:46 +0200
Date:   Mon, 22 Mar 2021 13:15:46 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: paz00: Handle device properties with
 software node API
Message-ID: <YFh8Yt+XV9LCHBan@kuha.fi.intel.com>
References: <20210322111245.3784-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322111245.3784-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Mar 22, 2021 at 02:12:45PM +0300, Heikki Krogerus wrote:
> The old device property API is going to be removed.
> Replacing the device_add_properties() call with the software
> node API equivalent, device_create_managed_software_node().
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  arch/arm/mach-tegra/board-paz00.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
> index b5c990a7a5af5..18d37f90cdfe3 100644
> --- a/arch/arm/mach-tegra/board-paz00.c
> +++ b/arch/arm/mach-tegra/board-paz00.c
> @@ -36,7 +36,7 @@ static struct gpiod_lookup_table wifi_gpio_lookup = {
>  
>  void __init tegra_paz00_wifikill_init(void)
>  {
> -	platform_device_add_properties(&wifi_rfkill_device, wifi_rfkill_prop);
> +	device_create_managed_software_node(&wifi_rfkill_device.dev, wifi_rfkill_prop, NULL);
>  	gpiod_add_lookup_table(&wifi_gpio_lookup);
>  	platform_device_register(&wifi_rfkill_device);
>  }

Sorry, I forgot that I had already send this. Please ignore this one.

Thanks,

-- 
heikki
