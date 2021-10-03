Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E8EC433EF
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 01:28:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E776611EE
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 01:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhJCBaX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 21:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbhJCBaW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 21:30:22 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92C0C0613EC;
        Sat,  2 Oct 2021 18:28:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j5so50202000lfg.8;
        Sat, 02 Oct 2021 18:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yjshii52Iyg29B5NjEXsG2ISKZmSXtjADfd+r1gDxWA=;
        b=Mw+gr+uL3QSdPNOmFkP/RJl2hMxNGmLErIv7yQHbrOVFqDi9rBceOZf2EY8BcGjj1Y
         tV/QZHoV/NllCc4ed+5FHvlkWQ2jrSsJWFMYvR9ww1yw3P3qCUm/SJ8Nj7pZuG4UNp2e
         q//nuEvBkD1WwuoyQ5iRZez9KhISRCyrVPpTWQ3jSwwjyUQVDelRO3SqhWmur50zp0PZ
         rB1K7Y8yYIEsvUBoE5b/6U05kibDskOtnPxNeqwUkWrDBbxLTDrOZ9rwAEBSO5mOILZA
         0GEoASQq3Y0csr4cPhGo6jWcWsI2XE/zC+NlboolakiKILSpKj3DNM1YhtldKzmmsKph
         ka3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yjshii52Iyg29B5NjEXsG2ISKZmSXtjADfd+r1gDxWA=;
        b=BDkihNVV8I+M1xIwH8uflbzLUKG7Adw/S5e4uUoiqtbyfVJU/i/qrDgnmDAhykjLsh
         tc6Wlk09Av5WPDHwJHbKlK+mJDZbt1jgloJgav0DN6N6CZYpS1YDG4p6yku3OhUKEkW+
         vWgOUTvHxDcHZ+hQo8Z1Dy7SCo73RyLuZSvamrVsJjNqxyfR+jSToKbAhS/hh0uLCwSv
         SItC4xhpdd/ZoHRt7T1rVPujD35E7L749Deh5jkImEY+X6Eu6npcBAiMtwh+FyS+w47m
         FJ8Qe6A/d0hCwYxn4/RbrlVZcXMD6nMuNIYoAzOpT8Z5fpFZtDN+apPDQWgpCr06gEby
         xM4A==
X-Gm-Message-State: AOAM533ipH3oTKxEVczykjPFtDdybIM9Q2fWNB3GDTt7LzvLqlRP7zMI
        EWngnrfRs9PGKOkmf42xY4le1xQ32Wc=
X-Google-Smtp-Source: ABdhPJw4TsNZmcUKyfhmlxqszOOTZ4TR96sjB1wjs8/7MtdH3c2EumaKK8PnyA/uOFQj/fQQ9rOPZw==
X-Received: by 2002:a05:6512:214e:: with SMTP id s14mr6610327lfr.588.1633224514069;
        Sat, 02 Oct 2021 18:28:34 -0700 (PDT)
Received: from [192.168.2.145] (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.googlemail.com with ESMTPSA id u18sm1102880lji.136.2021.10.02.18.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Oct 2021 18:28:33 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] dt-bindings: memory: tegra20: emc: Document new
 LPDDR2 sub-node
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211003003509.28241-1-digetx@gmail.com>
 <20211003003509.28241-3-digetx@gmail.com>
Message-ID: <9290fdda-65f4-70c3-fd1f-2872824795d6@gmail.com>
Date:   Sun, 3 Oct 2021 04:28:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211003003509.28241-3-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.10.2021 03:35, Dmitry Osipenko пишет:
> +      lpddr2-configuration:
> +        $ref: "jedec,lpddr2.yaml#"
> +        type: object
...
> +
> +            lpddr2-config {
> +                jedec,lpddr2-manufacturer-id = <LPDDR2_MANID_ELPIDA>;
> +                jedec,lpddr2-revision-id1 = <1>;
> +                jedec,lpddr2-density-mbits = <2048>;
> +                jedec,lpddr2-io-width-bits = <16>;
> +                jedec,lpddr2-type = <LPDDR2_TYPE_S4>;
> +            };

I just noticed that this is a wrong node name and I missed to run
dt_binding_check after the last edit. I'll send v3 with the corrected
name shortly.
