From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v5 04/16] pwm: Add table-based lookup for static mappings
Date: Fri, 30 Mar 2012 11:18:00 +0100
Message-ID: <20120330101800.GD21950@opensource.wolfsonmicro.com>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de>
 <1332945238-14897-5-git-send-email-thierry.reding@avionic-design.de>
 <20120329220342.GK4153@opensource.wolfsonmicro.com>
 <20120330050641.GA21823@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120330050641.GA21823-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 30, 2012 at 07:06:41AM +0200, Thierry Reding wrote:
> * Mark Brown wrote:

> > The clock and regulator APIs namespace the consumers by struct device -
> > might this not be sensible here?  pwm_get() does already take the device
> > as an argument.  It'd feel safer, and for example there's plenty of
> > phones out there with two backlit displays...

> That's actually how this is supposed to work. "pwm-backlight" in the above
> case is matched against the name of the struct device that you pass in to
> pwm_get(). The only difference, at least as far as I can tell, to the clock
> and regulator APIs is that a second name is not listed explicitly in the
> lookup table.

Both clock and regulator APIs map (source) -> (dev, name).  This only
has a mapping (source) -> (dev).

> So compared with the clock and regulator APIs it doesn't make too much sense
> to pass both the struct device and the name to pwm_get() because it will
> match the device name against the consumer name in the lookup table first and
> only use the passed name if no match was found.

This is different to what the clock and regulator APIs do - they look up
the name in the context of the struct device.  This is because...

> In case you have two backlight devices I would expect the following to work:

> 	static struct pwm_lookup board_pwm_lookup[] = {
> 		PWM_LOOKUP("tegra-pwm", 0, "pwm-backlight.0"),
> 		PWM_LOOKUP("tegra-pwm", 1, "pwm-backlight.1"),
> 	};

...if a single device uses more than one PWM then the above scheme won't
work - unless I'm missing something?

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPdYhSAAoJEBus8iNuMP3dV1IQAIzHzTnCb2eShdWE2yhS6dla
wqQJRdNH3s2r4oZzCnldxqzLD024bhiz51MMCuM1h9MjM6J1M6aVDah1gX9GrDnK
7TBAlKRAK+VAFjiARYbYPEHr6W41Lrdv6SFLcpH3ZgTdWNvNhyjS7eXs3xyZiKfa
4sfMi3yUKSg5DGmbsaV/dX/h9Kw00BhR0qEDPuJ8mJOFvHAzr97zez547DhICHFa
aAHO8V3SUklZGmouZnkFMIsarXkevCsg8XEdDBU+SBfdtq9wXsIcuPi3r68dxoKo
9zhIf69E6MaLMQGsZnX+d45O1QO0B+JeNyfKdj0LnJgzksU4IcQIqoZ+YZrwFHep
CmmAHB+BoGo1Lh9k+GF/xVHUA85FERAg9CrlkNTgxz6MNX46fdSoTVH+dvbud0zY
dNvjl7Bo0/LE/IUJn1nReY97gm4oDWxKEh3dyjbX8CcS2DRn035XLCGJDqqWAmrE
tq7f8ZA44PRM2sgXflDW0WIexJ6OJwL7fEK2S0p22s6pa6WpKSn33vX+JPwgYFMg
8zoHFBa3NN8r+65bC4UA6tJzxPfXJ7/JhqZLTBEDSdjpE9ph8Np2KJUtwNYPB8T7
lRqNJ9iFJJPtMisRALVmRQF0OwTV0qwnFLHWV9bKHvVfw06ffYJ8KQ5m1PyAXLbK
PmbCcbyRPGaInp7BrtHp
=VdAt
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
