Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B31AC001E0
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 07:20:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbjG0HUI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 03:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbjG0HTn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 03:19:43 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8B95B85
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 00:12:54 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-522294c0d5bso725110a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 00:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690441916; x=1691046716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QOOvb2lxs5KNQiT3Ck5hNvYTv2ynGtd6aIqYJA0ds8=;
        b=eVHJzIGBwIbRrPhbGk1Nty1NZpje2gznL4CsPzlhsXf1MaIVg2H+C2GBkhnZYMugIW
         2fBe86eUJhaZNS7ZL1WCEGqULzJFWJdG7fo6yV4t4MsS7HhAP5keEq+hYQuWAYQpL3rz
         HSnwzrRGfQbT0VpbXjxtUznTBccEm8bWw3zmlC99nET/vNwj6CcQ8a6AXuKiZZg1TxLr
         fAa9FSw/sYlf/UHQZ5kShQ2v8FN/zyEDM28Tv8pSoWLMNcW5xuwVccptDEBYNoUc5c4q
         ewr3aZQFi+ptYEE/F8+PXNwz/CycHI6PWN5pCQlKlkptT5uUQ+7Cn/skC7t7nhd9Yo4W
         z49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690441916; x=1691046716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5QOOvb2lxs5KNQiT3Ck5hNvYTv2ynGtd6aIqYJA0ds8=;
        b=bslCjNuKObmtTYQW2EvakS4FM+1b0JLCFu/ZuXqnJ42VbZxWO+Sjum0hxbXlxKjF2G
         UNpow7vCsglrQcAb49o2acI6EPEFt6OYUAaUq6d3wyuw3A8xvCbnth5R9oFOM2PwaIAH
         HmkKb4LpWzUYaIs5Pku+nP2niT8oiuFexsRKB2bKlNlEvnwFyZ2LjiSnVVLKmGA6iT83
         FR78yGGb5214tziKb1DwGaKs5kkgaDx4DkuFT1k9do7HBwjxY6BtI1/YUOs2rGkDlSxJ
         hKzDnttOAk89vV1oOpm9F38El9LyHPJG17DQJhVTEN2obASqqWzIPmlSTKh5/hs0r5es
         2Tpg==
X-Gm-Message-State: ABy/qLY0M73XdtmF4PM474/sEDZBSuEzxIRmLDXPGOiwK6SAsxe9ME51
        9XXZAHHRRFd1uBF94N7dVpoJwg==
X-Google-Smtp-Source: APBJJlEk+a7Hc4KZY8z+a3kA1RrbZrEBWfhKXbd9tM/WcJrmSVGTnPKRSkbCMiz2Z+9tryjuaeU6Gw==
X-Received: by 2002:a05:6402:5179:b0:51d:e30b:f33a with SMTP id d25-20020a056402517900b0051de30bf33amr1049991ede.34.1690441916468;
        Thu, 27 Jul 2023 00:11:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id o20-20020aa7c514000000b005222dd0b2fbsm303259edq.92.2023.07.27.00.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 00:11:56 -0700 (PDT)
Message-ID: <97a8d6a5-c953-cb40-7591-a0494fe17bd5@linaro.org>
Date:   Thu, 27 Jul 2023 09:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Move Chunghwa
 CLAA070WP03XG to LVDS
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726185010.2294709-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26/07/2023 20:50, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Chunghwa CLAA070WP03XG is an LVDS panel, so move it to the correct
> bindings file.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

