From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 09/10] pwm: Add PXA support
Date: Thu, 15 Mar 2012 10:21:34 +0100
Message-ID: <20120315092134.GA29841@avionic-0098.adnet.avionic-design.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-10-git-send-email-thierry.reding@avionic-design.de>
 <4F61343A.80103@gmail.com>
 <20120315065631.GB20502@avionic-0098.mockup.avionic-design.de>
 <20120315090540.GW3852@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120315090540.GW3852-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Sascha Hauer wrote:
> On Thu, Mar 15, 2012 at 07:56:31AM +0100, Thierry Reding wrote:
> > Actually I wasn't planning on keeping this patch at all. Sascha already=
 has
> > the existing PWM providers converted to his original framework and offe=
red to
> > rebase them onto this series once the dust settles. I only used them as
> > testbed to see how the driver interface works out for different hardwar=
e. But
> > I also think that if Sascha hasn't cleaned the driver up yet it should =
either
> > be done in his conversion patches or as follow ups.
>=20
> All I have is a simple conversion to the new framework, nothing more.  I
> rebased my patches yesterday onto this series (unfortunately due to the
> additional argument pwm_device the patches do not look like just moving
> the drivers anymore). I also skipped the PXA patch since I saw that you
> already have this one. I just posted the patches to the list.

Okay, I'll keep my Blackfin and PXA converted drivers then and will fix the
issues with the PXA driver brought up by Ryan. Would you be okay if I took
your conversion patches and added them to my series? I was trying to avoid
the additional work but I think it might make things easier if they are part
of the same series.

> > Sascha: how do you plan on going forward with this? It seems like the d=
river
> > interface is pretty much done now and I expect the next round to be the=
 last,
> > unless I forget to properly work through the TODO list again. If you ar=
e busy
> > with other stuff I can probably find some time to help with porting your
> > converted drivers.
>=20
> I haven't done drivers/mfd/twl6030-pwm.c. This one needs a bit more work
> as it currently does not register itself as a subdriver to the twl6030
> but just uses a globally available twl_i2c_write_u8() function. So if
> you have some time to spare it would be great if you could do this.

Okay, I'll have a look. I guess the next round won't be the last after all.
:-)

> > I'm also wondering which tree this will go in through. Does it make sen=
se to
> > have an extra tree just for the PWM framework or can it go in via some =
other
> > general purpose tree? Who do I need to prod?
>=20
> Good question, I don't know.

Okay, maybe Arnd can comment on it.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9htJ4ACgkQZ+BJyKLjJp8KUwCgldWdwO2f+jOBZHYmjKuzMQ04
mcoAn2t59U04t6/tKVMnPwGEQZ9iKZBi
=Z8lg
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
