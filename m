Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4813DB325;
	Mon, 10 Aug 2026 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366587; cv=fail; b=uKGsihzgxkfWysig32+yo4wNYegkLQ9/TxIJMVzGHMefKChXcDlFI21pNrCZ/oJJohuW2g1wVHY9Xa6fCmm29SeOqUWb9kNrWdV/p1qxn4LxoGTvTw8BOW5UWWzQDd5nC8TkzZ1PvuoXLmYDflCF2fmt20x7QfnaXSlMegKJuGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366587; c=relaxed/simple;
	bh=JwjHVt9wcr2bImT4d4AG4LuoBZwC+hLxmdeTiBHHe+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J9MvcfcXeVAdMG1AiLlAU3jtR+4xn5bOKYWcYij/b2QgveC8udZFU+8j2AejCwdRJ75nYw3P9lZz//ggMHOLYfy0jF2k+vnPmi3VRxehhdLMTkKTRpM9I/xiPqOUtKzuenCR1Dp0F8eJbTmiNlKK+iQL8R+6QiJnAXEQmc9GVnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YSaHiEI0; arc=fail smtp.client-ip=40.107.159.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YSaHiEI0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsevACHk4kw69oYnyXC/FcnZ9mGcFBzKapbtLr7PnV1CsGgF17i+8fnCDs5FoC+M3aJPugzpu2AEineqAzi3o5EdVMDUNR8ARxmSYVevxNixDxMq0BnI4wXhcwUJ8d/6CMXCjVfUD5nk6fKMrmkjRWGYnj738h1g48n1BqGF8MhO3Lc6lhZhUWF2q6wPEgfLrg6yaXRRaAT2kT/b5a63yyvVE8UJ7QiIZYCqvRIpIxX8JKWsdlSM8a/IlDueCUHI97BVhmA+TpzWqkAN+las7Y2FGUXIWGJGdVG067JmrmiQBjp/Yq6G1hQF7LarKwLzKIjgFoj8AD3ZkKrS+KpeNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGB1ox3RSnyjscIQgheIsRw1zbm5jgK2/pGSA6mDGHo=;
 b=H6xS2JP+caz+X0lrWkcHasGOkCkcH7YpKcxcTQGZBMndZnCWYXceE2EvJZV3b3TE02JrQSlFdhV5b+8chtvRC+ELwI2cMav1tYOAZAjQ9m8hHOqKkMRNkusHkzlvyvwVapWq2X3Mw6cDtP9os8BxtLq3t0HqPnLifoXmHHrYZ1RYnnsYibxF6MeEvb8DtH2yGiSEAHJd/S4GvR7k2jvKXwYxz2duzj912cYP2/GqBwx7V4/zOzP4VciuN07qPtbPqeDW6LYXDrS5AQIvWLRXrFTPCc3KNvn72shhPdaU1/oNVX1RphAFOyVcYvNSZchoJqaNf6x31yB/hcYmtLm2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGB1ox3RSnyjscIQgheIsRw1zbm5jgK2/pGSA6mDGHo=;
 b=YSaHiEI0Npe52cXb2vLJDyXNnR6aqBdixgHF9hRw+aw+X/17jVuuYFGiV8RPGmJGBMGO/+yD70IgHiI02a/6wEryc5NEp1bw/HFGFRykBqB3cZnzCjxPz3+iifrWIA3xtDJT4lwmfsotrMMc7D6CNGF4nvw5BO8BOdiKslV/MhR3YquzKi+tEXWi5l4LMs0crA0eUN/1m3Zd5Pr7FLQXvWERAnspArXdZ7MONDMUmQBHPjGLZRdfuEtJJskGzw1mU8vtWQeQ+hU6ex8Ndz6WK3cJVJkej/gmV9XrIXS141oT081gbscyjg+MlaDuvFHq0CcE8U5IlzekC2udgaBTww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI2PR04MB10572.eurprd04.prod.outlook.com (2603:10a6:800:27c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 12:56:21 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 12:56:20 +0000
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
Subject: [PATCH v9 2/3] usb: host: tegra: avoid direct dereference of phy->dev.of_node
Date: Mon, 10 Aug 2026 15:56:13 +0300
Message-Id: <20260810125614.441667-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810125614.441667-1-vladimir.oltean@nxp.com>
References: <20260810125614.441667-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::16) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI2PR04MB10572:EE_
X-MS-Office365-Filtering-Correlation-Id: a8259825-9ee4-4156-71de-08def6dec645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	reqhjgS7m8AQSydMbSplP/OV26C0vfq5Eg54NOrhQEMr+hgzaLzqR2goH1jqYA3tYXSvcHUFagZZiNfsPnNzdcbcD89bv9Cg/FhUuHS2UgziDSuQsOziGdfs5S/eR33K8tflQxEr+TiIlSy5ajJ17XnhYQqf4wO0gXCdDdnkcmoiE74El8kGhw1TwrIMTPeWQRRnmLHiuz6W3oIaKEaj3DTkcMmi6rugLOxxeg1NWq13rx5X2FLPywUyA2qm9ttS4ck6hLWWyhdBC0BDnP7/Opq0jmyE8guzglw5qZ+eskx25RYaV4rXxt5Iq/PWn5/wl5y1okRpp8gmf2/jfwLqJbXhPVrq8n69piWaCOCnuMOU3MNMTB/tx4D0YBssFxkB37bqF99+xRSOsp33Y4FfcIZeNggq28Q71ecYT2hloNgfJ/NIcuDwwBgVhM7iJxA7fAZeJ/hiyZV7E9O4qk8V9ByGPYfemWE0WroUjSuXT3BDfqKON/cy6SKPre/cra6eMjTHLUcoxO0QJBAROLf9fHkp7nWNHWc9sBHxPA+/6bYeWsuv+lQbbu1Pugmbb7btZoFeq9CAYnIr6Su2OWp+vmb8h4uSSobVEOt1a3AGULlgftWPCZRaxVpS3/Ppgp3c5NCrVFatm+8MnuyX+L3/aOJWE+Vw/XlkPTV7V8wSFGo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ui37OlwuEKuf64mwaCjQgbGxRsW5zrO/AUzM5MjIKwCjmTqGpB624R3+0FT?=
 =?us-ascii?Q?DGOHREba+304GewR2wD3LQo39NqpYXmiZtAq6vwqof8Kl2WKXVDKvUfaCJHl?=
 =?us-ascii?Q?esie81H479um5oqzfAJsz5h6r58xAsT2bRTS5rIc9c96KNiMdSVVYTFGD3yp?=
 =?us-ascii?Q?XRcwuYCRCcy361bqf9/D/n9i1aaEchYVO+XW+dQm0eNXOvZpcfw7Bvt7RI5H?=
 =?us-ascii?Q?HTen2GyXxyo0RlSTJ8kmuqE6qtJmeB/tw2fEY60bMo8QEPiF/RyXIbvXsmFW?=
 =?us-ascii?Q?fsXzRsMIR+stLUYumWZdlGGFE+btBlTx5LlspzF2GOIEqqJaaEB5ktGYrguG?=
 =?us-ascii?Q?8lANeaFDGSHMgvm4oj+LtQFat7jMLxOQ2bTpM4QSOCLEGhVI99pVvDdcRNkk?=
 =?us-ascii?Q?PNfoJCJgdD56fRmXRIyFPc3KlDBof2AmSo+gmv64pIPkwJE8dPo/1t6IutDt?=
 =?us-ascii?Q?O1q6F6hQaWhztj6ePURETL3JE28vKyx9cR4veI+8m4AX12dZ3vQMZIewiQwp?=
 =?us-ascii?Q?qTXw1f8oOaXM2p/8qrkKtCOLCioVUfu5Sc63c4D3RUMYOsWRqNtUo/1riDPk?=
 =?us-ascii?Q?wENSBQib3Dg8BGPnf4JC+MOhM+XdTOpesL0Yxml/m7d7UL77DvUEZxYPXsp6?=
 =?us-ascii?Q?IdTEsQeshp9aaoZe/wA1on9x3Sz/vSf+TwPfyUXj0ri1ystQ+KwVcq7GI8BM?=
 =?us-ascii?Q?1dwBVEFv/BgCxDjnEBjRFjWtSE0yR7bBNoLkQi/U/oPplcGB899DK1gbwqrT?=
 =?us-ascii?Q?f9MbwKcqkDXklSSGWJbP12QnxlJRfSQOsYHly2noPDS61f8PMcp8IPr3AxfG?=
 =?us-ascii?Q?FSj/yKHuCIDFPQfo5cSk0aD19FyLnn8rdc7vYOEwbFts/11Ff/jCaKcLQEqo?=
 =?us-ascii?Q?MON+OZTLu/s3j/lByxuUlwau+sYhWzaRaUMTOZ2QZUJN2mxmo/Ry1ZiF3iDB?=
 =?us-ascii?Q?GZH5cz/m+8Zzex+lRgwkhdJwwSExFjroQhkVr4IPVqVE+BP5NXK+v0zHFZ3/?=
 =?us-ascii?Q?3kzTbWnIOLWmakTV+t6USoLmo02nsX535qnI0UQWGdPmVjGNgadcHVSy1ger?=
 =?us-ascii?Q?CIvr0EFAjEL8KSjVMSVARPI8S0TedxvqL+zW29vySgrhhQWRSN1f1GglV4VD?=
 =?us-ascii?Q?q7dbcqyYtSJQEnyGuaoJo0U+3bEIhYGCy5JEBEJamimBkFmgsuNB6hyXl/aN?=
 =?us-ascii?Q?6p+d+Feicc48LxaauB2g6tn00A63kKdwKfdOSqgqV9HFgZZfhTGp6fQ21ijN?=
 =?us-ascii?Q?tFAyeughX0Zvye/ovZbt8VQIPRhg1BOov6fDp3AGoIh5p/Y30c9mOn5S1QXg?=
 =?us-ascii?Q?8ZVWhSZAKgZu2/oPJ7vMdKwBN0HOZGGyVc0dZCqJiLDUk2Pu0GQgqDQz/ich?=
 =?us-ascii?Q?sFi8ajzazgyq7SVS+MpzCEOvD853uIGyJ9YBusmd5DXGI28OoQvlVeTxepxj?=
 =?us-ascii?Q?te/qhwdaJxQR+rFEDwTc/0YV4D7dkjvZoC1/kr5nNT5W/TGoGCkeMPDq4k0p?=
 =?us-ascii?Q?KVvITr+P4gLsTOkGnHayLd7okmNvXDvFRnqH6AN9F8+iEhbqTNxaDEm4Gtof?=
 =?us-ascii?Q?7/rtIUM14P9ghBsDSA81J2l+nqebAHX2r40ZTIxKCIItJXK/dc/+FSODACLp?=
 =?us-ascii?Q?NFXM3acsOV3qzmAC3IC9ysgknAH6lspxU3RdGCJOkDTrVheL8x+Lj7RBvdpj?=
 =?us-ascii?Q?/i4I6o1ZpjrqWCd0WtC2OB/fpHsGBMbF+skKxdJvjqaYAKqoEVAX7cxugPfp?=
 =?us-ascii?Q?ZM5RZyR8VQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8259825-9ee4-4156-71de-08def6dec645
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 12:56:20.4134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzpsVldt7Evsqt7VENcKpWiqzbpwE1U5tujSO18rq32ERjIk96Z9GHyDHoWFaR5J+rUlMn5Za3BEpkSumzjQ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10572

