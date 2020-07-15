From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] usb: tegra: Fix allocation for the FPCI context
Date: Wed, 15 Jul 2020 12:38:42 +0100
Message-ID: <20200715113842.30680-1-jonathanh@nvidia.com>
References: <20200712102837.24340-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200712102837.24340-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Commit 5c4e8d3781bc ("usb: host: xhci-tegra: Add support for XUSB
context save/restore") is using the IPFS 'num_offsets' value when
allocating memory for FPCI context instead of the FPCI 'num_offsets'.

After commit cad064f1bd52 ("devres: handle zero size in devm_kmalloc()")
was added system suspend started failing on Tegra186. The kernel log
showed that the Tegra XHCI driver was crashing on entry to suspend when
attempting the save the USB context. On Tegra186, the IPFS context has a
zero length but the FPCI content has a non-zero length, and because of
the bug in the Tegra XHCI driver we are incorrectly allocating a zero
length array for the FPCI context. The crash seen on entering suspend
when we attempt to save the FPCI context and following commit
cad064f1bd52 ("devres: handle zero size in devm_kmalloc()") this now
causes a NULL pointer deference when we access the memory. Fix this by
correcting the amount of memory we are allocating for FPCI contexts.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Fixes: 5c4e8d3781bc ("usb: host: xhci-tegra: Add support for XUSB context save/restore")

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

Changes since V1:
- Corrected commit message
- Added Thierry's ACK

 drivers/usb/host/xhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 9ce28ab47f4b..014d79334f50 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -856,7 +856,7 @@ static int tegra_xusb_init_context(struct tegra_xusb *tegra)
 	if (!tegra->context.ipfs)
 		return -ENOMEM;
 
-	tegra->context.fpci = devm_kcalloc(tegra->dev, soc->ipfs.num_offsets,
+	tegra->context.fpci = devm_kcalloc(tegra->dev, soc->fpci.num_offsets,
 					   sizeof(u32), GFP_KERNEL);
 	if (!tegra->context.fpci)
 		return -ENOMEM;
-- 
2.17.1
