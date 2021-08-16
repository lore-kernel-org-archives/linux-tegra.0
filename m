Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9835BC4338F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 19:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 804C560F4B
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 19:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhHPTrA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 15:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbhHPTq5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 15:46:57 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B9FC061764;
        Mon, 16 Aug 2021 12:46:25 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id nt11so28251794pjb.2;
        Mon, 16 Aug 2021 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q5y3Diy0bSS1qtfw8LXMZxlhAkCPsRISdhkpjPubqdw=;
        b=Qzl2TNvGY4kPSuJe2Kx778muWJ3IC/XdfyAQtvUDaGu+uehK9xfVadHtHQwRyJtum2
         zlnbEFbnVJ8q6LMdFTxLh3gIzLDITPoWRgb6SqwNj0hsbDZCFoWt62ZPJKqneIwDEiaZ
         hhevSHMteX+wgEtoQTK9c42dknM/uL5zAnKwaRIb3yBnMNe69xVft3mEQSnKS/sThekB
         OPQPh2RYkZFuHir4l8kps2QOdTc3oq6cn8Yk+L/nDQr3cjdpzLjk+GoUPBThnoRXfEE1
         n8kVdkhcAuF/0ikoseAmEPpE8iOn0X6SwuvblE7WT2uYAQAzJ8R9X/M0kBfNph385y02
         EmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q5y3Diy0bSS1qtfw8LXMZxlhAkCPsRISdhkpjPubqdw=;
        b=FTdb+ni3UOj1RGI+NMMnSbhfafTgEBCqH09XpCz6rkTctGBIpWW5oEDE40NKGxHC48
         mQUs1WeRu6YCa2xrfQv9r66YAMd1Ppz5Ag96nbXI/KmSQ91+mudAzt5EEtHXjlBA5WTZ
         o+S/uyvyNE9f50gptB1+YJguBemrgUD7L5uQpVE3/6BR7q33MzZgNNl2uDtuZrft1Hxu
         nL7bdgKQ0fqri36X/uOqk+9bpbPAjv47QlogBFNWF0xZMo81Aw5wrnYuqjJ6cqmyvlJl
         3OjsFVx5cfVtgl1HqeacXUOwItTVPGljQmrxorz0yb03upq3jOjg3YiUtwCeTKRmY2u8
         Scew==
X-Gm-Message-State: AOAM532TW2noc+tcesuBZ0xWey9J1W35kwzW79zAak66Rzf0+XgR9GnR
        3vSXoqjYtfLtsPvh1HXTcdk=
X-Google-Smtp-Source: ABdhPJzTDgwZNRMVildoG+vBvtMZqvHi8155Vl8sXOW5IrmWcqyis3Cwo0UUNdbMARZrZ+bp/394pQ==
X-Received: by 2002:a63:d14c:: with SMTP id c12mr435187pgj.412.1629143185449;
        Mon, 16 Aug 2021 12:46:25 -0700 (PDT)
Received: from localhost ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id r9sm181910pfh.135.2021.08.16.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 12:46:24 -0700 (PDT)
Date:   Tue, 17 Aug 2021 01:16:21 +0530
From:   Aakash Hemadri <aakashhemadri123@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
        Jawoslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <20210816194621.mrudqykxvkbt3a2w@xps.yggdrasil>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
 <20210816183906.GC4253@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816183906.GC4253@sirena.org.uk>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/08/16 07:39PM, Mark Brown wrote:
> On Sun, Aug 15, 2021 at 01:42:18AM +0530, Aakash Hemadri wrote:
> 
> > -	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
> > +	match = of_device_get_match_data(&pdev->dev);
> >  	if (!match)
> 
> Thierry, are you sure about your review here?  As others have been
> pointing out of_device_get_match_data() returns match->data while
> of_match_device() returns the device.

Sorry for the confusion, and the glaring mistake.
Will fix and send v2.

Thanks,
Aakash Hemadri.
