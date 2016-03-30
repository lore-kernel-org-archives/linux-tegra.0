From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: Fix deadlock during regulator registration
Date: Wed, 30 Mar 2016 10:00:53 -0700
Message-ID: <20160330170053.GK2350@sirena.org.uk>
References: <1459354153-6352-1-git-send-email-jonathanh@nvidia.com>
 <20160330161831.GE2350@sirena.org.uk>
 <56FC02CD.60107@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RVLHdg3qhy1T2deX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FC02CD.60107@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--RVLHdg3qhy1T2deX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2016 at 05:46:05PM +0100, Jon Hunter wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> > Please don't paste entire backlogs into changelogs, they're *enormous*,
> > mostly noise and obscure any actual content that's in there through
> > denial of service.  If they're useful then include edited subsets that
> > highlight the relevant sections of the backtrace so your changelog is
> > more legible.

> Ok, no problem. Are you happy with the patch otherwise? If so, do you
> want me to resend or do you wish to trim the backlog? I think that

I haven't reviwed it yet.

> this part is interesting ...

I'm really getting nothing at all from this, all it really does is point
to the call site but that's already much more clearly identified in the
changelog.  We certainly don't need to know which driver called this.

--RVLHdg3qhy1T2deX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/AZEAAoJECTWi3JdVIfQ7jcH+QF9Y4U9cPi+8E4KE7BT5Hyk
t5Kdz+W8YrZuHV9VbK/gT5/JCngPWaDduW18/xPG/K6MQoXOccV0Ivoxgv9FB/rs
InAuUv71Kr0kKSMbGQ3hJ6n+GSz3CmvmPN/7wMxNw2cnxjWopN2eMTBIqIUoH/X+
UvBXJ4IdswgrJuZ5C7uZoILaf8Y4Zx1YE7eZ1NU0GEbsZVcCvZnNvYW2tvOdBQ2o
r6Ugv/hddzKIR3y5/fo+vWl5vdWpixXFC6SrP97EuxXm5JDGRiLmaP0HPbZXJDuH
0I7xY/v9sWUBJSWQ4FKd8UbLlExjuAE/J4Yty+aEpEY7KAuE50oj6Kz3Hyd7V3k=
=3D51
-----END PGP SIGNATURE-----

--RVLHdg3qhy1T2deX--
