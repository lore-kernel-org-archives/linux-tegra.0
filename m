Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C801CEE80;
	Wed, 23 Oct 2024 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700882; cv=none; b=uEWFIhk/rX1v1f685vBKF/rTWsCxs4T3DjRUkaINJRXhULzEjuNu2Ov9ytiueTNYXoxooJhBNu/9b9z/KK9GIuHvRPZYUHVWMml9gnkPKbi9ahulczADRHed3yUGk46xqvHEuzOxfs3WPW8eu+j7+MSORxv+xjxPv81/fqu+kY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700882; c=relaxed/simple;
	bh=zkeVv4fB7aAAgQYMCWrMQpSx+Wxiy24fLuoD6zVLmHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFy0OrtCbvitrGqRf1p2Q/VwIh2GfLOf/6ApS54IxI/a2yJRTX4sPVeQWEsBOYk7HlJjPh8D+kB6fCe5W8DJ6mNCkf24maci2geXKQTvQCjCn45bgJAJNywaYomCnbRrlslrMW4cq+1Cu3NjLqyOwtlTy+ruQM+fe3LWn5NTlP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIuCvnFI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIuCvnFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E22FC4CEE4;
	Wed, 23 Oct 2024 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700882;
	bh=zkeVv4fB7aAAgQYMCWrMQpSx+Wxiy24fLuoD6zVLmHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIuCvnFIc3qhI53Mp59QeREFUcbbwtIsLq2lccLsJdLdXN1e8g8T3LOVqJ70kyeTy
	 ikusaWlsVE5JKwDNcxZbYkoWfScz+UWeskYre5dVWSiD6Ie8XU2oTrqiANkjx3ADHG
	 FBzf0TJjv4XszeS5Y2lM8fxmd70wIqdocB6aG5mA7nwSopdAM9+zEiGNBbdXFu1AaM
	 pj8hkxi5T+YioS/6GEux9Itc0LQF3EqbuzYRUD+qLAiiOZnfATzDChW4NfGKmY/mnC
	 2E/mTWZPMiUvFGN386v9h/lJdJnekjn2wvzvy66zrAOVncFKuVsU0qwtg1+pDKGZyO
	 aB/O2iI5Q7bDg==
Date: Wed, 23 Oct 2024 17:27:56 +0100
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
Subject: Re: [PATCH 3/3] perf: arm_cspmu: nvidia: enable NVLINK-C2C port
 filtering
Message-ID: <20241023162755.GB29251@willie-the-truck>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-4-bwicaksono@nvidia.com>
 <20241014132839.GC17353@willie-the-truck>
 <SJ0PR12MB5676D1817E2C2F3693B82D4EA0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR12MB5676D1817E2C2F3693B82D4EA0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Oct 15, 2024 at 05:29:28PM +0000, Besar Wicaksono wrote:
> > > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > index d1cd9975e71a..cd51177347e5 100644
> > > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > @@ -149,6 +149,7 @@ static struct attribute *pcie_pmu_format_attrs[] = {
> > >
> > >  static struct attribute *nvlink_c2c_pmu_format_attrs[] = {
> > >       ARM_CSPMU_FORMAT_EVENT_ATTR,
> > > +     ARM_CSPMU_FORMAT_ATTR(port, "config1:0-1"),
> > >       NULL,
> > >  };
> > >
> > > @@ -193,7 +194,7 @@ static u32 nv_cspmu_event_filter(const struct
> > perf_event *event)
> > >       const struct nv_cspmu_ctx *ctx =
> > >               to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
> > >
> > > -     if (ctx->filter_mask == 0)
> > > +     if (ctx->filter_mask == 0 || event->attr.config1 == 0)
> > >               return ctx->filter_default_val;
> > 
> > Isn't this a bit too broad? It looks like this filter function is used
> > beyond the C2C PMU (i.e. the PCIe PMU) and you're also checking the whole
> > of config1 rather than just the port field.
> > 
> 
> I think the other PMUs (PCIE and CNVLINK) that have similar filters will also benefit
> from this change, since a filter value of 0 on these PMUs are meaningless. Should I
> make the intention clearer by moving this particular change into a separate patch?

Yes. If you want to change the behaviour for other PMUs, then please be
explicit about that. In any case, I don't think you should check the whole
of config1.

Will
