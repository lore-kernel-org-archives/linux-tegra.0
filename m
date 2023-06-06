Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CB6C77B73
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Jun 2023 08:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbjFFIru (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237216AbjFFIrt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Jun 2023 04:47:49 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58925100
        for <linux-tegra@vger.kernel.org>; Tue,  6 Jun 2023 01:47:48 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5147e441c33so11997601a12.0
        for <linux-tegra@vger.kernel.org>; Tue, 06 Jun 2023 01:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686041267; x=1688633267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqvLNtzOcoA6lE0OUx3cxAki4G4TTRB/eUS1eKn5IiQ=;
        b=mGUB4rRPLreji445pbvUUQlFZLEeEODhkx7liEznPzs3HTP5I6/lVqmEc/EgrVP5gU
         CJ40AEdvYbTKgeL7WfqH/8rBVsVwhHg0c8w++9SCPVIfQXxE2/uiNACAZhdUzMTQ2XE0
         6Bfe9bGzoHF0BreZQCJMTJ0n5N7lSqJR5ZFUax6tE2b2hWVsSV5BqrHrOEYR8HKw6JHC
         IwDMgLhURJu3IqLYGkUY4nQ/XsAFje6gTFnbIv1A1FQ1EnjxkaVrI4Ph2ms7zeDK+e9B
         D/KdacfMbvEbTa/dZjnVjU/s4eRZGc0unCPVRdskMdyaVLn8UBU2a2mmjNQeagGUeABV
         FKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041267; x=1688633267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqvLNtzOcoA6lE0OUx3cxAki4G4TTRB/eUS1eKn5IiQ=;
        b=gTrH9y4Tj/ZuxM1DKrqFwD/tjT3Yr8d7ielLY1e03nygJk+5rT4uGsFk/QEfRRwBDa
         D0CWqPi+TzzpCZjB6J1WvYzq7KzF7m+vjKfOQn1pK6jkEgc59sEdtreeu/Uze2Qh35nq
         FgfzuL6uZ5GwlJkONvVyi09PEvkWotVEyaiAHWMqXSkOnYA77+38A+fdPc7Z5xoDKacP
         poeY4QNeQ3CqOue6CiCEHhDP79Y6UocXoLAuM0gXsknZbICoJ1+F1qsthhMYr+eDKnKU
         E0thyPqPJ00RzwwF0xt72lI3QT6RIu+R1WUNfkytz85hkRMizwi+zN+irmoC5oKZjHio
         c+MQ==
X-Gm-Message-State: AC+VfDxJj1AwUxQfcvWVQ+ZC7XaWzNoMB/HHsvdH8r8YmbY6NXal7hkZ
        sW6T0LSeJyXLXNAAr9bG68i6xg==
X-Google-Smtp-Source: ACHHUZ5Wn8CYpvBevllVEGv2YBS/ROGEmwALvyAp1heG4h3t31HB6N+lHW2q/tZnpOHN2538kq91XA==
X-Received: by 2002:aa7:da41:0:b0:514:a669:d064 with SMTP id w1-20020aa7da41000000b00514a669d064mr1683373eds.16.1686041266848;
        Tue, 06 Jun 2023 01:47:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id f22-20020a056402161600b00514aef7daacsm4775336edv.76.2023.06.06.01.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 01:47:46 -0700 (PDT)
Message-ID: <1b7829bf-698e-a076-849e-403bb9938955@linaro.org>
Date:   Tue, 6 Jun 2023 10:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: Document Tegra234 pin
 controllers
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230605154230.2910847-1-thierry.reding@gmail.com>
 <20230605154230.2910847-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605154230.2910847-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 05/06/2023 17:42, Thierry Reding wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Tegra234 contains two pin controllers. Document their compatible strings
> and describe the list of pins and functions that they provide.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - add missing example for AON controller
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

