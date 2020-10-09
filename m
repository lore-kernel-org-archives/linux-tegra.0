Return-Path: <SRS0=2JVP=DQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405DAC433E7
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 15:59:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C833F222C4
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 15:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSog1ZQM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389296AbgJIP7c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Oct 2020 11:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389135AbgJIP7c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Oct 2020 11:59:32 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077B5C0613D2;
        Fri,  9 Oct 2020 08:59:32 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r10so7495080pgb.10;
        Fri, 09 Oct 2020 08:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/DqIopHg2DytPXFe4tTELvkm+Ygpmw07gfMt//G6jIg=;
        b=aSog1ZQMiGhQsYRKt/6iwxVGcAM9vhPcwRC1PjDXtMsGULm/oufclx2c7OqhaKOvxB
         HbnvJrk2FB/rQM2q8CULnl6xiWYK9u5W278iKIqRLDgTimXD0VLDBIQAipzFEwC/GCb2
         Pb7wjQWl+Ph69vKbIwVwqg+mW0P3meawaw0O0xZtpSK74Yysj6k51SbAsiocpROyN5X+
         DgwykLqy3LqfF9FkZ50kU4c12+bhIbmXJqQko83OGqmXEqprxB9pBqNVNPIA3MAoqHpD
         diEo8KUS4y69ThK1cUBfhwlcNjsHe1f2mGDb/cB7oOMT4cowSOlViHxseF+oBQMYm4v2
         0Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/DqIopHg2DytPXFe4tTELvkm+Ygpmw07gfMt//G6jIg=;
        b=sqDbGsW7/1gi5pM11Cpr/B3ykIJve4V9XC7f+p5A5pq6AKOF7JK7HHvUXSM5+rch9r
         WIWKNULZSwOyyJRrRrxRgSwCMDI/4fhWXds6aYjsGukQWD/kIyYMq8pzyef5qYa+bFbq
         fXSoe9QKtG6WWrRaS4/TJoTB8R0FfAS6uvdjKSJdXm3gg4g2gct4q0/89OPgILt2iffJ
         uOIIxK7Z8FPHngpaFdwBR9u5Gw4DNSQJlIr2X2mGcXH27kDTrydEtFEcCxoBq3eIyazm
         oDDzHeYIaypbrDZkjQqHUr1Po6KBsXMx2FX6InOsU5GwS72UtW8k6tu4HrZI89nSTUMe
         5N4w==
X-Gm-Message-State: AOAM5318rjDZCqrcuZgBIjBLNNieBAYbRiBo9L5BMRxyWVLryrqvwh7D
        6o6gFX0uXv5g809ueZT90V4=
X-Google-Smtp-Source: ABdhPJyoz/4etqW6WR1sy2O4bWNjHIzexhA4N6iM23jQOBRdVNftWIbFGnwXKY+GKlFg2WlepmsQNg==
X-Received: by 2002:a63:e354:: with SMTP id o20mr4026824pgj.317.1602259171473;
        Fri, 09 Oct 2020 08:59:31 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d128sm11575914pfd.94.2020.10.09.08.59.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 08:59:31 -0700 (PDT)
Date:   Fri, 9 Oct 2020 08:52:18 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     krzk@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: memory: tegra: Add missing swgroups
Message-ID: <20201009155218.GA4469@Asurada-Nvidia>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-5-nicoleotsuka@gmail.com>
 <20201009122110.GD458338@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009122110.GD458338@ulmo>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 09, 2020 at 02:21:10PM +0200, Thierry Reding wrote:
> On Wed, Oct 07, 2020 at 05:37:45PM -0700, Nicolin Chen wrote:
> > According to Tegra X1 TRM, there are missing swgroups in the
> > tegra210_swgroups list. So this patch adds them in bindings.
> > 
> > Note that the TEGRA_SWGROUP_GPU (in list) should be actually
> > TEGRA_SWGROUP_GPUB (in TRM), yet TEGRA_SWGROUP_GPU (in TRM)
> > is not being used -- only TEGRA_SWGROUP_GPUB (in TRM) is. So
> > this patch does not add TEGRA_SWGROUP_GPU (in TRM) and keeps
> > TEGRA_SWGROUP_GPU (in list) as it is.
> > 
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> >  include/dt-bindings/memory/tegra210-mc.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/include/dt-bindings/memory/tegra210-mc.h b/include/dt-bindings/memory/tegra210-mc.h
> > index c226cba9e077..f9fcb18a6d9b 100644
> > --- a/include/dt-bindings/memory/tegra210-mc.h
> > +++ b/include/dt-bindings/memory/tegra210-mc.h
> > @@ -33,6 +33,16 @@
> >  #define TEGRA_SWGROUP_AXIAP	28
> >  #define TEGRA_SWGROUP_ETR	29
> >  #define TEGRA_SWGROUP_TSECB	30
> > +#define TEGRA_SWGROUP_NV	31
> > +#define TEGRA_SWGROUP_NV2	32
> > +#define TEGRA_SWGROUP_PPCS1	33
> > +#define TEGRA_SWGROUP_DC1	34
> > +#define TEGRA_SWGROUP_PPCS2	35
> > +#define TEGRA_SWGROUP_HC1	36
> > +#define TEGRA_SWGROUP_SE1	37
> > +#define TEGRA_SWGROUP_TSEC1	38
> > +#define TEGRA_SWGROUP_TSECB1	39
> > +#define TEGRA_SWGROUP_NVDEC1	40
> 
> I'm not sure this is right. The existing list is based on "Table 4:
> Client to Software Name Mapping" from page 28 of the Tegra X1 TRM, and
> none of these new swgroups seem to be present in that table.

I went through all the MC_SMMU_XX_ASID_0 registers. All of
them have their own ASID registers that I added in PATCH-5.
