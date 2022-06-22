Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9448EC43334
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Jun 2022 14:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240412AbiFVOZz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Jun 2022 10:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358370AbiFVOZ0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Jun 2022 10:25:26 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3004D3B553
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jun 2022 07:25:18 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id ej4so20208360edb.7
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jun 2022 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=o8BQszykOO01GSg6GqcelFQFdO6aAlqQ4V6nI9Ak9xU=;
        b=PL/Jy2/6E29/4T6R7ah0BIsvf2/tYs4P99/RVkkS2epNWM1/8L0TeK4CyZUQChD/Nr
         iwirMg82FxYllvVcN4WQY0tbm0ahAPbCNHooc8EK63IDLEns5AevQpDagl1dBBkeCPOp
         5Uhgn47SVJ6GGggGu3qETpIKjween7omIMWy0YqWc8c426EerA5HwXHznhZxFW90h3Kc
         HKWGmBe+PWvAl6/cMAS1mGBawpsmhyoUzct0G/iqk0vNcgoL9S6EF7cQ3JVESuqKZXG/
         XqNuWNP/u51ZXZDWYltK6VXhHt8YTRoaQs4WqNLBvJJTOuAjNFBeLW3vedWgBCxb6CVG
         EPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o8BQszykOO01GSg6GqcelFQFdO6aAlqQ4V6nI9Ak9xU=;
        b=6e+s/fxP2wF3paxAYIvNcSMh6P3yU4Db3ZY6egXaY28tZX1zRWdtRnOgqgUK5R9vM5
         bDy2sk0gNCu2vHBenmzYeorhpnKIs8FKrFNp2h5052Lr2CnZNBxX6z5p6gc2Q60p+tFj
         8crqyfmt5iOG9/SvmDamvvsyCS/I8TTK5CJYi40Baef7Bc/2FqT8vrYoFHReebEnR796
         hyXTrzwNYyRGSV3tJd30theYoiaY6cGarzwPKR2dMA0zlmRRQJGTNkLym9HtQ4A1ldqs
         Vh7w6ePb90aL54VO46Z/7vjfUwUGnjy7x0cp2iLenFy4X6byUFmU6yeNpBlseP7x+Xz4
         kNTg==
X-Gm-Message-State: AJIora+uVmcLhjxty6PsKuROJMBUTJIUrBUfgpF7dlEW5tMJvcR5h3B6
        7fFezJgPTF/yptWJ7jH5e2PH3g==
X-Google-Smtp-Source: AGRyM1usJfLNlqwF3SOJlrmxqF0s/Afh6Lg9nbMm7/FV4DlxjCxOcEI6qm1P5bDVYjGEghLhPUEdQw==
X-Received: by 2002:a05:6402:278f:b0:435:9bd4:be9d with SMTP id b15-20020a056402278f00b004359bd4be9dmr4383865ede.154.1655907916760;
        Wed, 22 Jun 2022 07:25:16 -0700 (PDT)
Received: from [192.168.0.225] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d4-20020a170906370400b006fec56c57f3sm9604429ejc.178.2022.06.22.07.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:25:16 -0700 (PDT)
Message-ID: <56c45859-a4a4-07dd-6166-d4fa09769d8a@linaro.org>
Date:   Wed, 22 Jun 2022 16:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 00/13] Host1x support on Tegra234
Content-Language: en-US
To:     Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
References: <20220622113733.1710471-1-cyndis@kapsi.fi>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622113733.1710471-1-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22/06/2022 13:37, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> -------------
> Merging notes
> -------------
> 
> This series should be applied on top of the Host1x context isolation
> series.
> 

The dependency should be first merged into next, so automated tools can
process it.

Best regards,
Krzysztof
