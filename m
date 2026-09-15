Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0D34EF04;
	Tue, 15 Sep 2026 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481091; cv=none; b=YtrDsyLn1P1Vcnrq7uCzQokEmEmvsEWzak8pafq76ONtVRfK7yuJlg4DE6V4oh+ySyqH0gDjO9W7VejyiPaacOcKW3Fc+QPKydsr5E7AAV2fC9bnwME53/pZRQcVv5dNnx/+NioluHXwvEridgQ/TVs7FWwN/bCjrh9f4XcifFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481091; c=relaxed/simple;
	bh=rOCQ8i6GbpBXYjEQlYjjM9sb0kZZ4DagF9lE90848HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPUYyNlFB4DKNR4Gv9+U6Lvc/+BtcLW+A3aF0XFULDojQigbxOpkJ6adIUR2TRAMY5SB/IKEyHtBbSSUL7ZhIMDMR1wLdLjJWCazaRX2IcYCqHRYSWzD4gns9zFhlMA1AtQZ2D4SLKzfv/bTaCL3a0uY7UQJmQCxFWojP9qFAHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjMD2xgz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjMD2xgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2931F00893;
	Tue, 15 Sep 2026 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789481090;
	bh=2M43kLV2ZJexEHErf5K0Sn1C3APY6nTueqXd9sQAr6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bjMD2xgzgSfoGkzTuvyqi1r++RziYc2v0wdGoCiFg2Ef4Pek9OeN6fQ5eyQJA+7Cp
	 RwH9eowH2ct7mXgqOsSX5emVQ3c9tIW60esOkAT6X62DIaaujS4oTo4w6lr8HgdGVz
	 YALo6ETtzJ8aFqb+LhST/oaRwiehbrQgFKtjILtqsIjKJo/TBy23xAZ9koPssA/L1A
	 o3TT2TJYMK39kSFZln3UijPGqtbvQbYes3dhAAQc2WW8JopGCAXhbq4TQcUAZAbco0
	 44sHzK2HnxVOg6cjEy6TIWkVCjpWrnJVsOm6tyMbKxPFs0yygQpc+zZPz4gwVc24Il
	 sftsASDyVbKgA==
Date: Tue, 15 Sep 2026 16:04:47 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] firmware: tegra: bpmp: Add ACPI support
Message-ID: <aqlNlbYxVB8bkp4_@orome>
References: <20260910085919.2522241-1-anrao@nvidia.com>
 <20260910085919.2522241-3-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oj5jit5qbzkfjm35"
Content-Disposition: inline
In-Reply-To: <20260910085919.2522241-3-anrao@nvidia.com>


--oj5jit5qbzkfjm35
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] firmware: tegra: bpmp: Add ACPI support
MIME-Version: 1.0

On Thu, Sep 10, 2026 at 08:59:16AM +0000, Aniruddha Rao wrote:
[...]
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> @@ -783,23 +894,32 @@ static int tegra_bpmp_probe(struct platform_device =
*pdev)
[...]
>  	if (!bpmp)
>  		return -ENOMEM;
> =20
> -	bpmp->soc =3D of_device_get_match_data(&pdev->dev);
> -	bpmp->dev =3D &pdev->dev;
> +	bpmp->soc =3D device_get_match_data(&pdev->dev);
> +	if (!bpmp->soc)
> +		return -EINVAL;

Under what circumstances is this going to happen? We never checked this
on purpose because of_device_get_match_data() returns values straight
=66rom the matching table, the same matching table that is used to bind
the driver to this device. So there can never be a case where you bind
to the device but don't get SoC data. Except maybe if you leave out the
SoC data from the table, in which case you deserve the crash that
follows.

> =20
> -	err =3D tegra_bpmp_init_channels(bpmp);
> -	if (err < 0)
> -		return err;
> +	bpmp->dev =3D &pdev->dev;
> =20
>  	platform_set_drvdata(pdev, bpmp);
> =20
> -	err =3D bpmp->soc->ops->init(bpmp);
> -	if (err < 0)
> -		return err;
> +	if (!ACPI_HANDLE(bpmp->dev)) {
> +		err =3D tegra_bpmp_init_channels(bpmp);
> +		if (err < 0)
> +			return err;
> +	}

This looks a bit weird now, tying it to !ACPI here. I wonder if we
should just push this down into bpmp->soc->ops->init() instead. Having
this here was supposed to setup common infrastructure before going into
the detailed setup in tegra186_bpmp_setup_channels() and such, but since
this isn't common for ACPI I think we should move this into the SoC-
specific code, perhaps with a common helper between Tegra210 and
Tegra186 variants.

