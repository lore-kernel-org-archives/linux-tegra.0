Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B409C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 15:23:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDE16615FF
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 15:23:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhEKPYm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 11:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbhEKPYf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 11:24:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22584C061574;
        Tue, 11 May 2021 08:23:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h4so29287296lfv.0;
        Tue, 11 May 2021 08:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ADKRjjG+U6Cx+ubrJWYRmb4HSWDPh6DbS/6I/KaMcho=;
        b=YHLePLdx2gwPUhEfq8XHinUFEUh6dL/DkYPtmtXq4EiSYAFDlZxmH890syxHI9UQ81
         BDfUwOAlkdOmM76fZODHkf+ovx9/G7EVcZRzDt4ylC4PhppjPoa48vcInW8HtOvedrP+
         AGXvmg5hjd4NNqZqhHG2iQNwKscF4/iAB25mrHNHQMRirU1kXlb+OhpVa7GWR2VYFFi0
         qsIRl9v9E8bSiCXESOoiZ43GawZm5AQLFdDYLkGDRweUsEnFhM2Ip99SwwYuhV/qrpja
         rhX03dMsLjniXnh1jfX6eSK43LWWbENyYjF3xUixMCDyLQJGr/N4DMGvLsuhohrSbzJU
         rmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ADKRjjG+U6Cx+ubrJWYRmb4HSWDPh6DbS/6I/KaMcho=;
        b=mDA+rOiGEMC/PUyV3kMNE8opDCbWTRPKNj/YY4v4+M3tko97uUHuE9Ww7IgrX4aeq5
         8H6iCto+FngMbtlfywIlNrT026wqfgprLqxHXRc6USKd7ypMHQAnVSuCV14cmDAUvfVW
         f6fZX3WKa4WMv4eGyGSfsgWoQTPmQkEHqdPMkO2i7SdEUM7h+X3tYcFrTgePVwBM7bY9
         sSMhLnxGtOwtb4oh+E7QfHzAAeiXZ9Pl7tv1ZW/R3lnS1P4kFRAOjHOjzh9hEROsQ4rV
         ZvtTH+b0PGCYHz0MFpYtOU23ypHUY4CFSFESZyeyQn6PYPk/vfevm5IMXabrSmOSXo0+
         OaLQ==
X-Gm-Message-State: AOAM533vs5eLdsHWBF6s8xfuBOxD33RGM7oPyOp8bQTSu1NjSl88BWeJ
        RPHMaDi8Vey7u54SRBJpqz7pwbpH2SU=
X-Google-Smtp-Source: ABdhPJz2Qpvhj9Yo/qa3WG+mUOgsviecIss7RAxZ9bmKuZfDVgwGavhNzYBNq/KK0x89lJcBnuWUEw==
X-Received: by 2002:a05:6512:acc:: with SMTP id n12mr20637115lfu.408.1620746605520;
        Tue, 11 May 2021 08:23:25 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id k25sm148208lji.61.2021.05.11.08.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 08:23:25 -0700 (PDT)
Subject: Re: [PATCH v7 6/8] clk: tegra: cclk: Handle thermal DIV2 CPU
 frequency throttling
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210510231737.30313-1-digetx@gmail.com>
 <20210510231737.30313-7-digetx@gmail.com>
 <20210511144139.GB4413@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <04bc9e16-be7e-cf18-9fff-436dd063bf10@gmail.com>
Date:   Tue, 11 May 2021 18:23:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511144139.GB4413@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.05.2021 17:41, Michał Mirosław пишет:
> On Tue, May 11, 2021 at 02:17:35AM +0300, Dmitry Osipenko wrote:
>> Check whether thermal DIV2 throttle is active in order to report
>> the CPU frequency properly. This very useful for userspace tools
>> like cpufreq-info which show actual frequency asserted from hardware.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/clk/tegra/clk-tegra-super-cclk.c | 16 ++++++++++++++--
>>  drivers/clk/tegra/clk-tegra30.c          |  2 +-
>>  2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/tegra/clk-tegra-super-cclk.c
>> index a03119c30456..f75822b71d0e 100644
>> --- a/drivers/clk/tegra/clk-tegra-super-cclk.c
>> +++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
>> @@ -25,6 +25,8 @@
>>  
>>  #define SUPER_CDIV_ENB		BIT(31)
>>  
>> +#define TSENSOR_SLOWDOWN	BIT(23)
>> +
>>  static struct tegra_clk_super_mux *cclk_super;
>>  static bool cclk_on_pllx;
>>  
>> @@ -47,10 +49,20 @@ static int cclk_super_set_rate(struct clk_hw *hw, unsigned long rate,
>>  static unsigned long cclk_super_recalc_rate(struct clk_hw *hw,
>>  					    unsigned long parent_rate)
>>  {
>> +	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
>> +	u32 val = readl_relaxed(super->reg);
>> +	unsigned int div2;
>> +
>> +	/* check whether thermal throttling is active */
>> +	if (val & TSENSOR_SLOWDOWN)
>> +		div2 = 2;
>> +	else
>> +		div2 = 1;
>> +
>>  	if (cclk_super_get_parent(hw) == PLLX_INDEX)
>> -		return parent_rate;
>> +		return parent_rate / div2;
>>  
>> -	return tegra_clk_super_ops.recalc_rate(hw, parent_rate);
>> +	return tegra_clk_super_ops.recalc_rate(hw, parent_rate) / div2;
>>  }
> 
> Could you check if the compiler can optimize out the division? I know this
> is a slow path, but nevertheless the 'shr' version would be the same amount
> of source code.

Hello Michał,

GCC can't optimize that division. I'll wait for more comments and then
update this patch in v8 with yours suggestion. Thank you for taking a
look at the patches.
