From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix PCIe resource calculation
Date: Wed, 25 Jul 2012 12:02:38 -0600
Message-ID: <1343239358-3239-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Commit 0acc43c "ARM: tegra: use fixed PCI i/o mapping" re-numbered the
resource array entries that the driver used, but missed one location. This
causes request_resource() to fail, and the driver to panic.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Rob, I'm not sure if you can squash this into your PCIE commit, or if
we need to apply it on top?

 arch/arm/mach-tegra/pcie.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
index 576347a..3463fb5 100644
--- a/arch/arm/mach-tegra/pcie.c
+++ b/arch/arm/mach-tegra/pcie.c
@@ -406,7 +406,7 @@ static int tegra_pcie_setup(int nr, struct pci_sys_data *sys)
 	pp->res[1].name = pp->prefetch_space_name;
 	if (pp->index == 0) {
 		pp->res[1].start = PREFETCH_MEM_BASE_0;
-		pp->res[1].end = pp->res[2].start + PREFETCH_MEM_SIZE_0 - 1;
+		pp->res[1].end = pp->res[1].start + PREFETCH_MEM_SIZE_0 - 1;
 	} else {
 		pp->res[1].start = PREFETCH_MEM_BASE_1;
 		pp->res[1].end = pp->res[1].start + PREFETCH_MEM_SIZE_1 - 1;
-- 
1.7.0.4
