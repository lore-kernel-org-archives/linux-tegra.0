Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3E0C433DF
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 20:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07D4C21D6C
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 20:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMkVzAcs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgJHUdV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 16:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgJHUdV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Oct 2020 16:33:21 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAE1C0613D2;
        Thu,  8 Oct 2020 13:33:21 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d6so3319745plo.13;
        Thu, 08 Oct 2020 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+9L4TGyRB3sgaLfAZji2FCDMnlQHDS+agpOJzWkCjME=;
        b=gMkVzAcsOzVrbeDCAEFnfhjNCHlbp5xtxfmXTUYIUc5Tc/9T9Vlj4Vb+u6AUIXON6J
         Q19EEjpJ3Fsbe5gK5z4heLoVsn9h5A5U1Injsr+657ZEPBg+vlQDnXIGnDbkCuqJA7lh
         ZOFkasbhL8wdBgbeW57lr/X8t1LZNYGeh1UsW08P2cu+y7QMtPuhCuxzl1r2fxUviuW1
         WTD0Xy32SG5YRCgnKMxFE59077Jx4FMuBFpRwHP14E+q4DqzXuc68bDLjKlRBnmDn83R
         K76nJ8KRJWnot2ER/OpvCuIiBBEuPOgarw3S1lMyHXVfPbKzpHMdlfAwgnIUbeDLIRIK
         bhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+9L4TGyRB3sgaLfAZji2FCDMnlQHDS+agpOJzWkCjME=;
        b=YjuG9+n3eeWhxK7sB3EmdSNDD2ImVgvoGMam1CNggP/THRzsT6aHtDEPlTzOL505VY
         f+/1ffwg+YoTB6OGm9154/b6OsIKLUARM8AHwk91zVwnbPyKBQxnxABl8AgMB2KMnjyz
         kZyFYTGnPDXMUtVcCOdYxQTATclrva4SLTM9FuM0uEscjRfQxfZfwWGn8tRmot7IVPTA
         GP7QqkAp6SjRb5BjzbQB/z5wEDZhWE0CxWsb9FacY9rirARkxmYCT2BybF69tIbzkzqA
         ZfU1RNIDF9AZTAMt2G6LBIL/WuAUw9ayQJWYBfJ1M5LNdDlmKdNivnnpSqyN9HVd97Ui
         UAJg==
X-Gm-Message-State: AOAM5323rQczgtUNXKkAjl4cjspHygS1HVtaq4f/TjxBOeURoERx11Bb
        aZJNABieWBhOciwU7xPsmTc6iRXm+OU=
X-Google-Smtp-Source: ABdhPJyrvYkrbW5UjZxl9EDUXdNAsNh/TjrZF0esZQ12vq+ZvOuqrlI2k/0uWkJw7qvecVlPh8hfXw==
X-Received: by 2002:a17:902:8307:b029:d3:89e2:7866 with SMTP id bd7-20020a1709028307b02900d389e27866mr9102578plb.42.1602189200894;
        Thu, 08 Oct 2020 13:33:20 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id k3sm7890370pff.71.2020.10.08.13.33.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 13:33:20 -0700 (PDT)
Date:   Thu, 8 Oct 2020 13:26:16 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] memory: tegra: Sort tegra210_swgroups by reg address
Message-ID: <20201008202615.GA32140@Asurada-Nvidia>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-4-nicoleotsuka@gmail.com>
 <20201008103258.GA16358@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008103258.GA16358@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Krzysztof,

On Thu, Oct 08, 2020 at 12:32:58PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 07, 2020 at 05:37:44PM -0700, Nicolin Chen wrote:
> > This is a cleanup change to prepare for new swgroups.
> 
> What type of cleanup? Any functional change?

It's to sort the swgroup list by reg address as I mentioned in
the subject. Perhaps I should have put in commit message also.

> > 
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> >  drivers/memory/tegra/tegra210.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
> > index e8a7d266802c..b400802c9f14 100644
> > --- a/drivers/memory/tegra/tegra210.c
> > +++ b/drivers/memory/tegra/tegra210.c
> > @@ -1020,32 +1020,32 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
> >  };
> >  
> >  static const struct tegra_smmu_swgroup tegra210_swgroups[] = {
> > -	{ .name = "dc",        .swgroup = TEGRA_SWGROUP_DC,        .reg = 0x240 },
> > -	{ .name = "dcb",       .swgroup = TEGRA_SWGROUP_DCB,       .reg = 0x244 },
> >  	{ .name = "afi",       .swgroup = TEGRA_SWGROUP_AFI,       .reg = 0x238 },
> >  	{ .name = "avpc",      .swgroup = TEGRA_SWGROUP_AVPC,      .reg = 0x23c },
> > -	{ .name = "hda",       .swgroup = TEGRA_SWGROUP_HDA,       .reg = 0x254 },
> > +	{ .name = "dc",        .swgroup = TEGRA_SWGROUP_DC,        .reg = 0x240 },
> > +	{ .name = "dcb",       .swgroup = TEGRA_SWGROUP_DCB,       .reg = 0x244 },
> >  	{ .name = "hc",        .swgroup = TEGRA_SWGROUP_HC,        .reg = 0x250 },
> > +	{ .name = "hda",       .swgroup = TEGRA_SWGROUP_HDA,       .reg = 0x254 },
> > +	{ .name = "isp2",      .swgroup = TEGRA_SWGROUP_ISP2,      .reg = 0x258 },
> >  	{ .name = "nvenc",     .swgroup = TEGRA_SWGROUP_NVENC,     .reg = 0x264 },
> >  	{ .name = "ppcs",      .swgroup = TEGRA_SWGROUP_PPCS,      .reg = 0x270 },
> >  	{ .name = "sata",      .swgroup = TEGRA_SWGROUP_SATA,      .reg = 0x274 },
> > -	{ .name = "isp2",      .swgroup = TEGRA_SWGROUP_ISP2,      .reg = 0x258 },
> > +	{ .name = "vi",        .swgroup = TEGRA_SWGROUP_VI,        .reg = 0x280 },
> > +	{ .name = "vic",       .swgroup = TEGRA_SWGROUP_VIC,       .reg = 0x284 },
> >  	{ .name = "xusb_host", .swgroup = TEGRA_SWGROUP_XUSB_HOST, .reg = 0x288 },
> >  	{ .name = "xusb_dev",  .swgroup = TEGRA_SWGROUP_XUSB_DEV,  .reg = 0x28c },
> > -	{ .name = "isp2b",     .swgroup = TEGRA_SWGROUP_ISP2B,     .reg = 0xaa4 },
> > -	{ .name = "tsec",      .swgroup = TEGRA_SWGROUP_TSEC,      .reg = 0x294 },
> >  	{ .name = "a9avp",     .swgroup = TEGRA_SWGROUP_A9AVP,     .reg = 0x290 },
> 
> I must say I cannot find the order. By name - not. By swgroup name -
> not. By register - not.
> 
> What is the order then?

It's by "reg" as I mentioned in the commit subject. Probably
it's not that obvious by looking at the change itself :-/

Its following change of adding new swgroups would be easier
to insert by following the same order of "reg" addresses.

Thanks
