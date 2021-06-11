Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FB9C4743D
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 06:50:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 341A061374
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 06:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhFKGwk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 02:52:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48863 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhFKGwk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 02:52:40 -0400
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lrb06-0001M5-Dv
        for linux-tegra@vger.kernel.org; Fri, 11 Jun 2021 06:50:42 +0000
Received: by mail-wr1-f71.google.com with SMTP id k11-20020adfe3cb0000b0290115c29d165cso2152864wrm.14
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 23:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pLOBPFvm1d1yyBxdIYWXw/K9CwPdaekowQX7zgATDZw=;
        b=oKWWVa5SP3vtMWhfCrnTAPl40dU265qFc3Vo91+odkB1083GTGnTsE1fbS3Fuoo16s
         Az+mpA65MHjPfp1nzOSlb3nmw3ghjVsvdzygG3a4DQ9nYNxsvCo27BqMcpZZf9yeZai6
         0mNG6AbTnR0E2JyH447jarcG7i7UO20Wwfdx+USj/6g2xTGJu+e6gP5US47IdJpRQ9B5
         2Ihaxpi1+jAZFw9G8SAio0f5Yz2xN5txqAyvpWUCuiTpCskgZ7HFKj4L4jfVMQwXBorg
         chHiFBRbJ5864plyEy8Bnjdlt9VuiyAGTL8sb5JnN44dU9MW+Hce2Hp6aVYnlrQe6IMO
         fY0Q==
X-Gm-Message-State: AOAM530t27CdoJeyU3kC6sKJX8mcksAB38eNSXbQoKprroeivS3gKTUj
        SH6jayNS4nH9XiZ1LBMdAwuuV7t5vVEeo+AioNk7pafOAlsLMWpoKpgGJo+bz6MVP/SCXtU48w+
        lORn9d/2WqmMd7ZRNLCr1deUwZbfUNSFceVJYljc8
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr2314279wmb.80.1623394242186;
        Thu, 10 Jun 2021 23:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/2WnuT15SabgoYSt2dEE/7HwHNgKFxQh9LW9xGm5fbv5vimuC6uB7Ttj029S3midCWCRuGg==
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr2314275wmb.80.1623394242060;
        Thu, 10 Jun 2021 23:50:42 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id 31sm6583761wrc.96.2021.06.10.23.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 23:50:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] memory: tegra: Add missing dependencies
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210609112806.3565057-1-thierry.reding@gmail.com>
 <20210609112806.3565057-2-thierry.reding@gmail.com>
 <0c762772-929e-2eb8-6568-4aa82ea2f9ad@gmail.com>
 <ee2846c0-9274-0888-90ac-dac72d2ab5fd@canonical.com>
 <a3110fbd-c4af-0317-5a6d-1f780f1dac91@gmail.com>
 <1400979c-c7a7-9618-1168-70185ed10546@canonical.com>
 <8d8d019a-34c1-50bd-5eba-ce361c263d35@gmail.com>
 <57f8e55d-d708-f304-cf35-3036ec2e64f5@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <99f98088-fed4-45bf-b0a1-241bfc896487@canonical.com>
Date:   Fri, 11 Jun 2021 08:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <57f8e55d-d708-f304-cf35-3036ec2e64f5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/06/2021 18:23, Dmitry Osipenko wrote:
> 10.06.2021 18:50, Dmitry Osipenko пишет:
>> 10.06.2021 09:43, Krzysztof Kozlowski пишет:
>>> The stubs might be good idea anyway, but the driver explicitly needs for
>>> runtime working reservedmem, so it should select it.
>>
>> The OF and reservedmem are both selected by the ARCH for the runtime
>> use. They may not be selected in the case of compile-testing.
>>
>> Both OF core and reservedmem provide stubs needed for compile-testing,
>> it's only the RESERVEDMEM_OF_DECLARE() that is missing the stub. Adding
>> the missing stub should be a more appropriate solution than adding extra
>> Kconfig dependencies, IMO.

Ah, in such case everything looks good. Stubs is indeed proper choice.

> I will send the patch. If OF maintainers will have objections, then
> adding the dependency may become a more reasonable option.

Thanks!


Best regards,
Krzysztof
