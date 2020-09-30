Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37F7C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5E3C206DB
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIcmcdsk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgI3Fu2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgI3Fu2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:50:28 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4819C061755;
        Tue, 29 Sep 2020 22:50:26 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id x16so412135pgj.3;
        Tue, 29 Sep 2020 22:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=KDJI1UdfvDBL6Dg4S57KOoqth3ucuI3HS03X3SOn/zY=;
        b=VIcmcdskQ86AfRy89+em/AsOvDdok8Z+IL0i4KLjiMwhMF7QDAYv2GtcenPvQ2mMdx
         JFx7ooYChVxbFy6b7zIyHOxkRiS1EH0vDUnAcwYhmrqSJ4+IuS9WGFqGqdfYF9X+NCGH
         EAZA1PcF1Ue2GxlWOIWAhWnyvAIGda7RiOz5GbHhJjgPZz3idbyMywGnK8Qf8hC/OSoK
         7pqn+e7IfY8D2KXS76PGtdpfZxyBPhsDAQPrYCkR75R2NWdRy33VVyZD/dIRSFwTUIc/
         ZXZPiebSHjBgOZTu8iNnAGmpOYJhVQ51em87vn3K6ADXNwtz0xhTo9HWY9PNPbL6sXjd
         1nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=KDJI1UdfvDBL6Dg4S57KOoqth3ucuI3HS03X3SOn/zY=;
        b=K7CPl4cPKKCL+mP2dhrPw4d+dzNJ2oa42Pr5tu7UPVdN6+Y3ne9r4wTcrCKjeQK0NF
         1++I/NHb4R4i6hdCJnn/8h5y4hYgi7ptpdtpa3Dq1iz1VcdMTMLuGRfO2kE1jz1wn5pE
         foPFxqJPZVQCBXd3hI9RfDQQ4L8RhuuLGCr0TCicEy9uZcEiiHfMHFEHR3zQr6RvdjkZ
         tOabbYG9DjmFSBwbXepygLOGT4VovWP9O3mn5lbSWV0L9BmZpKIKI7lSlhlzB9KsRLCf
         +mMzqpsLpf1leMOwCqMr/TJ10VdxaoaJSHnpNrZDGL5vp5oy/k6lyqFcP9rs3nbCUJSJ
         gAXA==
X-Gm-Message-State: AOAM533sK2QN8lL6bxhOV9Mk7rENfD+ErAc3OMqjzk1qe55m6BvItURD
        xJyw54bI9312xM3TMxvT5Sw=
X-Google-Smtp-Source: ABdhPJz/L1MMK7NVUm1Vf+MPoZ/cbNAxRDW8TWSdQwxfslFWRQDLLzBAv75iqpbC41ReCW3RWdLh7A==
X-Received: by 2002:a63:161e:: with SMTP id w30mr873994pgl.255.1601445026190;
        Tue, 29 Sep 2020 22:50:26 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id g206sm724587pfb.178.2020.09.29.22.50.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:50:26 -0700 (PDT)
Date:   Tue, 29 Sep 2020 22:44:55 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] memory: tegra: Add helper function
 tegra_get_memory_controller
Message-ID: <20200930054455.GF31821@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-2-nicoleotsuka@gmail.com>
 <93803d8b-9863-e977-fa87-a03e877b095d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93803d8b-9863-e977-fa87-a03e877b095d@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 08:12:10AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 03:30, Nicolin Chen пишет:
> ...
> >  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
> >  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
> > +struct tegra_mc *tegra_get_memory_controller(void);
> >  
> >  #endif /* __SOC_TEGRA_MC_H__ */
> > 
> 
> This will conflict with the tegra20-devfreq driver, you should change it
> as well.

Will remove that in v3.

Thanks
