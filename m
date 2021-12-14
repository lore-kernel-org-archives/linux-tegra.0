Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA112C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Dec 2021 12:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbhLNMeF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Dec 2021 07:34:05 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52764 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbhLNMeB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Dec 2021 07:34:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DD46EB817EF;
        Tue, 14 Dec 2021 12:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48ECDC34605;
        Tue, 14 Dec 2021 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639485238;
        bh=4Cj68ob9pH+Z5mhyMlecsSJ6G0Zss5CgowXAX+wVjXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IL2PtO6r3UOSQzalyAKXza3qe92S0JssI/YyURvVOSUnLWxOfOoPnze53HFCf7gtj
         dkjnPkUehhr8aFS50F62DoOP0yJtUGnfJsLCoL+iulvYD1Yhk9R/8pAaYw6LByUPM8
         R7LXzQjXVwtapKNx9uiIOZoTQV0oqYa4cjqQhCKXcQ3lCnANW8B37i2YWBQuwMXGb+
         rfoLf2QnwyklA14B92+TFH1B/CmQf4PrpJXfg2+BEssxP3kT6dLyhRo0A6dcaMIBV8
         BYopRjVEaqt6jRPQU9sn17N/T+oJQbzpvLjIwSV5cm7PuJ03GCugq47B1fG//MqTHZ
         vk/QevurkrpVg==
Date:   Tue, 14 Dec 2021 12:33:53 +0000
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: perf: Support Denver and Carmel PMUs
Message-ID: <20211214123353.GD14247@willie-the-truck>
References: <20211207150746.444478-1-thierry.reding@gmail.com>
 <20211207150746.444478-2-thierry.reding@gmail.com>
 <Ya+FzVuvQ3W8LOyl@FVFF77S0Q05N>
 <YbDC0sHeq49cdt0Z@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbDC0sHeq49cdt0Z@orome>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Dec 08, 2021 at 03:36:02PM +0100, Thierry Reding wrote:
> On Tue, Dec 07, 2021 at 04:03:25PM +0000, Mark Rutland wrote:
> > On Tue, Dec 07, 2021 at 04:07:45PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > Add support for the NVIDIA Denver and Carmel PMUs using the generic
> > > PMUv3 event map for now.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  arch/arm64/kernel/perf_event.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
> > > index b4044469527e..8c8cf369c450 100644
> > > --- a/arch/arm64/kernel/perf_event.c
> > > +++ b/arch/arm64/kernel/perf_event.c
> > > @@ -1247,6 +1247,18 @@ static int armv8_vulcan_pmu_init(struct arm_pmu *cpu_pmu)
> > >  				       armv8_vulcan_map_event);
> > >  }
> > >  
> > > +static int armv8_denver_pmu_init(struct arm_pmu *cpu_pmu)
> > > +{
> > > +	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_denver",
> > > +				       armv8_pmuv3_map_event);
> > > +}
> > > +
> > > +static int armv8_carmel_pmu_init(struct arm_pmu *cpu_pmu)
> > > +{
> > > +	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_carmel",
> > > +				       armv8_pmuv3_map_event);
> > > +}
> > > +
> > >  static const struct of_device_id armv8_pmu_of_device_ids[] = {
> > >  	{.compatible = "arm,armv8-pmuv3",	.data = armv8_pmuv3_init},
> > >  	{.compatible = "arm,cortex-a34-pmu",	.data = armv8_a34_pmu_init},
> > > @@ -1265,6 +1277,8 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
> > >  	{.compatible = "arm,neoverse-n1-pmu",	.data = armv8_n1_pmu_init},
> > >  	{.compatible = "cavium,thunder-pmu",	.data = armv8_thunder_pmu_init},
> > >  	{.compatible = "brcm,vulcan-pmu",	.data = armv8_vulcan_pmu_init},
> > > +	{.compatible = "nvidia,denver-pmu",	.data = armv8_denver_pmu_init},
> > > +	{.compatible = "nvidia,carmel-pmu",	.data = armv8_carmel_pmu_init},
> > 
> > Super trivial nit, but could we please organise this alphabetically (i.e. with carmel first?)
> > 
> > With that:
> > 
> > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > 
> > I see now that we messed up the order of "cavium,thunder-pmu" and
> > "brcm,vulcan-pmu", but otherwise this is ordered, and it's be nice to keep it
> > that way. I can fix the order of those two in a separate patch.
> 
> I ordered this chronologically (Denver for Tegra186 and Carmel for
> Tegra194), which seemed a bit more natural, but I can reorder this
> alphabetically if you prefer.
> 
> Would Will be the right person to pick this up or should I take it
> through the Tegra tree and then ARM SoC?

Sorry, I missed this somehow. I've got some perf patches pending already, so
it would be easiest for me to take this one directly (and then I can apply
Robin's stuff on top). Is that ok?

Will
