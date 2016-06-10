From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix missing include <soc/tegra/cpuidle.h>
Date: Fri, 10 Jun 2016 16:22:10 +0200
Message-ID: <20160610142210.GN27142@ulmo.ba.sec>
References: <1465404897-16654-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GEn4szYucjS2InE7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465404897-16654-1-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GEn4szYucjS2InE7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2016 at 05:54:57PM +0100, Ben Dooks wrote:
> The prototype of tegra_cpuidle_pcie_irqs_in_use() is missing
> from the cpuidle.c file, it is defined in <soc/tegra/cpuidle.h>
> so add that include to avoid the following warning:
>=20
> arch/arm/mach-tegra/cpuidle.c:51:6: warning: symbol 'tegra_cpuidle_pcie_i=
rqs_in_use' was not declared. Should it be static?
>=20
> Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/arm/mach-tegra/cpuidle.c | 1 +
>  1 file changed, 1 insertion(+)

I've been carrying a set of patches to fix these, and a couple of other
sparse warnings, in my tree locally, but never sent them out because
they were so trivial. I probably should've to avoid the duplication of
effort. Sorry about that.

Thierry

--GEn4szYucjS2InE7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXWs0PAAoJEN0jrNd/PrOhPosP/1n/NCLGdV2YSnx2Kd068G6F
HLQ07fjWfJmUPcRMtonbn0GqxNIgK467EzP4she2/CCe6Q2TvIXrYw4cUMDvWgjW
PWh4EF75EDXA68SMgKDnX5WBTrJNadovCyFFf5XjLXz/9XYMp59sdHVR6dhob4JT
zT7siyHuz0vbQ2b1oF+EdAPwoPXF8jv355mvSpMWX3EQcQqS4L1I5eyZBLcYT4/L
jgOeVUlylf8Xr3vPj5xKxnb/xtOMxAsWreh45RRn3/1EJ03WkCOLV36fx5HnVyww
WaC3R0D7tGx//JiPkWRWMyp63Q3ueLVqQUEXBoGd9XWjv1IIzToho4GmGmc+IKfk
a2Ux+x7Yi5oeC1zbDVfbSBGzxnAJDpbwmk1YW0Ohpvj2jGnYSQalcLk28sd57JPt
fPExo+kTav889aaOgdAYjQBaZh/f2jXyXIj+TwQn1u+fc2syOTZ/fc5PHnYuaih6
EHJvR1Q38w37MOLSb/SdfJn0kmBkmahAyKjBJ2E7+3sKEGOp1k2+1+Rch93QRwmD
Bk/iN2Qw/evzp74pBEIBvKoCDqNxWNV4zV1n2/fZwKmzIVbH4FkzfQVYCfFzHQoT
SuIBdEgCdmNYAWKNfIl6O7iUXu+UsFdukJ7z6IXBlVTm/PEjoAQV2UsgbSV40X1g
ZfqEAA+VfZHX1Bc4CvLU
=Yy0W
-----END PGP SIGNATURE-----

--GEn4szYucjS2InE7--