> =20
> -	err =3D tegra_bpmp_request_mrq(bpmp, MRQ_PING,
> -				     tegra_bpmp_mrq_handle_ping, bpmp);
> -	if (err < 0)
> -		goto deinit;
> +	if (bpmp->soc->ops && bpmp->soc->ops->init) {
> +		err =3D bpmp->soc->ops->init(bpmp);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	if (!ACPI_HANDLE(bpmp->dev)) {
> +		err =3D tegra_bpmp_request_mrq(bpmp, MRQ_PING,
> +					     tegra_bpmp_mrq_handle_ping, bpmp);
> +		if (err < 0)
> +			goto deinit;
> +	}

How does the ping work on ACPI systems if we don't have a callback for
handling the MRQ?

> =20
>  	err =3D tegra_bpmp_ping(bpmp);
>  	if (err < 0) {
> @@ -815,26 +935,30 @@ static int tegra_bpmp_probe(struct platform_device =
*pdev)
> =20
>  	dev_info(&pdev->dev, "firmware: %.*s\n", (int)sizeof(tag), tag);
> =20
> -	err =3D of_platform_default_populate(pdev->dev.of_node, NULL, &pdev->de=
v);
> -	if (err < 0)
> -		goto free_mrq;
> -
> -	if (of_property_present(pdev->dev.of_node, "#clock-cells")) {
> -		err =3D tegra_bpmp_init_clocks(bpmp);
> +	if (pdev->dev.of_node) {
> +		err =3D of_platform_default_populate(pdev->dev.of_node, NULL,
> +						   &pdev->dev);
>  		if (err < 0)
>  			goto free_mrq;
> -	}
> =20
> -	if (of_property_present(pdev->dev.of_node, "#reset-cells")) {
> -		err =3D tegra_bpmp_init_resets(bpmp);
> -		if (err < 0)
> -			goto free_mrq;
> -	}
> +		if (of_property_present(pdev->dev.of_node, "#clock-cells")) {
> +			err =3D tegra_bpmp_init_clocks(bpmp);
> +			if (err < 0)
> +				goto free_mrq;
> +		}
> =20
> -	if (of_property_present(pdev->dev.of_node, "#power-domain-cells")) {
> -		err =3D tegra_bpmp_init_powergates(bpmp);
> -		if (err < 0)
> -			goto free_mrq;
> +		if (of_property_present(pdev->dev.of_node, "#reset-cells")) {
> +			err =3D tegra_bpmp_init_resets(bpmp);
> +			if (err < 0)
> +				goto free_mrq;
> +		}
> +
> +		if (of_property_present(pdev->dev.of_node,
> +					"#power-domain-cells")) {
> +			err =3D tegra_bpmp_init_powergates(bpmp);
> +			if (err < 0)
> +				goto free_mrq;
> +		}
>  	}

All of the above could probably also be pushed down into the DT-specific
implementations, or just into the soc->init() from earlier.

Maybe even the ping in the middle could be pushed down since we also
need to special-case it.

> =20
>  	err =3D tegra_bpmp_init_debugfs(bpmp);
> @@ -844,9 +968,10 @@ static int tegra_bpmp_probe(struct platform_device *=
pdev)
>  	return 0;
> =20
>  free_mrq:
> -	tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
> +	if (!ACPI_HANDLE(bpmp->dev))
> +		tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);

I think if we push freeing the MRQ into deinit, this could also be
cleaned up.

Thierry


--oj5jit5qbzkfjm35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqpUHwACgkQ3SOs138+
s6FBEw/8DS4TTF/aHXdesRwabHzYYYGrRflB5EYAv2WKn4WO/XGfh3g3caZe//6Q
LWUid/mmlsqJg4CXErwji71dmdE3co9NscURcOn0o/teUJssZOshdjXAaMxrC9yr
fsUs+JA9axyClQl+FODiaQ07YzEtkD7dPSAdwknkYhB50nXXkppclx+EB5QOimvx
PcqTl4hE7GkapZijKe6Kj/Pk5DbDYzEELkc/ARsMKI3y4dZ4UanOvw2U02PKXexs
7UyWHpYGpK8c7U8BDVTJn/7q6HrhRGSJwCvog9la1L3KPIEUDyKP4mQ7XFwPZ1Rr
4Swk6eJNlQ2IErRIiV/vsMjcHrIXW4xW5fY2riAG969dfuOalrHEr/T6AV464uvD
PBjv/MVYHz2DLu2MKJUxMggj80k3XYYW9K1Pc8VVWweg4ND8d9nvH8yRKuWHils/
KJZqQ9o2w5VseHo6zYz3g5HauyyT0zNomXPPIjJhve+kX3AqB7wUWxSBJ8HtzOhI
cjH5EmpiSEGyXQXDFRvNvS9XxWo3O7n08Q0ATg5flx2PTefvwNT0cyb3Zn4uO3Rw
U0UtD0fLvmdinXxKf51kvGjU9vNY1CW7EyZuE9PvIkPiXslgBKvX9/Lw8ImzmsUD
NDM4QCpP4um2r3lA1JWyjZp8ze50rsoGzH7LH/OSdJR9nBM039M=
=05//
-----END PGP SIGNATURE-----

--oj5jit5qbzkfjm35--
