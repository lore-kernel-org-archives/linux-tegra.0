Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F446C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1622F206B8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ha0J0YFF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgI3Fzk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgI3Fzk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:55:40 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE57C061755;
        Tue, 29 Sep 2020 22:55:40 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t13so345860plb.10;
        Tue, 29 Sep 2020 22:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZKt1l06WBiOe5oSa8hvHMMaReLuZvec2hHg90p7XYZw=;
        b=Ha0J0YFFJbPQksFeyj5p+V9nuCr+5BSKAknv2WvbX953a+2DlUmJ6wy4K5XDXRMwg7
         /w7xQHmu0IsodtL9hWFAu0/LxDx0sVH6qUsXvXBhHK7esn1M2Aou30kHiz1SDOxk761X
         vxUyVBUPJ2B8jXI8kN97kwkIGvgDD0FcJ5h4Fw7+z2yAoOYB9btAMfuVVTpmx2+CeJUB
         DevOO0PMjyiFRJibfaW261V/zpVf9oLYHnydIaPfI5f9lSwAts/e92P/sDn41w5Ixg/g
         7wUnFg5WSW0+OzdRzb8dHqwT6qYP+LjOUaBy3MPcxvwiMITWeesV6FCzwRlmtAdCS6DO
         urVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZKt1l06WBiOe5oSa8hvHMMaReLuZvec2hHg90p7XYZw=;
        b=dH7gl+ek8X1+cyMSDu3dAKREvM2yN0mwyqdYWBe3y2O0qqLP+RGBIYByv7Nk6i7P/o
         zZRCc/cnzQ37Ulx2pu30uPhNVQofva/E03vnvC5l3KAhbO8/VTPy87b5KEufaLfu/cR1
         Klm5R7IUUsqMa6E3NWZDaJkf3McV8V+NZq1rXLKOfDWpx/Vm49CdzQTTAxPpM7JBbt+X
         H0ilvvZsPMXMOKdOCr4VPI6uAu4weFrLgpTj+fE0r0uxDQsFuqzNFul+dg5yUR1HWSPC
         /1isKvg2uGibQGo7a5hmWQVmo5GWzl+oemVmcWr7g0RB96c0IEbV1MYYEfisupgnhJ+K
         qlHQ==
X-Gm-Message-State: AOAM533LUpZ8EY16T2Z1cWjOJEd8fxiUax3iZuCXQdW6q0V0xlXxTN+/
        BCol2c0uQ1XPOYzzHu74Avw=
X-Google-Smtp-Source: ABdhPJxxPH3+l0h0b3d77zTykpSEcWgLoj6N2dP/iZ7QevPI0t6mFehpDdcbtQHqGWvYygqI0MFMIw==
X-Received: by 2002:a17:90a:104f:: with SMTP id y15mr1019025pjd.45.1601445339766;
        Tue, 29 Sep 2020 22:55:39 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id n2sm773071pfe.208.2020.09.29.22.55.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:55:39 -0700 (PDT)
Date:   Tue, 29 Sep 2020 22:50:09 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930055008.GH31821@Asurada-Nvidia>
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

Will add it. Thanks for pointing it out!
