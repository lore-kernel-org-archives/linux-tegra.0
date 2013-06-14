From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Fri, 14 Jun 2013 23:26:47 +0200
Message-ID: <20130614212646.GA31650@manwe>
References: <1370680435.24531.12.camel@localhost.localdomain>
 <68C7110D-C493-4A1F-8011-5F9259C2F4E7@m3y3r.de>
 <1370707552.1829.4.camel@antimon.fritz.box>
 <2572002.IOA8y0azF4@ax5200p>
 <1370767921.2283.8.camel@localhost.localdomain>
 <20130612105002.GA1940@manwe>
 <EF2DBD80-3DDD-416F-935C-E48261BF6CF5@m3y3r.de>
 <20130614203722.GA31138@manwe>
 <C2E8F821-5848-4FC0-992C-385D48611324@m3y3r.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <C2E8F821-5848-4FC0-992C-385D48611324-VsYtu1Qij5c@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2013 at 10:59:00PM +0200, Thomas Meyer wrote:
> Am 14.06.2013 um 22:37 schrieb Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
[...]
> > I think I've seen a similar issue
> > when that's not loaded, in which case DRM will turn off all outputs
> > because there's nothing to display. Alternatively you could try to run
> > an X server using the xf86-video-opentegra or xf86-video-modesetting
> > drivers. That should definitely get you output on HDMI.
>=20
> I did login blindly on tty2 and started xfce using the open tegra driver,
> but still no hdmi output. I can send you the Xorg log file if you want
> to.

Yes, Xorg output would be good. Additionally, dmesg output might help.
Don't forget to pass drm.debug=3D0xf on the kernel command-line.

> Xfce seems to run correctly, as far as I can see all necessary processes
> are running. The monitor I connect to the hdmi is an dvi monitor using
> an dvi to hdmi adapter, so no sound is connected. But that shouldn't be
> a problem.

Audio over HDMI isn't working yet anyway.

Thierry

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRu4qWAAoJEN0jrNd/PrOhKDEP/idumyjbH7510sm5uibuGPuw
vuvh+eB1rY7vp84XGSuIQKi36EJ5ejrFlwEAw4779cq8m8t9bnwE9pUM24dV+ZGv
vlV19xHRtwQoGJnnYzw7VGvXHEezRlHqVeMoTygbbfowBYM2lrKxKLxurrWmHEr0
qJXnFDexeKKGHj01arnGNa1z62asVCdoy3E6hA9dgQ2l690LQiI9d/bdcU59AaMN
yD7c5pNvYYUscz2tIToossFgbWCY7Vu+HhLZvmAk4CA8iAglHVwGQOlf6Gf5QmDB
BVcDoJAo65tH/WqQaniIib0Ml3PldTG0C+4DeEF+x+KXBuLrpEHu34WhJcVhZFwq
CXMulrc8DcQd4+v32GG4fxwdHPD2gqRKMWFCz/ESP2iQ4d7LNS+/aG8rDy6VwHoi
PMB2X1JKsXfJw944TN22+mOSRa6D1cj7kJcOk8cioBrKYOyC7pbgWf377jVuzwTw
l3wL29wRMvgxHllNo/XMnOKk95Dq0aWOi4BX1hHi+RVPbLKhycMihB2mWeFh0JWc
1WC9DXrDz87HCGxL19ayBRSsiK/QOSvIu69A7Q/W5SuAKcxqfKX15+CZXloDaMVQ
465lp43vQ5a4lJHiW5ziJIDi/lsFc2TfbpI9c5nooPvSV+94o6B+ZkSB9C/iY0wQ
cL4kCBjNjs7F5/DY5rjr
=dmXw
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
