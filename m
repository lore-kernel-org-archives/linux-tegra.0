Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B85E19E97B;
	Mon, 22 Jun 2026 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110963; cv=none; b=Q5njV2qUXaHMBkdIJ1+271sQBG+3HDrRUjAwR3Yw/nmB3Pn8Us/GERHQZ7v4S9eLtl7BmQqAjQQ7fraAw4Jfxd67GVGWVxl0K/SGnj/ekY23aneSNTHloCEs4hMEZJsKxq1rThXXclsIV0TSmSLgI2SjGKGIWwP6HluuB+esmAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110963; c=relaxed/simple;
	bh=yeRUmbpvJQWfjBH1tASyBUioJFt0u45l2lijhn1ZYPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmAyaRLe6h4J9ee74qewaUP+CkFNKqiSmW4joozCO274sOSFY2HUlI8KqzAmUQchFzalFzbDn/pPoG/lJfm3GMWPekY9LeJmF1q/MENO2sP/BJkZg3aMrYxA+EYYAuTlvO6GHqKeHs56CYOOwCjEv77lng6AtYncWBnmUau5x5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqC65v2k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqC65v2k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140481F000E9;
	Mon, 22 Jun 2026 06:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782110962;
	bh=YZQ8yptCt1lq6NlPILbwAJXHuZqPr53lP1nmexhIeps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jqC65v2kSfalprkM/QEu6WCz9T+4cKA3S4sf9oWnxV6jK3M6yhMiSWeonmqxyX5aC
	 VCCxu84+0XOFIYqBo9NYYy34s5wUNlStPNjWx1rJSBNmCodAdjFB/euzaobvxXi8f8
	 6KrXIjRP3Adm3PDrG6/CKZGYR4+bZMfack/gI3TxkYn6pHmUKBOR5YwNFMBwF1Nz7d
	 vpjyNFM/unx/6MXPdM9hzpvz1MiyLaJerVI5gLtvuRRjA1FK0I4S9aDqqEydH4nRMz
	 S8B3fcIC0qk2+UoNZq2pEwYFNXzMsQHRHRo9Mchf5ZLHCDroDkr/prkD3R1b+z1Mnn
	 yeo6TeCl6J04Q==
Date: Mon, 22 Jun 2026 08:49:19 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Fix a strange error handling path
Message-ID: <ajjaW_fGdHWPZr9K@orome>
References: <308ea09281bd0b3fb0ec7e90e23012c0783f373c.1781983379.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bwk7zbxn2pnhgwkg"
Content-Disposition: inline
In-Reply-To: <308ea09281bd0b3fb0ec7e90e23012c0783f373c.1781983379.git.christophe.jaillet@wanadoo.fr>


--bwk7zbxn2pnhgwkg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: Fix a strange error handling path
MIME-Version: 1.0

On Sat, Jun 20, 2026 at 09:23:14PM +0200, Christophe JAILLET wrote:
> The resource freed at the 'put_aux' label is "sor->aux->dev".
> However, this resource is taken after devm_tegra_pmc_get(), so there is no
> point to release it in this error handling path.
>=20
> This is harmless because put_device() will be called with a NULL pointer,
> but this is confusing.
>=20
> So, fix the logic and return directly.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
>=20
> This is not a bug, so no need for a Fixes tag.
> If needed anyway, it was introduced by commit e68c4244136b ("drm/tegra:
> Explicitly specify PMC instance to use")
> ---
>  drivers/gpu/drm/tegra/sor.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Good catch! Looks like I used the put_aux label without realizing that
sor->aux isn't acquired until *after* sor->pmc here.

Thanks for fixing this,
Thierry

--bwk7zbxn2pnhgwkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmo42usACgkQ3SOs138+
s6GSbA//VUr9ah6aJm5qD5DKf1B6cLsg2AIC61cAOTFggrPwRm11eLgTNgtdv0rd
UZz2PFAt1YzKNlA/vIM1W1Z1Zjf3r2uXnBMgFmS1CbIVf6zPt0webV1kIUhtrPNf
Ln/WoJGJocjvAujFvOXKzFL7OE8R8TBKuGCUAHr96+XIfAABlBuuk4X8sxoiO0WD
DW8RNYP+e2UaxOZhJcJt4jVaalfLMS2o6KdOP37cSECDIVoCMUXQNqM7Hx7kcN7+
RQq9mvRe4E5zJiP7cOkCwQgjRocFbBbuqkFYcTKhKmvYshZb4hKwjtIyQ2SrVbc5
H0TWlYGEX9jQAApPn96Xm90nieYPXSaz3+vYwN+PjTACQMLPoJvd54K9JpshtyAs
wX4zIRkheTc5eFjv4lNUDsJYw47ivzEnIj3+DTRsmK8JDwY8XZw3Wdrow5c7HLNT
JvH6HSfUG+mf6AMeb5fp53ztJyRKHwd4g+iDzAR6kxRf+NDL5ZhX6tAhRCN2Vv7w
sVMKvoC67uReGFQXvLiONTYtl1IyDSaXyDn+xwEl4XR3juudFwW7LOiwEvySHeye
BVvFPauNP8QAYKwp6CsCituDXHHsscG1U9SRTh/rEJcxyiagTDJ+DTf4Pr95UxrZ
AbDVQDrueHk3MZntlVFRagAu1XEeLUb8AeB5GCfLKB7z0xbUlrc=
=kXhu
-----END PGP SIGNATURE-----

--bwk7zbxn2pnhgwkg--
