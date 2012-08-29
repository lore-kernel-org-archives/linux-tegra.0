From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/2] dma: tegra: make data used as *of_device_id.data const
Date: Wed, 29 Aug 2012 10:51:35 +0200
Message-ID: <1346230295-15898-2-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20120829084911.GE28643@pengutronix.de>
 <1346230295-15898-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346230295-15898-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, djbw-b10kYP2dOMg@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

=46rom: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Since of_device_id.data is declared as a pointer to const data a few
more consts can be added in this driver.

[ukl: split Laxman's patch to prevent warnings in the middle of the
series. Original patch was sent with msgid
1346217447-19730-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Acked-by: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dm=
a.c
index 29a39b8..56adcfc 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1166,14 +1166,14 @@ static void tegra_dma_free_chan_resources(struc=
t dma_chan *dc)
 }
=20
 /* Tegra20 specific DMA controller information */
-static struct tegra_dma_chip_data tegra20_dma_chip_data =3D {
+static const struct tegra_dma_chip_data tegra20_dma_chip_data =3D {
 	.nr_channels		=3D 16,
 	.max_dma_count		=3D 1024UL * 64,
 };
=20
 #if defined(CONFIG_OF)
 /* Tegra30 specific DMA controller information */
-static struct tegra_dma_chip_data tegra30_dma_chip_data =3D {
+static const struct tegra_dma_chip_data tegra30_dma_chip_data =3D {
 	.nr_channels		=3D 32,
 	.max_dma_count		=3D 1024UL * 64,
 };
--=20
1.7.10.4
