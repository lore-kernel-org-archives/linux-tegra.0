Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A5AC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 14:32:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C0DE60FE7
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 14:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234942AbhKLOfi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 09:35:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbhKLOfh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 09:35:37 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE9AC061766;
        Fri, 12 Nov 2021 06:32:46 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id e11so18834482ljo.13;
        Fri, 12 Nov 2021 06:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jt2s5eE/KZv2f777KX1QTyz+OLPwPl/PkMsoEbWrCGs=;
        b=i23UwZ6HE1MO8waAeRtHPEn5k2yNK9USGUt+trHLji3BvDimp03/SrKGm5JUcuPans
         V2/TQzharlHbqb+MaQ1aMV27Gs8R3tAuLPvDAjlf/zDn20Fbec0kYackzhXzZLqy8xn9
         aKXx/PgK0jKx1h/u7Wym5icG4tk83l0fRUIOBrGhQgv/KOoNf4W+SwqcmBWdaoEUpDeD
         EOQQbi+V7qBN2WeS2dUcCBnvlxlHnlJ6YTJWP0TxpLJp9L8HZaKDePAwt9caVX2rmlro
         K7Cf9DvOJ5Om9RDx7yiHFE1+L9udwpYmvO4rC29zzz8XQ0/qmvrn3wH/gZsH0UTAVs4P
         Vopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jt2s5eE/KZv2f777KX1QTyz+OLPwPl/PkMsoEbWrCGs=;
        b=L3lJZlUd4de/FFDOzxhMp8+zaKEojbIvxwzPWg2jzik2eVLpJCjGD8wJffNrnurVFh
         4y5Yyj+32R17wxnGM26nwFUVcyRuSeK0FYDXU1Z2W1RTBVOX7AIBX7U+6vJ0cz7UBPgr
         AcWbkXwRu0a1jKfbD0qlreoKz2kVRT07IwjwOFb4g/Z3tI0S+gR/qzz6ceOEgqBUwtFA
         Ke0T7fhVyLvzy09mHAnIspUVTCdXGSvxYsjOEGjP5Dc1Pfkca2Zjuyqw34HSIfYbxQzW
         IuFkuHi+0RnQUhCqXDku9oS4FrdRtL+JO+ovSKIscG17mLOZyAfBYo2jGBcUwfBf6aQs
         FCKw==
X-Gm-Message-State: AOAM532tSoKe1ShooFHFXLhWnQoWZ+VUcgl7FK2KSA6trsM/IJjoGPmq
        dTPuq9G7fHuNgmrCNLGGUgiVxMd3ujI=
X-Google-Smtp-Source: ABdhPJxBQ423Ld/XMxX+l3TnJVKv96QnKYPBK0REIsPD1NSxn+CW9FihZYNXZBK1woVGv7zwysv0DA==
X-Received: by 2002:a2e:a376:: with SMTP id i22mr15560272ljn.201.1636727564749;
        Fri, 12 Nov 2021 06:32:44 -0800 (PST)
Received: from [192.168.2.145] (79-139-177-117.dynamic.spd-mgts.ru. [79.139.177.117])
        by smtp.googlemail.com with ESMTPSA id bn3sm573660ljb.7.2021.11.12.06.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:32:44 -0800 (PST)
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
 <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
 <YYo9IXjevmstSREu@phenom.ffwll.local>
 <857a48ae-9ff4-89fe-11ce-5f1573763941@gmail.com>
 <efdc184a-5aa3-1141-7d74-23d29da41f2d@gmail.com>
 <71fcbc09-5b60-ee76-49b2-94adc965eda5@gmail.com>
 <49ffd29b-eb64-e0ca-410c-44074673d740@gmail.com>
 <YY5HfUUSmnr6qQSU@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5ee3f964-39ec-f6e2-5a01-230532a8b17e@gmail.com>
Date:   Fri, 12 Nov 2021 17:32:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YY5HfUUSmnr6qQSU@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.11.2021 13:52, Thierry Reding пишет:
> On Tue, Nov 09, 2021 at 05:39:02PM +0300, Dmitry Osipenko wrote:
>> 09.11.2021 17:17, Dmitry Osipenko пишет:
>>> 09.11.2021 17:08, Dmitry Osipenko пишет:
>>>>> +static void host1x_drm_dev_deinit(struct host1x_device *dev)
>>>>> +{
>>>>> +	struct drm_device *drm = dev_get_drvdata(&dev->dev);
>>>> And platform_unregister_drivers() should be moved here.
>>>>
>>>
>>> Nah, that should cause deadlock. This ad-hoc is too lame.
>>
>> Actually, there is no problem here as I see now. The host1x driver
>> populates DT nodes after host1x_register() [1], meaning that Host1x DRM
>> will be always inited first.
>>
>> [1]
>> https://elixir.bootlin.com/linux/v5.15/source/drivers/gpu/host1x/dev.c#L475
>>
>> Still I'm not a fan of the ad-hoc solution.
> 
> Could we not fix this by making the panel "hot-pluggable"? I don't think
> there's anything inherent to the driver that would prevent doing so. The
> original reason for why things are as intertwined as they are now is
> because back at the time deferred framebuffer creation didn't exist. In
> fact I added deferred framebuffer support with Daniel's help precisely
> to fix a similar issue for things like HDMI and DP.

I don't understand what do you mean by "hot-pluggable", panel is static.
Please either clarify more or type the patch.

Keep in mind that fix should be simple and portable because stable
kernels are wrecked.

> With HDMI and DP it's slightly less critical, because a lack of mode
> support would've created a 1024x768 framebuffer, which most HDMI/DP
> monitors support. However, with panels we need to ensure that the exact
> mode from the panel is used to create the framebuffer, so it can only be
> created when the panel is available.
> 
> But, given that deferred framebuffer creation works now (which allows
> the framebuffer console to show up at the preferred resolution for HDMI
> and DP), even if a monitor is attached only after the driver has probed
> already, we should be able to make something like that work with panels
> as well.

BTW, I see now that DPAUX I2C transfer helper may access
aux->drm_device. Hence v1 patch isn't correct anyways.

For now I'll try to test more the ad-hoc variant with Thomas and send it
as v2 if we won't have a better solution.
