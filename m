From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC PATCH 2/3] PCI: tegra: generate proper configuration access cycles
Date: Mon, 26 Oct 2015 19:02:13 +0800
Message-ID: <1445857334-6936-3-git-send-email-jszhang@marvell.com>
References: <1445857334-6936-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445857334-6936-1-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tinamdar-qTEPVZfXA3Y@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Inspired by Russell King's patch[1], I found current tegra also has the
same issue of "reading 32-bits from the command register, modifying the
command register, and then writing it back has the effect of clearing
any status bits that were indicating at that time" as pointed out by
Russell. This patch fix this issue by using the pci_generic_config_write.

[1]http://www.spinics.net/lists/linux-pci/msg44869.html

Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 81df0c1..d926e3e 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -483,7 +483,7 @@ static void __iomem *tegra_pcie_conf_address(struct pci_bus *bus,
 static struct pci_ops tegra_pcie_ops = {
 	.map_bus = tegra_pcie_conf_address,
 	.read = pci_generic_config_read32,
-	.write = pci_generic_config_write32,
+	.write = pci_generic_config_write,
 };
 
 static unsigned long tegra_pcie_port_get_pex_ctrl(struct tegra_pcie_port *port)
-- 
2.6.2
