Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011022.outbound.protection.outlook.com [52.101.57.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A894225DB1C;
	Tue,  3 Mar 2026 04:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772512351; cv=fail; b=H1basH+i0SFzRUuo73klRjyXgFP35U668uQVim5jo+kIs4lTOGbJP2ZFE6WgMFJCMOun70XOA7dxdW/dEHvWnaLmGe9F9ZQKqs+zeeR4jZP1Tw8TR9AQ3m6xnsLISBAp3ACvufvKsaNzC/RHQv8RvbUMl4GpZRQ/tayUxWmpPAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772512351; c=relaxed/simple;
	bh=pRKWhbhYGBu/a3+4QyUFFOJCoTWlREAJbvXmocoJe3o=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=U41glTrIizvx0t+/y9vRIUp8cX+BSVwUpI3/zEBS3U8TS+/F7xdANOdGsJZ+2qZhDWUOJeqYvF5VGmgXWESQJvanbszFcMPPNCr2HCFL88V6wASGgsThOvnUQMLK+EN24xKR1RZ90cyghhNSofYXNZqOim5G0jFA8O8t5wAnnHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=boay59ss; arc=fail smtp.client-ip=52.101.57.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="boay59ss"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZJZnQytqvGzGDTVhVOfZ4ghDfV+vHlD5VMLPNWzgWZnzrMH8uzNk+pEGr7/Oa7s3QX9+q+32BHHbD4xtl6HpY7TbQDLR/NfaPd6C6T3CamyMLmvYL/uVfq/poWqND+F3vMnONZntm/X2j3I3G63NitFKDfJFSYUB05BjXx84ca2hFQO3L8sdrKlkSEyKEJ5TMy3iU2fhZ4efMSZ4DjUu0bvxWRIA55CT70CnaSsV6nkJ4nXOMo3y2mLP8U3Msvm9hL5gr03nN65RDHUdeaSpHV8n8LNlbsvrtkd0PxIvcChLLZHFzh7OHgT4E+00Qi4vTThvqAR/BBIPIp+k1+TXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn3EwH99vtlKlItI2HOwPTpMQgORHBL/VwqWH/zh7V0=;
 b=cS5p+GKZfjXeiaKeLSnFbqXI5B3huuZhlBO8hr+tB8K1M55firzuED/61V5LDZ60GQxghfR9msjSKYr/myiQYM+PzN9GscR8YaDJl+lcIiOoG4cxklIYPUhNy4f1kpo2ItuzmLerovUCWeKfF79toAc9om0uO1R87M7N+0OGCK/FOW8IX8ikADqAdWQ+AazLZrrqoPpECoOheHhaq3jWzZjonXzC3bEc5pFhhPPgQ47nZJpriFMbGibRw7LiOy80kQqI6vhd9xPnOLjkyX3ewhvpFXkvyFOzcOqJTXXKLxn3kyujZkIWtkuovXwx0oJO1JQww5JxhrMePOTQXADEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn3EwH99vtlKlItI2HOwPTpMQgORHBL/VwqWH/zh7V0=;
 b=boay59ssjUwmxGfYgGQSx9r8WU/gGvpByZy+5FFCJgfBQ0IhslExdjmz9VwY0SDZyLVtWaCN2/mx6Fm/ZKzasUtZ0zUj7cR6jQjfkHIl+E+MG/tSdYgEMOmAg1Bc81kX7Mryvt4V8iZI7SaIWny6InHE3lHwTRIjPT96tco8A66ghqT+9ew4ePcodZGOObaDcNDejYZ5Hs1cwX0MhAx0YEJhSG31lAAJvvaDWE4VJfPbfBaRlp925nUIoagwgaEH7hQd0XkvbCKKf126GCZX/44T+OLf6lB/8S9Dn5xRE6IU/iEH6AXTZRIrtx3IE5BoJBifmfZ+AaFrKuMkWkepWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB7305.namprd12.prod.outlook.com (2603:10b6:510:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 04:32:27 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 04:32:27 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Tue, 03 Mar 2026 13:32:11 +0900
Subject: [PATCH v3] i2c: tegra: Don't mark devices with pins as IRQ safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-i2c-dpaux-irqsafe-v3-1-75ca95b96666@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NOw7CMAyA4atUmTFK0vQBE/dADHm41ANtSSAqq
 nJ30k4gIRZLvyV/XlhATxjYsViYx0iBxiFHuSuY7fVwRSCXm0kua54HkLTgJv2cgfw96A4BneW
 qlq1RXLB8N3nsaN7M8yV3T+Ex+tf2Iop1+0+LAgRURrSqwdbYQ3MaIjnSezve2MpF+UGI5hchM
 1GXlVZWlUbobyKl9AZ+yLjU9gAAAA==
X-Change-ID: 20260202-i2c-dpaux-irqsafe-edc04628b401
To: Dmitry Osipenko <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0362.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::16) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7db5a8-ad37-49c6-415f-08de78dddfac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	8XYjndmZhOkuAuLEPNUXcZfPbRhXIRL9nuDHhi57RH8TbxdTGqh4/eGE7Yq+0/t72fTpVtr7pQytc8S/1eTaIfPpng/IFADCGOgU2jC9e5c1hOcPitBg6bXbDPI4mRlFVm8GXpr70yi6PNiUvOR+QnB7M65JzDJWUVZGjKVrzX32rd8DSWAtcXwzSilW1QnmYaVUhfkMjlmUkW1cB4LSpGXBqXfIxHFNRr/fJh7PqMlzMH9fskq1m1bnb8pgXc8mPQtOUnWVrbNEANbEQwzg8Qw/cVxGg+Ax7jq86w0Gr8F7k/AE09wK/x8IE37glJ8/82v5yY3nP3DeS/NIL/+JDJs/BHE91CL44x0Wa1jt8YiMVJhWnzFaGsk9WyDHEv/5t/K7Isb2yLUqJW0aqubgkz4WavG43GMbSiXZekkmyQtNGwMaU0EIwDNW7VSUTi95Lhntu6s0eajI8Q4y3lkuih+IVoErHjshjebF8SkI1RlyPoaIHXVvrgxMB2SuUmviPuuEVA9uWCBH6cf2qUl96LWKKHCufWRXlR9fh7D7IbxvomqrjWfEFW3GpzcWJ+Qt1FAWphmwOUt0e69cynnxc+a/cXQPWkYCdjyOU0/2GTIi+6csgNQlkhpb+mul3nDMaADlQaLzGG2ErmcLsuBQF8vl4KPaytHHa+bwiqrF5BS9OzkDoyAZ6n7BbjooyrMjBBFMFN+IF4HTgyUErzOKwjnw28ANazwykcRxGEnJQLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1RPVzdHdmVIMEdHckVEWVV1cERaa1FJOUN3YXdjZlBsNVRuK2dEcHNTWi95?=
 =?utf-8?B?TGNKNmVWb1JmaVBqb0pZWW1qcHhaNjI0OS9xU3hlMDNkazF4anNYRTdaYm96?=
 =?utf-8?B?bi9oaVM2cDdET3pnWTg0YUpBdEVNUCtlWHBhSHpMLzE0bkMxL3NYT09CZ3V6?=
 =?utf-8?B?eEFuSmpGVFhFQXVVOXpLR2xxbmNzMXZUTmdNZ2JvNWlzTi95YUpwUlZ4MUM1?=
 =?utf-8?B?WlErM1dhdThIdXdrUEt6K1BKSFplSXFBc09SaUxCQVFNaDJWd0pFK3N0RnpK?=
 =?utf-8?B?cEcxS0MxTWZGYitaNjU1bHF4a0RrSENOVlFuVGhvb1kvWXlYcm0rMU5QN3h4?=
 =?utf-8?B?akJRMFN0c3pOZDFSM0psaWhqZkE2MGVaSDZOWTJNSklXcEpqbDdyUGRUUTgr?=
 =?utf-8?B?QlBwbTJPTFFBY1NmZzVBN1Q4Z2xVdjZFbTJyS056d2tYZ0VjZHpQV1NsM2FG?=
 =?utf-8?B?QW1vU0gyT0U3UGJsSEdTTklqaHdBRkxZQjkvVlBjRjZ6N1RMYjVjKzh0LzVn?=
 =?utf-8?B?b1dLUU5XNkJaL1JQSnNHL05kMzdodHVvNTg2OWFyVk9EY0tUZUlxQldoVGZS?=
 =?utf-8?B?YlJCc2RxRXhqVzM4MVpzTlZBdjArVW9lbUtWc0daRzlQa3JFTS9EU0JlWjgv?=
 =?utf-8?B?Q3VvV2dCUFcxTGZ2S0o2dENNeXhIdU5EaFFBdHRFVzRtM0tEbm8wUmJURU4r?=
 =?utf-8?B?NzkvZms4bTRBQTBoNElucjZ6QWdDbkNpRWlpSHErR2Evam9HbWNIbXpiQmxQ?=
 =?utf-8?B?eDNEMTNSeVlkbDRnRVY0ZGx6U2wxUkx4SnRhWHk5TTFEeG5Rc21wN0pRZWJh?=
 =?utf-8?B?Lysyc3grUHVjSDFubTRyWnQ3UXA2d04weHNScWwzSkFhWnJzazI1SVZHU3dX?=
 =?utf-8?B?ZWxqTy83Mjk1WDNaSXNXK1drYkZJVmdHcDdndVljT25EUmloOUdmaE84dzdD?=
 =?utf-8?B?a3pFcm45bm0rLzlwT01XcU04bFdxMmdyT1JONCtpSDNOaE8rS2FCWU1JKzcx?=
 =?utf-8?B?eTNqaGVzZElrM215OWxjVlBJNXIzbmF1d0hnWTJhNFlyeEJCekdCZkNnUmR0?=
 =?utf-8?B?S0E4clNRQVE0ZW5PT0VFYVNaclBlQnduZ3ZBZEQxZ1F4SjE5bXNYMVJoTlhi?=
 =?utf-8?B?OE95RVNWMDVFelptUDRxZjd0cktUVzJaNFA5bWs4NG43Q2xONkNjTVAyV3dC?=
 =?utf-8?B?OHZndkFMTWlpN2Yrb2kvKzZjOVI2VlNwNE1FRmY2YjhFRWFVS2hFQnVYVFR2?=
 =?utf-8?B?WEQvVzlndms3SFNjenRMeWhEdlRaWko1Q3RrMDIxUk9veVRTa0hQdWI0V3hK?=
 =?utf-8?B?eGlqSXE4SE9zb1cwT0dieXRCdTQ3emp6Y1htUzNZN1pXZlhmRGtrc1lPZGdt?=
 =?utf-8?B?RVJXNUNnUlRWcXNTYS85V2ZVbSszcHhTdjdiSTNoZXhRNUdHWE5hRmNhQnFm?=
 =?utf-8?B?WGdQRkM3OTVNdGxRRDFMK3BEOEE3MktPRW1Rc2F6bmZxUDd2RXNNWnU1VXdY?=
 =?utf-8?B?NFBFWFJyZXVpTUpsTU83eWF1OHQvS1lRWXBUQThETVZuK0tRdWFDVHYrZDk0?=
 =?utf-8?B?ZGdVWkFJMS96NjBkc2JjUEJnbG1uT1Iyb3dwQ243bFNWTkFaUHZqTEtUTnox?=
 =?utf-8?B?MkpFR0JMZHdyMzlZbDJ5bHluc05kM3BMSFZ0dUlyb3dlYlZTV1daTzFRMWds?=
 =?utf-8?B?QTZYdlRQcWVQdVg4L09takozdGJlcXM5Yk1RRno0MVhqeDZoSDlhK2FTdWZC?=
 =?utf-8?B?VXpvbjF5Zzc4NHZJZ0s4TkdXMjlQS3Z0VjNaMzQzQldCSlprWXBMM3lmWnY5?=
 =?utf-8?B?SUJQVk1jTjM0T0hoVGt4TXdLSmd3NnlJOEwxdXZKT2k2eDFORU9TbG53WTNH?=
 =?utf-8?B?Y1IyeWh3K2JDNy9XcGFlMUpjN3EwR1FPQ3V6V1FQNmNneUY5d1pSQnRhdENv?=
 =?utf-8?B?V2cyUjJscXVJZ3RiVldXN0JNSk9ybC9hN3VsQUtqYkV1RTViK1E1SnNhR3JB?=
 =?utf-8?B?ZVlnZTZZWTIzZlhyclYyOUczME5DNC9Keml1SDhpMVhPYU84cVVlNWxnWHdI?=
 =?utf-8?B?VHBUUVFZVjBpc2JFMTEzMUtRbUY5WDhkWHF1L2pnQm8yckVrNzJxaGFiQW9G?=
 =?utf-8?B?Wnd2azZndzFxQWE0K3c4MkFURGJPN2NpNnFJVnVNSWZLaW5YSnFwWUdjZ1dw?=
 =?utf-8?B?cjFFMWR4MGVGcW01WVZGV0x1WHlUd1ZTemtUY3VQOFJTeW56eXZSNW14UFU4?=
 =?utf-8?B?c0ZDR25EY2VVVGx1bmlINDZYR2YwTm5leXBXTUtZaG1Od2ZidjdyWll1MDVp?=
 =?utf-8?B?MkszbGFFMUgxbjRBU29kMFNqZXgydUZoV1NmRDlZTm1ZK0p3ZDZLeE5hQk5C?=
 =?utf-8?Q?1zetneRPbtxKagw8ZDF/gFQMwbABMYaKEpBY10r2u7nVF?=
X-MS-Exchange-AntiSpam-MessageData-1: BFkV/kbKRBbiew==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7db5a8-ad37-49c6-415f-08de78dddfac
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 04:32:27.0554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ln+Bwe5md6NOshvHTt/xOVHbB7tBzlYaBC4N8Abzyz4fDNywt530TPmt+Jv5U8V3gAX5yj1JU5Z2d8bmT752ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7305

I2C devices with associated pinctrl states (DPAUX I2C controllers)
will change pinctrl state during runtime PM. This requires taking
a mutex, so these devices cannot be marked as IRQ safe.

Add PINCTRL as dependency to avoid build errors.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
Changes in v3:
- Moved PINCTRL dependency to its own line, and added clarifying
  comment.
- Link to v2: https://lore.kernel.org/r/20260217-i2c-dpaux-irqsafe-v2-1-635a4c43b1a7@nvidia.com

Changes in v2:
- Removed incorrect reference to lockdep in commit message.
- Added PINCTRL dependency when building for COMPILE_TEST.
  Tegra platforms already globally select PINCTRL, but COMPILE_TEST
  configurations may not.
- Link to v1: https://lore.kernel.org/r/20260202-i2c-dpaux-irqsafe-v1-1-5b1847e8bc97@nvidia.com
---
 drivers/i2c/busses/Kconfig     | 2 ++
 drivers/i2c/busses/i2c-tegra.c | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e11d50750e63..7cb6b9b864a7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1213,6 +1213,8 @@ config I2C_TEGRA
 	tristate "NVIDIA Tegra internal I2C controller"
 	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
 	# COMPILE_TEST needs architectures with readsX()/writesX() primitives
+	depends on PINCTRL
+	# ARCH_TEGRA implies PINCTRL, but the COMPILE_TEST side doesn't.
 	help
 	  If you say yes to this option, support will be included for the
 	  I2C controller embedded in NVIDIA Tegra SOCs
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bec619b9af4e..4eaeb395d5db 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -2047,8 +2047,11 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 *
 	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
 	 * be used for atomic transfers. ACPI device is not IRQ safe also.
+	 *
+	 * Devices with pinctrl states cannot be marked IRQ-safe as the pinctrl
+	 * state transitions during runtime PM require mutexes.
 	 */
-	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev))
+	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev) && !i2c_dev->dev->pins)
 		pm_runtime_irq_safe(i2c_dev->dev);
 
 	pm_runtime_enable(i2c_dev->dev);

---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260202-i2c-dpaux-irqsafe-edc04628b401

