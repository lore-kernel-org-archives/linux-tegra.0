Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E683C433DF
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 20:34:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F8C521D43
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 20:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl6kSWRT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730554AbgJHUeb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 16:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730449AbgJHUe2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Oct 2020 16:34:28 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1C9C0613D2;
        Thu,  8 Oct 2020 13:34:28 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y14so4923065pfp.13;
        Thu, 08 Oct 2020 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VtGhw982GZn5/2jIJzO1yFQfzPXCKOgYHg55HZsneqM=;
        b=gl6kSWRTalU0gQse2emeofjVMefKvJ+7B6qUmbgJbgBMlni6PL6sCsac18RkEem87Y
         aSx1jif8DDWl0CrNyexpGkI0mEm+QGmMOzRwm6/wI+TEG1wCCUWmm9/HL9v1rxQ7jpdW
         Os1PHnky6IiXhI0MMpJAqeX1M0WGyGBPHSGRnj8UED/kfzsdx/SRMXbUaSNzN8UGq1/j
         QD8wOXO6ejL5bpR8jUvdwHhuU8mESKA5Poc2OGYXoX7HOdvqQAV+HUsd1+vt+Q2YcE4L
         i1Gg9iuE+bZqPY3YMb5SLbsbBHSdaVXcXxDKKbDUR6m9aAFozyVNgRyOAbMdrErmYFMf
         FI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VtGhw982GZn5/2jIJzO1yFQfzPXCKOgYHg55HZsneqM=;
        b=WCo5xyixWcbkeXEtj8do8nIpR72Bf78S1pHYLKK61fwWwAoInkfg3SvznC32djwcQc
         jcMT41yEUReKtnAIs2/YvatALXzc8+T+qakuabQ4Gnd6XoNrjmceQSMPioOr4+E+6nAU
         uRcH+4xRmi4B33N59QR70UgdIpRTecQbw5n53C5dLBrn5iqF+8eVt4rKZmoV1e3cwYyW
         FJErqwI1MIkNOpnzP6zwHHG9d5KaoegKvQ1PzYaRAQesH95sk29cSBZfrGGFKPQj7wgY
         qmBlndZfuAqwertjaWVxBwy6/BzU68lCJF7l+ckWodhTbT+i/VtXstqz8L5Kws0k9PEx
         ygQA==
X-Gm-Message-State: AOAM533q7ymyKfBnYCrNLXgGXuHP2Ya4Ka0JjnzIT+/Wh6ENemY3mWOg
        FR/o6Me2bpMG4wVap5HSeug=
X-Google-Smtp-Source: ABdhPJz0BwAzCB5xfM16GJ/Hxrzy13WG9fwAkAYfv8cn7dmNgkv17FanejEaeAu2ttkkxYPbHDFN3g==
X-Received: by 2002:a62:60c3:0:b029:152:151e:9dd6 with SMTP id u186-20020a6260c30000b0290152151e9dd6mr8585870pfb.72.1602189267559;
        Thu, 08 Oct 2020 13:34:27 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id n203sm661528pfd.81.2020.10.08.13.34.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 13:34:27 -0700 (PDT)
Date:   Thu, 8 Oct 2020 13:27:25 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/5] memory: tegra: Fix client list and add swgroups
Message-ID: <20201008202725.GB32140@Asurada-Nvidia>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <CAJKOXPdf8YMFkoTzLhM7d51dwtH1ckGis86dHiSYpFBV0oscfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPdf8YMFkoTzLhM7d51dwtH1ckGis86dHiSYpFBV0oscfA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Krzysztof,

On Thu, Oct 08, 2020 at 12:29:06PM +0200, Krzysztof Kozlowski wrote:
> On Thu, 8 Oct 2020 at 02:44, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > This series has two fixes of tegra210_mc_clients, and three
> > changes to add missing swgroups, according to Tegra X1 TRM.
> >
> > Nicolin Chen (5):
> >   memory: tegra: Correct la.reg address of seswr
> >   memory: tegra: Correct tegra210_mc_clients def values
> >   memory: tegra: Sort tegra210_swgroups by reg address
> >   dt-bindings: memory: tegra: Add missing swgroups
> >   memory: tegra: Complete tegra210_swgroups
> 
> Hi,
> 
> It's too late in the cycle for another pull request so this will wait
> for merge window to finish.

I see. Thanks for telling me this!
