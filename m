From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Sat, 15 Jun 2013 11:43:19 +0200
Message-ID: <20130615094319.GB2157@mithrandir>
References: <68C7110D-C493-4A1F-8011-5F9259C2F4E7@m3y3r.de>
 <1370707552.1829.4.camel@antimon.fritz.box>
 <2572002.IOA8y0azF4@ax5200p>
 <1370767921.2283.8.camel@localhost.localdomain>
 <20130612105002.GA1940@manwe>
 <EF2DBD80-3DDD-416F-935C-E48261BF6CF5@m3y3r.de>
 <20130614203722.GA31138@manwe>
 <C2E8F821-5848-4FC0-992C-385D48611324@m3y3r.de>
 <20130614212646.GA31650@manwe>
 <1371289066.3792.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371289066.3792.2.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2013 at 11:37:46AM +0200, Thomas Meyer wrote:
> Am Freitag, den 14.06.2013, 23:26 +0200 schrieb Thierry Reding:
> > On Fri, Jun 14, 2013 at 10:59:00PM +0200, Thomas Meyer wrote:
> > > Am 14.06.2013 um 22:37 schrieb Thierry Reding <thierry.reding@gmail.c=
om>:
> > [...]
> > > > I think I've seen a similar issue
> > > > when that's not loaded, in which case DRM will turn off all outputs
> > > > because there's nothing to display. Alternatively you could try to =
run
> > > > an X server using the xf86-video-opentegra or xf86-video-modesetting
> > > > drivers. That should definitely get you output on HDMI.
> > >=20
> > > I did login blindly on tty2 and started xfce using the open tegra dri=
ver,
> > > but still no hdmi output. I can send you the Xorg log file if you want
> > > to.
> >=20
> > Yes, Xorg output would be good. Additionally, dmesg output might help.
> > Don't forget to pass drm.debug=3D0xf on the kernel command-line.
> >=20
> > > Xfce seems to run correctly, as far as I can see all necessary proces=
ses
> > > are running. The monitor I connect to the hdmi is an dvi monitor using
> > > an dvi to hdmi adapter, so no sound is connected. But that shouldn't =
be
> > > a problem.
>=20
> btw. switching the mode with
> $ xrandr  -d :0 --output HDMI-0 --mode 1680x1050
>=20
> makes the external monitor output the display correctly...
>=20
> also switching to the highest possible resolution works after the first
> mode switch:
> $ xrandr  -d :0 --output HDMI-0 --mode 1920x1080

So perhaps the default configuration chosen at startup isn't one that
tegra-drm can properly deal with. Can you provide the output of

	$ xrandr --query

run immediately after booting (that is with the default configuration
before you make it work by setting a 1680x1050 mode).

Thierry

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRvDc3AAoJEN0jrNd/PrOhaJkQALWJ2gPoTtzR/iKObhIlOzkH
Y3jTjvpr68UGpBxI1Ir7yCZPRme7QB8Hg2K/JjAhEQVVzrjEYjYKyXm5uW1WjfZW
9I5ZP6KqTpgp7O0f0pzzkXsYJP19x4vhf/3gdYPn0uIg+AiCQHOUiyi3UMU+ZvIu
CVVGIW4wB31hs9UxOo1RJ1N0PimaS+q4JWYWRRDBQSVi5isIS2JyNZ74D1Fb1qVm
8tXZpBrG1XECL/G7uw3WgPhRMCkfBby0c4JwZIPWSjffEV3eyziga3FzrEqjhrH1
vNxIIYvcPtL1yXXINsizSJf+Mov8mq0NBDBaZ9d9+fwi1om9x6TGpsQCcPwj4oke
oF6uq44cyf88orqHneXbp/DIfGj923YiBNmPLXlIPbkpAjbwJP+xc/YL6hDebMbC
0ESJZzwNP1vdHENoDaNO+ItzzRsbVE6SDW6hv6yihmRhotduMuS5d4MMldGOiakE
jTVMuU5mSCFKQb68VyAC89QjzZAVGDQWzupTNruw0faebrvdtqMa50DgKFU6Fjcr
VZEabNz0Tl1lbxjbrDCClic9TBlEAm36NtQZEfKMjPGEQBMF0TLVjbQ4iEYsaSpd
SjDY2ncBOGVXhqOeJLgoYK6d98fhC2Aln/M2ONn2Lm0CV3kL1JFv9jXVawOEELWx
XA1azdrrBPhesUC2GnMJ
=uE59
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
