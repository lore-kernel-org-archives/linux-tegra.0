Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B223D9DA8;
	Mon, 10 Aug 2026 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366583; cv=fail; b=LNxtcv/dDV9+VPQmNtrtNdrJGCmyIlTqgPdu9RWNaVv0ePSxUti7h0npejgQvEOQMK9Vdgb2ubm03yR/BEkir85R68V9e0PMjNgc1xEuK8KkuSN9rWAXFqwm+XANKGoxb1uTiS8XV8hEP8Ayv0fEn0n/D2A2zCIfsAgqhgqx6Pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366583; c=relaxed/simple;
	bh=tSeuiSXb9fNbfT3DumNuOXeHCx6pJcOWEptikk373hQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RGkmKYQW4V7itU0xqom6aydGuTuEkhjR+sZRoOVVb7GgwhJOo31WJTjPU68oAUZKSvePiOzwMpFDOH2okgje+IlMbPYy8FS9/1MfbSx5zbKbFxrdjUheiUL8OOkyzos//zf7hkcJyriV78hQVqdl+QzRl0+dxpmBQ591CcLPapg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GwkkwJ+U; arc=fail smtp.client-ip=40.107.159.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GwkkwJ+U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk+mN2XQzY2VC6T3GuduvOoF2XApAboPTAffekBJKwBAEWb59d8IWLDfAnB8jni/FEcwCtyWrJJIpSdly9fjEQdvgmWEUigIV4/fGzc+yRZl6X7Ua766yF0OwZKXLRrz/sZN3t8hmE3TWvWovk6HsRimCO73bSoABIO3ZCQFCcrpyDD6ib+SC+0eqMRQeNpRNFz5QFy/lvg6MjY7PvfNEzo0PNsjZcALhZd4e53gcei2VJSybpGfwVTUYXAAE5MeCdsJJpkStCVL+6Rn3Acn9rxYFTwyNihnEsNlCzL/MrqxYnPtvPf6WJU5Phj1KXebs+Hkjzwjc9BrV/TeYsTuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdL03SEmrKUI9Q23K+eIBssScR0Z68x/vnm7iaYVgmA=;
 b=eieht+7QDHGXvGwM7qTbKNUdsJ6+CasJZexIwWwHe9zwOD/1Gj2alB5jm7X6DXXlTrAokJ4uTuquij4OR8BOBmBBFJpceT0pHta8GIiFLGm14AzqbDzpigjS4eEmqhzV2gBuYNfZS4tzqafCIlr3omt9yIM9HDCtk5NDeBVfXMRb3WG8m5Op6P5YhTvJCITJTvqAz06D0vEpRHvD3A/C8rwyYgXhkSK9UOeAoMiPGVLfUVdplkZuVxY/1tTuTfa7GQri19fgobLPHJ8/BNPfz5Sq0D1RO3XHiAJtcUX5WSkMNt+gPu7LVnJMvR6nyZL0MqDb+At3aN76YKg2Nb1CCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdL03SEmrKUI9Q23K+eIBssScR0Z68x/vnm7iaYVgmA=;
 b=GwkkwJ+UwalFbdxAU6Hhp9D1xjeFLra/a6pUPPlfnYiKBSm2iqPHECCoUmVLTGGGnhGk0Q7mr5e0+8w7h91v12e/0oi1DiaiT6WKF0CjCE3EiHiw6uxwhZ02I1stlpfAuxYQ+G4nrbz1+rwJojbGFLe7xIVogrEkvXId5IUBKZCrMpWrwpD1c5NkcKX9QIfmFfNklwDeL2seEG506SOiDU8rkmKS2eA9OO5ssefePV1YEIBfXQn2GAAlbX7PdEedrYNOpBqH8hAV3eWbu3DnmcIAfQMDnHdVdcQ8oWbMQOq1Af6kHYX5hx5JOEtOYCXDBkK/R/3/rQ0rlhrmjcU5Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI2PR04MB10572.eurprd04.prod.outlook.com (2603:10a6:800:27c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 12:56:16 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 12:56:16 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-usb@vger.kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v9 0/3] USB prerequisites for PHY consumer/provider split
