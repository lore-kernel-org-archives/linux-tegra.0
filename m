Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8B6C43219
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 17:32:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 276B26117A
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 17:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238847AbhJFRd5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 13:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238900AbhJFRdz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 13:33:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71FEEC061746;
        Wed,  6 Oct 2021 10:32:02 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id r19so12598113lfe.10;
        Wed, 06 Oct 2021 10:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1oYMIeAPIuGPofDkQXVon34gDJqb7YVjS8YeAEPeedc=;
        b=RHrFrt2ov7ysLJagtN6KsIU/IxT+03d3CFT7x7i2erjE98/iM3qJegkGComskgarm6
         8LqfjiB2TTm5ObGN3m19q5HEM7u7P7o9QvsmZmTtJoEkCCsRmxaZwmfi2+ONEXk5t+ev
         D1L1SDIeiqCRLe+gGsW+qqkdULkxOlrptQ6H0u9f5t9Uaj3EU4DV0Z58sNh6Jp92yeD/
         QcoXxtOmJ+u/XH+f5vX6NHzCB6OiHfDJSTh0AM79WN3EdrpxfQoH60QZ7O/kC7HdAICV
         PoKdE/CZytq45f+kK6GkRFbJYf2oDom/haohhCDbPPQvNh3l33UAGYRn7cczOh18dFNF
         sIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1oYMIeAPIuGPofDkQXVon34gDJqb7YVjS8YeAEPeedc=;
        b=CN+gcDatAQKsvSf3CU3SNp4LbLAz+uBAdFlNn5daKt9QaRJylvSBOXr+jEHhJtnEH2
         Zb0f4VzZx/3s3IksBdzNnvTJquQ3PvzoEoClIJOmzrqSoxrd7LhJpeANKqFcVB9E6OjW
         JSMexrrsfOQ3syW+CzCJhdH+VreM8GXpp3SxDYL6yLA0Dn18oKmpn2+gW4YOmUuk5+hE
         iQfchuor8dRzCQV5knhwfGu5BxD4UuQaVFSpy4Ehu5co4bco5pO0JJLwCR3Dsdxgc0Yg
         u9y1oUmzoRJN3oYddxCl9DYe8FwltdqGC9wXQxK9PFd0O6zBPOLRhcsi+7ZATibx5/49
         F/ZA==
X-Gm-Message-State: AOAM5309IIFXglaOecboB79evK5/0kzwnCLigX7zR41EQVue4QYRlszP
        93y/ZUzeZGiQsOOEQHBsaM5/gFUipP8=
X-Google-Smtp-Source: ABdhPJzyhcPqmWia5WRnezZ0cVTpyQAoVrnQAXLDeaetA+wa6lbqBjJ6PkEjFXoGUQq9Fp3hpgZ6qw==
X-Received: by 2002:a2e:761a:: with SMTP id r26mr2120295ljc.166.1633541520689;
        Wed, 06 Oct 2021 10:32:00 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id j6sm183067lfm.9.2021.10.06.10.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 10:32:00 -0700 (PDT)
Subject: Re: [PATCH v4 2/7] dt-bindings: memory: lpddr2: Convert to schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211005230009.3635-1-digetx@gmail.com>
 <20211005230009.3635-3-digetx@gmail.com>
 <6b8f6ef7-cfc5-3a8b-d44d-f4080a85ecf3@canonical.com>
 <7047ad7b-52d6-0c91-b7d2-b115ea69506f@gmail.com>
 <481f4d90-638f-b64f-83a2-b882d9bf194a@gmail.com>
 <5b24cc4c-3091-a044-612e-43024bc512a5@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0edef6e7-ea59-9919-d03a-0a5cd2a83a21@gmail.com>
Date:   Wed, 6 Oct 2021 20:31:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5b24cc4c-3091-a044-612e-43024bc512a5@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

06.10.2021 20:23, Krzysztof Kozlowski пишет:
> On 06/10/2021 17:44, Dmitry Osipenko wrote:
>> 06.10.2021 18:41, Dmitry Osipenko пишет:
>>> 06.10.2021 13:57, Krzysztof Kozlowski пишет:
>>>>> +  density:
>>>>> +    description: |
>>>>> +      Density in megabits of SDRAM chip. Obtained from device datasheet.
>>>> You need here a type/ref, so uint32.
>>>>
>>>
>>> The type is uint32 by default. I can add it, but it's not really necessary.
>>>
>>
>> You may grep bindings for 'enum: [' to see that nobody is specifying the
>> type.
>>
> 
> Just because everyone makes a mistake, is not a proof it should be done
> like that. Please see example schema and vendor,int-property.
> 
> AFAIR, only properties defined by schema (directly or by unit suffix,
> e.g. microvolt) do not need types.

I'm not DT expert, but dt_binding_check says that binding is valid, even
with W=1. Meanwhile negative values are wrong. All integers are u32 by
default for DTB.

Alright, I'll just add the type since it won't hurt anyways.
