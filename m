From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] regulator: tps6586x: add support for input supply
Date: Sun, 15 Jul 2012 22:21:15 +0100
Message-ID: <20120715212114.GI4041@opensource.wolfsonmicro.com>
References: <1342187432-18668-1-git-send-email-ldewangan@nvidia.com>
 <1342187432-18668-3-git-send-email-ldewangan@nvidia.com>
 <20120713142229.GM4215@opensource.wolfsonmicro.com>
 <500057A0.1050108@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <500057A0.1050108@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "ccross@android.com" <ccross@android.com>, "olof@lixom.net" <olof@lixom.net>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "lrg@ti.com" <lrg@ti.com>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>
List-Id: linux-tegra@vger.kernel.org


--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 13, 2012 at 10:45:12PM +0530, Laxman Dewangan wrote:

> I was thinking that 1/2 should also go through your tree to avoid
> any functionality break on existing platform who are using this
> regulator.

I'd be happy to do that if the ARM people are happy with it; just let me
know and resend the patch if you want me to apply it.

--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQAzQ+AAoJEBus8iNuMP3d0WAP/A5PwYChGg8POUqZiQEyxdGC
5uyLG81AvkS2vz5WNVktM/fM55mudtHScY09kpa1pz1fn3won7qZFYnm5C9VHQEF
GlLktGRGc5jG7rFivlEbdrUDaB7qDhBIHTD45b1hkUTPxm26/cZEDXXNqx4TKSe1
32ELootKEnQdvrmRSJt9/Wha5wLHMk00jgRWXAWivYvuY33bk7wxyrQGoNkxvHT3
rkdDYAmu77370+s2u6lzPs7+gMRwaFBZCc9o1T3FYqZSxp/RBDc3vRVXKp5MtePh
KiIJk1Xt1XEnEHY6nE8xo68B7rMeRSzo3xu3AT0vAGGP7xcn5Van2RJaQXEuWkI+
xSaCrQYZBo9jIvFVhS+5TV8bomykQKrVEceeKqOn9MHJZAkjm9B5GAsJ7rZnj4vX
Uw+/U4HxO6DP3o/d2V2j8jjCg8GpTe7iUr0ZMPLNSGQxDfJrpfmDMHz6lFjdSY6+
ZRfPbqAa6n6eTj8HCqifkhVXET+yW9LBmRT2i2kD7nUa7okZBA9wFw2Xax8MZLqP
aUaReVNmrauotO6aysNGDVKjGaCl/pGTtIo5PUtzZ6IzSmIZKGiBh89n7ZwiI0v2
dLpC6b6YVqtFgurmBssaPkSjkO6Vr9SL1kpF1cCLaIXFyWcoG7iTMD/ql+gP9l0/
0zFMJHAGRdycz77C1jO3
=7Z0V
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--
