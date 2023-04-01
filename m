Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8FBC77B60
	for <linux-tegra@archiver.kernel.org>; Sat,  1 Apr 2023 09:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjDAJxm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 1 Apr 2023 05:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbjDAJxl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 1 Apr 2023 05:53:41 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4301B18805
        for <linux-tegra@vger.kernel.org>; Sat,  1 Apr 2023 02:53:33 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id e18so24717092wra.9
        for <linux-tegra@vger.kernel.org>; Sat, 01 Apr 2023 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680342812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qOhA43LmOrt8qpSaW/te4zffJ9QGZH2fj5kj0zYlFHQ=;
        b=aV9fJxI8HVKJHfqCRSmsB9pzLwNDj78SV+1sF/RdFom0TmCGg1D6C4piyaIP+CQlFj
         VY0LBD1dDk+/Xla/udoffg4SS+LjBTOb1GLmTqYdUKwhk50p1YSi40/wldJkLPviZUiV
         vAQJj6CmkuA4NiNaLmTjYjzYL5PHcUZlP13dMnQK34qAOokUXrgnanE8jXMuSJKi0k7n
         i8JiM2VUEZA7xmINNz0rOpgemjCAA/S+y6FGShUA0x7hWUcpgGLRFaqXqlsoRDdtME8Q
         0PscSrdrgv+F37isys+eBaQ2uuV3Ie/rgA4QfYY2mkFGo35nQQ7INBaURS8RvNnz5mk8
         9BuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680342812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOhA43LmOrt8qpSaW/te4zffJ9QGZH2fj5kj0zYlFHQ=;
        b=Cy3xYY5UOMx3bC4G6Bt2KVJReSSxjzlo36JSjtLVYJU9WSWJZr5nnlPJI+5I7/rEkD
         POptTtxn/xPLOhEcANF8RcOqut5ray2EVy/AQBqRd74IoMCKywRpXG2hLAqZdOfryMB3
         0VS69pAbqeRQkHP0lTZTpKRf0TB0MUCf4GFo9OMkDfyljzX4e96U89yGVekNLVVin1fu
         SY9Ni5A5ig5GyN5Kd0wvNvZPuDXHtQTXdlAevYYbNH/Iz76bZ3Hsy4xUDIlA7hbYvYze
         de+E0A625zyGMfrWRZRvl7Nj45AmjuW+VTz53Z9EMpDcjCCwE5JqcN2WwjJ566iNHBjR
         VNYA==
X-Gm-Message-State: AAQBX9c16+h7dNz/8PlQdFuj1Vz6RrrDym4Ryx++zoX72uY91rNM1XYk
        IipFov+qGNKdLkJHQotw6TanhA==
X-Google-Smtp-Source: AKy350befYly/lSC5kDrLJqEFpU6KISleaqO8PETRRTz0P/MBUQizsolm9NPaMHLFin3D8iORHoYfA==
X-Received: by 2002:adf:e391:0:b0:2d9:10e7:57e8 with SMTP id e17-20020adfe391000000b002d910e757e8mr9128945wrm.16.1680342811799;
        Sat, 01 Apr 2023 02:53:31 -0700 (PDT)
Received: from [172.50.14.32] (5-226-109-132.static.ip.netia.com.pl. [5.226.109.132])
        by smtp.gmail.com with ESMTPSA id g6-20020adfe406000000b002d743eeab39sm4470590wrm.58.2023.04.01.02.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 02:53:31 -0700 (PDT)
Message-ID: <5a8a5cfb-6b56-42e9-8e75-14a936de2c4f@linaro.org>
Date:   Sat, 1 Apr 2023 11:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: arm: nvidia: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230331182159.1900674-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331182159.1900674-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31/03/2023 20:21, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

