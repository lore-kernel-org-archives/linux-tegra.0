From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Fri, 14 Jun 2013 22:37:23 +0200
Message-ID: <20130614203722.GA31138@manwe>
References: <1370680435.24531.12.camel@localhost.localdomain>
 <68C7110D-C493-4A1F-8011-5F9259C2F4E7@m3y3r.de>
 <1370707552.1829.4.camel@antimon.fritz.box>
 <2572002.IOA8y0azF4@ax5200p>
 <1370767921.2283.8.camel@localhost.localdomain>
 <20130612105002.GA1940@manwe>
 <EF2DBD80-3DDD-416F-935C-E48261BF6CF5@m3y3r.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <EF2DBD80-3DDD-416F-935C-E48261BF6CF5-VsYtu1Qij5c@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2013 at 08:27:00PM +0200, Thomas Meyer wrote:
> Am 12.06.2013 um 12:50 schrieb Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>=20
> > On Sun, Jun 9, 2013 at 10:52 AM, Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org> wrote:
> > [...]
> >> oops! I think everthing did always work correctly! But somehow Fedora =
19
> >> fails to spawn a getty on the tty1/fb0 console... so I just did see a
> >> black screen :-)
> >=20
> > Just to confirm. This isn't a tegra-drm issue, but rather Fedora 19 not
> > spawning getty? Or is something in tegra-drm causing getty to fail? That
> > would be surprising, but I'm trying to figure out if I need to
> > investigate or not. =3D)
> >=20
> Hi,
>=20
> Please forget the getty thing as it was nonsense. The tegra hdmi driver s=
eems to work, once it decides to output a signal. I was somehow able to tri=
gger this the last time, but I don't know how to reproduce this.
>=20
> So when I boot with the hdmi monitor connected all I get is a blank scree=
n with no backlight ( I'm talking about the external hdmi monitor here, not=
 the LCD panel!)
>=20
> And some unknow thing (load of a module? Loading udl driver? Restarting g=
etty?) seems to trigger that the tegra hdmi driver starts to output a valid=
 hdmi signal and the external monitor shows the tegra hdmi framebuffer cons=
ole.
>=20
> The ac100 is otherwise up and running and I can ssh into it.
>=20
> Any ideas?

Do you have the fbcon driver loaded? I think I've seen a similar issue
when that's not loaded, in which case DRM will turn off all outputs
because there's nothing to display. Alternatively you could try to run
an X server using the xf86-video-opentegra or xf86-video-modesetting
drivers. That should definitely get you output on HDMI.

Thierry

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRu38CAAoJEN0jrNd/PrOhuPoP/3pKIC+cABMyjbEgdS25A2ca
dg5lCS4i99VuR7FyoXkNYaTxIg5w1cu9tXRnu/rKhogU0EjwofydqV1ILGDTs6r+
KslO3DReRs/egHtv4cTVvKKFJUmPwu2EVJE4XAoLaUnINGbjoJt6UuuScw+4IJcP
klW6kw11GCThr95sq75tz2fyW3xzPg+n5mH8UIuDnUx/Gjn3wbXDWz/xdoqB1l3A
l2bQKoonDDXg9QhXUCdNU5z88YtcOBrwwet/EnFM9YXnuHBS0aK80Rjw2hwTkrOY
Rb0mk46gHWYosvipuj3GT36HisagxPBqPKZPKMcBISIjd3+dNMiExewdapMV72PD
LG3By4eYDR43r8JpqSTaV+15q0AR0B1oXHtJ0ExYlDJ/n59VPhAAxzg5rdbS88IH
7lcwyrkH66vBG+hkvmut6dpsg86RXSlPsc/BT9PzxtFyF4YfGXo/ZJ8MzSz8G9SQ
NCREhJxd06W7de12Wh61/Whxd7tn2kTCXGy7YJgo7uXYbDDxRONLLhGr8hUQfDNc
nWQ0uuTwZi6XOqOxKBXrIUyTVYwhNN6cdJWA1RhYXxKXjglOKljMHQVMPGuxuXis
v+LJkoSlYbilhp1Ac9Ckqm8dAlL+s9ml0D7h/qQo5+Kl2EKFwJYMLo8hL3Y8QeNO
ptL8PVAkFVLfJHVfmm2O
=N1re
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
