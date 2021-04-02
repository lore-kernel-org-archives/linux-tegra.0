Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E4DC433B4
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Apr 2021 14:45:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01AB6610D1
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Apr 2021 14:45:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbhDBOpl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Apr 2021 10:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbhDBOpl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Apr 2021 10:45:41 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3505C0613E6;
        Fri,  2 Apr 2021 07:45:39 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u10so5827057lju.7;
        Fri, 02 Apr 2021 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Rl/AH5bOU3o25vlCH5L0QV/2swJFfE1imy/Wnue8Qhk=;
        b=M7NkqyA1ID0tT6z8DU66Gt8ajgUmfOAqC3szK++GrkOCNnAtfisJx9wSC1tmgtOR4S
         gMw30FIL1OE/oS346jf5tcgLBLUy6YD86q6sXA9s7v89AqRwgkM1L7yHPUIU48wzymqk
         p3HDTc5ClsByc1XYmr5egrGAQo9MlvGzLedNAx/1dskM+arkqBhZn3P+RLhZa50rCFa7
         uJEpgGqd2m9MgqHVfLLHvw98szZdmD6/Dw9+H9yfnTnm71TScybBw1uxNQLnIrIX8l+D
         vq7Yp/WAEVQIB6GdYYpPKAL+RMk+y3e5l2iW5aLWXdaifkrpjBL5s+GKPlwStA5C0aIV
         kP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Rl/AH5bOU3o25vlCH5L0QV/2swJFfE1imy/Wnue8Qhk=;
        b=ACxyLs9GtDakeDheIwERvX32Tt7qbgwsftXGSECSktbyvFUqO574pJusO6WdwCc00s
         42GDwzlCQDgw83pAe+Aya8xBLk1PZ1V8s97rSd0oMmVddZr7eIemw5jnaOe/Sl421JLJ
         KSPsrEepV5Lnup1duuGOBgYXgrJOJffFMc5hnnZUfTLSSLjB7kL12LPgnsfYbJlHwMR3
         chZ+0tHwJ2NmY0HLSLSw3zHABNvqnrB8kvCsFha3hcXnTaRrJwmQ/XPGvZkoQBMtoztZ
         VHrBzqc6k8k2iUQYuBz1FqntmBNuuTfeB18yAtglxzRSICJ6CtKtS8A483NcVwhob7QS
         XOSg==
X-Gm-Message-State: AOAM531OCNfwgaanYqXtpnAnk61XHy8iwoS7byjr0DCcukX6Ho92N4k5
        YrNXFi6DHSW+ss1EG4lCERiTw8mzN7s=
X-Google-Smtp-Source: ABdhPJy3qAkxvudbG0sXL/fImwxjqWcSzYdHSMMPTL/enfImSjgISBNXc/vNovsEgTv5hAmsQPS5uA==
X-Received: by 2002:a2e:5315:: with SMTP id h21mr8254981ljb.299.1617374738142;
        Fri, 02 Apr 2021 07:45:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-85.dynamic.spd-mgts.ru. [109.252.193.85])
        by smtp.googlemail.com with ESMTPSA id j22sm883511lfr.37.2021.04.02.07.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 07:45:37 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] dt-bindings: memory: tegra20: emc: Convert to
 schema
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210330230445.26619-1-digetx@gmail.com>
 <20210330230445.26619-6-digetx@gmail.com>
 <1617198059.590387.2074856.nullmailer@robh.at.kernel.org>
 <b4f7c7fb-1332-8490-fb4f-293fd357338e@gmail.com>
 <20210401155506.GA498681@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a584f3b9-ba15-a027-2496-bf757cf7ca06@gmail.com>
Date:   Fri, 2 Apr 2021 17:45:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210401155506.GA498681@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.04.2021 18:55, Rob Herring пишет:
> On Wed, Mar 31, 2021 at 05:59:39PM +0300, Dmitry Osipenko wrote:
>> 31.03.2021 16:40, Rob Herring пишет:
>>> On Wed, 31 Mar 2021 02:04:44 +0300, Dmitry Osipenko wrote:
>>>> Convert Tegra20 External Memory Controller binding to schema.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  .../memory-controllers/nvidia,tegra20-emc.txt | 130 --------
>>>>  .../nvidia,tegra20-emc.yaml                   | 294 ++++++++++++++++++
>>>>  2 files changed, 294 insertions(+), 130 deletions(-)
>>>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
>>>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
>>>>
>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.example.dts:33.26-55.15: Warning (unit_address_vs_reg): /example-0/external-memory-controller@7000f400/emc-tables@0: node has a unit name, but no reg or ranges property
>>>
>>> See https://patchwork.ozlabs.org/patch/1460288
>>>
>>> This check can fail if there are any dependencies. The base for a patch
>>> series is generally the most recent rc1.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>>
>>> pip3 install dtschema --upgrade
>>>
>>> Please check and re-submit.
>>>
>>
>> FYI, I'm aware about this warning and I think it's fine to skip it in
>> the case of this binding. 
> 
> It's not because dt_binding_check should be warning free.
> 
>> The dtbs_check doesn't bother with that warning.
> 
> With W=1 it will. It's off by default because there are too many of 
> these warnings. Patches welcome.

Such warning could be silenced with some kind of a new pragma option in
schema which will tell what warnings are inappropriate.

But since there is no such option today, perhaps indeed should be better
to just add a dummy reg property and fix the device-trees.
