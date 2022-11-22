Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3021C433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Nov 2022 08:49:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbiKVItR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Nov 2022 03:49:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbiKVItR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Nov 2022 03:49:17 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8482E6BC
        for <linux-tegra@vger.kernel.org>; Tue, 22 Nov 2022 00:49:16 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p8so22532855lfu.11
        for <linux-tegra@vger.kernel.org>; Tue, 22 Nov 2022 00:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEnkh3zk4jO+MDyInigAIrpi1FWlUFSvLcU2rQzTmRQ=;
        b=KwrNqp1P7h9O4XSWXQdKrnp9jleHGWBxdWetGuugUOnrGaqRc7JWf2hvz1nHeE85zO
         tq/tkRftw/5q7lyH9RgHkbYo/Xx6ST+xmgL//90Im9eZyhzzSYhgwOOZcm49xSbfx5kU
         rMUBqLnU+v+Ve+O9r15k1JovIBOQ0vsRclfcXNH7r3HritjeRcIlIWcSL3BOZJ5sBMHG
         FXXJNWvpPxhKwmYhTNSSgDH9p92dYPe9LJ7b7Lnx94OspR7cqLq0LS96rkydHMVTMWGN
         HxVyoLAuHPF0AaUpfdSqLwsKnmRyM34boTp6kpvqQfqYi/4QDOfO5TDOsGm1Em5gnkdP
         xnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEnkh3zk4jO+MDyInigAIrpi1FWlUFSvLcU2rQzTmRQ=;
        b=1UndtWOlDU7ARRZXMRwWJUDq8kd4hu0BZxtRnVxH73yvM3+gLm2sfVtFH7e+m4vhPX
         fn0SA+8FsyhzpP2mt40cm7Nq3UlWs01gcXP8Mn/w2Z5JF1jZygMwVhrOL1y+NhY2DJOd
         jRQAnAfmwmKMiDuAxEiFH8IYGK8djPflxpZq+37oPcOLyBoSNldeocBZnzGE8MFr0wik
         GXqFm5emWWJcts+pcIgWdNMUSVHprL4BrM0cgCoOd73vicoxiKd5LhKWtKPHAMRD9CVD
         mqeNms3dHnVsRExIyWWOKV1w76Gvw8K60iHe1Lpxqf4szH7okd7k7Ce6gDK0kwCtVHdm
         r8Vg==
X-Gm-Message-State: ANoB5plAJWHI/RacGPMRT+1iRBnlMLB9M1isWuYWkvVRxABfXi7R20I0
        FAsemRQ8V0NqONg7iA23xywRDg==
X-Google-Smtp-Source: AA0mqf4r+HSOOP4lvZPpqedwiqd5uq37QoTBeb8cGRzkem43lIfDYDA63nIfFrpb4g0hBbDIy3ZvfA==
X-Received: by 2002:a19:3818:0:b0:4a2:4e8f:746 with SMTP id f24-20020a193818000000b004a24e8f0746mr2325218lfa.528.1669106954522;
        Tue, 22 Nov 2022 00:49:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id dw7-20020a0565122c8700b004a91df49508sm2403562lfb.177.2022.11.22.00.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 00:49:13 -0800 (PST)
Message-ID: <53909e4f-ecab-b942-82cc-3b882c7d1938@linaro.org>
Date:   Tue, 22 Nov 2022 09:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: Move fixed string node names under
 'properties'
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jerome Neanne <jerome.neanne@baylibre.com>,
        Andrew Davis <afd@ti.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20221118223708.1721134-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118223708.1721134-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18/11/2022 23:37, Rob Herring wrote:
> Fixed string node names should be under 'properties' rather than
> 'patternProperties'. Additionally, without beginning and end of line
> anchors, any prefix or suffix is allowed on the specified node name.
> These cases don't appear to want a prefix or suffix, so move them under
> 'properties'.
> 
> In some cases, the diff turns out to look like we're moving some
> patterns rather than the fixed string properties.
> 

Yeah, quite confusing.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

