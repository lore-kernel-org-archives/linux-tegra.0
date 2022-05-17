Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF35C433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 17 May 2022 08:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236922AbiEQIDN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 May 2022 04:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242292AbiEQICh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 May 2022 04:02:37 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F217246659
        for <linux-tegra@vger.kernel.org>; Tue, 17 May 2022 01:02:32 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id p26so5100108eds.5
        for <linux-tegra@vger.kernel.org>; Tue, 17 May 2022 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xtfFxNQ4kXjnMowlOhtuczG/jVCPXMAxYap4G9Z9g4o=;
        b=HnPwwtmGhHal34IN62BohKnesTIAiJhZH/Mea1AjY9eivo9Z4ZXNv451zmhJn2bU6r
         G5PtXi9/vxmwNwW9cz/BanVwTkhxLUZ9j4NGk3TWyDI+atyps9zyk7SVj4CwbHlIV2UY
         KphPuli3AQw+8UE+yenQWPNpZGrAFvWsgcV5tMB5Wt0vk6WwRUoZQ/Ienfv3dQd12QAD
         pUzYH8gNLOwNtEO70chtu0cgEOMl7ZE417fud+dIciRDMGLg2anL0BKRhz2X67Me75cZ
         UNtZlLMwUbRhQhWp9UlWNcOkLtVZ2acOeyMHzKKQfkip7CcTf58qLYrt9qFUk63uItn2
         nElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xtfFxNQ4kXjnMowlOhtuczG/jVCPXMAxYap4G9Z9g4o=;
        b=buvVu1RAahMnx/rUgGUFgHWmPPyNPMcgAC1oBbQIoUU1YTqfFLniB6T5y1m/Tjl4Q2
         SHq9VmNx/yTGV7Me2dHybmhSCSSR+i0OZJqxLuLYMEP1MyqppOs3OL+ioPdWskoN4aOc
         bQ63mPk5GPiIU3TRM2bFJ03mvWy87qnXopdQ7HvQhF5dj/taGmWy7mA7A8TNR8AbScTC
         vyuYIv1wCRwFFBipZtmjTjjozQFbmmwsBqa723tdLIPuXukxzwEdzjPp2i+kkKLX4fZd
         wlRqIj49TRV9o9mMl3D5uHPVH3n6gNVoUaCXLMH8c2P3Sc9jKqxmk7eNX4Sg5pQ5JPSh
         RWEQ==
X-Gm-Message-State: AOAM5304nNvjK/jzi7XTPBLW6zJCaO1vhv+/EfuTHP66/RHymYwKfVwB
        J1P/zA/5Bp0ub9/4rw6yULYc5A==
X-Google-Smtp-Source: ABdhPJy2xVmqaMW2+SK5q/96Y2Kc8dHmYLGF5OSaHiqk3OvCVkn1VCaUxDtmUCtWcrd9LTtbI/cLvQ==
X-Received: by 2002:a05:6402:84c:b0:428:4cc4:8212 with SMTP id b12-20020a056402084c00b004284cc48212mr17530588edz.171.1652774551112;
        Tue, 17 May 2022 01:02:31 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id md14-20020a170906ae8e00b006f3ef214dccsm737988ejb.50.2022.05.17.01.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 01:02:30 -0700 (PDT)
Message-ID: <20a7087d-dddd-134b-4cef-0ebcbc5115f3@linaro.org>
Date:   Tue, 17 May 2022 10:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 02/13] dt-bindings: Add headers for Host1x and VIC on
 Tegra234
Content-Language: en-US
To:     cyndis@kapsi.fi, thierry.reding@gmail.com, jonathanh@nvidia.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        digetx@gmail.com
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <20220516100213.1536571-3-cyndis@kapsi.fi>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220516100213.1536571-3-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/05/2022 12:02, cyndis@kapsi.fi wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add clock, memory controller, powergate and reset dt-binding headers
> for Host1x and VIC on Tegra234.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>

All your patches are send from wrong email address and the SoB chain is
not correct. Please add respective SoB.

This applies to entire patchset.


Best regards,
Krzysztof
