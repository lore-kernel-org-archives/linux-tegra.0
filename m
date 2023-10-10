Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157E5CD80C1
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Oct 2023 13:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbjJJNN1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Oct 2023 09:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjJJNN0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Oct 2023 09:13:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35530A9;
        Tue, 10 Oct 2023 06:13:25 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="383264952"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="383264952"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="844124118"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="844124118"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:13:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andy@kernel.org>)
        id 1qqCY3-00000004LcC-2JKZ;
        Tue, 10 Oct 2023 16:13:19 +0300
Date:   Tue, 10 Oct 2023 16:13:19 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] gpio: tegra186: Set fwnode of the GPIO chip
Message-ID: <ZSVN73ffDkGBzmmI@smile.fi.intel.com>
References: <20231009173858.723686-1-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009173858.723686-1-dipenp@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 09, 2023 at 10:38:58AM -0700, Dipen Patel wrote:

Tbank you! My comments below.

> Any driver that depends on the GPIO match function to locate the GPIO
> controller, it has to use the fwnode from the gpio_chip structure. But
> with [1], it is GPIO providers job to set any members of the gpio_chip
> structure. This patch addresses that.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git/patch/drivers/gpio/gpiolib.c?id=daecca4b8433d47f0db4933bcc0f283d530ba22e

Use Link: tag for this?

...

> +	/*
> +	 * This is needed for driver using gpio device matching where it
> +	 * has to use gpio_chip fwnode to match the gpio controller.
> +	 */
> +	gpio->gpio.fwnode = of_node_to_fwnode(pdev->dev.of_node);

of_node_to_fwnode() is specific to IRQ, in other places we use generic
of_fwnode_handle(). That's why better just to use dev_fwnode().

...

With the above addressed:
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


