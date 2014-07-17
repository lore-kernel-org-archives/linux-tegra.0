From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Thu, 17 Jul 2014 13:01:12 +0200
Message-ID: <20140717110110.GI17877@ulmo>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <17053542.QUGvfkeRmc@wuerfel>
 <20140716151427.GA22027@ulmo>
 <6322144.IB6iKDb6TK@wuerfel>
 <20140716185715.GA4843@mithrandir>
 <20140717085308.GQ23218@tbergstrom-lnx.Nvidia.com>
 <20140717090156.GR23218@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QDIl5R72YNOeCxaP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140717090156.GR23218-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--QDIl5R72YNOeCxaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2014 at 12:01:56PM +0300, Peter De Schrijver wrote:
> On Thu, Jul 17, 2014 at 10:53:08AM +0200, Peter De Schrijver wrote:
> > On Wed, Jul 16, 2014 at 08:57:16PM +0200, Thierry Reding wrote:
> > > * PGP Signed by an unknown key
> > >=20
> > > On Wed, Jul 16, 2014 at 05:22:03PM +0200, Arnd Bergmann wrote:
> > > > On Wednesday 16 July 2014 17:14:29 Thierry Reding wrote:
> > > > > >=20
> > > > > > Ok, I'll have a look. I think when this becomes a separate driv=
er, it
> > > > > > should also have its own header file, so maybe you can in the m=
eantime
> > > > > > make it a local header file in mach-tegra until we have found a=
 good
> > > > > > place for it.
> > > > >=20
> > > > > Why do you think it should be a separate header? We already have a
> > > > > couple in include/linux and I'm not sure it's useful to add even =
more.
> > > > > If anything I would've thought it made sense to move the content =
of the
> > > > > other headers into tegra-soc.h.
> > > >=20
> > > > I very much dislike the idea of having a per-vendor header file that
> > > > everything gets crammed into. We should try to have proper subsyste=
ms
> > > > and generic interfaces for these wherever possible.
> > >=20
> > > I completely agree. However spreading the SoC-specific functions acro=
ss
> > > multiple header files isn't going to help. If we keep all the per-ven=
dor
> > > APIs in one file it makes it easier to see what could still be moved =
off
> > > into a separate subsystem.
> > >=20
> > > Now for PMC specifically, we've investigated converting the powergate
> > > API to power domains. I don't think it will be possible to make that
> > > work. The issue is that there's a defined sequence that needs to be
> > > respected to make sure the device is powered up properly. That sequen=
ce
> > > involves the primary clock and reset of the device. It's been proposed
> > > to make these clocks available to the PMC driver so that it can contr=
ol
> > > them, but then we can't make sure that clocks are really off if they
> > > need to be, since we have two drivers accessing them. The only way I =
see
> >=20
> > resets do not have reference counts, so they can be controlled by a
> > powerdomain driver without any problems. For clocks, there would only be
> > a problem for the module clocks if the drivers don't use runtime PM. If
> > we move all drivers to runtime PM, the clock control can move into the
> > powerdomain code and runtime PM will ensure domains are not turned off
> > with active modules.
> >=20
> > > to make that work reliably is by moving complete control of the
> > > powergate into drivers so that they can make sure clocks and resets a=
re
> > > in the correct states.
> > >=20
> >=20
> > Which won't work if you have domains which contain several modules.
>=20
> We also need to control the memory clients in the domains using
> MC_CLIENT_HOTRESET_CTRL.

Oh, great. More interdependencies...

Thierry

--QDIl5R72YNOeCxaP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTx6z2AAoJEN0jrNd/PrOhy14P+gNQWoQMybrgWvkoiNsV5hWV
voAMpluPJXXcudKM+82z7rXYemdo2heeJev7jQm/gMrJyARWxFzSBvAzS/HdB7ne
nrp8QN/kzB5acVfXUYVZtNXnzUulo2Dp5zgCUn71vArvWfxMyfKS9lHSJn7VArbh
kofzg978iyaczy9fU7INAuVbl8/eG44Cr9+yjqHhxZQxfUa/U8eRNGR7GC/8U6YM
8vXHOXrL/xelKsyKuZbk6TVCSjtAmbuxUJvhIiGCfQ6QMrjtp5ss2ZqBNwpsgN24
U1cZQAgKw99f1WebP/d2DxKyVtAn2mOymMaMaSLFZ91EJS9DhvMjpzbwFPZHuzfi
dvG1jCCsq06lX5nies1nhtbmoKaD7lc42AxfnskRMLdE8Ne6t6BlMXi2w8z7cjLm
GPeEY+mZLIiq3OVqJaGbO3vvNNDMzdqykBZ1NycSRdvuelD5giSn2wA6w9JoMzIb
UMQcn5sST73WET/AW/hPTnTzv8B/9DOe7OmqGmnJPLBnjKHDdJi3guuuYYLtDWOc
O5ZjzeiXGIfciT3xOsUlK/6JEAYZ8z4OuaRDv5LfqaAdrDF300t6eTGq4nbzI2wF
i5RC3G3wkuTP16D+IjgK/88MK57yGIJGPeNwQQF+7IbzGz8D1INoCzaLrBUH086z
RV8Gj31++P+6CmJ9q1B5
=7pG2
-----END PGP SIGNATURE-----

--QDIl5R72YNOeCxaP--
