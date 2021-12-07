Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289DDC433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 14:19:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233109AbhLGOXR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 09:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhLGOXR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 09:23:17 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30AC5C061574;
        Tue,  7 Dec 2021 06:19:47 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bu18so34076825lfb.0;
        Tue, 07 Dec 2021 06:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EzpViAY4hfgMf9dKbY1xXemf3OggLKc9MHcUIw70ijo=;
        b=lKv0vKVwcQM3x9/5DY2sRANzd116fgU4mqtqPqsokRij6YfheTNGLh3rly7X4gcT0+
         P6O2rt5RbuqLfte5IQCbpS9RhhC4CsPaUOJgnyEZxbPcEjGLGU7LRkqbZDbBZE2aDewl
         Unoc8ZbRyhsbK8DGMgsXBoS5bPUMop+gfc7MRalQJMsfORrLBT/fd0lQdn86ulmbwwju
         0zOsfKtIALYIkOlbrghsUBZRGv2CGYGWx+GWW+/BB+PrVxWvGCP7RwJtX4Wv6b11kQ+F
         ol47LOQzbTEScS9z2F/bC9jaVeeoGosZvNL7mzrC1RM9CUOiG9FGsITpfqM7g5prjTWD
         JTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EzpViAY4hfgMf9dKbY1xXemf3OggLKc9MHcUIw70ijo=;
        b=UjiE2bZ7R/Hl8MLM1qSKBI46Q5Hpp5RzaT1ruq1oSXrWW/zZsbfi33tdVRIXEtJj92
         m+tzy0RFNwOWaCrgrD3zpZlcgMyeMzGWbERZpXgsJWFIUaZh2IXdkMDkh0jceiYbfaG/
         R1D7WHFkD+cw1ROHoqFwqAPKqq6Uvuvz249VvPtVayLpgcnKlm+ZDDQKN9hp0RsjcbVo
         tsTgfjSq3ILGlQbKeSf5hZo+ncAPX6yHUA4IVR1G6GhlXwooOfVU5GGGRrMEhJg9ZxwK
         kBttqrmiVFUZGA3iG8707F9FSuwm37m4w8yPymAqBWsMloa6vD5D46ELwdPlg2EkkkBy
         WR9A==
X-Gm-Message-State: AOAM530GBYvpBH6GhnbGjjVo6Txu+paVBCCCB2tbVZGuWKd8fOWsPUgh
        Adzz2fj1F6ums+ViW++un10pboltHxk=
X-Google-Smtp-Source: ABdhPJxWgYHmlZuNQt6ek27qGF3HWOoiaiJc/PljhPk7ylpAv0FcGlfwDPTMZ9ExT8xOK5I4zBpUkw==
X-Received: by 2002:a05:6512:200e:: with SMTP id a14mr42592849lfb.370.1638886785258;
        Tue, 07 Dec 2021 06:19:45 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id v10sm667098lfe.127.2021.12.07.06.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 06:19:44 -0800 (PST)
Subject: Re: [PATCH] ARM: tegra: Drop reg-shift for Tegra HS UART
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211207101316.381031-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <91755ddf-0b4d-aa73-f898-f15ccc214804@gmail.com>
Date:   Tue, 7 Dec 2021 17:19:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211207101316.381031-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

07.12.2021 13:13, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> When the Tegra High-Speed UART is used instead of the regular UART, the
> reg-shift property is implied from the compatible string and should not
> be explicitly listed.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi               | 3 +++
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 ++
>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 ++
>  arch/arm/boot/dts/tegra30-colibri.dtsi                    | 2 ++
>  4 files changed, 9 insertions(+)

What about Ouya?
