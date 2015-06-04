From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] memory: tegra: mc: add the Tegra210-specific client ID
 bitmask
Date: Thu, 4 Jun 2015 19:40:30 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1506041935460.12316@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


The MC subsystem in Tegra210 uses a longer bitmask for the
MC_ERR_STATUS.CLIENT bitfield.  Define that in the SoC-specific data
for Tegra210 so the MC code can use it.

Note that this patch does not apply to mainline in its current form.  
This patch is against linux-next 20150602, plus the "memory: tegra: mc: 
add support for a variable-size client ID bitfield" patch that I just sent 
to the linux-tegra mailing lists, plus Thierry's Tegra210 MC patches.  
Thierry's patches can currently be found in commit 
c8bb81c3b132c9b3c1859cde3d7005ad8ab13862 ("CHROMIUM: memory: tegra: Add 
Tegra210 support") of the chromeos-3.18 branch of 
https://chromium.googlesource.com/chromiumos/third_party/kernel (but which 
is undoubtedly headed upstream).

This patch is based on work by David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

Have done a quick build test on this internally, but not much else.  I 
expect Thierry to add this to his T210 MC set before posting it for 
upstream consumption.

 drivers/memory/tegra/tegra210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 5561a338d36b..40f5bffa1f8b 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1087,5 +1087,6 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra210_mc_clients),
 	.num_address_bits = 34,
 	.atom_size = 64,
+	.client_id_mask = T210_MC_ERR_STATUS_CLIENT_MASK,
 	.smmu = &tegra210_smmu_soc,
 };
-- 
2.1.4
