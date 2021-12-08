Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C07C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 17:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhLHRJ6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 12:09:58 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:38920 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbhLHRJ6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 12:09:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7EBA5CE213A;
        Wed,  8 Dec 2021 17:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B15C00446;
        Wed,  8 Dec 2021 17:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638983182;
        bh=7cbK4ZCKsJNgfLZ67xcyKxGuyBMvGclVY550dwepVlM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RNvCh2LbWYgEfBml/ykEHlFfNYm+tuGdyfb+yA2PUOznq1wx1p8fO6iP0xccUJoFo
         VnIOIPzKVqVLAzXq6U8xOMRMzWcA+w/UkQrbhy6xrVi04+2IJJP8aEhtynjnHdHzel
         inPmCGXZrL2HMikJs9QLyME7zszaYLHZtgpEe63i1vGcKWzBYI9lUo7QSMb5lRMQGp
         Ci2M19dXKVOJ/d48oIJV8dwzliyMhawwrxY6ge8Xc36aNU8cscd1P6dpPBLUyX0OLN
         ri2UlAfoCDv+2IVP6W2wvmX75Fh5j8f/EGUdtuO4YcvKn4U/m8t4+FMzmb7gojk2MT
         B4TwMNyqAd9BA==
Received: by mail-ed1-f54.google.com with SMTP id e3so10685787edu.4;
        Wed, 08 Dec 2021 09:06:22 -0800 (PST)
X-Gm-Message-State: AOAM532Wm4xzbuKd+O97vxHIvC0I1fqceXRReU6kqbDEZpWHgPs7nAUm
        6IjDpSOYDr9iHS/2yOX7VIunWLN5dXcU60Z27Q==
X-Google-Smtp-Source: ABdhPJzpAG8fio4RrcP6KmTzb1JRqJQLvVchEP25YK3OI2ZO2Ok1tmqcBh2smrezDvXdWKq2fL6Je64NRj/D+cFWs1E=
X-Received: by 2002:a17:907:3f24:: with SMTP id hq36mr8851438ejc.390.1638983180992;
 Wed, 08 Dec 2021 09:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20211207150746.444478-1-thierry.reding@gmail.com>
 <1638971068.754546.3857733.nullmailer@robh.at.kernel.org> <YbDEBexUo8WYKVwd@orome>
In-Reply-To: <YbDEBexUo8WYKVwd@orome>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 8 Dec 2021 11:06:08 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+tqCsan1WgLZqJTeUxdHY4QhJqPYzwF3vMz7yMFdvPKA@mail.gmail.com>
Message-ID: <CAL_Jsq+tqCsan1WgLZqJTeUxdHY4QhJqPYzwF3vMz7yMFdvPKA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: pmu: Document Denver and Carmel PMUs
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Dec 8, 2021 at 8:41 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Dec 08, 2021 at 07:44:28AM -0600, Rob Herring wrote:
> > On Tue, 07 Dec 2021 16:07:44 +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Add compatible strings for the NVIDIA Denver and Carmel PMUs.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/pmu.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> >
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> >
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> >
> > Full log is available here: https://patchwork.ozlabs.org/patch/1564747
>
> Yikes, that's a lot of warnings. I've got local patches to fix up the
> Tegra-specific ones, but I could look at fixing up the others as well,
> provided that you or anyone else aren't looking at this yet.

I sent it because I saw the tegra ones.

> On that note: do you know of a simple trick to get the dtbs_check target
> to run on all DTB files? The only way I've found so far is to manually
> select all Kconfig options that would enable a specific subset, but it'd
> be great if we could just run the checks on all irrespective of .config.

Yes, there's a config option hidden behind COMPILE_TEST. I just use
allmodconfig/allyesconfig when I want to do that.

Rob
