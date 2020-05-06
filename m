From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/3] ARM: tegra: Initialize r0 register for firmware
 wake-up
Date: Wed, 6 May 2020 18:34:00 +0200
Message-ID: <20200506163400.GB2723057@ulmo>
References: <20200324224335.5825-1-digetx@gmail.com>
 <20200324224335.5825-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200324224335.5825-2-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 01:43:33AM +0300, Dmitry Osipenko wrote:
> Downstream kernel of ASUS TF300T sets r0 to #3. There is no explanation in
> downstream code whether this is really needed and some of T30 downstream
> kernels have and explicit comment telling that all arguments are ignored
> by firmware. Let's take a safe side by replicating behavior of the TF300T
> downstream kernel. This change works fine on Ouya and Nexus 7 devices.
>=20
> Tested-by: Micha=C5=82 Miros=C5=82aw <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> Tested-by: Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>
> Tested-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/reset-handler.S | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied to for-5.8/arm/core, thanks.

Thierry

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6y5vgACgkQ3SOs138+
s6FeZw//bsTtyKAUaZPjgynbaktNBPBlZ19Zn+dT5GDNmvazxZUBprVCYl3AY1Qj
OJ1v65x2LXKFcPmJ4xRMk/M8mnZLchWeIfHIWRtMjUepgQ7Y4VlVB5U6GjuQfNa2
BJxCoW/XyLLYFp9Pz1lfrpcsaVAMZ9YI5zk4XfKoFvWLlLbO0FHkg4pF62uZ/+sy
rSYWNF5X9Cteqjm6R0LddQmx2ari9nFr2UqYv2jX86OaalBgoh4UfSu/cuYSu5bH
3B/6GUNLWh5tIiMpCa7+mn5FvCYXrF38HWQdIvZm2QBM0TDIDWaGfC0VyQFppu0H
QxDOtpxiXqDVGYZ820XApvM/pqULDdeEyGxUgX7kdlR6ecUPQUaivIleEYvWMrkH
RphS2Ddf4tCc+KPt64bX+emiEX2yNDiqnj1ow99pPq+UqTtCmbbpSsePFPyujAyC
KmHS7j8zbJvXG8MpHF2JVNjcH1pcmQ39r0r/97YMH86iS69sdpAkvOVr1I7uHyJH
kwmPLu2n8XvzDpqWCMm3OCfqF5xApGlaac3zy2hfwd3YJzmoOduRVNmZMVxCMcmn
G/905hO8upsMCvFOFkAO2gGqnzAhg7A4nYWVMqdTM6dMPJ4jEyVKCVdTq8yLS6z4
xvJd7HDSbY2p2ETt79uQe7hSGzacHO34JBBxkqLYTsOMb7/oFkE=
=kqr0
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
