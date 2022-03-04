Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0311AC433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Mar 2022 08:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbiCDISw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 4 Mar 2022 03:18:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbiCDISw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Mar 2022 03:18:52 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9064192CBA
        for <linux-tegra@vger.kernel.org>; Fri,  4 Mar 2022 00:18:04 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ay10so11475151wrb.6
        for <linux-tegra@vger.kernel.org>; Fri, 04 Mar 2022 00:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I+flpTKg5dHml1L8DmfaE4buKIPkOp2S1a3s/eAOkBk=;
        b=xJ7niO+GGxG9Panzv0vbxkO0rbOM0lt7COu6CAevUE9r3iWHD9/lR69sbvzWPrV28A
         sJ3GW41aTv/zCYJuWgvzMPPMQYlf/p24Q1oiCTnCEWcq4eA9f84VaJNT/CRkS9/9Z/MV
         Uix40rQpgdGfnoESPGEDF4HbkU296Z9rcGHxBTHSwLfWJoyokG1FnmJFONci6fo6IrWe
         WEEMKT77qGva/fyjxc56GFRlHsNqq3X1G11nXOWbVJxMaaYpcia4cbtfuL55YVzuCc9M
         XQF2WFToa/hQfnE1VClwCLrDoktrANxh5wj2MVNUkTo6qP7PEbYVb2oGxiglhmd8eCS/
         dFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I+flpTKg5dHml1L8DmfaE4buKIPkOp2S1a3s/eAOkBk=;
        b=gbbzYS8YfDNIyE3NkHykVS3tG5MU/Q68QhrSG/Y2vF/2FQ/J3dG8qZFPBAXtRmwVwX
         iL1jQIMPSLs8vevI6t+Z4uZiNFQrP792BxU7I/k4P7u54QR0QllMDT7hzA7dQ8eYvZdF
         1H4T5W+/VyEh/fI/HYrMn31FEQUPpgo94Gw1MEZusCkMfYBmMSHjaTaGGnO8f/vcvTIu
         TLEeV67tVuLmGPXmll1dqqNxmEEzWj9DYgJ+SILbRN3EyZqPMOVV2j1oogs97I/OR9iF
         qpTuUZ3ut1ZhOdDJy5/n96PBSV5F1fRwWElrgTSUMSzrOY7oE9pfCcansXlTqSq6nNLq
         rPBw==
X-Gm-Message-State: AOAM531exJ/Lb1tMJXuIO3sVmZKm58ek6EIkER4NPkFQIOPrqeZCReCk
        E3RgQV2WVjZWeEE2lbPStvGkdg==
X-Google-Smtp-Source: ABdhPJwwa5VRS/zs4BjK6Sm7CwmQqQ2MQTaT9LIqxStSjhE7VL9P2O1NzIKlbjmvWb3BsHU4fS5Qdg==
X-Received: by 2002:adf:a39e:0:b0:1ef:b97f:ae91 with SMTP id l30-20020adfa39e000000b001efb97fae91mr17478011wrb.591.1646381883394;
        Fri, 04 Mar 2022 00:18:03 -0800 (PST)
Received: from ?IPV6:2a01:e34:ed2f:f020:551f:d79e:5d4c:9b99? ([2a01:e34:ed2f:f020:551f:d79e:5d4c:9b99])
        by smtp.googlemail.com with ESMTPSA id m5-20020a05600c3b0500b00380da3ac789sm5088894wms.1.2022.03.04.00.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 00:18:02 -0800 (PST)
Message-ID: <1ed3e1b6-0a75-03e1-8698-8aa1f96fe86b@linaro.org>
Date:   Fri, 4 Mar 2022 09:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] dt-bindings: timer: Tegra: Convert text bindings to
 yaml
Content-Language: en-US
To:     David Heidelberg <david@ixit.cz>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Warren <swarren@nvidia.com>
Cc:     ~okias/devicetree@lists.sr.ht, Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220303233307.61753-1-david@ixit.cz>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220303233307.61753-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 04/03/2022 00:33, David Heidelberg wrote:
> Convert Tegra timer binding into yaml format.
> 
> This commit also merge 3 text bindings with almost
> identical content (differens in number of registers).
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thx

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
