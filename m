Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957160;
	b=I118ch8GbSgL4sCKchk+e717fJfgPt0Rk7Y062KSquFb1eMdio03DNjzUPk/27dO9YV/
	 1QqqVX4kio+CLFwmAa98031VU68GkSDtkFWQ46zCz+sKdm1m7M/oR/TR1bN4P5nn0KhEB
	 aEiQ1H0YCq+nnU9eUj3tDMV35KK5PDTEB1uodSKnEXSGcQ8ukMRJSDL/7w8CbKY4oRZJX
	 wNVdxNJiQ2+hwIoHVvBsJKbBPQoE8rEpYxCHmOJP4kmV1S/3ehrXIRJu+cTUnw3uUiz1v
	 hb0KmCr7IhQhDUjdYhzkRmuue6z0rjhLcnJ8fvSpDF7tuNRj9ooSEKf9LLwy7S25FtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957160;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XK5in/uz1GFxU2Y1joAxfwmq4S7CwBCoGNpCW/wkxgY=;
	b=ClPAIWlHuh521+XjApUasEXzRTayUmtQ8iXdwrt9lw38kf6PS2Yg9BAuFqqry4d8NHay
	 UKaSK9cR0xh5gZNrah0DxbI7Jq2oLXRGR9sn+ole5M5/S79ShPdlWnSKn4GfbDQiPOtSO
	 0ll88xl+lsyE0azHkTNFEcenZ60B8XYZuo6WCVYyjNhuwZwvHVjTzttAIJY1ednG1wQMw
	 0JH9aB765zNDJZu4Tqeq3YbeDRia4SFEPH84Kyy2bQvv9SX6zNcYpe61uBoLsr4GkZE56
	 Kk2Aiex9+tFjinF27ISx9fxbv4+v6XBkGNUp4Mp6xC1D4HQLCr74Pdt7E9UYBm4n4fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWBfNKGJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2963606A326;
	Fri,  6 Nov 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWBfNKGJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386261F0089F;
	Fri,  6 Nov 2026 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957159;
	bh=XK5in/uz1GFxU2Y1joAxfwmq4S7CwBCoGNpCW/wkxgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eWBfNKGJnKw6+aqm59LY+oODz9DH8M6Evoad3AAJN9JA5NptrSiGfmNyiyIPSJNaT
	 R1Pm/Vn3bJi0h5SxrwO5846yZwmsfikSUKiq6evnCO1zzzViRTN4lUOmnrKkXEstxR
	 4ZyreP547QD5EWzzzB9r2h4UOhYenmfGCvx9SWaDLy01XyHawzP/sZ29Uj/7C4U9b9
	 MwVPMiwIbyZbgzFCr6a1U23xUyik4/49RhIXNjnV3cYcKBjhtp91tGQ8eQPXI9D5uC
	 ejm2zARxjl2R3AliaKlNAKxNmUOGtE8WZKLZ28Ji3CvuzDOhJ3Lx9vY+3uVTguCnNa
	 OaCqmEyT9IYXA==
Date: Fri, 6 Nov 2026 09:25:56 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aniruddha Rao <anrao@nvidia.com>, jonathanh@nvidia.com,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] firmware: tegra: bpmp: Add ACPI support
Message-ID: <20261106-emu-of-nonconcrete-wizardry-174c3b@sudeepholla>
References: <20260929095915.2215685-1-anrao@nvidia.com>
 <20260929095915.2215685-3-anrao@nvidia.com>
 <20261105-fiery-gentle-pudu-e985dd@sudeepholla>
 <aux8RS55HqzuTL3g@orome>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aux8RS55HqzuTL3g@orome>

On Thu, Nov 05, 2026 at 02:07:48PM +0100, Thierry Reding wrote:
> On Thu, Nov 05, 2026 at 09:50:26AM +0000, Sudeep Holla wrote:
> > On Tue, Sep 29, 2026 at 09:59:12AM +0000, Aniruddha Rao wrote:
> > > Add required changes in the Tegra BPMP driver to make it compatible with
> > > ACPI-based platforms.
> > > 
> > > On ACPI systems, IPC is handled through an AML method instead of the
> > > kernel mailbox and IVC frameworks.
> > > 
> > > Clock, reset and power-domain providers are not controlled by the Linux
> > > BPMP driver on ACPI-based systems, so do not initialize them there.
> > > 
> > 
> > The above 2 statements are very clear and says this driver is not much
> > useful on ACPI systems which is good and aligns with the general
> > expectations.
> > 
> > > Keep transport initialization in the SoC-specific init operation. Use an
> > > optional init_providers operation for DT child and provider registration
> > > after BPMP communication has been established and the firmware tag has
> > > been read. ACPI platforms leave this operation unset.
> > > 
> > 
> > "ACPI platforms leave this operation unset" - I don't fully understand
> > what this means ? If it means we need to do something on ACPI systems,
> > why can't it be done by some boot firmware instead ?
> 
> I think it just means that the "init_providers" operation isn't needed
> on ACPI systems because we don't expose clocks, resets or power domains
> in ACPI (we do this only on DT so that we can have cross-references
> between device tree nodes). I don't think anything needs to be done in
> the ACPI case, so leaving this operation unset is exactly that.
> 

Thanks for the confirmation.

> > > DT transports register an MRQ_PING handler for requests initiated by
> > > BPMP firmware. This request direction was used only by a diagnostic
> > > command in older firmware and is not provided by firmware on ACPI-based
> > > systems. The ACPI transport therefore does not register an incoming
> > > handler; its init operation only sends the outgoing MRQ_PING request used
> > > to verify communication with firmware.
> > > 
> > 
> > OK, I am more confused as you state more things are not needed on ACPI
> > systems. Why do we need to add any support for ACPI systems then? Can you
> > make it clear as what is needed on ACPI systems and why it needs to be
> > done by OSPM and not any boot firmware if it is just one time initialisation.
> 
> My understanding of this is that the goal was to completely hide BPMP on
> ACPI systems and do all the clock, reset and power domain handling via
> standard ACPI operations. MBWT is a feature that's needed on ACPI
> systems and that can't be represented as a standard ACPI operation, as I
> understand it, hence the addition of ACPI support to BPMP.
> 

OK.

> So some of this patch is stripping out things that don't make sense on
> ACPI (the ACPI support for BPMP is very minimal) just to get enough
> support in place to expose the MBWT caps via sysfs.
> 

I am bit concerned as MBWT is something to do with memory bandwidth
throttling and resctrl provides user ABI for such things, this sysfs
may be duplicating part of it.

> The sysfs knobs exposed in patches 4 and 5 exist because the bandwidth
> caps may need to be adjusted dynamically at runtime. It is indeed a bit
> absurd to bootstrap a restricted version of BPMP like this for just this
> one feature, but I don't see any alternatives.
> 

Is MPAM/resctrl path explored and you have valid reasons to not use that
and create your own sysfs ?

-- 
Regards,
Sudeep
