Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893909;
	b=KQX1H39JZLJtFgCg76ixsNcOofdTMd3+bazaNbuMCauV6nXJ7cePkkYRN/00IfE3Nt9l
	 bNzbVppqB6KFDmupht54Pu5uxW63qxij3NoB/xMBlAyPAGwCz3jfiBYCLuncy83cUcVhB
	 A6bqkzbnpc/fIGuwGoOPkrHSMrTYJmRVfiWkSbVgpnA9dB17TDeBelI/5RayCEmQJMuaQ
	 oznofv0BSKxxSfapRyxoiiXb5HK6bZwiw8jDTNbXxADKd7xBGxQmhVda+kfTb+UjaIPxl
	 T5oJZUaRbhq0sfaNwI/YbLl32OG1u4qJzXIC+KfHhwvFGte4FIqlUkvLfIrdiZK7tOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893909;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yW5Rri0/xouoNsLJNVbYSyO17syEQzUkfzWZkS+25ls=;
	b=WB7y+kVO4fhukuRlzg02J0T0ojc52qiwq6q2nabDCI0EYOyQCeBDLcQLX+i/iAPpaxi5
	 N+MIRUPXMe6X38I49dQjp8MOlZFOx6br7k3o3/TlidjY3+I5cXaGfE2RmgNLLQceMWy0D
	 VhiDaoH+Y4byDMQ+Ga71GU/pChtvSitKAHGRZF+NGj47+rYhp1DNgzdkK/5DIWbNKYL2K
	 5n45yeHd36i/LUsz/a63ZO7BDJH4rVqSKY41De9Cb6Uq6Xrdv/MXxaGuCIYX0DW+x53P7
	 p1JpjtNZ3MRqiBy3UbVOrjnn3U4PTN+iOAJ3fbMk4zSUgSsCSy8HkjijCTgjA6SZMag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RCiFUSzS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CBB606D80B
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RCiFUSzS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA3D1F0093A;
	Thu,  5 Nov 2026 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893908;
	bh=yW5Rri0/xouoNsLJNVbYSyO17syEQzUkfzWZkS+25ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RCiFUSzSSfyP+gIvp4+OW8TUa1kz0fktak6quFU6YBruJn8wlGpdRZUcwQrB+lndk
	 kn9xSO866242JswpZmGavaL1nA3fK6AUhEZqSAUiOJ+PtspZJDczIATnMSAeFDoR2P
	 d3UZq/CZHbbSHy5XwuHAwZ2IAj1hpEYwDy9mT1M2pfrK99CVTmSK0b/FRXz7qhyAVy
	 eUSLnTw3ALqhyEfI5ATlw9XsK1vmK9OwlEJUHutRNwB3K0a5MGwiM4UPbiqovuYqRm
	 y9xLwI/+X++ogg+dYFYqKfQ87FfYR0yTwePtiCFNfBUHuVOb2VTPSctUFGtDvwNVQL
	 N2TLiXkKNtwoA==
Date: Thu, 5 Nov 2026 16:51:46 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH RESEND 53/83] drm/tegra: Switch to
 drm_mode_config_create_initial_state
Message-ID: <auyjMrCi8trUahdB@orome>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
 <20261105-drm-no-more-config-reset-v1-53-1f58d1e33380@kernel.org>
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
	protocol="application/pgp-signature"; boundary="7zxtqfr7iy6ea5vf"
Content-Disposition: inline
In-Reply-To: <20261105-drm-no-more-config-reset-v1-53-1f58d1e33380@kernel.org>


--7zxtqfr7iy6ea5vf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND 53/83] drm/tegra: Switch to
 drm_mode_config_create_initial_state
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 04:30:02PM +0100, Maxime Ripard wrote:
> drm_mode_config_reset() has a dual role: it creates the initial KMS
> state at probe time, and resets hardware and software state during
> suspend/resume cycles.
>=20
> Since the two roles need different behaviors (notably for objects like
> drm_private_obj that must persist across suspend/resume),
> drm_mode_config_create_initial_state() was introduced to handle only
> the initial state creation at probe time.
>=20
> Switch to drm_mode_config_create_initial_state().
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Thierry Reding <thierry.reding@kernel.org>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/drm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

I'd have to check more closely since it's been a while, but I think we
might depend on the reset hooks getting called during probe.

Looking at the implementation of drm_mode_config_create_initial_state(),
it ends up calling drm_mode_config_connector_create_state(), which
silently exists if the connector doesn't implement atomic_create_state,
which none of the Tegra connectors do, so wouldn't that lead to a NULL
pointer dereference at some point?

Thierry

--7zxtqfr7iy6ea5vf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrspg8ACgkQ3SOs138+
s6Edjg//T5Q+3ZilA1THhY9qcdUxRBdfbBoYoWC89LpYiTfrOtkFud2oA78ftqLL
vG01Xwma6JVVZNdnn44IZL73JRsUWJ+PVrDkHbbL/rwIZQgdPFWNms/klhES6Rzz
J/sXBXrWf6I81TftZh8YT9kwt4bi0sdH5+vuEakuUGRjf5IYiKduF0w0NIpDzGMi
bOuQMFYC0V4aSj7H8mysU0T7RWokPF5hhx8OMXxc7f/j9DqG31Y2Q9zxTTHTyKtp
LLSRtSPhEsaASIPSMddsoqACPuQZbfp/tXr1nrrOwAG/2mFqZJ4DqKssOlVXxRBV
vJe8DQnEQ5LmNaL1TrFYj/ARG3shuY1FuIkT+vnNyILkiwbml8d/sujqnia0yIvW
yQRD4LZjrLkR97vSrJyjhuGol+MkcSEyctvlSw2SGOMseDPlVE3+HCGSRzx5M1sf
1+F1F+QYzMZ/PTivO4s0VH9ObxNlEnwnhjCIK5pa4xguLnsiKmoxxWMpYtCjTT5r
VaszbpKkg7N9XoPHCgNy18wREn6NPlONLAi723bSqvYkk9XjdIb/qlKRwDHCshQM
o/5D8Y3/S0kfEop4OtmrKR7q7CwcPWiRx0jKsfj1KpV0xdVLrHtJhsl5+W/JtpZx
+kISRoLODNn2AbHnNyxVtTl559iJh2K+X5gOyReOnnetot8ZWns=
=d0BZ
-----END PGP SIGNATURE-----

--7zxtqfr7iy6ea5vf--
