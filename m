Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F8AC2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:40:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE18220789
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 06:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdyYML4L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgI3GkL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 02:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbgI3GkJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 02:40:09 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970F7C061755;
        Tue, 29 Sep 2020 23:40:07 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id q123so513192pfb.0;
        Tue, 29 Sep 2020 23:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=CuQL0DR3SznyNcaZUnBt+RDDBya3xXYL9URyxcOJ1YQ=;
        b=gdyYML4LIy0Pdw++JhCkK7u4U1wFZnA8uJbeuQA1lieBfwc2mWJTImgPa4okxwBwU+
         7Cpxg11IVNDt9c4MxpyzPsF9hkNa0mZKIuYUOauANppORHKXO6F7IM0ANyN8xFPbGJbY
         GDNTZYHcrsPEyjwtwGq8h0wLRZNrdy15dGdFGHa4MuPOzhEY/XSpH3yaHv1KTpJxajWe
         JIPS02rpuLzl2fohPPRlCImqKeYswcD7WvW8qh5cowrqufAoOLb8IEr+z9NcavRVYzYz
         GP4FsvYYyRim3Jw0EVz+AYp9R1xoP8VadFXh3Fk4VbC5COmQcn3YvD52NQHeI+73MnTl
         qFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=CuQL0DR3SznyNcaZUnBt+RDDBya3xXYL9URyxcOJ1YQ=;
        b=A/rodfkWgTLDH5LiODqsp4e+fvzJREmlvukqKLzGfgRh4qPaB/Sa1ENTq8aJIbZRMg
         2Me4/lS7yiEK8vsM4HmMd0ilJEbGhA4/ZjlJRPQv0BItrkmuqVfY6OXK629J9cv7qizl
         2zjndEy39ZRYwk4ho17M2qk8HtdRqTnlGyAnUzPEBscaqQhQPYMSksx3kMEUJidc1xnA
         Zz0ys4oC/7PK93oLf/LpTqQDzmsrOLtjQlyciku6lWa7RobsQkUeVdNw5pEVVaiVuAU6
         1J+dTPQ1D4BfYrKsBTRC2gPvWKJxQUYyZcbbtk5hx5xiJB+cR/OYYRtwQ6afgVFgbC9Y
         jQOg==
X-Gm-Message-State: AOAM530RI540kwGzsQkCZSoGsya+85V4B0uZk5sF4mcTqjNanP5Ky2pO
        wNaifeJxOFEJVKwzleStFx8=
X-Google-Smtp-Source: ABdhPJwMXyQIrNYgvg/rRxGeX/z84x0C4XNLbkL7O43oL1U271A5d0VsrXfDRcCHFORysZTBfTZ0oA==
X-Received: by 2002:a63:5b5c:: with SMTP id l28mr993289pgm.243.1601448007009;
        Tue, 29 Sep 2020 23:40:07 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id v21sm905557pgl.39.2020.09.29.23.40.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 23:40:06 -0700 (PDT)
Date:   Tue, 29 Sep 2020 23:34:36 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930063435.GC16460@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <db183fdf-d566-599a-94ff-cfab0e08aa7a@gmail.com>
 <931eb16b-4529-2c20-c696-c57a9138aded@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <931eb16b-4529-2c20-c696-c57a9138aded@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 08:20:50AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 08:10, Dmitry Osipenko пишет:
> > 30.09.2020 03:30, Nicolin Chen пишет:
> >>  static void tegra_smmu_release_device(struct device *dev)
> > 
> > The tegra_get_memory_controller() uses of_find_device_by_node(), hence
> > tegra_smmu_release_device() should put_device(mc) in order to balance
> > back the refcounting.
> > 
> 
> Actually, the put_device(mc) should be right after
> tegra_get_memory_controller() in tegra_smmu_probe_device() because SMMU
> is a part of MC, hence MC can't just go away.

Hmm..I found that there is no put_device() call in tegra20-devfreq.
Should we just put_device(pdev->dev) in tegra_get_memory_controller?
