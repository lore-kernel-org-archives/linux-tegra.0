Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33573C1F5B;
	Mon, 10 Aug 2026 12:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366585; cv=fail; b=iMjp+nipHReV/jxdaVlsFO4/1xrUjFuoQox0n1vyHDCbMMCdgHV6h+f37WDaVyP0vmz1uRzlcfDNb4X602ioQddSXbdvlP10tzvMI5WcpGYby8yj9QDsQYTfADYTIFY/Cs2Bx7gRq5ix5GbWxSHfEiN0usn8/O0nD1i0cxHZ288=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366585; c=relaxed/simple;
	bh=+RB+5zQONlsOyVJ59Z8CoeA9XKLtgRLbs08m4era4iA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XOZ+OtfIOzQsWTLsziAZyLbEKo7QOJMA0pIM5yNZxfTnWQz7kiVEtWfhghg9TXNezTjCLwTVA5K/AHggVvCMr8p0FKG4ONVbpBdY7sLZXgz54QK5nQxURn4ybpkHtHeLosATWZbdThJqBOe/ENiosGwbAH+zpI3JdfTWDhGLO8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DDHNi951; arc=fail smtp.client-ip=40.107.159.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DDHNi951"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iV+v26rJRo5KmJv6u9xDlhr2wMggS8JsspKnhSbXSGLdJRKAGekNsMTGdOGuXNjwMu47bpb7CKTdYVkhb/RjCHNWHxEUA53YF72EeMqfKbQ3PUflizTN0k96pZ2QQLy7n/A+AC+jG0WCERQKtExV8Uu/0Kkamf1RzQPuBkI6f3q4UFfUYrS4HMVqICRkjuR6se6JFaRr1jZsVT16lL5yTK+ejc/heg8M3Gr6JorV1Jhjra2lBKlvi6LVYQ/GJxUEvgVCFB0fZ3NI6ctJ4rjuMb7pNPTk9D5uoGSO03uD029TZSFnk66d3s/X4cuzE23nsRaDwckuOKrfNUs+DBfI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PILt6OaGNnIbHzHM/pJ8xIZ86s+Ed+8Bp9CxzQWxkvs=;
 b=XylldmLEhNrCi/v374euXe49T2cjFtOzg5I6BT8oLy75C2XUaxUK4jddP8R+2QvK4Rd2Lp53GYYZV+g1fBRTXyXmRu94YIyVv+VuIowmL+MP8UlF25pl2Vu0/Pm8IpW9QO+ES8Yrok6XWDEepbRp1808H+7RP6qneWCZ94gq9/9rY1LSvOGgBtiHg5xUIyJmGIh/tuStn2r6SLjXgjiSs7tTOfKMFqjtqf3HG5AKXo/gTzs4S3BVUh/ToH8R+n29hdyzp/JCQSCuCMTI6QloiM7P8IxmiFVCyjxBUzm2TvNvagTdKUFSQ1spR6UhJBbjITitYO1II+aiVRl7EE4dwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PILt6OaGNnIbHzHM/pJ8xIZ86s+Ed+8Bp9CxzQWxkvs=;
 b=DDHNi951rRU6DHTIfqaxndt+rKOEpo/ZpY3oL7f02I3tU1xCTCyRImplMAx68HfHgE2HhiGO+oUIyFpKZhO7LXV4Tgmcav7F/df0AaN5+YXCNgcH5O1WOT5EfraAXK4QIpPbLQzVTPzUnOOlB7wzhyvOZkvWW9TZQKFLRY7Jm3Eav/r4XyrJ7YnK+kXCCU7t9HhmTQXm9VvHliK5iy/wYvg96LCIKjasrtU7SlUxA9wPyvgMue3qDfiM2JZLrOuj+BQvpq5mjCGpw3TgToSX8GT8AY5u8FxwhK0+ZCzs4Ymf6I497VtdlwlcfwOCPqhqN3ql6GLB/dJ20TL+hfxq+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI2PR04MB10572.eurprd04.prod.outlook.com (2603:10a6:800:27c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 12:56:18 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 12:56:18 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-usb@vger.kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v9 1/3] usb: add missing headers transitively included by <linux/phy/phy.h>
