Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123E1C3030;
	Wed, 23 Oct 2024 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700803; cv=none; b=C0DC4NO7jC9BPx5XM83+a6Ur+KUgoRL+1Is7K4LQleZJXbou/i5quP7cHsEDHRMg9XhjXWbsVHP5AJVSNPKKPJYAbSRZHx2XBIjtyInAxk00l/9QvLS95cQugc9oNWAYh6IyBvleu4P7dTuj8CpTJfZEgoe2tIRRe5SyAqplGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700803; c=relaxed/simple;
	bh=n1frDIgSsJcb/DRHKoimwPh5ZqPXxcX87y/aHbisXI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvU5xM9TeSMF+1Iy0rgRcufT3lQ0udDGCqrCOkLRxpqgbDOHid2XNnheslzIWGetXE8kY5208V3QnQpm8eHlfI1UnHqx0/s8DsUbcjPuQeo+FAyrHeC35Yb9un6ngpngVYOEzrAwZbpoE14G9NOZcNka++tYDTlM4XVx+3lKmeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iS8SwAce; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iS8SwAce"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4D9C4CEE4;
	Wed, 23 Oct 2024 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700803;
	bh=n1frDIgSsJcb/DRHKoimwPh5ZqPXxcX87y/aHbisXI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iS8SwAceI/y883d1QM0e5+48FVIPf3L+8Mz/GjEfuZrGWWXDcAJ2RrTwYmSaIWBeg
	 rNTIQwAqsfAISoCmTnPYwQnKlV6q29x2KBLrnzsj31GYFIRbFA7IEWWrV6EcTdFjSe
	 EwtB4/Y0QeYqmZdHIdOW0G1stht+nm7AeyNiY1LSQ6EosDB8k9q4CCx943B+Q4pOjt
	 ovvKb8HeaPJtjJC8NZVUk1UNcjv9f0dIuJ34bA7ODa39zdsCkojr21gc0uN2gGmUOT
	 zGBYd4k/cNja/uE57SUKTSgib3LaYLlytnKIS3jdNSZ/fukgaahZYCJ7AlJhdhecCr
	 G/NVNHotylvUw==
Date: Wed, 23 Oct 2024 17:26:37 +0100
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
Message-ID: <20241023162636.GA29251@willie-the-truck>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-3-bwicaksono@nvidia.com>
 <20241014131903.GB17353@willie-the-truck>
 <SJ0PR12MB5676697B93C267CE87C5A474A0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR12MB5676697B93C267CE87C5A474A0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Oct 15, 2024 at 05:21:06PM +0000, Besar Wicaksono wrote:
> 
> 
> > -----Original Message-----
> > From: Will Deacon <will@kernel.org>
> > Sent: Monday, October 14, 2024 8:19 AM
> > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > Cc: suzuki.poulose@arm.com; robin.murphy@arm.com;
> > catalin.marinas@arm.com; mark.rutland@arm.com; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > tegra@vger.kernel.org; Thierry Reding <treding@nvidia.com>; Jon Hunter
> > <jonathanh@nvidia.com>; Vikram Sethi <vsethi@nvidia.com>; Rich Wiley
> > <rwiley@nvidia.com>; Bob Knight <rknight@nvidia.com>
> > Subject: Re: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU
> > events
> > 
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Wed, Sep 18, 2024 at 09:58:45PM +0000, Besar Wicaksono wrote:
> > > Rename loc* and rem* events in CNVLINK PMU to cmem* and gmem*
> > events.
> > >
> > > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > > ---
> > >  drivers/perf/arm_cspmu/nvidia_cspmu.c | 21 ++++++++++++++++++++-
> > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > index ea2d44adfa7c..d1cd9975e71a 100644
> > > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > @@ -112,6 +112,25 @@ static struct attribute *mcf_pmu_event_attrs[] = {
> > >       NULL,
> > >  };
> > >
> > > +static struct attribute *mcf_cnvlink_pmu_event_attrs[] = {
> > > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_cmem,                     0x0),
> > > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_gmem,                     0x1),
> > > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_cmem,                     0x2),
> > > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_gmem,                     0x3),
> > > +     ARM_CSPMU_EVENT_ATTR(total_bytes_cmem,                  0x4),
> > > +     ARM_CSPMU_EVENT_ATTR(total_bytes_gmem,                  0x5),
> > > +     ARM_CSPMU_EVENT_ATTR(rd_req_cmem,                       0x6),
> > > +     ARM_CSPMU_EVENT_ATTR(rd_req_gmem,                       0x7),
> > > +     ARM_CSPMU_EVENT_ATTR(wr_req_cmem,                       0x8),
> > > +     ARM_CSPMU_EVENT_ATTR(wr_req_gmem,                       0x9),
> > > +     ARM_CSPMU_EVENT_ATTR(total_req_cmem,                    0xa),
> > > +     ARM_CSPMU_EVENT_ATTR(total_req_gmem,                    0xb),
> > > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_cmem,                  0xc),
> > > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_gmem,                  0xd),
> > > +     ARM_CSPMU_EVENT_ATTR(cycles,
> > ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > > +     NULL,
> > > +};
> > > +
> > >  static struct attribute *generic_pmu_event_attrs[] = {
> > >       ARM_CSPMU_EVENT_ATTR(cycles,
> > ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > >       NULL,
> > > @@ -234,7 +253,7 @@ static const struct nv_cspmu_match
> > nv_cspmu_match[] = {
> > >         .filter_default_val = NV_CNVL_FILTER_ID_MASK,
> > >         .name_pattern = "nvidia_cnvlink_pmu_%u",
> > >         .name_fmt = NAME_FMT_SOCKET,
> > > -       .event_attr = mcf_pmu_event_attrs,
> > > +       .event_attr = mcf_cnvlink_pmu_event_attrs,
> > >         .format_attr = cnvlink_pmu_format_attrs
> > >       },
> > 
> > Hmm. Isn't this a user-visible change? For example, will scripts driving
> > 'perf' with the old event names continue to work after this patch?
> > 
> 
> Yes this is user visible. I am expecting user script to be updated accordingly.
> Would this be reasonable?

I don't think so, no. We don't tend to require userspace changes as a
result of upgrading the kernel.

Will
