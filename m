Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53A0C0015E
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 07:20:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbjG0HUR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 03:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbjG0HTt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 03:19:49 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE18F2D56
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 00:13:04 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-992e22c09edso73436766b.2
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 00:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690441924; x=1691046724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZq2MeivEqSHRkBO/qVMzQytuDJ9NC8npO5moiygy8U=;
        b=k4j8Q5+eKCeNG368L0gpCrKFo7yFuKjNXIuV6rpNdzHK6o/JQ0yMlVaOWytInQkDge
         kekMA5dZz6m054Ew3nUAJG3w2u3Icojle2rdTT2l29r7Z5+qaQDL9+uZyZIhKWjFyne7
         NmjwBFSPfwRvnfaC436oKBIj13SHkQA+IlRtzPAsnO3K0pFgx4dEFQ03xGubi6zJ18ra
         cVdQFw3ULv+ALkublIl29FsjGoSwcLjrOToJLOkY9lQCpWZsK007KAY9WvSIwq9pd/FG
         ra3Qj8wwyv1y//OIldlrc6Gtsct3XpY1XaFw9qqbgp83goyMIpeidHU/5GQAyUe5R28n
         y5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690441924; x=1691046724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZq2MeivEqSHRkBO/qVMzQytuDJ9NC8npO5moiygy8U=;
        b=SuXuGZZwZyDqa1weOrFL1z/GG5+H0vToKqEBcoz12cddcjYzUZbe6qco0rxzhHo1F2
         8Plrko8X+rbQuZpEeWrGaU93JN6OBSkWCMRf/m3JlHKFfD8bqccnX26JilD9KkTa+DTS
         iCZIPJknikhlZOUBGypFN5/eRn0EoHsiszMCX1wcj7fbVAhh0HN3TZfH7SV/9rARwrpD
         aue3eLG3OPRUO4f455h/Mg5YQgV/bmM1Sja6fkptwQVlMf3/29mFgXPX2ppP0jQ4BNhV
         K50Q/EdL2/5/iZOgN3XKsEp/kmkVMbpGP3rVjiqIBgL0Cv5TA8P8J9QR/6RdbJsoWKLg
         WrEQ==
X-Gm-Message-State: ABy/qLa8/5LNSfm6iay5lo8OJHsH4f7df+IBBjAuvV6tIg6mb/lqJaEo
        vu8mgJszRMLJ0qY8y1b6uTDUNQ==
X-Google-Smtp-Source: APBJJlFygRKCjhls9utd0oUM+NPPuz/OCQskSU3O2UcGkRKWA2YdrnyWFdID9D2zwrd3Fy0S4O6tBw==
X-Received: by 2002:a17:907:761b:b0:99b:4aa3:6480 with SMTP id jx27-20020a170907761b00b0099b4aa36480mr1383272ejc.40.1690441923907;
        Thu, 27 Jul 2023 00:12:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x20-20020a1709065ad400b00988be3c1d87sm411792ejs.116.2023.07.27.00.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 00:12:03 -0700 (PDT)
Message-ID: <8a48118e-8f86-1506-e93a-0223981809d4@linaro.org>
Date:   Thu, 27 Jul 2023 09:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Document Hydis
 HV070WX2-1E0
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
 <20230726185010.2294709-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726185010.2294709-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26/07/2023 20:50, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Hydis HV070WX2-1E0 is a 7" WXGA (800x1280) TFT LCD LVDS panel that
> is one of the variants used on Google Nexus 7.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

