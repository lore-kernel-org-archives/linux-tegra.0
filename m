Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C8228EA56;
	Tue, 17 Mar 2026 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754763; cv=none; b=T20fzBkTlEoSit+/VhAIlelEt0HGuKLgzYGs9SDdEZRo3ManOw+MXHCj66/Y1Jf2r6Diij8VDG5AvmV3z7UOUygJdtkSrFqTv4iDs2MGMo8myqLHJKuiRAvcwEbp/lQIOdjWC06eBPgQlaxMZ2ZpFwGiNG2N00NoQFE1GLn6TVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754763; c=relaxed/simple;
	bh=7/qyo9e9095zpov8iWeWRRVa5GCe9hnoA4Tuv8AC3ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P144HMXFAYHSqpxyinGo+QGdY26pIyf+d2duQy5m4CkRdc39zbd8/Mk5ipu5XC7x/ijFE/AH6eHbFjRj9dlIX/Hj/JnoeTwzxrtaZYPoxuYTgb5cpJBFYk6ehPxT55vZJVGNQrqOccrgDR9GyHgsnCjWdSOtfwYh4HbRPAn4KxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkVU3fut; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkVU3fut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90AA7C19425;
	Tue, 17 Mar 2026 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773754762;
	bh=7/qyo9e9095zpov8iWeWRRVa5GCe9hnoA4Tuv8AC3ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkVU3futKuHcHnVuwog7QTIaej62b9xe2ilIp2i3zmPznsFyDENkofsZ6MYwvTEHU
	 qN6kY66llT0W1tMjuTBrzK3VWoKiNo3yKFuNK9LWJ/Q/O2YK1VbMzHxnszxTx2gCMP
	 i7LdlR3/B7wXlmS2kw0FWiAnv0R0jC6gG46Fb+JsRnjX2IA6QzbmE1zwOD7WbBDFIc
	 izc1cYhx2+fHoX8Pqe91ftp74NbQkznF94RWSMtgf++ueoB5RtVuVU6/L5pk+WlYvB
	 z2Gn76hu+XQqKHtCoJYU/9Yn7Kimkw5YpX/sxzKtMo+Pgr7ELlA4u8IJUHQFcv1LnU
	 gIG2F9FJI/2rg==
Date: Tue, 17 Mar 2026 13:39:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: add ignore_zero_sysclk flag
Message-ID: <ac95d92e-7304-49e7-9582-666eac386102@sirena.org.uk>
References: <20260317094910.1582011-1-sheetal@nvidia.com>
 <20260317094910.1582011-2-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S/NSfEge2priRBrX"
Content-Disposition: inline
In-Reply-To: <20260317094910.1582011-2-sheetal@nvidia.com>
X-Cookie: Must be over 18.


--S/NSfEge2priRBrX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2026 at 09:49:09AM +0000, Sheetal wrote:
> Commit 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to
> sysclk when shutdown") updated the simple-card-util driver to
> send 0Hz frequency requests during stream shutdown, which can
> request frequencies lower than a platform may support.

> Add ignore_zero_sysclk flag to struct simple_util_priv to allow drivers
> to ignore these 0Hz sysclk requests when they would result in a clock
> frequency below the hardware's minimum allowed rate.

If the driver simply can't tolerate disabling the sysclk it seems like
it would be easier to just have the driver directly ignore attempts to
do so rather than adding this flag which the driver has to set only to
get it passed in?

--S/NSfEge2priRBrX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5WYQACgkQJNaLcl1U
h9D97Qf+PJ7AhkAUPTSrAF0L66lvLx61m1w6rtaR8hl42DavmKuqgPVF2otcmaug
lSLebePF102k9/9vUPq85/R+7vNijAuh4bbR2Q84ghRdgSyEXlxHGN0dxPpu0o3+
MHsN2WygOsIn2vpiAiHKRa4lpG+AF+OaG8EkO/n6D43kq/LJk0BJuiRv10KWFZiF
TJN0hXRSQ3mY5rHfQMTOFNVAvNrbLfKmcAKj6FtA5T66LbhIb78nhrlRykBNn6RE
W/uIGtCjxTBaNrrn5ddI9njSzTDq5AbWEQmodo+aAI/2HtiAoajXKroSAEz0wDVC
fYVA3LlMBS39F3L7N+2L/LL16qL++A==
=M6JI
-----END PGP SIGNATURE-----

--S/NSfEge2priRBrX--