A piece of context which seems relevant here is that the USB subsystem
is transitioning from struct usb_phy to struct phy (belonging to the
Generic PHY subsystem). Commit 1a229d8690a0 ("Revert "usb: phy: add usb
phy notify port status API"") seems to confirm that this is the case.

In the transition process, some PHY provider drivers register themselves
as both Generic PHY and USB PHY in an attempt to bridge the API gap.
Such is the case with drivers/phy/tegra/xusb.c, accessed here by the
Tegra USB host driver. This USB host expects the PHY device behind the
Generic PHY to also be a USB PHY, and calls
devm_usb_get_phy_by_node(phy->dev.of_node).

The Generic PHY exposes no API to get the OF node from a PHY device, so
the Tegra USB host driver gets it directly. However, "struct phy" will
be made an opaque pointer, to avoid misuse, so this will no longer be
possible.

Considering the fact that the Generic PHY/USB PHY duality is a
transitional state, I am deliberately not planning to make the life of
this driver any easier by providing a helper to get to the OF node
somehow. Instead, implement a parallel lookup path through which the
Tegra USB host driver can continue to get to the OF node provided by the
padctl component, using the 'phys' phandle.

Secondly (minor issue) the driver uses the phy->dev.of_node again to
print using dev_dbg() that a "remote wake" was detected. Just print the
index at which the PHY appears inside the driver's tegra->phys[] array
instead.

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
- add missing of_node_put(args.np) in tegra_xusb_init_usb_phy()
- replace %d with %u in tegra_xhci_disable_phy_wake()
Both pointed out by Sashiko.

