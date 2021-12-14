Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB55C433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Dec 2021 14:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbhLNOgX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Dec 2021 09:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhLNOgW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Dec 2021 09:36:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FE0C061574;
        Tue, 14 Dec 2021 06:36:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9F952B819DF;
        Tue, 14 Dec 2021 14:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E195C34606;
        Tue, 14 Dec 2021 14:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639492579;
        bh=JeitOmEqW9rtcD66C+yEXcyx8w8OjcLkFHkoZGInfJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hZR52lmrLUsqALOOA+vgeqyfxnzYUGQi75J6qtfMklY75P2pI+oaDXuC+Fw8Ftko4
         ZLRDjJDI/H7JJJ796xd3GoWDU1HQmpR2IPPRz7EeklcPYPgGDxgGzZ97BIZ6gqS+PA
         Uob6Y9uujLDpQlrLxf2C5Bh/5yNO0k5JE+isAQLGy4e5N532EUCH9OyJnNCoXlfqT4
         cs8cTkFSsJneIfMYggMPFd8jnz8Z16XXG2W0t2i7mAIDfn+QFiiLoXRr8HfuW+9nFD
         Y2OJdPXxgqTWwOUO2Cih2cYzQ+F7uuLSkkzlMcRKo2V4q0BHWVwltCZDh8Yip2XeaU
         cpyeQq1Y56EzA==
Date:   Tue, 14 Dec 2021 14:36:14 +0000
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: perf: Support Denver and Carmel PMUs
Message-ID: <20211214143614.GA14837@willie-the-truck>
References: <20211207150746.444478-1-thierry.reding@gmail.com>
 <20211207150746.444478-2-thierry.reding@gmail.com>
 <Ya+FzVuvQ3W8LOyl@FVFF77S0Q05N>
 <YbDC0sHeq49cdt0Z@orome>
 <20211214123353.GD14247@willie-the-truck>
 <YbiqGCJ8U9TTS3nr@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbiqGCJ8U9TTS3nr@orome>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Dec 14, 2021 at 03:28:40PM +0100, Thierry Reding wrote:
> On Tue, Dec 14, 2021 at 12:33:53PM +0000, Will Deacon wrote:
> > On Wed, Dec 08, 2021 at 03:36:02PM +0100, Thierry Reding wrote:
> > > On Tue, Dec 07, 2021 at 04:03:25PM +0000, Mark Rutland wrote:
> > > > On Tue, Dec 07, 2021 at 04:07:45PM +0100, Thierry Reding wrote:
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > > 
> > > > > Add support for the NVIDIA Denver and Carmel PMUs using the generic
> > > > > PMUv3 event map for now.
> > > > > 
> > > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > > ---
> > > > >  arch/arm64/kernel/perf_event.c | 14 ++++++++++++++
> > > > >  1 file changed, 14 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
> > > > > index b4044469527e..8c8cf369c450 100644
> > > > > --- a/arch/arm64/kernel/perf_event.c
> > > > > +++ b/arch/arm64/kernel/perf_event.c
> > > > > @@ -1247,6 +1247,18 @@ static int armv8_vulcan_pmu_init(struct arm_pmu *cpu_pmu)
> > > > >  				       armv8_vulcan_map_event);
> > > > >  }
> > > > >  
> > > > > +static int armv8_denver_pmu_init(struct arm_pmu *cpu_pmu)
> > > > > +{
> > > > > +	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_denver",
> > > > > +				       armv8_pmuv3_map_event);
> > > > > +}
> > > > > +
> > > > > +static int armv8_carmel_pmu_init(struct arm_pmu *cpu_pmu)
> > > > > +{
> > > > > +	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_carmel",
> > > > > +				       armv8_pmuv3_map_event);
> > > > > +}
> > > > > +
> > > > >  static const struct of_device_id armv8_pmu_of_device_ids[] = {
> > > > >  	{.compatible = "arm,armv8-pmuv3",	.data = armv8_pmuv3_init},
> > > > >  	{.compatible = "arm,cortex-a34-pmu",	.data = armv8_a34_pmu_init},
> > > > > @@ -1265,6 +1277,8 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
> > > > >  	{.compatible = "arm,neoverse-n1-pmu",	.data = armv8_n1_pmu_init},
> > > > >  	{.compatible = "cavium,thunder-pmu",	.data = armv8_thunder_pmu_init},
> > > > >  	{.compatible = "brcm,vulcan-pmu",	.data = armv8_vulcan_pmu_init},
> > > > > +	{.compatible = "nvidia,denver-pmu",	.data = armv8_denver_pmu_init},
> > > > > +	{.compatible = "nvidia,carmel-pmu",	.data = armv8_carmel_pmu_init},
> > > > 
> > > > Super trivial nit, but could we please organise this alphabetically (i.e. with carmel first?)
> > > > 
> > > > With that:
> > > > 
> > > > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > > > 
> > > > I see now that we messed up the order of "cavium,thunder-pmu" and
> > > > "brcm,vulcan-pmu", but otherwise this is ordered, and it's be nice to keep it
> > > > that way. I can fix the order of those two in a separate patch.
> > > 
> > > I ordered this chronologically (Denver for Tegra186 and Carmel for
> > > Tegra194), which seemed a bit more natural, but I can reorder this
> > > alphabetically if you prefer.
> > > 
> > > Would Will be the right person to pick this up or should I take it
> > > through the Tegra tree and then ARM SoC?
> > 
> > Sorry, I missed this somehow. I've got some perf patches pending already, so
> > it would be easiest for me to take this one directly (and then I can apply
> > Robin's stuff on top). Is that ok?
> 
> Sure, works for me. Do you still want me to address Mark's comment
> regarding the sorting order (chronological vs. alphabetical)? It wasn't
> clear to me if Mark still wanted that after my explanation.

No need -- Robin's picked this into his series:

https://lore.kernel.org/r/5f0f69d47acca78a9e479501aa4d8b429e23cf11.1639490264.git.robin.murphy@arm.com

so now I just need to pick that lot up.

Thanks!

Will
