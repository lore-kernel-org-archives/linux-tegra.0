Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3113330D35;
	Thu, 28 May 2026 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780002307; cv=none; b=FjRfFbpqzSliDTRIQHko1gM9fqGmMox+9rpG51HY+KEAMDhz7tKmZEo8pSkRJ7q/zWzesM/9oZ8UC10o/qKwBZPiEvkwOuyIitJT5q8cbCDWCLHrQyyuHqBokz7X+lxbZljXFZ7yhG0LbURg28FScujS4POFfKt5C+R90M1ynb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780002307; c=relaxed/simple;
	bh=Gqg8m3/NUiSpcfnCknIUxc0DafJkKq4p5wx0k83H6KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu/92douJ7KexpEYoI8utdxvrzKfEHNqmZXcDnlb9rCE+B3rD0Kc2nXJeXgFDS/yUyP2azAtFAepzkHhkkfSTwN5eZuGq30+mOSOyM6s6QiqDTFgzMIB9ZcNaFyQ6lDeFNUzQEzucgoCjRYxBQEwU38LcZpOXfPedCQ3UowCckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLnjtgn0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLnjtgn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119D81F000E9;
	Thu, 28 May 2026 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780002306;
	bh=IYKl5sZ93pSZxGUNWIYFz33yKEFhTSyf87FQH/IqsM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RLnjtgn0xzNqUY2C8fZsM+bsG7l7rjQXPNbYCdq1MLDRmj9mTqFbj+TEUYVLmi7Sd
	 MMZmjFjMSbk0PgqHYDSg7xP0SMthFh0owmt3YN9+6f8rcf+jULw6GNiRA88cozsqey
	 oNWS9Pi4KaZGcTJjA2pPuGA9RrTvs58jlim8tWxqhgJxnUZpulFNAtRWJ24E1zJzGd
	 zpd3Z+bBEYFWjQyxSTB8dH29oYScb9SE2BBgGMI2Z6taP0CFM/9v2qFpCtMbuZyQYm
	 Gw6WlTN9ZsQ5e2uoO515f1SQlts0Q1oJq1jPYI8M1NL1BmDj/hBteXHnfO0jOFt8Ss
	 uSceOSXNXoGVQ==
Date: Thu, 28 May 2026 23:05:04 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Restrict power-off handler to Nexus 7
Message-ID: <ahitdhEQzBzBEhfJ@orome>
References: <20260521-smaug-poweroff-v1-1-a0b3a778fbe0@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tkmzyl6menr5xruc"
Content-Disposition: inline
In-Reply-To: <20260521-smaug-poweroff-v1-1-a0b3a778fbe0@tecnico.ulisboa.pt>


--tkmzyl6menr5xruc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc/tegra: pmc: Restrict power-off handler to Nexus 7
MIME-Version: 1.0

On Thu, May 21, 2026 at 03:48:48PM +0200, Diogo Ivo wrote:
> The Tegra PMC power-off handler exists solely to reboot the Nexus 7 into
> a special bootloader mode when a USB cable is connected, so that the
> bootloader can display battery status instead of powering off. There is
> no reason to register it on any other Tegra board.
>=20
> Guard the registration behind of_machine_is_compatible("asus,grouper")
> and rename the handler to tegra_pmc_grouper_power_off_handler to make
> its scope explicit. The of_machine_is_compatible() check inside the
> handler itself is now redundant and is removed.
>=20
> This also avoids occupying SYS_OFF_PRIO_FIRMWARE on boards that have
> other handlers at that priority level.
>=20
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/soc/tegra/pmc.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)

Not a fan of this. But also not a fan of the original that added this
for Grouper. Too much board-specific code in this driver now for my
taste. But then, we don't have a better place to put this.

Thierry

--tkmzyl6menr5xruc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYrgAACgkQ3SOs138+
s6HG1hAAkytD4jFZO8O0mUU/PcmUfEDTuyNDjpO/4hs5Yz90toRD8J+7Ry1YWqLS
Efy6ncTodts5N/JCZ7qL4+/WBa0/W7+tc6XyUr5/dV3tGvQIJ9dCOZdx8HMn7n34
U3jzE3Pokuig1D2kZM0WnZMYYA0U5NQvCsQQikbHXHUazVAGkb0uD5cCv4qO2OkE
cWak6IMo6HoAj0WzVoEQWjquE2YpVvA76SDOlZyLYSWXl5xa17Tc3SrKRlEwfWVa
HPoFObfI/X8YtoTCCcxR7GJ+0bccIJOxlU1gknCTOT//P+lGVsH20adNAo7ZOmlg
a7oFirSmiBHgbYEv/yzNHiHGLDFVSXRx2cinBR6m2xrLSPwYNhYP05ksPH67LwsY
IA1i3g88C8PvOgstf2QpPfAjifBOn+D82S6KlsLvCvlEd89cUN1qHYg57LN/euK+
45hP8SybnGZNu2idVAZbVpVo/2NhYZMVcmy3t5I+ntMVeMAvF5s6pc2DnjwaUpX8
JRi31+PCMRF15AD8u6xqbgy81as5+emCpj9v6rJL2gphYm0T5UAuNabcHTjx4n8Y
f/CDgWpg5doT6bbUK4GG0iiUUfUqzqffWRKUd5ebIdRV36fC21zJdUvvK52puwXU
ZOiGCvqSvHEH6MKvMu3FPYM3jyLM19WyxAdCe5b3uoWpUJ8O96s=
=cL+4
-----END PGP SIGNATURE-----

--tkmzyl6menr5xruc--
