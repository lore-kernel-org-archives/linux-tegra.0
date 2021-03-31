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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE45EC433ED
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 15:00:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DD7760BBB
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 15:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbhCaPAA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 11:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235987AbhCaO7p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 10:59:45 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FE0C061574;
        Wed, 31 Mar 2021 07:59:42 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id n138so29620012lfa.3;
        Wed, 31 Mar 2021 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PsO89NOx80DUPq/uoqBfqzP3oyAMU/I135Iw3m4lDgM=;
        b=l0hxprmLlYVfUUB4XOawxL21b7Mnqt1Tj5hOz4aCWZLoGkiocEAY3EIbRMDvZB9T0S
         LTtsIBrykLpWKN3iH4v609s/WtQ5u8VwXQuMInZbGKj5yv0aMplLf5K4faExnwIZFsAj
         YB0z5KfNXg8JhfB2EeAS1E3rTM0R5/LjbBAJs1wswgbgRduHlHVa1h7GU3drNZbWpGHC
         65krI08iZU4q6rtsxYNDSeYVaok/9r7N34HAdda6kv1uMDImA91t5lkbLeLr+PSxH4Wr
         JzYr2kpPpBwvYSZZAGTLF7kqsDy3BVtjfDWpLKacEufrqZnky01B00N7KFc58xxcxe/a
         IgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PsO89NOx80DUPq/uoqBfqzP3oyAMU/I135Iw3m4lDgM=;
        b=s7oNq8ec18htY2PL7noR4eitDqW953lm1c7KlMvzP6oKGHmfw+ReIh1Xt0gmVHCV3q
         /Cs1ALNoC13eIgL2RSQhF9oZDOAjcpyoDRcG+VKxy7dumaLnZiV/yq5ZZeue/+d/fWo7
         vpBnnQj8env1vhJhY+ZTJFKx2fRzNdd6f9jZCZgL1ltfMzXpT0HEEcU/Byjw0sjAbhnM
         FF7rXxIVQoY+gy1fAUMwMlEHkvVVIZvU5a2JGdOLyWwjKLQ/aZaGwkNYt7DWD9x6EIsK
         pdtZUJ9dq0ghTLYnIyAdqGO3aejg/FhU9+Hsys8mx49c3NSj5ZIEi38B+S/LJgbjdcl5
         tbGw==
X-Gm-Message-State: AOAM531mLSlGwcaShmMRCpyHsnGz7bEIz4cgE+plYViMMx1Fape9GOfE
        S1vksTQbvk7xCV5HXU9dQsXvIaswud25lg==
X-Google-Smtp-Source: ABdhPJx8es0d3p6vHRKIE2PW9CFQRyDk59ibGGL5NkPTZv7S9RNLZEkG8zAX1hwSptm5jyU2pU63Aw==
X-Received: by 2002:ac2:58cf:: with SMTP id u15mr2423994lfo.397.1617202781069;
        Wed, 31 Mar 2021 07:59:41 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:c71f:a10:76ff:fe69:21b6? ([2a00:1370:814d:c71f:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id f20sm262375ljn.123.2021.03.31.07.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 07:59:40 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] dt-bindings: memory: tegra20: emc: Convert to
 schema
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210330230445.26619-1-digetx@gmail.com>
 <20210330230445.26619-6-digetx@gmail.com>
 <1617198059.590387.2074856.nullmailer@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b4f7c7fb-1332-8490-fb4f-293fd357338e@gmail.com>
Date:   Wed, 31 Mar 2021 17:59:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617198059.590387.2074856.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

31.03.2021 16:40, Rob Herring пишет:
> On Wed, 31 Mar 2021 02:04:44 +0300, Dmitry Osipenko wrote:
>> Convert Tegra20 External Memory Controller binding to schema.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../memory-controllers/nvidia,tegra20-emc.txt | 130 --------
>>  .../nvidia,tegra20-emc.yaml                   | 294 ++++++++++++++++++
>>  2 files changed, 294 insertions(+), 130 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.example.dts:33.26-55.15: Warning (unit_address_vs_reg): /example-0/external-memory-controller@7000f400/emc-tables@0: node has a unit name, but no reg or ranges property
> 
> See https://patchwork.ozlabs.org/patch/1460288
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

FYI, I'm aware about this warning and I think it's fine to skip it in
the case of this binding. The dtbs_check doesn't bother with that warning.
