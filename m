Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786E4C6379D
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 07:43:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4D9B2223C
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 07:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mAEP4Up0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388210AbgK0Hnj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Nov 2020 02:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388223AbgK0Hnj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Nov 2020 02:43:39 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B976C0617A7
        for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2020 23:43:38 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so4526119wrb.9
        for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2020 23:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rEnnfAVid4AD+7VYyTlu/4hDcuao08OGFyiRJJS5gHM=;
        b=mAEP4Up0E8VPIDiHTsetQh/Oq5MJPO4a7fnzIa2B78i+oO6AKfNsWzPBoDYLLwgrQX
         t02naVresVptmihYObQ9bXLHe8A1rs1P8SLpPYzb7iWyhguefhlLOEvzBoeFP5d8GouD
         B5F8Vr17OIyFsh9/TjQ4E/N930GNkUr97UKlsEqls3An3dVJ1nARLZKT42GpMey8NEE9
         tRR6f33bMvDdt99F9zbVsLTUJ4RGGVOHBMB9EmMAYpe/mGoDz0gGyNqqtDbvi7Yil4SD
         dsoB+5JQDQ46X/Pb1CYTRl+GGkmFJ4zx4xllOcadZ8mLH+vD/swKs8NRijjKv5Mwvhz0
         u/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rEnnfAVid4AD+7VYyTlu/4hDcuao08OGFyiRJJS5gHM=;
        b=QEJXR+ZjTBPcHi6mzZJD1IuswYhSFbB5Kn38xgPJV/wvmsib+ldJbjFfL63OEsiMSF
         HHty91kC3wKcvZvHHut51LkXfOLU0PPtY77o4FDLBceh6ij55HVQYqX4CkfCGWCb9vW5
         ZsFslrFEgCHgrNIaWT4piSn9RJYB4YlVYPxsqzW9A+CuhJN7tri9Hc22I6llDLJcpo+D
         Mn+n6R0uCbr5CT5zoSfSM8VXg7/7hxrGnjwRrBlDMTLrszmRxQ+aArQFwbvTEzVCam4a
         nzq38/oj2QpGVFReFNM/v/D6bDQGm/z/exmCWoS/TGiKgWNvm78eMxAt592sJlOBhBuw
         DeiQ==
X-Gm-Message-State: AOAM532NQ+95GMn/gyEUBTvBA9ya9NGV14d5WCcbzTSXAnJXcF62Cl2G
        Go/Jq4rbNKUPau0/qAy+k5KeCQ==
X-Google-Smtp-Source: ABdhPJwNjuZb0tCHUVJNH0+fFMWOxXUcbmUbuJeZf6e0VklNKGWSDJaN44uBOvtnbFNkBCBOwEU/AA==
X-Received: by 2002:a05:6000:10cd:: with SMTP id b13mr954380wrx.178.1606463017038;
        Thu, 26 Nov 2020 23:43:37 -0800 (PST)
Received: from dell ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id j65sm5423167wmj.13.2020.11.26.23.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 23:43:36 -0800 (PST)
Date:   Fri, 27 Nov 2020 07:43:34 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mfd: tps65910: Correct power-off programming sequence
Message-ID: <20201127074334.GH2455276@dell>
References: <20201115204505.18616-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201115204505.18616-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 15 Nov 2020, Dmitry Osipenko wrote:

> Correct power-off programming sequence in order to fix shutting down
> devices which are using TPS65910 PMIC.
> 
> In accordance to the TPS65910 datasheet, the PMIC's state-machine
> transitions into the OFF state only when DEV_OFF bit of DEVCTRL_REG is
> set. The ON / SLEEP states also should be cleared, otherwise PMIC won't
> get into a proper state on shutdown. Devices like Nexus 7 tablet and Ouya
> game console are shutting down properly now.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Zack Pearsall <zpearsall@yahoo.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Changelog:
> 
> v4: - Rebased on a recent linux-next.
> 
> v3: - Removed the DEV_SLP_MASK clearing and adding clarifying comment to
>       the code about why clearing PWR_OFF bit needs to be done, which was
>       suggested by  Michał Mirosław in a review comment to v2.
> 
>     - Added tested-by from Peter Geis who tested v3 on his Ouya game
>       console.
> 
> v2: - Now using a single tps65910_reg_update_bits() instead of set+clear.
>       Thanks to Michał Mirosław for the suggestion.
> 
>  drivers/mfd/tps65910.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
