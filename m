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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA3EC433B4
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Apr 2021 13:18:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8517A61210
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Apr 2021 13:18:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhDDNSz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Apr 2021 09:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhDDNSy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Apr 2021 09:18:54 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62EEC061756;
        Sun,  4 Apr 2021 06:18:49 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id w28so13852628lfn.2;
        Sun, 04 Apr 2021 06:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E7aNZvCUDgiEjUhfnA4glDPpLYVUgb36VhtZ187jO8I=;
        b=FBIhlLRuKT2iOCtYms9q3RJ9cRnINvZIlcX78ZKu1og0SfU+hYGrx2RLUB5CNVaSgU
         RdZ/vYPssH6vSbf+DqcoUHzGqbHA3Eu1sxj6gp9IyyjRo3IAaOOjZ510oSc5jugvio6N
         +sZkftL81xYjnacVRynT/MRyYka8TqS44k8E7p3lh/hi8g8LU7pKOmcQco2FMayU1Qw3
         itIFo0zWyMLYW1vAs9lP8EDRlFs75/bqhhd/N58P47nS6BeqdGTxnrO8iRPakL72z+hy
         3YrR2aBaQK5lBdv6PCA6tL/G0xeqxWEp+TwflD9iDNRrLhWQSay/v/O51dexk1hrBLy8
         QZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E7aNZvCUDgiEjUhfnA4glDPpLYVUgb36VhtZ187jO8I=;
        b=fXoDA99jFAMVPQDb5nOpKhnK8rX1+CjgFMkyEUjS3dt7Jt0LQNAFLVfWdLduNOtsTy
         GUkTx9oU/5usnSsVx96op4AOD/q2nJbBCr75760w7d2ho4eBhdQwPhSQF9/MgKXCJKf0
         /lg5LfT9spAffX2IjE9bEcw7ClPVkTVln9JoXKLK0sINIHAitzvf2SSRCAuSFIq+jrN6
         yP8ja+tYXNMAgmM3Z/nbXq0TmjpCYBzjw6wDcB/cF75TW4tvUTknvTYjlGeBRfcQCQ8Y
         YTBHDAHRuBxGnSEzLALfrgithfLK/VBpegvfwJTI5jMOsNGAa5DepvtZEIxV8/5mdoNY
         k6Bw==
X-Gm-Message-State: AOAM530t/9YOaUHqvSzUCSWuC21SgF1buFvcZZX0R1/TZeTDWKu89TX8
        P+LmQGDrIQ/00CSWoSFiMFbecVfOw1M=
X-Google-Smtp-Source: ABdhPJxm2VHeLRHi4vimnBIFgT5n3NMnfwmEkQ+Zgo7nj1yXGdOBWJFLPpBrbbd60hnzFXffArcwWQ==
X-Received: by 2002:ac2:5a1b:: with SMTP id q27mr13917243lfn.189.1617542328210;
        Sun, 04 Apr 2021 06:18:48 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-85.dynamic.spd-mgts.ru. [109.252.193.85])
        by smtp.googlemail.com with ESMTPSA id t11sm1505856ljk.65.2021.04.04.06.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Apr 2021 06:18:47 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] dt-bindings: memory: tegra20: emc: Convert to
 schema
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <a584f3b9-ba15-a027-2496-bf757cf7ca06@gmail.com>
Message-ID: <c5e6028e-1732-5e0e-a11d-d8e4c645cf83@gmail.com>
Date:   Sun, 4 Apr 2021 16:18:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a584f3b9-ba15-a027-2496-bf757cf7ca06@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.04.2021 17:45, Dmitry Osipenko пишет:
> 01.04.2021 18:55, Rob Herring пишет:
>> On Wed, Mar 31, 2021 at 05:59:39PM +0300, Dmitry Osipenko wrote:
>>> 31.03.2021 16:40, Rob Herring пишет:
>>>> On Wed, 31 Mar 2021 02:04:44 +0300, Dmitry Osipenko wrote:
>>>>> Convert Tegra20 External Memory Controller binding to schema.
>>>>>
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>>  .../memory-controllers/nvidia,tegra20-emc.txt | 130 --------
>>>>>  .../nvidia,tegra20-emc.yaml                   | 294 ++++++++++++++++++
>>>>>  2 files changed, 294 insertions(+), 130 deletions(-)
>>>>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
>>>>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
>>>>>
>>>>
>>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>>
>>>> yamllint warnings/errors:
>>>>
>>>> dtschema/dtc warnings/errors:
>>>> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.example.dts:33.26-55.15: Warning (unit_address_vs_reg): /example-0/external-memory-controller@7000f400/emc-tables@0: node has a unit name, but no reg or ranges property
>>>>
>>>> See https://patchwork.ozlabs.org/patch/1460288
>>>>
>>>> This check can fail if there are any dependencies. The base for a patch
>>>> series is generally the most recent rc1.
>>>>
>>>> If you already ran 'make dt_binding_check' and didn't see the above
>>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>>> date:
>>>>
>>>> pip3 install dtschema --upgrade
>>>>
>>>> Please check and re-submit.
>>>>
>>>
>>> FYI, I'm aware about this warning and I think it's fine to skip it in
>>> the case of this binding. 
>>
>> It's not because dt_binding_check should be warning free.
>>
>>> The dtbs_check doesn't bother with that warning.
>>
>> With W=1 it will. It's off by default because there are too many of 
>> these warnings. Patches welcome.
> 
> Such warning could be silenced with some kind of a new pragma option in
> schema which will tell what warnings are inappropriate.
> 
> But since there is no such option today, perhaps indeed should be better
> to just add a dummy reg property and fix the device-trees.
> 

This actually was my bad, the reg property is already specified in this
version of binding as required. Apparently I got confused while was
looking at some device-tree that doesn't have the reg property and it
should be corrected.
