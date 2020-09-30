Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915FAC47426
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 09:47:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58C5220848
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 09:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WX6MDeQI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbgI3JrT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 05:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728858AbgI3JrS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 05:47:18 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB1EC0613D0;
        Wed, 30 Sep 2020 02:47:18 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id o20so796352pfp.11;
        Wed, 30 Sep 2020 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kqDQyIHjT82uvPQJz0UJBc/gjbOXF+Ap9JLzTI1InVE=;
        b=WX6MDeQIcu42mUtXNmJPg2odpit0HfgRwRnczXZ4F7gRtFazY3NB8x7bV01butrRAw
         dJYw9Vxi6+XpQ1hohR93530/FXfD1PwDwMfU+7qApodYCL23+dsjmvbJ86irZWvaf0/2
         5xtAfg0MwmmaglesDco6a8+Jw7XyxYRCX5SPMA/+a05+DUIgim1Ie0dHlDkEvJKqsSsu
         6wlYoEgAymm7oDkku5vcJ1Rp/Bia0cRwIF/KQkiAvL5SfUjQwvchhH6QOJIZqYcmLpl9
         tqH5Rr8bmTj+EBKI/RCOC16DZ3+Lu9fVW5WbpA3npcsvSvR2DfILjOKzrLd5fs81jd9x
         GVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kqDQyIHjT82uvPQJz0UJBc/gjbOXF+Ap9JLzTI1InVE=;
        b=OzZOP6ojhmouQxrx8ytqr8srSddqGxUYdhcjCksSVNBppusSIBw/bmu8HOPbYLfrdb
         qp8oz2Zi1upxAM/GQPR6cBuBMZdLlEH2GRPcATIs1i1EXDVsyL1dYACsdZBO9Y8qn1D8
         tyFgygDRgxcH7GEPV2Fk3Dl7UT7eF/wGNdBTuzoYUM/7DaPEF/4GY8Lp+nnzgoTwxund
         F6CmnmcAGHFY8tenVII1keyXUXBTeCDdCIP3vhYIBghQP+34ZCErYeSNLw41ev04zB15
         k3w9sxs1gnyXWRjIP3A82WNqQ4bP4cdqTZpSk7OFF4kJ0sI3uleFvgbZWMf1/jxOrOs5
         Mo8A==
X-Gm-Message-State: AOAM533GCkeAhCIc7MZS9jeAWFrwMgbyKa+KjYxe0JjiKKJScBRJXyJB
        zXh+4sXcmL06NPohF7JeWgvOnfs8wFw=
X-Google-Smtp-Source: ABdhPJzBQ8d87ceNZY/OyWVcnfRw6WF84tw2SDVtxruJphPiHwE4rWpiiLDIA2EfccMlvBvjJtcpqg==
X-Received: by 2002:a63:4e5e:: with SMTP id o30mr1491523pgl.324.1601459237933;
        Wed, 30 Sep 2020 02:47:17 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id k14sm1710193pjd.45.2020.09.30.02.47.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 02:47:17 -0700 (PDT)
Date:   Wed, 30 Sep 2020 02:41:45 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
Message-ID: <20200930094145.GB6686@Asurada-Nvidia>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
 <CAJKOXPd7XSAty_2_6i3bEcoRwJ9HdoE+TKGu1G6ozZ9xYC7M6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPd7XSAty_2_6i3bEcoRwJ9HdoE+TKGu1G6ozZ9xYC7M6Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 11:07:32AM +0200, Krzysztof Kozlowski wrote:
> "On Wed, 30 Sep 2020 at 10:48, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > From: Dmitry Osipenko <digetx@gmail.com>
> >
> > Multiple Tegra drivers need to retrieve Memory Controller and hence there
> > is quite some duplication of the retrieval code among the drivers. Let's
> > add a new common helper for the retrieval of the MC.
> >
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> >
> > Changelog
> > v2->v3:
> >  * Replaced with Dimtry's devm_tegra_get_memory_controller()
> > v1->v2:
> >  * N/A
> >
> >  drivers/memory/tegra/mc.c | 39 +++++++++++++++++++++++++++++++++++++++
> >  include/soc/tegra/mc.h    | 17 +++++++++++++++++
> >  2 files changed, 56 insertions(+)
> >
> > diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> > index ec8403557ed4..dd691dc3738e 100644
> > --- a/drivers/memory/tegra/mc.c
> > +++ b/drivers/memory/tegra/mc.c
> > @@ -42,6 +42,45 @@ static const struct of_device_id tegra_mc_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
> >
> > +static void tegra_mc_devm_action_put_device(void *data)
> 
> devm_tegra_memory_controller_put()
> 
> > +{
> > +       struct tegra_mc *mc = data;
> > +
> > +       put_device(mc->dev);
> > +}
> > +
> > +struct tegra_mc *devm_tegra_get_memory_controller(struct device *dev)
> 
> Usually 'get' is a suffix (e.g. clk, gpiod, iio, led), so:
> devm_tegra_memory_controller_get()
> 
> > +{
> > +       struct platform_device *pdev;
> > +       struct device_node *np;
> > +       struct tegra_mc *mc;
> > +       int err;
> > +
> > +       np = of_find_matching_node_and_match(NULL, tegra_mc_of_match, NULL);
> > +       if (!np)
> > +               return ERR_PTR(-ENOENT);
> > +
> > +       pdev = of_find_device_by_node(np);
> > +       of_node_put(np);
> > +       if (!pdev)
> > +               return ERR_PTR(-ENODEV);
> > +
> > +       mc = platform_get_drvdata(pdev);
> > +       if (!mc) {
> > +               put_device(mc->dev);
> > +               return ERR_PTR(-EPROBE_DEFER);
> > +       }
> > +
> > +       err = devm_add_action(dev, tegra_mc_devm_action_put_device, mc);
> > +       if (err) {
> > +               put_device(mc->dev);
> > +               return ERR_PTR(err);
> > +       }
> > +
> > +       return mc;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_tegra_get_memory_controller);
> > +
> >  static int tegra_mc_block_dma_common(struct tegra_mc *mc,
> >                                      const struct tegra_mc_reset *rst)
> >  {
> > diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> > index 1238e35653d1..c05142e3e244 100644
> > --- a/include/soc/tegra/mc.h
> > +++ b/include/soc/tegra/mc.h
> > @@ -184,4 +184,21 @@ struct tegra_mc {
> >  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
> >  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
> >
> > +#ifdef CONFIG_TEGRA_MC
> > +/**
> > + * devm_tegra_get_memory_controller() - Get the tegra_mc pointer.
> > + * @dev: Device that will be interacted with
> 
> This is not precise enough and there is no interaction with 'dev' in
> devm_tegra_get_memory_controller(). Something like: "Device that owns
> the pointer to tegra memory controller"
> 
> > + *
> > + * Return: ERR_PTR() on error or a valid pointer to a struct tegra_mc.
> > + *
> > + * The mc->dev counter will be automatically put by the device management code.
> 
> 1. s/mc/tegra_mc/ (it's the first occurence of word mc here)
> 2. "kerneldoc goes to the C file". Not to the header.

I will send v4 after changing all of the places.

Thanks for the comments!
