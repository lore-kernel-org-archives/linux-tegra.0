Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17702ECAAD5
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Sep 2022 17:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiIFRuO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Sep 2022 13:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiIFRuM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Sep 2022 13:50:12 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCDF74CF9
        for <linux-tegra@vger.kernel.org>; Tue,  6 Sep 2022 10:50:07 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x14so3164737lfu.10
        for <linux-tegra@vger.kernel.org>; Tue, 06 Sep 2022 10:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=PlneHbhh81xts+BhwSSO/bVYfamT6d9aGmPbAoBs+Vc=;
        b=oU8zne1PuAsGYTK92vBce5Sl3SAp4gnqtlqz7Dnz5qyx2mq6rB1Acs2o9mrdyalbyo
         jdFajEVxePigd0oL58M2dpQ1B5CQvLRnDTOgjhXY4GNLRBSNuKDVaR20EluRS2JVviNt
         WgHpCuo6EMnyZb3UzD2wCPkw9xngn5Ena7wTzvWr/pkScoO2VdASwDZqc5OiSeJ9t7kQ
         yehgAdUkhNUNcT1/rhE5RL6xv4WCtfPs/oHdegVKj2sdbTLqnOqiiX9/kZ1EXA2UhrA4
         J9QW3ud3vgKmcGnqqjgzxBQpHYE66ejwuoI3s5+KWnWsHnwoxUZ5AUCLKc0uFtiavzqs
         wK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PlneHbhh81xts+BhwSSO/bVYfamT6d9aGmPbAoBs+Vc=;
        b=w6S2E2x8OSofJGrHONIebHKn+9RC4qmCzVE+NBBwvquioh4O3UqdpaxDptSTko6GaG
         JSN1l+buIDXp7eDRUW2Efq5DLOD3fem0cUoUoz0vntkWxFyqRLVy58w5jNlG5S+3hsVz
         fLgGUJYPx7+DjXX6uLRwenzWTtGaldWj/FGzaAmIshGS1Y0aNBXVvgSRrq2wP4zWpw9R
         Vn6Yag2k7gjMLCV4GIqgwISxbuIRaoYfsxRovhGn/uWbwTS6r9rOyLhG92cKmIHATArC
         C81c+02XkILcjfB/QzTHwwuYoeO6nShQIK1VBlIDvoJKp9Oqnbd4QOzZYTz1m/nS0Y/e
         KsEQ==
X-Gm-Message-State: ACgBeo1oMEkQQ9z6pj5Gx2DN37hDJ9Gn4VV4NkO/2BG5InZXq6V0U9F2
        shk4iRgKB/Btj//3iaE0gedaZQ==
X-Google-Smtp-Source: AA6agR4eNuH4iEsDzOrIOC2WXOhHLUljsfP8KbsWI1cXvuZNk0fYC7d8Jv8zbKtdt4PMuM4bIeaD5g==
X-Received: by 2002:a05:6512:1507:b0:492:b9ae:5d51 with SMTP id bq7-20020a056512150700b00492b9ae5d51mr17554595lfb.14.1662486605258;
        Tue, 06 Sep 2022 10:50:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p1-20020a05651238c100b00492cfecf1c0sm1873604lft.245.2022.09.06.10.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 10:50:04 -0700 (PDT)
Message-ID: <68ff1b7e-51e1-f1e5-dac7-5419472e396a@linaro.org>
Date:   Tue, 6 Sep 2022 19:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/8] Support for NVDEC on Tegra234
Content-Language: en-US
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906132823.2390953-1-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/09/2022 15:28, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Hi all,
> 
> this series adds support for the HW video decoder, NVDEC,
> on Tegra234 (Orin). The main change is a switch from Falcon
> to RISC-V for the internal microcontroller, which brings along
> a change in how the engine is booted. Otherwise it is backwards
> compatible with earlier versions.

You need to describe the dependencies, otherwise I would be free to go
with applying memory controllers part.

Best regards,
Krzysztof
