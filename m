Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793838118;
	b=jQYkEAahSea3Law99/2Ukiprj79S1xZpONvJA5txDuKRvv/bggy5GSVneAlBy67P/mV+
	 AlVyCir38v9ixF8PIUq7ha/9yan53NhUzovg1sbmhu34ett9aH7u8bl0I9LZv0evP86kF
	 IEqFv2m+kQCqDLTxF3NySQ6Lgebt0MWNC4xrNYk4JTBYJpdo4bP/7KAtwQMW7YdmsKzLQ
	 o8boAgb9RKvOFAo0vkrrQz8pJOUN2gzrSszqFK/3Q3L8dF0Velye2ISRQGtZvwq2XU5k+
	 O6YNlV/5KuoldmCDi+e7g8ZHP6bozmVPmjRLYdA4y9ew2A5fPYD+8/SordyrhPMMe3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838118;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=KJ+EWn5f31K8LTsipMRwE67SY96qb24TRG/ZZUgor4E=;
	b=WA6HU/iClVzU88Crqx6oYymbjPob2ZyCP07/4RigjLNn0pJDXq4LLBcBDNju7KxlwkTi
	 SbdopUddWY3TFQqV7fQKu9gjei+W0daKyXxYcSSaccVcRlZW/H2S7EcINGfklG243d6be
	 mMUcC82bg3JF5B3VG2PqrxQ9QuCoDG7BLbdSKYb+ItCht4ZMqHQr7oYkapOnOGtljX03z
	 +Gw2fqNarkB1lf9G/KQczb7/fZ++nPD2JfWs5NoibPSYRDnDqlPuqxzR+CXEjbwwGp5uB
	 WbRhBUizO8Y4l6N1ZHTM9l85V0XPVIAloBRBIn6Hs2tfSz1Bm4NCShBFJGrT29LvKUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jFRjSZ3V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F0E606A31B;
	Thu,  5 Nov 2026 00:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jFRjSZ3V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DA51F000C1;
	Thu,  5 Nov 2026 00:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793838117;
	bh=KJ+EWn5f31K8LTsipMRwE67SY96qb24TRG/ZZUgor4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jFRjSZ3Vjg2/3aqnl3ftOlADfJwCoHEFZ89XEajUiiTXtFgUUus+uer+Ptdu3Ztuv
	 lf4AgGKcAz1wf+1jPrFB4NwTgP+WFN+61Vok/HozH6p5F/KWFoHpAT3NlxM1cvSb2j
	 C739jhTdTi0ZaI26Ajh1epVtVX/nxV5PbMJtrAlHD/4IARRMkmOIJNaH5wzYCHCFOD
	 JshCoEPt0LG2qji65DxmVfd8SGBSTWIBAHPQsYg4nFSl/8Az77DBFilsC7adseC0rS
	 53Np+hG5Y0J2o2lJcVU6zMCig0aY7vRVJVRxsqK8art1bQ/9lpfFSlNeFhnF3Y1gYf
	 HY0LLms01dBgg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 514B1269328F; Thu, 05 Nov 2026 00:21:55 +0000 (GMT)
Date: Thu, 5 Nov 2026 00:21:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Add Tegra268 AHUB support
Message-ID: <eb487bb8-1d43-473b-8eac-c35f11aee6dd@sirena.org.uk>
References: <20261104112055.1101243-1-sheetal@nvidia.com>
 <20261104112055.1101243-2-sheetal@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/o0u/gJGJlEXgU5E"
Content-Disposition: inline
In-Reply-To: <20261104112055.1101243-2-sheetal@nvidia.com>
X-Cookie: Whoever dies with the most toys wins.


--/o0u/gJGJlEXgU5E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 11:20:54AM +0000, Sheetal wrote:
> From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
>=20
> Tegra268 AHUB supports five RX and five TX ADMAIF interfaces, five
> I2S instances, two MVC instances, and one instance each of AMX, ADX,
> MIXER and ASRC.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--/o0u/gJGJlEXgU5E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCauvMIwAKCRAv73Ows9A4
ic7YAPoDZZC/AHN6uGF95k8G1Y4mgrZ5on6qIUN2NaWY5Ek0EgEA7zCSlgtDmyRM
NRssu04HoncgGiLJN5vUVjhl1RC+rAo=
=s/In
-----END PGP SIGNATURE-----

--/o0u/gJGJlEXgU5E--
