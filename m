From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V2] regulator: fixed: Support for open drain gpio pin
Date: Mon, 2 Apr 2012 23:18:54 +0100
Message-ID: <20120402221853.GL3160@opensource.wolfsonmicro.com>
References: <1331116113-22565-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KSn4sQg3MnruwCB4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331116113-22565-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewanagn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KSn4sQg3MnruwCB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 07, 2012 at 03:58:33PM +0530, Laxman Dewangan wrote:
> Adding flag on fixed regulator board configuration structure
> to specify whether gpio is open drain type or not.

Applied, but I had to fix up some conflicts caused by other development
that had happened in the meantime.  Please check that I resolved those
correctly.

--KSn4sQg3MnruwCB4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPeiXDAAoJEBus8iNuMP3d8UAP/Rv0ZqYn01KvbRnE/jjs2gvb
mOtl/j1YuiW8aobYhyWKucN3mV1Bn49WSvpddQboim/3eMzKfuwMJHhouK/4eyZ4
n5iWe4QY7MqLcE5fR9W90Hx0xbbAahKZXIF1/GaPTDC8fYi7N5r9SKpOQTj4cEbp
DpoQcwUhnsceaP8Edm5oV7WBAgwPIguwex1RAclVmQH444C3s1M4pZYh0WngFmRf
Aj7cmIo98vX40kiW9PVh0jobCsXxTwRLg0q6j5RiZGwdOR0yM3ClRMx2rXZ5LMRq
PhjdGXclgHMgL7CfHDPSuw+a4uo2OsZkvdcyW5Sf4fJ21F3OOtAwRyfxCzVnnNNZ
JkB/tJKZPdoo2TX8dTAraF6RDqGf9cj8zJ+Pcuf7fzTpk/TUiTTLLIVg36I9lpYD
ywipfdxBvQlpb+o43CEkuBoznuZB04jxMdz+TflDxaBi4BK3OgHTRWMLMhCBmAEX
2e11c8kmnhmVGKxjD1SvYFy9AL/2zhPbxqkGuFr7LCcYUl0ByDWy4NO2xbrCeRI5
l9/BU633gS+UN4ON9JzUE0zWaLHTdNUhG3qVexjFUOmIJDlGr/0i7To/Na113BRN
fQ1fV6S4ioPe1loitn/WIgC1mVdkROQ53Tgd9jQ81v3YYYpx3tQyFD1Hh38uhAty
oDVdsmehaVDYSqshb7yP
=IcyQ
-----END PGP SIGNATURE-----

--KSn4sQg3MnruwCB4--
