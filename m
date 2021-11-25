Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AC8C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 03:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238003AbhKYDDi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 22:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232102AbhKYDBi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 22:01:38 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786A6C061395;
        Wed, 24 Nov 2021 18:15:24 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u22so9382016lju.7;
        Wed, 24 Nov 2021 18:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lj/upQN23hUbS3GkdrQq0qv4Yn6ZPxec0EiWH+iqMEA=;
        b=DLca4MslZlWfLY/LW/Le4nXm0Lum7JkUH2e/qN4ovD8bOQ+kz9mypepqtDwtvBoaTa
         mKlIhR4I4RdGakqb+PuA9BCZhIPzlsjxmU6hS2jOpVkSDyOEyJwf9nzw+sVzN0v961pb
         kcjhP48xKzax/6HW6UTL9lOMbHhSLCyM3sy/D8tzTu2ZFfjNvBm0pRO1dBVsecX5Bv0+
         uVB2/LA4JMvrvkQuDI7dFIEASY5dy7A1FdEswK5yqjMf9+BWmirrXVyxKuvNOLpv8G5W
         jSgvK2+Ei0SaCozS+BHconKlU2PczXRL7HkGrJ+94JZ3Tb0XxK0branHuIvp1xn8N3+C
         xR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lj/upQN23hUbS3GkdrQq0qv4Yn6ZPxec0EiWH+iqMEA=;
        b=Zcqn6jV+jcgUNd2PyOypXueMY9vWjGuO+CvmeCxpSfmkU8ApmuoMps9IwgSoPu72gN
         GDD3TZca3pNmN+pBEDwf834duCsW73egFyUzdJEkdcoyI574PBdidujoI8o//gIO4yhI
         ZRWQ24eOkr5X42p9a8sSwW2q/oYdZQI7EYR5jw2f1LAbHhD0cqXwdWxrVtODNtGQT9lI
         btOEQJGYBK7Pix2Anqx1F3dWO/PyIVHfqfi24yLGlOWPu3YmPrjiw3n12GHOb3cnHuld
         hvRQ2Li2X8SMnTOm6On7SWbT6/I9IHMFvAoZilCkK6uciuXeDwSvZWNzj99GkEzy6ljl
         wwzA==
X-Gm-Message-State: AOAM530j7E9/K+3JKYSqBLEfbLtjdxVPeGgPTYhvM1oX8Oe4JFt0u91r
        CiOfT3oISGaKuUGuYKg7sJ2V7u52U7k=
X-Google-Smtp-Source: ABdhPJwAyB2heTKPgBeg1gEb9wBYyvxbBdHgV9Gy/aBPiZUAIjZAMyEG1ecw4TwMScq4tOcwaSfJ7g==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr21347657ljb.214.1637806522563;
        Wed, 24 Nov 2021 18:15:22 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id b43sm128479ljr.64.2021.11.24.18.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 18:15:22 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: sound: nvidia,tegra-audio: Convert multiple
 txt bindings to yaml
To:     Rob Herring <robh@kernel.org>, David Heidelberg <david@ixit.cz>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        ~okias/devicetree@lists.sr.ht, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211025171927.92332-1-david@ixit.cz>
 <YYBRTK9KGglu/s9m@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <59a8095b-fa80-258f-f2d7-dc241bfae24a@gmail.com>
Date:   Thu, 25 Nov 2021 05:15:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYBRTK9KGglu/s9m@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.11.2021 23:42, Rob Herring пишет:
>> Convert Tegra audio complex with the
>>  * ALC5632
>>  * MAX98090
>>  * RT5640
>>  * RT5677
>>  * SGTL5000
>>  * TrimSlice
>>  * WM8753
>>  * WM8903
>>  * WM9712
>> codec to the YAML format.
> Perhaps say why they can all be combined.
> 
> I don't think that really works because the properties which are valid 
> varies. Specifically, the GPIO lines vary.
> 
> Instead, define a schema with all the common properties and then 
> reference it.
> 

Those GPIO lines should be more board-specific, rather than
CODEC-specific. Yes, some of GPIO lines may be unrelated to a specific
CODEC, but practically it's not worth the effort to split this binding
because of a couple optional GPIOs, IMO. We actually considered the
variant with the reference that you're suggesting and decided that it
should be unnecessary.

Are you insisting that the binding needs to be split?
