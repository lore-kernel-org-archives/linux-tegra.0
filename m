Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220673DB655;
	Mon, 10 Aug 2026 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366588; cv=fail; b=J/fCu+xWqat3AyKXbbBrJB5luEL1M5rpaG/2dHTwkc26sBrzaQqfhJaiY4V6AHPoyJ7LCv3ptZlzdsEQm9l/isrAAl+qoMcRXasnKnCiBvTcu3CXE4GZfzEMctkd9IbXKmbVmcZSBd4ss0NqBPqAet3byP5QeWnodGgDKcLz+8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366588; c=relaxed/simple;
	bh=zUmuBJSWmJrzWjm1RpYrVJPiKb7jvCrFlvyAjKyJDDM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Of9Y6+ZvMXwSgY89/n16b6IyFa/v5GMcm1+9A51B9jlAvwOVmBn+Aze5GzhCkrLYj6v/PGVhedUKcY0wHWnqFgKvKr84SGGovdi1aL8sAIHZ7Kc9GdbcTWidKD7cMxfd3VeC+U4V3zwCjo2ijorMNAEANcrPXnzY3OQCuyrbr8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ddz5CYjW; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ddz5CYjW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2M54i+3kQmr2bywZit/G6vqU5DaOJnDk/qOXphzW+ftUWY5n5mFYx7nTFDorOUA/j1d82Cgi6XOgnBDV5rIjX9FoeFIiwJNBS6rmDJnt0v/N4rlVw+pdBZDW4xga53HCRwQscE54K0SYCRk3L4/HqsJwJroiqem+Nr+p8eLOb+OiNt5OJG3Fmm6cqAq3WBdroKkEcRkglyKf2JtbF4BXFIuxhjq12dADX5/FsHOyOGerRmAOSEFAbH3XmhPipkc1twXHPXV9FVhCQWzZr1RMEhn5uqcWQjaV9YwFqVISKAdArrEal0VzC6Vpy2K4Vw3iSCbifZPgciA/G0YVcIcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErmtvoIKr0Gb0FRAMPkh6e1WzT73SKy9RPSlt22Nzk8=;
 b=HrE2NI2pIsbpaex4BQDNwXAjM0bDaUfuE9F+I557NzdiHU6cH9A/ufOcCdNgYKekrkvkr5B4xZ3KbbKKvKu6ua0L0VFomKxr5p8zTIk8FLj/y7LA4yUm2Fd5QXHW5rVzshScTesD+86p16gJR/oetgzOMT/mpXbBhD/Nu258tV7nsaJEPgXELJLIMU8oC83WPT88J0LwCGtgsudsV2ofbfrNsF7j6B2ladKuJnKXIpZgecwUUGY8N6fU7qI97RHk//PUqLcyP15J6OFhQ1sH0KVCSpZcYoAYDvlmrlA74VKUOgQl6ZXGMFAYcoXzxF39VF6HBIMChf6vwfLf0M+C7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErmtvoIKr0Gb0FRAMPkh6e1WzT73SKy9RPSlt22Nzk8=;
 b=Ddz5CYjWZNh/GWTz0IoEw3JNezYUZMxP6ilvSjf7+a0j8l89l/yndr6METHRvyEz0lBoXH8x8blVM9EuMgyBRhUUypMCSv7fwvK4fupwREm9MjiLGMCLE3I4VyyWCPRFYE6ynYPYP8D4WaUq6+W1flLSDclWEx91tZWeJ5qLjTZPC0CjXUZ3fth5a2aDfX7C5ynsIDXOmE9UcxCX/qeBDTKkNIk2HyJuvL/hlb3CCOaTjiNpJ+mz+xZbGMnntRJ5nHyp7Ehe54voDUY0VvZQTCUUjnRuWUTD1dq/U5IwJ75MBLuhmr/B9N0gNGuBs5RO/J614fULgo/qb6lzNRc9Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DBAPR04MB7205.eurprd04.prod.outlook.com (2603:10a6:10:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 12:56:22 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 12:56:22 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-usb@vger.kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	JC Kuo <jckuo@nvidia.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v9 3/3] usb: gadget: tegra-xudc: avoid direct dereference of phy->dev.of_node
