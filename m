Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183CDC433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Nov 2021 14:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0ABA61058
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Nov 2021 14:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhKIOTz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Nov 2021 09:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbhKIOTz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Nov 2021 09:19:55 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3589BC061764;
        Tue,  9 Nov 2021 06:17:09 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id p16so44745587lfa.2;
        Tue, 09 Nov 2021 06:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=m2GqY2mDFlipG6tNeiSkvnWYUGbRZlIzY21R2KMLhdo=;
        b=ELe9+siJ5BYvKf51LONW43WgnEkNFx3zmr9fYBZziifsfWt7ud+AvZfQqfMSq69n4N
         +oFpnk8aHk3046QXCYM+kqU26NNmw2BBwt0wQ6PsdYQ83nIkGETP1zmi3i1NyO5p7UCg
         dwuAjX0O6MYLpJK/5usiGmrFaWgLSn1zBRDKDnJNU2YqxbcR2huZGp4WCJ6WsbUGPIQg
         esVWTzz+8L2hpgfXV/mVzHnnBPiAMqggOcGCzOLYmXChP47UBjEQJf+9I4qk2sBMIuHq
         H+MZQzFywvYWHWmRAuVCdfmedDEM+H7jwcSlXHKmH+z37MonJp9mwBUEkgehpHUKI/Gt
         Ldng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m2GqY2mDFlipG6tNeiSkvnWYUGbRZlIzY21R2KMLhdo=;
        b=bPKLYItPNj3AXnFhQLRGSFcUCQ52MXcb+9EvuMUKUlpLjwiO6+tmP5EvZmzlIOegv3
         P57+9LXYTEPIPPYiof/Iqs/8zoF9d0uurCpuZsy2BblJC6HH+ANnMwKTosha9f7+wBc9
         Y0h7gtwmuz3WBMBpOcGWKDxKWMxPtv5JEF+7KLVNLtveu3xNFOmf1ivtVwstzgJqhPr8
         xuJyLSNrG7sVUt3Nzp1gazgJDC+lk4zmWiW+vwbHpHD8EwaTOlel9yY4bqM9xCXcoMEn
         uSgnSNXsY2yxW8CDksHqXBxPjZcvN9CkSncyarnuzz83i4DihPpvVX8Qv9Sw8yWOrFnK
         35qw==
X-Gm-Message-State: AOAM530fO05q4C+JR3I2Jc559ObJQY0ebNqRgqTBzgNrnn+Dex0XIK/1
        JY0puPP+g9iRL1zooWVud47PqLjTLxI=
X-Google-Smtp-Source: ABdhPJyk5qauXt5bW8MEYaLPuuzF4Vi7/T974PUmgB7TLU72JMIrOEmxEtXPIKbH7OgkdaT1BGYBZQ==
X-Received: by 2002:ac2:4e0b:: with SMTP id e11mr6983512lfr.208.1636467427428;
        Tue, 09 Nov 2021 06:17:07 -0800 (PST)
Received: from [192.168.2.145] (79-139-188-96.dynamic.spd-mgts.ru. [79.139.188.96])
        by smtp.googlemail.com with ESMTPSA id e7sm2158805lfr.294.2021.11.09.06.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 06:17:06 -0800 (PST)
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
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
Message-ID: <71fcbc09-5b60-ee76-49b2-94adc965eda5@gmail.com>
Date:   Tue, 9 Nov 2021 17:17:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <efdc184a-5aa3-1141-7d74-23d29da41f2d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.11.2021 17:08, Dmitry Osipenko пишет:
>> +static void host1x_drm_dev_deinit(struct host1x_device *dev)
>> +{
>> +	struct drm_device *drm = dev_get_drvdata(&dev->dev);
> And platform_unregister_drivers() should be moved here.
> 

Nah, that should cause deadlock. This ad-hoc is too lame.

Another solution is to defer probing of DP AUX driver while
tegra_drm_device() returns NULL, but it's icky.

Reverting the original DP AUX DDC registration order is the best option
so far, IMO.
