Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602D2C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 11:23:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BDAC21D7F
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 11:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvsNSj6b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgIQLXc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 07:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgIQLXA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 07:23:00 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3675C06174A;
        Thu, 17 Sep 2020 04:22:59 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id r19so974097pls.1;
        Thu, 17 Sep 2020 04:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OY4SO5nFE7KdPupdQ8u5OIhV4Gkr+fJvE2+DG/emg9o=;
        b=hvsNSj6bS5FmO3BXPJIbt+BGy3okyL9JagaNRBHhyZkwQDi7LjNPEBHHYxbSe2kddC
         IsJaIvhbaDq3ZBjbiDc/S8fpKEMRIGYSm80p0pwRvQ0ty9lf1D2r8jN2942W04jdnLsM
         VWaspF9GtNo0aLlL3kKAjJDxqkkmHiVtdPBrgmyjiBDLTjX7dqpx/5r/gpwTym4IoKWs
         +NZmRZPU5qCbrlqj7C+NiWWvuiclmvL+MtfN+wnJVoWr3PUW2FbGF51c2uh0d3FBsBhN
         ww6EqV0+uTqOP9Z0z/3nTs0Rq4XUiRsRzYyblRlg3lvY9M1p9/UMUAKFSLjgz6OJeXof
         0D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OY4SO5nFE7KdPupdQ8u5OIhV4Gkr+fJvE2+DG/emg9o=;
        b=lcVtI8nFBW2sp9tiDTkLTU8Iit4J+keJhQDI0ebqSQQUwNsXvQhsqc5cn8csVjuZuG
         ZEji3cd9Dg7lk+VXP9AslDvC3mOBzZRxJOKnQzhd6GJWEYvIOvpM8rjgnkYluYVgTejr
         gODzqApHyvoTgSWDFKDP5apjf2x9ttEl3uWX5R0Nb69oSUjh8cJKtyyHhW54gr00wHsW
         pVVbMoWIpcH4Qxui2jHhfWyuzn5pAL2orbEHx/q6UK5v3HYbQzjqNjBAZjLXvNKhS12n
         9UZSJuUytdA1P9aXjYkM31UGtdToH5W3Bea/mh6iKu0njyNctUKTYa96DG9zLKgeShTO
         pkeQ==
X-Gm-Message-State: AOAM530kO8YJ4pwci4Q9zjxrQiryr54HH5+oi6ekAOPi6ZZ/DdsRJtQh
        NRlU2Du7oiOlrunYP0Igt52QcdzPvUY=
X-Google-Smtp-Source: ABdhPJwmttNRwnuVNn94v6XiKOKMt90dhA1lkfsqqw0fnEKyABBv096p+HBcHqMPlAhQIgd+CjUlhA==
X-Received: by 2002:a17:90b:208:: with SMTP id fy8mr8222682pjb.153.1600341778876;
        Thu, 17 Sep 2020 04:22:58 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id y202sm21433183pfc.179.2020.09.17.04.22.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 04:22:58 -0700 (PDT)
Date:   Thu, 17 Sep 2020 04:19:41 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        jonathanh@nvidia.com
Subject: Re: [PATCH] memory: tegra: Correct num_tlb_lines for tegra210
Message-ID: <20200917111940.GA12912@Asurada-Nvidia>
References: <20200915232803.26163-1-nicoleotsuka@gmail.com>
 <20200917104315.GI3515672@ulmo>
 <CAJKOXPf5zqJYvaZc102PnTOXKrNYm8fReeJQGGx8eaQDCXavkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPf5zqJYvaZc102PnTOXKrNYm8fReeJQGGx8eaQDCXavkw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 17, 2020 at 12:54:42PM +0200, Krzysztof Kozlowski wrote:
> On Thu, 17 Sep 2020 at 12:43, Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > On Tue, Sep 15, 2020 at 04:28:03PM -0700, Nicolin Chen wrote:
> > > According to Tegra210 TRM, the default value of TLB_ACTIVE_LINES
> > > field of register MC_SMMU_TLB_CONFIG_0 is 0x30. So num_tlb_lines
> > > should be 48 (0x30) rather than 32 (0x20).
> > >
> > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > > ---
> > >  drivers/memory/tegra/tegra210.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Please send this as part of a series including:
> >
> >     https://patchwork.ozlabs.org/project/linux-tegra/patch/20200916002359.10823-1-nicoleotsuka@gmail.com/
> >
> > Adding Joerg for visibility. From the Tegra side:
> >
> > Acked-by: Thierry Reding <treding@nvidia.com>
> 
> So basically applying this one alone breaks existing platforms and
> makes history non-bisectable...
>
> Nicolin, the bisectability is important requirement so you must always
> mention the dependencies between patches.

Sorry. Will be careful next time.

And I am resending both in a series.

Thanks
Nic
