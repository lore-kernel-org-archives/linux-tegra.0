From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V4 2/2] regmap: add regmap_bulk_write() for register write
Date: Sun, 12 Feb 2012 13:11:05 +0000
Message-ID: <20120212131101.GA3395@opensource.wolfsonmicro.com>
References: <1329036556-15408-1-git-send-email-ldewangan@nvidia.com>
 <4F37A925.90507@metafoo.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F37A925.90507@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 12, 2012 at 12:57:25PM +0100, Lars-Peter Clausen wrote:
> On 02/12/2012 09:49 AM, Laxman Dewangan wrote:
> > [...]
> > +	} else {
> > +		for (i = 0; i < val_count; i++) {
> > +			memcpy(&ival, val + (i * val_bytes), val_bytes);

> This will have endianess issues. You'll need something like regcache_get_val.

> > +			ret = _regmap_write(map, reg + i, ival);

Or just don't provide this fallback at all - it's not something the
underlying device supports anyway and none of the other block or bulk
operations work on these devices either.

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPN7pfAAoJEBus8iNuMP3dRSkP/jP2XBSfyY5w5/DGxko5oBjm
FSQE6eKTIQhXJ2ZkXxunFCubTPY/QkNnjrAHdBsuSc0FIVwee1ofxufYUBuytVpx
aFyp4Ck70a9HZadXK540MMmZV/iCaIY4s1kTwOxqrNEtWsoBwjnU2HIZc/uSQc3m
yrToGXQnmbERHeN8j75Y3RFF9FPw7tajZKgvapuS4GOiL4xvcIbM2zRbJJylifXh
ol4SIKwnw5Nm9qjpgS/577PjCzx2SgXFcvU/QAZz6Pu1umxYM7j46LpfsQiC49a9
wkE/eSQsb+uQ72R/b97b6d2v3AXylJzHaoIx+0ptsagyOVYuAfrGTvdfFmvae8Jm
Mtv9Wxw3HuxT5fEbtg8wyUU7bWWT5Av0SRct46hlcO/Wt0FnFnfGsgapOh+0ZjeT
4UFH3oCQgz/IRZ+gtQhZnseAaNuHGupdNXJa2OwvNALR/x0CpM13trz3n0A1Sgd+
rbW7zaMdSouQgSs7IZ7ThaDgb6E5xUg2c1g0qAZTkGQcKFzd7xx8zBzKmd1J+300
GIuIBqNX+yTSfwYgs08pCpivf6pGbXcxK/CFS6XyGEGSNCQE5Flt34lQTtv5nCtA
n2Y6bXBzsKny7JRbM09cIiiZcnP/nPCLsIEKXToESA9HLUMLL+6KGSjgoN4SY6TV
DeTgvJAOvBHrPS/4rL2J
=3Uyj
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
