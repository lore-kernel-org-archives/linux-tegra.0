From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Wed, 17 Jul 2013 06:39:41 +0200
Message-ID: <20130717043939.GB11359@mithrandir>
References: <2572002.IOA8y0azF4@ax5200p>
 <1370767921.2283.8.camel@localhost.localdomain>
 <20130612105002.GA1940@manwe>
 <EF2DBD80-3DDD-416F-935C-E48261BF6CF5@m3y3r.de>
 <20130614203722.GA31138@manwe>
 <C2E8F821-5848-4FC0-992C-385D48611324@m3y3r.de>
 <20130614212646.GA31650@manwe>
 <1371289066.3792.2.camel@localhost.localdomain>
 <20130615094319.GB2157@mithrandir>
 <1371308577.2480.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371308577.2480.6.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2013 at 05:02:57PM +0200, Thomas Meyer wrote:
> Am Samstag, den 15.06.2013, 11:43 +0200 schrieb Thierry Reding:
> > On Sat, Jun 15, 2013 at 11:37:46AM +0200, Thomas Meyer wrote:
> > > Am Freitag, den 14.06.2013, 23:26 +0200 schrieb Thierry Reding:
> > > > On Fri, Jun 14, 2013 at 10:59:00PM +0200, Thomas Meyer wrote:
> > > > > Am 14.06.2013 um 22:37 schrieb Thierry Reding <thierry.reding@gma=
il.com>:
> > > > [...]
> > > > > > I think I've seen a similar issue
> > > > > > when that's not loaded, in which case DRM will turn off all out=
puts
> > > > > > because there's nothing to display. Alternatively you could try=
 to run
> > > > > > an X server using the xf86-video-opentegra or xf86-video-modese=
tting
> > > > > > drivers. That should definitely get you output on HDMI.
> > > > >=20
> > > > > I did login blindly on tty2 and started xfce using the open tegra=
 driver,
> > > > > but still no hdmi output. I can send you the Xorg log file if you=
 want
> > > > > to.
> > > >=20
> > > > Yes, Xorg output would be good. Additionally, dmesg output might he=
lp.
> > > > Don't forget to pass drm.debug=3D0xf on the kernel command-line.
> > > >=20
> > > > > Xfce seems to run correctly, as far as I can see all necessary pr=
ocesses
> > > > > are running. The monitor I connect to the hdmi is an dvi monitor =
using
> > > > > an dvi to hdmi adapter, so no sound is connected. But that should=
n't be
> > > > > a problem.
> > >=20
> > > btw. switching the mode with
> > > $ xrandr  -d :0 --output HDMI-0 --mode 1680x1050
> > >=20
> > > makes the external monitor output the display correctly...
> > >=20
> > > also switching to the highest possible resolution works after the fir=
st
> > > mode switch:
> > > $ xrandr  -d :0 --output HDMI-0 --mode 1920x1080
> >=20
> > So perhaps the default configuration chosen at startup isn't one that
> > tegra-drm can properly deal with. Can you provide the output of
> >=20
> > 	$ xrandr --query
> >=20
> > run immediately after booting (that is with the default configuration
> > before you make it work by setting a 1680x1050 mode).
>=20
> sorry, I wasn't able to get the infos. xrandr refused to connect to the
> X server spawned by lightdm but I don't know why. Maybe some missing
> Xauthority or something like that.
>=20
> But I got these infos, after a fresh boot:
>=20
> $ fbset -i
>=20
> mode "1920x1080"
>     geometry 1920 1080 1920 1080 32
>     timings 0 0 0 0 0 0 0
>     accel true
>     rgba 8/16,8/8,8/0,0/0
> endmode
>=20
> Frame buffer device information:
>     Name        :=20
>     Address     : 0x1a100000
>     Size        : 8294400
>     Type        : PACKED PIXELS
>     Visual      : TRUECOLOR
>     XPanStep    : 1
>     YPanStep    : 1
>     YWrapStep   : 0
>     LineLength  : 7680
>     Accelerator : No
>=20
> $ fbset -i -fb /dev/fb1
>=20
> mode "1024x768"
>     geometry 1024 768 1024 768 16
>     timings 0 0 0 0 0 0 0
>     accel true
>     rgba 5/11,6/5,5/0,0/0
> endmode
>=20
> Frame buffer device information:
>     Name        : udldrmfb
>     Address     : 0xe0dbc000
>     Size        : 1572864
>     Type        : PACKED PIXELS
>     Visual      : TRUECOLOR
>     XPanStep    : 1
>     YPanStep    : 1
>     YWrapStep   : 0
>     LineLength  : 2048
>     Accelerator : No
>=20
> When I add the boot option "video=3DHDMI-A-1:1680x1050" I get a working fb
> console even while booting up. Later on I can start X manually and then
> X switches to 1920x1080 and everything works okay.

Hi Thomas,

This fell off the table. I discussed a similar issue with Marc on IRC
today. The issue, IIUC, seems to be that with HDMI connected, the system
comes up and when X starts it tries to find the best match amongst the
various combinations of video modes on all existing heads in an attempt
to clone the desktop to all outputs. It turns out that this causes the
HDMI output to be configured with a resolution we don't support on Tegra
because the clock can't provide the right frequency.

There may be reasons (which I'm not aware of) for X to behave the way it
does. It also points to an issue that we should be more clever within
the kernel to flag as bad all the modes for which we can't provide a
proper clock. I will have to look into that.

In the meantime I think Marc had some success setting up a more useful
output configuration using xrandr. Perhaps he can provide more
information on exactly what he had to do to make this work and you
(Thomas) can try to reproduce whether that gets you a usable system.

Thierry

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5iALAAoJEN0jrNd/PrOhlx8P/jQjqnwoOl8gckv34IEfPVCC
BOc+4kv55fViemKAHyKElfPd3Fy3Q9zPaEGGs+K/twIbYeq9yyt2Yr2Y/oPoYiRt
6UazM1JxGxODeLq/TJ/u9s0LESeY1rGX4qYEdKqHacV+hi5/AIiEafiUCl/JTNTb
njmqgx56HI9kRd9EaEHzWqEVnB50M1Ba776Zl1nHUtULuxWlrf6ZKf0DFMoStxlW
6bYO78tuqHgvX3XEWj4Qrg4KRx7SgDTjS0Jk8lUgPqo3/a39vCmnlty/Iht8m9o5
X60uJ0+x78/X4GFo6RWuM/52XpN3649jjnmOu3cqM6oW/e3hFRwzX3ERi8kaJq+K
AzE+z2anP1PslNee7SoxqdgMoeEGCOCIYLrDaJU2DcitR0vwPE003SDWzFCDXRWl
l8FZhcH0VKGwlpMZsz5YW47Yw8VlrvSV2ww8EJfvFE8Z3erDyI4ciH0oqE6l4pl7
EHd26yJrGBFamPBaXxY9klhCL7gikP60gxW3rFnwQodXjpdAct876HxEZMhbyvAM
e9l8mNANSOxXs9crbWQcpvDPqZuVu8HTLlpf0sa2acrHRCOVAJyJVdCDXQQlAdKj
bcRXdU05Mvo5jFanbgL1Xh9htZXBpp0syRT5xOgOVw4d/9mp9okSDHuZ0fVtxn0A
euxv29/yHYVLxITtnb8p
=sd36
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
