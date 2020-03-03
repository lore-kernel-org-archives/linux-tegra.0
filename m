From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V5 1/5] soc/tegra: bpmp: Update ABI header
Date: Tue, 3 Mar 2020 23:40:48 +0530
Message-ID: <20200303181052.16134-2-vidyas@nvidia.com>
References: <20200303181052.16134-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200303181052.16134-1-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org
Cc: kishon-l0cyMroinI0@public.gmane.org, gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Update the firmware header to support uninitialization of UPHY PLL
when the PCIe controller is operating in endpoint mode and host cuts
the PCIe reference clock.

Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V5:
* None

V4:
* None

V3:
* Added Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

V2:
* Changed Copyright year from 2019 to 2020

 include/soc/tegra/bpmp-abi.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index cac6f610b3fe..8f8e73e5cd45 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2014-2018, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #ifndef _ABI_BPMP_ABI_H_
@@ -2119,6 +2119,7 @@ enum {
 	CMD_UPHY_PCIE_LANE_MARGIN_STATUS = 2,
 	CMD_UPHY_PCIE_EP_CONTROLLER_PLL_INIT = 3,
 	CMD_UPHY_PCIE_CONTROLLER_STATE = 4,
+	CMD_UPHY_PCIE_EP_CONTROLLER_PLL_OFF = 5,
 	CMD_UPHY_MAX,
 };
 
@@ -2151,6 +2152,11 @@ struct cmd_uphy_pcie_controller_state_request {
 	uint8_t enable;
 } __ABI_PACKED;
 
+struct cmd_uphy_ep_controller_pll_off_request {
+	/** @brief EP controller number, valid: 0, 4, 5 */
+	uint8_t ep_controller;
+} __ABI_PACKED;
+
 /**
  * @ingroup UPHY
  * @brief Request with #MRQ_UPHY
@@ -2165,6 +2171,7 @@ struct cmd_uphy_pcie_controller_state_request {
  * |CMD_UPHY_PCIE_LANE_MARGIN_STATUS     |                                        |
  * |CMD_UPHY_PCIE_EP_CONTROLLER_PLL_INIT |cmd_uphy_ep_controller_pll_init_request |
  * |CMD_UPHY_PCIE_CONTROLLER_STATE       |cmd_uphy_pcie_controller_state_request  |
+ * |CMD_UPHY_PCIE_EP_CONTROLLER_PLL_OFF  |cmd_uphy_ep_controller_pll_off_request  |
  *
  */
 
@@ -2178,6 +2185,7 @@ struct mrq_uphy_request {
 		struct cmd_uphy_margin_control_request uphy_set_margin_control;
 		struct cmd_uphy_ep_controller_pll_init_request ep_ctrlr_pll_init;
 		struct cmd_uphy_pcie_controller_state_request controller_state;
+		struct cmd_uphy_ep_controller_pll_off_request ep_ctrlr_pll_off;
 	} __UNION_ANON;
 } __ABI_PACKED;
 
-- 
2.17.1
