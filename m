Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9763E3DBE;
	Wed,  5 Aug 2026 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914839; cv=none; b=Xfc1pGiGzCGD/FpEurjdSFKc58fsgqITm7XbcOUhK2k5WctzHIR9FXhWS+dYrF+muAdKfX9lsgGhf8yvq8QxTYGmIr/Bc4Zxb+QlxHlpenj3g4/XEznlKffIIu2/+OdkuDPsbi1OZTNRkGcBTyqcTOvZ6enzSzeB5ZVR83t3KKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914839; c=relaxed/simple;
	bh=L5NW7w8CIat8o+dyFFDpruDvc+4azVJURsGvOWaQ3SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6YjEgxRchKfMRNohKFBsxB2UjgtYm4Cb2bBjC180h7IdDEyewmm4EXHyuqTRblK4OmwvM+ns/t7iMma7MMK3bHIjaMzKKVlg4DrK7mLbkuJOBv+pv0ok/xu5WB1nEGvwBoL+Y8RmSr3KhSP29foPJZ7mUlxREY1pXtl2FyIjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obIP7ahI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obIP7ahI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47ADB1F000E9;
	Wed,  5 Aug 2026 07:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785914837;
	bh=L5NW7w8CIat8o+dyFFDpruDvc+4azVJURsGvOWaQ3SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=obIP7ahIvPl7hRIv5YMSrhmKdcwNAYt2y+BNbjBQs+LO+QDPE28CO8Yf0s5loJxTQ
	 UmUHxDj6bpur03qx5RR9TwuFRRMneOWqWf8ZgvomsBe5v4A+oJbL3knq2fTOD6B8Hw
	 Db4wIVX03qf8bs19EwBvJk9kvJPLpnociLWqd41GCbDF+5SKuof7SucUppyPwwiWDe
	 bE31VcvgrozkgdlFoiyor8PfEDVKGLzkNvJHrUL8AYEmlCww3NwLqZBtXl6lVU0Wdk
	 D0bAltymRCkS2CjSa05wjxDOmmSE9CSJSP2NlKcYAhe2gS2qHo+PoIxDXGD0Ammt2/
	 hbaUi7aOEWdQA==
Date: Wed, 5 Aug 2026 09:27:15 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, jonathanh@nvidia.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2
 DIN/DOUT pin names
Message-ID: <anLiwXh0JGH_bvKv@orome>
References: <20260727141121.772110-1-pshete@nvidia.com>
 <20260804-energetic-gracious-python-a6fe54@quoll>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7dmww3t3gldfvauc"
Content-Disposition: inline
In-Reply-To: <20260804-energetic-gracious-python-a6fe54@quoll>


--7dmww3t3gldfvauc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2
 DIN/DOUT pin names
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 09:37:14AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 02:11:20PM +0000, Prathamesh Shete wrote:
> > The DAP2_DIN and DAP2_DOUT pins were listed with swapped ball suffixes:
> > DAP2_DIN as PV7 and DAP2_DOUT as PW0. On silicon DAP2_DIN is on ball PW0
> > and DAP2_DOUT is on ball PV7. Correct the pin and drive group names to
> > dap2_din_pw0 and dap2_dout_pv7.
> >=20
> > Fixes: 30a9d5162f25 ("dt-bindings: pinctrl: Document Tegra264 pin contr=
ollers")
> > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>=20
> This will break the users and only for fixing naming style? Are you sure
> it is worth beraking ABI?

This isn't just fixing the naming style, it's fixing the name of the
pins as they are referred to in a number of different places. With the
wrong ball suffix people might easily be confused as to what pin they
should be using.

So yes, I'd consider this a bug fix and worth an ABI break. The ABI
break is theoretical, too. This pin is currently not listed in any
upstream DTS files and all of the downstream ones I've seen use the
corrected suffix already.

Thierry

--7dmww3t3gldfvauc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy5c8ACgkQ3SOs138+
s6F5DA/+IrFkU31Db/Yvs5683Vc1LuVALU/xZKRm37wV4wmbHIZFgh3JYuUyyHuw
r1MOWNtGDZamdBb75IEmHmGYl9ts0vvBK12A5jTH4hrz2a0KTu/63Ic1jWZmx/tE
Es8DLhlUNUZVWS3mYv6+YDb0yB9CXa/2klCusLcovv9HjkaZAEZoJ02MHzuy6QVc
DLWvAzzOVtJV0bDHJfZ8hsWFcwPgmQw12nH6MO7kteb9pcvLi5yHb0CqsW8ku3sM
iMgap+H3x9ZMrbmBxNL2JGjsQ/dKiVqhFy34j+QLjCvx5GTmLNOShCxh2LGCUfUk
6b+8dfdLhnrLllInS21g57RR2h1pPuNPu2ppUkXSonZfVDhBSlndcv4/rnNMtl05
ccPgs7sWSnzyP7E58Mnd1bMHblePWlgUEbLmCjkI/Amzp3AWI+I0t3WVajMvWVIP
EI9OFnuVys3PEd0I1CH6fJRPk1h6mxqdKdbyjTIUlaaR/5xGH3NK5ga3jY5HmFHg
wH4Ly95OrehRk/nNwwftG9OnBpSfiBwkPp+4aJsHxw3dT96lWOOMYKhmjA0FnmzI
EP7Mgwr6Pe3k5lhLIu7VWdrOWCHtxpOcFpUESUdBDiRSlbbRUbozXLrk+LuAllDt
wf/X0ew6p6LoonVJ56tri3TKcTiGHEl+yeXIZuvkKdQf2+8Y3Hk=
=58Ro
-----END PGP SIGNATURE-----

--7dmww3t3gldfvauc--
