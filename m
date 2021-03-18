Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFC0C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 09:14:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E707D64F24
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Mar 2021 09:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhCRJOG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Mar 2021 05:14:06 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:9436 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229600AbhCRJNi (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Mar 2021 05:13:38 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4F1Lt74w3zzFV;
        Thu, 18 Mar 2021 10:13:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1616058816; bh=B/w6FnU1M8k1x8n6SpOvWjJ7fnKVBOzRmgm3GyKX0h4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FxIh9eKfWmGwT5IZxR16FfA9VRI+Ub43iw+oRHsJeETqL9G8qt9bw8GhVsB3UCzBm
         +WYmN+7N4HvMx/8QwCcGbJ2o6uKZYLM6CA0ZPeM7F3A2qUbvEu9AomWdfoNzvCJmC2
         MqhjvUr4aDgurjwJbsnGBtzcq4EXfnxQW6y4sEtt+1sGb8mn4aF4BE0wmveQlMGGkM
         GXvICbgnZ+Tz75q/eIVToRrgu8C004NyVwGAvtOhe/3OHrlFaklZ0rhUv2TNHFChm4
         lOJBK64yFJUVaGTIzXow9F+t8u/fGEJLL9H6KAAogJDI1MkvEsyiv/+WffktvZW2gM
         1eB/DSPMBom2Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 18 Mar 2021 10:12:19 +0100
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
Subject: Re: [PATCH v5 2/7] clk: tegra: Fix refcounting of gate clocks
Message-ID: <20210318091219.GA18038@qmqm.qmqm.pl>
References: <20210317193006.29633-1-digetx@gmail.com>
 <20210317193006.29633-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317193006.29633-3-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Mar 17, 2021 at 10:30:01PM +0300, Dmitry Osipenko wrote:
> The refcounting of the gate clocks has a bug causing the enable_refcnt
> to underflow when unused clocks are disabled. This happens because clk
> provider erroneously bumps the refcount if clock is enabled at a boot
> time, which it shouldn't be doing, and it does this only for the gate
> clocks, while peripheral clocks are using the same gate ops and the
> peripheral clocks are missing the initial bump. Hence the refcount of
> the peripheral clocks is 0 when unused clocks are disabled and then the
> counter is decremented further by the gate ops, causing the integer
> underflow.
[...]
> diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
> index 4b31beefc9fc..3c4259fec82e 100644
> --- a/drivers/clk/tegra/clk-periph-gate.c
> +++ b/drivers/clk/tegra/clk-periph-gate.c
[...]
> @@ -91,21 +108,28 @@ static void clk_periph_disable(struct clk_hw *hw)
>  
>  	spin_lock_irqsave(&periph_ref_lock, flags);
>  
> -	gate->enable_refcnt[gate->clk_num]--;
> -	if (gate->enable_refcnt[gate->clk_num] > 0) {
> -		spin_unlock_irqrestore(&periph_ref_lock, flags);
> -		return;
> -	}
> +	WARN_ON(!gate->enable_refcnt[gate->clk_num]);
> +
> +	if (gate->enable_refcnt[gate->clk_num]-- == 1)
> +		clk_periph_disable_locked(hw);

Nit: "if (--n == 0)" seems more natural, as you want to call
clk_periph_disable_locked() when the refcount goes down to 0.

[...]
>  	/*
> -	 * If peripheral is in the APB bus then read the APB bus to
> -	 * flush the write operation in apb bus. This will avoid the
> -	 * peripheral access after disabling clock
> +	 * Some clocks are duplicated and some of them are marked as critical,
> +	 * like fuse and fuse_burn for example, thus the enable_refcnt will
> +	 * be non-zero here id the "unused" duplicate is disabled by CCF.

s/id/if/ ?

Best Regards
Micha³ Miros³aw
