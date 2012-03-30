From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH v5 04/16] pwm: Add table-based lookup for static mappings
Date: Fri, 30 Mar 2012 07:06:41 +0200
Message-ID: <20120330050641.GA21823@avionic-0098.mockup.avionic-design.de>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de>
 <1332945238-14897-5-git-send-email-thierry.reding@avionic-design.de>
 <20120329220342.GK4153@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7827512961186253017=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120329220342.GK4153@opensource.wolfsonmicro.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Mitch Bradley <wmb@firmworks.com>, Lars-Peter Clausen <lars@metafoo.de>, Mike Frysinger <vapier@gentoo.org>, Ryan Mallon <rmallon@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, Colin Cross <ccross@android.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Bernhard Walle <walle@corscience.de>, Richard Purdie <rpurdie@rpsys.net>, Matthias Kaehlcke <matthias@kaehlcke.net>, linux-tegra@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Kurt Van Dijck <kurt.van.dijck@eia.be>
List-Id: linux-tegra@vger.kernel.org


--===============7827512961186253017==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Mark Brown wrote:
> On Wed, Mar 28, 2012 at 04:33:46PM +0200, Thierry Reding wrote:
>=20
> > +	static struct pwm_lookup board_pwm_lookup[] =3D {
> > +		PWM_LOOKUP("tegra-pwm", 0, "pwm-backlight"),
> > +	};
>=20
> The clock and regulator APIs namespace the consumers by struct device -
> might this not be sensible here?  pwm_get() does already take the device
> as an argument.  It'd feel safer, and for example there's plenty of
> phones out there with two backlit displays...

That's actually how this is supposed to work. "pwm-backlight" in the above
case is matched against the name of the struct device that you pass in to
pwm_get(). The only difference, at least as far as I can tell, to the clock
and regulator APIs is that a second name is not listed explicitly in the
lookup table.

So compared with the clock and regulator APIs it doesn't make too much sense
to pass both the struct device and the name to pwm_get() because it will
match the device name against the consumer name in the lookup table first a=
nd
only use the passed name if no match was found.

In case you have two backlight devices I would expect the following to work:

	static struct pwm_lookup board_pwm_lookup[] =3D {
		PWM_LOOKUP("tegra-pwm", 0, "pwm-backlight.0"),
		PWM_LOOKUP("tegra-pwm", 1, "pwm-backlight.1"),
	};

>=20
> > + * pwm_get() - look up and request a PWM device
> > + * @dev: device for PWM consumer
> > + * @provider: name of provider PWM chip
> > + * @index: per-chip index of PWM to request
>=20
> The documentation is out of sync with the signature.

Indeed. Thanks.

Thierry

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk91P2EACgkQZ+BJyKLjJp9AvwCfd4gm8+ailXhyXFkbUWqBdJTy
fnoAn0QXQBBDdsF3r8VikCKd8nHoi6rG
=qoVx
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--


--===============7827512961186253017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7827512961186253017==--
