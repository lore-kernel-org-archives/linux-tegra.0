Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B56395247;
	Wed, 18 Mar 2026 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834997; cv=none; b=Xhi77vB/Cs5XmK74Eh7GpFe0n1l6N9xuV2/5h82e1vf1cGCaikkYqQmXjd0T1wBjCGJSqkgga7uiBe1nzJ1dbj3sNpC9mfVOvfhfQ59gntdAr9I4bbaxsCgXvl9q5zaHlnfC5WjoOAlkV4dRP0aiZLZtxrFbKQMi9Fx6ELXhB2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834997; c=relaxed/simple;
	bh=t7mrx+byIXeUtQTi7wbQn1MujU99LY7yItGCU9gkUxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKy6t+Hv1MQgDHcDz3aMaqsDXUoAMNvqG6L7SoK940SPi/BXnRWmCtZmH6yMLnnAjzD0q5+gqrXkXg96fzJbM8H+10G1podvmlWn76m4PKHdtjcxS/i6FNZCnsb1G/XtKX4m1GCmJrUK2uClmIFn5ZnX5+UHZkKrPAWpbp8ORvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5s1cTd/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5s1cTd/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01521C19421;
	Wed, 18 Mar 2026 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773834997;
	bh=t7mrx+byIXeUtQTi7wbQn1MujU99LY7yItGCU9gkUxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5s1cTd/mXC7qaymssGMJL2A8P7Mp9VRvypRs7KFLLi5E40vi5Wljk2+WvvYI/rI3
	 s5hIXI6ryeusFsQNpPA8tQ+JqFX6uL3sPINjblvZZgbiV0p19yRhPYU6kkp+IyPNoL
	 EDwyuRQpkZ9sraolC3Ku8HxbIttnWhkqqKhc97TzDyCWVqcYwQjO8twOJSpivlR9+7
	 kdILr1PaYuWVdmTIKhJ7K81rvpwpqRgybocBNDEeLtFRun7LtKiqy4Oa4E5swo8fLS
	 s5MQpF3+WUuQ2r+PVWobOiJOWVWhLiae1BcAM8U2oxefd4gcGTtwGTRYN7c+68vGgq
	 43LG+JCO79O+g==
Date: Wed, 18 Mar 2026 11:56:32 +0000
From: Mark Brown <broonie@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	katsuhiro@katsuster.net, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: add ignore_zero_sysclk flag
Message-ID: <a95d9467-fe64-401a-a692-b33b67afc381@sirena.org.uk>
References: <20260317094910.1582011-1-sheetal@nvidia.com>
 <20260317094910.1582011-2-sheetal@nvidia.com>
 <ac95d92e-7304-49e7-9582-666eac386102@sirena.org.uk>
 <87cy12hxeu.wl-kuninori.morimoto.gx@renesas.com>
 <9246afe1-4ad2-4224-9b1a-cff07ecfa8d4@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zgXJMLDGw9zrkl45"
Content-Disposition: inline
In-Reply-To: <9246afe1-4ad2-4224-9b1a-cff07ecfa8d4@nvidia.com>
X-Cookie: All celebrity voices impersonated.


--zgXJMLDGw9zrkl45
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2026 at 02:36:42PM +0530, Sheetal . wrote:
> On 18-03-2026 04:32, Kuninori Morimoto wrote:

> > > If the driver simply can't tolerate disabling the sysclk it seems like
> > > it would be easier to just have the driver directly ignore attempts to
> > > do so rather than adding this flag which the driver has to set only to
> > > get it passed in?

> > Agree.
> > I think this commit can help you ?

> >          1e1a2ef95b571825ca9c0113f6bef51e9cec98b0
> >          ("ASoC: da7213: Avoid setting PLL when closing audio stream")

> Thank you for the feedback and the da7213 reference.

> The concern with the per-codec approach is that this affects any codec with
> a set_dai_sysclk that forwards the frequency to clk_set_rate(). Since any
> codec can be connected to Tegra platforms, and MCLK is provided by the SoC
> to external codecs, when clk_set_rate(..., 0) reaches the BPMP firmware, it
> raises a fault for rates below the hardware minimum. Fixing this per-codec
> would require individual patches for each.

Since in the clock API clk_get_rate() maps onto clk_disable() those
drivers ought to be fixed anyway - perhaps we need some helpers for this
since it does look like we have some issues here.  Either the driver
should ignore the disable (possibly due to already refcounting the use
of the clock and disabling/enabling without machine driver help) or it
should translate a rate of 0 to a disable.

--zgXJMLDGw9zrkl45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm6ku8ACgkQJNaLcl1U
h9C2swgAhRfO5R9z7hn8d+jM0c41MERkHuf6/t36LoZuQvdM5yi/dMb8WhSVELvM
uCoBOvWK+yOy0P60IhoSXZwyiwo15+Qa/+ifBy7NO0E4olWqGRL68cLWTXobR5O1
wVVMZUUDq3IWqsDXFOREgUYF9lIGw9FlUHeJPLqjHHqap1TRidwAs2Fm6IUm+tFQ
Lm7G7fU1KTNuVchFtRHh/z+DLBdQzN3urFektCrM2IUGU5vD1xy7OjaL5cFcOmeF
SCO1cq8cDp0ufxmDFAgVzJTX/IymsRPNCQ+dYzKyToOMbR6yW918D/nCg0wBgDsT
z8iiZbe3tPgm5UJKSO9Lexhj+3vzGA==
=fr9c
-----END PGP SIGNATURE-----

--zgXJMLDGw9zrkl45--
