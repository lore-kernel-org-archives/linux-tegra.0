From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v6 17/17] pwm: Take over maintainership of the PWM
 subsystem
Date: Thu, 12 Apr 2012 09:22:06 +0200
Message-ID: <20120412072206.GB18252@avionic-0098.mockup.avionic-design.de>
References: <1334070400-25013-1-git-send-email-thierry.reding@avionic-design.de>
 <1334070400-25013-18-git-send-email-thierry.reding@avionic-design.de>
 <201204101951.44198.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201204101951.44198.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Arnd Bergmann wrote:
> On Tuesday 10 April 2012, Thierry Reding wrote:
> > I'm taking over the maintainership of the PWM subsystem. This commit
> > also adds the URLs to the gitorious project and repository as well as
> > any missing files related to the PWM subsystem.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
> > Note: I guess this patch in particular could use some Acked-by, maybe f=
rom
> > Arnd and Sascha so that people will know this happens with their blessi=
ng.
>=20
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

As far as I can tell the series is in pretty good shape. I've integrated
Shawn's latest comments and I think we could get this into 3.5. Does it make
sense to take the PWM tree through Linux next before having it pulled into
mainline during the next merge window?

Thierry

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAk+Ggp4ACgkQZ+BJyKLjJp9PFgCY06UvsJEX+0XjcOEG6q8wlSUe
EgCfcJx4RYKAzY4xT6BX6ld0fdcTMCA=
=mfFM
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
