From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 6/6] bus: Add support for Tegra Generic Memory
 Interface
Date: Mon, 7 Nov 2016 12:49:37 +0100
Message-ID: <20161107114937.GD28616@ulmo.ba.sec>
References: <1478507405-13204-1-git-send-email-mirza.krak@gmail.com>
 <1478507405-13204-7-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9dgjiU4MmWPVapMU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478507405-13204-7-git-send-email-mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 09:30:05AM +0100, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> The Generic Memory Interface bus can be used to connect high-speed
> devices such as NOR flash, FPGAs, DSPs...
>=20
> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
> ---
>=20
> Changes in v2:
>  - Fixed some checkpatch errors
>  - Re-ordered probe to get rid of local variables
>  - Moved of_platform_default_populate call to the end of probe
>  - Use the timing and configuration properties from the child device
>  - Added warning if more then 1 child device exist
>=20
> Changes in v3:
>  - added helper function to disable the controller which is used in remov=
e and
>  on error.
>  - Added logic to parse CS# from "ranges" property with fallback to "reg"
>  property
>=20
> Changes in v4:
> - added sanity check of chip-select property (fail if invalid)
> - adjusted for device tree binding property name changes
> - fail probe if there are no child nodes
> - removed superfluous error message
> - removed superfluous newline in Kconfig
>=20
>  drivers/bus/Kconfig     |   7 ++
>  drivers/bus/Makefile    |   1 +
>  drivers/bus/tegra-gmi.c | 275 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 283 insertions(+)
>  create mode 100644 drivers/bus/tegra-gmi.c

Applied with a bit of code reshuffling to make things more symmetric as
well as a couple of pedantic cleanups because I couldn't resist.

Thanks,
Thierry

--9dgjiU4MmWPVapMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIGpOAAoJEN0jrNd/PrOhXXQP/Rqjl3rQapa2nVOHkGCCi+bM
kWf/lHmMIeW6wY9n26Nv6ZWoOKIO22hxZmH0zztBwx8HZ8ysJkUEdTVw3lbYaLHr
fRTVkqFa4ikG2yqZgOgGZkgRdTp7zaYWKGL32HLJI/61V/oqMLzqZV5X5fjBOsqT
zqAVtRIy+KZc6ZLZ34f+tElcDhgmbdRrxlOngw5HgV1GBL9P5kU/xH5njqk0beaq
tjHGHWYYqv4v0tvcx/X+ScEcr7ISKIJrvUvllIHGgZCx2T56kAliMvZbA/cVVJjC
7tHBJZ6VRKP5hnPsHMHpw7u3i1v/pRnZffrY7AL93hgOv6Y7iVnmNH9gk11/lpcV
W3AQUCph62tQqSAwtrDkrIlkBJwU3TA2TPHBmdr5QXGYOcMYUY6ONYj0UG5orVLZ
nJhw8keVjp4Tp04WTg9wnJ7+KdzOI4xONHf8rs76Gt9JI/ufpTIk2SnrRLXQr0L0
wUPJjP3l1XyzKgbfGzQRH2TXYw5LXp2qoPWbHNQ8SGGKzSHSkr3Pc+XtL5VucCS4
E5HOu5uHDsRRxs1k/C9bLKWqfxpX7rEfkHg3z2CRh/zLg5Ngl5iVd1ymL1xtQpBw
m0mNRFJLel/ogrPP60TrVauStg7jQujWEy4e82PNrNV7Q5viOaEaKK6dtRk9Hl1E
b/a79oEOJDy1QJ3eR1vP
=JhXv
-----END PGP SIGNATURE-----

--9dgjiU4MmWPVapMU--
