Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E6919CCF5
	for <linux-tegra@vger.kernel.org>; Mon,  8 Dec 2025 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765227913; cv=none; b=tagtE5Q5KLwrxbjB0XrMZqBFHUDL0XJkBW86DJm6TNq4SbQjFjlFYq4L1i2uTm1hPBqN3w8DQXEx1eVE0G2sN7dQYi2wO9ZdEFDX4w7/NPm3m9DO83Irak3V1YApJlthRUEmLfxzSVYjAlOYVrlN0RMpvCHkj6+rL/AON673O78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765227913; c=relaxed/simple;
	bh=T8L1+/nl58TgGmw/lREAJJDSPazGgb7o36kAd3Y/6Bo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IhV0UmxcACzYxln0yEdkXjjh0TzK1zVItOHXLQyQ+4ozr7zk8AH5S1GlViTL/W1onQhlRNP1ArXp79GLvmfq3bryEKcZCO/RnHKBobKxbYoEn3b3NyhaGmPN1M77QERW1cTOX25a+YiVo6Wah5qrZE0dzaIKeoZC6h5tPP/FMCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=d+R9E0uF; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="d+R9E0uF"
Received: from [IPv6:2a02:1812:162c:8f00:74f7:450e:16bb:b45f] (2a02-1812-162c-8f00-74f7-450e-16bb-b45f.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:74f7:450e:16bb:b45f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 2B46A6ADD0C;
	Mon,  8 Dec 2025 21:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1765227423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8L1+/nl58TgGmw/lREAJJDSPazGgb7o36kAd3Y/6Bo=;
	b=d+R9E0uFllKD/RpPd92sKLX2ZSbJoIOry+nAbZE+8u1LeAMGi9g7pgweM90/HC0BuHafRc
	rHO1sv6BM/wELY3LDthIh3gBOOBSzmFxUHbolUWu4r4HqvmeD/ge4vIOXb6kUy21fNtteN
	oDiYwI2R7xAoo3iejMC+nZVaPOpvk4STX3bS1TXJMoIXlyvUS5cuB1lX+01OLXKghiEOYd
	qgTDd1WpbeX+aOCfAGP3OciniNwvDC76ZMiXnHUZrFipdAcvLdCs3475g1CUhWTcYOb1gw
	XFexckyxcSWxS5XYqcUaVK8nvpPN5/iV/HWYCB2mh6Wx/wbm63IHiPLDmvLHdQ==
Message-ID: <3c8b0ff11a7b5bcc26c2e99b7369cb50d48621ec.camel@svanheule.net>
Subject: Re: [PATCH] ASoC: tegra: Fix uninitialized flat cache warning in
 tegra210_ahub
From: Sander Vanheule <sander@svanheule.net>
To: "Sheetal ." <sheetal@nvidia.com>, linux-sound@vger.kernel.org, Mark
 Brown	 <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter	 <jonathanh@nvidia.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, 	linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 08 Dec 2025 21:57:01 +0100
In-Reply-To: <20251208052040.4025612-1-sheetal@nvidia.com>
References: <20251208052040.4025612-1-sheetal@nvidia.com>
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

On Mon, 2025-12-08 at 10:50 +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
>=20
> The tegra210_ahub driver started triggering a warning after commit
> e062bdfdd6ad ("regmap: warn users about uninitialized flat cache"),
> which flags drivers using REGCACHE_FLAT without register defaults.
> Since the driver omits default definitions because its registers are
> zero initialized, the following warning is shown:
>=20
> =C2=A0 WARNING KERN tegra210-ahub 2900800.ahub: using zero-initialized fl=
at cache,
> this may cause unexpected behavior
>=20
> Switch to REGCACHE_FLAT_S which is the recommended cache type for
> sparse register maps without defaults. This cache type initializes
> entries on-demand from hardware, eliminating the warning while using
> memory efficiently.
>=20
> Fixes: e062bdfdd6ad ("regmap: warn users about uninitialized flat cache")

I disagree with this tag. The commit is working as intended by giving a war=
ning.

This device's reset state happens to match the zero-initialization of the f=
lat
cache, so there were no issues here. An earlier version of this sparse flat
cache indicated a potential problem with another driver, so there are likel=
y
drivers out there that do need fixing:

https://lore.kernel.org/all/a2f7e2c3-f072-40f7-a865-5693b82b636e@sirena.org=
.uk/


Regardless, this patch could still be material for 6.19 to avoid unneeded
warnings, but that's up to Mark.

Best,
Sander
