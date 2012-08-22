From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: harmony: add regulators
Date: Wed, 22 Aug 2012 20:07:15 +0100
Message-ID: <20120822190714.GF7995@opensource.wolfsonmicro.com>
References: <1345186799-18229-1-git-send-email-ldewangan@nvidia.com>
 <502E9B09.3080800@wwwdotorg.org>
 <502EA1AC.4090205@wwwdotorg.org>
 <50327242.80103@nvidia.com>
 <50327897.5030601@wwwdotorg.org>
 <20120820175410.GI26991@opensource.wolfsonmicro.com>
 <50327D2D.6000509@wwwdotorg.org>
 <20120820181432.GJ26991@opensource.wolfsonmicro.com>
 <503283F8.4070808@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S3Smgu5mAIHx+YOO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <503283F8.4070808-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--S3Smgu5mAIHx+YOO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 20, 2012 at 12:37:44PM -0600, Stephen Warren wrote:
> On 08/20/2012 12:14 PM, Mark Brown wrote:

> > Why not just pull the patch in via the regulator tree?  The idea
> > of merging the entire regulator drivers branch into the Tegra tree
> > doesn't seem awesome...

> I think that'd end up causing some annoying conflicts with other
> changes that also touch arch/arm/match-tegra/board-dt-tegra20.c.
> Perhaps they're manageable; they probably aren't that bad, but it
> seems better to avoid them.

Ugh, right.  I guess I'd best rebase the commits out of the drivers
branch.  Can you let me know what you depend on and I'll build a
mergable branch for you to pull in?

--S3Smgu5mAIHx+YOO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQNS3QAAoJEFJkBDiqVpZ4NeUQAIQ26K+HJniVBP4D8OtQuJ99
Xk9G6gmCb+3xC7X2FmfCwGNRJk6HLN2TN7Ll/bMB4UOe9jgrheZY8mS2ygKKmYZL
GXxEiZHIZrZjzOh7+lWpekg0feKFKFjHUnHJX/KFdoVdwlM14n4N/FPvajxTKF5M
Eue66FsGkeBgxnYg/CyLc951dz6ESIDbmQFkk0MWvkLoDT2K7StGftYmx7tCWpxY
nPauc4av3XZI6v5n1Cfkhkcem6iPs6ej5RxT/LyYThoiS9LuQhFO15R40Vhyn9CX
Y4yad42F8QsYKdUiVumJsfa/pxUa/Y0ZipOFNw57ByVyZ2FDQQxwMDW1qyG/pKEh
WJJJh0+Ne+fCEnK/vYxuV/8O/J5pyQYXf2LgcvNJlCdQ00fqp/JnTlLU2e6luvr6
nZ7daoVZ8aF4OpL/47xZBaIqWgnHlFI7TGSd9liq3nf7vTDxKk1U8cTkC+au0Szn
/M1CuMmeG1kRPoIBov+Coc5pkWdFlf+hq/MJaSaTJEYYne/HFv2nRld/xJJTjGAT
l0Ad4NK6Iuo3qxqYySnR0QX5iu6LjP2cd3y+ZIKsiIWEK2FtKHVZz7dUpxJGMpSK
DpRk6IoqiY1Y7Uin2sycDebugoRej5e3DzBVHbi11BC3tpGFi2tKWAUg/ymlMkw2
HchdMlul7L7B6s6QlVV5
=5PqI
-----END PGP SIGNATURE-----

--S3Smgu5mAIHx+YOO--
