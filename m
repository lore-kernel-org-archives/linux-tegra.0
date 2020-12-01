Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FBAC8300F
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Dec 2020 18:37:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CA2821741
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Dec 2020 18:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N9GXOOYY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392246AbgLAShP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Dec 2020 13:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392279AbgLAShP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Dec 2020 13:37:15 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E586EC0613D6
        for <linux-tegra@vger.kernel.org>; Tue,  1 Dec 2020 10:36:34 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id n14so2636648iom.10
        for <linux-tegra@vger.kernel.org>; Tue, 01 Dec 2020 10:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CRRh4gmCZpqCwwrsNrjNS8FDU6nBF/6A0Gt8Me2fWgA=;
        b=N9GXOOYYMdmoTPfMl6Scwdw59P+r8p9HlZeoRBNXo6pQPx7Me/XvkmzRiUXRAjYdqB
         VVV+i+CP0QPeHvCVHeGv7MWdrGC57TaW3z2VZcE7Ol2tBcS7d2jC0aBJ3N37bJbav1K5
         q3WiAU93BCyUhQ/aXZ9KEytM9FS5Zg8yPpqwFa001LjZFQ8RxRVMiLm5oLXtPQxlcuHS
         kC4CfFiihPo25yLzRHR3aOi0MapWK9sUFYGLX6VkDKBFYJaeMhBgcJZAr2rwXT0qp1lx
         OwcYpFGbnzvZdYcnCatzNY/EqPcZWr2K5Enl2ayfpdp3755Y/+q3x45WAJ0/sygAkSvx
         vCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CRRh4gmCZpqCwwrsNrjNS8FDU6nBF/6A0Gt8Me2fWgA=;
        b=ADMra/lU3a9qJbqOApFpzKeXckPP2xeP7Mz+0Rd9ylGJBuOYp/C47pJAXEgA0UEDka
         dX2RkHGXHvqYfR7CoLHPNs8whVAxttIZ5qxa5can7F+qbgRBx098HhGq95Pk3W4G2gA8
         q8Q/MRH8ztcqfHa6CO6b3EvanLg3Ld3foHG401vilQRhvZm4rkNzX+/XObxvn9bUprUV
         8OWFw8LmC10YThv+kfbz1/ncFCvKm+AdCABv+nVMh9n9xaZRLB6v38OoaKB1YwF1aiHd
         dbAp4CJMp2D7FzcfhmjANEVhhuasmO9V4cNK866rO/HC9tIFFx9I9JSAISNf5VlLlF1u
         GLHA==
X-Gm-Message-State: AOAM533N9W20tdFyZA9tOuwNoz3Onb6E/BAVUbU8kRFK+vLKO5xTyoGS
        EINhVjHNxqXI/FF3EokAhf5KvOHH2ZZDjg==
X-Google-Smtp-Source: ABdhPJzoMMXA2fF9ohu/9lVDAzQo9yIFP8uuGQvGcMCR7GT3h24W4lFY04F5YsiGwEG0kfdwuyqWKg==
X-Received: by 2002:a6b:6d10:: with SMTP id a16mr3440229iod.186.1606847793872;
        Tue, 01 Dec 2020 10:36:33 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id x23sm221386ioh.28.2020.12.01.10.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 10:36:33 -0800 (PST)
Subject: Re: [PATCH net-next 4/6] net: ipa: add support to code for IPA v4.5
To:     Jon Hunter <jonathanh@nvidia.com>, davem@davemloft.net,
        kuba@kernel.org
Cc:     evgreen@chromium.org, subashab@codeaurora.org,
        cpratapa@codeaurora.org, bjorn.andersson@linaro.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20201125204522.5884-1-elder@linaro.org>
 <20201125204522.5884-5-elder@linaro.org>
 <5b5d9d40-94d5-5dad-b861-fd9bef8260e2@nvidia.com>
From:   Alex Elder <elder@linaro.org>
Message-ID: <66089c0e-7591-a74f-79db-e8a38ea2d56a@linaro.org>
Date:   Tue, 1 Dec 2020 12:36:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5b5d9d40-94d5-5dad-b861-fd9bef8260e2@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/1/20 12:11 PM, Jon Hunter wrote:
> 
> On 25/11/2020 20:45, Alex Elder wrote:
>> Update the IPA code to make use of the updated IPA v4.5 register
>> definitions.  Generally what this patch does is, if IPA v4.5
>> hardware is in use:
>>    - Ensure new registers or fields in IPA v4.5 are updated where
>>      required
>>    - Ensure registers or fields not supported in IPA v4.5 are not
>>      examined when read, or are set to 0 when written
>> It does this while preserving the existing functionality for IPA
>> versions lower than v4.5.
>>
>> The values to program for QSB_MAX_READS and QSB_MAX_WRITES and the
>> source and destination resource counts are updated to be correct for
>> all versions through v4.5 as well.
>>
>> Note that IPA_RESOURCE_GROUP_SRC_MAX and IPA_RESOURCE_GROUP_DST_MAX
>> already reflect that 5 is an acceptable number of resources (which
>> IPA v4.5 implements).
>>
>> Signed-off-by: Alex Elder <elder@linaro.org>
> 
> 
> This change is generating the following build error on ARM64 ...

Sorry about that.  Thank you for reporting this, I will investigate.

					-Alex

> In file included from drivers/net/ipa/ipa_main.c:9:0:
> In function ‘u32_encode_bits’,
>      inlined from ‘ipa_hardware_config_qsb.isra.7’ at drivers/net/ipa/ipa_main.c:286:6,
>      inlined from ‘ipa_hardware_config’ at drivers/net/ipa/ipa_main.c:363:2,
>      inlined from ‘ipa_config.isra.12’ at drivers/net/ipa/ipa_main.c:555:2,
>      inlined from ‘ipa_probe’ at drivers/net/ipa/ipa_main.c:835:6:
> ./include/linux/bitfield.h:131:3: error: call to ‘__field_overflow’ declared with attribute error: value doesn't fit into mask
>     __field_overflow();     \
>     ^~~~~~~~~~~~~~~~~~
> ./include/linux/bitfield.h:151:2: note: in expansion of macro ‘____MAKE_OP’
>    ____MAKE_OP(u##size,u##size,,)
>    ^~~~~~~~~~~
> ./include/linux/bitfield.h:154:1: note: in expansion of macro ‘__MAKE_OP’
>   __MAKE_OP(32)
>   ^~~~~~~~~
> 
> Cheers
> Jon
> 

