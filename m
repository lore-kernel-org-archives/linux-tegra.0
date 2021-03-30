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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBABC433E2
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 22:32:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AFAF619CF
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 22:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbhC3WcI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 18:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbhC3Wbi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 18:31:38 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328FDC061574;
        Tue, 30 Mar 2021 15:31:38 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id d13so5161361lfg.7;
        Tue, 30 Mar 2021 15:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lX+lvEu/JKDkLvN9O2XlcfR9FLBi3Lmix7YcGSXxVtM=;
        b=qu1Mz9AQmA6OYz2T6dCBtTxuFNFiDKHWgZGcIcfLObvG4Mt0xrH71wPqexk6H95XcS
         M9xqIvFy+00owhzJicfonJE5FLJIO15//CA3JM5HzQhg+1hImNGM1IYCT+7s+gAlIj/t
         EBrOfSdGd9GM3fIAAA+gohKwaZ/9ncB7JydgWBu8z3kHLBdNEuGiUC+WU8v5pIPAqapf
         gr7rYSN7Sondo60WgOnuJByMlbWt9ceP6C36hvT3LGP0vsvtRucZNaTN7DQDEzpfMV5r
         GnzQWANMOm+sX05tra+7lDzwA5x4b/eHo9QCg+RgLfitmn85+/6ri88DQxVfMnqKqTr2
         dgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lX+lvEu/JKDkLvN9O2XlcfR9FLBi3Lmix7YcGSXxVtM=;
        b=LlI6v5YO4cCNZhxrU0l4+GG0EoTheWnfo+LrMXQGJDjFo2GjuEVkmCwKiLQXe6QZLa
         QghsJjaUn7Nj6V2Y4Tcmpc4TOqJtflFVdi0GTzYpqnWZOJU+LK5xPQ3oj9vL9q3mxYfN
         yjpNaqzYFMxmYb05p6EZM4f15Vbqu/cUEtWypVKmOhSv+a+M8CMSE4en5UAb0B4waKKg
         jLCWQREwc3K0yvmmg8Tz0iCyNbg93gVH+S3caINkL/ymlWKf6OnVnnawkVUBJ1tDffbF
         dfWKufsBvoHu6Bjimw1aBWK8QDXyeUFwikTW56nPnimmgjVJtkPSlqgZyFYqd34GIQYB
         j7DA==
X-Gm-Message-State: AOAM530Bke56nteq2yM1a1Ama5c6xoqv9h9wiKX0dzv5xrkX+poik0YC
        SC9xrTEujY7/+Jy9SHuMmup8HagIzso=
X-Google-Smtp-Source: ABdhPJzsjhGowXflnkkFgr1toA0J8He8ANpYKMPUf/jv9Xe7SFVrbl4RfbuCUQle9SNNudmgSehSaQ==
X-Received: by 2002:a19:ec13:: with SMTP id b19mr241157lfa.238.1617143496622;
        Tue, 30 Mar 2021 15:31:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.googlemail.com with ESMTPSA id k6sm24541lfm.19.2021.03.30.15.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 15:31:36 -0700 (PDT)
Subject: Re: [PATCH v1 2/6] dt-bindings: memory: tegra30: emc: Replace core
 regulator with power domain
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210329194602.17049-1-digetx@gmail.com>
 <20210329194602.17049-3-digetx@gmail.com>
 <20210330222304.GA819312@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c9f2b84c-8c48-2946-c252-24d5f66c91cc@gmail.com>
Date:   Wed, 31 Mar 2021 01:31:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330222304.GA819312@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

31.03.2021 01:23, Rob Herring пишет:
> On Mon, Mar 29, 2021 at 10:45:58PM +0300, Dmitry Osipenko wrote:
>> Power domain fits much better than a voltage regulator in regards to
>> a proper hardware description and from a software perspective as well.
>> Hence replace the core regulator with the power domain. Note that this
>> doesn't affect any existing DTBs because we haven't started to use the
>> regulator yet, and thus, it's okay to change it.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml    | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>> index 0a2e2c0d0fdd..4a2edb9b8bdc 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>> @@ -39,9 +39,10 @@ properties:
>>      description:
>>        Phandle of the Memory Controller node.
>>  
>> -  core-supply:
>> +  power-domains:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> 'power-domains' already has a type. We need to know how many (maxItems).


Alright, I see now what makes the difference. Thank you and Krzysztof
for the suggestion.


