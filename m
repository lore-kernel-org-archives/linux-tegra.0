Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F77F1459FA;
	Mon, 23 Mar 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277103; cv=none; b=VozmsCU007nwCS+v1GHYTaEG/jqDXuK+iY8TBdVUoMJpeIZYNLZBxQNrjKnUxB33lMD1oKSGghVxB0CC4e+BxmIdywbX6LFuWr8YmxWISXb8g4OC2Jwd1gtxo9FmDU3yJQaJkQW4FqtKvXJ9dY3PJt2yG3vHn8GDXSY3jCmutrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277103; c=relaxed/simple;
	bh=AMsHMdA+1ENOpjDo1x/BafeNv4x5LgPVJV/XXUHUyC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uL5B0n1PwotxcqUnLEifvBMCZN07hMieMp1Qh7VnmrmqGTvc5apFG0i1bEYn0ksM6jtuAoZdytyYsbf3K73uFpnmAQMKBhQMSEPSYH+G+MBnnOQ2Em0PVmo3090fCcf7+5GEiVapNjK8NV3yZA7POtbCpq70TB5FjIcxtmbq6a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gS+9M2ub; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gS+9M2ub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2777C4CEF7;
	Mon, 23 Mar 2026 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774277103;
	bh=AMsHMdA+1ENOpjDo1x/BafeNv4x5LgPVJV/XXUHUyC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gS+9M2ubAQMlNkOsYlqf66ywjcBYELCZYK7whLIyeN2QGJqhC9gWNKpznKMvup/27
	 XtvFey5bCv/cDxRLWfAAUj/ObwtzAMuWLg3oYgS5dhtPdtOeYCi7JqMkvrqRieKH4r
	 /oP3a+EMKKqBQcbNkddiX8T500vJER4uW+WHzpYpn++/L/fMA6y0VO9n1jv5+3V8Z6
	 aNXr/DPXcc9mU9ykrOP2u0QbXeQe14wrKKeexD6IBS2D4rSULDt8/Y1n0mm8K+/3vM
	 9bJN360CR3GRVhHfeysHviD2IyGWkTLMGYQoJqU4g41pfsagmMNosy+WoHPPKlIiH1
	 Q+2XpMBEXkRZw==
Date: Mon, 23 Mar 2026 15:45:00 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
Message-ID: <acFRczOXps0nRfMl@orome>
References: <20260320234056.2579010-1-thierry.reding@kernel.org>
 <20260321-witty-fortunate-elephant-ce50fe@quoll>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bj2jq6boulfkimbn"
Content-Disposition: inline
In-Reply-To: <20260321-witty-fortunate-elephant-ce50fe@quoll>


--bj2jq6boulfkimbn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
MIME-Version: 1.0

On Sat, Mar 21, 2026 at 11:47:59AM +0100, Krzysztof Kozlowski wrote:
> On Sat, Mar 21, 2026 at 12:40:55AM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The PWM controller found on Tegra264 is largely compatible with the one
> > on prior generations, but it comes with some extra features, hence a new
> > compatible string is needed.
>=20
> Extra features means devices are compatible.
>=20
> You also always need a new compatible even without extra features, so
> last part is just confusing. Suggests like you could skip new
> compatible.

Erm... if the hardware was exactly identical, then there'd be no need
for a new compatible string. It's certainly good practice to add one
anyway, but what's the point in having 10 different compatible strings
for exactly the same hardware?

In this case the new compatible string is necessary so that we can take
advantage of the new features that are not covered yet by an existing
binding.

Thierry

--bj2jq6boulfkimbn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnBUewACgkQ3SOs138+
s6ECiw/+M6SuqkgESmCh2Zs0fMLDwRsRTMjDVRXlSkyhH6o8BpoobXFljQTNpKxB
PehFRrEJqSEpDentORQ1jg+NZckLEC1f1hHpQYbrfppGdgH91B8+RGXvRNipgh9E
vQ02PsesWITjQ+cXB9/IeS2+klwBXscpr+TlQqg6rwOkccO/DNWRXGNc+majkS5f
aoS9Obo8Ys7bZEoSwqao38JyTy3ZgW7PZjiRfd2NCPbt+Pu8cVjsNPN4n4pbhT+g
srsqOt4s3+DKjtsI906Q594tfaAuttNNWBdY9SkBlvT4k5nEg5Qge9hpECih8MTe
q6OUagin62wliKs8LNG8maSsPp71ZShoo9TRjLMn0bJKiBnDYx6r6kkWPh+fizX5
VXZ0rjzAjBedmI4YPbatWYBcu6FiPNRCXU5lL7p+MHq64gsOAj0e3OQ7lkN1PsOm
KTQQJhgE4UEgdz3YZi5zAr3uii8cuKq6vatYIX7pGXlFNsQg5w2K+BRRysADZLwy
AhWVWEV60TRbNK4hBW1s1k1ItzZM0nkR6IOmRIctqa4dli7baRlXc2oNOqxL64hX
dPO8nKoxQvxnXMoKJPCELdkl2RB0wGwDH2fmLVmwn2rcFFk46m2jXTrSCWQSesxJ
lBXzuY2LkCaazy/LW6UVAedlAUpmJNEDHWukx2pZMTjiXD/eXr8=
=6w6X
-----END PGP SIGNATURE-----

--bj2jq6boulfkimbn--
