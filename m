Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EC7352016;
	Wed, 22 Jul 2026 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727740; cv=none; b=Mogm84xQm0dTR47pEETz0emg/eme8EYe2PqGShfctgAdkvjR4p3VDw4hvHmmM0PzLGWyN2ij8Onf9wCrGLWW8iXzY9oivPXgC1GnJFidaguu3VQ2k3P41aa+Nb2W38+AC6nAFe5YNDvPaUyzF9N6IlAbe4v8t4CtpkFVDmA5tS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727740; c=relaxed/simple;
	bh=lCQOVDn4ziOgSmTI0ZeZyzXwwtGxsYfk6AnYQNwP/jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLI/XArSnWhuDbLHjJazHJJd9G95atYQJG+KP8vkkx72PPQP+BGrl5wmSFVEVxBbQGxR++c/x71AEb4rBQ8H6ff2/zVmP9r/nGICDQbUZ4kB2PT2lRtCaz6fswKT7Gd5WHhZu8zk2pGDSG1dLzySTm7JALhQxukkXPc2A34zoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeA79y9c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeA79y9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503D91F000E9;
	Wed, 22 Jul 2026 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727738;
	bh=JMHKsyTTV54YaggDLKYansrAm9fblh+BWvUqqs6uFJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oeA79y9c5nblQlZb86Eqzdj2h8QEgU0FqieDsL25cHiPuc3M1zNrnIAkvdEeRmLoF
	 W50bilalJu8M4qI6S+Lpw3azQnBiKA9SsU8zwQ1uPxyLiEOBZkKHxfS8Ll2PuxJCDB
	 T9EqlILZDHfsGIfVTpA3kA7FKgNW8Zwx6Mo0y70kromJW8AzahwijN8vDKVIhGk1MZ
	 ok2TK9Ar96tFNNroi0MCS1riV+HKPV72PMbCT9xZSffPtGAwcC14ishCXfVXYfe8CP
	 Qpy0MMFjM7cKSFBYFFkh8amOopxw+jYC2ZAytvcnjWv/ahtpvLiAHnyROSZu/PJCKB
	 dwq6Xp1F7rqSQ==
Date: Wed, 22 Jul 2026 14:42:15 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Mark EL2 virtual
 timer broken for Tegra194/234
Message-ID: <20260722-cordial-zippy-oxpecker-dcdabb@sudeepholla>
References: <20260722125651.148595-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722125651.148595-1-jonathanh@nvidia.com>

On Wed, Jul 22, 2026 at 01:56:51PM +0100, Jon Hunter wrote:
> The following warning is being observed on Tegra194 and Tegra234
> platforms ...
> 
>  arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer
>   interrupt
> 
> Adding the missing EL2 virtual timer in device-tree for Tegra194 and
> Tegra234 is causing boot issues for both devices.
> 
> The Tegra194 device includes a GIC-400 which defines PPIs for sec-phys,
> phys, virt and hyp-phys timer interrupts (per the dt-binding
> arm,arch_timer.yaml) but there is no PPI hyp-virt (EL2 virtual) timer
> and hence this is not supported for this device.
> 
> The Tegra234 device does have a PPI for the EL2 virtual timer, but
> during CPU idle transitions into low-power states this timer is not
> preserved currently by firmware and hence causes boot issues when CPU
> idle is enabled.
> 
> Avoid the warning for Tegra194 and Tegra234 devices by marking the EL2
> virtual timer as broken.
> 

You may need to build on top of [1]

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260710080958.491620-1-maz@kernel.org/
