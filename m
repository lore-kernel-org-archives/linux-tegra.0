Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2646F2F2
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352539; cv=none; b=i+FENJE4SSEwUYHHmxnz3ReOdnPGbnBep6SK0HADWTW5MwH2OfJaqIYQ1pELC8dVPuOZVaB1aZMss0Zt9RiIUf1MN0S4lYLLazfzYBO580/OV2eIAYbtg1IesFkr9N1kC88IVkWMEaQhKdJqqhQA1PHdgN/eTPrZEKM3beVmiOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352539; c=relaxed/simple;
	bh=8Eg7N2NFFrw5aOudH38IVR9km/n9iAo4ZXJaD2aKftU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8Ns95DimwE6GjmH0BR9ZrQQ+FX1qpsocoHuk4RxsbutA0XZ1rvYIOP8NerReeiykr73BouemTKI1/E0GDhWni4tXu4ga8yroIufksZnWtLZhL+f/Vt3PoDqWzpqiLDENiExa/85yuKS7GOnfhqthTlBrZDuofNybnaHgRQ8roA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRzVXHG2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRzVXHG2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E93AC19424;
	Tue, 24 Mar 2026 11:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774352539;
	bh=8Eg7N2NFFrw5aOudH38IVR9km/n9iAo4ZXJaD2aKftU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRzVXHG2B4OtkGixwiEXA0c1zPkQ3Gqkwg7G+mwbz9/TX1csyUrbdvIQIGJlLPnyx
	 48t2FHy+vZGqJZIffNQYBsGXeNmTMwTqnznvsgrWc5wgYahpFbtJWiF9eW7LlZrO/q
	 2n2mrzN2k/HkD9lBTqf7foX/c9PX8WzKSbZ2MTQUP2kUNkxJ3BWRm93uG2Yh/xpD/B
	 nfKmEAgVqTMn02u+aSRKFvGiT9GHsA9AQrX6yQD4YxiQgp2ZUGMRqiqarBrT7Hy1cT
	 5ygrNyEJnkHTztaupcIuaYXuN1NO8XIs6gWzlL0uv3HcMvFLtv4CugtIiwQvH42WbI
	 mB7ftW67y97dg==
Date: Tue, 24 Mar 2026 12:42:16 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] [RFC] drm/tegra: fixup primary/overlay format for
 tegra210
Message-ID: <acJ3g4_DXDLBw5oO@orome>
References: <20260323130804.67936-1-kwizart@gmail.com>
 <10027014.CDJkKcVGEf@senjougahara>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ea3snzcml7i6yvwp"
Content-Disposition: inline
In-Reply-To: <10027014.CDJkKcVGEf@senjougahara>


--ea3snzcml7i6yvwp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] [RFC] drm/tegra: fixup primary/overlay format for
 tegra210
MIME-Version: 1.0

On Tue, Mar 24, 2026 at 04:05:19PM +0900, Mikko Perttunen wrote:
> On Monday, March 23, 2026 10:07=E2=80=AFPM Nicolas Chauvet wrote:
> > The primary_format and overlay_format were picked from earlier tegra114
> > generation instead of using the previous tegra124 format leading to
> > missing format.
> >=20
> > This patch is RFC because while it's unlikely that format availability
> > have skipped to earlier tegra210 soc generation I haven't confirmed
> > any runtime error nor experienced any regression by the lack of
> > availability of theses format.
> >=20
> > Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 06370b7e0e56..d5896f12f25f 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -2942,10 +2942,10 @@ static const struct tegra_dc_soc_info
> > tegra210_dc_soc_info =3D { .has_powergate =3D true,
> >  	.coupled_pm =3D false,
> >  	.has_nvdisplay =3D false,
> > -	.num_primary_formats =3D ARRAY_SIZE(tegra114_primary_formats),
> > -	.primary_formats =3D tegra114_primary_formats,
> > -	.num_overlay_formats =3D ARRAY_SIZE(tegra114_overlay_formats),
> > -	.overlay_formats =3D tegra114_overlay_formats,
> > +	.num_primary_formats =3D ARRAY_SIZE(tegra124_primary_formats),
> > +	.primary_formats =3D tegra124_primary_formats,
> > +	.num_overlay_formats =3D ARRAY_SIZE(tegra124_overlay_formats),
> > +	.overlay_formats =3D tegra124_overlay_formats,
> >  	.modifiers =3D tegra124_modifiers,
> >  	.has_win_a_without_filters =3D false,
> >  	.has_win_b_vfilter_mem_client =3D false,
> > --
> > 2.53.0
>=20
> Looking at the TRMs, I think indeed Tegra210 also supports the=20
> DRM_FORMAT_RGBX8888/DRM_FORMAT_BGRX8888 formats, so this patch should be=
=20
> correct. Functionality-wise, the formats aren't handled currently in plan=
e.c,=20
> so I don't think there's any change in functionality.
>=20
> These formats require enabling byteswap -- so do RGBA8888/BGRA8888, but=
=20
> plane.c doesn't currently do that, so I wonder if these formats are just =
not=20
> working right now.

It's been a really long time that I've looked at this, but if I recall
correctly at least on pre-Tegra186 we properly program the byteswap
registers (see DC_WIN_BYTE_SWAP in dc.c's tegra_dc_setup_window()). It
is possible that I never implemented this for Tegra186 and later, where
all the plane programming happens in hub.c with the shared planes.

I suspect that for Tegra210 we could add a bunch more formats, and I
have a vague recollection that I had prototypes a few more a long time
ago (notable some more YUV variants) but may never have submitted those
patches because I couldn't find a good way to test them.

Thierry

--ea3snzcml7i6yvwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnCeJgACgkQ3SOs138+
s6GN2Q//dcCpHo/B7v792uQ6cbaeceSQ+BB68non3+verUTmAHOnrq6f1/jNUzDD
IJCLnNIUYQmBNKT8N7RR4wFFj3rezcmE2EWB0op92mwytVBZ4XFLLKE+xUtgmy97
PaU0GkVy7Tj9Q7fmn5rVeAzinxeVpVq7o1jV4Z3I6F08rvIpbk6VPx4xjCByljRE
zDtyZNBAnfXOvU8D7tvk+GbhFdwJYqJ3nWWCFlGoZB9S0u50t1Z/kmoTHJpwpiQD
zXdtHMOJHGAhJctgQ/1gke8NQ026D24HspBSg4MBW0xAGQjDj6XDCmfpAqrpHpC1
iqxMhzE1leF2dJ/k4YON70mePp2dNkwpj1w0JXk3EMqRoguPSNEzxf2FaHQSLtNt
HTUaFI6HMGUhoqA962N4BJpgDkfdyXJWptLpU1GGxtZ1hAcU0R4VfDOPYWu8qpiB
L50Dqx4XmhOknqF8D7Kea8HbPfND2uPnFVfrR0CJ9pz6brZTAn9ZyuuKg+O18eBD
0Pg59iWgMFqcWomQQ1oV9YaQu9XXuWWFlTIwxwa/U+/AWC+pa+mQC1yYaTaZwrcS
gG8o5dSqQD0lZPvBvLvaTLN2tiU+kfaKN+5Zd2RueLPm3iIM2P7oaqSwqKtSi/DT
I0L+2fNyK8b31HHJ5ycLWab4IW44oSupoUczqSYhHENpi5OVy2E=
=G4kj
-----END PGP SIGNATURE-----

--ea3snzcml7i6yvwp--
