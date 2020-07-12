From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] usb: tegra: Fix zero length memory allocation
Date: Sun, 12 Jul 2020 11:28:37 +0100
Message-ID: <20200712102837.24340-2-jonathanh@nvidia.com>
References: <20200712102837.24340-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200712102837.24340-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

After commit cad064f1bd52 ("devres: handle zero size in devm_kmalloc()")
was added system suspend started failing on Tegra186. The kernel log
showed that the Tegra XHCI driver was crashing on entry to suspend when
attemptin the save the USB context. The problem is caused because we
are trying to allocate a zero length array for the IPFS context on
Tegra186 and following commit cad064f1bd52 ("devres: handle zero size
in devm_kmalloc()") this now causes a NULL pointer deference crash
when we try to access the memory. Fix this by only allocating memory
for both the IPFS and FPCI contexts when required.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Fixes: 5c4e8d3781bc ("usb: host: xhci-tegra: Add support for XUSB context save/restore")

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/xhci-tegra.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 014d79334f50..b2e4e1c128b0 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -851,15 +851,21 @@ static int tegra_xusb_init_context(struct tegra_xusb *tegra)
 {
 	const struct tegra_xusb_context_soc *soc = tegra->soc->context;
 
-	tegra->context.ipfs = devm_kcalloc(tegra->dev, soc->ipfs.num_offsets,
-					   sizeof(u32), GFP_KERNEL);
-	if (!tegra->context.ipfs)
-		return -ENOMEM;
+	if (soc->ipfs.num_offsets > 0) {
+		tegra->context.ipfs = devm_kcalloc(tegra->dev,
+						   soc->ipfs.num_offsets,
+						   sizeof(u32), GFP_KERNEL);
+		if (!tegra->context.ipfs)
+			return -ENOMEM;
+	}
 
-	tegra->context.fpci = devm_kcalloc(tegra->dev, soc->fpci.num_offsets,
-					   sizeof(u32), GFP_KERNEL);
-	if (!tegra->context.fpci)
-		return -ENOMEM;
+	if (soc->fpci.num_offsets > 0) {
+		tegra->context.fpci = devm_kcalloc(tegra->dev,
+						   soc->fpci.num_offsets,
+						   sizeof(u32), GFP_KERNEL);
+		if (!tegra->context.fpci)
+			return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.17.1
