From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: fix uninitialized variables in set_fmt
Date: Mon, 9 Dec 2013 17:15:02 +0000
Message-ID: <20131209171502.GW29268@sirena.org.uk>
References: <1386362090-29250-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="skgCfLFhCSVZJUH9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386362090-29250-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--skgCfLFhCSVZJUH9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2013 at 01:34:50PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> In tegra*_i2s_set_fmt(), in the (fmt =3D=3D SND_SOC_DAIFMT_CBM_CFM) case,
> "val" is never assigned to, but left uninitialized. The other case does

Applied, thanks.

--skgCfLFhCSVZJUH9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpfqTAAoJELSic+t+oim9nHwQAJbTqqoHlRhcGVNYHTeCtfRl
zapATH5SbZ3m2AGbFPO3Y23iFH9Zr+Rm59KArLKhG/pKaYNCGQvmhWizDvqRrrbc
a2OWlReU9mHwShPQvLYjBKZbGphBUJPpAC68SLRk4NgjAfFdCe5SThnfrWPMCxzK
7X2k6xftKbL9lU5ltLGvlzxn07v0GAHtkHDhjVgpiuYDqIrXYXp8lJ8eOSkYXrQA
Id9ifWwwoDaFL69NXpIswblLRthW7ArS1+yGY0lxAIw9rTkgYnSi/j2Db5PFKUmr
lklqDwj95cHGsZaa2nuH4BdYbBPJl9EZNCrFJKz+JmFHkUgmG7wGRmEmx2QKoN2Z
wsRoXZzDiO2D2wORlzvc4t8qPzqV+YfHlS4hiASfoVo6ypTW2EoopZl7ibhvzP4E
yXp22jXs7ZsxA6ikFsTTAJPWcCgeKMRboX513+48gMsPQU0+xOKFk51OcyN1BjTa
G23yUs86NJdJ/zkQYvSoqykdF507H/0AAxpkpFkpSGjV/mC+hrD7xXNjqXDlZL2D
7B7QTAsfflazPqJx2x9WuEl8NdRf5zH1HCpMzA2l/1GNPuxPawPwYY+5wmjPA45W
H2//F+jcIEYVLJxS7OoB0q9uctCYdyyys6q5KIFhuCJpjHsxXuMJ7/fFRoh4MmP1
Ih7TFlXHgDphyEZhyzK/
=V5b8
-----END PGP SIGNATURE-----

--skgCfLFhCSVZJUH9--
