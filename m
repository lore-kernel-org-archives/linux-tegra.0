Return-Path: <SRS0=h/hb=EB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7185AC388F9
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 20:18:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2246321D42
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 20:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603743487;
	bh=9ya9JlGvCxq+lIqzmEJuKiLTeuZb7ta+yklVxCf0DF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nMCrmuXVEdyLtjLY2In2ZsTtPVYq+tNQNuCyBcsqgsZwCsK1Ba577W4m7Tln4pZOV
	 hK+lv/yh/nww9ksK5Gp/qYsE9HJgLlPGT+69OYGvwfhG5iFiyl+v8TQtkxfV6qTa9Q
	 N0HRL5kEU0gNg+2JSVq3+LKVSc+xbx7KgL+h6BRk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730581AbgJZUSE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Oct 2020 16:18:04 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:34916 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730569AbgJZUSE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 16:18:04 -0400
Received: by mail-ej1-f65.google.com with SMTP id p5so15589418ejj.2;
        Mon, 26 Oct 2020 13:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LrCLUWIWHIw+S5igFH+N8YiZTZ/ZbsmQrGtIQcWXbAk=;
        b=JupbH+YM05xuhp2cS0+jUy0CDI6kBXAnXNOLwM0kinu7G+Dw4EiwhhrK7iGxqm4+in
         9bcl2YZZkHm1RiMixwfr8O1R9UjhR5eA8ktvALrDbTSeXWGYf5SJQUU9LLTJBLXDc0dw
         nO1rQ3/Om+AHLJO5jVfXrQdxFAqOcB7Ce1tQGo238j5GJT0LwFtmrxES8Cr/34p6enuJ
         0zKn3vT5T8JRk8IgTbiQdJY4GM19+TutpJiQivt/XRGbX5fZepgrLRNSm0mhWcMzZ9Qx
         TYicEDLYp/+/h1j+/Nn4AViVw+9HuHdDwmGHduvURuA1k/loa6hMzNG70mIidLzFP/ev
         S4cw==
X-Gm-Message-State: AOAM532IRya3Al/DQbYKR3c4CfgUVoEAkhvV6JNySTw5WTyPfaaVpRzQ
        I4SmbH6W/6ygCjfxW6NiSUU=
X-Google-Smtp-Source: ABdhPJyx5uVn0978xfVN+j+OEHahtaYTOPdm6KpJy7YwMHiReKr2QktPIrLcqkyr3qExkAoVImpYnQ==
X-Received: by 2002:a17:906:fa99:: with SMTP id lt25mr16805249ejb.511.1603743481821;
        Mon, 26 Oct 2020 13:18:01 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id gq13sm6448856ejb.21.2020.10.26.13.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 13:18:00 -0700 (PDT)
Date:   Mon, 26 Oct 2020 21:17:58 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>, robh+dt@kernel.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: memory: tegra: Add missing swgroups
Message-ID: <20201026201758.GD248919@kozik-lap>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-5-nicoleotsuka@gmail.com>
 <20201009122110.GD458338@ulmo>
 <20201009155218.GA4469@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201009155218.GA4469@Asurada-Nvidia>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 09, 2020 at 08:52:18AM -0700, Nicolin Chen wrote:
> On Fri, Oct 09, 2020 at 02:21:10PM +0200, Thierry Reding wrote:
> > On Wed, Oct 07, 2020 at 05:37:45PM -0700, Nicolin Chen wrote:
> > > According to Tegra X1 TRM, there are missing swgroups in the
> > > tegra210_swgroups list. So this patch adds them in bindings.
> > > 
> > > Note that the TEGRA_SWGROUP_GPU (in list) should be actually
> > > TEGRA_SWGROUP_GPUB (in TRM), yet TEGRA_SWGROUP_GPU (in TRM)
> > > is not being used -- only TEGRA_SWGROUP_GPUB (in TRM) is. So
> > > this patch does not add TEGRA_SWGROUP_GPU (in TRM) and keeps
> > > TEGRA_SWGROUP_GPU (in list) as it is.
> > > 
> > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > > ---
> > >  include/dt-bindings/memory/tegra210-mc.h | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/include/dt-bindings/memory/tegra210-mc.h b/include/dt-bindings/memory/tegra210-mc.h
> > > index c226cba9e077..f9fcb18a6d9b 100644
> > > --- a/include/dt-bindings/memory/tegra210-mc.h
> > > +++ b/include/dt-bindings/memory/tegra210-mc.h
> > > @@ -33,6 +33,16 @@
> > >  #define TEGRA_SWGROUP_AXIAP	28
> > >  #define TEGRA_SWGROUP_ETR	29
> > >  #define TEGRA_SWGROUP_TSECB	30
> > > +#define TEGRA_SWGROUP_NV	31
> > > +#define TEGRA_SWGROUP_NV2	32
> > > +#define TEGRA_SWGROUP_PPCS1	33
> > > +#define TEGRA_SWGROUP_DC1	34
> > > +#define TEGRA_SWGROUP_PPCS2	35
> > > +#define TEGRA_SWGROUP_HC1	36
> > > +#define TEGRA_SWGROUP_SE1	37
> > > +#define TEGRA_SWGROUP_TSEC1	38
> > > +#define TEGRA_SWGROUP_TSECB1	39
> > > +#define TEGRA_SWGROUP_NVDEC1	40
> > 
> > I'm not sure this is right. The existing list is based on "Table 4:
> > Client to Software Name Mapping" from page 28 of the Tegra X1 TRM, and
> > none of these new swgroups seem to be present in that table.
> 
> I went through all the MC_SMMU_XX_ASID_0 registers. All of
> them have their own ASID registers that I added in PATCH-5.

Thierry,

Any follow ups on this topic? Does it require a fix or looks correct?

Best regards,
Krzysztof
