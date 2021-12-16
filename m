Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A35C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Dec 2021 14:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237430AbhLPOsP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Dec 2021 09:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237402AbhLPOsP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Dec 2021 09:48:15 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80090C061574;
        Thu, 16 Dec 2021 06:48:14 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id d38so5754696lfv.0;
        Thu, 16 Dec 2021 06:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NoO8FVrwsHi1Mh0Zg2ta+Np2h4ZjffVGdlQs0RE3Haw=;
        b=aIbDGNQZZuWOLffbUk92cThH8Z9En5uMm2x6FMw8nN+cX0TTek7FqCENcPKe24qUua
         fvZ3lTEpHSKFOO4Ehq1w+hyGJ1wqOHOxZgLP889/5tXniKCp1paqYtdFUkP6xlyMhuVx
         hojHg9wj0eVTxgkeDkEz3f75FfNAnv9wB2Un+0BqXNC7dEsLv0y06t5oFEUsl+/OOijP
         nHP9Z0jA1Fa9MXLxISxYa3N6i6eofbOR4DPk9gcKbDUxg6IFb26uS89nkzE5GyYuD3CS
         QSLHhwa3BHaEtKXl5e/J3a4yI2a1w7QRQW6WylicYF1d2U1xOJiPDR1vs8bJwmCZ9Q+w
         JYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NoO8FVrwsHi1Mh0Zg2ta+Np2h4ZjffVGdlQs0RE3Haw=;
        b=VUDIkj3OmhGaSOB/KvolryyqbVM7Fn1fpXAlK6my2Zrc41mzna+QyU19xOG82PLRcN
         8+yDCNT65yOIV+1eDdRkVHK9fAFu5wEwAl7Cx6XSdzvYjWuPCmEKRr4U1kEkFDyqkqaK
         xLvzxnY7R+lux+312hZOoFjGbRHy067onJoB72aOE10Dvj2cbfk9jMrnkIbB009f9VGT
         lJPUtcqrw6WmjVc650/BNYHn+FGdM7YIRVrASiPta/Z4LuW+DzTv/tEhTHnMzzRO2mqF
         G1IuUWauxLZy7VJPA7DU4uFSvoDTxhDNn0a4s+mIso2TA9/wn+2hKb/zwURHNIv730HM
         WBgw==
X-Gm-Message-State: AOAM532VeLnPxg82FAZ2+Sx0fRAo6+o0tmSNhHq9Fodre4BVV6/VoDcq
        nqTtJsNhcQCHcZi16p/F0w38HXMD+8I=
X-Google-Smtp-Source: ABdhPJyYbLHPIgy9eUTLiAVWNRZ0kJPZjcDvnuIO+nB+f0bfKUgMwSaaaHxY+CrbSxuS/tFGLNeQIw==
X-Received: by 2002:a05:6512:130e:: with SMTP id x14mr15391321lfu.366.1639666092696;
        Thu, 16 Dec 2021 06:48:12 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru. [94.29.63.156])
        by smtp.googlemail.com with ESMTPSA id v6sm908353lfo.19.2021.12.16.06.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 06:48:12 -0800 (PST)
Subject: Re: [PATCH v3] dt-bindings: display: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
References: <20211216142012.1479213-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c935b4d2-984b-e08f-6125-0ce390519b45@gmail.com>
Date:   Thu, 16 Dec 2021 17:48:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216142012.1479213-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.12.2021 17:20, Thierry Reding пишет:
> +  resets:
> +    description: Must contain an entry for each entry in reset-names. See
> +      ../reset/reset.txt for details.
> +
> +  reset-names:
> +    items:
> +      - const: host1x

Could you please add the optional memory controller reset to all
bindings or are you going to do it later on?

https://patchwork.ozlabs.org/project/linux-tegra/patch/20211130232347.950-8-digetx@gmail.com/

Ideally, you should add the MC reset to each binding, so we won't ever
have to add them once again later on.
