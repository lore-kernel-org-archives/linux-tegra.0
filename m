From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: Availability of psci_smp_available depends
 on CONFIG_SMP
Date: Thu, 8 Oct 2015 18:04:29 +0200
Message-ID: <20151008160427.GA29417@ulmo.nvidia.com>
References: <cover.1442990383.git.jan.kiszka@siemens.com>
 <8b94f7869972d64f442f97208707a5856cbc8b14.1442990383.git.jan.kiszka@siemens.com>
 <20151006081122.GA21527@ulmo.nvidia.com>
 <20151006151857.GA2416@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151006151857.GA2416-5wv7dgnIgG8@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2015 at 04:18:58PM +0100, Will Deacon wrote:
> On Tue, Oct 06, 2015 at 10:11:24AM +0200, Thierry Reding wrote:
> > On Wed, Sep 23, 2015 at 08:39:43AM +0200, Jan Kiszka wrote:
> > > Ensure that we can use psci_smp_available without checking for
> > > CONFIG_SMP first.
> > >=20
> > > Signed-off-by: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
> > > ---
> > >  arch/arm/include/asm/psci.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm/include/asm/psci.h b/arch/arm/include/asm/psci.h
> > > index 68ee3ce..ff956f4 100644
> > > --- a/arch/arm/include/asm/psci.h
> > > +++ b/arch/arm/include/asm/psci.h
> > > @@ -16,7 +16,7 @@
> > > =20
> > >  extern struct smp_operations psci_smp_ops;
> > > =20
> > > -#ifdef CONFIG_ARM_PSCI
> > > +#if defined(CONFIG_ARM_PSCI) && defined(CONFIG_SMP)
> > >  bool psci_smp_available(void);
> > >  #else
> > >  static inline bool psci_smp_available(void) { return false; }
> >=20
> > Hi Will,
>=20
> Hi Thierry,
>=20
> > you had questions about this when this was first submitted back in
> > May[0], but discussion stalled. Can you take another look, please?
> >=20
> > I think irrespective of what the series is trying to do this is a
> > correct fix. The arch/arm/kernel/psci_smp.c file is only compiled if
> > both ARM_PSCI and SMP are selected. Builds break if we don't mirror
> > that conditional in the header because for ARM_PSCI && !SMP no dummy
> > will be defined, but the implementation for the prototype won't be
> > available either, leading to a linker error.
>=20
> Sure, I'm fine with this patch in isolation, I just didn't (don't) fully
> grok what the series is trying to achieve.

The goal is to prevent the kernel from registering a CPU idle driver if
PSCI is going to be used for SMP. This is necessary because both the CPU
idle driver and the PSCI implementation (provided by U-Boot in this
case) access the same resources. The effect of having both enabled is
usually that the system will simply hang sometime during boot.

Thierry

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWFpQIAAoJEN0jrNd/PrOhBi8P/3A8vn6utsqoc/PdgWp7y/W6
sucZlXFcS+6Ef+48k/CIhIVF/Es3ATApm3mn+G6Cbc7x0XxGCnKYtntixqMGkSOZ
+12IBu+l0KUpq0FPRcWOAN2/L7LWkcdgGy/w/UW3tccoCtcDkPM4UeWz/1YxiOrd
Rvn5sNqY/xdSThCo4ttU3FSWAIbTfxBEsqJSBRav7rCeXvPqsuFaEIuZ+fXrQUcQ
Zii2yq0CfbqvpOll2N+qPzpPyTGZgA2ZaBzIVTOucLIe4hGPS0PyTk1T+lYEmeM+
GGKMrPz8sg/na8kyrlYykyLgxUKY69EKyHpfZ62OtelqJnu5vhlKO5vdFDx3IECR
qXKKMpBUlE9GCj55uFNEskkYtdGVjfJUDr3hjNzNTmp8wPjtVH3zBDsG0gM425pb
O6BtcXYFfhAY4qgMut9uSxgJ5dGT+3ldPJiGZm/K1FbTmhAn8EZ4gTq5n73uswb/
jQIPSOlxlLGqeV4A0V7bzJtHZSAlYoHT8J4hIgXhtyb2B6H7CriMxHzehAjCA6qo
AVaZGUyoVSn7ZJkejrjV5e7OdO4aZyZ22zQPL6+oQfmRrglEZFYAxPbYrNQa7Vte
ty6fjey3TFNrESRZSgU7IAch6DtAqur/bf5AP+9ySl2+DIO4590fASFIfxQUVJSx
mHDmtDXPSZjx6Ou6aqZ9
=snLO
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
