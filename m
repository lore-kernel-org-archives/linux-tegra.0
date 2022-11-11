Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D03C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Nov 2022 14:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234763AbiKKO7P (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Nov 2022 09:59:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234703AbiKKO7D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Nov 2022 09:59:03 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D630963B86
        for <linux-tegra@vger.kernel.org>; Fri, 11 Nov 2022 06:58:59 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h9so6859318wrt.0
        for <linux-tegra@vger.kernel.org>; Fri, 11 Nov 2022 06:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqD18JZ25XBUMUtHH0zhbBGxh9QuiYE6yjFZ7sPwSsI=;
        b=YbyGRx7FjfngL+DyBk+sL+IX7ifa90m55rGjcuK3pLxIGm8vjqsvtW/UHrmkfhREgR
         1lRwN00slBT3s6QeRRyCeahHlZ6ZWlsOIeuthTH1PMlpmxniWxI2VYo2lwj93QaRsqeQ
         JvoHXrh6/2ER097Jfl1kO6QMth5Lvs36obDutGnZ+YbmfyKY7F2hae4HBuN2oOvv8gS8
         a2rEOD+yenTMvUq69z7IyTksE5/5O9tIDvCfXRC8f4BuT+QCMTChPOQ0l35R0tLjmn48
         M3qvu/HBEDRdHYevjKAzB8H/ZGtpmH0AaFOxDwPLT7NZrDjRIpo8uk7ZUzMsViF7vHXg
         NZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqD18JZ25XBUMUtHH0zhbBGxh9QuiYE6yjFZ7sPwSsI=;
        b=Cjttnys1/EFFWIRKQl8VzJYOD7WG/tC7GIqrSx35jVlsn19x23IOsdPYaou78qfdJI
         gdt/LwOBG1LeMQdsFOq9UFvfxEhbRkTX2BaWneLCqiJfbjwM6rq7vxpHCuhJVio/q/06
         gI1XsXt+nh2xtW1KUwnpOukkgQ7swD8LZRAuIVSNVDeNjpsGnhT+CNwe1VcfibTZMLKN
         rR9ziYPNTHSgbKpuW/mOjuT8GqiQgETA/imHcQUDUjC7NbYKPvVIwK4UOn5Nlp6/AY/y
         nFGqD0yQ+xWxBMCvTpFoLhFTnRc0inv1JbInNzAonzWcdUJISIurJA6YWd1g04db56p2
         EbDg==
X-Gm-Message-State: ANoB5plUD2OwTV+XkS4XcNeNbovU12YMUh5Y/2JL5YSxxEdy76CrnZpd
        tQFkwVWkb1Vs0AQfr11pjss=
X-Google-Smtp-Source: AA0mqf7mk0gRQBFdKOTCbLtb+qBYr9J2oAWqpopOUdISrEEXlsgSw+kaQLcF3TBL6ocEB+HuQ1PlXw==
X-Received: by 2002:adf:f543:0:b0:236:86f2:b444 with SMTP id j3-20020adff543000000b0023686f2b444mr1489218wrp.58.1668178738408;
        Fri, 11 Nov 2022 06:58:58 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c430700b003cf6a55d8e8sm3096893wme.7.2022.11.11.06.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 06:58:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Remove clock-names from PWM nodes
Date:   Fri, 11 Nov 2022 15:58:53 +0100
Message-Id: <166817871672.522550.14503901394523047163.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104114349.1540323-1-thierry.reding@gmail.com>
References: <20221104114349.1540323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Fri, 4 Nov 2022 12:43:49 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Tegra PWFM controllers use a single clock, so there's no need for a
> clock-names property.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Remove clock-names from PWM nodes
      commit: 5655f3a6b6ea8787bee79efcb722ce61d40c6879

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
