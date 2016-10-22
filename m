From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/5] soc/tegra: pmc: Simplify IO rail bit handling
Date: Sat, 22 Oct 2016 20:23:53 +0100
Message-ID: <1477164236-29351-3-git-send-email-jonathanh@nvidia.com>
References: <1477164236-29351-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477164236-29351-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The function tegra_io_rail_prepare() converts the IO rail ID into a
bit position that is used to check the status and control the IO rail
in the PMC registers. However, rather than converting to a bit position
it is more useful to convert to a bit-mask because this is what is
actually used. By doing so the BIT() marco only needs to be used once
and we can use the IO_DPD_REQ_CODE_MASK when checking for erroneous rail
IDs.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index c99580aabcf6..6a6df6e8bfd6 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -913,13 +913,13 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
 {
 	unsigned long rate, value;
 
-	*bit = id % 32;
+	*bit = BIT(id % 32);
 
 	/*
 	 * There are two sets of 30 bits to select IO rails, but bits 30 and
 	 * 31 are control bits rather than IO rail selection bits.
 	 */
-	if (id > 63 || *bit == 30 || *bit == 31)
+	if (id > 63 || *bit & IO_DPD_REQ_CODE_MASK)
 		return -EINVAL;
 
 	if (id < 32) {
@@ -979,9 +979,9 @@ int tegra_io_rail_power_on(unsigned int id)
 	if (err)
 		goto error;
 
-	tegra_pmc_writel(IO_DPD_REQ_CODE_OFF | BIT(bit), request);
+	tegra_pmc_writel(IO_DPD_REQ_CODE_OFF | bit, request);
 
-	err = tegra_io_rail_poll(status, BIT(bit), 0, 250);
+	err = tegra_io_rail_poll(status, bit, 0, 250);
 	if (err) {
 		pr_info("tegra_io_rail_poll() failed: %d\n", err);
 		goto error;
@@ -1010,9 +1010,9 @@ int tegra_io_rail_power_off(unsigned int id)
 		goto error;
 	}
 
-	tegra_pmc_writel(IO_DPD_REQ_CODE_ON | BIT(bit), request);
+	tegra_pmc_writel(IO_DPD_REQ_CODE_ON | bit, request);
 
-	err = tegra_io_rail_poll(status, BIT(bit), BIT(bit), 250);
+	err = tegra_io_rail_poll(status, bit, bit, 250);
 	if (err)
 		goto error;
 
-- 
1.9.1
