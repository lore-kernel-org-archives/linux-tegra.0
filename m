Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7F7C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 16:11:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E4FB61166
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 16:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239342AbhJFQNC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 12:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhJFQNC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 12:13:02 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DDDC061746;
        Wed,  6 Oct 2021 09:11:09 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b20so12903278lfv.3;
        Wed, 06 Oct 2021 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8cGBldMfEJ95FNn3AxoEmcovSSwBsWicQa8v8Iv276M=;
        b=GfjocarBxwSZ3iJFzeq0N/l84rLEVu3Da3tiuTniXrcGY6/DQnxtc1ZrlaUJoqdgyt
         w4Gihg2LuuZno+cDrafgpzY+T1ogiPTXx7eKvdxD60gR8MFkPALjT1aMsMvZYLb+t5se
         cpc75bMeqjuT4ygFJm/BJ/2ekLqTDnJ8lOHVf4MzhU3wdRmt/do22Ml9x6Jd2G07Dr6p
         lm+zWRMsHDAiKuAFj9CLZVvdr+3NOEvFWgSBblTznM73Cds0CMRJmuylgVXf0Db/2aLl
         AxZKBu/2oIDv2XL5W8kJHbpe3ebIFHV7wgxkJ3p667MbThj9Ihxh4EurmOSU3X4xfvtq
         9cUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8cGBldMfEJ95FNn3AxoEmcovSSwBsWicQa8v8Iv276M=;
        b=TTsD8RA0a/2EtYU/cDH3BDZQcOznRJVUN9IXfUM8+TJLVbNhQCE/kflkxdxSpRsxLH
         Kr1R67OTkYIu/PrLL6+R1DxJm6bmssTLL8nbgiXKnNV0J0EOSExfqhG9eQGAA3Em3tGU
         Ir3SrFdDoJFKvMj2UUfkYSEG8OGJvwue9u4FPwZixghP5xMmkM0tdV8XCj0qCxrh6cyE
         2UBdC+rXQNCxkLxbRfolSUiVzjuUjRPAFXz8MWwB13w0w3O5WjLwODd+4eAabvRimFR8
         dkKa88lDc4/y/r60Lp0wr8x9ZdFsUuRm7na1TK6Fok4YX4nOVhlB0HalOfMfi5LyarK2
         wcZg==
X-Gm-Message-State: AOAM530hllwN9Y3uTJIYVg6a0JOfDVYBCN4EI1I2lgBJ40iCXEkktVx5
        b8r0e4YEvifNSSzNsMEHPXrw5pCMgw0=
X-Google-Smtp-Source: ABdhPJyB7rgAE715VRacHFOyD2Z+3eLyumI5OR0U+J4S4MkKbph5eG0X+XvRRGu2zPAqVW2/Nc9Uew==
X-Received: by 2002:a2e:5705:: with SMTP id l5mr31104368ljb.456.1633536667884;
        Wed, 06 Oct 2021 09:11:07 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id l24sm2334922lji.25.2021.10.06.09.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 09:11:07 -0700 (PDT)
Subject: Re: [PATCH v4 3/7] dt-bindings: memory: lpddr2: Add revision-id
 properties
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211005230009.3635-1-digetx@gmail.com>
 <20211005230009.3635-4-digetx@gmail.com>
 <545e4036-a9fe-a0f1-dd8c-f5948fee6c4e@canonical.com>
 <b24831e5-653c-e3e6-fd96-9746e8e96d8d@gmail.com>
Message-ID: <16f2e720-03d3-1643-5577-4039091a1ffc@gmail.com>
Date:   Wed, 6 Oct 2021 19:11:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b24831e5-653c-e3e6-fd96-9746e8e96d8d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

06.10.2021 18:47, Dmitry Osipenko пишет:
> 06.10.2021 13:59, Krzysztof Kozlowski пишет:
>> On 06/10/2021 01:00, Dmitry Osipenko wrote:
>>> Add optional revision-id standard LPDDR2 properties which will help to
>>> identify memory chip.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  .../memory-controllers/ddr/jedec,lpddr2.yaml         | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
>>> index d99ccad54938..01efb43c3425 100644
>>> --- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
>>> @@ -24,6 +24,16 @@ properties:
>>>            - enum:
>>>                - jedec,lpddr2-nvm
>>>  
>>> +  revision-id1:
>>> +    maximum: 255
>>> +    description: |
>>> +      Revision 1 value of SDRAM chip. Obtained from device datasheet.
>>> +
>>
>> Also type/ref for uint32 needed.
> 
> Also unnecessary :) It's uint32 by default, inferred from the 'maximum'.
> 

Please grep for 'maximum: ' to see that other bindings don't specify the
type.
