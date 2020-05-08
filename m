From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mfd: max77620: Use single-byte writes on MAX77620
Date: Fri, 8 May 2020 13:15:14 +0200
Message-ID: <20200508111514.GA3034899@ulmo>
References: <20200417170913.2552327-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200417170913.2552327-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 07:09:13PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The MAX77620 doesn't support bulk writes, so make sure the regmap code
> breaks bulk writes into multiple single-byte writes.
>=20
> Note that this is mostly cosmetic because currently only the RTC sub-
> driver uses bulk writes and the RTC driver ends up using a different
> regmap on the MAX77620 anyway. However, it seems like a good idea to
> make this change now in order to avoid running into issues if bulk
> writes are ever used by other sub-drivers sometime down the road.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/mfd/max77620.c | 1 +
>  1 file changed, 1 insertion(+)

Hi Lee,

did you have a chance to look at this patch?

Thierry

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl61Pz8ACgkQ3SOs138+
s6E+7A//a03m70gtgZGEknOoNZ0CgU5RIPvSY0ARoSLPdVfn3U7lymln4Qozoqpd
fG1juRJx4/a1rW2kKjNrXAGtp02I5UMyNH3gQ++Hv+dHKOzQwS2daqpFYBNstg52
MxfQXZGeCY6itzefnnQOV39wGkRLnPnDWdyi+KvPj+AxTM0snKT2CplhcRLNrFIO
08IF7EQgO1I8pQxqggbZD/PYyFVEMql07N4ngnNw+ffdvwKa8tBrE5XN6fkkOXZY
YbNGJuR7CznCYwwgEbG7lg232hKHuTW41e9M3NBvkWknIeLCHcWdyUNYQYqYQ4yC
Olbv/CbVrS1UxDgOQHT/v80MI4rIYgMBDqu9uTZP8kp5uG2kc67RiQopaA1y1trP
9zXIBR5m9aA8KcMQtl5QXXbFMqqSgeuBPsKAmIFknufJjCOiJYD0nv/f4ZEEKcBL
eW48OH5LbAsmU82kBEO+UvL6mcH/Y0a5q2cNhmWvCx5bWJUfOfkjgRAcdIQzUW8X
b4qPznmtylujpafCIT110QwyThH6sOXocJwJkvybAWcD8JJh6Lux6kH73IDWbH13
uDOODx1CxRzhJWf0Qy75sVEnwZKSlhneb/AcjVD1AxvHfN5sKJGIHqR8mrOGddJF
qQtRSBX8eBXMIqp3E+hOq3ZZy7YYDXUDJhrSw7Icgu7Ews6N9vQ=
=2rKA
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
