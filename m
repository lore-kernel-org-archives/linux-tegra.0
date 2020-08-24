Return-Path: <SRS0=inwd=CC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885F0C433DF
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Aug 2020 10:43:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 647B52074D
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Aug 2020 10:43:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYrP/1bz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgHXKnm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Aug 2020 06:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbgHXKnl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Aug 2020 06:43:41 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97598C061574
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2020 03:43:40 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o21so7692997wmc.0
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2020 03:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vfeJpdo+reXlUp8I9Xltf/bKT4P5/2EZI29RPHRcGTo=;
        b=zYrP/1bzSHAaUnEcj4HL//n+vYvLSDc9feOiIUJl31IuKVau98RwHMSK/ozNps5bTR
         oYKfl5nukEcPBR6oPloC6dUWnJMYinAJ5ZTA0uCMCnjENm12q3qNJLyM9fX7fpZsWKwf
         sAjPWWliJ59AzuScUI1swcfCyVp7j0p8T+bs9qKTAtSAIjqsg799vQKGdoz1rKObLU80
         SnesywaeXAUN22biSQs84mCq1cEZwFAayZBmrDkSk+3c1GHDVa2eLVFKtTdmZE4yO4bU
         pDA3wJDt5ycrQrRl1889ScC1ZC/OoaxJjElqCH337TWJtCl4rjt6zn/82C+A0UGm+nIp
         4SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vfeJpdo+reXlUp8I9Xltf/bKT4P5/2EZI29RPHRcGTo=;
        b=EvZnpvMKDIshbeJEoxAwKDRn6yx2pyxHKZILK5qQZvQA51TMgnsTX3oFpx+DMP111Q
         6bKxryNmVauyS0iPdM+ASMjiVv/5tITQTS8Gf5A80NWfCjLodYNTp6gkQeodX3HM7RRg
         CsBNdvQ4PZpF+zEGX13hlx1/ie3SyYWgM3YMv5voYxsTnMUHliG3UEELT+gXnki37LFE
         qvuQ3WvPwJ0ihx8JBId/oOe9RisdJDDx1FL2lfX6qC0JkcSPT/uphfLInzpsiaV9NWbt
         OAu88gOPCKiZghrvHlDgjrnTuRTSEOs/6aNSLBI16Or+opZ01TC+BovL5GyEpRi1BBar
         puoQ==
X-Gm-Message-State: AOAM532Tb4Gm/hB7wdOAm7vNhca6nIeb3S9iAwHczCBYVNOybzXHSFqW
        SI8n2kDTD0iNq5Op6aQL+Gfehg==
X-Google-Smtp-Source: ABdhPJyv9b5avO7XGdhprlSuqd/FKoiXA07sKRZlFBmahtp9hFgwnfD9BWbBCvoEh+hvSuNaA8PC7w==
X-Received: by 2002:a1c:68c3:: with SMTP id d186mr5179539wmc.68.1598265818867;
        Mon, 24 Aug 2020 03:43:38 -0700 (PDT)
Received: from dell ([95.149.164.62])
        by smtp.gmail.com with ESMTPSA id f9sm1783125wrm.5.2020.08.24.03.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 03:43:38 -0700 (PDT)
Date:   Mon, 24 Aug 2020 11:43:36 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/6] mfd: Add driver for Embedded Controller found on
 Acer Iconia Tab A500
Message-ID: <20200824104336.GK3248864@dell>
References: <20200823140846.19299-1-digetx@gmail.com>
 <20200823140846.19299-2-digetx@gmail.com>
 <20200823181653.GC209852@demiurge.local>
 <82abab10-9af6-a9c4-b241-d5a3af5b588d@gmail.com>
 <20200824073331.GG3248864@dell>
 <f12d287a-f088-4c43-479d-5c044e554b30@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f12d287a-f088-4c43-479d-5c044e554b30@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 24 Aug 2020, Dmitry Osipenko wrote:

> 24.08.2020 10:33, Lee Jones пишет:
> >> ...
> >>>> +static struct a500_ec *a500_ec_scratch;
> >>>
> >>> If this is only used for power_off, please rename it. I've been told to
> >>> do so in my driver: https://lore.kernel.org/lkml/20200519104933.GX271301@dell/
> >>
> >> I don't mind to rename the variable, but not sure whether it will be a
> >> worthwhile change since _scratch is also a common naming scheme among
> >> MFD drivers. Please see max77620_scratch for example, which I added
> >> about a year ago.
> > 
> > If something is used once, it does not make it 'common'.
> > 
> > Not sure how this slipped my notice before, but I don't like it.
> > 
> > Ensure any global struct used for power_off only includes items
> > required for this purpose.  It's unfortunate this API requires a
> > global variable at all.
> > 
> 
> Okay! I'll change it in the v2, thanks!
> 
> Thierry Reding was working on the shutdown API which should replace the
> global variables, unfortunately he doesn't have enough time to finish
> that work yet.

That would be really good. :)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
