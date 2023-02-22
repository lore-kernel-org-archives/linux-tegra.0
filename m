Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5538AC636D6
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Feb 2023 13:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbjBVNdD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Feb 2023 08:33:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbjBVNdC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Feb 2023 08:33:02 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9649C3A0B2;
        Wed, 22 Feb 2023 05:32:10 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id o14so6008847wms.1;
        Wed, 22 Feb 2023 05:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PyYX0RfftztzNQ8Ex28d1K9RdtJ42UqMq/VeELB++KA=;
        b=cboTumAALVn0tztGHhz524kh3qEE1BaKuwQ+9TKzGCagRocvzz9VniWUMM70t4S3Mh
         wXtPaXnHMx9upygBI1p0ty72+s7JUI2ujbm6H2GRfV3Hl4jX9TU2SuDR4KwtVR6AJDow
         gn0xOeqCqIjAjDxlZA1J7ejlHlTGnQVjXnYvYdXgIxNzkmomxQfLqmPwVHdgn9tHg/Sr
         4uMPIGJ6GqQE6c8YmOBAJLM1efuG9fdu41l/xX014LpI6plim0AJ5ZkYlQOF5NyuIR+P
         MJuc/Oe8sYLQuDGjl2rGKrr3Ke6rXMtEpNt4zFZkBs72wkb8RpnSCPTk0zCzf2JKl00V
         803A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyYX0RfftztzNQ8Ex28d1K9RdtJ42UqMq/VeELB++KA=;
        b=jXLETKiUmaewWzl2YZBkBLO3va+RU/s29k8pvWTdA8WB5cp2p/aSbXXWUjIXkK9s+N
         G1zhI/I8UAjx86NyA2yRbF1V20ioa9VVtPqipX2RS3/q5cQkImepaSqGovXXqnunj3NI
         RULdKyzU6KAmTxqWu6Un84U8T0Gv7HvGqzkPTWCm1OA0L2R/ueFXchnvzbNUIeu2lGwb
         Day6lWica2nCr9H6OWKVqAE0bpbsYt+Vn3p6N9/EZ90upHabenVTLU/CO+7V5tPL++vm
         N96MIRrN6fJlMa72ql6EYXs+2NkLCKHIB2iD7Ux7IiORhZ7f8GleeshxyaLzgSA5GGvq
         3YZQ==
X-Gm-Message-State: AO0yUKVmAzjgFibaNQbLsV+g4XxzQ50KjGDhj75b1y6m7YZn4uF6BmQA
        y+Dbvmr4Qahd1OdMkipGTxQ=
X-Google-Smtp-Source: AK7set/gESPrf22n9AJwmTDxhH2PBFDYBYEXN0r91+GYDbxXdjcQ1Ws8FAyeME56gFOWtdYsGsfRGQ==
X-Received: by 2002:a05:600c:a287:b0:3e9:372:10b3 with SMTP id hu7-20020a05600ca28700b003e9037210b3mr1655060wmb.25.1677072718790;
        Wed, 22 Feb 2023 05:31:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1c7706000000b003e1fee8baacsm7000775wmi.25.2023.02.22.05.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 05:31:58 -0800 (PST)
Date:   Wed, 22 Feb 2023 16:31:55 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/YZS95D4MMjI56a@kadam>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/Ud1bn+LExxLb/Q@kadam>
 <CAPVz0n3T-SiTbDyQTTE4L==OGkpSQrfBAP5gRjEevt4ozZLB-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPVz0n3T-SiTbDyQTTE4L==OGkpSQrfBAP5gRjEevt4ozZLB-g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Feb 22, 2023 at 10:06:23AM +0200, Svyatoslav Ryhel wrote:
> > > +static int fm34ne_dsp_set_hw(struct fm34ne_dsp_data *fm34)
> > > +{
> > > +     struct device *dev = &fm34->client->dev;
> > > +     int ret;
> > > +
> > > +     ret = clk_prepare_enable(fm34->dap_mclk);
> > > +     if (ret) {
> > > +             dev_err(dev, "failed to enable the DSP MCLK: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     ret = regulator_enable(fm34->vdd_supply);
> > > +     if (ret < 0) {
> > > +             dev_err(dev, "failed to enable vdd power supply\n");
> >
> > clk_disable_unprepare(fm34->dap_mclk);
> 
> No, dap_mclk has to be on, else there will be no sound on the device.
> 

If regulator_enable(fm34->vdd_supply); fails then the probe() is going
to fail so the sound isn't going to work anyway.  (I have a static
checker warning for missing calls to clk_disable_unprepare(), so it's
important for me to find out if we are deliberately not cleaning up).

> > > +             return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}

regards,
dan carpenter

