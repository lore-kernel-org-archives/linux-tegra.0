Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA172C855;
	Thu,  4 Jan 2024 17:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fix3L17+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BD6C433C7;
	Thu,  4 Jan 2024 17:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704388939;
	bh=zTbm8vqIgREP9xUh5RR/d7xMKSNXbjKCjPWbk6W/NSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fix3L17+M3Q9NTGotqRuLRCFkkzimgaIIPzqhnOysfC0vb86AaR/2SIAYkhw4qYfe
	 u9OsO5rMLFgKGh8ajLxdFx+hl8dml4XKW1LznKISvr9IsRdVym9I8OeogDU7cy5bJN
	 C8aozsYBnM9o2ez8TkSAfWG+xZYoICoAgNuZbgFeKrFgcD10a30kHKy7dJ1h7wf3az
	 Cnf+4oiPbOS2J15dDrxKA1S0IzRuo+G1jrM4mqSdf4j3eE/LJxv2/lEwVUmWuKqswG
	 cWBNfmW3M6ca5GQ2KjZPhLfPxfwst9xa6dGWShhroL27OxwUFmSYBUjoALUDd3/ZP6
	 Tkm/xWnDrxOyQ==
Date: Thu, 4 Jan 2024 17:22:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	devicetree@vger.kernel.org, robh+dt@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
Message-ID: <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qsCYEYAbIVCe8tbR"
Content-Disposition: inline
In-Reply-To: <ZZblyhfzQjzyoUc_@orome.fritz.box>
X-Cookie: Q:	Are we not men?


--qsCYEYAbIVCe8tbR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2024 at 06:07:22PM +0100, Thierry Reding wrote:
> On Tue, Dec 26, 2023 at 09:58:02PM +0530, Sameer Pujar wrote:

> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /-----> codec1 endpoint
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /
> > CPU endpoint \
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \-----> codec2 endpoint

> Can you describe the use-case? Is there a need to switch between codec1
> and codec2 endpoints or do they receive the same data in parallel all
> the time?

> Could this perhaps be described by adding multiple CPU ports with one
> endpoint each?

Don't know about the specific use case that Sameer is looking at but to
me this looks like a surround sound setup where multiple stereo (or
mono) DACs are wired in parallel, either with a TDM setup or with
multiple data lines.  There's multiple CODECs all taking input from a
single host controller.

--qsCYEYAbIVCe8tbR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWW6UYACgkQJNaLcl1U
h9BvSAf/fR1ssQ4GinXH1HRespMqPWRE4tXIuKIpgLNB3VLe4jio3IDHRoDmJrZ9
L+farGwkmen3ti02C692QzdHaRDKsPeCDjzWBEihR685UkOO5u2053eiwTwwhjRW
KtBfH7pgKiZbbQnfGwOfgzztNtW+btyQ3XeLA1sXs0y0TIzi0VgGiAihohMJ7x/5
oU2zKrqeLn7haSIzKiwU44AMssq6Nn4DVMjgLynTdlbb4xGyKFzyeI3tCgl16hTJ
bwEWxcDmHxSL9yIirvUZTM4JzuY7CuNy7JTW680vWAZx1WrqzpTXAY0jiVje7akJ
N93tflyKEj/dKxpUJIZjCNZaIHIJgA==
=cAAN
-----END PGP SIGNATURE-----

--qsCYEYAbIVCe8tbR--
