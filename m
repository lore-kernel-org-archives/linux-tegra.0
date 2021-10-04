Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D070C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 16:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A7C661251
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 16:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237718AbhJDQ6e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 12:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236888AbhJDQ6d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 12:58:33 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD3DC061745;
        Mon,  4 Oct 2021 09:56:44 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y26so74796670lfa.11;
        Mon, 04 Oct 2021 09:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cReZXvdMaLPxxkxwUTgOEpzK4V0huMHeXvJZLCF/y34=;
        b=KMfb+TS0Y+2s0MvIHw2iH2i8+wp1dpTMJrVh+eVU8gOf88gDBk1QlHbBmdrTqqd+BZ
         Ok2JS5yG87BTKUF7HJM/t5ULmU3xao83Vm3T5/Q4ct8m3YtdMbLlzkrXfTDmAgU/xeR5
         wrpzXLv3efk9NTl9aHHs6eFSCCzjfKPmXn3fA2QiUKIJdiIV8G6H4N9zd3bYIBl1Rl9b
         6bo6JwmFxV/rIdC2WjazvvZ+TMHqkNf9gmuQBlSPBIgggq1wn0X7DXKBw01N1GCFhToR
         WYeXhyUQtNL++GrAn3WLH1JNO81094QVY7oxuE0s9IJv5If/7DGybE30sZCjztgvOMSX
         RjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cReZXvdMaLPxxkxwUTgOEpzK4V0huMHeXvJZLCF/y34=;
        b=rgHD2cPQ03Ahd8ZOdMKwF3oneMR/kM/SeZQGfb/G4YgquNZeQ1fHpNmg2nqmyqtZHJ
         KoFbv8RNfymGPwY/Q8p6yCy7+2SrYFAxotljwUzc/w6NmmdJyBTopk9Z9o0dUcs47s1X
         4zKQBSP8meHA/o5EAPm+jv1F7Bw++kyXam6vtwaNQryDzpJ5TTZHKxiXDvIfkZwtLK0O
         itz0OypRAD0DJf/LytgPfaFWC7Ejf0lqvmCzLiL2JohACjHbG4kp4c4ezCGZVEbBQLrn
         vbrP9+CxDydaQO+wFsZ16aVuwEQUirtu1bQc2VeEECLtWolXGnPQryOteYegkbrcDLrz
         nHKg==
X-Gm-Message-State: AOAM531NgYS4MVXDhd5FP0wxJli2jWrYu8DM535KKnwYsTOmGqWHrtWZ
        N3dEQlUWszq7LJ+l/+7NrSYjAfMK1OI=
X-Google-Smtp-Source: ABdhPJxWC2HN3ttLQ1P+heXRUCye01FLfaz3AROBpfjCTKhYBZjm3G6YsDsUwr5/CKUixmHiparpLA==
X-Received: by 2002:a05:6512:12c6:: with SMTP id p6mr15386474lfg.271.1633366602778;
        Mon, 04 Oct 2021 09:56:42 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id k2sm1621088ljo.69.2021.10.04.09.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 09:56:42 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] dt-bindings: memory: tegra20: emc: Document new
 LPDDR2 sub-node
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211003013235.2357-1-digetx@gmail.com>
 <20211003013235.2357-3-digetx@gmail.com>
 <a3713f62-0ece-5ab2-f55a-3d614ce01c00@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <184e4ce9-7beb-19ff-1562-453603eb7cce@gmail.com>
Date:   Mon, 4 Oct 2021 19:56:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a3713f62-0ece-5ab2-f55a-3d614ce01c00@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.10.2021 11:37, Krzysztof Kozlowski пишет:
> On 03/10/2021 03:32, Dmitry Osipenko wrote:
>> Some Tegra20 boards don't have RAM code stored in NVMEM, which is used for
>> the memory chip identification and the identity information should be read
>> out from LPDDR2 chip in this case. Document new sub-node containing generic
>> LPDDR2 properties that will be used for the memory chip identification if
>> RAM code isn't available. The identification is done by reading out memory
>> configuration values from generic LPDDR2 mode registers of SDRAM chip and
>> comparing them with the values of device-tree sub-node's.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../memory-controllers/nvidia,tegra20-emc.yaml  | 17 ++++++++++++++---
>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
>> index cac6842dc8f1..65f7c3898ac4 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
>> @@ -164,13 +164,14 @@ patternProperties:
>>        "#size-cells":
>>          const: 0
>>  
>> +      lpddr2-configuration:
> 
> Nodes should be named generic, so just lpddr2?

Yes

>> +        $ref: "jedec,lpddr2.yaml#"
>> +        type: object
>> +
>>      patternProperties:
>>        "^emc-table@[0-9]+$":
>>          $ref: "#/$defs/emc-table"
>>  
>> -    required:
>> -      - nvidia,ram-code
> 
> Isn't lpddr2-configuration required in such case? If not, probably you
> want either this or that (oneOf like in reserved-memory.yaml).

Thanks, oneOf will work.
