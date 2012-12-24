From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 4/7] ASoC: tegra: add function to set ac97 rate
Date: Mon, 24 Dec 2012 16:00:12 +0000
Message-ID: <20121224160011.GN30837@opensource.wolfsonmicro.com>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de>
 <1355959056-6009-4-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0aF+6pWUK5w8WdCh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1355959056-6009-4-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0aF+6pWUK5w8WdCh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 20, 2012 at 12:17:33AM +0100, Lucas Stach wrote:
> AC97 uses a fixed rate, unrelated to the sample rate. Add a function to
> make the setup more trivial.

Applied, though the above isn't strictly true - a number of later AC'97
CODECs had PLLs which allowed them to use non-standard AC'97 MCLKs.

--0aF+6pWUK5w8WdCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ2HwCAAoJELSic+t+oim9524QAId1598ELwH4jiSLr1i/znqk
ND/EP9VJG/ERFTD3FPbykV29iEdMAPB/N4B2xGhYiutBMLrORmGvWv9lRKo7kcEC
bHyKH3Vv3RYpTNiycNlEaBjQkFFzVI0eti4WmVkiMDN1pRItk66D7q9RwvSF+xDo
CZnJzxMIwsS9gD1AQgsJoX9sZpe1eDa3ReBSxwWHoVVfv6Ii4sF6I+iumE1Ok6Gf
VkCpdLt5sZYOBRQEXhmxyPgwpBLDIwF+d7QvF/yhb4lv+XNhNu1d8I4oDLWaZ/d9
agpAmTCDIRcfsuELuod7xh3n/tBNH6yw3cvKLrV5+dn9ZsBSjJs2mvkxq/VSBAPZ
GLHUasZ+50gne/zaGERCxWAeb0e1KFQ3drlE7McigCZhWdUfTsMsQapFnlCpcAkV
iCOvinzV40Dg6TE5n6iW44hrimKGnYLJmZCozO82kMz+j9WJ3ByDOzsPUUUxNye3
KgA/T971ixDGlbNzW2toPTHUWQvqAESTEcsOxUSGJXu16w4CDu4IA4IBR9S07jj8
9cZHQ/bDA4feI95AVDg1uD9VK2EVxmSrjNLlkP6Tg6ljCbHLB1vybiF3tSO8Zjl8
lHtilSyN0cU4KpzD06uCLz+7t26U4ApqWg3K8bCqczcwogAnMw+L/iDTfJ50SeJH
tHveDvKqdnxqP0m69R3W
=nhxM
-----END PGP SIGNATURE-----

--0aF+6pWUK5w8WdCh--
