Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1FB3E63AA;
	Thu, 28 May 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974799; cv=none; b=YiPrNAwVTsxtRYIhxezBwg0Tn2lA+qw6LFM4nqlT+W/f7MwluAhp1FIelSXyMHM5YT+BdZFCxTa758jchMPk4GEwpv+D3hcD+jtVVNWVd4CBX6pEMdsRhmJsgElxdIkZDt5gNjrzAMsRQdyxXlilJ2o1Ii1vtjk8DP8uAv87MhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974799; c=relaxed/simple;
	bh=WTV7owk3xTBgYmB0YqBNGgY0enCzkcA88aG3Sz/9EHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFZi10UCk9EYiXhYGCmS3BxiaOMIA4evL2Dgi94TdLGt/FSagzFrOzVis23qzmBO6xOnRn50bELyu/BoC6e5fLSbcP+1tXO2kzUFYh2u4SAl7FlLs7Qf/ks8zQm7rb6huc6nujT9x0J8D9lmLdFTz2R3EbRT4aIKIRlYAO1Serc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Meq1RrhC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Meq1RrhC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7321F000E9;
	Thu, 28 May 2026 13:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779974797;
	bh=k0op08fi4dIlx7FSGGHWRQ2CCQpXuVEI+MVlftBMVAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Meq1RrhCGrVqLcOSlmB5ZWO46tEXKuIu88diDPFQ58ibt2Mwlae/vFNqBLclQREQq
	 HFcQOy/Q3Tvp86rNWy1z5eRGRJSZbX+ots9vLAtym/9OuVm6taUvsC3qq613B5qMOY
	 sIPYCntVqFYof32HeewXZq7pLeIZwG/YDOxr+iBD5x6NIJ/xu46Wp7obYh6Tr686wr
	 2TfKSN0rrWsDXio3KftlntECCE/tlqvS2O7ipTkmDF2ahuIgQojm2oHWzGoP7w5LPO
	 AX8+526R+zj9CJwoxzq73wfx9MU7RnsYhLoWvbIl2JU2OlqeA+mbPiLzRI4N70sT0K
	 4j/cEP2ZnnPOQ==
Date: Thu, 28 May 2026 15:26:35 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Souradipto Das <souradiptodas6@gmail.com>
Cc: mperttunen@nvidia.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/tegra: hdmi: Open-code drm_simple_encoder_init()
Message-ID: <ahhCedXvVJdXSvDi@orome>
References: <20260502143420.7850-1-souradiptodas6@gmail.com>
 <20260513100501.6468-1-souradiptodas6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2uatf3uivvrbypoz"
Content-Disposition: inline
In-Reply-To: <20260513100501.6468-1-souradiptodas6@gmail.com>


--2uatf3uivvrbypoz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/tegra: hdmi: Open-code drm_simple_encoder_init()
MIME-Version: 1.0

On Wed, May 13, 2026 at 03:35:01PM +0530, Souradipto Das wrote:
> The helper drm_simple_encoder_init() is a trivial wrapper around
> drm_encoder_init() that only provides a static drm_encoder_funcs with
> .destroy set to drm_encoder_cleanup(). Open-code the initialization
> with a driver-specific instance of drm_encoder_funcs and remove the
> dependency on drm_simple_kms_helper.
>=20
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Souradipto Das <souradiptodas6@gmail.com>
> ---
> v2:
>   - Remove stray blank line
>   - Patch is compile-tested only=20
>   - No functional changes.
>=20
>  drivers/gpu/drm/tegra/hdmi.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--2uatf3uivvrbypoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYQogACgkQ3SOs138+
s6G76Q/+NSDJ1zyIOzZ1aUMUcToEYH1VL1ClX8C4YIH0R/1HXx0YUC18NDZsUqIJ
FHWbn1Ltv7fCxXn09YqT3eh5OlWmEg3HiujUpRKByR3DScZOhHk80bfAddYENrJ6
nXlhpjxvoKHOrXFFwJGM89s0LWSyY5wkrgqMMfzp3D3lESUqryU4yu4/Ly9uO7aq
7IQUiDCUeFRI8Qcx38GKhc+b/8NH6vVkgT4ooZHvgn3Z0ecVOsFK5JjAfaS3KNel
ROgFMSfprDGDkDxGMm1V+F08q00KGQ8DiEo82SCYYKbZHwoQah9f4zrNiN4tZD+1
7iIBmhRRsEW2S5B5Tw3aYmtOwGYvaWs4ZHbrPmhsl4RIHfuxbfZAidNLi2RloeB4
pKChDEGpnva1nOCylknFFWJFf30V7zgxkfqQK+yny9wnS+5C5HHx3l6XAkrzxqlf
JjTRMwNuIqAKdUSb3AIHfXBxDZL3VC3WnVr2TzdtnZPesv2VKY6m7Q0NqJVG8VIu
qHyBUGaWoAYstol5Vw+9JZcN63QDFXyPpO4VhpsqLiBD87JeHNfg65tb3cMDZjpr
y8vRhgu8xMawSxkbru/mouruznNYXFOIDVEvFJ6OWcZ7LcJ8UajaHknJSMfP9FrO
Zb+yzqb92tQiZSq51U+lbc3DxR4pLxPAUoFWsai0Gp1uwW/+0zU=
=cQ5I
-----END PGP SIGNATURE-----

--2uatf3uivvrbypoz--