Date: Mon, 10 Aug 2026 15:56:14 +0300
Message-Id: <20260810125614.441667-4-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810125614.441667-1-vladimir.oltean@nxp.com>
References: <20260810125614.441667-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::8) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DBAPR04MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1f93d2-96e5-4ef7-c536-08def6dec760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	umBZDihbgLdI4DVZchTLme6hX4nL0i95SCdAxd9LckmuzQglEheAqKCh8qNQ04CMyYqZIaShcvRi8BC0QjMeAC31ktArgwZ5DmbvfckUOfjAK4zIbOK8eQgD0irvnO/Yc1cZZJ00Mk6TYtjjWUrOO2IB1KwTSr0NCD2n70M7ufQvd9/qrZh3BoY6d3VnpHEW+lFUYk+YVlSCXupfwXwTnBp+8aT+pLxgTKGaniNAxdr1rXLni7gGBsg3K4w65pkkIHWRFWwDcz//Nre7nndgCeqXI/bz+jvztxer+zWxW/SXXLO2ws0KuWjPA+h2kldHJjH1p2wx1Uk9DPSrvhGDG31vQEItVEecAvBgdaZOVEiJM3x8+N+ntY5lCSrM4g6ETN8c3DPJvfREL0ufipNTLkvM2tq3aKNw3+QQada3LFWEj9w5H4oQaShFj64LdSF8D56U2r1sIDYsRebgnjuVDIU0FVscwRTf7QynlTZonoyXbeXyG4fWUX5N16JgKUk3yqnhefRlO9vEYNTRQJobaruBwh2ii0i3cXILcoHJ66VnVS8/C8bPlKcyAtshKHJwDOP7gh8VSZMq9Jh4JgIgQ75QZrFQtIwDVyrs2TPobLfNsQiu94aiE1yGn1tMqtqZpsy7Ht6NF0VniR27ps6/bhyEZWUoisMakK4yh9imAjA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JQ9X498LuSlLnS7oWtuOjyPA9s5wmekhAW/FMHrjknYPylkVvS24UDmI8Gs/?=
 =?us-ascii?Q?6k3d0FZIS3CDi/hmzZdHFY0FV5h19woY7Fokk09ELCF8o4jIGZY/NuS/OQPZ?=
 =?us-ascii?Q?+aOmvGIbqtnip+zIRWgiqQKtEH94l9/t/mzQkbjp6j7WCjk+D1rZN/5z/p+W?=
 =?us-ascii?Q?KBDBFty/WScxjJ2RB3Bpdke8wW0EbYspxgOttpBuWRI0HgzruoOYL1RiRCyy?=
 =?us-ascii?Q?1bP/pDPtuO+IHOEUZEbBWReIhX5RhyKtam/J+WX7AStESW6XMd4YbQvK/XqD?=
 =?us-ascii?Q?7d4fK77BZNcu8oAKMF10uL44SQMO1fhL6nv43low0/mdLHvR+D5wZ24uqM36?=
 =?us-ascii?Q?gkGGua2zXAbnQT6LtC5SJBKgnv7PXQaM4gHa7fgcYYB/exQUrPKBrBBuH/Dl?=
 =?us-ascii?Q?+Bv4Z+c3ReldOwIiGiPBFEJMRMAPyVzeDAjL+Ypq7dtp01GVzXEdbRkOo15h?=
 =?us-ascii?Q?+q2ZBfbVy9ryo3Ot6g+wnhgXU8aHWrMWhXGHT1xpywkwjbf2aUFN0PT49G/q?=
 =?us-ascii?Q?gUNDUHXnSsfyeDKA5Y0tJQ/cvwZnVVxo260kwqtgN/IFrPwB4GUW5goL855M?=
 =?us-ascii?Q?NmwnTM892m4G7X0DlIc+kLb7R0rs3EyFG0gfNWLi8mRk8DL8jQCnACyg9jCC?=
 =?us-ascii?Q?GSHd1lg5Pj9jEFjdJx8BMd9Rt5/wYT0wENWaX3dx7PngKmfwFbLy4jOYqlTW?=
 =?us-ascii?Q?/86uct/z74XXQrTL/Fj5/ZjUOMu9jyi6U3xZYiXOBs1sE/sz5+D+7/8M2LFy?=
 =?us-ascii?Q?EJB2XrJ2IA7eYRGFXTKx5+WeADjy+K9vI4Zg6qIJo1ESsc3BlHi00F2daaKy?=
 =?us-ascii?Q?KeTgBNwMCS2whObHuTQ1qB5ySz1IPA1YmcZTvoEORtAN0jVfysCp3OqxWKmD?=
 =?us-ascii?Q?LR33dvmpNf28jSNe3SylYR8/NXvx21rm8yFIswF35Rtevn0jNRscAnX31+GG?=
 =?us-ascii?Q?/roSo4wKzjHXr5utQZxgMdfeiDQRapqFeALc117VK6qEo3/v9D5u3Pz2hdJG?=
 =?us-ascii?Q?s3P+ogsdk3Q9e+U/Zjsc3p7VlAY1kd2adhO4uJw84Hm9HE8OVmWdf9GfJugE?=
 =?us-ascii?Q?sMKZq7kgUW7zG7wiINl8/WnRCCctrbXb3/6wTR3Z2mPO2ZpsC3RoOyXO1nKO?=
 =?us-ascii?Q?S3kk4W/F05jjwNrSoC+86LKOpprQD2+52KExMygUlKq8S7FJF3z1RIx4x+NL?=
 =?us-ascii?Q?KG9mfAOgyjB9zlApn8fNRnezKRFyl9iBx6VWmASovZvVmKGL3e7neIAZ0kyS?=
 =?us-ascii?Q?91EyPuhIA1qnbTtJASOyTtvCcmOkk4BP0jEXuAPHaV+6hOFb5mbVQvG2mGOB?=
 =?us-ascii?Q?/6fRNrsz/PYCYAY39qcoNOXB9PWYDnepW7ifUxbwaKImQFHJy/7l05o94BZX?=
 =?us-ascii?Q?GCT8VhnDsFWbtCwLUOL1AykK3A1p+gTFESZgm1EPQRfFtR6r0VnpFAuIHkrb?=
 =?us-ascii?Q?fJaeQFo62YU0OsZwRJSYYVvl8EaiqCoxmM1AQBESFuuuJCWt+2EZvnwXu58W?=
 =?us-ascii?Q?cR1IJfJxPSlwXsp6ES7SoiQHdT4nhpLrLsm6Glh1ES6CoIITQIAe7dK4tG2m?=
 =?us-ascii?Q?Mu+ElsnuYMgMn3NsCgIQPCq9q7E3qQTfYP+creWsN1o6hrlppOgtutWtER5Z?=
 =?us-ascii?Q?aYBIVN0FebSNnJH1y6aEcr9mpBWTUVjIl8rpcSU1B0ssqsO/pajAm5W3Y1VB?=
 =?us-ascii?Q?9pMDT3+taM8kpyqr8faVPzr0YLMjTcpiTBsJV0QIdG3mrr2RJehhBAuTXzwS?=
 =?us-ascii?Q?kahNWFCzEw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1f93d2-96e5-4ef7-c536-08def6dec760
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 12:56:22.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0Ig2NlDpont/dj2zdUDI0Yru0V8+EVWyEuCvT4lDOfyDEpDtkdBWTCwRmLHTPf1T6TGg9qVonugHpKb9bFwoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7205

