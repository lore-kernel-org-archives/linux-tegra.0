From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 09/10] pwm: Add PXA support
Date: Thu, 15 Mar 2012 07:56:31 +0100
Message-ID: <20120315065631.GB20502@avionic-0098.mockup.avionic-design.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-10-git-send-email-thierry.reding@avionic-design.de>
 <4F61343A.80103@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F61343A.80103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Ryan Mallon wrote:
> On 15/03/12 02:56, Thierry Reding wrote:
>=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
> > Changes in v3:
> >   - update PWM ops for changes in patch 2
>=20
> Couple of quick notes, mostly for future work.
>=20
> > +	/* NOTE: the clock to PWM has to be enabled first
> > +	 * before writing to the registers
> > +	 */
> > +	clk_enable(pc->clk);
>=20
>=20
> Should be fixed to also call clk_prepare (and clk_unprepare after
> clk_disable). Could be done in a follow up patch.
>=20
> > +	__raw_writel(prescale, pc->mmio_base + offset + PWMCR);
> > +	__raw_writel(dc, pc->mmio_base + offset + PWMDCR);
> > +	__raw_writel(pv, pc->mmio_base + offset + PWMPCR);
>=20
>=20
> Should we fix this driver to use readl/writel instead of the __raw
> variants? The memory is properly ioremaped, and to my understanding the
> __raw memory accessors should be avoided outside of core code. This
> could be done in a follow up patch if you want to keep this patch as
> mostly just a move of the code.

Actually I wasn't planning on keeping this patch at all. Sascha already has
the existing PWM providers converted to his original framework and offered =
to
rebase them onto this series once the dust settles. I only used them as
testbed to see how the driver interface works out for different hardware. B=
ut
I also think that if Sascha hasn't cleaned the driver up yet it should eith=
er
be done in his conversion patches or as follow ups.

Sascha: how do you plan on going forward with this? It seems like the driver
interface is pretty much done now and I expect the next round to be the las=
t,
unless I forget to properly work through the TODO list again. If you are bu=
sy
with other stuff I can probably find some time to help with porting your
converted drivers.

I'm also wondering which tree this will go in through. Does it make sense to
have an extra tree just for the PWM framework or can it go in via some other
general purpose tree? Who do I need to prod?

Thierry

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9hkp8ACgkQZ+BJyKLjJp8bhQCfR49b6dKHYpFpbA4eDxZT5WZ0
CZMAmgMC1Uok9b+nFcVkVh8APLV2Isr5
=N+g2
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
