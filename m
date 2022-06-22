Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23009C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Jun 2022 09:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357301AbiFVJLC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Jun 2022 05:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356983AbiFVJKO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Jun 2022 05:10:14 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7432B3A5DB
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jun 2022 02:09:13 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id o8so22457870wro.3
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jun 2022 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=rII6N8r5Ow2gkJoZ8wNqPo0lERmaqyUvrngX7zCrktQ=;
        b=woJdbpBTcdh6WM3hT6QBjt20ivMgm44sqVBc+ujVi5fDRt8bYFareKMUfbxF/Uxba9
         0n1XdeL3Jhex1T1boASVuWSZef2F01J0uDE702DUPv3bu3iD1yTdZWva/Th/QBlwNXkj
         LPXo2kmfohq1RPtf2/aCI4gYm6Erbqyhwy40fsONf96CHUcwl4BJTgjzn2k1Y4MrJBD6
         rki9fZIAHMvzZzIpjLlzEBklm6Ne2F0Fpoqp02kbZGrxj04H4OJWo0EGWz8a+VUbKAoR
         oZ1ItNE0ShcEvpprOSuG/zTBugSK8u1P9Xu7lbxcHsGfT+7DYq6j8fM5xdn0jZlUQXRR
         f7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=rII6N8r5Ow2gkJoZ8wNqPo0lERmaqyUvrngX7zCrktQ=;
        b=VARHO5um92x+JRpTDekxbeOsPMvW9kj/TeJQrDQlw+8EjCTHwFB/gNyqGA9UbQhyqD
         lU4H0Ei0ENjH8EBtXMM+EuzRFnAH4X1qiv9KgHgqiCu8tg7xo4XkYb6qAVxAHF6lwD2J
         4CgNGskGjvNU4oRMESe4nzGpu0rtoFTRyLL0NyJnh/fwx9NNEfmHCPljCBfg4Jwtsr78
         21NV0Ro5GXO1eo8jU7yxbBcmanv49rmIiUeCeJC1yDf8NvHd6k4jGg9jfS+4grNlSggD
         6MnfYt8fi68A6i/7AQ+9X2Ztp4DjR7sr7XQx1VpGcM6/6fw9ieunfFDbsokv1AB06i8n
         yobg==
X-Gm-Message-State: AJIora9YWsMQMisEl7m48Ld4VI9lCQzyVVhk4KIF4NGxxK708usieO7L
        e56xie5+jskC07WdaXWEWnt8Bw==
X-Google-Smtp-Source: AGRyM1uYYtg8PGs6avN5mBVKn6PeGeVxLL7StDaxuSCeRsgk0FheAtPjP/l44nSnGpMsMlvI2dX0bA==
X-Received: by 2002:a5d:5a0a:0:b0:21a:9c1f:d88f with SMTP id bq10-20020a5d5a0a000000b0021a9c1fd88fmr2281102wrb.707.1655888951913;
        Wed, 22 Jun 2022 02:09:11 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x24-20020a7bc218000000b003942a244ee7sm20732896wmi.44.2022.06.22.02.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 02:09:11 -0700 (PDT)
Message-ID: <4bd9d2bd-ec24-4d93-a6a7-fef625d09b26@linaro.org>
Date:   Wed, 22 Jun 2022 11:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] memory/tegra: Add missing of_node_get() in
 tegra_emc_find_node_by_ram_code
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liang He <windhl@126.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220622042824.4094625-1-windhl@126.com>
 <2f3e843e-b72b-ee71-7465-b2b6c8d51b0d@linaro.org>
 <11875304.61a4.1818a9a66bb.Coremail.windhl@126.com>
 <b3a0b35e-33fc-f7f3-a111-1a88498b4019@linaro.org>
In-Reply-To: <b3a0b35e-33fc-f7f3-a111-1a88498b4019@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22/06/2022 11:08, Krzysztof Kozlowski wrote:
>>> The patch was not even compiled... I consider it harmful approach. NAK.
>>> See: https://lwn.net/Articles/854645/
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Sorry, Krzysztof.
>>
>> As the patch is so simple two lines , I thought I can handle it without compiling it.
>>
>> Thanks very much for your notice about the article and I hope I have not done anyother harmful things.
>>
>> And I will take care of my patch code in future no matter how simple it is.
> 
> 
> Never send patches which were not built. It seems you didn't build them
> in the past either, even though setting up cross compile is trivial (few
> commands). QEMU is also an easy option.
> 
> Even though your contribution might be valuable, lack of building is a
> sign for me that approach is not serious, so I am not going to take
> risky code.

Unless of course someone's reviews your code. :)

Best regards,
Krzysztof
