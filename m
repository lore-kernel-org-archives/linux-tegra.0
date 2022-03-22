Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3CAC433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Mar 2022 19:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbiCVTHf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Mar 2022 15:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiCVTHe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Mar 2022 15:07:34 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147F121277;
        Tue, 22 Mar 2022 12:06:02 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id 8F1C61F4414B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1647975960;
        bh=D6hgpxoxSbhmTxNI08QE3zs+RAds6Z3h0HTtecS2zSY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=PTWkCR5eni7rM6R0IZivCAw/HYJ9Cvzt5muTfeNyqm5A+cvOhi9cRFlhWldTkNB2p
         s3yaykh4JmPQM+EZ8WOrufMC4412fuxwt96tTY5vIzGqcSw3/PL/rh1kRxXPQAkBxC
         f4WW0Jy+qn82v5i/ZHWUbQjF8IgIqID4AJfogwYTHaN8AHyuwrpVKLBcdtlbb/aZ8r
         1lHjjO3mWT5ZRrtcNY2mCBcFESDHiunxkhkdQy9/8bQzIcMZxkmFzNBZbyrIUxuQf2
         drcdzZbGVxUoB435/dXrL+wP0XwMxG81BIj4o4lbyQXwOSkFob6Lw1VhDquQueuEYc
         f0FyOPGE/zSUw==
Message-ID: <7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com>
Date:   Tue, 22 Mar 2022 22:05:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 06/12] clk: Always set the rate on clk_set_range_rate
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220225143534.405820-1-maxime@cerno.tech>
 <20220225143534.405820-7-maxime@cerno.tech>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220225143534.405820-7-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2/25/22 17:35, Maxime Ripard wrote:
> When we change a clock minimum or maximum using clk_set_rate_range(),
> clk_set_min_rate() or clk_set_max_rate(), the current code will only
> trigger a new rate change if the rate is outside of the new boundaries.
> 
> However, a clock driver might want to always keep the clock rate to
> one of its boundary, for example the minimum to keep the power
> consumption as low as possible.
> 
> Since they don't always get called though, clock providers don't have the
> opportunity to implement this behaviour.
> 
> Let's trigger a clk_set_rate() on the previous requested rate every time
> clk_set_rate_range() is called. That way, providers that care about the
> new boundaries have a chance to adjust the rate, while providers that
> don't care about those new boundaries will return the same rate than
> before, which will be ignored by clk_set_rate() and won't result in a
> new rate change.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c      | 45 ++++++++++++++++----------------
>  drivers/clk/clk_test.c | 58 +++++++++++++++++++-----------------------
>  2 files changed, 49 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c15ee5070f52..9bc8bf434b94 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2373,28 +2373,29 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
>  		goto out;
>  	}
>  
> -	rate = clk_core_get_rate_nolock(clk->core);
> -	if (rate < min || rate > max) {
> -		/*
> -		 * FIXME:
> -		 * We are in bit of trouble here, current rate is outside the
> -		 * the requested range. We are going try to request appropriate
> -		 * range boundary but there is a catch. It may fail for the
> -		 * usual reason (clock broken, clock protected, etc) but also
> -		 * because:
> -		 * - round_rate() was not favorable and fell on the wrong
> -		 *   side of the boundary
> -		 * - the determine_rate() callback does not really check for
> -		 *   this corner case when determining the rate
> -		 */
> -
> -		rate = clamp(clk->core->req_rate, min, max);
> -		ret = clk_core_set_rate_nolock(clk->core, rate);
> -		if (ret) {
> -			/* rollback the changes */
> -			clk->min_rate = old_min;
> -			clk->max_rate = old_max;
> -		}
> +	/*
> +	 * Since the boundaries have been changed, let's give the
> +	 * opportunity to the provider to adjust the clock rate based on
> +	 * the new boundaries.
> +	 *
> +	 * We also need to handle the case where the clock is currently
> +	 * outside of the boundaries. Clamping the last requested rate
> +	 * to the current minimum and maximum will also handle this.
> +	 *
> +	 * FIXME:
> +	 * There is a catch. It may fail for the usual reason (clock
> +	 * broken, clock protected, etc) but also because:
> +	 * - round_rate() was not favorable and fell on the wrong
> +	 *   side of the boundary
> +	 * - the determine_rate() callback does not really check for
> +	 *   this corner case when determining the rate
> +	 */
> +	rate = clamp(clk->core->req_rate, min, max);
> +	ret = clk_core_set_rate_nolock(clk->core, rate);
> +	if (ret) {
> +		/* rollback the changes */
> +		clk->min_rate = old_min;
> +		clk->max_rate = old_max;
>  	}
>  
>  out:

Hi,

NVIDIA Tegra30 no longer boots with this change.

You can't assume that rate was requested by clk_set_rate() before
clk_set_rate_range() is called, see what [1] does. T30 memory rate now
drops to min on boot when clk debug range is inited innocuously and CPU
no longer can make any progress because display controller takes out
whole memory bandwidth.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/memory/tegra/tegra30-emc.c#n1437

If clk_set_rate() wasn't ever invoked and req_rate=0, then you must not
change the clk rate if it's within the new range. Please revert this
patch, thanks.