v5->v7: none
v4->v5: patch is new
---
 drivers/usb/host/xhci-tegra.c | 43 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index e7e6d569f1db..4d85702ad42f 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1502,6 +1502,7 @@ static int tegra_xhci_id_notify(struct notifier_block *nb,
 
 static int tegra_xusb_init_usb_phy(struct tegra_xusb *tegra)
 {
+	struct device_node *np = dev_of_node(tegra->dev);
 	unsigned int i;
 
 	tegra->usbphy = devm_kcalloc(tegra->dev, tegra->num_usb_phys,
@@ -1515,23 +1516,34 @@ static int tegra_xusb_init_usb_phy(struct tegra_xusb *tegra)
 	tegra->otg_usb3_port = -EINVAL;
 
 	for (i = 0; i < tegra->num_usb_phys; i++) {
-		struct phy *phy = tegra_xusb_get_phy(tegra, "usb2", i);
+		struct of_phandle_args args;
+		struct usb_phy *usbphy;
+		int index, err;
+		char prop[8];
 
-		if (!phy)
+		snprintf(prop, sizeof(prop), "usb2-%d", i);
+
+		/*
+		 * usb-phy is optional, continue if it's not available.
+		 */
+		index = of_property_match_string(np, "phy-names", prop);
+		if (index < 0)
 			continue;
 
-		tegra->usbphy[i] = devm_usb_get_phy_by_node(tegra->dev,
-							phy->dev.of_node,
-							&tegra->id_nb);
-		if (!IS_ERR(tegra->usbphy[i])) {
-			dev_dbg(tegra->dev, "usbphy-%d registered", i);
-			otg_set_host(tegra->usbphy[i]->otg, &tegra->hcd->self);
-		} else {
-			/*
-			 * usb-phy is optional, continue if its not available.
-			 */
-			tegra->usbphy[i] = NULL;
-		}
+		err = of_parse_phandle_with_args(np, "phys", "#phy-cells",
+						 index, &args);
+		if (err)
+			continue;
+
+		usbphy = devm_usb_get_phy_by_node(tegra->dev, args.np,
+						  &tegra->id_nb);
+		of_node_put(args.np);
+		if (IS_ERR(usbphy))
+			continue;
+
+		tegra->usbphy[i] = usbphy;
+		dev_dbg(tegra->dev, "usbphy-%d registered", i);
+		otg_set_host(tegra->usbphy[i]->otg, &tegra->hcd->self);
 	}
 
 	return 0;
@@ -2186,8 +2198,7 @@ static void tegra_xhci_disable_phy_wake(struct tegra_xusb *tegra)
 			continue;
 
 		if (tegra_xusb_padctl_remote_wake_detected(padctl, tegra->phys[i]))
-			dev_dbg(tegra->dev, "%pOF remote wake detected\n",
-				tegra->phys[i]->dev.of_node);
+			dev_dbg(tegra->dev, "PHY %u remote wake detected\n", i);
 
 		tegra_xusb_padctl_disable_phy_wake(padctl, tegra->phys[i]);
 	}
-- 
2.34.1

