From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clocksource: tegra: wrap arch/arm-specific sections in
 CONFIG_ARM
Date: Thu, 8 Jan 2015 16:48:39 +0100
Message-ID: <20150108154837.GA1608@ulmo.nvidia.com>
References: <alpine.DEB.2.02.1412092201200.31750@utopia.booyaka.com>
 <54AE9286.1090800@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54AE9286.1090800-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 03:21:58PM +0100, Daniel Lezcano wrote:
> On 12/09/2014 11:07 PM, Paul Walmsley wrote:
> >
> >Like several of the other files in drivers/clocksource,
> >tegra20_timer.c contains code that can only compile when CONFIG_ARM is
> >enabled.  This causes obvious problems when trying to compile this
> >code for NVIDIA ARM64-based SoCs, such as Tegra132.  The same timer IP
> >blocks exist, so it seems appropriate to provide support for them.
> >
> >So until we figure out a better way to partition this code, wrap the
> >delay_timer and persistent_clock support code with preprocessor tests
> >for CONFIG_ARM.  (The delay_timer code should not be needed at all on
> >ARM64 due to the presence of the ARMv8 architected timer.  The
> >persistent_clock support code could become important once power
> >management modes are implemented that turn off the CPU complex.)
>=20
> Well actually putting #ifdef macros in the C code should be avoided if
> possible.
>=20
> May be you can replace those macros by:
>=20
> if (IS_ENABLED(CONFIG_ARM64)) {
> 	...
> }
>=20
> ?

Unfortunately we can't. Some of the symbols in this file are only
defined in headers specific to ARM and not available on ARM64.

Thierry

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrqbVAAoJEN0jrNd/PrOhK6kP/RHXBVdtLPXfGpRU+JLTVgZH
kqD4GVu7fg1U+2k4fRhlwc6B8tR/ElT5tBJgbDZ4KVR6oOYOFqziPs6KiHjnwG38
2AB7XuvXVy69zSc4DBxSa3CTeXNc+dsvS/zKYBzhSNtFGj/+8j26h0tPNHn3kOdP
9k+dEQclVYOrEsVJ2XkBGhqKqHxVx+LxeI3hBAmZKnv/tnzV/3QhBoSOZFjUFn4X
NpbdYWtqAcnqKQUsDA5Z4MpYvYyOWdsbAG95dfJPP1R3V/oX8T0OO0wyhlSkArgX
X65aJiYQACVEJG+neys9HEknb5taZRjSuHAR+1eqMDmX8bbMzURvPpep5vxA1XrF
OlWB4+IiFyHKUc/MSOnRAzb1EpOQIdv7fwiTRWC7nbsK9b+8ZC77cj4JUNHmkZZn
m1MdvgWKQxC5xIPKbSnC9zXg15EA17QZef2VnRSalBbo5G9H4S0eSShBPXnAO+dB
PGhPHjYR7yH0/DS+/bsH7ZUBmBRHW8GO2bwCrtNJrhdixdcuHWdoFgNmf8hjcrJB
EX+TdPBE5SLebdvR378qfOXQe/2pKlFunL6t3RdLmbHQe8KWcgNpD+3NumTLoV9U
XuPoJms5InCaZJbuM6Ei53YTvAiocldxmA/SxAIiJP9GPtmGYNjyXFKsablF/uWb
zjZ9Gb3VUosD10JtPlOR
=uUAa
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
