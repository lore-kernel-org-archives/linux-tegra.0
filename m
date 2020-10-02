Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B9EC4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 19:59:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C22B206C3
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 19:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQtLyZ07"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgJBT71 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 15:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgJBT71 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 15:59:27 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7ACC0613D0;
        Fri,  2 Oct 2020 12:59:27 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gm14so1575887pjb.2;
        Fri, 02 Oct 2020 12:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=e7SQDZcmp06i2MnglIpbgJWxBlwmzks0SxtMaIUgdmg=;
        b=MQtLyZ073lcMfUW2lOPnmNjx261o8CMAotnJJ15uMlPEGqZEfGlF7crnz3IDpqwAL+
         IdLTuZaVxs/I8feHggsB4Rlu59QG/7BVuvvj7fLuNFgdvJy+uKh6O9xgUBXLVSaF4SV7
         e1lBjZ7cxn7xpqjDQfOyHpwYd7LjCH5o4X7Ad4vNs9bUuOTPEW33RKC7kmC8AVIhM/0F
         BKswsmEMfEJgWLmIW9LAVUVaxr95k6jlNQWjwKiymVQRanlEhE64hO2ppRgJAQ8BD9TA
         mIaqbnr3FlfP+uQRwh8PIUhVJv8lm7L8vl8ODRczT6L3lQcxbwbbbwgbRkb4T0nWs+s7
         6+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=e7SQDZcmp06i2MnglIpbgJWxBlwmzks0SxtMaIUgdmg=;
        b=EPPS5KYx+WXpoPupzqy2xvsAZaYRroMz5GovSu+r0I7dEtLItHRIQTNeJ9x+fe/Ceg
         op60u9nIrK41U+uV+KqWyELSN/ox58EdqNnam4+w7NEvY4hHVuvJFwUjeas4wu5pQD41
         QjB0eE3SUDGPWv2vobgcWhjthl9VgF7Xihjih8oHNiypUJP2L8JZAiUFoC+kFXH0+Ko7
         tppYxxRoTyDjswRCHLY4AwnRQVktP6cXg+BtfjU2js+Jv/zefunv6ZR2GSziHZJz1fnD
         wpHaD1oHHBzOR/eqpa+R1yTcpQt0M22ik4T7ikLquPW9bM4nGo97BfwNpNWbQeJp/LC4
         rQ2Q==
X-Gm-Message-State: AOAM5310sSGj/GJzM8jt9ZJ1zejpX9xhZCRlAgncnsIsCkKbzAxENRNT
        +MCCtBXmEnNBhqbD94HAg6k=
X-Google-Smtp-Source: ABdhPJxmqaJ7RKQLXQ8kRQy1TZM39oLaf2sAXofCPdJ6CBy9/O61RCdLTOC6xLwl3t8bSx8oU4lX3w==
X-Received: by 2002:a17:90b:4b82:: with SMTP id lr2mr4449264pjb.184.1601668766360;
        Fri, 02 Oct 2020 12:59:26 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id e16sm2517075pgv.81.2020.10.02.12.59.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 12:59:26 -0700 (PDT)
Date:   Fri, 2 Oct 2020 12:53:28 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201002195328.GE29706@Asurada-Nvidia>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <c42f1f51-9fa5-6503-91aa-3809f1f27d0c@gmail.com>
 <0f186339-1e49-4878-834e-11ae8bf140f2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f186339-1e49-4878-834e-11ae8bf140f2@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 02, 2020 at 05:58:29PM +0300, Dmitry Osipenko wrote:
> 02.10.2020 17:22, Dmitry Osipenko пишет:
> > 02.10.2020 09:08, Nicolin Chen пишет:
> >> -static void tegra_smmu_release_device(struct device *dev)
> >> -{
> >> -	dev_iommu_priv_set(dev, NULL);
> >> -}
> >> +static void tegra_smmu_release_device(struct device *dev) {}
> > 
> > Please keep the braces as-is.
> > 
> 
> I noticed that you borrowed this style from the sun50i-iommu driver, but
> this is a bit unusual coding style for the c files. At least to me it's
> unusual to see header-style function stub in a middle of c file. But
> maybe it's just me.

I don't see a rule in ./Documentation/process/coding-style.rst
against this, and there're plenty of drivers doing so. If you
feel uncomfortable with this style, you may add a rule to that
doc so everyone will follow :)
