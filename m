From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/9] gpio: Support GPIO controllers without pin-ranges
Date: Fri, 27 Mar 2020 13:13:51 +0100
Message-ID: <20200327121351.GA2229783@ulmo>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-2-thierry.reding@gmail.com>
 <CACRpkda5M4NPvMBBLg+_2BJw7ZmryrgN72JZL_XAFQ137s0OLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda5M4NPvMBBLg+_2BJw7ZmryrgN72JZL_XAFQ137s0OLA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 11:37:07AM +0100, Linus Walleij wrote:
> On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>=20
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Wake gpiochip_generic_request() call into the pinctrl helpers only if a
> > GPIO controller had any pin-ranges assigned to it. This allows a driver
> > to unconditionally use this helper if it supports multiple devices of
> > which only a subset have pin-ranges assigned to them.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Patch applied.
>=20
> We have some drivers like this:
> drivers/gpio/gpio-pl061.c:
>=20
>         if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
>                 pl061->gc.request =3D gpiochip_generic_request;
>                 pl061->gc.free =3D gpiochip_generic_free;
>         }
>=20
> Should we just make a patch assigning these callbacks
> unconditionally as a follow-up?

Yeah, that's a good idea. I'll look into it.

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl597foACgkQ3SOs138+
s6Gtww//f2wgHp8+oZLyJJoqc6KL8UkvcBfrJRzcHr37THvP7BGCNWS7KIIvyR6Z
7NYjQOm5daGIQJ1FQSBZHOKOPJ8t6Yocsf8sisIq53pW9EjUYjmJUKkwB1rNnD2Y
/eh/szX/Z60bfuFlPNiYJgSWfIoRw4crM5yTrxjfIoV+HjX86zAkt8Ko7JLYYB/7
5gGS4SEGwhyDvFNJwwdyW0CurFRmQbUWsSB1BPOzNYB30kubmB5HxBws/xaE3Pqk
Z53TgLNemQ4hRcDzm0PeiPdvDWjI3Khy0j04+ivOUONzq7w7S+y+sTRha6mCykD8
SNm92eegAtpSOrt/Ji4Qja1d7CQFO5SKvs4JlqifTuJ/PMuxH0aDmIUsVmKHPTqq
rTrdvGWT3rV0TLWgZ1Q/j3nZrqp18pGGGSRaAZesE9dHVXrWfpO3WS+nGo2/Yb4q
86XzxbIStJ17vrkrOI5ntSOdXVgouEgBR+XYkr8l4Yde4FoZTeAHQfM+0dhys0nG
rIXMo74gRouOLhhz/tzvAYCnVTRWX4rrrfY5/bkSnlwGNmrLAYKbg02+faJVNFQy
mSTjB7BtZ4C7w0ZsPCCwSYBXSPZZATgHJMjwf1FlO+j6AZ7l8URXC2HGuVfhmzl3
qyGEfDlIRES9gbNzYyyMH21viwL3+6eA5GN9AVzA8e3G6PQvbwo=
=0srh
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
