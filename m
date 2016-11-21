From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 9/10] arm64: tegra: Device tree changes for v4.10-rc1
Date: Mon, 21 Nov 2016 09:22:10 +0100
Message-ID: <20161121082210.GD25171@ulmo.ba.sec>
References: <20161118161719.24153-1-thierry.reding@gmail.com>
 <20161118161719.24153-9-thierry.reding@gmail.com>
 <20161119024021.GT2543@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pZs/OQEoSSbxGlYw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161119024021.GT2543@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pZs/OQEoSSbxGlYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 06:40:21PM -0800, Olof Johansson wrote:
> On Fri, Nov 18, 2016 at 05:17:18PM +0100, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 1001354ca34179f3db924eb66672442a1731=
47dc:
> >=20
> >   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.10-arm64-dt
> >=20
> > for you to fetch changes up to cc13b4fa4ac780cec6c21b64a39ab2950e95e8f6:
> >=20
> >   arm64: tegra: Add NVIDIA P2771 board support (2016-11-18 14:35:53 +01=
00)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > arm64: tegra: Device tree changes for v4.10-rc1
> >=20
> > This adds initial support for Tegra186, the P3310 processor module as
> > well as the P2771 development board. Not much is functional, but there
> > is enough to boot to an initial ramdisk with debug serial output.
> >=20
> > ----------------------------------------------------------------
> > Dan Carpenter (1):
> >       mailbox: tegra-hsp: Use after free in tegra_hsp_remove_doorbells()
> >=20
> > Joseph Lo (6):
> >       soc/tegra: Add Tegra186 support
> >       dt-bindings: mailbox: Add Tegra HSP binding
> >       dt-bindings: firmware: Add bindings for Tegra BPMP
> >       arm64: tegra: Add Tegra186 support
> >       arm64: tegra: Add NVIDIA P3310 processor module support
> >       arm64: tegra: Add NVIDIA P2771 board support
> >=20
> > Stephen Warren (2):
> >       dt-bindings: Add power domains to Tegra BPMP firmware
> >       dt-bindings: firmware: Allow child nodes inside the Tegra BPMP
> >=20
> > Thierry Reding (12):
> >       Merge branch 'for-4.10/soc' into for-4.10/mailbox
> >       mailbox: Add Tegra HSP driver
> >       Merge branch 'for-4.10/mailbox' into for-4.10/firmware
> >       firmware: tegra: Add IVC library
> >       firmware: tegra: Add BPMP support
> >       Merge branch 'for-4.10/firmware' into for-4.10/arm64/dt
> >       arm64: tegra: Add CPU nodes for Tegra186
> >       arm64: tegra: Add serial ports on Tegra186
> >       arm64: tegra: Add I2C controllers on Tegra186
> >       arm64: tegra: Add SDHCI controllers on Tegra186
> >       arm64: tegra: Add GPIO controllers on Tegra186
> >       arm64: tegra: Enable PSCI on P3310
>=20
> The drivers->dt dependency here is annoying. Any chance you can respin wi=
thout
> it?
>=20
> We've been encouraging people to consider using numerical clock/gpio/reset
> numbers on initial submission to avoid these dependencies on dt-bindings
> includes, and then follow up with a move to the symbolic names between -r=
c1 and
> -rc2. Mind doing the same here?

Yes, I can do that. Would it be acceptable to have a dt-bindings->dt
dependency? Stephen's already done a good job of avoiding this kind of
dependency by getting the bindings, and hence dt-bindings headers,
merged ahead of Linux kernel support because he had already gotten the
bindings reviewed and finalized during his work on U-Boot.

I've been told in the past that it's not necessary to strictly split DT
bindings patches from driver patches, but I suppose if a dt-bindings->dt
is acceptable, then splitting things up more strictly would actually be
the preferable solution here because it also avoids the slight churn of
converting to symbolic values later on.

Thierry

--pZs/OQEoSSbxGlYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYMq6yAAoJEN0jrNd/PrOhNuQQAI/aBg0vl/oDN69XNXQxzetH
nHHLdSBBzkMp6uKIDLZWGQS7vmjKwGRRRJjcXGxDgZDsn1c1Hyh438dqSu9Z6+Vj
GKP916GgwWt7ew+g/1TmpyfpgRsIsBuxZa+cwOrXzWnOINsZMxzphP7Gex7SHxAr
uZ+mdF6Dbq6qfPwPeeV5vLf9xpVwzyoiCWR+uCYaWo+U8rspPDmcaZpFZODgMQaN
QcTOtPmJKIsTPCtT9UK+kYcQfXYByW+Zn05ARExIcw6lV6vpbe1k0yHqNBr3p+Wo
S99AKd7U/qVBY+1A5Ik0Nq15iMkpYzU2a6wnBF2jzd09u3MQo4RvHURYz6h6se0E
GNMKo5Ei3Pqb63feEHL6eUdAg1JjniQc78hzidao5lVfwJYC+cBn2IhbNu9Km5Jq
HukQXu93TCDzV0DldgZM7TTBKG/RRuyeW4VT9eKN3N1LDdkI6AVM5cTyosXUGHpo
6UbqzReeAal3YPBm5jz2U4eC5GvxExeZXCcIi71WnoyDACT/0jIYs8jKwphDnWNI
mz/zHfjUY9F+RdgnKQ5Vusa7HgnB5vpGKwmDzRdRa7uRoVvN1h+NJkjqFmLp5Fn8
AaQB7Bs1Jf9DslmqPFEZ5u3g0SI54N0w4eLnwyIPcNx4yOY51vgACmgF1ADf8FzP
HQBN2kSFJ00dmEMlYKFY
=ZjAt
-----END PGP SIGNATURE-----

--pZs/OQEoSSbxGlYw--
