Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB26C83011
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Dec 2020 10:06:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2D0420705
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Dec 2020 10:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjLGvvbX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgLAKFw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Dec 2020 05:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgLAKFv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Dec 2020 05:05:51 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20669C0613CF
        for <linux-tegra@vger.kernel.org>; Tue,  1 Dec 2020 02:05:11 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a6so1929206wmc.2
        for <linux-tegra@vger.kernel.org>; Tue, 01 Dec 2020 02:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=14bf6bn+oj8PMyR0sJXDa7vt6hfR/TzFTELJbHUC7s0=;
        b=FjLGvvbX1fS+Lzs7Jouwk4Xu5zby+fhb4SU9TD2AE3FCHm8BPNZ/4cQd8SjrL4teyO
         pIrlUihpdldsh6VzuqjFbQapRtHM/oN3isKB/EtTzfLNwGUKynKjH85fbuEntqzz9l/M
         zF/SRCOBE4zD/aC/w5Xthj9RhPGPgnmrL1Rz6FLJ5TDvxvdmNo6KDHxdQhrfzeBvtEDD
         7j2t4XSgW0acxS83X/ur3/Z7Yiq1aV+ISZfBRWfznhvkhv84rEvGPp6dBSgEpeJDwi6p
         32U1wPJILW50xkF1pYoC8QGnRQPruXD1wlIYhAik+Nvz7XfPhgPfeX4tn2phCkRisXbC
         h/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=14bf6bn+oj8PMyR0sJXDa7vt6hfR/TzFTELJbHUC7s0=;
        b=TdKpFbHoftjw6FxKSKIstn01RJmjGY+EajOu1TMU4LnNdm+yfflpz/JAobchgIvnF9
         +eFbwoZgE2NMNbIkXhWHbBGrnANFt6LNY4vXSD1puuQDf24O6hNWCwzVvIU6oDyUXgS+
         B8drTstIP21aYVhK0AxQARrCjjrmqBwZVd6+BISPN7wDqKl50pp1f1zG1dGQQ0lS3iCf
         C7LcqakHhDrempq4617WgYmktNl8ykJ9zW8RiN457rJTui9CkOMeATYer1jY4YWZnZ+X
         QPHfh/T0qQMASpugVLEPrGvYXI8BYgnJWGeDeuaj/pX2tTSStpuXnYWCeOCyYyhz7XeE
         fcmQ==
X-Gm-Message-State: AOAM530GCAtK6fE+oVnSFX36RtH9g6fxR/akmY7nzvg9nNpgwRiRK6LY
        O9js6mBa8v6Dd9BGuJ8pHRe4kQ==
X-Google-Smtp-Source: ABdhPJxZXrE0bS930s4kHxmTujcKxrLUp8mkRl/hRPu1hEArkUtvSLrw9l0edI4pIsEcorzqGoW98g==
X-Received: by 2002:a05:600c:255:: with SMTP id 21mr1914111wmj.69.1606817109823;
        Tue, 01 Dec 2020 02:05:09 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id p11sm2348078wrj.14.2020.12.01.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 02:05:07 -0800 (PST)
Date:   Tue, 1 Dec 2020 10:05:05 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Cc:     linux@armlinux.org.uk, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        tony@atomide.com, mripard@kernel.org, wens@csie.org,
        jernej.skrabec@siol.net, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, lee.jones@linaro.org, sam@ravnborg.org,
        emil.l.velikov@gmail.com, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201201100505.xsocmjf6tmxu4uon@holly.lan>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Nov 30, 2020 at 03:21:32PM +0000, Andrey Zhizhikin wrote:
> Since the removal of generic_bl driver from the source tree in commit
> 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") BACKLIGHT_GENERIC config option became obsolete as well and
> therefore subject to clean-up from all configuration files.
> 
> This series introduces patches to address this removal, separated by
> architectures in the kernel tree.
> 
> Andrey Zhizhikin (5):
>   ARM: configs: drop unused BACKLIGHT_GENERIC option
>   arm64: defconfig: drop unused BACKLIGHT_GENERIC option
>   MIPS: configs: drop unused BACKLIGHT_GENERIC option
>   parisc: configs: drop unused BACKLIGHT_GENERIC option
>   powerpc/configs: drop unused BACKLIGHT_GENERIC option

Whole series:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
