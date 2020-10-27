Return-Path: <SRS0=mUr2=ED=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6538C56202
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 01:47:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7942422447
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 01:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmsCsK07"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgJ1Bih (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Oct 2020 21:38:37 -0400
Received: from mail-pl1-f171.google.com ([209.85.214.171]:37694 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1833047AbgJ0XmA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Oct 2020 19:42:00 -0400
Received: by mail-pl1-f171.google.com with SMTP id b12so1591957plr.4;
        Tue, 27 Oct 2020 16:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ynb4UQ8S1YR6TC4mLp5F2oEOuOqDNBlQqTE5eCrKodc=;
        b=QmsCsK07u1upUbKJ3/TVXCAA5ErdQLGEprK56zQVS78qOs6fuMZO8dB2hSooDymuvH
         QQvEBLdQnq7nLkw8qMMBixCn+LGcOfw6UVdZ8ZbisziWHnvnAvOxxBS9NWEq+a/paunx
         zao030fDM06whyc9X0UYCvio2c5jp5CISQ+vufb/1Pc2xDF1rzmK9azx4wkknNMlYpE9
         Tv46zGXZLlbfVd26hOQE0q8HTqZqlk9QVHHlJADESDhpPEo+WfuO3SZ+s4DbPwIPPIoT
         hmkWl2QaSCvHFQLQakhtno44YEw6wwQzlfq3yynA9eKS3WT94kfUxlrDu/JXAWU+Uy4L
         ox6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ynb4UQ8S1YR6TC4mLp5F2oEOuOqDNBlQqTE5eCrKodc=;
        b=GONUGVkg+yPqtyOGqNCG7+MWKMSWn8MYuA3h07HNryN2LQNT1XUVzjzzX4AZVOCXAx
         rlrZRXGbYsJHp+Ini4+xah8xreH04SczDeESM+hE28uFjS2mUl7v12yCF0Xoc9CmMdIl
         wQugmt9b+lik/EdJ7f/6TSqadfZkTg+rwUxGhv7kxmAxlLD+6yJg/w5lX0+p56NWODDE
         0d3giUg0L7yejLb8qH6WyuKxGyb2gAtmuPbHzqaS7eFj0bwGVxI2DVLENYqBYYXvKpxw
         e8Cn81cFsUWKD3r7MiTK6orrRk7x9dGjc3RSuoOsvwaAraqwDl4MTcwAflxWzADHM79S
         GZXA==
X-Gm-Message-State: AOAM533SIa3ayEKjVnxE56t51taZaScOv15NsG/7JV08LxX2ObKda4Pc
        iQNgyk+fqVavsBqotykXFfY=
X-Google-Smtp-Source: ABdhPJwdwQHo//JriAxA7x8WfTyAO0lWa0ziQHni2MECXRmOiEtEMumUopTUXnhVTudDEelMvXOc4w==
X-Received: by 2002:a17:90a:498d:: with SMTP id d13mr4301628pjh.86.1603842119240;
        Tue, 27 Oct 2020 16:41:59 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id n1sm3208872pgl.31.2020.10.27.16.41.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 16:41:59 -0700 (PDT)
Date:   Tue, 27 Oct 2020 16:31:32 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, robh+dt@kernel.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: memory: tegra: Add missing swgroups
Message-ID: <20201027233132.GA11164@Asurada-Nvidia>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-5-nicoleotsuka@gmail.com>
 <20201009122110.GD458338@ulmo>
 <20201009155218.GA4469@Asurada-Nvidia>
 <20201026201758.GD248919@kozik-lap>
 <20201027125506.GA1822510@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027125506.GA1822510@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Oct 27, 2020 at 01:55:06PM +0100, Thierry Reding wrote:

> This does indeed look correct, based on what registers exist for these.
> It'd be good to know how Nicolin expects these to be used, since these
> are currently not listed in device tree. There's certainly some like

Judging from our downstream code, I don't actually expect all of
them will be used, except some being used yet not got upstream.

> TSEC or NVDEC that we don't support (yet) upstream, but things like DC1
> and HC1 already have equivalents that we use, so I'm not sure how we'll
> integrate these new ones.

Downstream code groups those equivalents swgroups, so I think we
can do similarly using tegra_smmu_group_soc like the existing one
for display, if any of them gets upstream someday.