Date: Mon, 10 Aug 2026 15:56:12 +0300
Message-Id: <20260810125614.441667-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810125614.441667-1-vladimir.oltean@nxp.com>
References: <20260810125614.441667-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::17) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI2PR04MB10572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2f3582-0f30-4261-ce1d-08def6dec513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	UzB4P1hAmXecqYi3ehB1f4EoAvfkn1mO0Qp0YiEJheeFNF1LVQM2lhiiZZHJ3r8fCV2f0aQWQSqvWIeMggyc+TGEc+U3OiB/hRsc+U2NLA8p0F0WgtoxWWTO+ztQ5SC7pUzGjL7Y1dObsn/RoeuNBWAk7nj8ABk3Z8bDAdA5udLDyhKmfSwOfSpuZFXoQl2UZNKGXKrsFuxkFVOI4+xjlVNMWjwuZkriUGrmH6JtYZgp1n+pqZWEkpaKutq9ltbwrgPv5rVHsZLtL+i9oraLh7euVqBUr4tl0VH6GavxT7+SQZGqo3xPEj585NOuGSVVja02t01qYIUz00zhctwTBll+qlISegpC0tl7BK4IObd2mfLivCu7DwMXSgG/9idTFscIqnt37sHmUe9wCNPYK7GsulxHzNvoGHkMGD5wKiPuCvllzy5+XHmJPbQw5xyENWIp+A9X7s/kWZviirpgWj3EHmFXRIScHvOwTspRgQVjnI2QLL9Ft39k66E11TXWaZurAczrYKuEWhiX/BFHyj+8Y+n608GosJvT8y4GA1dEp+0yDLxbUtdyEdy9ZI7k9EV6IN5smuo0zGQBHDOnpEqe2QvwOQNKCzEOiMzCTyYX6v5pr5btuhofrquBmbbr4zp78kBsMKB8KW1PymgUaRGKm94alPQOuKmcKnCTkoQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K23eJBcjApobkOpbyc4s5ZFp4EVljQcgJzbWi5U6E8DS445E1KUO89s73Q8y?=
 =?us-ascii?Q?6niHXeCMbZNH+f6d4sj7ZWrKchfNh9qeEpkE/Z76lW3dwp9VdSUHeGi52j87?=
 =?us-ascii?Q?XHGKsLHNrjt4VlsS/1OV08dbmxaekvxRjzEUT0aoLrlc1SdkckDrNTbKjwNG?=
 =?us-ascii?Q?XEcYEyDBJJ7S+uY9ABH5ZC321RB2v/Vi+6Jf2AnY0WVb8BlPprM0dgtmkyg0?=
 =?us-ascii?Q?ny8uPaw5MgVdo/jibdu/jnxwg+qVo1bD/K9s1Lfx5yIaLDuoX7wmVPjUHNvB?=
 =?us-ascii?Q?iNHN68Zvn/bTA1gMzu425loBwgLx+ADCL95m+yzh/2QdUy55io0eDF+SHD19?=
 =?us-ascii?Q?dGdtXfRIyOJWJPrNBGwTGsN5fMe42diNyS5BmC4vgfWOacfVBCmK6NDd5nyN?=
 =?us-ascii?Q?EzqbS/rPP6G0IhZl9t8is1CwVv/YvFd/Rq5gLbVOt1lomwF55WqhJvRdcCPY?=
 =?us-ascii?Q?tu/1BXxL38Dz0iVF0cKeY7DeuOxStRGUbrCNSVUK3DlgC1mXBhPYcPNnclVX?=
 =?us-ascii?Q?FPjvM1bLed02RqA0G77pFfndgBgvdaOPB0SNb6oDrOwNtQZo9Sh5x4dC+qiG?=
 =?us-ascii?Q?IVmCbsD415V6VCEOK18g0cnKBO++46ojl4TqM8iz8cyK+ceYJ2pvY9yJ7MbC?=
 =?us-ascii?Q?InqtOwfsyItFAoFKO/4TH53mYf4xg79NboxLANyXYqByGyLhBv9KAsOIAgg/?=
 =?us-ascii?Q?YEUJPM72rpSUEFeLB1Gjaa1P/FLaz9H4NU9DezdmLmjbmxKV5lX2KgWTBpr0?=
 =?us-ascii?Q?6CNGz7fu/1PVBnPT7p3XO0gELbkCIWpI+4gKELJbqAt6N9cqeMzL6DdggJr8?=
 =?us-ascii?Q?sZLX/yypF3tWcKdFMBly8FMh0OAWj0rpRKyUHKRiOMXBx2mtHGyNqncNS7se?=
 =?us-ascii?Q?iu2KB6qQNYkYkN+NmwgdFk4TGX1Gf8IN9fWJHUuxc3QbdWDRBAchWdMwjiVd?=
 =?us-ascii?Q?4AvmOshS4JXcsFFhaul+/PaGxTWlrfmjra3Xy2hKOBGLPbbFpOwPYksnM5jA?=
 =?us-ascii?Q?bptS5WJNI9FRZJ1a4hkHAlT8anyzGxx11KMh9aPYuZhRMRTvuGZFVYbz8SLq?=
 =?us-ascii?Q?HQjUb1sZ0rgGeca8+adKjyB4I/XK/WvtjMauF7xiAcLYHWviAcmEVrVxb9Tw?=
 =?us-ascii?Q?GDdgGs1VBO0K8X18AzHppORvMJKibWwLHKG3Nb86KyBILiLs/H1PaZlp5tXt?=
 =?us-ascii?Q?xD/yM9b/wP5R4SzlyMzH7ZelIfmlY+GYyOI/f/kpg1++ysIpNpf5qWI2E3U4?=
 =?us-ascii?Q?SEqJ6HeqEH88H2cHGwoQ6UFF9CYCo4O+mlLIRbyrb2Bxoj9kyTrC0ICatfFR?=
 =?us-ascii?Q?aDm3UBpUuatjUwyTl7s+y3KJnyQGv/MIeYFMvl+fD52y/4Pz5PP12qbJBAAD?=
 =?us-ascii?Q?v9MNYhG7VSIHLCwFOm83DOFOzqho5BpSwccbW9G/I3nkQ/6nhphEPfIlLncL?=
 =?us-ascii?Q?CE/9zqx6Tp+oF4Nmk753BxiXfqRsG26LrlH9kYCfMGD7tyYOPYEdIKn/VDRP?=
 =?us-ascii?Q?O8TM0bYJAhribkyuIIk0NxWs0ja7ZIwUvX9K1eDMMoCUmPhCIrHJNk9hOeR4?=
 =?us-ascii?Q?2UUappPiNSkgi6vWQ/DcSGxv0U/FKym2MJ9vhIoIN3gj7HAfQWhx4a/3N2cW?=
 =?us-ascii?Q?uBEHJZ6Ehez99nshjda0HiJtb8NX85GVrzA0i8kclVD5O1H9PC7SWmPxbNg0?=
 =?us-ascii?Q?Go+MNEBTeXwaDawoXNdBVwZeSAJ6HFFFJAmmKsu1uXeBzYL2eI68ZpdKKTjD?=
 =?us-ascii?Q?seMHkZwavQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2f3582-0f30-4261-ce1d-08def6dec513
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 12:56:18.3818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kG2JWjYlW12EBOPfT+S680JlDJzqwiIYmKIfN87jm/G4CueOc+g+Ex5xoVUOGDZy+ZOmOe9OfnLPMR9rfs9Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10572

