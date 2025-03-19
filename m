Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C9B1FCCF2
	for <linux-tegra@vger.kernel.org>; Wed, 19 Mar 2025 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742407809; cv=none; b=ZGf6nT4kTg68g84aXrefuSOsS82iEIXJks15l6JFXnzZrEIKGaG6XMnlHZ+9FViIXkuXaFQugasZO5M4Nikdo/yqT7CVhrH4H2YCwJ5oH6yiLTSR0VwGJHWrsPw5N9th6mfrGuRb7+E1iYOOU9KxH7DbgSScV9dBITBBzDMSSQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742407809; c=relaxed/simple;
	bh=TwOD3C/pbMPzv15fU55e+IUWyz4niy9wUDhHGyPZfxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTpnby/yJaHlBq2jXVgSl31EOLTKGSW+KrL4nxg5HStQHJv7z3GoNS6qRUTpJHQb6m15mzkoikU+7JjHeHRXbWneyEN2s/S2llmoaK3N4DImCCl+kY451jxrgvzoZQ0h8Y/ujPqSjDylwrTrDFt01A+swEQFJKWglS+vuQq0jmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SebKGApB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SebKGApB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39129fc51f8so6398637f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 19 Mar 2025 11:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742407806; x=1743012606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJKGXNaEOrFu3JsjmJdQhGviNYlOYhskFV2OB3dd63g=;
        b=SebKGApB+Z3CV3+DJrL3QVNwrKR3MxlWGHbOFJnyetYE9g3uOSImCINPSie8kkNFKf
         tlGM+run9QBBAKxzlMYJXZ5yQpWaBo74q0WSRPpJnko6M97OThLohtXhm6uqOxZKjCZN
         NXjAzPYBhKrGRwzlvXNqLrKmdPsItSH/VHfK8/ei4BhfTdqgP9fwixImJVd5bEYlvaXg
         yHEcxrkl7isRRIclgf5w+dIRNxCh9W2GB1PBAmiWT1c2MGG/cDr0BZwdrpk4Ot6FLRQn
         tDkpwFs91IrYoEmUAiLUITe7ONol45s/EBDtgb+zNpMt9hxPbxImrUda/UXqGRRhMQmM
         /ATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742407806; x=1743012606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJKGXNaEOrFu3JsjmJdQhGviNYlOYhskFV2OB3dd63g=;
        b=hPPV3WN7Gdk+ZQl4r1xEDtzga5t3EaetcUjCUYQJT+k8WbASJqEbIq4XJVXHCW2wpD
         /pWqgfcHR0TXDk3ZGBmw/925cjnojYd5vuf/Olb9onF4wRJp9Sw7idsRWUH+SI8mleet
         JJAzBoxIaB1hVd97n7/usXs9maJTHVLPgA7owY2VNPpeC6s7KWxz0J/vQrQvCw9un3/j
         hHMQuXQsAwB9+fNEzbthy4N5S2fi8f8ZCmiLh64ouVUPO0B4wRA9Dxl8j0ggshjqeDvm
         mB7vzAdPLUj3ScenbaSuouQ1Zg0LJA27G1C9AIKqIPU/8LnfnZK5pyXK9Xj4vEjUSCuL
         qlMw==
X-Forwarded-Encrypted: i=1; AJvYcCWL5Z7TwFrmVVJ/FQWsBCGt2mZm1j30FmrLjWckQbVwb7Czy3oMdYqKE1kvEHR4WWGt9DT609gSiNCHYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx0Co2Kb9vm8VVARWZrHNa13VexCOxWp7OLSpznLRCiUTibRMb
	gVUzCqvU2MDozwCBzzOgiCeEGCOvzoTj0vBhYMi89YoYZ1eRQhuZ
X-Gm-Gg: ASbGncttToRcl3x64JBCO8en7FaE7C1UqmKTv3uHxy82G+ycpFHuksEc6iA2tfwwAgu
	rvcImqHBtVUHLxgou7+2/3la22roSJsN7nGQCgLW9P3RrHd4QleG46jpdR8WVwGvvs3H4xmicRx
	YfKv90eBdchrBQnt5RzmAr92RhJaoNy5G/385ABbfH4IgiGgkEFjtcMCXRph1zQc+sUrL6s0L79
	aSW9FR4Tcu9Gab6vWLNcbYctrwSAO2o8QhQowaWVelWrBr4OWQVV7uJsSAuEcLREG4Ai3WyVnrK
	Ek7AElDeSmN+IwfUJfD+KLhp0NocMNo1ICNSnZnL1MVPVFfoQmExG2onEEQda+ynSaI8PsbFM5L
	a9T+CP6mxvBQhJPKA0SVu/0BbzoJB8iKC5pwfD4oCFw==
