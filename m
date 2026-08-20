Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095E73F39EE;
	Thu, 20 Aug 2026 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221261; cv=none; b=AGisn6neHKOC3X6+v2zenFVmf3D/rfOpLEZfntLVPR/j1o2s+vYxc+Iexnatn0EGlootXYKYZKxOYj01kbSPckr2cUNfIKGmiSB+Loe6vSzugVf4WBPY4I7UL6E++/1II78R0N5HAEBtCOAG0cLxDJpAAfJ8ze1LV+Wx3Zmj698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221261; c=relaxed/simple;
	bh=sCYVvPTW+2/mLPTcAQKqvJlqYUVgvZgoXYpPX0gzBlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXEWKIXEzquU5td88XdKKuYvqkeJm0wQNIG9QuZifZu/dWIdtTD8EglkWbmx4xdn8hzN8PS/QbjS609N2TaeihQ5mOPGb8ZuqaiXw7dEIaq+ZoYDHrKlyNNTh8zPc5Q+z1y0bTsEqs3VLCZZn9p0F3ngj5cBYag3nvEuWHqQ1tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oK5aMTfe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oK5aMTfe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008FF1F000E9;
	Thu, 20 Aug 2026 10:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221256;
	bh=PFeVwHGwojWnXM72C/0AXyTioasfj994XzOc2WFlW3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oK5aMTfe5TvV2iIKE/dNudC6IwI1ZCK8PKLDzrRcHutv9MJ2vtmSmCV6/WCRwSKV2
	 zOV+y+NYefphPBjl54Ydhag+PO7HfOxpnQh1zf24JVKdaOAE0r3hhYVIMI3Oztd8UN
	 TnGbbAo131Hfe98H8SOUVzzxn3Z/4DYHNOv+hFBg4xQF/s8ftfemkAuuwzCzoek7nH
	 xnPp9//bdL5kP6lG4Rc4NYnLiFLBMQD5FZRqhn9azC5HPE3tRilTMCcp+F+pj31tF8
	 MpW9FU/R7AvCDt8tFt41RDwlipB2YaIg+hZlLTXjeIMVXoSI4fdysgCaNlvF4QInFx
	 cc7eYs6p94ssw==
Date: Thu, 20 Aug 2026 12:20:53 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: tegra: ADX: convert map to flexible array
Message-ID: <aobUUhKX4rGgjQzX@orome>
References: <20260814205018.39015-1-rosenp@gmail.com>
 <aoQ7SynywUKcIAaS@orome>
 <DKSCUAP946RH.AXJJ9UJMW9CU@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rim3mcgd5fnhwbvx"
Content-Disposition: inline
In-Reply-To: <DKSCUAP946RH.AXJJ9UJMW9CU@gmail.com>


--rim3mcgd5fnhwbvx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] ASoC: tegra: ADX: convert map to flexible array
MIME-Version: 1.0

On Tue, Aug 18, 2026 at 01:33:45PM -0700, Rosen Penev wrote:
> On Tue Aug 18, 2026 at 4:04 AM PDT, Thierry Reding wrote:
> > On Fri, Aug 14, 2026 at 01:50:18PM -0700, Rosen Penev wrote:
> >> Replace the pointer-based map allocation with a flexible array
> >> member and use struct_size() for allocation. This simplifies
> >> the code and avoid an extra allocation.
> >>
> >> Assisted-by: opencode:big-pickle
> >> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >> ---
> >>  sound/soc/tegra/tegra210_adx.c | 12 ++++--------
> >>  sound/soc/tegra/tegra210_adx.h |  2 +-
> >>  2 files changed, 5 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
> >> index 9175598b52a7..d607ba4233b6 100644
> >> --- a/sound/soc/tegra/tegra210_adx.c
> >> +++ b/sound/soc/tegra/tegra210_adx.c
> >> @@ -677,11 +677,13 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
> >>  	void __iomem *regs;
> >>  	int err, i;
> >>
> >> -	adx = devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
> >> +	soc_data = of_device_get_match_data(dev);
> >> +	adx = devm_kzalloc(dev,
> >> +			   struct_size(adx, map, soc_data->ram_depth * TEGRA_ADX_SLOTS_PER_WORD),
> >> +			   GFP_KERNEL);
> >
> > This is slightly hideous. Maybe add a temporary "count" variable for
> > readability?
> The reason for this is to allow a treewide conversion of this when
> devm_kzalloc_flex() gets introduced.

Huh? Why not do this right away, then? It's a waste of everyone's time
to do these two-staged "cleanups". You're making maintainers do the work
twice for no benefit whatsoever.

Thierry

--rim3mcgd5fnhwbvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqG1QQACgkQ3SOs138+
s6HYPxAAmHrz/w3m6t4cJ6Cyg8UPUUzrB+4HAycviPsQGrBsdElxwAkz64m5/ZAF
+y0yY1N9THj6mph0j5SKTaLLEFQZ3/Tb1Ndm1wHtCgc/e5R0LnFOoxAZ05pxnjUc
9VNfmMeF2Yhgp1UKoXkhr7wEEOQcYgFfPnxQ3S/A/YchPugWhpORoKvz605p9qNM
kvXYqyO9FMTtYQ4pW/+4LlB7HjJldBimOZ1B0DS/0tbo5ib3BT8IDGQ7ICQa4cjA
ZlA/sjm210V2uBScSdqvLS64G6Ay3cD0o6yNc4QmDi0CW7LbrZiB6FEcS6sapyLu
XfzblXx2f1cvulL9n2QrE+mcwe6uJxs6XDrBYXnj1ncfeLBd3rPDo/0pOKW3Wy+H
1QmGrvhyUML4ewnq4TXPUxghcV8Nz6daY/Iuq/Z6BCMWxvYVE8UEd4Csqy0uROFJ
rgIt7EEj0fTvUNcMYBDr/QMIT+cUrPPnQ+NlNLDmuavo50QeD9ECyuf9AdwOxGSu
as7dxsIV9xs+WmAX89LgFWV5LlVjCClcV1QlgZ1U+rzBxspYWLGlBJTVhAT9zj7f
yFiUNycpRnaXJyKrO+kRx+WQoU6gFCldLOJbCU3pQmEUAHpY/eynXE3+85Q3ZstU
inPJ1YPUZXQJ5teit7lCfrl/OCka+C5A/DcUSrHAwDjm/35mI98=
=Uw62
-----END PGP SIGNATURE-----

--rim3mcgd5fnhwbvx--
