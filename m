Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6E3C56202
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 10:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C276520872
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 10:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lw8YkB83"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgKYKJj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Nov 2020 05:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgKYKJj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Nov 2020 05:09:39 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DABC0613D6;
        Wed, 25 Nov 2020 02:09:39 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f17so2027235pge.6;
        Wed, 25 Nov 2020 02:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7UB1VwfUNRdnhielmEFkYpUl+QJqWs5102vTTuwXUyw=;
        b=Lw8YkB83gM/PwTerYxcBiRNaOxNBetoyEavPznuzdB8scSAJDAfEiTtViswcQL9Naa
         pwi3RS2Xsda90l5qmGgsqCyUcIFnsht7yfQHKQS4JiDGskpvhcsUDv37SaZjbGv2iwaL
         IJ0nq7Cseu3m/OG3XtUF0K5ZFoOAj8jPSOG4DHQ0wnw2Gy+zRNtp0i39gDKJCkUr/zbF
         AupG+q2g00nKEgJIVKb0jo42S4bft4DlEM+c5aTeNLbvKT1ZBc23deWEIoqPYaQclqPo
         iANb8UnHqZmRVFLSH26POuHUPE6siKhWtNXdp3QrKzMD5cspDLDIAvnvTiqGPAvtgYvk
         kK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7UB1VwfUNRdnhielmEFkYpUl+QJqWs5102vTTuwXUyw=;
        b=DAaIsKrGG0DzMndC8+VGg/ZofBf8+CGueJNmPVBUtQxsTF5/gGQuPaT30FBjlfOtPM
         CX0zNK+shKarI5s8zCedhyIZk82RB68AuRIMzEyy6Gy25Scf/782Rq7LxY2sHsA9h3FU
         NQ9TtZIiZkjg4i44ncZyDStETXK5d0tvUYqH5q8PtUCN1FEoMT1zLDL4j17A/V/21XRu
         +aH7/INt0YkarjSKapqHF68iQzFAAL65TkbrrIv0swqQaNTUu59fSuRyMm0m++7Aq9gS
         ANq6K/DBls8mLug7XDgU/PdsmCFMZxaQIkx0lRgxVyPxHiDT1y/0yfl6TgKDEHiPcnhF
         ZVKQ==
X-Gm-Message-State: AOAM531pYjiT21oe0SKcx7UHN7nohNdRHe5d3m/JJRgQzAyH9sy8lsJI
        dlOLmvv2+HzJJ9k31Qr5BFrMEiSdNhbgSQ==
X-Google-Smtp-Source: ABdhPJz7JWwX2J93K0LMh6QODhHit3hmgdw0k19rbXJ1Iuh3+c4jpfPXav0q+CckJ/heF1zGoD0now==
X-Received: by 2002:a17:90b:1490:: with SMTP id js16mr3266093pjb.215.1606298978581;
        Wed, 25 Nov 2020 02:09:38 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id f134sm1615230pfa.208.2020.11.25.02.09.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2020 02:09:38 -0800 (PST)
Date:   Wed, 25 Nov 2020 02:08:06 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Will Deacon <will@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com
Subject: Re: [PATCH RESEND 0/5] iommu/tegra-smmu: Some pending reviewed
 changes
Message-ID: <20201125100805.GA14856@Asurada-Nvidia>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
 <20201124212100.GA32108@Asurada-Nvidia>
 <68237d7c-12f7-3053-2e79-75b7e95f0af3@gmail.com>
 <20201124231215.GA32405@Asurada-Nvidia>
 <20201125095509.GB15052@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201125095509.GB15052@willie-the-truck>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 25, 2020 at 09:55:10AM +0000, Will Deacon wrote:
> On Tue, Nov 24, 2020 at 03:12:16PM -0800, Nicolin Chen wrote:
> > On Wed, Nov 25, 2020 at 02:05:14AM +0300, Dmitry Osipenko wrote:
> > > 25.11.2020 00:21, Nicolin Chen пишет:
> > > > These five patches were acked by Thierry and acked-n-tested by
> > > > Dmitry a while ago. Would it be possible for you to apply them?
> > > > 
> > > > Thanks!
> > > 
> > > You probably should try to ping Will Deacon.
> > > 
> > > https://lkml.org/lkml/2020/11/17/243
> > 
> > Thank you, Dmitry.
> > --
> > 
> > Will, would it be possible for you to take these changes?
> > 
> > I sent them on Nov 11 to the following lists:
> > linux-kernel@vger.kernel.org
> > iommu@lists.linux-foundation.org
> > 
> > If you need me to resend it again by adding you in To line,
> > please kindly let me know.
> 
> Weird, this ended up in my spam. If you wouldn't mind resending with me
> on To: then please do that. Then I know I'm looking at the correct version.

Resending.

Thanks!
