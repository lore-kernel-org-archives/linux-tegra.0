Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFF6C433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 14:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B191061285
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 14:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhEKOmu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 10:42:50 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:42450 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231154AbhEKOmt (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 10:42:49 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Ffgbm5xsrz9C;
        Tue, 11 May 2021 16:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1620744101; bh=alDLovz9iqFt3O77cStCTYCIAdPi55MO/8EF8bUpQ3s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sa2q+cby28kKsaAx3hfbOXDavD4tPAJ9t3BYIMh4qRzvK4tTH+4BvZjUH/LVk+SFK
         PGTKiUzPvgWG1A18jyRLp7kQRFJJmSLmD9SO9WsA6Lonv8fkU+swRmkbLlux5G0FiM
         TILAT+Y75EbkFvlDTGN27R/4XKbXpO+csCT7XyD7xb3NChIQ2vpDYQR9x4Jjh5wwXi
         mLmFdUY3D8yVk9l1pt4BANuU8Y5malxWuP0dQFZopsgd+KH+bfJK6bwvFAHlWyepNY
         x7N1B/wGyn3d3ep/Mh2DeNHlWwuX5M3JwoIegv59AkyUfFQxSOJMtODkuJVDsknMyT
         tUZ3ykevttXVQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.2 at mail
Date:   Tue, 11 May 2021 16:41:39 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 6/8] clk: tegra: cclk: Handle thermal DIV2 CPU
 frequency throttling
Message-ID: <20210511144139.GB4413@qmqm.qmqm.pl>
References: <20210510231737.30313-1-digetx@gmail.com>
 <20210510231737.30313-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210510231737.30313-7-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 11, 2021 at 02:17:35AM +0300, Dmitry Osipenko wrote:
> Check whether thermal DIV2 throttle is active in order to report
> the CPU frequency properly. This very useful for userspace tools
> like cpufreq-info which show actual frequency asserted from hardware.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra-super-cclk.c | 16 ++++++++++++++--
>  drivers/clk/tegra/clk-tegra30.c          |  2 +-
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/tegra/clk-tegra-super-cclk.c
> index a03119c30456..f75822b71d0e 100644
> --- a/drivers/clk/tegra/clk-tegra-super-cclk.c
> +++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
> @@ -25,6 +25,8 @@
>  
>  #define SUPER_CDIV_ENB		BIT(31)
>  
> +#define TSENSOR_SLOWDOWN	BIT(23)
> +
>  static struct tegra_clk_super_mux *cclk_super;
>  static bool cclk_on_pllx;
>  
> @@ -47,10 +49,20 @@ static int cclk_super_set_rate(struct clk_hw *hw, unsigned long rate,
>  static unsigned long cclk_super_recalc_rate(struct clk_hw *hw,
>  					    unsigned long parent_rate)
>  {
> +	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
> +	u32 val = readl_relaxed(super->reg);
> +	unsigned int div2;
> +
> +	/* check whether thermal throttling is active */
> +	if (val & TSENSOR_SLOWDOWN)
> +		div2 = 2;
> +	else
> +		div2 = 1;
> +
>  	if (cclk_super_get_parent(hw) == PLLX_INDEX)
> -		return parent_rate;
> +		return parent_rate / div2;
>  
> -	return tegra_clk_super_ops.recalc_rate(hw, parent_rate);
> +	return tegra_clk_super_ops.recalc_rate(hw, parent_rate) / div2;
>  }

Could you check if the compiler can optimize out the division? I know this
is a slow path, but nevertheless the 'shr' version would be the same amount
of source code.

Best Regrads
Micha³ Miros³aw
