Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0349BC433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Nov 2022 12:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiKOMQS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Nov 2022 07:16:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238370AbiKOMQN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Nov 2022 07:16:13 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1B622516
        for <linux-tegra@vger.kernel.org>; Tue, 15 Nov 2022 04:16:12 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id a15so17239688ljb.7
        for <linux-tegra@vger.kernel.org>; Tue, 15 Nov 2022 04:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8a2trAk20zeNjRwRS1+8oYlaEQHwTwjT9p/pnuw5YU=;
        b=dVbIYOtdGkdVqly/KvZDhArnIz9Fg5uIJ7HwKYzGD5l3QqfLqCS/BgEctba5QO/jRi
         QrQrKowMdp+yub+BQE1jtloLdOnm4gFG4hi7EbaGD5AcNAOYhc3KlzgsrLOXoGQotw3b
         cz5E8/tR9A3SbwixqCSFycD2rCk/lxKGiiAcMPp2DgvE13Q7dEZm8DKTfduPgzfj9pdx
         CoVW2rzOHgAK/Qw/35cnKfyG3+lu7BYhpElAPXD65RgK4fSTncSy5LSU/tI6ZnOQmJPJ
         zsu/wY00PJYxTYXIcaGFou97tq3YGcZvHLHeKsDErsVfV3MY0ps3JFlKnUhwlcCqnFN8
         H7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8a2trAk20zeNjRwRS1+8oYlaEQHwTwjT9p/pnuw5YU=;
        b=w7pS7HZXNbbjh974I6L93fVgYx+cq2gy4D10Mt6cnkgcF/En/gsVgFPmvPN0DuEbgQ
         +mVGgDvZgkftcn1Q8cvaKMxBhFdFJOYYr6xIIIapdY8V/pTKxotXTP7S/tTMQAGH7yzl
         2n5CApHzO1tWImc3+GyRhW2X+XymCyCEAiop+1OkkrSvuo//E6t1bVOOhVvLDzfgQVg3
         1mPSS4Rgp4B+5rOHyW3/YFwPOAQQKqUl7EVOwDYnfO7nNwzP68Zay1sOzTE1DbHmM0hi
         t636swKfW3VpLaZQlxPDnnn8EfWv/W0E9rNuVLoTFbjtxkbsUJxp9y6bJWikLpfYshCN
         dKhA==
X-Gm-Message-State: ANoB5pksmTYRJPrXdg1+ZWrVTyo9ntXw3qIqv71T2sN1oZzfyFijDa9a
        huIGdbmtGWUmzxdvQ5XcdLp4sg==
X-Google-Smtp-Source: AA0mqf4WeDRLRTpDDIEIh3ypaNHFe3jqjG4gsVQVteBMWm/oxYn2XR1BnUd2CwXWpgdeL568DSRP4Q==
X-Received: by 2002:a05:651c:904:b0:277:1d64:f21c with SMTP id e4-20020a05651c090400b002771d64f21cmr5984950ljq.373.1668514570434;
        Tue, 15 Nov 2022 04:16:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b13-20020a2eb90d000000b0027781448499sm2489000ljb.85.2022.11.15.04.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 04:16:10 -0800 (PST)
Message-ID: <9d894b13-78f3-bcd0-28ee-911e09799426@linaro.org>
Date:   Tue, 15 Nov 2022 13:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/23] ARM: dts: tegra20-tamonten: add label to avdd_vdac
 regulator
Content-Language: en-US
To:     luca.ceresoli@bootlin.com, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-5-luca.ceresoli@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109141852.729246-5-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Useful to enable it from a board DTS.
> 

No, it does not make sense. Adding unused labels is not useful. This
must come with an user.

Best regards,
Krzysztof

