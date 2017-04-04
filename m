From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 3/6] soc/tegra: flowctrl: Add basic platform driver
Date: Tue, 4 Apr 2017 16:01:21 +0200
Message-ID: <20170404140121.GF843@ulmo.ba.sec>
References: <1490704978-22906-1-git-send-email-jonathanh@nvidia.com>
 <1490704978-22906-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ExXT7PjY8AI4Hyfa"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490704978-22906-4-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ExXT7PjY8AI4Hyfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 01:42:55PM +0100, Jon Hunter wrote:
> Add a simple platform driver for the flowctrl module so that it gets
> registered as a proper device.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/flowctrl.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)

Applied to for-4.12/soc, thanks.

Thierry

--ExXT7PjY8AI4Hyfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjpzEACgkQ3SOs138+
s6GEIw//R0MMoUlZOXOEIOylb6str9DSdC1Gc51uuLAC6cFdMir0tA8YNR/y0K7S
utF/jgAIzKj+z/9hSf05LHu6NAc8wGr5+oWuYOJJxDI/i1EwYQ0oDnrWTZFGd+5s
D2juGLdxxQMhifqIcLi6JWoR6CfeZmRA6zKSdQP+XswSZuJsMv8TW6+WDJdurcOv
562BXrcXLlbOjZPbHVUZtCpNakaXSU3NCspMCcK7aeckh1ZjZ7BFnm6Wld7nnhc6
iDlKXHuLddRQ2jDreAYAawJNULcT0ZNP+bdGn4IIWpooxKtOoyKVRXLEixoMcEsE
yZtFkNkFdcMdkt8P9XO5s+SKq1WmGbZInzioX9RSuB9aQ54CtrJJSKRYRu543/gr
VyofAHi/eXq0TBwpMXjQMCFDzSbQ6PssuPfS3Tkl172BUHopuT9wlkEDiADvFH1+
dUDgcaz4Gm4J7/T/oMTo6/D/hHbjzNlBOyST2mFxnMgqTanXWgw/Q5QF0yWZjwct
Yu6GAGCviRD6719gInP1+P+3tPGhYTwSkGnUeQqFEYfm0A2yW+xF4MGkgyIEMmqF
Wd4AZ2ZyH/rmsiKA49ccyCSJHPyNppbz6IA0YJgwTlWvfemTR85TY9ppiREXrqYk
aS6Omp6339OcDxvrLQDnnSCMkYZR2754AdlOEKZbCJUFB5ZLzO8=
=EX4/
-----END PGP SIGNATURE-----

--ExXT7PjY8AI4Hyfa--
