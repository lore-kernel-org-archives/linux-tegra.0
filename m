From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: tegra: move serial aliases to per-board
Date: Wed, 12 Nov 2014 13:20:20 +0100
Message-ID: <20141112122017.GC30821@ulmo.nvidia.com>
References: <1415738970-7963-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415738970-7963-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2014 at 12:49:30PM -0800, Olof Johansson wrote:
> There are general changes pending to make the /aliases/serial* entries
> number the serial ports on the system. On tegra, so far the ports have be=
en
> just numbered dynamically as they are configured so that makes them chang=
e.
>=20
> To avoid this, add specific aliases per board to keep the old numbers. Th=
is
> allows us to change the numbering by default on future SoCs while keeping=
 the
> numbering on existing boards.
>=20
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
>=20
> Stephen/Thierry/Alex, as noticed this week we really should try to get
> this in before the 3.19 merge window so that the global aliases change
> can happen there without regression.
>=20
> If you have more fixes queued up, feel free to add this to the next pull
> request. If not, a review and ack would be appreciated.
>=20
>  arch/arm/boot/dts/tegra114-dalmore.dts        |    1 +
>  arch/arm/boot/dts/tegra114-roth.dts           |    4 ++++
>  arch/arm/boot/dts/tegra114-tn7.dts            |    4 ++++
>  arch/arm/boot/dts/tegra114.dtsi               |    7 -------
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts     |    1 +
>  arch/arm/boot/dts/tegra124-nyan-big.dts       |    1 +
>  arch/arm/boot/dts/tegra124-venice2.dts        |    1 +
>  arch/arm/boot/dts/tegra124.dtsi               |    7 -------
>  arch/arm/boot/dts/tegra20-harmony.dts         |    1 +
>  arch/arm/boot/dts/tegra20-iris-512.dts        |    5 +++++
>  arch/arm/boot/dts/tegra20-medcom-wide.dts     |    4 ++++
>  arch/arm/boot/dts/tegra20-paz00.dts           |    2 ++
>  arch/arm/boot/dts/tegra20-seaboard.dts        |    1 +
>  arch/arm/boot/dts/tegra20-tamonten.dtsi       |    1 +
>  arch/arm/boot/dts/tegra20-trimslice.dts       |    1 +
>  arch/arm/boot/dts/tegra20-ventana.dts         |    1 +
>  arch/arm/boot/dts/tegra20-whistler.dts        |    1 +
>  arch/arm/boot/dts/tegra20.dtsi                |    8 --------
>  arch/arm/boot/dts/tegra30-apalis-eval.dts     |    4 ++++
>  arch/arm/boot/dts/tegra30-beaver.dts          |    1 +
>  arch/arm/boot/dts/tegra30-cardhu.dtsi         |    2 ++
>  arch/arm/boot/dts/tegra30-colibri-eval-v3.dts |    3 +++
>  arch/arm/boot/dts/tegra30.dtsi                |    8 --------
>  23 files changed, 39 insertions(+), 30 deletions(-)

I have applied this to the for-3.19/dt branch. So for anything that is
post Tegra124 the new rule shall be to add aliases to the SoC .dtsi and
then use consistent numbering of UART ports across boards?

The alternative is to remain consistent with what this patch does, which
would be to make the serial port numbering a property of the board. That
doesn't sound too bad to me either since it'll hide all the unused ports
on a given board.

Thierry

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUY1CBAAoJEN0jrNd/PrOhm7kP/1JR2p/do2geWu2e++hAoUgr
dUsBz2dPEfGusbytnZKm13Uu+jUAplEPqywZUpan4APvr+QzKW7FP3a6uoaSMm4x
m/oJKCzIA4OGRJOi6NmJhBzJbPj0/UTMQta1cK/UQ+znVcW+YS5siqIsF5G59xZ6
kEM60mRzvFx7UcEXYMjt7HfIOibom/EfmcGymaqeL6phbkQXOwuLMRJmJdJ+v7xP
U5pMucWkhXqDdT/4oZQ821e+a3YyhgOxA0z0G4Rk2fLOlSJ9ByTw7PJwHPlS/eKp
RHI6y1h6u7cfKaa8tA29296dCwlRtbvkzEXJVsbTn78j7XfGIBCd5gNvghHxc3ba
CikblGDVWP732E77VrFUX10CbJClTXygXgGUGzVZOwkVomd/enh19Iuh4h4wwX6b
5xVirCcO6GQpAGR46VqXtZIxyKRMgI+4tpxX3x03kSKkSiReYpDVewoRTBEphbbi
yuWOeDYS9KFw9kGZWYB6QeqwOsS3gItH+TvjQBzu5n2gP8C2tyUB/A6Pno67OifJ
cJbEAiehN3cM04TusYeAe6POGO/VtJN9IdtTEaPfPPeSzBpxWNPaMI0yIKc3m155
AD9g8Fk+G6tc4yiqAmJ63cI61oLtlfWoo8joSZ2skmGXlb5O4XtlKtxp83Dbk3dC
9e/mkGMxvx+/prEWXLAt
=LiT5
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
