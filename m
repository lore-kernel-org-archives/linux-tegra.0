From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 4/8] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
Date: Tue, 10 Mar 2020 18:12:08 +0100
Message-ID: <20200310171208.GE3079591@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-5-thierry.reding@gmail.com>
 <67295862-0898-87d1-ddb2-660713501bca@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <67295862-0898-87d1-ddb2-660713501bca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:35:01PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Add the binding document for the external memory controller (EMC) which
> > communicates with external LPDDR4 devices. It includes the bindings of
> > the EMC node and a sub-node of EMC table which under the reserved memory
> > node. The EMC table contains the data of the rates that EMC supported.
> >=20
> > Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v5:
> > - convert to dt-schema
>=20
> ...
>=20
> > +  memory-region:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to a reserved memory region describing the table of EMC
> > +      frequencies trained by the firmware
>=20
> Shouldn't the table's format be documented?

I'm not sure that's needed here. A proprietary bootloader creates this
table and the kernel has a structure for it. Describing the exact layout
in the device tree binding seems a bit excessive.

Thierry

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nymgACgkQ3SOs138+
s6Fj5BAAmv+mvasJUdui0XMVUv4sBs9YLxhTG+7acJVbOtaCfrhyxXoIoI3Y+PpF
HwS5ueYZ/cl+OHk0zkXiUWx8bZ6lQzZHw10iSkdLFAZze2LZmms9vHbIMwYaF+g9
APNbwV+anz+If2OTSXP1AFYorlo9myooQy4hBHILwy8pXcMnJg7FYIZkYtq8L836
ffkocgrgeo4QfP1JKLXbyb3fsT5rwoxrKiaLNCxH/+vNOdxuMnstI9QhZxFNvNgu
DlFXjRfpnlK99G7wfbqEYn8aP0VQ2l/6UeFGG37PTCBZX6WWg9WpWrMqzacKJO6K
+Esu24qd266pgSu2Tw9iy09JYOVqWwlPWQg0O47IFs0fCq2nj+ldJ7eJJ6uTIIsu
b/OOK2wh5zJ/rYy+9mR+IsjNtsux2vXXElJrj4kMvcNFuC70VfAeihGIB5PtlFOP
diCYDy8BJKwH0mPRbf9cIu1N885HNAhDilEw3o9QvtuyYYSeO+A4i55kBA+yc3RZ
+2MRvFaI28cNU6FrXuHAvBxnfLaH6AKVgGd16mW+0A34xlKiLqlzwjc/2pub4Udn
1MDG5vnvAWIutHjR0KOraodPzntxR8y0HJmihMTY2iNA87OolC7UjoNxpJcc0p7T
znsyuk0wZUYktfTHaJz9rPpk+LYecFvNue0jKSzQbukSU4ah0vA=
=DG9g
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--
