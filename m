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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BECFC433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:26:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4904619D9
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 15:26:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbhC3P0W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 11:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbhC3PZ4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 11:25:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA16CC061574;
        Tue, 30 Mar 2021 08:25:55 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o10so24355686lfb.9;
        Tue, 30 Mar 2021 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L4t1gbf3yrUzChbUbDMY4euz8nlSLeeCu75nwbW2ips=;
        b=tfZ6EUxRi07u5A8R3oT9CX8h/p2L39UX4es7Zvw5PiYTf3BJueQoSSOju1hHM3GD3Z
         msm9Id5LdRCvSNEsQy2wk+3qTyuswDOJRBeeJsW6YdxdW7S+UP1hMQkF2RHI76i6ZCcd
         /yJkCvtORfkqWcuVqhsL3iFUF0CdlUhLxKfgN0RZf/S+W9wGZDumtnhvlnmjvdMq92HF
         PEvjZl8RjRPWNZsaXsJsudq8XiwHEFASgDqnPD77uO/o8vs+XZuKU4KJrCr1m4ZegfBt
         HZnnzH28Glrvved+dx8HR0OJ7j95gVOgTAAuD1vn8At8GsX1ernXW1P8x563otvzshly
         iw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L4t1gbf3yrUzChbUbDMY4euz8nlSLeeCu75nwbW2ips=;
        b=YI66vuDXxi6bPjus/fuE1eqdFCp7tECGqVq0aPAumkKK0zy99YeL6Q7l+l4157c3zh
         pEnzTNQAd0+/p7vR6SoJTgDUtMuaySrkoFMwhJ0yd0gSG83gWs8zcHKb3yYiOU27KzAG
         RiFCsMSMov6DRP8Nh5m2q5hncPretZGYbTr5F3kX8dBRw49AsLUJ203cPWQAJLOqaP2U
         kiYKJi1whPtPIEb9BAZsCyyPf9Co7Lrdq9cJVP5F+hA9SC9pmM2AVYszgA8CeFoJJnfN
         ehfR0HNZvOCz0SZuR/CUkDAZn21vNvc4/lbomsiZdO6ECiBCcPuprl0xYHRCkbb7qY1y
         jfDw==
X-Gm-Message-State: AOAM531msAArqggZZUShESgcUVgL0/viHASFNwhzNkHpbbbOc4CwLw3S
        oN5kR30aBtlMWhfkaTZokcw=
X-Google-Smtp-Source: ABdhPJy4JGI3S1gXjgeGliqbIw052gNBnIlb1D/ryZgbSsk665Us6I0JVEZ6HazVHoSz8GuUhtz77Q==
X-Received: by 2002:a05:6512:38aa:: with SMTP id o10mr53987lft.261.1617117954194;
        Tue, 30 Mar 2021 08:25:54 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id q26sm2204815lfm.53.2021.03.30.08.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 08:25:53 -0700 (PDT)
Subject: Re: [PATCH v1 4/6] dt-bindings: memory: tegra20: mc: Convert to
 schema
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>
References: <20210329194602.17049-1-digetx@gmail.com>
 <20210329194602.17049-5-digetx@gmail.com>
 <1617109723.704724.173732.nullmailer@robh.at.kernel.org>
 <20210330134634.GA216433@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a2575953-e10e-9f41-5a65-ab6512bba20d@gmail.com>
Date:   Tue, 30 Mar 2021 18:25:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330134634.GA216433@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.03.2021 16:46, Rob Herring пишет:
> On Tue, Mar 30, 2021 at 08:08:43AM -0500, Rob Herring wrote:
>> On Mon, 29 Mar 2021 22:46:00 +0300, Dmitry Osipenko wrote:
>>> Convert Tegra20 Memory Controller binding to schema.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  .../memory-controllers/nvidia,tegra20-mc.txt  | 40 ----------
>>>  .../memory-controllers/nvidia,tegra20-mc.yaml | 78 +++++++++++++++++++
>>>  2 files changed, 78 insertions(+), 40 deletions(-)
>>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
>>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.example.dt.yaml:0:0: /example-0/memory-controller@7000f000: failed to match any schema with compatible: ['nvidia,tegra20-mc']
> 
> Yes, this is a new warning. It's off by default for dt_binding_check 
> until we fix the existing warnings, but you can enable by adding 
> 'DT_CHECKER_FLAGS=-m'. Support for this is in the dt/next branch.

Thanks!
