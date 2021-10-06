Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E804C433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 15:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EF9B60F9D
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 15:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhJFPs6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 11:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbhJFPs6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 11:48:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49E9C061746;
        Wed,  6 Oct 2021 08:47:05 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y23so12572837lfb.0;
        Wed, 06 Oct 2021 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GfVVERpziq4truOunJikxrUf6BXuZD7+3TCMiv3eHCw=;
        b=hKwuv0BI3AUNCW2oo7hJUMPCzxZ0HarLZGF6aKZX5ckpHDhJcqe7QKdKy7m2o/opVC
         66tEV2jRCeFHIt/Gv6ZJqzlo+nhBqojbNpPtT81ngcDKdSw+fFaauzhCumJu7a9Nj0YV
         YLKi2Cmnm9Kgw/JMaQhpyud9oH+UGo02Y004QMAiGFVG/fXiAnHg4Poq14tmRBdWHoVk
         Jd4DDlFgykxqr/55sZrYCI5x1wPVyXwWnnSQeRI4hPCXKPAU28abn8LA+y61tuQb5cmN
         3Suia1TAUS4Lb4yYjLfHy/UsvzWdgYFKr6DMQwNQ5JH4SDZfPvtKHk+CAz5iYxAY1eu2
         D/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GfVVERpziq4truOunJikxrUf6BXuZD7+3TCMiv3eHCw=;
        b=Gz2po3YSgNZpaS0k9X5le76k8LJEiYDrM2I79BYYKv2ZCNYDFglyE5SqAt4auFIbGJ
         qT+NNU4yHrvpSK3tFLafQsjCU607A039KPduaBoISaRMieJvVf5gs1UD3LcBgE0lgtqG
         S7PsiVf+S32oHKbXHQktFX5xO6bLkmatR3O4z5t6b3QKrdWiyFqwkxofnRW0uWTgV6Ob
         4cDJfnVSn/QBymryv3oV8E7Bw1WQJK5n4invcAeIcvThfguqM2+FqK4VrySl/7E1C/95
         wpxdlW2u7nl5pXHMwzgc8GbQdUI6ByolebTL0WNdEaMs8unrVqolHhUnWHNxe0bjcehD
         3CQw==
X-Gm-Message-State: AOAM532/Tma0TUt3ejxsOpenl45KWVgXaKFcIFh/xMmzOrtXwYpd2iu/
        6nUg8uR7ATYH+wHDQRbaWv0QCrYC3Ec=
X-Google-Smtp-Source: ABdhPJxcxUvNK9BCNsepaPErBne/gtT50oxUO7KhKgcMzfQupjYKdHdT1m9ES2kcbWsy2IefeHEwyw==
X-Received: by 2002:a05:651c:179a:: with SMTP id bn26mr29489526ljb.528.1633535224146;
        Wed, 06 Oct 2021 08:47:04 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id h10sm88397ljb.60.2021.10.06.08.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 08:47:03 -0700 (PDT)
Subject: Re: [PATCH v4 3/7] dt-bindings: memory: lpddr2: Add revision-id
 properties
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211005230009.3635-1-digetx@gmail.com>
 <20211005230009.3635-4-digetx@gmail.com>
 <545e4036-a9fe-a0f1-dd8c-f5948fee6c4e@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b24831e5-653c-e3e6-fd96-9746e8e96d8d@gmail.com>
Date:   Wed, 6 Oct 2021 18:47:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <545e4036-a9fe-a0f1-dd8c-f5948fee6c4e@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

06.10.2021 13:59, Krzysztof Kozlowski пишет:
> On 06/10/2021 01:00, Dmitry Osipenko wrote:
>> Add optional revision-id standard LPDDR2 properties which will help to
>> identify memory chip.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../memory-controllers/ddr/jedec,lpddr2.yaml         | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
>> index d99ccad54938..01efb43c3425 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
>> @@ -24,6 +24,16 @@ properties:
>>            - enum:
>>                - jedec,lpddr2-nvm
>>  
>> +  revision-id1:
>> +    maximum: 255
>> +    description: |
>> +      Revision 1 value of SDRAM chip. Obtained from device datasheet.
>> +
> 
> Also type/ref for uint32 needed.

Also unnecessary :) It's uint32 by default, inferred from the 'maximum'.
