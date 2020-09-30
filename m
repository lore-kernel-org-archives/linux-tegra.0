Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E4AC2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:54:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49D2B20759
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoXSmTFB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgI3Fyc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgI3Fyc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:54:32 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBF3C061755;
        Tue, 29 Sep 2020 22:54:32 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h23so259936pjv.5;
        Tue, 29 Sep 2020 22:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=nOrl7UHF0nNN9i5bc0fKWH998hHBJl4SyOt3Ewm9Qus=;
        b=EoXSmTFBLz6iFITy4oZtdW1ZnHZn57r24dAvaCKr0dCgY6ksM+DYPw/3J8cc6+ue8Y
         oDIQ4cbPRfyaJofzjxn4HYROLa1W6CrOqvDxZQPG1KubS40Nsw+hnIMQil+49AuqSozn
         wq9xpHCF5BCHrxyTpEWIpVzZGfDCg5TGbQbEijOakd26zI0Xl2YdFSrGheN0oaUXtyIE
         vxddY8iPvo/FUdYEtobOQvZ8DPT1QRRg5d25v51tM6r01JK0LtYHYfnu4xRsoMWhzcWq
         zqtAahE8VsWHAR/WpLTgEFuchOurn+3cHb7MUnishtQO/nCAlgNX6gyUkq1DkfEALXTl
         Hq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nOrl7UHF0nNN9i5bc0fKWH998hHBJl4SyOt3Ewm9Qus=;
        b=enQYc+RgZn3LS/GZNZ8dnPYgJYYER+hnw8a03CmF/+GPArCCGHvVegrL8ltiUXo9zY
         H6F97csnJT2JmAV7XesMJS5cVtThsf13HxKw+4JKV1FgeBIqtNPkfpJ0bkXqvO0Q3h+z
         Ma3cOuJNdf4hD3HKlr2Tm4nSFphxSNBRxXiORLVaV/pLCNdHqkf4BFw8POeDnBlBvPow
         d7A1gWy0AusW3/Fw0TMrBVsy6biNzy/kN+kIfpTh0MTWbU2U5QGJhJZVd0H/VQmnRgRl
         TjWELF73slDkBEcX7QSKcTzyJkP4nYmLWh37vj0mc82f5O967JiTGG1x2yibB/bneaFa
         R1gQ==
X-Gm-Message-State: AOAM532bSX6qjrHp676Prfjk0DF2Je2sknqLcbcFgtyvWMApexnnntNL
        PHZADo96/jXSIy+nDY79ej8=
X-Google-Smtp-Source: ABdhPJyJBWhmdnNZa0VZas7IJXlcWAnavzrHh/Bboosyugl2BeI4Bn999Gi5I2W0kqRD0HfTE/LD0w==
X-Received: by 2002:a17:90a:c255:: with SMTP id d21mr1125704pjx.212.1601445272078;
        Tue, 29 Sep 2020 22:54:32 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id s20sm719415pfu.112.2020.09.29.22.54.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:54:31 -0700 (PDT)
Date:   Tue, 29 Sep 2020 22:49:01 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930054900.GG31821@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <75514da5-e63a-9e51-8376-abbd12c324d1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75514da5-e63a-9e51-8376-abbd12c324d1@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 08:11:52AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 03:30, Nicolin Chen пишет:
> > +	/* An invalid mc pointer means mc and smmu drivers are not ready */
> > +	if (IS_ERR_OR_NULL(mc))
> 
> tegra_get_memory_controller() doesn't return NULL.

Well, I don't want to assume that it'd do that forever, and the
NULL check of IS_ERR_OR_NULL is marked "unlikely" so it doesn't
hurt to have.