In a somewhat similar situation as the Tegra USB host controller driver,
the Tegra XUDC driver for USB gadget mode needs to get to a struct
usb_phy that sits behind the same OF node as the Generic PHY. It does
that directly, which will no longer be possible. The PHY provider is
also the xusb padctl driver.

The rework here is also to implement a parallel OF node lookup path
based on the "phys" phandle and the #phy-cells of the padctl provider.

Some further notes:
- create a local "usbphy" variable to hold the devm_usb_get_phy_by_node()
  output. This makes the error checks more obvious (avoids keeping an
  error-encoded pointer in xudc->usbphy[i] even temporarily).
- the "if (IS_ERR(utmi_phy)) .. else if (utmi_phy) .. else if (!utmi_phy)"
  pattern can be simplified, considering that neither the IS_ERR() nor
  the NULL case continue execution in the current block. Therefore, we
  can move the case where the "utmi_phy" is a valid pointer outside the
  "if" checks, and this reduces the code indentation level.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: JC Kuo <jckuo@nvidia.com>
Cc: Johan Hovold <johan+linaro@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>

v8->v9: none
v7->v8:
- remove duplicated variable "err" which shadows existing one
- stop execution on of_property_match_string() and
  of_parse_phandle_with_args() errors, instead of silently continuing
