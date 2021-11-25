Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CB4C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 03:02:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238845AbhKYDFj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 22:05:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238772AbhKYDDi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 22:03:38 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7972CC061374;
        Wed, 24 Nov 2021 18:18:22 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b1so12162576lfs.13;
        Wed, 24 Nov 2021 18:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oH9Wf/bCoVOg217LfdMoYUSgPjXtU02E7tSuaqxWMRg=;
        b=a3PBYNYAAcgi1TZXNVqrpSjlO4HapMS90v4JQNwRGoxgwyRr74YQB0CVRb//bI41pL
         6pNSCy5wG7I1vVxO0z9X2Bg5gk3NuuvBLRrOotseaFkyLTeiX2JiF1dLA0OeoTcS/RGg
         Q9H3kzbos5THo5yUaeLm4c7P5AkcERHEYQGNRg8veLS/RsNSrvYi+IjN/7ddv7drxn2o
         1N4q1Y+XlljgLGbYigdztD7fpRc6TWrK/QVAUrAI7QL3G19yBsiyBqMEZ4DIG6BERcF1
         o+9jtoDW2zh0WmzYLJeutxGniZY0QYQCfcWyeXtnsD/4Amx8u+tH7pAFRuStmtT4SeV9
         MN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oH9Wf/bCoVOg217LfdMoYUSgPjXtU02E7tSuaqxWMRg=;
        b=mzPi+nu8gk8isLOQxahOmG1mWKtm8zQ7cKMtGQdUcxDobVnCLvS/qkiKDY0MjE5LCu
         aoN5d3gN3Rzv+OcxXW8XScXiUgfAExcsfJNSNoJLy4Bf305tHEXvtqClWKyTqYo4cCKW
         TjPGV7ra/jlpFpqDh8Cpp9Q7SfEaQ7CZLn4DRrJOuooYjwGiAg2LDjo3AO2XjtasO4Id
         lNV2qqHzudPu68ye1ZzBVedVmj/12f3LZxQhg0ix/nRuDjzhLsegNT22bKcIsrd0WXvb
         aeGF190fHksT0R91R7NH5+o9cgSDCHqUBEoooLGQhvKYaa9yO5zU9YmPTbeqDWZAZWQ9
         3glg==
X-Gm-Message-State: AOAM5311EwDTsOwcrG1VItHQTdlJmpTUIyErE90qr0B1pJff2BpV1tol
        WBqnudZtWTq3lmuOijrKn1SesHZE7Po=
X-Google-Smtp-Source: ABdhPJwQvFDJcTZLyU54104ekq6m0/v4CmZYU+nu8u1y7IOzZ2X7pM5sbP+It5lOSDCeG4E2gRSy9A==
X-Received: by 2002:a05:6512:3d8d:: with SMTP id k13mr19266189lfv.672.1637806700554;
        Wed, 24 Nov 2021 18:18:20 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id 27sm135095lft.299.2021.11.24.18.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 18:18:20 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: sound: nvidia,tegra-audio: Convert multiple
 txt bindings to yaml
To:     David Heidelberg <david@ixit.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     ~okias/devicetree@lists.sr.ht, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211025171927.92332-1-david@ixit.cz>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <49fd57aa-05a1-b330-6684-31c80339e56d@gmail.com>
Date:   Thu, 25 Nov 2021 05:18:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211025171927.92332-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.10.2021 20:19, David Heidelberg пишет:
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-alc5632(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-alc5632
> +      - items:
> +          - enum:
> +              - nvidia,tegra-audio-max98090-nyan-big
> +              - nvidia,tegra-audio-max98090-nyan-blaze
> +          - const: nvidia,tegra-audio-max98090-nyan
> +          - const: nvidia,tegra-audio-max98090
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-max98090(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-max98090
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-rt56(39|40)(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-rt5640
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-rt5677(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-rt5677
> +      - items:
> +          - enum:
> +              - toradex,tegra-audio-sgtl5000-apalis_t30
> +              - toradex,tegra-audio-sgtl5000-colibri_t30
> +              - toradex,tegra-audio-sgtl5000-apalis_tk1
> +          - const: nvidia,tegra-audio-sgtl5000
> +      - const: nvidia,tegra-audio-trimslice
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-wm8753(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-wm8753
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-(plutux|wm8903(-[a-z0-9])+)'
> +          - const: nvidia,tegra-audio-wm8903
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-wm9712(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-wm9712
> +

I'm now wondering whether these patterns need to have the end of string
"$" mark, for completeness.
