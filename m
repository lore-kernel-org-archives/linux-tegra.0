From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v5 03/16] pwm: Add debugfs interface
Date: Thu, 29 Mar 2012 22:56:00 +0100
Message-ID: <20120329215600.GJ4153@opensource.wolfsonmicro.com>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de>
 <1332945238-14897-4-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/qIPZgKzMPM+y5U5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332945238-14897-4-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/qIPZgKzMPM+y5U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 04:33:45PM +0200, Thierry Reding wrote:
> This commit adds a debugfs interface that can be used to list the
> current internal state of the PWM devices registered with the PWM
> framework.

Reviewed-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

I'm not sure I don't find the style with a file per chip more managable,
but I think that's mostly a thing for GPIOs since you get so many of
them in most systems that the file gets large which isn't such an issue
with pwms, you tend to get much fewer of them.  It's certainly a matter
of taste anyway.

--/qIPZgKzMPM+y5U5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPdNppAAoJEBus8iNuMP3dHI4P/0AYueAkdq55WkIJ9EPQrc8+
ds6ococV4sRHBpSt87TtUx0Bh+KiaXinqZ0egyMRbI4Z+9Q0mRL7beKFnEgw85XH
nyoAnTlzaEt+o1QM2qydOb2S9+VC9w14an5wLtb7qebVNWS6K1zhixIb62V3vQP8
cGpv1JYF6YgOhxdoWKkR+5tCGKdj2248BXCkeq3LZ9lR3DeJOE1ylWfEhzf3rlmB
fSq69YaQzzTuSpKyjdVjEyk0SeLzKXffPf99qFJmwCkRSgKUL09ZkSTVeDHexTWc
+kYhygS/1Khx7VdQMQH24c3Vpm4ZlAcmPqbP8B82X0lWLU8L7L+S5J7laSCHT1b3
i0CYJ56VbuGTGVRm12ghXflKUGrdhB2Md6O5BGLQSDkzNTseiMGxicF4VGtg9ZZ4
/MzAXs2c2zU7BltzG1nlkjpInnEiGY8lvJBa2Q5fR3yEHwY3O43aDJYtQOCbt2Sk
3zOWs6P5S606xhuCN5s4UwjWINM9CZE1GbdNEQbqqxjVzEO1g1xRWtc8mYzK9NzJ
zmwBn5ACaJb/CaAi+TWwQxkHRvFC/x9Y02JEqpCidxge96uhHw/ADSAiW8o/L1dK
ARp61EanxmhzdDk5+x986f1IWEZIr58TICJTkTFHc61+luR1MiPAmh/wt7PZiRB4
CoGCSvJiOYsEN8NB1JtX
=Sxz1
-----END PGP SIGNATURE-----

--/qIPZgKzMPM+y5U5--
