Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4F3EB64DA
	for <linux-tegra@archiver.kernel.org>; Sun, 18 Jun 2023 23:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjFRXjH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 18 Jun 2023 19:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjFRXjG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 18 Jun 2023 19:39:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035A018F;
        Sun, 18 Jun 2023 16:39:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f8689fbf59so1258437e87.0;
        Sun, 18 Jun 2023 16:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687131541; x=1689723541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4eeAR9R8E9A8Z+bQ+zX5X1J755XJwi+6HLbi8oL22nI=;
        b=QFB1ckMiJLUDtT0oYq3Jcqd3iPBnFkeLlPVywccCkR67oKxmJ9jBG579cAMN5qnAI1
         aauCNBmR/7ZrLYfuczuZP/TDX1Qkt69pBwNJIUA6/rOobM6ha/NHvsszJLTWu4jaB6+p
         7ZpSaA/hd6lNB9ujWQcKVECBBo8rYxc2Qiis+4QWN+b1T3a7ZIxgsM4ckp78JUqANORD
         RnqhJIg1y7um2BRkaO1DcwHFKgClJz/9Rvmn60kDQEsAwyC9wq288CF+Uj9+Y/J0OZrx
         ZeFS305qSefjRi7EPU+EEbgVvFEGWVij/G72SwSwnBzmysJfLqMVh+TNb2vwa8yy8M5N
         A8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687131541; x=1689723541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4eeAR9R8E9A8Z+bQ+zX5X1J755XJwi+6HLbi8oL22nI=;
        b=SGHXbqe/2riwl7kWGr0s6CS76GUKSh4GUeeDaELpwJUNf5Hd/tImBO1jsfnI68A/yy
         5lefRaTfOHoVKJBGsPsi94Sk19g101moSts7S1xExdEKLYnLO4o6KornIpDid+pzKdPh
         Y7qBgEv61Wu+wtkOGUVc504nH2Y09pTKVn2i7K/RfI5a3dylA1KhqrS5mYKuKKU1RpbL
         4h/FsJMNglSwLGc29P3TK2R2MU3lj2U7uwF50A/pCCrH2JVW8JB7Es3xO66XrWaNCMdS
         zA/pRO6lzQCe4j7ObOz2ZrEW0pzZCiY3W8+EAqGPWt1oYjyoHOGzZ7U0rIrBqsXUqhpX
         EI4A==
X-Gm-Message-State: AC+VfDyuNYqm4SG88aFBwZrgwWMTW7BWLXL6fRhXJxa6FiB4vZHGW9Uz
        xbmJwZ7ZKjgEabFRTodj61kbK08FIng=
X-Google-Smtp-Source: ACHHUZ76Inx58CustymSURuIxtp4MPSIAxJBVjNFXSgpv2fGM68JwEPT0rQ207uQz5TfPIh+Xei+bQ==
X-Received: by 2002:a19:4f5a:0:b0:4f4:a656:2466 with SMTP id a26-20020a194f5a000000b004f4a6562466mr2747156lfk.15.1687131540651;
        Sun, 18 Jun 2023 16:39:00 -0700 (PDT)
Received: from [192.168.2.145] (109-252-149-7.dynamic.spd-mgts.ru. [109.252.149.7])
        by smtp.googlemail.com with ESMTPSA id m3-20020ac24283000000b004f76684329esm2112198lfh.234.2023.06.18.16.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 16:39:00 -0700 (PDT)
Message-ID: <700c0c62-defd-01c1-3b1d-8a760dfa194f@gmail.com>
Date:   Mon, 19 Jun 2023 02:38:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 65/68] clk: tegra: super: Switch to determine_rate
To:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech>
Content-Language: en-US
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.05.2023 14:26, Maxime Ripard пишет:
> The Tegra super clocks implements a mux with a set_parent hook, but
> doesn't provide a determine_rate implementation.
> 
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
> 
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
> 
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().
> 
> The driver does implement round_rate() though, which means that we can
> change the rate of the clock, but we will never get to change the
> parent.
> 
> However, It's hard to tell whether it's been done on purpose or not.
> 
> Since we'll start mandating a determine_rate() implementation, let's
> convert the round_rate() implementation to a determine_rate(), which
> will also make the current behavior explicit. And if it was an
> oversight, the clock behaviour can be adjusted later on.
> 
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
> Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/tegra/clk-super.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
> index 3f3a7a203c5f..7ec47942720c 100644
> --- a/drivers/clk/tegra/clk-super.c
> +++ b/drivers/clk/tegra/clk-super.c
> @@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_super_mux_ops = {
>  	.restore_context = clk_super_mux_restore_context,
>  };
>  
> -static long clk_super_round_rate(struct clk_hw *hw, unsigned long rate,
> -				 unsigned long *parent_rate)
> +static int clk_super_determine_rate(struct clk_hw *hw,
> +				    struct clk_rate_request *req)
>  {
>  	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
>  	struct clk_hw *div_hw = &super->frac_div.hw;
> +	unsigned long rate;
>  
>  	__clk_hw_set_clk(div_hw, hw);
>  
> -	return super->div_ops->round_rate(div_hw, rate, parent_rate);
> +	rate = super->div_ops->round_rate(div_hw, req->rate,
> +					  &req->best_parent_rate);
> +	if (rate < 0)
> +		return rate;
> +
> +	req->rate = rate;
> +	return 0;
>  }
>  
>  static unsigned long clk_super_recalc_rate(struct clk_hw *hw,
> @@ -193,7 +200,7 @@ const struct clk_ops tegra_clk_super_ops = {
>  	.get_parent = clk_super_get_parent,
>  	.set_parent = clk_super_set_parent,
>  	.set_rate = clk_super_set_rate,
> -	.round_rate = clk_super_round_rate,
> +	.determine_rate = clk_super_determine_rate,
>  	.recalc_rate = clk_super_recalc_rate,
>  	.restore_context = clk_super_restore_context,
>  };
> 

Tegra30 doesn't boot anymore with this change. Best would be to keep the
old behaviour for both sclk and periph tegra clocks.

