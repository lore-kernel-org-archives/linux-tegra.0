Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40583FA5ED;
	Fri, 27 Mar 2026 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623276; cv=none; b=snc9q87nAPgieaJ+VfS7ii2pR4UupkC3WRgoY8GKTWHWO0SsaYa1ObQJh9DbvdVs7MsbqnyVBHw+I50iifcUH+fMT8pvFvE0bgz2zEUeVnUF+jmpZ3KxTdkfvCJRtz+KocU6I0tahVjge+AK/UDaiQRQAhaBDUpRgu1k27O/i9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623276; c=relaxed/simple;
	bh=nT1a6Sj/ekEKm6N/GqGd72YIcrpOirlkjLRK43wNy+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppdrKc+RO81Qg8qRVqfQ8vQuc/+dE3vGBMT3shiGystOHUB+i0xIeii7BGYM2SZgM1BkSZA9qIKZJI7PdBKx/YCJjM7wU5NKczF8OfJLdS132tD8ZRkwJoJMX7/onOJzBfFWBxGQ6gbXBdvlA8UKx4kf5oBmGQcXfdCba5iKC4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMr8+zu3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMr8+zu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA63C19423;
	Fri, 27 Mar 2026 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774623275;
	bh=nT1a6Sj/ekEKm6N/GqGd72YIcrpOirlkjLRK43wNy+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMr8+zu30UZIHhNoRR5VStnzk6CURwALGvT3Ya22dZyDNi+mJ63y5oM2s6OJ6qu9G
	 Cvl93WEDyYHKWNL23HretSK63inPKM5LCWbXkXUc6Qu4d2gWXQduTszyDiEM1TY65N
	 9AJTqmoXQAKDhhg58oupf2qUEVUpc58yllGW6mz2E5vghoxpWFjqEDLoMSgMcyIqOF
	 kOKVjfv1gnFS1gyMsGW1kGDUUOWBSXrR/rfvOKk94udAezcHkDgBi0RAkvAfO6+EnY
	 Cq8pZygAaf1lwTZ6sCxD9TVnILnbdvjdQZo2aqacoe64MO0gYjUd7gJsFGpqfXyFl3
	 J01NUjmJo4OSw==
Date: Fri, 27 Mar 2026 15:54:32 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/1] soc: tegra: pmc: enable core domain support for
 Tegra114
Message-ID: <acaaG8v98R9YE40F@orome>
References: <20260126192030.79119-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qhluspy2yvtoeaqi"
Content-Disposition: inline
In-Reply-To: <20260126192030.79119-1-clamor95@gmail.com>


--qhluspy2yvtoeaqi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/1] soc: tegra: pmc: enable core domain support for
 Tegra114
MIME-Version: 1.0

On Mon, Jan 26, 2026 at 09:20:29PM +0200, Svyatoslav Ryhel wrote:
> Pick after this patch[1] is applied.
>=20
> [1] https://lore.kernel.org/lkml/20260126191536.78829-6-clamor95@gmail.co=
m/
>=20
> Svyatoslav Ryhel (1):
>   soc: tegra: pmc: enable core domain support for Tegra114
>=20
>  drivers/soc/tegra/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--qhluspy2yvtoeaqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnGmiQACgkQ3SOs138+
s6Elwg/9EbXkaFt7AxFEA1v47PX84v0tJBm3MIQn32eKd/bMi0jCBpy08lOe+NJh
fDitXYynrvov7kOQyQBl4efCg15HbdJCYASfP1Yd9XMkp+gbQvguh9aW5bqosL5H
UdJG5VDTP2W0iBvH3SL6v9tVbAS3JdwN1dNjPy/LG43Wlpf3pU/Sez/xnGrSJQ50
RhF8iEEAIJEa7CMoj/bm+EJsfnrcIQq2BsnuYRyMaVGWxHYrXVdRytQfdTVR/7Ah
ytMuJAJ+63khcQ8Ia3sjLnsCh8C0Oy9X/6zflSOwcfVQykShm5ovIG++AazXG5ie
hWbkgs/qd0oQew7TDaLxutZ9L0emYZZbeVf5TVMX5Y7tEtBYcb13gs+2a0t7d05y
pTKmQjrK3GPbHMcJ279wkYC6PTrH6CFgF7rJ31G5zt0dkmAtYIF+8d0eTzvPq+IW
HEDTnAU+7wAYdRjxvxk1MfuaC4+P7s13dAfTBM/BDyIyOxHFM0yPlvq5wJF4cylr
SmcfCF3sx9RVLv6tK82kyveSSC7jc4sEUxn49OuPlrqp22RZPShvpD0AuagL08qA
guSB1KDygWh4wfH/BP8NrAONCmK1F3TnB1Ef2VEMcHFxDP/7yNCUw/SM3Eowq/Xp
8lYX26Awq0Wshw9DwzExujhnWF+ec8C51ETwuKXWHPhFLF2DVSo=
=EUU0
-----END PGP SIGNATURE-----

--qhluspy2yvtoeaqi--
