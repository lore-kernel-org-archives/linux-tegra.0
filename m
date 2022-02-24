Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D329AC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Feb 2022 16:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiBXQxc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Feb 2022 11:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiBXQxb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Feb 2022 11:53:31 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB5175C1F
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 08:53:01 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id e2so3721759ljq.12
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6rQxjXtpXu2yAb/jowAuwRKR0kniyxdOrLxDLFvi0yI=;
        b=pJ+/uf9rIZEsItagsr2tmkqzFW9yixs9CzyRhYdA+vydMSnQto9SssCtMdU+vGn217
         ufQTQTy9nXGhxAeyGHlQCDl625iYrmpROdqAnpSzZAbCxwHlEIzIbDYn+lp38PNEXH1N
         ZPSO3epfeS7e5sdxN9fhMvkSmQGSIJiSS2QwPeaCH6lfLGpjRLgtNS2vALMhPx82h8fq
         VFPVWFKsCNyBGdLQCEtIijK1NIP9GHyHVDfDR6embgmBulp/iXPspc/DhZwz9Kwy3gL3
         Y3H1CmkTs+LA4iAHRi+NO6h+mJ91nCXORA2FGH+WWZul2JSQr0eMt2lXnNrQym2hs1Cs
         2+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6rQxjXtpXu2yAb/jowAuwRKR0kniyxdOrLxDLFvi0yI=;
        b=dWWeZ2kFuNqUgNnBoEQ0o0zUuJQjkUeVs7K648j4RgRrTTo8cY4tCpPJi9f4vcCO6Z
         HWoEEW87kzU9UgTCM9YoOd+kpYBvYFYI/e52mrSXF/BGSkKWsYULd86/IIaUAGdsfaQD
         4j4Oo6CgV1FeQd8Nsk8MKpoOID3dgByR99W7ckiJFYV9OnjMJI4WshVghte4Hv0WBdAX
         w3e1r3FdLhUaI0Ocbgvrj/gd2CWvKyOaP+MlwG8halOHDcduBQ15vt9dfl3BLn4Q8Q0e
         7zCZUnX6tdXwJVCHOX6sJqxnpdrSixfBhdUnGQD4hj6AFuAtQVRcA+hX/MNLSw6jgZ0K
         ipLg==
X-Gm-Message-State: AOAM5305/S249G6+qFZLSihf8r+RSj3ix7NGuu70BACINdAV6887rfrl
        rDga9YmwlV0NRzmXIaNe81vuSxIRcVg=
X-Google-Smtp-Source: ABdhPJySeNUF9Se5vXIwdNTcbknxa5e1zw6LB0LqowdsG230BkAJogc8AqFWu/aXzHRkruaOnntzTg==
X-Received: by 2002:a2e:5c81:0:b0:246:3c1e:b4db with SMTP id q123-20020a2e5c81000000b002463c1eb4dbmr2527010ljb.292.1645721579401;
        Thu, 24 Feb 2022 08:52:59 -0800 (PST)
Received: from [192.168.2.145] (109-252-137-194.dynamic.spd-mgts.ru. [109.252.137.194])
        by smtp.googlemail.com with ESMTPSA id a17sm250224lfb.41.2022.02.24.08.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 08:52:58 -0800 (PST)
Message-ID: <6392f6b1-c41a-b9b9-d3c4-29252b349d97@gmail.com>
Date:   Thu, 24 Feb 2022 19:52:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 02/25] tegra: Remove unused IOCTL
 implementations
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <20220217191625.2534521-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220217191625.2534521-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.02.2022 22:16, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The DRM_TEGRA_GEM_{GET,SET}_FLAGS and DRM_TEGRA_GEM_{GET,SET}_TILING
> IOCTLs were badly designed and have since been obsoleted by framebuffer
> modifiers. Remove these implementations to make it clear their usage is
> discouraged.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

To me it's not a good idea to remove any function, you're breaking ABI.

I foresee that get/set flags should become useful.

Instead of the removal, you may mark functions deprecated to let
compiler produce a compile-time warning and add clarifying comments to
the code.
