Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975582;
	b=zdwxfFdhYQ3BU0byYUkkL81PprIbZefnfnC9jRhod6rFrUQFBKBCvegdzzbXOIZ29QRj
	 zPexd4Dz5hfkJBEoDfjTKHZ3x9KHCc7IyyYKYy1mkihuWbrKQZ3Ojt83r7PQQqaFHHq7T
	 9AUuybS4xlbhzc/HdsMtuysEKvh/EfcQ6R/I+Mj4oy+horsUTvc5qGQUkddzcnghlUzK5
	 X0X1tEfvPd9JoK38fAc1YO+oqS7BncGz1qhodQWqa8stqqchc2TznQzGpe1ojAQSgwY/A
	 aVwSCp8A/bhe5b4dF3bB7e/AZ1eaKANy1/5vJldipAFYuDAFCraNTxqVFi9aTs85KCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975582;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Cb8qhM+V/aXYp0QZl6BSzh3gfg92JvrKBDVjboUTbQQ=;
	b=xdhYtTwMHk6FlM3pTzzJYQgwcjvsfkKT14jWoGoo3cKNo5i1yGMbZ1Te3zu++aetedzH
	 OX1orzK5P4I6tcK6Fp+8H30eeTf7xPERWVZv7bpaqIkubKhnl3TUfYWfkGZ+L4V8S6ta0
	 sEStP0H16CnKvgSBID2AuMzlb/Y03uIggcTHpSVmQgyNQi2n/wPVZ2S5Cm9Xkv248haH3
	 hrG5qYAR19ll68x6OM93buWOCs/2NmAo5lhx17OU0mOGVKJ8lwLfu0wleuSwsBMfgk8tY
	 BvtxdanK35siVvZ/CEDt8Dr1pPDgNvLG+e+YrZE2golNEX601bPFLJ4wWB1OFN95NzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OvRTDnSq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B851F606A329;
	Fri,  6 Nov 2026 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OvRTDnSq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C5C1F0089F;
	Fri,  6 Nov 2026 14:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975581;
	bh=Cb8qhM+V/aXYp0QZl6BSzh3gfg92JvrKBDVjboUTbQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OvRTDnSqEgjAqHjFqMMV+zhkIo4Ko3vM6GVPxqb0ZK9vpx09sxHRLsiP2S+t9jRdq
	 o0FwZhpVnR4AMZhS1sN7jprTJ+QUCPpOwNC7b1cLaDjQNadvKlYh8Wm0UJLt8xu8kY
	 a6wXCjOM3Yvi1f21i3pklD9gtdVzm5S/NFhcO+OxcHgsox3Sb25cupBeuoSWQsS5kk
	 /uYNDB20x12vegVNevri5C50jyWZWnyt8teaP8J8vJc6XzyydgJDFfNTRCkw9mz4qB
	 LI1K8J0FH8g1OmInbXPXXD/qrGT4ZH3tfSswTcWKzbc/mYriRbDSYZxLp3qajqC4OG
	 ujU8LclkwDiWw==
Date: Fri, 6 Nov 2026 14:32:58 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aniruddha Rao <anrao@nvidia.com>, jonathanh@nvidia.com,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] firmware: tegra: bpmp: Add ACPI support
Message-ID: <20261106-humorous-amphibian-sambar-7fdbd7@sudeepholla>
References: <20260929095915.2215685-1-anrao@nvidia.com>
 <20260929095915.2215685-3-anrao@nvidia.com>
 <20261105-fiery-gentle-pudu-e985dd@sudeepholla>
 <aux8RS55HqzuTL3g@orome>
 <20261106-emu-of-nonconcrete-wizardry-174c3b@sudeepholla>
 <au3Ag3uEKhppG930@orome>
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
In-Reply-To: <au3Ag3uEKhppG930@orome>

On Fri, Nov 06, 2026 at 01:18:56PM +0100, Thierry Reding wrote:
> On Fri, Nov 06, 2026 at 09:25:56AM +0000, Sudeep Holla wrote:

[...]

> > 
> > I am bit concerned as MBWT is something to do with memory bandwidth
> > throttling and resctrl provides user ABI for such things, this sysfs
> > may be duplicating part of it.
> > 
> > > The sysfs knobs exposed in patches 4 and 5 exist because the bandwidth
> > > caps may need to be adjusted dynamically at runtime. It is indeed a bit
> > > absurd to bootstrap a restricted version of BPMP like this for just this
> > > one feature, but I don't see any alternatives.
> > > 
> > 
> > Is MPAM/resctrl path explored and you have valid reasons to not use that
> > and create your own sysfs ?
> 
> My understanding is that only monitoring is implemented for MPAM with no
> way of actually controlling bandwidth through it.
> 

For once I did get that doubt as I don't have much knowledge on MPAM or
resctrl in the kernel. So before replying to you, I had a look at
Section "Memory bandwidth Allocation and monitoring" in
Documentation/filesystems/resctrl.rst which made me understand it as
supported. I may be wrong, but it sounds out to have controls and monitors
in different places in general.

> I've started an internal discussion to evaluate whether we can avoid
> custom sysfs attributes in favour of exposing them through resctrl.
> 

Thanks.

-- 
Regards,
Sudeep
