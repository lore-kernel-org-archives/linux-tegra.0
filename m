From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: divider: Check UART's divider enable-bit
 state on rate's recalculation
Date: Thu, 14 Nov 2019 12:56:56 +0100
Message-ID: <20191114115656.GC5690@aiwendil>
References: <20191030004813.9187-1-digetx@gmail.com>
 <20191113230303.726AE206E3@mail.kernel.org>
 <02df00b3-5e23-441f-b2d5-b84fdb411e98@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <02df00b3-5e23-441f-b2d5-b84fdb411e98@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 02:29:51PM +0300, Dmitry Osipenko wrote:
> 14.11.2019 02:03, Stephen Boyd =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Quoting Dmitry Osipenko (2019-10-29 17:48:13)
> >> UART clock is divided using divisor values from DLM/DLL registers when
> >> enable-bit is unset in clk register and clk's divider configuration is=
n't
> >> taken onto account in this case. This doesn't cause any problems, but
> >> let's add a check for the divider's enable-bit state, for consistency.
> >>
> >> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >=20
> > Is this going to be picked up or should I just apply atop the tegra PR?
>=20
> Looks like this patch missed the Tegra's PR by accident.
>=20
> Stephen, I assume it will be easier if you could apply this patch atop.
> The patch doesn't have any dependencies on any other patches, so it's
> fine to apply it separately. Thanks in advance!
>=20
> Thierry, please let us know if you have any objections.

It's not so much that I missed to pick this up. It's just that it didn't
make it in time. This was posted just a couple of days before v5.4-rc6
and I had already finalized the branches at that point. Given that this
doesn't fix any actual issues it didn't seem worth to force it in at
that point.

That said, I don't have any objections if Stephen wants to pick this up
on top of the pull requests.

Thierry

--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3NQQgACgkQ3SOs138+
s6GN+RAAlZUaaL6lrEOCJlwJGKgjjrETnZko9J+MhX2AI2fHkqzpUYdYvN2/w9Sq
RhMHSQfYTNuZ1fXleTQ1UhiINXS5WpRuBMWadA/Sb+3A6PZ92YQ+8/GH5I1uAxG4
is5Fqgbg0TwOIxNNMP/j8Sh1wvKIfx0lrlKA8+sM7tKTCuH1rVgJ+WYHdLzJib/n
Gnnickw+pryCvL83/2ZiQpxHd4gu5yZlw9uwa5rMRGaPRsbk+VVarMGonYMauMV5
hrNkVw+Q4YesuQvXy2edLaZQtpZ509uDf6vaq4QVvdwF58SRrgEUqqp0N1Xydh0s
DxbNK641Z+0Pk7RmgYyQl03QxoYGprEMXv+R50XDcJQ+vqpuX74Lw+vb/4LSexBf
KteBcilGVv8oyfL3JndvePNqGf/gWiJDZktr+193EJN5NqoSc34ajFf2DFyhwevf
a0VWFMBYePxJZ/XzZeVaBfHLzqTlIxIxiTqbdlLdb7rag9pXMMIAuaENH7kPzcne
+UNX40y6k7VMkL3eXXDoGpIeQvuvcO/HX3SREe+x5g5CuZtHIEG4uyGuYB316cIt
aVajRoQFWbuB40wo2L1+UsVYpUVQlZU3GxsB2L36U4rqjLgiKxai8Olp8zlTwjEv
qZFNjfUhtnSlbzsHq4hGlj+5V35tUnsivI/L/XByshtrYKrJF9Y=
=VQeb
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--
