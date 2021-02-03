Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30312C433DB
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 08:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A464664F6C
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 08:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbhBCIcp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 03:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbhBCIck (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 03:32:40 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47592C06174A
        for <linux-tegra@vger.kernel.org>; Wed,  3 Feb 2021 00:32:00 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id c12so23160440wrc.7
        for <linux-tegra@vger.kernel.org>; Wed, 03 Feb 2021 00:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=apdTNF0/dDjo33JlirY30dcPy0Mdluii8JVXQCZ3crc=;
        b=syr1cgUVeq439dK2HvZMZmbfC0UuGaMMCA60P47g+FK8dOmODlRmxxVaAUDY8MYNpr
         oDyV97fWiHkRG9DoaUDEiS2vjDh/KEvDgjdfqv/UQvT/PQwBXmMM9bQ9TIemNZtPxwpw
         ie2B+QeaibDHT0kHWFx4wGlZJtlMIgMt9V8XFesnpXrp0pCktbzGUCzB0Nq3iVZL8Mwn
         7VsbFHLub8C16FyatrIkBGNTGkmQybZphlYdJRvQ80x1eA8vfyW2xELf3aIc6AW1MCpw
         cCgk0ZcwNzyvBKV3S3FdZbrmWMrI9KftrGniHiIQ1/9OoeZE4DimhVc3mF3m8YYgoiZ8
         1bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=apdTNF0/dDjo33JlirY30dcPy0Mdluii8JVXQCZ3crc=;
        b=k/aXtJ3RcMzBlyJ83r4E2F81HIIl++H85ZCn/vYxZU9JLPFW+JQenjsmpoDi1qUM+9
         roPcIAVhBucHBuhz7hRCNVFIxNkNjDoHTjpN/vRDObahBW81hb8ESxQhH3fvMHQxBX1q
         VrGyalEIxX0Z3lYidsx53J83tpNW6Wb7hlIPFQa7/j8nJgQSf+F7KgMgteP2jnteOOTn
         3H6COMUvjnghYhINXESJNYIWfxrpPXEV5w30bMB9vosFkqKdCn8/exYRcsHpeUTGcCzy
         5R73egG+NI011ILanyj5cSaKdjy/hRKCxfe8a6eHhDm+1A9QfGAlcL8Bc6OZegSUclFl
         VHsw==
X-Gm-Message-State: AOAM533Q1zaMlv6/c+vVG0Tdwn1nMlm+dtyOomh2R/7oVppb0CU8R8ic
        gp5pwJ/o/74jiqSEbDRv7YwORw==
X-Google-Smtp-Source: ABdhPJzYVcDMbwFXa6BCs9Ojta/M4taYxxIoBb83B8dxZ0oM1QClmWS0uM8CMmL56lRXDZcoUBVp9A==
X-Received: by 2002:a5d:4528:: with SMTP id j8mr2190089wra.352.1612341118982;
        Wed, 03 Feb 2021 00:31:58 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id s23sm1646538wmc.35.2021.02.03.00.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 00:31:58 -0800 (PST)
Date:   Wed, 3 Feb 2021 08:31:55 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, Loc Ho <lho@apm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Nancy Yuen <yuenn@google.com>,
        Nuvoton Technologies <tali.perry@nuvoton.com>,
        NXP Linux Team <linux-imx@nxp.com>, openbmc@lists.ozlabs.org,
        Patrick Venture <venture@google.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rajeev Kumar <rajeev-dlh.kumar@st.com>,
        Richard Woodruff <r-woodruff2@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Tero Kristo <kristo@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210203083155.GA2329016@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 26 Jan 2021, Lee Jones wrote:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> This is the last set.  Clock is clean after this.

Out of interest, what normally happens to the patches which aren't
picked up by individual driver Maintainers?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
