From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH 3/3] ARM: tegra: trimslice: initialize PCI-e only when running on TrimSlice
Date: Wed,  2 Mar 2011 14:34:06 +0200
Message-ID: <d1b23ad517ea85ba85262c05d15a41508f78a8a3.1299068166.git.mike@compulab.co.il>
References: <cover.1299068166.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1299068166.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Currently tegra_pcie_init is effectively called as subsys_initcall. With
multiplatform kernel this may cause hangs on boards that don't intend to
support Tegra2 PCI-e. Ensure that TrimSlice board code initializes PCI-e
only when actually running on the TrimSlice.

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/mach-tegra/board-trimslice.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-tegra/board-trimslice.c
index 0f3081a..7be7d4a 100644
--- a/arch/arm/mach-tegra/board-trimslice.c
+++ b/arch/arm/mach-tegra/board-trimslice.c
@@ -79,6 +79,9 @@ static __initdata struct tegra_clk_init_table trimslice_clk_init_table[] = {
 
 static int __init tegra_trimslice_pci_init(void)
 {
+	if (!machine_is_trimslice())
+		return 0;
+
 	return tegra_pcie_init(true, true);
 }
 subsys_initcall(tegra_trimslice_pci_init);
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
