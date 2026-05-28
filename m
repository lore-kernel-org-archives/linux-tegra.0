Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFDC3F076F;
	Thu, 28 May 2026 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973542; cv=none; b=pRcvi6T3FxmzVJWWI5es0zYGkxMn0EQVwpvKXZ50wRIHRhInozSETgUcngFaKjT8i6Duy0QaOMSrJJrKxorWIq5BD5zyCSRCUzJa9tDAm9OHEXU6ulpkn2leGzJnPdBVZxa91yzUbJJVj/g5Hd2ajdIfE1kFkHzHbiEz9DRn7eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973542; c=relaxed/simple;
	bh=gINEsxKfuGKP0owHnt6CylUoIYmC9eGGrb0tVFOK9UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUQKXCqPI/8yJPqVjH2R46sk29iQrmHBWAvIRRFn1exWieZWg1wF23E78lEi25CXaEosWI/M1FjZW0uuN23hm9OhuUJS+HEeFwd4ETz3ctQJFaKXqu2tqwZVjsK4T12oYotqw4t4DZ4LoKNfISvx3mmdEyQtLjnbRARiiF0wg0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDokGC4S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDokGC4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB081F000E9;
	Thu, 28 May 2026 13:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779973541;
	bh=PTYzl5Y4HRBmuEKR5F+r8gh4CXlrXKQujjB+KpSqDAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PDokGC4SnOC3ZBQx4f3oiQTHh91g5/3wHitxR3UczHXqdQFB1EEVDwxWnPT4WEzzL
	 6xYU9s04DhC3jlQZxvB7h5lZFAHKjT19tGM28xOlRELCmUW6HtW7384PU0VBV1v0+9
	 l42ZenXjMGD3QDGknKlazanv7QwxP0R/fNJcUj9nMW4A2hJB1hfZvfMbE+Brp/GpEA
	 jIzI7XgIFejCVLgXVexz4ZuCSslUmEP1Io0L+phpQdmhMoXhwfPKLvGPIrDrVyfTIE
	 PYdo4B6f3ozW6tH2l6j81hcYpC0cPCj561tBnSwBU5avW2EkuQ3romjo3mmvw4Wrr0
	 s1N2ltUMjt61Q==
Date: Thu, 28 May 2026 15:05:38 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sumit Gupta <sumitg@nvidia.com>, treding@nvidia.com, 
	jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	bbasu@nvidia.com
Subject: Re: [PATCH] memory: tegra: add multi-socket support to the memory
 interconnect
Message-ID: <ahg5_Lm51AcfkQm_@orome>
References: <20260521140546.3023819-1-sumitg@nvidia.com>
 <2caba07a-511e-453c-8e1e-f2b07b84a096@kernel.org>
 <58ae92f3-3e6d-4f60-970e-76ee4d7dbd4e@nvidia.com>
 <2ba14e8a-1664-48fe-ba99-c81100de78f4@kernel.org>
 <ahgr7EevWJ-unfSV@orome>
 <ad3c49f1-044f-445c-a586-675252f157ae@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q5rbsc7kqxht2hgo"
Content-Disposition: inline
In-Reply-To: <ad3c49f1-044f-445c-a586-675252f157ae@kernel.org>


--q5rbsc7kqxht2hgo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] memory: tegra: add multi-socket support to the memory
 interconnect
MIME-Version: 1.0

On Thu, May 28, 2026 at 02:20:07PM +0200, Krzysztof Kozlowski wrote:
> On 28/05/2026 13:56, Thierry Reding wrote:
> >>>>>
> >>>>> -     mc->debugfs.root =3D debugfs_create_dir("mc", NULL);
> >>>>> +     if (!mc_debugfs_root)
> >>>> That's a probe path and you created a singletone. Looks like prevent=
ing
> >>>> async probing for no real reason.
> >>>>
> >>>> I am very against singletons and debugfs does not look like justified
> >>>> exception.
> >>>
> >>> The singleton was added so multi-socket MC/EMC instances could
> >>> share a "mc"/"emc" parent. I'll drop it in v2.
> >>>
> >>> On single-socket SoCs, the "mc"/"emc" names will be unchanged.
> >>> On multi-socket SoCs, each instance will create a top-level debugfs
> >>> dir named with dev_name(). Same pattern in tegra186-emc.c.
> >>>
> >>>  =C2=A0 if (dev_to_node(mc->dev) =3D=3D NUMA_NO_NODE)
> >>>  =C2=A0 =C2=A0 =C2=A0 mc->debugfs.root =3D debugfs_create_dir("mc", N=
ULL);
> >>>  =C2=A0 else
> >>>  =C2=A0 =C2=A0 =C2=A0 mc->debugfs.root =3D debugfs_create_dir(dev_nam=
e(mc->dev), NULL);
> >>
> >> You assume this is fully synced, so you as well could do a look up and
> >> then use what you found or create new dir. If you think that is racy, =
so
> >> is this approach... How are other drivers handling per-device debugfs
> >> directories? Do they also create such in the top-level? I think no.
> >=20
> > I think we want a top-level directory for a bit more structure in
> > debugfs. But I also think we want to create that top-level directory in
> > the module's init function rather than _probe.
>=20
> I was thinking about this as well but that would mean your driver will
> create it on every multi-arch kernel.
>=20
> This should be then moved to some core bus (and there are examples of
> that, e.g. USB), except there is no core-MC bus code to do that.

We have a utility function (soc_is_tegra()) that we've used in similar
situations in the past. We haven't used them in a little while, but it
could be useful here. It's not for free, but should be fairly quick to
error out early on multi-arch kernels.

Thierry

--q5rbsc7kqxht2hgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYPZ8ACgkQ3SOs138+
s6HyABAAnuICmD8JR6CQ5rnCQDyg8JoB+dWDh7tFtwnjQz3p33sOAc18p9cXONbu
SSbhAqKV70dtddI4s/os+O7zua9VZM5QV340oaTWoAtihUpzgz7+4PjTKcUAtcoJ
6tB+AmLhlGbnrmGW9OWmaQlC252qvIj3bOmLOLpGhzVHhmr/km5dXldFONQ9pJfQ
UjasCaptPK6rZkMHMv6PkxnYpx2d2+p6zcvLUjNmqrhr3bxGJhWvV2nTghxv4fi6
YxytHEo/6RDoNey9mFQUq9BaxbqdDqTJqDJw7BX4ZdaWpIvpcry3On9hRdW4cnJt
8H6vLJGXkDLJkdjZWZqSFXJbFTk+hYuhHJ66NMowQfoILRToU9maRWYFJ3+WNX+v
7RbfI++7zmRxx1+TE+UkUmvcdVj6ZLQ4kytScmhmZMW5cIbB/jY3dvVulIfqTebV
8LUGFCPTUkdTwZzDL17j3v3hTxNYT+oI5ntmuKl2X6rR4BMTBMUJqJYwTBdrHc94
QKioW2+zr549Agm9H8rUW/E4wFb1sKBAGADlttGH+WjjGcKKWPLJGyCgLa0Xpc86
zotocD8s8rEVHNKHk8fPDCpN5d/wFChOCF+cyNifv3HH3ayvlhgeBY6pM8+tCxpp
FOveR6tQVS7u4Y6yjeYijgv7FNH2j7axQ22bht9n4OzYPl6eDjg=
=w631
-----END PGP SIGNATURE-----

--q5rbsc7kqxht2hgo--
