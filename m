Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012035.outbound.protection.outlook.com [52.101.126.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678EF2BE03E;
	Tue,  2 Sep 2025 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819655; cv=fail; b=BSxx3SBYApD8UHDSsLnUnMQ/JNUZHKlx999eD5FAA3VKA0gEVGwhqhQME0lDh62WaFR9UDc4EtQrLPlX6wq/GFXijMRaY0I1SG2LIEhgGVIn7tGekB/Muz8rrkbc/sRgFsMj/fnfi4V+cSfH3VzdIbRNe0bFN7gw4qwtmxK8BzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819655; c=relaxed/simple;
	bh=YBrjAkBtFoFeT3eLsKiFLL+IdzWDQFWzT64D8B/T+Gs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NV5pxgu030/017nv2qRNpTxqstcJD6XwMMkKKekRpFXxXAV4cFUsOims7BTWXDjMENvhkV9KkazYX0JFKJCw6gv5bLRuWWVrD9e8Xrx7oHehy+6FaEJPRv//BmSj/68dKhwRQFThoF+Kum7E35dpEU06nh0OxSnimNDMCmyDM6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=HfCLbDEe; arc=fail smtp.client-ip=52.101.126.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="HfCLbDEe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdIMsRuMzdEievjqcNQ3c0AUSdQK3uarkLKtcEkRL+nuIjCBX9qi0/4srHMn0W5RV7GnptnC1o/ppuZkHSR1/XhhbKaqu1PaejbYEsNnX8BteSIn7LD+aVe3t4UbxHKrQVGIgSEMLBa2in4jgzMYTfvEnpUNP6s2m+QBlQ5RxKDH9GsOCNWAzdcOygWriE3t3hkBUeA8PdTyYQdfygq4/qVOQY9mtSaJEaZYgoTsvVxScT5FX6auxBF47wxlnaHH+MQcw6dQUZf2hYLOUMB/ammIJUH3iXhc40klfQtxz7pkkocTUf6QYBJDBVZ6w/HX2kwnqA5FQAxXYtKPhaGvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoXOx1e5Py713Cob5uM4DBgPp2kNOF07qPjIhccBvuM=;
 b=uE4kZYEo/wbY5GVn6dq2V7aXD2mvtVZz1gZRzZUk+JpjzRkyXBUxpuPYblbmjmu4ToIudJVzkDAvsQUvK8FkDbzKrH0k6NZHzdJh2Q83n0WrkHMeDuMHE5djjAN8Edd05JQVcK0Q2dTPgOaiVLuz6LJq3brxqpe9WiddQy9TgnFlEBzhXUmNWpgb7D7iLhmZ/VyYSVHbPMVqPse8+YItCBGBCqu9sztHmN1zXIW40ZyGkVLL9Un327dP/Xq4oPiP5vVSb7AA5BuImAIkp1v7pT/blWNBxENOK3vQuSSzWo8v/Fhc4NRKwDJHmrqrjKaf1oaldpbNnOb8h8XpW9XR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoXOx1e5Py713Cob5uM4DBgPp2kNOF07qPjIhccBvuM=;
 b=HfCLbDEea2X5Ki5ajbSxZPThTdEo3TgzHb5Ca2NwHtF+p4Ti/BfXBMiS0LNoxIxhs/GphARLQ9a7nO+XSbIiZreSRCwCxnuJy5Ck1+akoqiJVDGA44p5pC/3rmRbBdzg8l4Zc4k52BX/V9Pp/6YuLGoZjWZC/rqCRPYsobYeP8euZ6OIotVnpXwy15f6F4DrmQyTnpWhRyfhAZ7fz6GVkCgLOTgvSoVx4oTqOK9rFIDET/5zqS3EjSGN0xGMhjHEM18iZOLl8H7TEOCyEwzKGocrPe3GZHFpwgGxTQbEPz+O6tj35D/YjgbtFonqjnTRZWlv1zfeBl9MBnK98Za6MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB6379.apcprd06.prod.outlook.com (2603:1096:400:424::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 13:27:30 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 13:27:30 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] usb: host: xhci-tegra: Remove redundant ternary operators
Date: Tue,  2 Sep 2025 21:27:19 +0800
Message-Id: <20250902132720.85504-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0355.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::12) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: d2aae9a4-52e3-4f39-ce63-08ddea2477be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2gqv2OZLlRkkSuDeEoBdBkAY6zHIs12EODrgJsW5axRyWxP2/c7mcUndAuRf?=
 =?us-ascii?Q?wzaQRwml/D487wHs4toABVMp+IXISh+HO+zDxNUUbV0aCR1NiGWdc2tX821N?=
 =?us-ascii?Q?J9RXRSz9SDevpbkvMJhLz510FeiX9dGcffjLkcwpfOrBJR3HulH1rVbJ+nob?=
 =?us-ascii?Q?7X9UA2VCfn0nIsnmKfm7tQVY8F49Wm7PyaYO9zRKplIGJlyCJ030HxE3+omD?=
 =?us-ascii?Q?O2zh2EK+Ry0FvBtlcCDMSUdYxrEpiyJkPD7IDeZU+YjtG2Z07+0m39mwWizr?=
 =?us-ascii?Q?C1JVgJ/Z5r2nInoQhCT9B9f4W150yQyIWpKiYXp/OD1YWWGqc43MUfK8cmPo?=
 =?us-ascii?Q?jRwUNNoDE/jnDs2MSYXrS83LvhZZmLVla05yh79sNcrNUhHlIe86YlTHjxCe?=
 =?us-ascii?Q?t3wiEbD3Be5DDPgBFWfXco29AT8X3HcV37ULExQBu6LZTtGRTF+uFFJV5xS/?=
 =?us-ascii?Q?Inco7PVDRRoUP0x6hKoKRNrxtix1hVSASaek8OLquw0RzB/eVWPUkZIJUehz?=
 =?us-ascii?Q?Y/fLRimtJTvzlSawwSMDFz12EiUiEODPEPfh8j1n2YlAbOzqFJlXoSp/UKUv?=
 =?us-ascii?Q?gVK5FpJMgpBqZubc8tMrR4mfeWvMpub9HlGBTvjkOUuZ18KA0UYHTW6EtVIw?=
 =?us-ascii?Q?UPf55+Wj8qHk+TfnV4AI5qJZrn6zGreqO6wFoNJe2ygf92lLO1ddLUW1xfHi?=
 =?us-ascii?Q?UvMCYoQBmjPW7SgJhI18ZWweME07dQOTH1jms4nLXDzFeFZfjYSSCuEe+EuH?=
 =?us-ascii?Q?r0S7OPIpf/7R/e7pdMlqcMWThoLs8m/Zknk3F6Pv7bwFJP1sa6sAEskVhgqH?=
 =?us-ascii?Q?B67XF4AMC/UfwVedRViedvWh3CrIYA1KmXX1aL9pMt1PudUDXuO/Bp0xpNNu?=
 =?us-ascii?Q?/D4VGE6IF9M9OQf9fJOVUN+xfgPxfvXU8p6FW/UGI9mqagZYob5odSELpHFm?=
 =?us-ascii?Q?VRmYDrlK3KOP62b1S1SgNcJJhoIypd63UdV8VZwRrxT+4lBT1gazNKEBpBmV?=
 =?us-ascii?Q?ZG0bcK7LczHGQj1CTBXEqyGiRbpR6/FQCPuwo9ODxdqTjHqASGR94xrSkBfY?=
 =?us-ascii?Q?Jg8ZLd/Fee6EXSpG6SmHclPMDHiDeNUVCsEh7CSdd5dpm7DzLkp8XYBvT3+A?=
 =?us-ascii?Q?9xF4Rm56ZL3z2MOsGnrx/+h/oHcZ6+czzs0jzX805pwTUTYetLL1bMDik2Uo?=
 =?us-ascii?Q?YUbD2ooen/82n4OLEzGCoe8EPA7YXILHOzOgDfHB/tt1iDV3UdYgeQ4hA7jZ?=
 =?us-ascii?Q?NmMb/2wDGf0dHLfSzH1o74sRJpqfQT4kAJqzG2GM9MCG/ktjEV5bxbbVtyU6?=
 =?us-ascii?Q?UR60zcVIMmfuJpekCQReUh52GSh6vXk4UmzA1QtP1j/XBUQjL5kAT/wbHs/f?=
 =?us-ascii?Q?4rWA4OWXzPHQguYt8Al7bBfPxVbS+YtVXhSvT1uei0VRA73BUHVsTm9pvUgR?=
 =?us-ascii?Q?EEN/QpTYEkDPgKIRvjlP0GTAZeJh5noy6hff/K6/nCkMgt0L7tA96A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X8bbpIxD03Pwyne/GPJ6AJELSPsvhC1XGN467ptP0okebikFO9IlNe8ce1JL?=
 =?us-ascii?Q?DhUNEexygBIk3ZGwbySsn1EMx9LxbEtHUAL5NAQKqSOcak94Ai4G2Czooh2x?=
 =?us-ascii?Q?fmNcHjSIQm+p4jc4eu6tvERGx1/7nETchCKXMbHEBksoCJ0CZaf2MmzHvF0E?=
 =?us-ascii?Q?GAT+R0GLkp1kBBWI7CCacf++Cif05AclvcH0In87xx9ZJq6dpAPOHVGH0hDd?=
 =?us-ascii?Q?S8clii+C4neWwWVTqmXs+xsGM4UJil5nuoAcnXA/MCDlT/OfRPwXh5GvLaQ6?=
 =?us-ascii?Q?gcsopdJatdZUNT4A/zkMOHYJHevwE/MUqliswc3jSdWa3qDLoWiSRrUdCYOY?=
 =?us-ascii?Q?5uO3XzjLgg+pN4SyvzyYw2023/K00vzYPKiCPCusl/DVkRJ5KFXvf4ncMw+8?=
 =?us-ascii?Q?2aXV95bBjJL2ThEQ2D23mirNsN4h2i0j+K51CMZhTdeExPz0QHATnbG+zFPv?=
 =?us-ascii?Q?BEUJ9e7AVC/DyeKXvHiLVhdYEWcZcfTtqnqc8KQGr8eYk1rsXwftlMtPGdpB?=
 =?us-ascii?Q?CXq3yzY5proQcE8C0GPZK5wZxxaXCV14ML9Zg4JDStARRmIyYtsMLP2HLg1q?=
 =?us-ascii?Q?S96MZXwbDiakN+SSaupWkyWS0Eh0kV6SUQlMS90UadThGBBDE5GBOO+huNfD?=
 =?us-ascii?Q?EmoJgLPzK9fWZEmUn+1lXV13M4lHgRYQFmdsqkRbEG94BnRwuhrfGMSGTC3N?=
 =?us-ascii?Q?LhlmCStX+ZmnAC7xnvYNljzdKkvcJvxg7RwUSjLY2nGJEWp2iCc+Nxait3u1?=
 =?us-ascii?Q?1zzWVl+26vfINu6BZNpMFYT6hZKbEBhg9YkIXI2D1NHo+L4C2rZA1UJBtdPL?=
 =?us-ascii?Q?T/kx30ksqtNTWrcXhhYxEZt3fnWREaMZYqywiY/ighE8G2wHMvOG+LDP/57s?=
 =?us-ascii?Q?oYUju1p6UYIY2pzPc8clxHCjUUol95xiE40/ZmgH5Y1SHrSCCX2Lyy//CTWj?=
 =?us-ascii?Q?q7iq2rMtei6DTTGxbh4N9bXdClCyhihbX9Pwuj34sB7eTngVg1XoGWL1eiKW?=
 =?us-ascii?Q?A8P2MzADrgGjREeho3e7KYXfoBK0sEq4K3bmfEdWisQolZTK17N7cHOz/CzW?=
 =?us-ascii?Q?zYX1hT2qi2MWuxv9ZCtYoh6E8UJVyJOTNz8Nb8Osn1J40CLxpfRXai2QJTrp?=
 =?us-ascii?Q?RHVIATCIKhUeBI96haHETx0uUL4hlCMvuIpsRXfWxvmnj0wq381GbcKCSiCS?=
 =?us-ascii?Q?jVGsNFlxkVMBXwBvqKOPwCzn4ixc7ryIzwV8YbrwmK6xzQ5MTJjvsHPVDhDB?=
 =?us-ascii?Q?oi9cHmCxgdcOW5eTVmBBe4YKh7iPjke8V/CCAGDdgyma9wJrYcyJ5YGLda0D?=
 =?us-ascii?Q?MCS0FVlo/weN55Md4JILLU1OBAIe0zVBzlGa0IZDvqPMrsgb+ZjH++19I3vG?=
 =?us-ascii?Q?WixNPbjmk9+zEAnBoJTgKXbPJDgtj/kpsSkdBKYp2fP1BOOUeJgiZ1U4oHvI?=
 =?us-ascii?Q?QIhxIg/TtTGhrVbnQJn9OGF07bfJVj9ET4txCF0l9bsu1D5x9ZpDm0YmUmHR?=
 =?us-ascii?Q?LbWx6p7FB0dl8bDcJzapKJVMoH3msyn+T1a4TYjLH+0YGPt72fCuAK053gZk?=
 =?us-ascii?Q?9n8f1AZBWwURjkAtG/PTWy8heiSflnNjY4xZr3iP?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2aae9a4-52e3-4f39-ce63-08ddea2477be
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 13:27:30.7731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7uQ+5r/xcUpwYGTkGLfbAixSRZNkJTZ0TeQRfNZ9jyttQkPatuwEdQUK89rMam0EamNuRqbRk4Y2MtHlRchng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6379

For ternary operators in the form of "a ? true : false", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/usb/host/xhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 0c7af44d4dae..460effa0e11e 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1482,7 +1482,7 @@ static int tegra_xhci_id_notify(struct notifier_block *nb,
 
 	tegra->otg_usb2_port = tegra_xusb_get_usb2_port(tegra, usbphy);
 
-	tegra->host_mode = (usbphy->last_event == USB_EVENT_ID) ? true : false;
+	tegra->host_mode = usbphy->last_event == USB_EVENT_ID;
 
 	schedule_work(&tegra->id_work);
 
-- 
2.34.1

