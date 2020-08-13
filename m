Return-Path: <SRS0=irW6=BX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,SUBJECT_DRUG_GAP_L,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDD8C433DF
	for <linux-tegra@archiver.kernel.org>; Thu, 13 Aug 2020 00:24:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C686320829
	for <linux-tegra@archiver.kernel.org>; Thu, 13 Aug 2020 00:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="janc2rzC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgHMAYh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 12 Aug 2020 20:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgHMAYg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 12 Aug 2020 20:24:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FE2C061383;
        Wed, 12 Aug 2020 17:24:36 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f26so4224681ljc.8;
        Wed, 12 Aug 2020 17:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gwuRbsafJP8ISlOi3BJD/DTlryrf3+Ufz6ONoYmN8Cg=;
        b=janc2rzCfPrV3szeglM91wrUIIoUk9PShPbTLwHqSIHsKnHYEY4E2zwkaBvWhdNQ1W
         RxJPNvamviy/AodULq33Viu2RLg9nzCPbc48oLVaj5mq3RBJMkbrznWBEL2xnpQNSpk1
         wWn+Yi7GYI5aFH9O47e+F9q6EyQuod1aasrvcAmoiXKrte0ezU3iJk6kr6lO9QZPlYlt
         dYAQR41fk/ey32YPQHO3kwWN98bx0MglrPwugRZXQtof5HcKmA+icIJJY09aIQvHZk+k
         RAPm/WQtE6yqqvdWo0EIXvG627ugM+PF7uz0f4Jh0ZnEV45TCygVHJJRfbBOcfTvKxDH
         VWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gwuRbsafJP8ISlOi3BJD/DTlryrf3+Ufz6ONoYmN8Cg=;
        b=ev8QL4JMCBNwxrS2sEr30NbTyshQHsYWFm1ZHIbwRfZZ1cQ2NeGCmvXG28cWJ6X6Kz
         XbevgfaXUJs+CvRjEy1qal3VFBMZIBVWcIaZeEvP/GYmmvOKivjpcUBPiy+k9cS7iJ5+
         8CBmvIc9F7GuPd57l7afeL9L7568g5S3m1+OiJrNuV5BArF7Gp4vmX90m6IjXGeqP9OB
         KeGXg7XLTwjuD/ORogawgZz5IdD1TWeAxRYNuMDCSR36LyrznIPeACcT3JD6y1kurnVn
         cS+etNmw/2SP66pbM7lEee1R9elAdrm59NLoubyeRX1AcFmX7LY4Y50sG8D4W90m6rKh
         3yuA==
X-Gm-Message-State: AOAM530DSXb+asLHbmLA8F7WWznMSe409/a88e8L1iAmjN4BCPH2ISSR
        FDM757eNT1Qv3z5h4ZNGhbk=
X-Google-Smtp-Source: ABdhPJxn2xxQ3JGiSMdj5N3uj42Xe67P8W0+f37cwmSXORwfJX2X+7icfK82tq8Cxi9aiB6OAp4wdg==
X-Received: by 2002:a05:651c:505:: with SMTP id o5mr769785ljp.306.1597278274140;
        Wed, 12 Aug 2020 17:24:34 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id h6sm810501lfc.84.2020.08.12.17.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 17:24:33 -0700 (PDT)
Subject: Re: Request to pick up couple NVIDIA Tegra ASoC patches into 5.7
 kernel
To:     Sasha Levin <sashal@kernel.org>
Cc:     Stable <stable@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Erik Faye-Lund <kusmabite@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        alsa-devel@alsa-project.org
References: <2db6e1ef-5cea-d479-8a7a-8f336313cb1d@gmail.com>
 <20200813000800.GM2975990@sasha-vm>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4991edb7-011d-2dc4-e684-797b6504a122@gmail.com>
Date:   Thu, 13 Aug 2020 03:24:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813000800.GM2975990@sasha-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.08.2020 03:08, Sasha Levin пишет:
> On Wed, Aug 12, 2020 at 10:14:34PM +0300, Dmitry Osipenko wrote:
>> Hello, stable-kernel maintainers!
>>
>> Could you please cherry-pick these commits into the v5.7.x kernel?
>>
>> commit 0de6db30ef79b391cedd749801a49c485d2daf4b
>> Author: Sowjanya Komatineni <skomatineni@nvidia.com>
>> Date:   Mon Jan 13 23:24:17 2020 -0800
>>
>>    ASoC: tegra: Use device managed resource APIs to get the clock
>>
>> commit 1e4e0bf136aa4b4aa59c1e6af19844bd6d807794
>> Author: Sowjanya Komatineni <skomatineni@nvidia.com>
>> Date:   Mon Jan 13 23:24:23 2020 -0800
>>
>>    ASoC: tegra: Add audio mclk parent configuration
>>
>> commit ff5d18cb04f4ecccbcf05b7f83ab6df2a0d95c16
>> Author: Sowjanya Komatineni <skomatineni@nvidia.com>
>> Date:   Mon Jan 13 23:24:24 2020 -0800
>>
>>    ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init()
>>
>> It will fix a huge warnings splat during of kernel boot on NVIDIA Tegra
>> SoCs. For some reason these patches haven't made into 5.7 when it was
>> released and several people complained about the warnings. Thanks in
>> advance!
> 
> They never made it in because they don't have a stable tag, a fixes tag,
> or do they sound like they fix a problem :)
> 
> Do you have a reference to the issue at hand here?

https://lore.kernel.org/lkml/64b70163-05be-e4f9-2dbc-5088ac2a3af9@nvidia.com/

> Either way, 5.7 is alive for only about 1 or 2 weeks, is anyone still
> stuck on 5.7?
> 

I didn't know that 5.7 is about to die, let's not bother with it then.
Thanks!
