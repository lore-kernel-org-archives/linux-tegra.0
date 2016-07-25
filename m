From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Flicker with fb on Jetson TK1
Date: Mon, 25 Jul 2016 16:21:51 +0200
Message-ID: <20160725142151.GP21170@ulmo.ba.sec>
References: <20160725020234.GA25839@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bd2KlmcTHfsQFEJ+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160725020234.GA25839-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Bd2KlmcTHfsQFEJ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 24, 2016 at 07:02:34PM -0700, Martin Michlmayr wrote:
> Running X with fb on the Jetson TK1, I get a flicker on the monitor
> from time to time.  I don't think I need to do anything to trigger it
> (such as moving the mouse).  It just happens from time to time.
>=20
> I don't have the right X patches for nouveau, so X is using fbdev
> which I guess means the tegra-drm driver.
>=20
> This is with mainline u-boot (2016.07-rc1) and mainline kernel (4.6).
>=20
> I uploaded a video in which you can see the flicker several times
> (e.g. at 0:03, 0:16 and 0:28):
> http://www.cyrius.com/tmp/tk1/

What version of X do you use? Recent versions, I think starting with
1.18, the modesetting driver is built-in and is what you should use with
Tegra (and on top of an DRM/KMS driver, really).

The problem with fbdev is that it doesn't do double-buffering and hence
you can often see the kind of tearing as in the video. The modesetting
driver (which is also available as xf86-video-modesetting pre-1.18) can
do double-buffering (and I think will do by default), hence removing
the cause of such tearing.

Can you try running the test with the modesetting driver and report if
you're still experiencing the issue?

Thanks,
Thierry

--Bd2KlmcTHfsQFEJ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXliB/AAoJEN0jrNd/PrOhCYEP/1wR7c4bHF+evuR1+OAxfmXC
uCJkrnue+y3SRTr15ZvcIJAoVlRjqLNfhDssGIBOxXRIWmrzUlMXob03ryZpNwT/
9QlMk2qpSEdjnM/qawSfF4WwhZVANNUm/CWAO/7DDLhnlEyArr3wzXHhWx9FTnkq
9wk6ev1YOb9W/M9agXfz6RkmXFG7cxrXS6xOyyRKxzD3vR0MQAn8NEHn/kNXjxsC
g8a73Vn7wT4UgyiEtUuZQjFwWdEfiBYl4PhgSCOFa7XQ2kO3Whl7mvJ1CWHDA5FP
tm6I1E8khpnDuP1fnIDmxytTD351Fue1xQ754QQwYT78tNhCATq/r/uPVBxJ3rcf
6+mWuA2KBiMpADwlOwTIq5i8662q5ooaWojsBpgTw/nj36C8wuFi5EPBzdndkrQR
0UjnFuUGN8NW+iAkozqrk79r5vqzuHf6awKCYfwZQy4W9WtSCTBnipURlEeqEZSr
qg0PJQnNnJ9b3w4w4IaLGUIVY58pqLGOkiy+COZ7Cop9Xo9sDcYxj06505uCJOhw
6bT7pzWJdaTLyUHfGs3PCkua2FegtcBtvmHwlhrdU3NAGa/Z5zki5DIz+etWtvpp
ZRNuBGOh8bFxTSnyjMEYkvITYk6APHXcGjGeWGMN+K27YHcH2BWLYXpcPypP8DZ4
BqwXkH9esksgJBvolA3y
=Nj2H
-----END PGP SIGNATURE-----

--Bd2KlmcTHfsQFEJ+--
