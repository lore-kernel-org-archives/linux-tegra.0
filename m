From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 9/9] ARM: tegra: Default configuration updates for
 v4.3-rc1
Date: Wed, 19 Aug 2015 12:33:06 +0200
Message-ID: <20150819103305.GF26627@ulmo>
References: <1439563720-13189-1-git-send-email-thierry.reding@gmail.com>
 <1439563720-13189-10-git-send-email-thierry.reding@gmail.com>
 <CANMBJr7PKy-eCcB3HiBajpApHS_BYPa7xfKjTqV4o8Z1hwY99A@mail.gmail.com>
 <20150819091358.GA26627@ulmo>
 <1439977724.4135.90.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ChQOR20MqfxkMJg9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439977724.4135.90.camel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ChQOR20MqfxkMJg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2015 at 11:48:44AM +0200, Sjoerd Simons wrote:
> On Wed, 2015-08-19 at 11:14 +0200, Thierry Reding wrote:
> > On Tue, Aug 18, 2015 at 03:30:41PM -0700, Tyler Baker wrote:
> > > Hi Theirry,
> > >=20
> > >=20
> > > This isn't where the story ends unfortunately. The collabora lab=20
> > > also
> > > has a jetson-tk1, booted in the same manner, which boots next
> > > -20150818
> > > fine[4]. The only differences I can spot in the two boot logs is=20
> > > that
> > > the collabora board is using an older version of u-boot, where as=20
> > > my
> > > board is using a newer version. U-Boot 2015.01-00231-gab77f24-dirty
> > > (Good) vs U-Boot 2015.07-00130-gb217c89 (Bad).
>=20
> Our 2015.01-00231-gab77f24-dirty is 2015.01-00231-gab77f24 + changes
> which got merged as 053b86e6d8e50359412e626c33bae3f7bafd74dd in
> upstream u-boot.
>=20
> Fwiw:
> $ git show 2015.01-00231-gab77f24
> commit ab77f24119e80257de4ab017b877f92f96980562
> Merge: d928664 fa58b10
> Author: Tom Rini <trini-l0cyMroinI0@public.gmane.org>
> Date:   Thu Jan 15 14:05:31 2015 -0500
>=20
>     Merge branch 'master' of git://git.denx.de/u-boot-ti
>=20
> Which is definately a commit you should hae in your upstream u-boot
> tree.

Yeah, I suck. I was running:

	$ git show gab77f24

I didn't know git could parse the full output from git describe.

> > I don't have either of those commits in any of the U-Boot trees I=20
> > have.
> > Perhaps whatever tree this comes from has local patches that cause=20
> > the
> > breakage? The version that I use a recent upstream U-Boot with some
> > local patches, none of which should impact Jetson TK1 in any way.=20
> > Just
> > to make sure I tried running latest origin/master, which identifies
> > thusly:
> >=20
> > 	U-Boot 2015.10-rc2-00040-g0f9258228e2b
> >=20
> > And that boots next-20150818 fine.
>=20
> Probably worth for tyler to test that u-boot commit on his jetson to
> see if that solves the issue he's having...

I've tried reconstructing the version that Tyler is running by checking
out 2015.01-00231-gab77f24 and applying 053b86e6d8e5 ("pci: tegra: Fix
port information parsing") on top, but that also leaves me with a
bootable system, so no way of reproducing. I agree that upgrading to a
more recent U-Boot version sounds like the best way forward because it
has already proven to work on at least two setups.

Thierry

--ChQOR20MqfxkMJg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV1FthAAoJEN0jrNd/PrOhFkwP/RrUg0V99sOqU+z6/GE5jc/I
CGTI3WZ9LPh/kx9PF2q43Q/hwmojjLsvQ81NhC2LJA6pNXnnaGbNYEFueb1v7brf
1r6lTVgvoxKr5CtLkXjpfG/5CDiSJE0kRQPomSoDx2GVBm6mgWVZgcNWFOMbg9wK
ZoHGX02D1x8fajICo+jDpMX5xgr+RAICKlrnHHvx2h+FoN/ylmeKm42X7L3nS9sp
Idct5fXUw7LWt8KUMdDWG7xqARMDa8z6FczPy44sg/VHz5wBKOUt90A/DSezXdZq
MbTh3E+RyAFwCzq93+1pKs7TYJ/VcCgyAMN5GmXugR1Z+whc4SKeakmJU8xNN4oa
lGKAbXlvrZ8PkyTuBb+lT2e4Y8wh3qg/xvhLuh7zyg9i3p5rKe7wHXALL9g5ZuKy
ic0SU1WPmVL/MKjOZ0OZaRXOTjw6DNxvhn+CbwIghbyvM4qnf46nqgLzMVaY2+RI
I3qmnxuShGGosfBkuIOTG3G+6UlOT8WE0ysgiSAHmT0sm+XHf+SrY22baAhyilWf
3M4X/a86y+Wf/SJmumfq0YHPHM6h13Chj1/FHR59T7GwjF1o5vhhhI85OeUfG3BA
9IowUNcoIiVhQ3FPywEFRo9g5CgjE8bzxiuiePLp+xySOYUImcCuDYnAAWK69l9s
3dNJNOuEaYV95cRM9BcC
=m6yS
-----END PGP SIGNATURE-----

--ChQOR20MqfxkMJg9--
