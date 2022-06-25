Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CE1C43334
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jun 2022 20:17:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbiFYURa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 25 Jun 2022 16:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233485AbiFYUR3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 25 Jun 2022 16:17:29 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B1C14D3E
        for <linux-tegra@vger.kernel.org>; Sat, 25 Jun 2022 13:17:27 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id o10so7886572edi.1
        for <linux-tegra@vger.kernel.org>; Sat, 25 Jun 2022 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=amdozWDTBW4nPW/TB1vNSE3aSyOSymWjl0xCncL2e5o=;
        b=F0g++A1Y/eQo02URGKIJk9BaVk/w/aRYH0E8r9LCM+cHUw3azQ0UWjd9Uekx656Chu
         Uf0pz/33ycAd7JH/ZbeL4V/Mpk8A0sbfs4W0q1dgmnT1Lkn0GfB/fgSnjdaQ9+nR8/cH
         Yo8mILDLgU9Bt6p1HsjcmLt7mdP7H6rxOvSJq7ftpOzlWa370v3k6J/ll30nYAEwrr0p
         Krx+hQdIJDHuzDcDPKW1vShfmkJldSiVLhInY4qPan2zaMOR+WGK66tUjRiiCPceOsK2
         b4k+5JvQia4anX1M95Xvt4et/aE6ZWPEQfvCR9nv7w5KUPuf196YbqM66Xdva0gZaVLK
         HSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=amdozWDTBW4nPW/TB1vNSE3aSyOSymWjl0xCncL2e5o=;
        b=atvxLEdcPT0GPk5p9NMhSDCPKqEt221gqF0f9mYfgVC7wVmzHyyF6IjaHqyUIt1Ab/
         +v6pP79peVQtlOxnVug/MYsvW3iioPiExrf/NTEBsoDhlA5OHnT8AsSVgpXM5QcHBiuM
         0sINyOafNJYLm1asqB2gbXjjKozM23Cfm4duQ7CYZnCNFRosejCG2T+hz4JLhhYN/pAc
         fUdYnO0rUOHoLFeu7qkIeoCjEIHZFIEQ1qPOrwsX1Oxa/haVI7OvYa19K2/+URcoq0A8
         QBvo/vemLFYX+1WPzKcoRZOW5vjtNL+uFrldpa+R8M5OHDEe9NWT/OE0ZL2RWRFXnNyt
         8i9Q==
X-Gm-Message-State: AJIora8tqP9j08UI+v7vMyjOShkbA1UZfCnitSJb6E9EeNrqdtQkJL7W
        NghxLLzPpY2E3qsfZyWH5OzxyA==
X-Google-Smtp-Source: AGRyM1vJaTxphPLX88QmNPkoVNnp2tPE2GUrqm0eYWRQmkkPOKowlJOUbINXeXsMde+IJPsq4n/h3w==
X-Received: by 2002:aa7:cb83:0:b0:435:9170:8e3b with SMTP id r3-20020aa7cb83000000b0043591708e3bmr7190848edt.144.1656188246288;
        Sat, 25 Jun 2022 13:17:26 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090638c100b007219c20dcd8sm2967138ejd.196.2022.06.25.13.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 13:17:25 -0700 (PDT)
Message-ID: <000ca74c-16e1-754b-3398-8c9a65faee0b@linaro.org>
Date:   Sat, 25 Jun 2022 22:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: (subset) [PATCH net-next v1 4/9] memory: tegra: Add MGBE memory
 clients for Tegra234
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, vbhadram@nvidia.com,
        treding@nvidia.com, robh+dt@kernel.org, catalin.marinas@arm.com,
        krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
        jonathanh@nvidia.com, will@kernel.org
References: <20220623074615.56418-1-vbhadram@nvidia.com>
 <20220623074615.56418-4-vbhadram@nvidia.com>
 <165608679241.23612.16454571226827958210.b4-ty@linaro.org>
 <YrXlQJ1qzsZZrx7Q@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YrXlQJ1qzsZZrx7Q@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/06/2022 18:24, Thierry Reding wrote:
> On Fri, Jun 24, 2022 at 06:06:35PM +0200, Krzysztof Kozlowski wrote:
>> On Thu, 23 Jun 2022 13:16:10 +0530, Bhadram Varka wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Tegra234 has multiple network interfaces with each their own memory
>>> clients and stream IDs to allow for proper isolation.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [4/9] memory: tegra: Add MGBE memory clients for Tegra234
>>       https://git.kernel.org/krzk/linux-mem-ctrl/c/6b36629c85dc7d4551e57e92a3e970d099333e4e
> 
> Ah yes, you'll need the dt-bindings header for this driver bit as well.
> If you don't mind I could pick all of these up into the Tegra tree and
> resolve the dependencies there, then send a pull request for the memory
> tree that incorporates the dt-bindings branch as a dependency.
> 
> That way you don't have to worry about this at all. We might also get
> another set of similar changes for PCI or USB during this cycle, so it'd
> certainly be easier to collect all of these in a central place.

I cannot take DTS patches to the driver tree, so it's easier if you take
it and handle the dependencies.

Best regards,
Krzysztof
