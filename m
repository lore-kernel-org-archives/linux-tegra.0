Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548A5EE49AC
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Aug 2023 08:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344588AbjHSICI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 19 Aug 2023 04:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344445AbjHSIB5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 19 Aug 2023 04:01:57 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3056E3C3D
        for <linux-tegra@vger.kernel.org>; Sat, 19 Aug 2023 01:01:55 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9b5ee9c5aso25912611fa.1
        for <linux-tegra@vger.kernel.org>; Sat, 19 Aug 2023 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692432113; x=1693036913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3tAtsLI5s7m9t2MiJZTTVjgQTSIULjZIhCpwhV7cIA=;
        b=XNHfAfYmCzvVRA8YoZrkhI7yXULzKeAGwu3fpaguHZWgbvPjej1avmavJvxX0Q5wOM
         gE+sZbSIHp4L9fgUdsSHLOeQoIYvzZXQv6CNczaRF+VYcv6UG/NrZ7zu0dgrHyTW02Qi
         TYCglKP6b8xz8lwC3KE8NB1mi7/QGHdbthwZYKE37w6Hsz/qFdlLSEsWa8W0Vs01L/LA
         rP9GCp+p1xOy2l+6wSUoMoYbCIZl0BJngpdDatoXtZSByobg0TDM05l8z61vt1B/I2aC
         bVTwKGZ8a3c1i6nMJo2m73jwc8JBlcqNaXYrblneTuTIf+lEfg2XGNDAOyzSx+s76Lu5
         IQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692432113; x=1693036913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3tAtsLI5s7m9t2MiJZTTVjgQTSIULjZIhCpwhV7cIA=;
        b=ln8ZOYsvhDciUnu5sKxhEet5SDWmoL6Bl/1TcfUjjKhl+MjGGH2GLP1MlNCAf/PmD9
         ydki/xuBP0O0N63YD5qybRRTzVYzXUYG66P4RBcpykv65VHVvl74FbyHyy8p4ja6Pmwn
         nz2QxddModtoa9rfu0IHSjOajXEIMY9CtB/2KldO2iF+puIf1p2wMjiI1Gpk/4d3b3PM
         3B085/55l6uHdnshYuKpbSR4Is7vbODINNPJ7hKjdQAr5TIAg5T/8ZD6MxRdjS+QM3ri
         0U/chWQlh3Fttspc0zA6Oyo+4Oud2bcMXfXsNAG6CT/Gg4U/9hivv7V71VGcFC7/Hj1O
         Ge9A==
X-Gm-Message-State: AOJu0YzhAdzyV74YJxXDLFxLCO4FJ3T0dswR6lYqfLUk93DOwxk9mV5F
        BtYQGdj3r1n7lKYKW4WGDOq1pw==
X-Google-Smtp-Source: AGHT+IEsr2eSWNVpGQ7n93iLTcHZOT5L/UgXbAMJ9cTee7SCL/mCY004HJsoEq4z92AdNcbqyPGMyw==
X-Received: by 2002:a05:6512:128c:b0:4ff:9aaa:6e3e with SMTP id u12-20020a056512128c00b004ff9aaa6e3emr1260440lfs.41.1692432113351;
        Sat, 19 Aug 2023 01:01:53 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id s11-20020a056402164b00b00528922bb53bsm1654511edx.76.2023.08.19.01.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 01:01:52 -0700 (PDT)
Message-ID: <952dd160-b913-1484-c682-b5ad0f1a3743@linaro.org>
Date:   Sat, 19 Aug 2023 10:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop 'phandle' properties
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230819010946.916772-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230819010946.916772-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 19/08/2023 03:09, Rob Herring wrote:
> 'phandle' properties are implicitly supported on all nodes, so it
> shouldn't be listed in schemas.
> 
> dtschema had a bug where 'phandle' and other implicit properties weren't
> being added under 'additionalProperties' schemas. That was fixed in
> v2023.07 release.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