X-Google-Smtp-Source: AGHT+IGqcQWiFzsnHo4CbIBWjtZCrTWOdeRB60hVLIrA/XtjazKLtNUS4dMjFqQzIzL/9B206PI+DQ==
X-Received: by 2002:a05:6000:4014:b0:391:ccf:2d17 with SMTP id ffacd0b85a97d-39979554699mr431114f8f.0.1742407805428;
        Wed, 19 Mar 2025 11:10:05 -0700 (PDT)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f33242sm25582455e9.5.2025.03.19.11.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:10:04 -0700 (PDT)
Date: Wed, 19 Mar 2025 19:10:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
	Simona Vetter <simona@ffwll.ch>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Joerg Roedel <jroedel@suse.de>, 
	Jerry Snitselaar <jsnitsel@redhat.com>, patches@lists.linux.dev
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means
 no DMA IOMMU
Message-ID: <5epualwpswqk674jhoq7lo542g7fc33vemzs4v2usou7ibijrw@uroxzqtbayix>
References: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eqydumr5po2uxfmv"
Content-Disposition: inline
In-Reply-To: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>


--eqydumr5po2uxfmv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means
 no DMA IOMMU
MIME-Version: 1.0

On Tue, Feb 04, 2025 at 03:18:19PM -0400, Jason Gunthorpe wrote:
> Previously with tegra-smmu, even with CONFIG_IOMMU_DMA, the default domain
> could have been left as NULL. The NULL domain is specially recognized by
> host1x_iommu_attach() as meaning it is not the DMA domain and
> should be replaced with the special shared domain.
>=20
> This happened prior to the below commit because tegra-smmu was using the
> NULL domain to mean IDENTITY.
>=20
> Now that the domain is properly labled the test in DRM doesn't see NULL.
> Check for IDENTITY as well to enable the special domains.
>=20
> This is the same issue and basic fix as seen in
> commit fae6e669cdc5 ("drm/tegra: Do not assume that a NULL domain means no
> DMA IOMMU").
>=20
> Fixes: c8cc2655cc6c ("iommu/tegra-smmu: Implement an IDENTITY domain")
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Closes: https://lore.kernel.org/all/c6a6f114-3acd-4d56-a13b-b88978e927dc@=
tecnico.ulisboa.pt/
> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to drm-misc-fixes now. Sorry for the delay.

Thierry

--eqydumr5po2uxfmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfbCHkACgkQ3SOs138+
s6E9XQ//dZrGX9bTbogtguhwFF/4IRrRe4qeEdzOV0hWNrSI/AgrCcZXVt8jyCRl
cMyrljBynGAY/Aza57MvNyWi9pMblhNdW3X8z0rhvRph4NFVqb6ABlkGm4YVKHuC
xVWTclRfb7oG7OpRAd/FaGbdEINE4UAJPXT+BIOkkjaTh8LSBlINLSpLOUTbu2aY
r47yrFhcVh0GHPPZ8tcUbYqyVdJdJGMnuulwfhPVwvgotzcIFNgzNHyHvC9Z4TsX
/HKZvXjSSCTjR1kzUvbt8pmKEKKqqCvCFULT2llTniiTwflqxjuPKCS8wYj5mueY
OJvQxghdYvfXNLMnTplQoOOWOWLTOc3/37OYGJIEziubEOx676+v78Uur+9107VY
lKDonC6ketIV49JGF6dxp5sH3FdzONG6LNYRSEEz9ATri/havxpHe54nH55gK0Tn
qwnMUymUJmVcl326K30czWhxtx50Fuucn+vjagmOKGdr4qY6+l8eZ2naxyqtAcDx
zznVflHEAIwi+iBVsETWaQZILbjpfoocGq86fsqMY08tY6+KdP7q3lk2gTX6PWz9
bAn72EIlZFUBTOSo7vmlHAlUghj1sm8PhfFiMIIGBrend2hHgdxvb4QLlDQZIIbz
anf189zuSi/kEoQzXuaryOoRdUXJx8wdEmcDL1Z138Ab6aD4hN4=
=levc
-----END PGP SIGNATURE-----

--eqydumr5po2uxfmv--
