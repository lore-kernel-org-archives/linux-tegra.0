Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FDC311C33
	for <linux-tegra@vger.kernel.org>; Mon, 12 Jan 2026 19:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244984; cv=none; b=EU3Z5w39C7OSuOml45WwdfcTzCNydyL4w6+kjIM0W0f1V3DuUHPCn0w3Kehv42NbxfMVx93EFDZp05FMiSN7JVftE0vQDC+x25LzyJCBKn8YYhJ6ZlTyuIqlyWMrJ5CdxJg2RHiWsZla6YkR7WSc+fpsfR7m3jMY2ZAqFuGQzAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244984; c=relaxed/simple;
	bh=KC39OQq1b6fPbusVOCtRhkW8fCXtGUD/PDijPlIEHRA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PmgYZY9YFu6jqkT1MxkOn/+5qODnsHQLJSxDh1Fl9f3HrrcBgnt3L0BkMZWZvtAcHO6EKihUiNjqzy4eV3AuPsSnwZcUSwmuvP95Ib5k1CZf6fLqVUIvdwEW8zjJS2sCZ2++igZ2VN3voR9eSL8AK/ovGm4s4yoBBdeEJiY7cOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=R+JFwris; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="R+JFwris"
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 108136C8F72;
	Mon, 12 Jan 2026 20:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1768244975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KC39OQq1b6fPbusVOCtRhkW8fCXtGUD/PDijPlIEHRA=;
	b=R+JFwris0Ijbux7QUlL4B0WkrNS4e5PxuGu5OWQuD61HsSCcBVMsycyNmvCSRAb0vTb4X0
	pDuDS0E2TtFQnSJg2/XumoxBfmdSxgSFSpoEKBn04xx2ANZzqVWshfliyFEduxvL81e8Ug
	MqW9rpdjTuRNBLzlTXL6YRio333iAdsgXvDyq6g7EJC9hurzpO4lez/PYrORm4xZJHunUz
	kl/r9Yq27tYD72Yol8udBkQxAqcjGPJrm6f9WyVmpD4MB6eBAiSLMznZhd0wqHZKl1ukxX
	6u4JO+sEfvM9X7+6iRmpw/Aepi5ta6t0bD1NTwJL9YmildFX2eFX0lHXL1XbVg==
Message-ID: <c477be44febb94b8c81f522c4d86971417740e6d.camel@svanheule.net>
Subject: Re: [RFC PATCH v2 1/3] regmap: Add flat_cache_default_is_zero flag
 for flat cache
From: Sander Vanheule <sander@svanheule.net>
To: "Sheetal ." <sheetal@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"	
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Liam Girdwood	
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai	
 <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter	 <jonathanh@nvidia.com>, Mohan kumar <mkumard@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Date: Mon, 12 Jan 2026 20:09:33 +0100
In-Reply-To: <20260112042841.51799-2-sheetal@nvidia.com>
References: <20260112042841.51799-1-sheetal@nvidia.com>
	 <20260112042841.51799-2-sheetal@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Mon, 2026-01-12 at 09:58 +0530, Sheetal . wrote:
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

If you would extend regmap_config to accept a callback for defaults, this b=
urden
could be reduced to near-zero if it was a simple wrapper for the writeable_=
regs
and/or readable_regs callbacks. I.e. "return 0x0 if readable or writable".


> 2. No functional benefit: Entries like { REG, 0x0 } only set the
> =C2=A0=C2=A0 validity bit; the flat cache value is already zero.

There is a functional benefit: it allows regmap_sync() to do what it is sup=
posed
to do: check if a cached register matches the reset value to omit writing t=
he
cached value to hardware after a reset.


> 3. Code bloat: Large reg_defaults arrays increase driver size.

As I argued before, bloat would be limited if the user could provide tables=
 or
callbacks for defaults.

>=20
> Add a flat_cache_default_is_zero flag to struct regmap_config. When
> set, the flat cache marks registers as valid on first read instead
> of warning.
>=20
> The valid bit is set on first read rather than marking all registers
> valid at init time for the following reasons:
> - Avoids writes to register holes or unused addresses during sync.
> - Safer for drivers that don't have writeable_reg callback defined.

These are benefits of using a sparse cache, but on closer inspection don't
actually apply here. You can validate this in your kunit test if you also d=
o the
negative check: assert that registers outside of the written range are left
untouched (written =3D=3D 0).

Because regcache_read() will never return -ENOENT with this option enabled,
regmap_sync() will see all registers as "written". Since there are no defau=
lts
to check against, this will cause regmap_sync() to write to *all* writable
registers. With this patch, you are just reverting to the old behaviour whe=
re
regmap_sync() silently overwrites registers you never accessed with 0.


Best,
Sander
