From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Fix reporting GPIO error value
Date: Tue, 14 Apr 2020 15:51:52 +0200
Message-ID: <20200414135152.GA3593749@ulmo>
References: <20200414102512.27506-1-pali@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200414102512.27506-1-pali-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Andrew Murray <amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 12:25:12PM +0200, Pali Roh=C3=A1r wrote:
> Error code is stored in rp->reset_gpio and not in err variable.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/pci/controller/pci-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

With or without Micha=C5=82's suggestion:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6Vv/YACgkQ3SOs138+
s6Eamw//c9rjXOHWJcTFLrcwMcrxead/8lDekjEgx85muyvjFplQbZzzOSEImmss
z9vAjmlyGOGOl0mWBqDGl9OHnLxBHjlSYFT2DlZY92dBgfsa0qY9oEAJ2eFaNRnP
iyRDns4lq14wcRNlVqeA7/LgOjcyYhFMWx4fR5kMqECPxDF9BteS7A8Mbxp+oKl1
Zg6e8cBfJ92XzRTX1uR2aHmTZTqIC26xxd0qe40/+8dHTtada4TCrX+C5Cyn1gCF
6pNWvVAWqqcOZqI9tGR5i/7SiMceUxAGcxBLD/owQEKLaIVCQgRmoeKJUo3TJcVk
UlOjB990t1qVtOQLym7gP9T2wOS01kzwoWy9/EvsLO5WALYrmzhLVJ//qH9ph0Xi
FyD5BszkDoaG4O+NG1vq9uDoL4k+cOPhyxleJ/Y1QJ04xdsq4fUPcT5YRWkYJukX
c/SslMaiPeqstf63FNzHmbZuViKcmpFXj+JbRXrdpH8sXVwrchd1PBVXlc0x3o95
ieD1fQTUU+tYYE0lV5Z8qxLeAZiSYjBa9BOOnRGuULAwbJFigGjs6tkyu0AY54kM
id2LnQNrL2PdYRO3pwY9Juaqn/ryAE1U2KEoRKSVWQO8/3PgNAzYW7e3IApkEe+I
6dPJnoqnuebk5fgsoIx3OP6hx5QbcivpaAAdUpHagUEXKdYSgZk=
=JwZT
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
