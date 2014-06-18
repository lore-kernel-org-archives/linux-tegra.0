From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: add MODULE_DEVICE_TABLEs
Date: Thu, 19 Jun 2014 01:27:01 +0200
Message-ID: <20140618232651.GI26514@mithrandir>
References: <1403126355-16236-1-git-send-email-swarren@wwwdotorg.org>
 <20140618215058.GA26514@mithrandir>
 <53A210DE.80704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kr14OxHsRwZHHqxS"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53A210DE.80704@wwwdotorg.org>
Sender: stable-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--kr14OxHsRwZHHqxS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 04:21:18PM -0600, Stephen Warren wrote:
> On 06/18/2014 03:51 PM, Thierry Reding wrote:
> > On Wed, Jun 18, 2014 at 03:19:15PM -0600, Stephen Warren wrote:
> >> From: Stephen Warren <swarren@nvidia.com>
> >>
> >> When tegra-drm.ko is built as a module, these MODULE_DEVICE_TABLEs all=
ow
> >> the module to be auto-loaded since the module will match the devices
> >> instantiated from device tree.
> >=20
> > I vaguely remember doing something like this a while back and getting a
> > bunch of link-time errors. But I assume that you've tested this, so I
> > must be remembering wrongly.
>=20
> Were the problems due to:
>=20
> a) Simply building the tegradrm driver as modules.
>=20
> I vaguely recall some runtime issues with tegradrm as a module, but I'm
> not sure about build issues. I don't think this patch could make this
> any worse.
>=20
> b) Building as modules works, but adding MODULE_DEVICE_TABLE broke that.

I think it was this variant. Although adding MODULE_DEVICE_TABLE also
broke building the driver as builtin module. I think the issue was that
the linker was complaining about some symbol being defined multiple
times. But admittedly this was a long time ago, so I'm not sure that my
memory is entirely accurate.

> This seems unlikely since *many* module in the kernel have a
> MODULE_DEVICE_TABLE...
>=20
> Certainly, with this patch applied, building tegradrm as a module in
> next-20140611 works out just fine, and the code runs fine too. Building
> tegra_defconfig (which has tegradrm builtin) on Linus' master with this
> patch applied also works out fine.

Okay, sounds good then. I'll do some build testing to see if I can
reproduce the errors, otherwise this looks good to me.

Thierry

--kr14OxHsRwZHHqxS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJToiBBAAoJEN0jrNd/PrOh224P/RCgBN5vtxmaT/yoNq0a267A
/hVh+h0irKRCRxqySTTV9hdnhnndWEr16qabEj2bHZwJE07QHcGA/q9LaYBOYgn2
oD9mVHZXy4MQbvdSk2rMjLjkdau0DVtXjmEZLKuYc+EUdNpPCHbgiyndMhDMZi7U
slzGnV7taXU4sA8y9mH8RUrLDs8q/6egD3ov2ipe/iUIeSja4zdSsCUvO5XPXtKd
LZc1+eXx97uyBl592c6XujRHZuij43ICxVdsje6WQNraw7QvMnyaX1rIG6SxDEfD
Eop+CVTGzd/JMrMdxJChDo3VCVCbW6ouCs+M6jYj4+HsVhEEp8QE7LMFB9ri5pS1
5vfP0Cuspra48eSgFCqlnC/frOIw4pUGGjepMpbsLFRl71/vLmHGYtJqoYJ1IwQG
KeI9pdZ6+o4U4qKOFa57lz4n0ETn7HM/OSSHTwwj5kyYphSm9sca/E8F/r+CBlE1
2RboSx1an1PiEWkWZ0P/ykLLaPbza6+mMxmKN6f+rkU0zrvfR9W64qmki/V0rcoP
pgDjqp+2mcNUhZHLpvUJ0qenim4Euqj0nIyAE3IZ6JIlH1nc/OBUAU9nxsSYwreS
ldgXWduB/VhjeRHTlgnlxiR9AzqfmbymORSUvJvY0W/bgsNfijgDaIax8gB+CgNF
i14W2h8yA9PPTBUeYUAz
=hhSc
-----END PGP SIGNATURE-----

--kr14OxHsRwZHHqxS--
