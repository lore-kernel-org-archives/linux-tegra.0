From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 3/3] thermal: tegra: parse sensor id before sensor
 register
Date: Thu, 29 Nov 2018 18:13:04 +0100
Message-ID: <20181129171304.GB18128@ulmo>
References: <1543383877-20555-1-git-send-email-wni@nvidia.com>
 <1543383877-20555-4-git-send-email-wni@nvidia.com>
 <20181128102520.GC20723@ulmo>
 <9c373693-1d3c-cd02-4972-dde338651c0e@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9c373693-1d3c-cd02-4972-dde338651c0e@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2018 at 01:55:02PM +0800, Wei Ni wrote:
> On 28/11/2018 6:25 PM, Thierry Reding wrote:
> > On Wed, Nov 28, 2018 at 01:44:37PM +0800, Wei Ni wrote:
[...]
> >> +	bool ret =3D false;
> >> +	struct of_phandle_args sensor_specs;
> >> +	struct device_node *np, *sensor_np;
> >> +
> >> +	np =3D of_find_node_by_name(NULL, "thermal-zones");
> >> +	if (!np)
> >> +		return ret;
> >> +
> >> +	sensor_np =3D of_get_next_child(np, NULL);
> >> +	for_each_available_child_of_node(np, sensor_np) {
> >=20
> > Aren't we leaking np here? I think we need of_node_put() after
> > of_get_next_child() to make sure the reference to the "thermal-zones"
> > node is properly released.
>=20
> No, we will not leak np here. Because the
> for_each_available_child_of_node will call
> of_get_next_available_child(), which will call of_node_put(prev) to
> decrease refcount of the prev node. So we just need to of_node_put the
> last node after break from this for block.

Okay, looks like I misinterpreted what you were doing there. I thought
that for_each_available_child_of_node() took the child as first argument
and the parent as second and therefore np would be overwritten by the
first assignment in the macro.

But looking at this more closely I think there's something else wrong
here. for_each_available_child_of_node() is defined as:

	for_each_available_child_of_node(parent, child)

so in the above, np will be the parent and sensor_np the child. Why do
you have to do

	sensor_np =3D of_get_next_child(np, NULL);

? That's already done as part of the loop in the macro, right? So does
that not mean we get two references and we leak the first one? Can the
above not simply been dropped?

Thierry

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwAHhwACgkQ3SOs138+
s6F6/xAAqMxIDiGgMuvXEKJ/kSKqxwnHpIZ2dq3URca40EkWCOEMHC6jBICE0yKN
V+Y8HEP5/aGh0Eo38UAdVbHmBZTIbMz6Caq46LKgtygfnyX2jLUSrqXI3O/OW9S1
HsrDcibccvgdnaMFTtZ+oaOOQNDfOSrW+DNOztyFZI55iUtnPI51yvhhLxkV5wDo
FEEONc7Jirfx1XBguWbMMJf4US2vk7Bch43yk8eosNAi/92iTxC01SMNrRi46xOp
bK7J+NlIB/x9mtef2g9TMz+6ohLa06u6LILf37hBdPAk7vNz18xQf8S4wZuIZWKO
ANtHAYNQ3weln/qM9dgMEjInk2/1945TNFCJvA/L07QEEUgiy92joic7vGF7iz9v
glmt68KtMNsgE2UHwTR7fnOJu7JqoDVPQJxetdR8ElLVKcHcr0QpM54J5jQ4Qo2y
BEFe1wTwfcVUI++9Kb2j5QWgxf+eZm9Q24334zAWAy8U4sFL/u+a/M6jwazuQHjl
t1y4Q5nBLVXjH67sOT7N1S6JarBimkwoZP/0XvKOdiIxkL1m6neO6mncCZpLNFv0
AJQBPk3bgz/oQ+PNbNW+akpnB36FCxvXIyUmwmN5TpCKSbFq/vEZDZnO0ys7liT3
sFYRn3GwN9VQMZaZgrp8y4UVesNCKom4066taF1sqb/8Bnx+Tic=
=3Rwa
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