v5->v7: none
v4->v5: patch is new
---
 drivers/usb/gadget/udc/tegra-xudc.c | 43 +++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index e9d33be02866..f93e0a5651ab 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3494,6 +3494,7 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 
 static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 {
+	struct device_node *np = dev_of_node(xudc->dev);
 	int err = 0, usb3_companion_port;
 	unsigned int i, j;
 
@@ -3515,7 +3516,10 @@ static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 	xudc->vbus_nb.notifier_call = tegra_xudc_vbus_notify;
 
 	for (i = 0; i < xudc->soc->num_phys; i++) {
+		struct of_phandle_args args;
 		char phy_name[] = "usb.-.";
+		struct usb_phy *usbphy;
+		int index;
 
 		/* Get USB2 phy */
 		snprintf(phy_name, sizeof(phy_name), "usb2-%d", i);
@@ -3525,22 +3529,39 @@ static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 			dev_err_probe(xudc->dev, err,
 				"failed to get PHY for phy-name usb2-%d\n", i);
 			goto clean_up;
-		} else if (xudc->utmi_phy[i]) {
-			/* Get usb-phy, if utmi phy is available */
-			xudc->usbphy[i] = devm_usb_get_phy_by_node(xudc->dev,
-						xudc->utmi_phy[i]->dev.of_node,
-						NULL);
-			if (IS_ERR(xudc->usbphy[i])) {
-				err = PTR_ERR(xudc->usbphy[i]);
-				dev_err_probe(xudc->dev, err,
-					      "failed to get usbphy-%d\n", i);
-				goto clean_up;
-			}
 		} else if (!xudc->utmi_phy[i]) {
 			/* if utmi phy is not available, ignore USB3 phy get */
 			continue;
 		}
 
+		index = of_property_match_string(np, "phy-names", phy_name);
+		if (index < 0) {
+			dev_err(xudc->dev,
+				"no \"phy-names\" entry for \"%s\": %pe\n",
+				phy_name, ERR_PTR(index));
+			goto clean_up;
+		}
+
+		err = of_parse_phandle_with_args(np, "phys", "#phy-cells",
+						 index, &args);
+		if (err) {
+			dev_err(xudc->dev,
+				"failed to follow \"%s\" reference\n: %pe\n",
+				phy_name, ERR_PTR(err));
+			goto clean_up;
+		}
+
+		/* Get usb-phy, if utmi phy is available */
+		usbphy = devm_usb_get_phy_by_node(xudc->dev, args.np, NULL);
+		of_node_put(args.np);
+		if (IS_ERR(usbphy)) {
+			err = PTR_ERR(usbphy);
+			dev_err_probe(xudc->dev, err,
+				      "failed to get usbphy-%d\n", i);
+			goto clean_up;
+		}
+		xudc->usbphy[i] = usbphy;
+
 		/* Get USB3 phy */
 		usb3_companion_port = tegra_xusb_padctl_get_usb3_companion(xudc->padctl, i);
 		if (usb3_companion_port < 0)
-- 
2.34.1

