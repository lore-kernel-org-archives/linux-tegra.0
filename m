Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42EDC61DA7
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 09:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbjA0Jic (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 04:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbjA0Jib (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 04:38:31 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE612B295
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 01:37:56 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r2so4397183wrv.7
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 01:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yksAV7yHL3wN3w9c8k40mCMMPiyV1hd99TyFgaBpDUE=;
        b=Q1IgsFXQgA4vRbKnGHEV09YcIKYNHOU6wbfDCYOa/8oRhBoDcw6DOo3ZtKEAlh/hVz
         DJXrF3MPff5EwbaLVr5ax7Z1ASkgVRgaqhrum6TGTC4BF4AzSIDJb3HMsnFv3BL0KI6/
         hDyRGvdPoXOnHloSa515sLqxxEYhkDAy5I3adl8lqK6S6sLoLLXSpvC4rxcCWqU2ePVU
         g4M/iYrz5B1PflrG4UZ8+Cg4sFR761tiBYlxlG4aqy9XJdeCYl+0isoKHa/U8upK4wMy
         xZmtzVlG9Z1mYf0Zgf3inLuQupaVfE7vsRrndR0C/EA1zbyvM6leuc7wKxEh9L+cR0JY
         QEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yksAV7yHL3wN3w9c8k40mCMMPiyV1hd99TyFgaBpDUE=;
        b=1yNxDMGdTJpfvrP/OArDLew3fnmQx6dqfR9fFY4PCzCtRXNTPz6FymFw/bw6wSFIp6
         cU21TrlyMKBo01Lw26m7zl8iIczYkqin8cqBGlIBuDOpEW4oy9nip1EUqFNxIQ9CPI4k
         tHl8sykFc5e+rVyO9ZfYvAigMon7F9x42dAxkMt1KN5AQUPIFYCogXEzvsWx8XEeeH2V
         W9O9aYbm6CMw6GSPUHbM7eJud/K0bUt37evHSFnAG2MYhKkA9aOiWX5Q6EE4IjP/YADq
         jXklZUoIf/rqQ8/MLUM/J0y+sciScFFDZ22K1TVUELa4elyYqweu7nk8/xaqHA0sqxv5
         FwtQ==
X-Gm-Message-State: AO0yUKW8mJrphI6NEVP+TAUTldVcocUeVqeI0N8XQKXBLkGUfwvGfe2g
        A6ZzQuT6/EgtK3Rw5w0JGEOV7g==
X-Google-Smtp-Source: AK7set88fvpm7mZ/TBDrWIqtjTBm/K9NABW+jcJf7uWpwGFZ9Oh/xUoCN/DyAVGGqWyO2zpOiFJfPA==
X-Received: by 2002:a5d:65cd:0:b0:2bf:bd43:aacc with SMTP id e13-20020a5d65cd000000b002bfbd43aaccmr7088381wrw.55.1674812274879;
        Fri, 27 Jan 2023 01:37:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003d237d60318sm3842947wmi.2.2023.01.27.01.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 01:37:54 -0800 (PST)
Message-ID: <7e941a2d-25d9-44e0-7438-13225c87d8ac@linaro.org>
Date:   Fri, 27 Jan 2023 10:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 0/9] media: dt-bindings: common CEC properties
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        devicetree@vger.kernel.org, Joe Tessler <jrt@google.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, Jeff Chase <jnchase@google.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
 <cd803c70-faf0-963e-fca3-0edd13fa8a29@linaro.org>
 <c092c11f-870f-6520-ad89-001468ed59dc@xs4all.nl>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c092c11f-870f-6520-ad89-001468ed59dc@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 13/01/2023 10:04, Hans Verkuil wrote:
> Hi Krzysztof,
> 
> On 13/01/2023 09:59, Krzysztof Kozlowski wrote:
>> On 08/12/2022 11:31, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> Changes since v3
>>> ================
>>> 1. cec-gpio: Add missing SPDX.
>>> 2. nvidia,tegra114-cec: Correct path in maintainers.
>>>
>>
>>
>> Mauro (and maybe Hans?), any comments here. Can you apply the patchset?
> 
> No comments yet. I plan to review and likely merge this next week.

Hi Hans,

I hope they didn't get forgotten and you still have a plan to look at
these. Patchwork shows they are waiting for review:
https://patchwork.kernel.org/project/linux-media/patch/20221208103115.25512-2-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

