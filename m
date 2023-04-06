Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAA0C76196
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Apr 2023 13:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237543AbjDFNyS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Apr 2023 09:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236811AbjDFNyQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 09:54:16 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4AE8A6D
        for <linux-tegra@vger.kernel.org>; Thu,  6 Apr 2023 06:54:15 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d17so39583465wrb.11
        for <linux-tegra@vger.kernel.org>; Thu, 06 Apr 2023 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680789253; x=1683381253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezT0NDsUMsm10HBHulD+tvoUb5KJlGUy+bX2OIndrqE=;
        b=uDn1XPw9QQnbG4CQ/ZnIv0s2GKDkcAOuVrNy4bSd/rPD71Z1tjzz2Yl4Ib//qRquqD
         ijBC8iwNnJWx0dlc0+sWzs3VwmKgE2tcP5THEEd2WuecNJ+ZxtRKg6iZ47HU+QQsIeTJ
         NxpnTAhbMSfnaB1BC4rMxBBMQak4EtC3iuzo1WEVBVSwgsM00tJbpNo6GUusIJRfs+XB
         KXyTUHQ4clWDylm8qqroPxqDPz9Gg/FUmdrYFCGd+CfrJy+9a44kn3PCMa3bVvf+pcR8
         rccg+q9IXhXCWV1jdJtirFTmD7r/POHza+D6RjOpeocWbQJ1ktALfp64bs+z9Z2O6eoO
         tpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680789253; x=1683381253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezT0NDsUMsm10HBHulD+tvoUb5KJlGUy+bX2OIndrqE=;
        b=8Ci9Pkx6uayUPld3gJqOocK4vj15RVA5Uq0w+3pUtRFtn0xERdbw0yOwl1lrkXtMgM
         O0BPT73op/mPKBPMyYzGZZUq2/lP/dmeMAri/jKEZpeDPX0Pro2Z0/33cxEeNd+ajydo
         wdRe02JUzlxj2gWH00qWniXG6y+T2qEEVKTmtqXvFSKLIAgM/aHjsmhY6K7LAdrrur6b
         H7FcQvjnsIYL0Sbnhmnai8TEN65h7257mjWzX1dRP1g13EvhdwfgLSDRp5+eM4/MT2m7
         UD5HkbFHZdfqUxZ5mHFzqp/XVa70lhyj31oS20l4rnQsNoca5EOY3f3SHxHc/BTz/w7g
         4moA==
X-Gm-Message-State: AAQBX9faD7gLlDJJNmrwcLtkjbdMpWUOpAV/zs4vheXIcRjjc0AzP262
        8LX1xeKyeBVtwjZnPNyCFTFemw==
X-Google-Smtp-Source: AKy350bC0LRKYynmaTA4IXUV15q6OdxA7m8TujnIRxxxtl9PPIg0UCGI2eOFvvdpUHN2V+bZpayO6A==
X-Received: by 2002:a5d:4846:0:b0:2ce:a8d6:309a with SMTP id n6-20020a5d4846000000b002cea8d6309amr6795139wrs.61.1680789253438;
        Thu, 06 Apr 2023 06:54:13 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:6630:ee96:3710:24c8? ([2a05:6e02:1041:c10:6630:ee96:3710:24c8])
        by smtp.googlemail.com with ESMTPSA id k15-20020a056000004f00b002c71dd1109fsm1860813wrx.47.2023.04.06.06.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 06:54:12 -0700 (PDT)
Message-ID: <0a42d419-7ec2-6d09-9b19-15aa25888625@linaro.org>
Date:   Thu, 6 Apr 2023 15:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] clocksource: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
References: <20230313075430.2730803-1-u.kleine-koenig@pengutronix.de>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230313075430.2730803-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 13/03/2023 08:54, Uwe Kleine-König wrote:
> Hello,
> 
> this patch series adapts the platform drivers below drivers/clk
> to use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
> 
> Most clocksource drivers are not supposed to be removed. Two drivers are
> adapted here to actually prevent removal. One driver is fixed not to
> return an error code in .remove() and then the two remaining drivers
> with a remove callback are trivially converted to .remove_new().
> 

Applied and fixed up patch #2


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

