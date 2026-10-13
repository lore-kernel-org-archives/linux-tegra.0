Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B551CF48;
	Tue, 13 Oct 2026 15:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905773; cv=none; b=f5mhN/2T5OrpIwJ6OTZOtuiOO1JSlmvkC2zEWA0ZXUyQWYicVq33M9xHT0//m/0ibqiTy3m2CG1aCvh8APzmRRi0y8Cwr2MS5xSTzcIrUmuQBlmdUFQOm05yue0J5rT8EHKFEP39I5tTfW8v5JDxA8aU/94VC24Lq6d/2utN8dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905773; c=relaxed/simple;
	bh=w75CjoJfOCMbLF0sYdCGEiyYOOgRtlaL316ZX7Cw/kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=un3nJW1KsaRefoYg/cQ7MBMRIVHnVw522N3DJtyRfzO9tULcYVnnMQlSZUE9PKw9FWUpPn74wZUv6Zbhjgjd+WkUs8zHiZ7UsHG0YI1wWEnSH/5q7UGp66Pfgyg/q0dTwyuFADscsE4iiL3n3P1c8O+WvpmnlTWk/rIflDx1K2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXwzVNFE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXwzVNFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2236B1F000FF;
	Tue, 13 Oct 2026 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905772;
	bh=x/r2qWknVX2TAzPiv1tCSqpXAUTpPajkXsHA7HYPXA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iXwzVNFE9iJoQ7G94gK/qyzvD4nPXrjp2gI+RhH2u/JDsBAW9S9Jd0j3wTJ+6g2P/
	 +KBIeE4v+qFrhldJ8WRBXvguP7p+BD4jv2hvV4bWP3/Z3UyaJjLyvxaOWpuTIGD+Cz
	 hwxwWwAe+h7/MoemGZPI+h3eBCxAEnRWazrw3OigTP9x3lfrjKQAysinZ3KFFqL7Qv
	 c3qUThFA/xM/YbfSWkUYgBiqYCIXmCJuinDLRUHbVxCZ4aH38KN+g8aGVxkoioKyTY
	 FChL2VTbCjZK9eueD7feTUzantIJSs8Ua/MvZG4+J1Tiw4FuNe6UTVmd3WHedV8YLp
	 sznf4tMiD4FjA==
Date: Tue, 13 Oct 2026 17:36:09 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Aaron Kling <webgeek1234@gmail.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
Message-ID: <as5N73fHztX8hVWh@orome>
References: <20261013145210.103565-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="34qab4dj6g2yo5tq"
Content-Disposition: inline
In-Reply-To: <20261013145210.103565-1-sashal@kernel.org>


--34qab4dj6g2yo5tq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 10:52:08AM -0400, Sasha Levin wrote:
> GM20B needs both its reference clock and the fuse clock while it is
> powered, so allow "fuse" as a fourth clock after "ref".
>=20
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Do=
cumentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> index 4d856a8b674c..ecbc20e6adec 100644
> --- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> @@ -44,6 +44,7 @@ properties:
>        - description: GPU clock
>        - description: Power clock
>        - description: Reference or fuse clock
> +      - description: Fuse clock
> =20
>    clock-names:
>      minItems: 2
> @@ -51,6 +52,7 @@ properties:
>        - const: gpu
>        - const: pwr
>        - enum: [ ref, fuse ]
> +      - const: fuse

Technically this now allows:

    clock-names =3D "gpu", "pwr", "fuse", "fuse";

I think we may need a very explicit version to cover this now, something
like:

    clock-names:
      oneOf:
        # for GK20A, GP10B, and GV11B
        - minItems: 2
          items:
            - const: gpu
            - const: pwr
            - const: fuse

        # for GM20B
        - minItems: 3
          items:
            - const: gpu
            - const: pwr
            - const: ref
            - const: fuse

We may also want to leave out the minItems property because it turns out
the FUSE clock is indeed required, so we'll need to add it to all device
trees anyway to fix this hang.

The exact list of items could also go into the per-SoC/GPU conditional
sections to be very exact.

Thierry

--34qab4dj6g2yo5tq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOT+YACgkQ3SOs138+
s6HSbA/9GTMrx+cAkk1jspRnNnC4NMPsgoLBelda/o0nNLddHezxqjelJQZe2ITB
BcLwHzvG+yZIoqvcobrIM3ub+u150reF93lLkcJhUyIDUzvEEztSfHPVg39ffBVl
5THw3xMl5EXKrpYH2KGpGiYILz9hGsLLE1tVJnzJXUNJNewbMClq9QaCtPw20fqS
tRCrdaRRCgnfckfg4Q8F0Mwy8CHheHdayMY3qX/u67b85pbYfyx54ZNF/Ro/Z0/j
DP4xiuFsdppuYbb9tSJGc9bEPVn6ReFS1VTREGI0S7NRxIRKivktTaLWFSkH7mAc
wREmsx5iMeUxrxmQ443TQLUdY28h13A+pA2Wb+Nc6m+7LKbuw3nEAShix9ifPGv4
KAI3ukE8RV5JRy8whJLTNk1Pph9oBMf1CkyOVCAlZq1Q8uH++2ZBwbBjgEfacKgE
qPgJyiYTHQ+RsuFvXBsKMiFat2hv3YaVvTWsG7NdO2BAzrh5Oi2zMeGG61R5Jcri
X68hLj4z3ooAyGAO0Af9Dn9pFc21nc8e7Nv4wtPWF7FRv9D2aYr1sL9jEBMbMjp2
XE2PM4N9S+w4QQZiqZOMIuqp4bp9IwJNT3f2RPZ93FmED1ZeAc5L2aKCB4u+X51h
JK2KABvBUdzZeLdvPV+A1tfe2nNtMTUQufpUKEsAZIOKgN2EZSk=
=EVv3
-----END PGP SIGNATURE-----

--34qab4dj6g2yo5tq--
