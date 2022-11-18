Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FB8C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 08:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240941AbiKRIOm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 03:14:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234080AbiKRIOi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 03:14:38 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FD885A36
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 00:14:35 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j4so7075520lfk.0
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 00:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVIAqFFv0kCN0rRPM8hMtsvdD/yxisYOHhG5SG0ehK4=;
        b=Mk0CQRJ0wstXRfmXaM+uKrViqR3HLGAVqBsF+5knhoK/Rhb8L6MNVbvNXJtYEgo8VU
         okSFlODxefKP/IKr2yxfC4Fo/xl+z747+u0bwxOsBszrmSRl2ZBWreHgT0uNCHZ/cKTd
         FsupcamkRL9kdmC8qEEA5inciWCVO2Wj9hg+oVldTg49ALo66x8gEtjWgZw1917Bg8Vy
         4D0hXgkgD2gtawaVCtj8d11XzG+xdbaCPC21eTtOx/1YthY+7oTqKI1DZCY42Aceijxp
         M0fAEpWWkcogbcwtqWkY2pVboqIML8/b2ZaPIjwwoJqtePbt6HP2rtpeOjUGK/NthPhB
         3cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVIAqFFv0kCN0rRPM8hMtsvdD/yxisYOHhG5SG0ehK4=;
        b=mH/x1i98pjp1hGsQBxrXd1bnsSSO/wMGF7SyKKTLY8JDMR6QvGy5Mb3UF/mdzjZrwM
         61Cd5uUpoBaIaydCG0Awjn3CAa4MQwu71heMCtpfnmq439b5rCqKNDAZdgOILMK6fVla
         hr8D0KbzHzQOtnfmuPs6ZILzOkoM3dN5wEyRa+ZK+LC+VKEVV3fEkpouYwo0r7GY+osJ
         C0GyOZiz8WSlYkNDQBTsaZSIDZXmWkhrKHW7dWZL6a/8CQ2b+5ry3I15+y34xPEuRcYg
         ffoVQDtUKM1egNWOCGvjDhLaa2U6mEc/QtzD64wvTGRMOFzrw/F3CdEgH+5THuy3Kmsr
         LvCQ==
X-Gm-Message-State: ANoB5pmG47gVOBTUbCynVu2c2475nNFO4/pduq/DjqArqHzJbAW2WVvo
        Ne39qN1Olo9PI8vwBBlMlfef1dqESr354hZx
X-Google-Smtp-Source: AA0mqf47bbPmux3j4f5zi+7tIrEZKMMqsFnA4CfXLKsMV3od5nhmKn6TPJ+Dxa8RSdLaglEdR/cvtg==
X-Received: by 2002:a05:6512:3d10:b0:4b4:1177:a64c with SMTP id d16-20020a0565123d1000b004b41177a64cmr2329003lfv.647.1668759273847;
        Fri, 18 Nov 2022 00:14:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j7-20020ac253a7000000b004acb2adfa21sm557212lfh.297.2022.11.18.00.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:14:33 -0800 (PST)
Message-ID: <d5bf5d7b-097e-a48c-4cc8-9be87f2aaa13@linaro.org>
Date:   Fri, 18 Nov 2022 09:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] dt-bindings: pwm: tegra: Convert to json-schema
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221117214248.2365983-1-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117214248.2365983-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17/11/2022 22:42, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra PWFM bindings from the free-form text format to
> json-schema.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

