Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4915C43381
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Feb 2021 21:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98B0464E05
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Feb 2021 21:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbhBLVZx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Feb 2021 16:25:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhBLVZs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Feb 2021 16:25:48 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49957C061788
        for <linux-tegra@vger.kernel.org>; Fri, 12 Feb 2021 13:25:08 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id t15so819400wrx.13
        for <linux-tegra@vger.kernel.org>; Fri, 12 Feb 2021 13:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YjjHCq+AaBj0XRYyjJcKHPRmimymXfzCaBl7Q8eWwy8=;
        b=g/+ng38wC9WYIlhYgvh782IXg97sbu5H2bHQg1fy7G4fxRCDUpCXZYdC+JCdpR4XNl
         Yw5Ma7Df7VSTosK+Dg8OVl4GkjbrkQcBOr9Xiq3HfIy9rrvpOLM2OJiDkwlwkM0SFDI7
         UHSwSicLZ6LJXAz3TisYUsBt/xJ8jWyYX8BzM2Lo009dLjxp53FC9tvnepVgjRZMbFd/
         bXLNUHrFZbj2ddXflBkWLstEStL9n2VuvHN0mRzmIUfonYou48N1YYdJ+uVOhxISaRBi
         OG30sLac+3Ch3ksBfi6z1dNsNZnNSXnslZ3W5X7fM7+KJoRbR9grInEhcZoLtiUcbf2V
         /IZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YjjHCq+AaBj0XRYyjJcKHPRmimymXfzCaBl7Q8eWwy8=;
        b=hm0TUd8VyTsUrUC5PlM10QaZLSqylGG6HTEb9mHV4XlEqNVhLhvcYozhN0yU1SAuaJ
         l5efZVeIRZ5ChYp8IlVO2VeQdTJQMWWaPhNShjhGC9kI4Hqqa5Ie3Ez9zN1ik7ErbiRL
         5sWFWbtS8XTMZC+4US7hqqFbQe/0uq114tVjd7BLFQjfgf/9jC/D/YsTPih1rHE4J/ex
         lAjNLXC1alwVj7orLm5gQyXvr3AOMpxBEQWSwzkO5O+AJdbQS/bFfoKhsf2saNCW8rOL
         j+sRmcSPgkzJJudwwZAOj7qxpHHN2ui9vn4Cm+Og//PYDfMdKRFO/ovKU1wV/ubdhM+y
         bjOQ==
X-Gm-Message-State: AOAM533+usukWjlbpQfbuChRwUsisIn86TJz8JHb385ascXWO9ahtpzy
        41EXOuzmoKK1+or5h1sj4LAbHA==
X-Google-Smtp-Source: ABdhPJyceRwViwNbQKYFvMrDwH6pKxFiN51zbBbWqHy07haY7AmOeuB1Eg6qPAAr61Zco1QGQRaiqQ==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr5614295wru.407.1613165106841;
        Fri, 12 Feb 2021 13:25:06 -0800 (PST)
Received: from dell ([91.110.221.187])
        by smtp.gmail.com with ESMTPSA id a16sm11571760wrr.89.2021.02.12.13.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 13:25:06 -0800 (PST)
Date:   Fri, 12 Feb 2021 21:25:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
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
        Tali Perry <tali.perry1@gmail.com>,
        Tero Kristo <kristo@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210212212503.GC179940@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
 <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Feb 2021, Stephen Boyd wrote:

> Quoting Lee Jones (2021-02-12 01:20:16)
> > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > 
> > > Quoting Lee Jones (2021-02-11 13:10:54)
> > > > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > > > 
> > > > > Quoting Lee Jones (2021-01-26 04:45:19)
> > > > > > This set is part of a larger effort attempting to clean-up W=1
> > > > > > kernel builds, which are currently overwhelmingly riddled with
> > > > > > niggly little warnings.
> > > > > > 
> > > > > > This is the last set.  Clock is clean after this.
> > > > > 
> > > > > Is it possible to slam in some patch that makes W=1 the default for the
> > > > > clk directory? I'm trying to avoid seeing this patch series again.
> > > > 
> > > > One of my main goals of this project is that everyone (contributors,
> > > > maintainers auto-builder robots etc) will be enabling W=1 builds
> > > > *locally*.
> > > > 
> > > > This isn't something you'll want to do at a global (i.e. in Mainline)
> > > > level.  That's kinda the point of W=1.
> > > > 
> > > 
> > > Agreed, but is it possible to pass W=1 in the drivers/clk/Makefile?
> > 
> > That would circumvent the point of W=1.  Level-1 warnings are deemed,
> > and I'm paraphrasing/making this up "not worth rejecting pull-requests
> > over".  In contrast, if Linus catches any W=0 warnings at pull-time,
> > he will reject the pull-request as 'untested'.
> > 
> > W=1 is defiantly something you'll want to enable locally though, and
> > subsequently push back on contributors submitting code adding new
> > ones.
> > 
> 
> Why should I install a land mine for others to trip over? Won't that
> just take them more time because they won't know to compile with W=1 and
> then will have to go for another round of review while I push back on
> them submitting new warnings?

The alternative is to not worry about it and review the slow drip of
fixes that will occur as a result.  The issues I just fixed were built
up over years.  They won't get to that level again.

In my mind contributors should be compiling their submissions with W=1
enabled by default.  I'm fairly sure the auto-builders do this now.

Once W=1 warnings are down to an acceptable level in the kernel as a
whole, we can provide some guidance in SubmittingPatches (or similar)
on how to enable them (hint: you add "W=1" on the compile line).

Enabling W=1 in the default build will only serve to annoy Linus IMHO.
If he wants them to be enabled by default, they wouldn't be W=1 in the
first place, they'd be W=0 which *is* the default build.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
