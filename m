Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA43EB64DA
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jun 2023 11:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjFVLce (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jun 2023 07:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjFVLcc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jun 2023 07:32:32 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5BB51BF9;
        Thu, 22 Jun 2023 04:32:30 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f955850e30so653867e87.1;
        Thu, 22 Jun 2023 04:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687433549; x=1690025549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGhvZ1/DauMfcerJFWqfyrONOMSTCQff5g6WHUCgp6M=;
        b=BmnQBTZN/CYGqK4fCpPd9AZUZOtjUkVNP97WmazS2Fq/uo8AeqLZSYqiGuFD8xR7Hd
         sXKFekOeWowTqnDbTMO7OnMaSV9Ysrs6GDQ7tcfSmeeftLvBgTYSQ4q+IxlD+JiA9wvD
         8moBvuP0FGa+JONTMQ6O1fvnfdYP167L6W2W7zgN5mHXIjPPTdqXblccGR8TDgT8cT3D
         tSWhuUMrTtDQJFvQYdNEHij63EbZ98UUCBSTTSo+1s7AC+YU8jbpSK3T6eHAzZUEsOl2
         EhPW5E3Tsri7hcMgyH3ZjjCpD3eEl3Xhbke/B3gU0tvdCrEYXsck/05xT0Pg2qvT2wYf
         l22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687433549; x=1690025549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fGhvZ1/DauMfcerJFWqfyrONOMSTCQff5g6WHUCgp6M=;
        b=GeqeyLkS0iZeopJvLNnWWgKamgphzJRGlZenGHVcNWH+rvbFWyTR890WoeipCjkhS3
         NP4Eo/kft7EHBd9esNFd432NLJaM8d7K3XQ14cyc5oqTnuexPCDRPjSpecQsfLLS1d4q
         8WMYps+1yV+6XdYC4XFKZKqkxDTF5TgKxYz1MuT+86WwxViY2R30HZZCKHo2yPfXr7q1
         /Spp+9iDlt9mCRDILMMgSjY4n+C7xgQhJr0CbL/zIdsMjx5qgakq1UoldfvCjZ9pTn8M
         kcXHzUkOc7TVP5CRV1s1ZPCBjnGqn05gj2E9saMCoeHM6NJC+Fi3YZVBDyzgwCOJM7zR
         smbg==
X-Gm-Message-State: AC+VfDwPC9sFRFSs5NIdmde/sqXidCBmp//EsEROZ2V/2qc4tsgaNxrs
        DdVS/ZvgJNQmFmNwPZuhi1g=
X-Google-Smtp-Source: ACHHUZ6VEqZu24quAsusuhcFqA/qAgMsc/o9VFU2vg1gsos/6xsyVY3slAc4iKs0ZFNY7SjodS0MKA==
X-Received: by 2002:a05:6512:220b:b0:4f3:822d:bcf7 with SMTP id h11-20020a056512220b00b004f3822dbcf7mr8631182lfu.21.1687433548647;
        Thu, 22 Jun 2023 04:32:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-154-132.dynamic.spd-mgts.ru. [109.252.154.132])
        by smtp.googlemail.com with ESMTPSA id g24-20020a2e9cd8000000b002b590f2d808sm220504ljj.9.2023.06.22.04.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 04:32:28 -0700 (PDT)
Message-ID: <4925a344-03a4-6afb-881c-edf0b9930a4c@gmail.com>
Date:   Thu, 22 Jun 2023 14:32:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 65/68] clk: tegra: super: Switch to determine_rate
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech>
 <700c0c62-defd-01c1-3b1d-8a760dfa194f@gmail.com>
 <rgvgzbebuvehxhjxgalkqswodyt5mvh7vr57synt3gsuadlpj2@j2mlwe2tozeb>
 <ebfdd001b9e83199ec618362b79f689c.sboyd@kernel.org> <ZJMYrVl--rCcj1cB@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <ZJMYrVl--rCcj1cB@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.06.2023 18:35, Thierry Reding пишет:
> On Tue, Jun 20, 2023 at 12:09:09PM -0700, Stephen Boyd wrote:
>> Quoting Maxime Ripard (2023-06-19 00:26:19)
>>> On Mon, Jun 19, 2023 at 02:38:59AM +0300, Dmitry Osipenko wrote:
>>>> 05.05.2023 14:26, Maxime Ripard пишет:
>>>>>
>>>>> diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
>>>>> index 3f3a7a203c5f..7ec47942720c 100644
>>>>> --- a/drivers/clk/tegra/clk-super.c
>>>>> +++ b/drivers/clk/tegra/clk-super.c
>>>>> @@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_super_mux_ops = {
>>>>>     .restore_context = clk_super_mux_restore_context,
>>>>>  };
>>>>>  
>>>>> -static long clk_super_round_rate(struct clk_hw *hw, unsigned long rate,
>>>>> -                            unsigned long *parent_rate)
>>>>> +static int clk_super_determine_rate(struct clk_hw *hw,
>>>>> +                               struct clk_rate_request *req)
>>>>>  {
>>>>>     struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
>>>>>     struct clk_hw *div_hw = &super->frac_div.hw;
>>>>> +   unsigned long rate;
>>>>>  
>>>>>     __clk_hw_set_clk(div_hw, hw);
>>>>>  
>>>>> -   return super->div_ops->round_rate(div_hw, rate, parent_rate);
>>>>> +   rate = super->div_ops->round_rate(div_hw, req->rate,
>>>>> +                                     &req->best_parent_rate);
>>>>> +   if (rate < 0)
>>
>> There's the report that this condition is never possible. Maybe the
>> previous code was relying on an error value sometimes. Can we add
>> determine_rate to the div_ops and simplify this code? I asked on the
>> list for that earlier.
> 
> I was able to reproduce this on a Tegra30 Beaver, but the problem is
> more straightforward than this. The crash I was seeing during boot was
> because cclk_super_determine_rate() was still calling the round_rate()
> callback from tegra_clk_super_ops, which this patch removed (and added
> determine_rate() instead).
> 
> The following fixes the problem for me. It's basically converting the
> round_rate() call to an equivalent determine_rate() call.
> 
> Dmitry, can you verify that this fixes the issue that you were seeing?
> 
> Thierry
> 
> --- >8 ---
> diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/tegra/clk-tegra-super-cclk.c
> index 68d7bcd5fc8a..8a2bb4ae4fd2 100644
> --- a/drivers/clk/tegra/clk-tegra-super-cclk.c
> +++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
> @@ -86,9 +86,16 @@ static int cclk_super_determine_rate(struct clk_hw *hw,
>  	if (rate <= pllp_rate) {
>  		if (super->flags & TEGRA20_SUPER_CLK)
>  			rate = pllp_rate;
> -		else
> -			rate = tegra_clk_super_ops.round_rate(hw, rate,
> -							      &pllp_rate);
> +		else {
> +			struct clk_rate_request parent = {
> +				.rate = req->rate,
> +				.best_parent_rate = pllp_rate,
> +			};
> +
> +			tegra_clk_super_ops.determine_rate(hw, &parent);
> +			pllp_rate = parent.best_parent_rate;
> +			rate = parent.rate;
> +		}
>  
>  		req->best_parent_rate = pllp_rate;
>  		req->best_parent_hw = pllp_hw;
> --- >8 ---

Thank you for the fix, it works! Feel free to add my t-b :)


