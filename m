From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/9] pinctrl: tegra: Support SFIO/GPIO programming
Date: Mon, 23 Mar 2020 14:16:46 +0100
Message-ID: <20200323131646.GF3883508@ulmo>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <CACRpkdY7LnyHdX4xKrr1V8Cquched0PMNL1sFTrWT6J3fdRx=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdY7LnyHdX4xKrr1V8Cquched0PMNL1sFTrWT6J3fdRx=w@mail.gmail.com>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 08:37:48PM +0100, Linus Walleij wrote:
> On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>=20
> > This series of patches establishes the mapping of these two pins to
> > their GPIO equivalents and implements the code necessary to switch
> > between SFIO and GPIO modes when the kernel requests or releases the
> > GPIOs, respectively.
>=20
> Is it possible to apply the gpio and pinctrl patches to
> each tree separately?

Yes, that should be possible. There's a dependency from patches 2 & 3 on
patch 1, but since they are all for the same tree that should be fine.
The dependency also is only a runtime dependency where the GPIO driver
would defer probe indefinitely because no pin range would ever be added.
So as long as patches 1-3 are applied in the order given in this series,
everything should be okay.

Thierry

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54trsACgkQ3SOs138+
s6Hraw//WDcWXOjZtfCWb+CApaca6PA3gsr6NZLrK4iudTDwEG8zoyxLJxcA9zm/
0OBbHHh13Wrs6JfYtNu5EIywxYBTbXBBHeHqlSMX+cJUQpetdG/QOk8AbhRNTZ6y
a/wGxPl8Sueu0bSKedPnPkJbjF8qhb9rCz5MxhCNiEm77TszYyUJLle+LxVuZCuA
GKPqq7wfua2SUm94tdaP9NM15NBGYvQHPei9ZuLWFv28ZAQYsKFUNY5SkOBfrjkd
XEQGWpgmuDh/MP1+fB7XgLyl7t0GyOMbo1J1DNenfkwfqPSvdZk22wSRAzAs5Z1P
9G5zbn6lBv0o3ndG67VbgDi8+DtSJ9i3okYpugPcRFiUJRLfsx0U3SwmeUaUJZas
V3GMxlR9wnor8haY+ZUmcUo7i7+Omak/i3W4t5YYuOmm8+nYJjD3Vn40VQVTsJFQ
hW7r+LiGxp0MVbg4F1h9bamoNpqiswM/nhS0zUO5DvZepHyzLxpxMABLilTE8Ssn
09X3sgFYBZ1z0ia5qqj/5eE4vXYZR/Giln6jEuCos26vthCNCb4PYDYXuLyipciQ
/0W+BQAI+emKc6vp09f852tOzthJwNXGpUmNZdyGeWQac6PR1GwiXiZywThVS2wc
sbYPh3MkM40vMkMUpxUaB2snjPxbbBvtNQozaaZq3c/V/8azjxQ=
=2kno
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
