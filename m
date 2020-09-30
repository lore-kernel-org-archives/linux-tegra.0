Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B53C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBB1E2072E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Om4V3bcp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgI3FfY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI3FfY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:35:24 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4391CC061755;
        Tue, 29 Sep 2020 22:35:24 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y6so321777plt.9;
        Tue, 29 Sep 2020 22:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=W1K8f0z/jqgu4XtKdCAmS7hYkfAxOTJwSduvvMvjP0E=;
        b=Om4V3bcp3qikxKwomLrvOl7X/sEWzREB8grvkAbmG0xwxEJIlWuGdp1vd8vbTG1Y8a
         qdjp+fpmenmKk0aB7LP2t89pYDvFWryJy6KlYwNOM4z3/WOvfFGhJpVaQO+oPzEsNl0W
         8ZWlAkratGdksXj/9ItOPUrJkTVFnjNcSePIc5ReeCYfO87Uus4xD4goW40NbngXZEvU
         zwj9/YOegVhVJhTyQ9Fum54r/wqAmGHtV+PFoUVjlQsKX7EYhhNDaIVSjpCZS+qZXdl6
         243VXTxbb1ohLHIqb4JD4NmvPC+clkFuA/QX1kAVH5fmJ2mcGE++M4BotBlBwIg+v1TS
         sakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=W1K8f0z/jqgu4XtKdCAmS7hYkfAxOTJwSduvvMvjP0E=;
        b=q7yZLsep02Hjdw/EIy6yrASetWRvcGr61rOHqN/WGfAj2QUhVUswW6mIq8w1J/apUS
         DAAsd8JGQehgwIjcZsCSWtfCQJ6AMpdKKyOuLRvCuwbAcoBhnDjbaRcgMDBuS1c0N6Zm
         nz9ksfD4mMjDpMgY0ThUF6vQz8yWRokpdVQMq/Pmj0VvdgRclpZrjBCwcDuT/IJ6EVE8
         Fu4tXKZjeYysabnnSyUq2QpMtS1iMm0bSqfq4vvfLtvggppQsAh832X3/atVyCthfNIJ
         nWSP196zGro+dfNuZz7FzAHjA/DyNHpt+vFxb9IkA/PXAYq/ABFT9TYUELx3nljlBRf7
         PfBw==
X-Gm-Message-State: AOAM530AwxLUYdYP2RdaoW3EJTcIADgh6cMBRn5uHW9t3rEkskkCraUY
        mswsW2045mMHnU8U9Rz+J+WtSkowC0U=
X-Google-Smtp-Source: ABdhPJyeevosQ4EXxlrLKF/nmXoL76ezZtFWBbElnGnGkpLihSdXCxd/eBg0oInyXEfwwxVTHtakIQ==
X-Received: by 2002:a17:902:be0d:b029:d2:8084:cb19 with SMTP id r13-20020a170902be0db02900d28084cb19mr815442pls.45.1601444123751;
        Tue, 29 Sep 2020 22:35:23 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id r188sm686604pfc.67.2020.09.29.22.35.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:35:23 -0700 (PDT)
Date:   Tue, 29 Sep 2020 22:29:53 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20200930052952.GB31821@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
 <f07d4fcc-ee19-874b-c542-0679660c3549@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f07d4fcc-ee19-874b-c542-0679660c3549@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

On Wed, Sep 30, 2020 at 08:10:07AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 03:30, Nicolin Chen пишет:
> > -	group->group = iommu_group_alloc();
> > +	group->group = pci ? pci_device_group(dev) : iommu_group_alloc();
> 
> This will be nicer to write as:
> 
> if (dev_is_pci(dev))
>     group->group = pci_device_group(dev);
> else
>     group->group = generic_device_group(dev);

Why is that nicer? I don't feel mine is hard to read at all...
