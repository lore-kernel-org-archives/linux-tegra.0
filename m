Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C066C4741F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 21:38:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B01312076A
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 21:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDP8U5qq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730528AbgI3Vi1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 17:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgI3Vi0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 17:38:26 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B7CC061755;
        Wed, 30 Sep 2020 14:38:25 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id y14so1993796pgf.12;
        Wed, 30 Sep 2020 14:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/7M+m304EbzXdELkQvrts+2IAKCx+eNRKpz9TTnYchQ=;
        b=PDP8U5qqzZT05fUVILGe3OnV05AlxULeVzaTbmN1blGKkX8i6n1on2U6MydWDO5quS
         zrhZs1QYBik1BH4Q4pCkt4DU4gDJQR4zW11H3ez3LNY+iC+DoXgepPqmPYzOaxuLs14R
         F/pWFEgIhfK1/XDf5gsZ0ixXUGPjJGp7eCaWWa3ZocUFhdBTOfzY1SYBJoryhatsNiLT
         uWaEIyB/eoGFDiZyotYwehpYYRZy3Ip7NtanSfKye5TLi986z0zRISfLquwLIwl4fNfA
         ApJIOXe9m00Oe4b7vdp3M4KlquPDyB/vXaKzhGy8zlGGmUJlf6AKBhKHv5yj3VZ/JY9O
         4xWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/7M+m304EbzXdELkQvrts+2IAKCx+eNRKpz9TTnYchQ=;
        b=D/JuTKaWOhIaLqvH/qZuIp2dC1iixcAfNi9QKdWrap1v4a5xUKaWqwcyrp3dwEwq9Y
         dxQ3dQ7DZmJD7BXTdO5UBE/G9INrLnbRklLWtBozUsUhmuR01FzZ7+cFjW+YJ9nywFFD
         ZVHCxlOjyE0HDXbpdcHKXwRj55p4ZyMObWFpMm+0WH4mBUUjydACdRzlxpvYIpqHtcAz
         Np+sWzMvDYGI5FlDaxtoakst8gIBf/WDahwCAmitRa7Wtmue/EWu7vHPqjnZLr8LSYWb
         nm0iwlIjPStQM1a8apIP2GBXACVO9VFcMO3Bc0HzadTmfi645DIFkAQYH13OtecPs4kn
         1SXg==
X-Gm-Message-State: AOAM532cWVcXUw0ZPtYr1P8iI9t3u9phA167hVIQ62bssPe2/cgyD+S8
        Fs1gf33LKzfSTg2j+E22QZUvwpQWXZg=
X-Google-Smtp-Source: ABdhPJw1hLq5lcWj28hcW5D/VbiXUDwlCYD9+XODjgXVO027DtJlObOk4ThtLe0DNXKOmM4EGrrtmA==
X-Received: by 2002:a63:c64f:: with SMTP id x15mr3547807pgg.135.1601501904553;
        Wed, 30 Sep 2020 14:38:24 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id h12sm3490699pfo.68.2020.09.30.14.38.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 14:38:24 -0700 (PDT)
Date:   Wed, 30 Sep 2020 14:32:44 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930213244.GA10573@Asurada-Nvidia>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 01, 2020 at 12:24:25AM +0300, Dmitry Osipenko wrote:
> ...
> >> It looks to me like the only reason why you need this new global API is
> >> because PCI devices may not have a device tree node with a phandle to
> >> the IOMMU. However, SMMU support for PCI will only be enabled if the
> >> root complex has an iommus property, right? In that case, can't we
> >> simply do something like this:
> >>
> >> 	if (dev_is_pci(dev))
> >> 		np = find_host_bridge(dev)->of_node;
> >> 	else
> >> 		np = dev->of_node;
> >>
> >> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
> >> sure that exists.
> >>
> >> Once we have that we can still iterate over the iommus property and do
> >> not need to rely on this global variable.
> > 
> > I agree that it'd work. But I was hoping to simplify the code
> > here if it's possible. Looks like we have an argument on this
> > so I will choose to go with your suggestion above for now.
> 
> This patch removed more lines than were added. If this will be opposite
> for the Thierry's suggestion, then it's probably not a great suggestion.

Sorry, I don't quite understand this comments. Would you please
elaborate what's this "it" being "not a great suggestion"?
