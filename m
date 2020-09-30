Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46104C4727F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 10:27:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0135B2074A
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601461643;
	bh=rN3Ih0FrJMaTBSY1sIDPm0OjGAVyY3eXglamIBYJsNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Pz0lGJNid3oI2cUsEpkusfX5+xJp6EfChAqubZA1tf1AsF5/irPKgGwsynb3c/v+4
	 zBRC56OdulVv+JEYk0sSUPqUVuYs/UlIeXdEVFqlcoVseffmdzp/QLYmpAFNcu+f7Y
	 Da1xaWRTF15VvF3JxYJCOeJG2er8QFfL1q6ohszI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbgI3K1W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 06:27:22 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:39636 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI3K1V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 06:27:21 -0400
Received: by mail-ej1-f66.google.com with SMTP id p9so2008465ejf.6;
        Wed, 30 Sep 2020 03:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WyRp0sS/CKkD3/s51uId5dPbBJKj9JBduIQHAwqiLCM=;
        b=qGFcMCIfMnEQ+u2IxejgZcdCjuPcHKS/OoBe+Cy2XbpcaN3iAx60htv7IrqIeJY6eT
         JH0CdvSl5rQgu6g28AyAzzY4WC/jQUKR5l5jY8WCHMFeTzD+JHT28tooC+sxP1JhEIM1
         LUkm/a7xGd666bJFZeyB2+VdWtY75IKVz6X3LUh3u7SglkkMdRphpBXwQsPVSnJPVrYt
         5NMFvAuwuRduHsrpRa0wgMpio5gvGrILZ+Ge25ju6Zo++jMoW+k15SyqBbac/b4J2E/I
         3ChtES8ppeKPcMH+QHKL+a7jo9Ct6q3ykV3Qcz/Cit+5bbjSZhtPs0p7aQhr9e4sTXbv
         rm5g==
X-Gm-Message-State: AOAM531gDbj45dMMYaBygNuXlgxSi/dWwgBqGIxbX6z46KywJcIB+ks0
        QOuyPbc7BQUk9tquSslKUi09vxG+z2/0+w==
X-Google-Smtp-Source: ABdhPJyKXzRjgb9OvirP18fAoHzHccaDHJBkc6ZBVoYVJVYeCMwLgOn221SHU9YyAahDM91eqQmxMw==
X-Received: by 2002:a17:906:f0d3:: with SMTP id dk19mr2040441ejb.202.1601461639048;
        Wed, 30 Sep 2020 03:27:19 -0700 (PDT)
Received: from pi3 ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id t12sm1069221edy.61.2020.09.30.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 03:27:17 -0700 (PDT)
Date:   Wed, 30 Sep 2020 12:27:15 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
Message-ID: <20200930102715.GB1147@pi3>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
 <CAJKOXPd7XSAty_2_6i3bEcoRwJ9HdoE+TKGu1G6ozZ9xYC7M6Q@mail.gmail.com>
 <20200930094145.GB6686@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930094145.GB6686@Asurada-Nvidia>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 02:41:45AM -0700, Nicolin Chen wrote:
> On Wed, Sep 30, 2020 at 11:07:32AM +0200, Krzysztof Kozlowski wrote:
> > "On Wed, 30 Sep 2020 at 10:48, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > From: Dmitry Osipenko <digetx@gmail.com>
> > >
> > > Multiple Tegra drivers need to retrieve Memory Controller and hence there
> > > is quite some duplication of the retrieval code among the drivers. Let's
> > > add a new common helper for the retrieval of the MC.
> > >
> > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > > ---
> > >
> > > Changelog
> > > v2->v3:
> > >  * Replaced with Dimtry's devm_tegra_get_memory_controller()
> > > v1->v2:
> > >  * N/A
> > >
> > >  drivers/memory/tegra/mc.c | 39 +++++++++++++++++++++++++++++++++++++++
> > >  include/soc/tegra/mc.h    | 17 +++++++++++++++++
> > >  2 files changed, 56 insertions(+)
> > >
> > > diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> > > index ec8403557ed4..dd691dc3738e 100644
> > > --- a/drivers/memory/tegra/mc.c
> > > +++ b/drivers/memory/tegra/mc.c
> > > @@ -42,6 +42,45 @@ static const struct of_device_id tegra_mc_of_match[] = {
> > >  };
> > >  MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
> > >
> > > +static void tegra_mc_devm_action_put_device(void *data)
> > 
> > devm_tegra_memory_controller_put()

My bad here, this is not a "put" helper so the previous name was
actually good. No need to change.

> > 
> > > +{
> > > +       struct tegra_mc *mc = data;
> > > +
> > > +       put_device(mc->dev);
> > > +}
> > > +
> > > +struct tegra_mc *devm_tegra_get_memory_controller(struct device *dev)
> > 
> > Usually 'get' is a suffix (e.g. clk, gpiod, iio, led), so:
> > devm_tegra_memory_controller_get()
> > 
> > > +{
> > > +       struct platform_device *pdev;
> > > +       struct device_node *np;
> > > +       struct tegra_mc *mc;
> > > +       int err;
> > > +
> > > +       np = of_find_matching_node_and_match(NULL, tegra_mc_of_match, NULL);
> > > +       if (!np)
> > > +               return ERR_PTR(-ENOENT);
> > > +
> > > +       pdev = of_find_device_by_node(np);
> > > +       of_node_put(np);
> > > +       if (!pdev)
> > > +               return ERR_PTR(-ENODEV);
> > > +
> > > +       mc = platform_get_drvdata(pdev);
> > > +       if (!mc) {
> > > +               put_device(mc->dev);
> > > +               return ERR_PTR(-EPROBE_DEFER);
> > > +       }
> > > +
> > > +       err = devm_add_action(dev, tegra_mc_devm_action_put_device, mc);

This can be simpler with devm_add_action_or_reset.

Best regards,
Krzysztof
