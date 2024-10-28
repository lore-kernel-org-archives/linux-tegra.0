Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E281DE3A3;
	Mon, 28 Oct 2024 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128652; cv=none; b=elVhJ6mbmCRe1WzI5AvpjPgPLdJgTdH+Mcitt2nNikJsG6vrMzMQZGuQsMu/VZwf2HKPlkqDZCHitIgIDTOKm+pP7Nl3vrq6H24Q8qAAMoz7upx65si4/oL9QISV1o8hL1lYcHnZkSPBpZ1XfhfaGTrB+MDbJUp+kNg5pdE6PQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128652; c=relaxed/simple;
	bh=KSEMwqE2ukYH3OH72aNaqmUYo6ruCJE1hLeuji3Tu08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGGc2qo4Q5EeEysdevbSSwfApl1EpA3pz9LMGx1hiogxZOpDwzdcwFkxewQEWfb9qPYn+3SQouFMQ3DUd5D7481HAlPXuXbrRcb9VwJppKDpi3sgdEtDcYfdVHYrjvP/mVxyQ6ExjxG6OSp+JGcA2LtdMZASmq9B0OTbT0nlOcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGrN2+NW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGrN2+NW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9119C4CEC3;
	Mon, 28 Oct 2024 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730128652;
	bh=KSEMwqE2ukYH3OH72aNaqmUYo6ruCJE1hLeuji3Tu08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGrN2+NWv0ZA5N2mANlKz/oX11Ccc3oA8EbfM7QdRc3+bAtT26MOEHLliz3eSI8Cy
	 jGZG0I7XynOlyaCd/Jw89bj1ajU1kNLbgGO9eik7EBXgQdVql0m2chzSznYjohXfoe
	 LmQj/Mfm8AmAiMe9MO66xiSwelyvgOUtCfD0nmLFryOwQFOLTHt4rTjzGKCoJSjKAm
	 F0+aJgM8fKOECE/zWteto3wMhOHlD1GjBAN1+SfBhTKQ30GyGWulQ3z2ptHsAETblt
	 4+FSf2BSwNumgUu4pBANuTE5mYgfLglFIqRDkEIbUNMXgyZ5WqtKz65EM59DDAwOlU
	 niNJb7NJFSz4w==
Date: Mon, 28 Oct 2024 15:17:26 +0000
From: Will Deacon <will@kernel.org>
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
	Rich Wiley <rwiley@nvidia.com>, Bob Knight <rknight@nvidia.com>
Subject: Re: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU events
Message-ID: <20241028151725.GA2484@willie-the-truck>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-3-bwicaksono@nvidia.com>
 <20241014131903.GB17353@willie-the-truck>
 <SJ0PR12MB5676697B93C267CE87C5A474A0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <20241023162636.GA29251@willie-the-truck>
 <SJ0PR12MB567691F0F89F18EDC84C6092A04E2@SJ0PR12MB5676.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR12MB567691F0F89F18EDC84C6092A04E2@SJ0PR12MB5676.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Oct 24, 2024 at 02:10:55PM +0000, Besar Wicaksono wrote:
> > > > > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > > index ea2d44adfa7c..d1cd9975e71a 100644
> > > > > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > > @@ -112,6 +112,25 @@ static struct attribute *mcf_pmu_event_attrs[]
> > = {
> > > > >       NULL,
> > > > >  };
> > > > >
> > > > > +static struct attribute *mcf_cnvlink_pmu_event_attrs[] = {
> > > > > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_cmem,                     0x0),
> > > > > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_gmem,                     0x1),
> > > > > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_cmem,                     0x2),
> > > > > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_gmem,                     0x3),
> > > > > +     ARM_CSPMU_EVENT_ATTR(total_bytes_cmem,                  0x4),
> > > > > +     ARM_CSPMU_EVENT_ATTR(total_bytes_gmem,                  0x5),
> > > > > +     ARM_CSPMU_EVENT_ATTR(rd_req_cmem,                       0x6),
> > > > > +     ARM_CSPMU_EVENT_ATTR(rd_req_gmem,                       0x7),
> > > > > +     ARM_CSPMU_EVENT_ATTR(wr_req_cmem,                       0x8),
> > > > > +     ARM_CSPMU_EVENT_ATTR(wr_req_gmem,                       0x9),
> > > > > +     ARM_CSPMU_EVENT_ATTR(total_req_cmem,                    0xa),
> > > > > +     ARM_CSPMU_EVENT_ATTR(total_req_gmem,                    0xb),
> > > > > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_cmem,                  0xc),
> > > > > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_gmem,                  0xd),
> > > > > +     ARM_CSPMU_EVENT_ATTR(cycles,
> > > > ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > > > > +     NULL,
> > > > > +};
> > > > > +
> > > > >  static struct attribute *generic_pmu_event_attrs[] = {
> > > > >       ARM_CSPMU_EVENT_ATTR(cycles,
> > > > ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > > > >       NULL,
> > > > > @@ -234,7 +253,7 @@ static const struct nv_cspmu_match
> > > > nv_cspmu_match[] = {
> > > > >         .filter_default_val = NV_CNVL_FILTER_ID_MASK,
> > > > >         .name_pattern = "nvidia_cnvlink_pmu_%u",
> > > > >         .name_fmt = NAME_FMT_SOCKET,
> > > > > -       .event_attr = mcf_pmu_event_attrs,
> > > > > +       .event_attr = mcf_cnvlink_pmu_event_attrs,
> > > > >         .format_attr = cnvlink_pmu_format_attrs
> > > > >       },
> > > >
> > > > Hmm. Isn't this a user-visible change? For example, will scripts driving
> > > > 'perf' with the old event names continue to work after this patch?
> > > >
> > >
> > > Yes this is user visible. I am expecting user script to be updated accordingly.
> > > Would this be reasonable?
> > 
> > I don't think so, no. We don't tend to require userspace changes as a
> > result of upgrading the kernel.
> 
> Are you referring to userspace change just on the perf tool side?
> Cause this PMU doesn't have JSON scripts for alias/metric in the perf tool yet.

I'm not sure that matters, does it? If the mappings are exposed in sysfs,
then the tool will pick them up.

> Do you have suggestion of the proper approach?

I'd say leave the event names like they are and if you want to add aliases,
do that in userspace.

Will
