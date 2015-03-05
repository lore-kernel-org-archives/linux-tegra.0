From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: fix platform_no_drv_owner.cocci warnings
Date: Thu, 5 Mar 2015 17:08:06 +0000
Message-ID: <20150305170806.GU21293@sirena.org.uk>
References: <201503050334.H4jPvCBg%fengguang.wu@intel.com>
 <20150304193739.GA91196@athens.lkp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1KbtIL0gAKpEK4a6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150304193739.GA91196-2yRetTFTapcuUoWeoHoyuFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Anatol Pomozov <anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1KbtIL0gAKpEK4a6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2015 at 03:37:39AM +0800, kbuild test robot wrote:
> sound/soc/tegra/tegra_rt5677.c:334:3-8: No need to set .owner here. The core will do it.

Applied, thanks.

--1KbtIL0gAKpEK4a6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU+I11AAoJECTWi3JdVIfQBw4H/2BpV00MMYcng0bQ6YzAgD1K
KQ8wyxEXT/mbE8AvKJrifLVjx+TEbVIOUI4X4kuE/ZtHrAGDWhQi5sRb/QY3VIld
KvbjwTuwid/BCFjLnkUHkkhPMLLKhlNg6F8a91Sj+ftcU9bjWjna1fID/uy5FcTg
EKBRT5pAcbJR+5PYQYGaug2EluwXc8dbLvKmK2pFtNFsXTXnNSMHnt6GBLYP3xdY
6H5Y9ukEj/D8HVGSu6uj/WDwLqkscMUY0bF9aC3zNvizzT8fiwfRSQ5LaO3WbEz5
OyRGwfz+asLTOv40JpJSeG2rSuUSPSC9DxchOOlba571HjqwQfMZPRWnJRPtR4Q=
=FbT6
-----END PGP SIGNATURE-----

--1KbtIL0gAKpEK4a6--
