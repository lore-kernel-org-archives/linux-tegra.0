From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: seaboard: enable internal LCD
Date: Sat, 17 Nov 2012 08:30:22 +0100
Message-ID: <20121117073022.GB26391@avionic-0098.mockup.avionic-design.de>
References: <1353092114-18410-1-git-send-email-swarren@wwwdotorg.org>
 <50A7020B.6070708@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A7020B.6070708-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 17, 2012 at 12:18:35PM +0900, Alex Courbot wrote:
> On 11/17/2012 03:55 AM, Stephen Warren wrote:
> >+	host1x {
> >+		dc@54200000 {
> >+			rgb {
> >+				status =3D "okay";
> >+				nvidia,ddc-i2c-bus =3D <&lcd_ddc>;
> >+				backlight =3D <&backlight>;
>=20
> I guess the remark Thierry made on my patch that the property should
> be "nvidia,backlight" (and that it will not be supported for 3.8
> anyway) also applies here.

Yes, and the property should go into the rgb's display subnode.
Eventually this will need to be hooked up to the panel framework once
that's ready.

Thierry

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQpz0OAAoJEN0jrNd/PrOhFyUP/iJEf1Dn9JEE7N9tHXCs2n52
CblBf3NltnDhf1ChLW14TzOOC/yiJi7cLkigw5iPEXJa8cZInmBKeJDmHpGyf6A2
dcb0yyJqFO20ZGtacWOMOAcBmHjwqJjTq4cY7ioNmAjWOGUC8yX0qZpbnaD1nr3M
aTtuvdiFD4SIvFxPQ935HF21gkV0Cvtzg6hS252vQXHRhft8Dy8/16x0Ewg1xevQ
wCcZJDaRhsePWjBOJCaCIuCrxs3sSbTcXl11ekd7wSh8nD4EYmJIAQz0cGsxmhPa
sQhmg6zu8luQ5OJSs69ePU49ZgGlk+zqlEF7uDFtIKSqpN/aOpHTfQHICR0QaSrN
FiBzMw+Z9tqpRdYmnNkOb0b7jE4ZYbntqaoZ/saUzAxuAPsLYavb6vTMX4I6xolu
/Ss1JJo567bisxXi4UTPozHgF/AXEfmF1lCYRSjDetOcZD/5qiQieqzts98bwY/t
90sGx1Y2IgRZa/ferY11WxQAdhfi3SHM3Oj/HXzt9VErPpj4FWEDCyoAdzbURjmD
jwwAQ1fUipzuEGdiKrSILcDnL0ugAy6ZvtKdsg3Ri5xOOhtVoFMOvXOFk4DBLysc
083VdMlqbXMFZVk2Tc4fC4k3RRXVwwrEjElgE/6ZMS5yCIUkHI7S5OyR0JlSOClw
6oVPfgIFcHlwotwrFcpz
=Ih97
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
