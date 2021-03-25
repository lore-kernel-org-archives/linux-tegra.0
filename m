Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2193CC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:54:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D684161A10
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhCYOxr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCYOxo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:53:44 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D1DC06174A;
        Thu, 25 Mar 2021 07:53:42 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id z8so3442574ljm.12;
        Thu, 25 Mar 2021 07:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QYHZyeRIpj/WD3sjHB3UD6cGlHJJw+nSq8t67YyK3ag=;
        b=EJENdKr4l4LGOV8iUHaXzVSNMQlI2W0C3mkZyu/yw/dYDDAGY1Rfpyh+cqoeUbDAI+
         GPDQq33yDJPCYpgaAxqKVUNqzrfI7/oj/tSCGU56ckRiA4JVcEVn5sGAbu3HAlstz1St
         13xo9SPW2/x6Ha2bWsxEYwRG9wOo3WY0mprJF1W1fNqOkomyCQti07J7qkHW+0XGF/1C
         V58hfW3wqEgOXfbdWv4YC6Wk2koR/EpEHVTvOnPQhk0rJQoOHAUuutvkmgIFY6YQZVdo
         B91vin8y+qDx7peYbvhAUgwZhRV5S1e+NqbUks7HBuPg6qYP/p/hCeKtytoegVkQmkyq
         EJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QYHZyeRIpj/WD3sjHB3UD6cGlHJJw+nSq8t67YyK3ag=;
        b=T31zrx5oXZQMoU1BtjrPbIv3sxNM4Bdzo+yAtuhsPHX1QMOSh6pFCkZ7BHrPXjatXZ
         Pzr9KJl/+2w8+OQmk90Tyf9UH8r1aQPsHXIN29SyI57uAmQ8iYfDmvhz0BkNg1uPSf8n
         uwGvrtX3cZ35CCsbEGLLNYenbcaVvm+jsu8rsCtyZc/htGE8Mvk9E3dA9A4ADVhqPs3h
         AMpwMvV+13fW9ElG9Ls9dx+EyigOzX7ZbvxRlLjDUtdmoRzhdUgW74wVVyRxynt5yN/P
         2N8rQg5Hd8Fh9sj/Jf/6HO4ASN6Y+44ZkzGQ1a7wQ8pAPyUGB6Zecj10nhAtnz89HMni
         7y/w==
X-Gm-Message-State: AOAM532tQiMh9UTpZjY0e9sLEsztN9mpP81Fpl9ksW8kCQizEG3Nxr2n
        YkRZUaSk0eNOPEz1uYPHa5zLPIk5pWI=
X-Google-Smtp-Source: ABdhPJzZgqSGy7M8wCp/o9tDT5WpUJ4ybu6FPLm2yMuuHQh2Ib4ratJXPsZtN/pw+bFV0TPaIkRzsQ==
X-Received: by 2002:a2e:b5a5:: with SMTP id f5mr6053442ljn.336.1616684021256;
        Thu, 25 Mar 2021 07:53:41 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id u6sm573032lfm.56.2021.03.25.07.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 07:53:40 -0700 (PDT)
Subject: Re: [PATCH v4 5/5] soc/tegra: pmc: Rate-limit error message about
 failed to acquire of reset
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302122502.20874-1-digetx@gmail.com>
 <20210302122502.20874-6-digetx@gmail.com> <YFyhR1XgFGzJkkLt@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dc3eeba3-b319-8892-4fdb-9162f4d465ed@gmail.com>
Date:   Thu, 25 Mar 2021 17:53:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFyhR1XgFGzJkkLt@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.03.2021 17:42, Thierry Reding пишет:
> On Tue, Mar 02, 2021 at 03:25:02PM +0300, Dmitry Osipenko wrote:
>> PMC domain could be easily bombarded with the enable requests if there is
>> a problem in regards to acquiring reset control of a domain and kernel
>> log will be flooded with the error message in this case. Hence rate-limit
>> the message in order to prevent missing other important messages.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/soc/tegra/pmc.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index bf29ea22480a..84ab27d85d92 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -868,8 +868,8 @@ static int tegra_genpd_power_off(struct generic_pm_domain *domain)
>>  
>>  	err = reset_control_acquire(pg->reset);
>>  	if (err < 0) {
>> -		dev_err(dev, "failed to acquire resets for PM domain %s: %d\n",
>> -			pg->genpd.name, err);
>> +		dev_err_ratelimited(dev, "failed to acquire resets for PM domain %s: %d\n",
>> +				    pg->genpd.name, err);
> 
> That doesn't look right. This is a serious error condition that
> shouldn't happen at all. Ever. If this shows up even once we've got a
> serious bug somewhere and we need to fix it rather than "downplay" it
> by ratelimiting these errors.
> 
> What's the exact use-case where you see this?

This was firing up badly while I was wiring up power management and
GENPD support to the GR3D and VDE drivers and testing them because of
the bugs that I was creating.

Looking back again at this now, I agree that the commit message isn't
good and could be improved. What about this variant:

"Rate-limit error message about failing to acquire reset in order to
prevent missing other important messages. This was proven to be very
useful to have for development and debugging purposes of a power
management support for various Tegra drivers".