Date: Mon, 10 Aug 2026 15:56:11 +0300
Message-Id: <20260810125614.441667-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::11) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI2PR04MB10572:EE_
X-MS-Office365-Filtering-Correlation-Id: 487e9f0d-38f3-4aa6-c50c-08def6dec3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	skFtVYVCtansQ8WkVaghVjYfBM00mHWef3AcZ+APB0qL8DpWSu+3ZIKb7OFW4bStEuv1NvvMhHIevvilUvqBH+zns4VDuzpcRcwbeGO/Sks16R7keS87sk8qfeuIf91u4Z4VtRlmdjK4hiX73NEVIp15R39WeRO8kIKwQRJJlt9u43uLLjW3IDQetpl/ACs0AetyqSgR4Qa+tzYSjXI0uoj3MK/KxL1wI9Fdm6pf9jFvFpMFKL6C7FA3Y6s+Ld3G4K6hYNLFucTVqQZsDUc0yOPfPbfUts3Yr7hVADRrX8qA9P3lkBa7xvTghm5xJBIV/xXJ5ga86H9Jt2hvROYjlzJpPzW0bT+UFJR6ynlf0oNVIuzN/hrXfRu+8tfoHWJ96kQZwMj74ImkH+OHB5kzW0e+KATr4YGoowlEVYkWiqcRgJCGBWs4SUK3UvjcG2B+AVcXU6ikLSOln8ZwyE8F0vNIl9SfxDN13ugevs3yjgThN41PpvnCBtlGYUsrMjPxAb42bCmzMX9XG5vtrKCokqpHmI6iOG/F1Sm8ZwtjEVMX5MeP/MaU5lAoOCVeO/iQkgfkcsKX3FTKXYQz9b4z0XFrtwnQ64M9fTD5JIVEAh2ZLuPcmqZGHroxSl6uv/trX6vKup+N46zYOw6VWwQpQi8Dz1gNHZMXbgyNJW1DfOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hwvLNIAvBASZYc0uXCc0Los655I8332pAzVbNQva34sSTmKndATMrpzDgRWy?=
 =?us-ascii?Q?0RWAociCWCYoPRfEpxjTpKXsgnUH7CMgdgZKigFs3J9Gpk9xiFTXO+YIbTDI?=
 =?us-ascii?Q?ilJrdQvW+sf3j1xNSGB7c2QeZIgHzq7cLA3SZqUl/wlvxiEJJoirZjEEvQRy?=
 =?us-ascii?Q?AGWf13E+1HHw9KR+G2rDXSDrNTHiUtKI8fLSg0iT8AEzVN1dxoTH1/HCt8nU?=
 =?us-ascii?Q?2mTqeivbj305SIKmzUGcaypz4V5QD182vxY3UnQprAJzU/PxYtbU8rXTSOWR?=
 =?us-ascii?Q?Vs0IidjGPWy3WxDXn9wsxJnnoE5tc33uSNA6lXFa+Eb8osXmZFt0U3g5WhPa?=
 =?us-ascii?Q?5CPrwm3KxIM0gP5DHcvJVUpKHmOrFH6nNCF+RyFBYQJ07/7tUsz6Y10Em3XJ?=
 =?us-ascii?Q?1nD1KTdqqGR0ytiMt8s6L6l/UdgBN3n+wfZyrSKh8TdECIki0VFTJK2d52Mi?=
 =?us-ascii?Q?focvXW892JYzamiD5k7eBO8OGHMZfnzxJL1LxsJ5/f5L18CDleHNWC/dhWZw?=
 =?us-ascii?Q?IXcM8Dku/lYfKqP3oW3tmXHpO6nLDmc+iFUg+fwfIKYNcoEOULMKrmiMWJGv?=
 =?us-ascii?Q?gDbZ+AYSnBVyUR1hYByDW96JriUmJxXwovrIEXqhkPOpwEfBt1Ft4aPsTSki?=
 =?us-ascii?Q?66IhzTFqCKMBJBbkvIF8km4EceE1fr/H5lG3WK5S6uLkb4xC7IkUrnz3Ne+o?=
 =?us-ascii?Q?2LostwhfpUUNkf1jZVm6xTD0OzV/X2ujfssembRwnybu2XRmb2NuNhplipwn?=
 =?us-ascii?Q?BnniWgp704y3rlYq58zoCqTBASJr42+GjgTAezvHmLWqULgDRA91MFKU9Q/+?=
 =?us-ascii?Q?2ek9ic+pd4aoJg6aqqgAWUIroIMgctUoKg8caKmuGgLvXGgwI4lmahUgbOK1?=
 =?us-ascii?Q?qFLx33X5ZBW0AEEHNhEJo7S+Oao5DbuKwcPnLGooR7ZpdkAPwPuCR9VEll3f?=
 =?us-ascii?Q?lrgY5UH1ViQbUqhbRoikjwwO/rDZG3S9mMIeK07uVP4ByDsk8iIOo11zL70V?=
 =?us-ascii?Q?sZzY6hzILCSR0Id/GEXbjRYNKMArcFqPOBk7fZoCzKvlYCzy1BLD/Vensf1t?=
 =?us-ascii?Q?oq96JSqONf4ytJE4JnJ3BbahwpYY3L3T/TgrL+nN2QoZTHzgNR/8ztsLsfVC?=
 =?us-ascii?Q?LLfhU1YeZvc87tzux21EbBoBEJr7Se4bFtOAM2vyMLTp9duN5lafNto208yO?=
 =?us-ascii?Q?2KAvf7LRevFaffB6u4f+EL0y36ruMtngzzOduu+U03MFiML3LFFGQop4RX4G?=
 =?us-ascii?Q?0E4EBhltd8eTjWKOU6t4cB5GF/ougYLV8ZM82f5yNLFxTrrDEKZ83cS5pMSg?=
 =?us-ascii?Q?G5UIrlCjrvQ7dOWy6Lh4a/DNFwD7uW5kqT7yjS3YPTBiFApZYvBO+9rC8K1H?=
 =?us-ascii?Q?3IlPcfhJ6M72Rckax2zTwq1SjUnGhU/Uiu6cpAYL1dYl1+h4izWrpqqzP00t?=
 =?us-ascii?Q?pXglzmXLPBlQzUZYrbsqDSeckG3jvNrtTEXgtC7CqXwOlMRsH9qkfzbrf8l9?=
 =?us-ascii?Q?qVWkLOi4bvAH4gF8il54nfd+NS0H1TRCaB1CvuGVeOfqrK0fF6lnPnpmsssm?=
 =?us-ascii?Q?urCsjccPzJlvjyRKPm4EiMLI6JIy8zIu5oKz+AfeE7dBvNyMyZkyQeFSGy1W?=
 =?us-ascii?Q?0no0v7ZuOoJs/0R2YRejTmZ7+AD0Wa01U449aCWlO9EluXG40rWhqfH2gKmd?=
 =?us-ascii?Q?xAoRF0Y7z3JCOw5bD6Iblyx5NGJwXXLslbLafXzAeuAflH4iFS5EGN1uUNh4?=
 =?us-ascii?Q?hfFwEodmrw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487e9f0d-38f3-4aa6-c50c-08def6dec3f9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 12:56:16.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXD+CgxX+Ahs5tCOsE9KS23+ZbletHEpvXcf3kMVV0f0appmOW0X3e6VTmozwGNXbUAkpMQL1gLMoigEcIbA/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10572

"[PATCH v8 phy-next 00/31] Split Generic PHY consumer and provider API"
https://lore.kernel.org/linux-phy/20260505100523.1922388-1-vladimir.oltean@nxp.com/
became unmanageably large for a single patch series and needs to be
split per subsystem.

Here are the patches pertaining to USB extracted out of the larger
series.

Change log in individual patches.

Vladimir Oltean (3):
  usb: add missing headers transitively included by <linux/phy/phy.h>
  usb: host: tegra: avoid direct dereference of phy->dev.of_node
  usb: gadget: tegra-xudc: avoid direct dereference of phy->dev.of_node

 drivers/usb/chipidea/ci_hdrc_imx.c   |  1 +
 drivers/usb/core/hcd.c               |  1 +
 drivers/usb/dwc3/dwc3-generic-plat.c |  1 +
 drivers/usb/dwc3/dwc3-imx.c          |  1 +
 drivers/usb/dwc3/gadget.c            |  1 +
 drivers/usb/gadget/udc/tegra-xudc.c  | 43 +++++++++++++++++++++-------
 drivers/usb/host/xhci-tegra.c        | 43 +++++++++++++++++-----------
 7 files changed, 64 insertions(+), 27 deletions(-)

-- 
2.34.1

