Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A7EC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Sep 2022 11:30:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbiI3Lay (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbiI3L3y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Sep 2022 07:29:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B89C3DF0C
        for <linux-tegra@vger.kernel.org>; Fri, 30 Sep 2022 04:20:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id s6so6376558lfo.7
        for <linux-tegra@vger.kernel.org>; Fri, 30 Sep 2022 04:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=tSS0OwapmGCYXAOpgg6xlNApn7RpwyeG1gXGqydrbJ4=;
        b=RnNLp5XOC5FP1l1QOpxkRAxm3SlY4+bFuwv0pJvVxm9o2BmI7JrUaMTpc0m30QGvQG
         d1Z+Dk2GdC95Rwi8IFxxd2jGsY0fNMHD5rwNXWrvw/HOyxMGCYhj8XhlnOqerGM3QkIP
         gKm+aRIpScjhv4OapLjH9oPyK+vtEVwNy+8dUrcrWMPeWtYXiJLJ5zVeGeJaUwHJpYIo
         cggQFA664pyFL5A46dvED+9oxamy1IrFZaziE2EoKL93Cbh8a8GD8leRWDV56UED7sIN
         +/EsrEDdSojmlNWOTBRHXMKkoKVTroqXqpOmYJhh1L0otqOa6iiMr9otpnOz+UYMlhpJ
         ZUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tSS0OwapmGCYXAOpgg6xlNApn7RpwyeG1gXGqydrbJ4=;
        b=ArTe10xLgXwEjvQUG903OhnnJdC2ZU5TsguB9eaWgcDO2kKRDLcboXdrxGopDyAo6S
         dZG2vhsA4TiZIvHxVroGP83xayBjNfGq2zGdMK8MfxBWfeiZG8thgf7WIFSAhVb5vjFJ
         Wr24qsEJwt5fvyHfC00JqvdOff8fYq2qjM3eusNnp4AojCM0OMd6kALw/U3LQQ/EGuXS
         dLFDb+mt97kbK+YCIfVLZscQkrOD9kLNbx7jONwKahupsi2sf30GpNVKzXFWiVTWkcvq
         3EUGD2wDdpoSX3eSkfM37Ek6v977GUX3USFQl2FNw+8zsHFBL4kqPFwTT+Tj3A1pa9QC
         P77A==
X-Gm-Message-State: ACrzQf0ndWC6QypEQhTnu9gnTNFU6TOR9+0a7W43z1uVYRbvbISph0RI
        sQFPegya2Mt44GVmSvYDsN5Vug==
X-Google-Smtp-Source: AMsMyM5+Br4pooYTCe1wcBue2LneLOWrbvkc2W5kR2lwYUem3rqWngE6Go7DjWuEqVmBFTIhyvEK3g==
X-Received: by 2002:a05:6512:3503:b0:496:55d:a186 with SMTP id h3-20020a056512350300b00496055da186mr3040836lfs.340.1664536851811;
        Fri, 30 Sep 2022 04:20:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j22-20020a056512109600b0048af397c827sm258553lfg.218.2022.09.30.04.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 04:20:51 -0700 (PDT)
Message-ID: <a0254559-a76d-de87-3458-e7dc148a8daf@linaro.org>
Date:   Fri, 30 Sep 2022 13:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, sam@ravnborg.org,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        arnd@arndb.de, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
 <23bc38b8-ed67-d243-9739-f07b7411be3a@linaro.org> <YzbPz8mL0Yo+vgSS@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YzbPz8mL0Yo+vgSS@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 30/09/2022 13:15, Thierry Reding wrote:
> On Fri, Sep 30, 2022 at 12:51:07PM +0200, Krzysztof Kozlowski wrote:
>> On 29/09/2022 19:05, Diogo Ivo wrote:
>>> The Google Pixel C has a JDI LPM102A188A display panel. Add a
>>> DT node for it. Tested on Pixel C.
>>>
>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>> ---
>>>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 72 +++++++++++++++++++
>>>  1 file changed, 72 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>>> index 20d092812984..271ef70747f1 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>>> @@ -31,6 +31,39 @@ memory {
>>>  	};
>>>  
>>>  	host1x@50000000 {
>>> +		dc@54200000 {
>>> +			status = "okay";
>>
>> You should override by labels, not by full path.
> 
> Why exactly is that? I've always stayed away from that (and asked others
> not to do so, at least on Tegra) because I find it impossible to parse
> for my human brain. Replicating the original full hierarchy makes it
> much more obvious to me where the changes are happening than the
> spaghetti-like mess that you get from overriding by label reference.

Sure, it's entirely up to you. I forgot your preference.

But it is a really nice way to have duplicated nodes and mistakes (which
happen from time to time).

Best regards,
Krzysztof

