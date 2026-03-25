Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BDF3D6467;
	Wed, 25 Mar 2026 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444255; cv=none; b=ZJaivu4Q11mQuCKGfj8CrE5Vh0zb6PGwLaI0uAEICQjPE+QT4UD4TnjcWMfiCY3+gWj6/j1Qlk888tidL/NsQCeOWELfGxlKKuPkna+OpUkQFAfpEuuMNEbtZVgl+Ea93rEJBpeYAj0aIq84LHwNCv4a+bjThaFypg45ehPUu00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444255; c=relaxed/simple;
	bh=rjJ4cQkDvxgiTEnxyqLIt99wjIMAiOY6Y7cAplv5vWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaB7K7O/PzWunM8GSnDAHTDRF7M6gaum/auJFGzJ4kz8Wz8V0pKBPZ4TOoWYfOLz5eWaoDog+p5QncCNAPQANnW5ZC68OvxprcTGOH5vcj8yEyNLF1cc+Z5XFc+cVQhRJZ7jMQ/hkb4b1jZ5OjlosJdUGTQgLGxRevw+1R4GJAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvSCQumH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvSCQumH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AF9C4CEF7;
	Wed, 25 Mar 2026 13:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774444254;
	bh=rjJ4cQkDvxgiTEnxyqLIt99wjIMAiOY6Y7cAplv5vWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LvSCQumHJxmxxXRCOOZ0OsXdELdXjgYDdKUuzUCHNIfoOeXjHLW/JekMzj2OI0Vqd
	 VAR0/ZRMNYp07yIaS1E33WXyQzlWgRmvnNXxa1OEoLkx4+Lq4+wDUP0emQdoAK9RS1
	 l1jEVdTFNaaGmTZ9n4xu7QM2NbTnIhIuLr6PtKIdagxNMtCQo8EoDQuBlYvpP5OE2/
	 SYbfv6E7/5CvPYbv7OR2L7SZjVpp4hZoPuvBD4kSiBxS7MLVUTDYYHyeYYELqpYMWx
	 Phc0i5MzJFb2LQj5zi7LvccfvA/eOSzi1L6htJhcym1V9VDgQJjeJk18TlhAZT61B7
	 G6YqAMMXXOCjw==
Date: Wed, 25 Mar 2026 13:10:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/14] ASoC: tegra: Use dev_err_probe() in OPE, PEQ
 and MBDRC drivers
Message-ID: <b7fcb2f7-2a7b-4210-8a89-e4202471dcd0@sirena.org.uk>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
 <20260325101437.3059693-10-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hwSwQNi+0STaGx3e"
Content-Disposition: inline
In-Reply-To: <20260325101437.3059693-10-sheetal@nvidia.com>
X-Cookie: Those who can't write, write manuals.


--hwSwQNi+0STaGx3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2026 at 10:14:32AM +0000, Sheetal wrote:
> Log errors in the Tegra210 OPE, PEQ and MBDRC probe paths using
> dev_err_probe().

>  	err = tegra210_peq_regmap_init(pdev);
> -	if (err < 0) {
> -		dev_err(dev, "PEQ init failed\n");
> -		return err;
> -	}
> +	if (err < 0)
> +		return dev_err_probe(dev, err, "PEQ init failed\n");

There's dev_err_probe() logging in the called function, the
dev_err_probe() here is redundant and overwrites the failure reason.

--hwSwQNi+0STaGx3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD3tgACgkQJNaLcl1U
h9AWRQf9Fkzu8tjIMWRKTJmU8wzFNDO+DA9rAbRvzpUb5zGuyVRGlVUUgXKCIgG/
GN+A2spEhdSFj5slS2FdZ4TQa7I4fmn/+f+S/Zm4+DHSahH6gTYlmoLnC5CYpGs3
y8gDIOnZ5UJd3bEW+GECQEY2AtZI5APZHK3m5B3lVs6/GF/06SG5MpmGyiC3rHZ1
320PT8PXdoXZu4AFwChFf7H4Uou4kIHwjTD/J10qWsntPFy8d54RE4Hk6liWwPgY
fNMJOWbyOmd9s5W/l6nw3EXqyPDdVkpzaGLIPO2Sw21/VoPFljPKJlnhiBNbaXPE
HV8RLG1zr03KiS5xmWcpwpv8hYaK1A==
=gbUY
-----END PGP SIGNATURE-----

--hwSwQNi+0STaGx3e--
