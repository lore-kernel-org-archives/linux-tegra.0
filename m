Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D268EC6FD1F
	for <linux-tegra@archiver.kernel.org>; Sun, 19 Mar 2023 12:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbjCSMGK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 19 Mar 2023 08:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjCSMGJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Mar 2023 08:06:09 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2504F13D64
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 05:06:06 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y4so36847184edo.2
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=pVE7uoVyhC7NdVaNDMAae95yljmhHJ/vy720gGm9Wcwipv7UjfXSfsHinpMhTLeopx
         cr5RClkReTYivfC2IY5U5wY572ezvC1yCkHd7LIEj1HuYvbps2jMciS1PvOubx3Phpzv
         lfp5ymplUDgbfL2kaHoUaSBUbvueNoyQOpkFwxacSddt2OvHyx9V1IRGsXLNxNuNI8tR
         pzgJjPJtO1SL+S6dW0blVTikGk2hVBMbyclcg2gesIeegLGn9Mb8DIqUUNj6OWGRux4X
         VlPpEjmVgeM8W8fsbY1qaNuRHoxHO642hfuMBJ5aK+5ziENTS4/JD82wADP8gHrLT7H4
         rITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=MUEdFPN2OJB/O7w11BuDFFHSVNn2LVj6ZPX+GOeM8P933fvlGxmfxLOdo+nm6q0CWJ
         WVJ1MIETS7gy6fFOyPTNsYG+qiwXgwsKU/a7Pbb05fx2AYZoyJAwrowjYS3JPE5/ovEj
         pr5HVGKGDbv9kLBlc3yggQ5jimA8Gaa8U5FnkT3sCe6zunF8BYezPpZb95/yVt5ohUfV
         eEP3cvXggKF1MkjxeVMXbf+2ugdWHfeVPQOYuZxdjmGiHRnALnVEGIREhw+nOB9I6ipl
         JkQnO3oNMKQ4pezqkV8o++QbgMNIEhULBO233y3DZ527DkoIy5kGizWrU8bQC5po1qqy
         HOpA==
X-Gm-Message-State: AO0yUKWXX4S2VmnJFgw5ytB1RMunhS8PbscFDUCvueJJ2K5laSwwNZpk
        UpyYCPmNsxMbJIdKZlyd5gD32g==
X-Google-Smtp-Source: AK7set+IUACGutO71vcC7FVNze5yyNjfDWDHleE0EpSa6MxZnLDTstSEjlod2kahf5dchF8sAdB/PA==
X-Received: by 2002:a17:906:6886:b0:924:d90a:6f97 with SMTP id n6-20020a170906688600b00924d90a6f97mr5311713ejr.13.1679227564671;
        Sun, 19 Mar 2023 05:06:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id h5-20020a50c385000000b004f9e6495f94sm3473945edf.50.2023.03.19.05.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:06:04 -0700 (PDT)
Message-ID: <6d4dba0d-14eb-d9a4-0d16-b0c141b0c733@linaro.org>
Date:   Sun, 19 Mar 2023 13:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: display: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230317233626.3968358-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233626.3968358-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

