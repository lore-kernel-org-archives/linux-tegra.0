Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D03CC4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 14:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB40E207FB
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 14:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601477128;
	bh=uitBVKzK5eSn73NODN0g6lArFVEY6TVlvPfSJuwxRog=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=vpv2afwXTx9ddyNrHd9c6fSZcZoi2+FmjsoWEEhcYOaCF1HsCEpANd7nlYkqDg89T
	 aNf3RRTDMpTTs9cYneuNfnLss0fWo005JasFNyk++oC2ywhX0sghYJo9XImlkmLJ8u
	 lCL8klDedztO/lqCcU3kfCtKboKGmtksAKeCZNy8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730229AbgI3Op2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 10:45:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:47212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726680AbgI3Op2 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 10:45:28 -0400
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A80C2076B;
        Wed, 30 Sep 2020 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601477127;
        bh=uitBVKzK5eSn73NODN0g6lArFVEY6TVlvPfSJuwxRog=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ULFKs8MYBPpiqQu9MBrLsNEHx/tm50uUej7Oti/iYe0yc1Wmcsal4PX8aWnJ4XD96
         6Jd91IncKleF/Z9bSvRxgYWR8bx2aFpDQn6W1PUnr34P/6UEO9p/yk0w3IkTKUbF9Z
         9nEQ2FHAAVO7vXhS6OvEE4pyR++fZ5e6EicOi2nc=
Received: by mail-ed1-f54.google.com with SMTP id w1so2157856edr.3;
        Wed, 30 Sep 2020 07:45:27 -0700 (PDT)
X-Gm-Message-State: AOAM531Wo+yjLl1SYdFsVxMkOH8RwWJz+oGGAFrKggZzjKY9L/0jEQ5b
        JhHwWG0CdguCZxAmRSusx3nA2mF+n3t7dl1hbIA=
X-Google-Smtp-Source: ABdhPJzAYe0nAYLDdCHSY4Z+CtKlLw49Vw78B00scxZ8PBmBf3t4Ca/lTesoegejXmkdHGsdERiqGGLJZbHQ8XRJMPY=
X-Received: by 2002:a50:e78f:: with SMTP id b15mr3191569edn.104.1601477125978;
 Wed, 30 Sep 2020 07:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com> <f9712d4c-8497-ca84-0d8a-d33eb6abc513@gmail.com>
In-Reply-To: <f9712d4c-8497-ca84-0d8a-d33eb6abc513@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 30 Sep 2020 16:45:13 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfbCRDY7TUZ4HXphrd6boWYEKb_DMOxth3ucPTB2UCUtw@mail.gmail.com>
Message-ID: <CAJKOXPfbCRDY7TUZ4HXphrd6boWYEKb_DMOxth3ucPTB2UCUtw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] memory: tegra: Add devm_tegra_get_memory_controller()
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 30 Sep 2020 at 16:41, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> ...
> > +struct tegra_mc *devm_tegra_get_memory_controller(struct device *dev)
> > +{
> > +     struct platform_device *pdev;
> > +     struct device_node *np;
> > +     struct tegra_mc *mc;
> > +     int err;
> > +
> > +     np = of_find_matching_node_and_match(NULL, tegra_mc_of_match, NULL);
> > +     if (!np)
> > +             return ERR_PTR(-ENOENT);
> > +
> > +     pdev = of_find_device_by_node(np);
> > +     of_node_put(np);
> > +     if (!pdev)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     mc = platform_get_drvdata(pdev);
> > +     if (!mc) {
> > +             put_device(mc->dev);
>
> This should be put_device(&pdev->dev). Please always be careful while
> copying someones else code :)

Good catch. I guess devm_add_action_or_reset() would also work... or
running Smatch on new code. Smatch should point it out.

Best regards,
Krzysztof
