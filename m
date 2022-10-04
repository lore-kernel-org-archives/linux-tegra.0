Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AD5C4332F
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Oct 2022 11:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiJDLFf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Oct 2022 07:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiJDLFY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Oct 2022 07:05:24 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006D914D0D
        for <linux-tegra@vger.kernel.org>; Tue,  4 Oct 2022 04:05:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bu25so20605111lfb.3
        for <linux-tegra@vger.kernel.org>; Tue, 04 Oct 2022 04:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CdB5pNPn1z3hOORutMayY9OylE9bDXafftjb5ZY85Ls=;
        b=Aicc3p/LBIP8Hd7tOw2WCIqknBYo352b1b1KQPR9O/IjkKO71/O57c7Mz4gv7Ats4F
         6Dq02RpB3MiBwI6H5tolRswKTCzujMlCDphrtPw3DoCBFbLUcSSMhbaFbj8KqUECeEyB
         ZZb0FdgYEr1F/SR58Kf5vl7t1BDV+Sq4E+kQonxwwhbrOiQ1wa5YuKEWSEu0hG657lkg
         Q5bwbVNQs2oqNWPcYE1LEglqVVxrN/RzJjVRdunJYo7teb7yhI3OExHJZPdd6C3F2yZ4
         GU+t8aWxSjNcxC7osUORq7KOsKR8G6In8RWM8yOxr0rEBPRdD1oZQxMWBZUqftHV/+CQ
         FhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CdB5pNPn1z3hOORutMayY9OylE9bDXafftjb5ZY85Ls=;
        b=o5hvHMQBXYZamUrXB2hlhMJ8SWSlHdFOxaZciQfco1SCXB+COvbl/O+wno2YaBHYK4
         8vAdZqFD6DfgMMzgOHtC0eZGn8+/vwPr9fA4636gdWkDTR2xKtwbzZvJRgifHQN9oB6h
         +jcwqjrVoNJXBMn3qjQvFRZYMZOubqIt7ROPAoE8wjr3wgTcuXv2V99bX+nVCVm35Z7X
         YXujhFwfNTo/to2GCQVzzkoZzl6HbmJml1aQDVFUv9KawIOGTNTgRyPUKSwmai11GvH4
         e5L1MrnlSbXz5rp8vvbyNR8gbTMKD8gSS1OKRduwx80oxulkpGdz+1x+SK6zeKMwn3PF
         lB2g==
X-Gm-Message-State: ACrzQf2bZr8VhtZRv9AqENGWO5Z8NSKaFXh2TZSVfZlb8VziMOta7ZR6
        j5VZXrCIXATz/oiwirMYDVJXfA==
X-Google-Smtp-Source: AMsMyM6qbKEnyaJKurccIDdstvhYg0/dHAN3kIdwHg1wwhfHgZh++ybgBnDtI2SIdmUXvVbaaM5x1w==
X-Received: by 2002:a05:6512:3a8b:b0:4a2:515e:eb51 with SMTP id q11-20020a0565123a8b00b004a2515eeb51mr1098564lfu.540.1664881506353;
        Tue, 04 Oct 2022 04:05:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p18-20020a2eb992000000b0026c47426cd0sm1177909ljp.140.2022.10.04.04.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 04:05:05 -0700 (PDT)
Message-ID: <98d3b42d-3f9f-9b6e-8c17-46deae4b4030@linaro.org>
Date:   Tue, 4 Oct 2022 13:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/4] dt-bindings: display: Add bindings for JDI
 LPM102A188A
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        arnd@arndb.de, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-2-diogo.ivo@tecnico.ulisboa.pt>
 <efa2f644-0a1d-00f7-970c-f17ceb0cc550@linaro.org>
 <20221003170634.56jibls3xjxiiulg@wslaptop>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003170634.56jibls3xjxiiulg@wslaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 03/10/2022 19:06, Diogo Ivo wrote:
> On Fri, Sep 30, 2022 at 12:49:31PM +0200, Krzysztof Kozlowski wrote:
>>> +  ts-reset-gpios:
>>> +    maxItems: 1
>>> +    description: |
>>> +      Specifier for a GPIO connected to the touchscreen reset control signal.
>>> +      The reset signal is active low.
>>
>> Isn't touchscreen a separate (input) device?
> 
> Hello, thank you for the feedback.
> 
> According to the downstream kernel's log, it seems like the panel and
> the touchscreen controller are considered to be embedded in the same unit
> (for example in [1]), 

Downstream kernel is not a proof of proper description of hardware. If
downstream says orange is an apple, does it mean orange is really an
apple? No... Downstream creates a lot of junk, hacks and workarounds.

> with the touch input being transmitted via HID-over-I2C,
> and since I did not find any reset gpio handling in that driver I opted to
> include this reset here, unless there is a better way of going about this.

Instead it should be in touch screen device.

> 
> Best regards,
> 
> Diogo
> 
> [1]: https://android.googlesource.com/kernel/tegra/+/bca61c34db9f72113af058f53eeb9fbd5e69a1d0

Where is the DTS of that device?

Best regards,
Krzysztof

