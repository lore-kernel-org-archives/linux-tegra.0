Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E73C4708E
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Dec 2022 08:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbiLEIN0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Dec 2022 03:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbiLEINZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Dec 2022 03:13:25 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EB4B7CB
        for <linux-tegra@vger.kernel.org>; Mon,  5 Dec 2022 00:13:22 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d1so17313364wrs.12
        for <linux-tegra@vger.kernel.org>; Mon, 05 Dec 2022 00:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9HQObmrwSMX8vA4JHKJaj2b6CjK14qWpD9rpN9nU90U=;
        b=hH8EH4emacWt/i3dinMgGS8nSqTXKGuNzRdVns89xp9lootuIhBo2OtYbrD8lkN1nC
         My+UVHjJw/oudKcISaxuAMfMeXv9FW/cX5R/Vkd4B1O5WU08dx8bw7PBC+kidyn/bINY
         qZi5EgJQD3FezXn6kyyA4EJlsO+b7YSOUK7A5lZrlCP9/CHrKE+R1EnIkfjwppZsZBQT
         4KFTZWay7o3jQZ1jVQsjLLUyGtdXHx1XVkRvxjI44hT/vnfsNMlzAMnEWZWTfr8cl61h
         SdxwhsbqUnqud1MpVoNIX6o7ozKyrgJU3rXXWjygMst1MvcCv7RojdyVlzk6dj08P93d
         bo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HQObmrwSMX8vA4JHKJaj2b6CjK14qWpD9rpN9nU90U=;
        b=SA2XTqO+iT1t+GPlkjX4zW1Dvav+RgeidShkRbjqWBWqmPghCrRhUp+7yrvXe+zSpJ
         KBynvRJg31A2j+cSzKZFmgEWC6hvLMy1oxhVcaf/IVCJb8k/bIBK2XYRGs6V0Vky7jWa
         xTKmSNt2cy0A8hU5G+nguwUyOvH6RroldAmgNP5jBY15EUN4tLBqeLaX97dOynZ4i0kT
         4fjlR/3Mb70VO61Phz8MvT/eVCuQHCJKw2R8PS1oRYzQNkvp4pQDouciCDW65NgKzGdr
         vIMvcwxqxGczXwsRWnBjn0mdeqM9xovgd5ZympMyBt1XrWTnH61dRvbujg4+4mCL/ZXu
         0KTQ==
X-Gm-Message-State: ANoB5pkKBcLgE07I8o5+RTo+m/tQXZ+HVwUUKYNgyYixXBT2o7Fx/z0a
        OzQKYO0Zy90zKov/ogmHHd9Tcg==
X-Google-Smtp-Source: AA0mqf7ai5wgiIRIYciqsXgXnPof4ogfREHeWVAWQiK2meZ1Z7k5m4sdbH7en5NgAmqIhis69vieQA==
X-Received: by 2002:a05:6000:1c15:b0:242:28c9:d112 with SMTP id ba21-20020a0560001c1500b0024228c9d112mr15235142wrb.294.1670228001367;
        Mon, 05 Dec 2022 00:13:21 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm13376083wrq.3.2022.12.05.00.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:13:20 -0800 (PST)
Message-ID: <b258ce94-627f-c029-6aa5-3723a87c0002@linaro.org>
Date:   Mon, 5 Dec 2022 09:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to
 cec subfolder
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 04/12/2022 19:29, Krzysztof Kozlowski wrote:
> Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
> unneeded quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
>   MAINTAINERS                                                   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>   rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)

<snip>


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
