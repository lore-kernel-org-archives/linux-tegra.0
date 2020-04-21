From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: fuse: Update the SoC revision attribute to
 display a name
Date: Wed, 22 Apr 2020 00:16:06 +0200
Message-ID: <20200421221606.GD3445172@ulmo>
References: <20200417124046.26400-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200417124046.26400-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 01:40:46PM +0100, Jon Hunter wrote:
> Currently the SoC revision attribute for Tegra devices displays the
> value of the enum associated with a particular revision. This is not
> very useful because to obtain the actual revision you need to
> use the tegra_revision enumeration to translate the value.
>=20
> It is more meaningful to display a name for the revision, such as
> 'A01', than the enumarated value and therefore, update the revision
> attribute to display a name. This change does alter the ABI, which
> is unfortunate, but this is more meaningful and maintable.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fcKYACgkQ3SOs138+
s6G0mg/+P+8Rot7VDNd1EWJMIktuk2Nb3qJ9o0Cu31aSzy7qjODcc7qKB2duHkh4
D96kUWvGLMYVn2c13uaU97TnmSPbruadM8+oxBqFkKnUcfO6G80ExLHE6pebhhUV
7Ot7T9EESV1dh0wtrcEGH2wuOUyvOpzZDV09cKb7FdezEyiGDQ5hKHBarHdeTWXd
eYDEMeTJ54edTMSrdbCxD3GJ0Lw26gIkWbEPZTwE1oZ8iwDhSvaqvm9MbwSl8cns
y3ReXdrlnlchWMY8+QvQsrQLz80+T2U4wt1VGelr/xwttS3buQLsB0erSLJuRTTE
OgrcZrN8HH2db/pO2s8nr1hgao7N6GAe7OWaDpHQCM7DVFcgOfwIJeffRfod51Nt
ue/2Au0eVoXDEcZrlesENgtoCazK3ePaHVOuORjmndZi4afmruVwiI3Qc0LFRzOR
v9U1cMOTcIzoT7wcMlJ5maXPHsovK58mWLZ5KkIEgmaBps6By9+4vdI9liSQ+3FS
PnQ/tBrQx1ESKYV/j9UqnIvbn9qrXq9EmuGxCyPjXUZ22seYiMsW0MhFPbuuddFm
E6fxlK9N5+udDepUBCJr0vfdr1mKxyR+qpKa9uBrwc1cJZbMB+nmhFzomvB8xsdI
EUIdY5Ylqa7SzqrO2a+/Mwz2+Vxaop2G0k49K62e0MLy/vmseKg=
=Ibkn
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
