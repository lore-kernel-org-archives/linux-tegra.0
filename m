From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Deprecate nvidia,hpd-gpio property
Date: Tue, 22 Apr 2014 09:23:15 +0200
Message-ID: <20140422072314.GB11766@ulmo>
References: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com>
 <1397736181-1593-2-git-send-email-thierry.reding@gmail.com>
 <535574D6.3010002@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <535574D6.3010002-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2014 at 01:43:18PM -0600, Stephen Warren wrote:
> On 04/17/2014 06:02 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Properties referencing GPIOs should use the plural suffix -gpios. This
> > convention is encoded in the device tree backend of gpiod_get(), which
> > we'll eventually want to migrate to.
>=20
> Wouldn't it be simpler to fix the GPIO binding documentation and
> gpiod_get() code to allow the -gpio suffix in addition to -gpios? It
> always struck me as silly that the binding required a plural property
> name when only a single entry made sense.
>=20
> (For something like "clocks", since the property name applies to any
> clock, and there certainly can be many clocks, a plural property name
> makes sense. However, since each type of GPIO is "foo-gpios" rather than
> an "foo" entry in "gpios", that same argument doesn't apply, and a
> singular property name seems much more correct).

Yeah, it's somewhat unfortunate that this is done inconsistently across
different subsystems. GPIO isn't the only exception here. Regulators use
a similar pattern.

For consistency it'd be nice if we could get everyone to agree to one
scheme, but I suspect that by now we're far beyond that being a viable
option.

I don't have a strong feeling either way, so if allowing both *-gpios
and *-gpio properties is what we want, then I can certainly come up with
a patch.

Thierry

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVhjiAAoJEN0jrNd/PrOhDbQP/3DCY/Kj3BwMOHsJ6GZSbBv4
z+RFkz8CA/Cbncs8/h7YYer2WZyzwqaHzyrcy74s74x6FNucNfAB/lIG5N18a/MG
FKL81DVezZ1J+AAAWXeF5mc9ext5BXVVkyjxHbg0bPH5jGMXclnafRz8sRnLSCx1
yTAAL3xwQUZQaXqaYHo48cSDcrvaRhA0l37MM1GVg/eYM5f+ZRA5aWUHWCkzk9cz
+gWRMaygup0Hkl9NzbRSo2htr8+iwDfjjbSxpt06k+gEVVW8AYzHxFOUTT4XgW2X
OyadSf4WS3zKlc7FFayBk+QQrr/9RCBP+Iq07tyWwKLAYMdWQmhNOlqxmbpCf7S8
4STFmnlOrI7xnRPaV7cxT3cpqnAIIYQt09zU2KcnkRmMoptF6/zyRalPpbBtUBUi
LvY2TkXF/FfTVz+vGntSN9n7+53tZedSggXzikY/ODFGtZAJxcm6Yh3VwOpMiJZM
VifYaFkft3VJ1MrabUx8+mg5cLDeXwX3FhOvkuWBnuVuqZrRUXvXZjFLDveKUWQ9
JoovF4IRYYknxpNEfR5WhfgQ3m013zFNNozaUigxQLbivd3WET6zQMe5KhHtiIYg
ca52SKa4ieRaGhHJzSGfKNXs7l9UoXM0g1SG6ONtBi0A0nesmEikgp6r8udYQBUZ
B7/FyBeIO7gSqfKdeMXo
=G3Ur
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
