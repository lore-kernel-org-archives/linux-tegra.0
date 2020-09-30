Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21389C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 07:22:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAC7B20848
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 07:22:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIjQ4Kq7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgI3HWY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 03:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgI3HWY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 03:22:24 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F020C061755;
        Wed, 30 Sep 2020 00:22:22 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y6so473217plt.9;
        Wed, 30 Sep 2020 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=yJyPv9TfvoTiNiepUCS1moee1qgA1MUCDqAQ76iLRGw=;
        b=dIjQ4Kq7OP6C1q55KiX7llzOLRIxLxLiAEZUJPtcvKr22oEfblNhrGHtxeM8XIyCOI
         /W/jTi0/dVSNlDsYDUxCqyCzw0wIbPPIoOJWVZHcnie4W616Ent7T6zODTqDg4uABts3
         hi4fibufYdX0d39thb8ihr7pTCHR/Dhpy1nhM0TrWsDYMdy+FTasX9wI62aVQ/AnQYYp
         pUnD1gPZir2hrCQi/uqU7HKaMUy8FwlN03RAm6Ik1W8MPPt8lyjBlvVE7Od59AX3Y7Lr
         RuEK7b1wgvRayFlXhpzLopy50CZF5YLeVwJmAs68gQYgRH/Lmg82pi3Vhn9zwF5h3ImP
         hfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=yJyPv9TfvoTiNiepUCS1moee1qgA1MUCDqAQ76iLRGw=;
        b=ZYBVykERjxmboW6sG1JmUZRxXkdlq5s9e2OlFO+bI0eWzop2IsEvQUU7g0bVRUKejW
         gmVSIcJfPg4ZScRn7w62WPWYKoRgd/Gyds//hB6y060Gd8xUdrRTL1KcV9+4ntllsrt3
         wICoYfZI6kTxJ1LqK5GfLPAUxakfe+Mp6Jgsrpmuc79EjaEFekkHKQTKH1LjXnI9kB58
         Ru7JS0U8AnhNo1EM2l2Bqkx5tLWLy+Uo3hUjuVjIFRt6rmRPaY+bHef5or5dy5aUiz8j
         PDcviwl62mhyZeDwraWuKpZdUFv1VPtsSdmIaDWdYt7UGHBzppVTz37cPAuocYDhlweN
         N6HA==
X-Gm-Message-State: AOAM531rG09n/foOyK22nx91wTBE3hRYcUn8GTtmtFQ6qhfTA4E5dkjl
        fCgdDGMUprPt0KuiDzzcFIU=
X-Google-Smtp-Source: ABdhPJz/rnWA9bYT3PPtMlpoljxk/a7LibergtvDqyjwYz/Z7mihUyup7d6kfRH6Q8SIbLPsHcf17A==
X-Received: by 2002:a17:90a:c17:: with SMTP id 23mr1347882pjs.127.1601450541995;
        Wed, 30 Sep 2020 00:22:21 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id v65sm939141pgv.21.2020.09.30.00.22.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 00:22:21 -0700 (PDT)
Date:   Wed, 30 Sep 2020 00:16:50 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20200930071650.GB13876@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
 <f07d4fcc-ee19-874b-c542-0679660c3549@gmail.com>
 <20200930052952.GB31821@Asurada-Nvidia>
 <96e71d38-5888-5b21-f0e1-9e6def50484e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96e71d38-5888-5b21-f0e1-9e6def50484e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 08:58:50AM +0300, Dmitry Osipenko wrote:
> 30.09.2020 08:29, Nicolin Chen пишет:
> > Hi Dmitry,
> > 
> > On Wed, Sep 30, 2020 at 08:10:07AM +0300, Dmitry Osipenko wrote:
> >> 30.09.2020 03:30, Nicolin Chen пишет:
> >>> -	group->group = iommu_group_alloc();
> >>> +	group->group = pci ? pci_device_group(dev) : iommu_group_alloc();
> >>
> >> This will be nicer to write as:
> >>
> >> if (dev_is_pci(dev))
> >>     group->group = pci_device_group(dev);
> >> else
> >>     group->group = generic_device_group(dev);
> > 
> > Why is that nicer? I don't feel mine is hard to read at all...
> > 
> 
> Previously you said that you're going to add USB support, so I assume
> there will be something about USB.

I was hoping that it'd work for USB. Yet USB doesn't seem to have
an different function for device_group().

> It's also a kinda common style that majority of Tegra drivers use in
> upstream kernel. But yours variant is good too if there won't be a need
> to change it later on.

Okay..I'll use yours then.

Thanks
