Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327004;
	b=lqVch3Bn56CDKaM64v8HGji80vcvzjqKcGdTriKN8rfGu1dlR+yTFtsEJeKzdswcdmlS
	 5SaELp8ZfIMymLLWy46r7RnKZTAgLsAyG6zX5De+Ghv7fxS9n23ehscRUe+L0DPQ5c3I2
	 KYil7Np64YUnA26FbhBK+dXw/q84nAei8zof0vnVyTo0Khn6g8QRRVsYJS7x09jOg0hNf
	 fd/iZ+4J9PE+gKE+sqgN1L2FYzer7GnjpS7Ykw/ab51frfiDFp45Y4P/zcXUNBGW2WFA6
	 +iy08eUt1pVrT2/+wPAy56o5kM1RQp0BlRb6EfWkXLnsCavCXYbUk0AnVJC6I7bHl6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327004;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RSj7n7pAsyky7mg8jG553K5bfRkiKF7XOw0UfMG6Aqg=;
	b=4JZrY1xd35XySz6/DDMeDRwP4fw7/ICFBUXl5tH+8EX1lsBYoRx2ID1V/beQLu+lZ8i1
	 CO7jrqyI+89a/aJZAKsCnoJfhnFSvRv8gWG1s0MUeOjStLA+pqY+kO4Nc5M++9cOGjDku
	 MSZN4k1oa/2XlF2yZCTnqUtRPrQYlhfmmaDmAFHi2tbQ4l0vS/nEsDoi/jd/qeEnye+Dq
	 Rzk/Y1E/eQ9eprZ78taTfm61ytrA3rNEz8i2nx6d2wX68HiwCT1T53i+AenBVXkcyMH2b
	 m7xeJx6BLYcnCl23YW1ozhucU5peEQXd2vqgqF9DQU6lMwvE4AquJsnLzTP0FwelOCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xi+Qqu+Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692C9606A321
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xi+Qqu+Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757C21F0089F;
	Tue, 10 Nov 2026 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794327004;
	bh=RSj7n7pAsyky7mg8jG553K5bfRkiKF7XOw0UfMG6Aqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xi+Qqu+Z5V33VAweNm4LJxu/CzCtJUcSG+FxlRcGAc09l0sXX6uMZJUUrWpS8fov+
	 x3QuVFFkf0di29QuzzPCe7FHlhrnfL6Yz3vm3A4HuAZbRfhtk/9ReM80f0Mp3Xhrqt
	 eufF6a5JOfUpyS8W9CN7eib7L28uwjFKQOYKfFE3DW0j4DN0cgC53bCHerBsZwVOPr
	 tKMck3a3owBYOUcB8W6yEQAK5x/bqbjUrtSjS1So7j/dVm/gRktKFlKdepTVyJ+vxE
	 5oJI5a/0/WiahL6tnwWdbpaOdCepN4JWAE6jGvXSPoIAaD6Di0EkgXzjddglnP1+XR
	 OawUD5Y0qVdaA==
Date: Tue, 10 Nov 2026 17:10:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH RESEND 53/83] drm/tegra: Switch to
 drm_mode_config_create_initial_state
Message-ID: <avNBTIciv6QlEp9a@houat>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
 <20261105-drm-no-more-config-reset-v1-53-1f58d1e33380@kernel.org>
 <auyjMrCi8trUahdB@orome>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rbyf2cug4iro2d6c"
Content-Disposition: inline
In-Reply-To: <auyjMrCi8trUahdB@orome>


--rbyf2cug4iro2d6c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND 53/83] drm/tegra: Switch to
 drm_mode_config_create_initial_state
MIME-Version: 1.0

Hi Thierry,

On Thu, Nov 05, 2026 at 04:51:46PM +0100, Thierry Reding wrote:
> On Thu, Nov 05, 2026 at 04:30:02PM +0100, Maxime Ripard wrote:
> > drm_mode_config_reset() has a dual role: it creates the initial KMS
> > state at probe time, and resets hardware and software state during
> > suspend/resume cycles.
> >=20
> > Since the two roles need different behaviors (notably for objects like
> > drm_private_obj that must persist across suspend/resume),
> > drm_mode_config_create_initial_state() was introduced to handle only
> > the initial state creation at probe time.
> >=20
> > Switch to drm_mode_config_create_initial_state().
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: Mikko Perttunen <mperttunen@nvidia.com>
> > Cc: Thierry Reding <thierry.reding@kernel.org>
> > Cc: linux-tegra@vger.kernel.org
> > ---
> >  drivers/gpu/drm/tegra/drm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> I'd have to check more closely since it's been a while, but I think we
> might depend on the reset hooks getting called during probe.
>=20
> Looking at the implementation of drm_mode_config_create_initial_state(),
> it ends up calling drm_mode_config_connector_create_state(), which
> silently exists if the connector doesn't implement atomic_create_state,
> which none of the Tegra connectors do, so wouldn't that lead to a NULL
> pointer dereference at some point?

AFAIK, all tegra connectors have now been converted to
atomic_create_state instead of reset (commits c5c0e4821938 and
f808d9f8e5a3 in drm-misc-next) so it shouldn't have any reset specific
behaviour at all and the transition to
drm_mode_config_create_initial_state().

Am I missing something?

Maxime


--rbyf2cug4iro2d6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCavNB2AAKCRAnX84Zoj2+
dvk4AX41wC6YenLs+6gSvLfk0LYowGG7IO4upIFRx8JklbzlzQz6PJtUI+hChU2e
Efy1Tz4Bf3pU7J3nQTleT+S64dPRffAAbQvET1bwtJQ1v8NUqNLJngoW0BXI5DSB
Z/iSR5qWew==
=HmBz
-----END PGP SIGNATURE-----

--rbyf2cug4iro2d6c--