The chipidea ci_hdrc_imx driver uses regulator consumer API like
regulator_enable() but does not include <linux/regulator/consumer.h>.

The core USB HCD driver calls invalidate_kernel_vmap_range() and
flush_kernel_vmap_range(), but does not include <linux/highmem.h>.

The DWC3 gadget driver calls:
- device_property_present()
- device_property_count_u8()
- device_property_read_u8_array()
but does not include <linux/property.h>

Similarly, dwc3-imx uses device_property_read_bool() without including
<linux/property.h>.

The dwc3-generic-plat driver uses of_device_get_match_data() but does
not include <linux/of.h>.

In all these cases, the necessary includes were still provided somehow,
directly or indirectly, through <linux/phy/phy.h>. I found the following
command to be quite helpful in figuring out the include chain:

$ make KCFLAGS="-H" drivers/usb/dwc3/dwc3-imx.o

Since <linux/phy/phy.h> wants to drop the unnecessary includes, fill in
the required headers to avoid any breakage.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com> # dwc3
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Cc: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Xu Yang <xu.yang_2@nxp.com>

v7->v9: none
v6->v7:
- add drivers/usb/dwc3/dwc3-imx.c to the list of patched files
- collect tag from Greg, keeping it despite the new addition because the
  change is minor and in the same spirit as the rest
(https://lore.kernel.org/linux-phy/2026033028-squint-yield-4c23@gregkh/)
v2->v6: none
v1->v2: collect tag
---
 drivers/usb/chipidea/ci_hdrc_imx.c   | 1 +
 drivers/usb/core/hcd.c               | 1 +
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 drivers/usb/dwc3/dwc3-imx.c          | 1 +
 drivers/usb/dwc3/gadget.c            | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 282314eea7fc..1509b8ec630c 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -17,6 +17,7 @@
 #include <linux/clk.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_qos.h>
+#include <linux/regulator/consumer.h>
 
 #include "ci.h"
 #include "ci_hdrc_imx.h"
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..f7def9b116e0 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/highmem.h>
 #include <linux/module.h>
 #include <linux/version.h>
 #include <linux/kernel.h>
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..2f2ae6f4704f 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/regmap.h>
diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
index 973a486b544d..6e122674edaf 100644
--- a/drivers/usb/dwc3/dwc3-imx.c
+++ b/drivers/usb/dwc3/dwc3-imx.c
@@ -13,6 +13,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 
 #include "core.h"
 #include "glue.h"
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index fa0f16ffafef..e70c17d50db8 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -10,6 +10,7 @@
 
 #include <linux/kernel.h>
 #include <linux/delay.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
-- 
2.34.1

