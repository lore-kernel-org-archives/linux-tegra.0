Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9FF4963D2;
	Mon, 21 Sep 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995065; cv=none; b=HljoypAOeUOY7bWNMk3NSHO82jgQqAgWAIbqK+n+iKYd1jcB8g72U3BTEGKfCmt5vvD2NuB+nBXq/Ps9GYBx7yzVtonjMm3UOJK65MWPSUubE+VmpzT71UR9fAn8pBcDGH5KwwWQV8WOdx5sAeOHtJE+chOBnXku8V3ZP1VBK0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995065; c=relaxed/simple;
	bh=tWjhtlSmNitNe/RV24G2Ic0DpfRB6aqKBFyMVbKS+uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TADVsHYAhqyIkPHRjlGWSEdazHpQgm8CXDKUu+YM3CrZ10d7UxSXsHsTHOcP6b/+z20I4FsUuuGWozbxRz1gCdqAmFNLII8qipbsnHn/YP7QQ2+AaAQUwU9WeT3ChBA0W5O/FihRJYeVB0WRlPNaXUAZ6tgpB7BaN8C+ATQCGDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzHyLd0X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzHyLd0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED541F000FF;
	Mon, 21 Sep 2026 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789995063;
	bh=4/yFLn+o15BprTqPsawaFIBezfUtDv5pEFxxxaLrCRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JzHyLd0XpsfgMH78TsESHQI0kAOiRQG63YkLwNG0ek3LStt5aUXAT2CHkx/60wT/F
	 wAjcrwqtLjkp74QMrfyAqpBh1N2+q8zZdlzQJGguCVSGmCdtiwS5+lPf7Ku6DSfvQr
	 W7E9PY27NC/TIFEN3/r6PY1enFmjJCxxBqcBLQv9c6D5Wkj09UqNDIO4p8INgWiAgy
	 WdJlKI5UIrhnYZuGgX1M2/RT0CTx1pTMgBCVShTB1nZRz3HBGy6SvYxERYgviKGEVL
	 bJLEyHMPlvpPI+hdYopFCiySz+YpRIELzPVOV7z+GUjkpKQutziNnd60fNiWzitLts
	 osD5CrCV61ClQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A6BE91AC5376; Mon, 21 Sep 2026 13:51:00 +0100 (BST)
Date: Mon, 21 Sep 2026 14:51:00 +0200
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Sheetal <sheetal@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mohan Kumar <mkumard@nvidia.com>, linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] ASoC: tegra: ASRC control fixes and ratio caching
Message-ID: <arEoNAC729MT5Bqr@sirena.co.uk>
References: <20260921085704.1248920-1-sheetal@nvidia.com>
 <arEaioTIrCyJqwKn@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UT4EMBkDKh9XPIOk"
Content-Disposition: inline
In-Reply-To: <arEaioTIrCyJqwKn@orome>
X-Cookie: Too clever is dumb.


--UT4EMBkDKh9XPIOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 02:07:19PM +0200, Thierry Reding wrote:

> Given the ABI change, do we have a good understanding of who might be
> using these features? My understanding is that these are used for the
> setup of hardware pipelines involving sample rate conversions. So these
> are likely not your regular users that just want to change the volume
> for headphones and such. This is for highly specific use-cases. Do we
> know if people use extra userspace software on top of ALSA to set these
> up, or are they typically dealing with fixed configuration files for
> specifying these values?

=2E..

> Mark, Liam, do you have any guidelines on how to handle such ABI
> changes?

I don't really, beyond your already very good summary.  It depends a lot
on knowledge of the users for the device, their level of expertise and
how likely anyone is to be using the individual feature in the first
place.  Obviously it's an ABI break so we shouldn't really be doing it
if we can avoid it, but if everyone involved is happy and has a good way
to deal with the changes then it's not really a problem. =20

--UT4EMBkDKh9XPIOk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxKDMACgkQJNaLcl1U
h9BWJQf/bjhcoK/uZuZxiYOxhzHzfC/k+m9JWXSCqbAguDQONHhzmGu1lisC/C1N
yBncc4DlJtY5wPiw1lKTXA5ukf/nNmkOUxFJE61eAyHD59Bh6I8JDgADNzKxlAsK
inJ76p2doCQ6xnoofAEt9zfqieZGYqZf0Zuws3GWDat0m5UkVqKXNda05opvYMWb
gsCcni7ab8XS8CXkr69VaLirKAJ/XSVG0elNJ0B5cPLFEUX8/FTfU6mBrplru4e4
qkZxwvOnzG+yeWM8LYbwnO/fhHAHs0b3vydTTqkzwV3XdzeFYASSGotln7g9mwc0
b6FLtnimS1SREUAarKKT5z+f68xcKw==
=fjYI
-----END PGP SIGNATURE-----

--UT4EMBkDKh9XPIOk--
