From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: Register SoC device
Date: Tue, 22 Aug 2017 13:19:22 +0200
Message-ID: <20170822111922.GA15965@ulmo>
References: <20170817144217.31346-1-thierry.reding@gmail.com>
 <61dde661-313f-0b51-233b-ce957c514a55@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <61dde661-313f-0b51-233b-ce957c514a55-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 11:15:21AM +0100, Sudeep Holla wrote:
>=20
>=20
> On 17/08/17 15:42, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Move this code from arch/arm/mach-tegra and make it common among 32-bit
> > and 64-bit Tegra SoCs. This is slightly complicated by the fact that on
> > 32-bit Tegra, the SoC device is used as the parent for all devices that
> > are instantiated from device tree.
> >=20
>=20
> This seem to be in linux-next and causing the below splat on my platform
> which is not Tegra :)
>=20
> WARNING: .... at drivers/soc/tegra/fuse/tegra-apbmisc.c:48
> tegra_get_chip_id+0x30/0x40
> Modules linked in:
> CPU: 2 PID: 1 Comm: swapper/0 Not tainted
> 4.13.0-rc6-next-20170822-00008-g52a8e57512ae #13
> task: ffff8009768a0000 task.stack: ffff000008038000
> PC is at tegra_get_chip_id+0x30/0x40
> LR is at tegra_get_chip_id+0x30/0x40
>  tegra_get_chip_id+0x30/0x40
>  tegra_soc_device_register+0x68/0xd0
>  tegra_init_soc+0x10/0x44
>  do_one_initcall+0x38/0x120
>  kernel_init_freeable+0x184/0x224
>  kernel_init+0x10/0x100
>  ret_from_fork+0x10/0x18

Indeed. Does the below patch fix this?

Thierry

--- >8 ---
=46rom 5706cacc2af5e4ef138d1cd9e1269ca4947a447f Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Tue, 22 Aug 2017 13:15:18 +0200
Subject: [PATCH] soc/tegra: Restrict SoC device registration to Tegra

Commit 8a46828e623c ("soc/tegra: Register SoC device") added an initcall
to register the SoC device on Tegra. However, that code is unrestricted
and will run on all platforms, causing unwanted warnings.

Fix this by first checking that we're running on hardware that supports
the fuses block that we use to provide SoC information.

Fixes: 8a46828e623c ("soc/tegra: Register SoC device")
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/f=
use-tegra.c
index 02686378dfc1..161522bd98ac 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -349,8 +349,16 @@ early_initcall(tegra_init_fuse);
 #ifdef CONFIG_ARM64
 static int __init tegra_init_soc(void)
 {
+	struct device_node *np;
 	struct device *soc;
=20
+	/* make sure we're running on Tegra */
+	np =3D of_find_matching_node(NULL, tegra_fuse_match);
+	if (!np)
+		return 0;
+
+	of_node_put(np);
+
 	soc =3D tegra_soc_device_register();
 	if (IS_ERR(soc)) {
 		pr_err("failed to register SoC device: %ld\n", PTR_ERR(soc));
--=20
2.13.3


--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmcEzcACgkQ3SOs138+
s6GzfA//V5O0gfyf7Qy++KMrWRRI55+wAOR8z6WWWmUFBwfWa2K8HH1OzBynumUb
Insmgx0iwfpXguC3G1HzqLr95Kwq/IMhMQhqIrEqViWj2GRkpIqKg7GmFsTQ19Xd
zfhS99CnJpaklDPuypgnP1xpbNXxp4FT9jtjj1aRo0SXqzMbcE86RVTLzzDBDS4I
pnDdGTebV7qoczAqqrRH1Vsh5NZUtFXHdOLx4SzpVoFzIfhwswyo7DmewzmcrQPz
pu8s9VDVy6aABGtQVcCTwK2IbJeK3SLAEsuwT9HTmwwYxoe+JLZJZzEYht46yfTE
VYNkeHdgTLGlSu75Jae8Pq/btoSrohlx6ZwA3iH7x9Xqw9PuOdob3g8UZ0JWf63R
D3xvEIbiuLDrzEZKbQCMjGvxVIAIrlxSa+WY1tDcj9RV4vSOE7NbXdYNlnMq1hND
6gy3qLnH/My63TN2doJ2+i8j5a+P1wWnzWPiGau+gDGkcJFqeLtD02It8RU+A4ps
0pBmGjtyieGpUhVKirl6wkyDOwBjmmuJy+BEvatI047d+i1igmxrPpy5w8h1tWCG
qx/W3QwHA/7YIVsm2xlQIpX+ufavBXcGcEkn+rCxCTGwe98j7kw/ULkX5lLVS1Sc
psmYF6VWZRMNhRvE29l1CFKFaOHVPVcI4iwEOwf+dR9rPcDRwvU=
=g/cs
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
