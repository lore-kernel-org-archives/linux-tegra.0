Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89BCC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 17 May 2022 08:43:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243606AbiEQIn1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 May 2022 04:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243612AbiEQInW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 May 2022 04:43:22 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622AE43EE1
        for <linux-tegra@vger.kernel.org>; Tue, 17 May 2022 01:43:20 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id m20so33214227ejj.10
        for <linux-tegra@vger.kernel.org>; Tue, 17 May 2022 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2H+kyojoKMIqacwlCH+yjlqbOTerfAkahQ6Tr2/rTHg=;
        b=RuxlII7DDT22gV3GAwwJTVmCMCV4pDM4pbh+o3BD/8obibk5uM02ZTj7eCUeBuVoXH
         SN/TOA4EpDEQgZUVUSqNFUl8r/odk0k6Zw2w6nGkGPVivm4uqhHAzIb1S0exTpPv/CVl
         UHNifheqVZ1n43+Hxneac6yJGSZh/KVMplobKOtY9icqW1fuAFoVZhSdTigz5mwd3+I9
         LFiOVvcXzA+zcGoFSQ03X+W7J0+jB3YqoA2oQUxAblos7JNxydqJNQttB2HhBmSelDIB
         s5qWALHMM6w14rAV2KzlragLqUThmueQe93Fa9sZ28DAJ+9KrhZEvToL+TyR6qecoRGK
         EVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2H+kyojoKMIqacwlCH+yjlqbOTerfAkahQ6Tr2/rTHg=;
        b=Ca/hJBIGrNqgDr1vbAidjSJ5Jf8ukVHuXAcI27GUsIoyjQLgxJDG4TNgDPWltOKVu7
         /3vufXVO8FvaVRFFJPlij6BIX0RN/4RZe6tSmPkkoWoxMGzRtbjx664gIaLPM9r7ti7w
         pIS8j7A1dshzp0nqaNFUzIjS0RVTS1xum3Y8SFAhQiRlLAIYBRQcoTgadOtd/JiBwHqP
         pvbGYGHtMEkyDifMkEXWM7JxCcRbBb8/ln/aLHu8dJKMwx8skMphyQp1rpmMy6aLrqmt
         ibA43D30INz+65l7y7k4LbOD4e/MSs8NjEOcvO1myVVi8nWqt0tksXtV3ByAOZpQmnC/
         KoWQ==
X-Gm-Message-State: AOAM532jSkNMWNH8WQKd1jCJ3H0mLufGwC/2JWQW9YyoNw2hCEyV0mzj
        JyP+IAK7H/vlEtUfKHaVgwM5+A==
X-Google-Smtp-Source: ABdhPJxtQjXQRb10lFqBAUzMfJDMOxeVz25FrJyNKeUEWXkNqJZB5jvCADp0PGfSltuUqftQ/W2Wkg==
X-Received: by 2002:a17:907:c28:b0:6f4:2a80:f355 with SMTP id ga40-20020a1709070c2800b006f42a80f355mr18406294ejc.101.1652776998992;
        Tue, 17 May 2022 01:43:18 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c14-20020a50d64e000000b0042617ba6380sm6658474edj.10.2022.05.17.01.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 01:43:18 -0700 (PDT)
Message-ID: <e77d83ee-c045-26a6-15bc-df49a3b880ae@linaro.org>
Date:   Tue, 17 May 2022 10:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 02/13] dt-bindings: Add headers for Host1x and VIC on
 Tegra234
Content-Language: en-US
To:     Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <20220516100213.1536571-3-cyndis@kapsi.fi>
 <20a7087d-dddd-134b-4cef-0ebcbc5115f3@linaro.org>
 <3b1e22cf-a439-2d84-a1fc-dd352a3f1b2c@kapsi.fi>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3b1e22cf-a439-2d84-a1fc-dd352a3f1b2c@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17/05/2022 10:41, Mikko Perttunen wrote:
> On 5/17/22 11:02, Krzysztof Kozlowski wrote:
>> On 16/05/2022 12:02, cyndis@kapsi.fi wrote:
>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>
>>> Add clock, memory controller, powergate and reset dt-binding headers
>>> for Host1x and VIC on Tegra234.
>>>
>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> All your patches are send from wrong email address and the SoB chain is
>> not correct. Please add respective SoB.
>>
>> This applies to entire patchset.
>>
>>
>> Best regards,
>> Krzysztof
> 
> I can do
> 
>    Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>    Signed-off-by: Mikko Perttunen <cyndis@kapsi.fi>
> 
> if that is better.

That's not needed, if your name was in the sender field. The trouble is
that your name was not there and I have no clue who is cyndis@kapsi.fi.


Best regards,
Krzysztof
