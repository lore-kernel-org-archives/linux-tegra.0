Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585673002B6
	for <linux-tegra@vger.kernel.org>; Tue,  6 Jan 2026 21:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767734890; cv=none; b=J43glBm/8mDFEm4OtN6Ls9g7Bmvo3I6Utsse8zf9OzBh/LkyAqmTs1QJtyQM9z8MsMeVmgYYQQw23Hk8c6YV8z3eUGUpoRQTTKQz1vkUqUtePbYT1snGuLWyHp2iuNXKCadxwRwrogImzQMUmAYCzk3mOHTnk91EkztvBxbpM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767734890; c=relaxed/simple;
	bh=/R6V6SAtJTroTKOO4kHM/xViIlhf+31AyhmIEQMt9gI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DqBWua8beAydmiE+SFH2AvTFIP5Nz91ZPla2i3ZewQdzu8/96zr0NAZiuwu+cL7u4LfkNPymO8X7ll1avNR15m+yHKiVw7JfsJdVA1w/exMjoDy8i7lQ+xhv1olI6DJ2HZQvf8rjhyXeRnBuNypyPnoSYzKjmgK1PWB2ohi/Mx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=p6wULe2g; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="p6wULe2g"
Received: from [IPv6:2a02:1812:162c:8f00:19d9:5e35:1cd7:5d5d] (2a02-1812-162c-8f00-19d9-5e35-1cd7-5d5d.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:19d9:5e35:1cd7:5d5d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 943266C0B5D;
	Tue,  6 Jan 2026 22:19:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1767734385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DApe/d8kCAsLwVI3SRt4gxzxQSe+RWazjSOH2igUCo=;
	b=p6wULe2gtry+dwWbLvDu2hGPr82CAtLcpIZXZrKyvzdhv2XfVB9EMQIDuzA/LCQfQHj8jg
	BRY1HmVtD/L4yOMhhjRpAJBbSNBmQMx6IgqLTE1aliuY4/qu1rg2wm40B19a0EWBMOegEK
	ixKtnvPJFrp3FJWEPxU5RvKRfr2hZsQXhtUpuZ/GYFLFvGXhd5H4OMetfRLQsK0U086ZMt
	mwpR6ikW6cuAhk3S6dkRb2VCUCdvUFDnM5cao286L6NaIW2sKjWc3Ufx+XbAZZPMWYBno/
	2HpLLO9cFE+wbwj0xxt+nBR4s32+yq87pOJG0xpYLwbUeGtBf1IV7WSnbQiUig==
Message-ID: <f5dfb4e77fc9b59aaf5c35ed14cede549894b7c5.camel@svanheule.net>
Subject: Re: [RFC PATCH 1/2] regmap: Add cache_default_is_zero flag for flat
 cache
From: Sander Vanheule <sander@svanheule.net>
To: "Sheetal ." <sheetal@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"	
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Liam Girdwood	
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai	
 <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter	 <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org
Date: Tue, 06 Jan 2026 22:19:42 +0100
In-Reply-To: <20260106140827.3771375-2-sheetal@nvidia.com>
References: <20260106140827.3771375-1-sheetal@nvidia.com>
	 <20260106140827.3771375-2-sheetal@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sheetal,

On Tue, 2026-01-06 at 19:38 +0530, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
>=20
> Commit e062bdfdd6ad ("regmap: warn users about uninitialized flat
> cache") added a warning for drivers using REGCACHE_FLAT when reading
> registers not present in reg_defaults.
>=20
> For hardware where registers have a power-on-reset value of zero
> or drivers that wish to treat zero as a valid cache default, adding
> all such registers to reg_defaults has drawbacks:
>=20
> 1. Maintenance burden: Drivers must list every readable register
> =C2=A0=C2=A0 regardless of its reset value.
>=20
> 2. No functional benefit: Entries like { REG, 0x0 } only set the
> =C2=A0=C2=A0 validity bit; the cache value is already zero.

This is only true because REGCACHE_FLAT just so happens to zero-initialize =
its
cache, which IMHO should be considered an implementation detail. If you wer=
e to
switch to another cache type, you would also need these defaults to maintai=
n the
current behavior.

> 3. Code bloat: Large reg_defaults arrays increase driver size.

> Add a cache_default_is_zero flag to struct regmap_config. When set,
> the flat cache marks registers as valid on first read instead of
> warning. This ensures only accessed registers are marked valid,
> keeping sync scope minimal and avoiding writes to unused registers
> or holes.

A special flag only used in the flat cache is exactly the type of config I =
think
is non-intuitive and should be avoided. It needs an explanation, which impl=
ies
documentation that may go out of sync.

If your device has a single contiguous register space that you want to
initialize to zero, all you really need to provide is something like the ra=
nges
used for readable/writable/... registers:

	(struct regcache_defaults_range) {
		.range_min	=3D REG_MIN,
		.range_max	=3D REG_MAX,
		.value		=3D 0,
	}

Instead of a bool, you could add a pointer to a defaults table in the confi=
g
(which can be loaded together with the current flat list), just like how
rd_table works.

This would allow others to use the same table for multiple contiguous block=
,
with zero or non-zero default values. It would work the same for all cache
types, thus avoiding potential confusion, and limit the size increase of yo=
ur
drivers. Then you could even safely switch to REGCACHE_FLAT_S.

Best,
Sander
