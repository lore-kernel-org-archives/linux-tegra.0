Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792534155;
	b=Ok0x4OGezaKI7lGSzL1wLnGh/VF8NaEvizGPdeCdgzEvCeT5KpbOsONFIXaddG084cDt
	 3t7BZ9pwonlH2lqedqHl2f3omjan4MRNGWYJRZ06Dn8KutDt4rX+S1W4PgVCMxdF59k3i
	 +S24hOvOCZEdlsT7AJEP2gFVZy2iKdYP+rU/39RrYFpZQA0yYMU6qPSxUFqnGiudv38nL
	 gAZ1ZDJRpFcXcOwiO6mQ3VeCowYD0GaVt01KeeoAAjrCO81bdZ4lGcoqCRTrhwg8dVWX4
	 86+9SFtXuS/AIf3yLvv7iFzF4p7FgrpzZTLtY19Rex2PTUinznIDTyHJuGJYmVjE1VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534155;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uCbf5cVz6mHS/Yu21a/3iw7ilTyUHKrzUpxfQZNpQAQ=;
	b=HwbE1uUknXqApLKtnwFfx7R5sfFXaIt1YR92QyRkUXvk9CsJK/UlpvfMZ6QSr1elO4VL
	 4vlhsHTiHCevRhmqBtN0RqcF3Gmw2XX0c0Sry+2yEqnOpyZov4Nfb1kYRRrgfpI8vvhFF
	 iduyvoEIJFMbp+j2PmF7ekDiTTKG/khMzZbOK0xya9B7vcVNqZNFb0vHfCCe3TPpVo4tC
	 9jG7TXTQ9DhQpxatkJXN6lPkzhTERIqzcIaAwZQnc8dCrHzhwl9UB81lJuPQFb5N0VyKF
	 WN1WxgVk5LXYU29h9eY/n+CWfhi1VkrsjvrgPtVEkWnnt3J4qSUyOaUD3lZk3IElVVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GoiACrRY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.67
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D2D606A31B;
	Tue, 20 Oct 2026 22:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D2D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GoiACrRY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p51eyZzoRWQvSmVXgf3DdnhUTjT14zyJYWB7dhmhHMaWNZmvUHFpT76BgaIV2FcvXoC7vheN2FNBNA+oPn/JlPOweFotbXg5PYX6gjsVSZ9tuaYOiwsx6p+TEnWWh9cuFhHUr1tI7l7qB8zD5oyQjaZWHHBGMtZDf4dZLzm7ja3utDeWb9VR/MH7tSJMu/DzS4Wc9UwIxKS7WWwsGOLc2yRLZbCKnu3nS/GFlIOAu+5LSvm+qVmKq2ATwtbGRuq9ef6nLBC+WDNQWztLMaHLg59jSCAA42Xwixyo99sU619bk2M+elAFVAgJw/uefz3Xk8pT95EWUMWwGlf1x5kMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCbf5cVz6mHS/Yu21a/3iw7ilTyUHKrzUpxfQZNpQAQ=;
 b=X1rvasiiX3Mk8FLN9UgX57eSzd9a/+37uuUTCO/yrGCn9EukzWrumea+whlvpuasOALxg2A5O8BOmXZKvZVCPEB9m63W3AxFzrh7xhT/c58uxwDlg0a7lXDkiYhEU0o53BbJZttaBUJ7uT0xvyGXaLvVZcrbHRDdy8UN2E7fyFPdosIhKrtDU2AHM6eMZEq6uPz53obL+XWmaF76BMHMyPUgbK/fj8z5PAcY3tszGJIuJz6FkAzPOND7tfpzJlT3ZxpxLK32LoFRT5Nd4u4YAeHdT5ty8KJHUB5Us646XyottLACEN91Zt9ayc77XvKMinCuLx5vzaAAzXn5fND3lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCbf5cVz6mHS/Yu21a/3iw7ilTyUHKrzUpxfQZNpQAQ=;
 b=GoiACrRYp+2ZMsW4SeymY2dI5E9FjboJo/sJUf6OHIYT4nivooavH4Ss6NT2X/kBpp0K9YGwfOukUmEH1aVDozmHc1SG6KsPUE+FMNqEpjpEJWPlqCeuvN4pJjWNR8hV9YQu14UzfT/QvbLWM5s5A7FVpVi9SBRMTqmK+YuZZB3TJowJ9TElsHFKTftNpHHpvAJ6IDRFeRK5W+6jVXUaIRPVmHImixbAGFkh3hQwv2VjR5gzGvKa8uppWwxNMEoFyUFS+X9j3XT4iW2k3gxLrBy9jIR7+s+kiCmnwGmZvTrQ2VLy096KdCdU6LQqaSHLkYlQd1hxkKzYuxx0l/EujA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5102.namprd12.prod.outlook.com (2603:10b6:5:391::21)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 22:09:12 +0000
Received: from DM4PR12MB5102.namprd12.prod.outlook.com
 ([fe80::36e8:500b:ecc:e0f4]) by DM4PR12MB5102.namprd12.prod.outlook.com
 ([fe80::36e8:500b:ecc:e0f4%7]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 22:09:12 +0000
From: David Cemin <dcemin@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] firmware: arm_ffa: Compare notify_id when looking up notifier callbacks
Date: Tue, 20 Oct 2026 15:09:01 -0700
Message-ID: <20261020220902.611138-1-dcemin@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:a03:255::10) To DM4PR12MB5102.namprd12.prod.outlook.com
 (2603:10b6:5:391::21)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5102:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: e8709847-b20a-4fdb-8ebd-08df2ef6c58c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|11063799006|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CTGyEVu8Q0YgauRJxsG8EfMQ2og012bnGoiLQiA64mYupRRE/5n9yyxdzrh3Naq4H+vEljad+QKvDnzp5jR1ZHAo/mL1QjOADmsauf8NZR5sVYVAcCL74q1DDfix5AU3gvw2atBFrAp72POOFhZ0I2mDP5hFxFURbDf5ldI/az7SNzHAP+iUdjTufejoK/1jLeMl5LRbsedfTMyqPkbzCMPqBeOxGm/CNnoUrP5SL4ZefiODgDpiUVELhKD7rgauGXoI6DVZYxnvKMLtOhsYmEklrpT79YW+4G9nLN9Y45tf00j3eERU1EtRoffdypB2B1fTn92TlE9kv8DeaM9v9tcQIrrJj5cuLK0+IGQf0r6OLScnagF2Ppo7iUalaVow9F64NW+Q5YbRy4nFtydtPAnhqaRWjGdpWrULxDFt8fQo2960CjPJf2hW8Gl0R+zqeV397TMEywbbofpUIl1A72t+mJxJKrN97lyh2KhA+4fdg/dEeD8ovoLuIGBbTBgJ9ywQKYjVn64XfrZA2k6zAsE3HZ3NotpNE+nmtl9LKJHDE29X6EHKiOFV6v6mM5ud2cBEddSQ5At9aaGExvJe7bSONOD4tWTFrEeYcrguTCabrLeYtq/crD/yqmf26zExo7IJD+ZZE+bKx84wwfwxbCE7MNv8NE3vZk2ASpFVPeE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5102.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(11063799006)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q7yD/jKhvowCXLv2FwZiDLyWZtnG24lDIj4uyf0VO3Ojh568MkAmu1/tsKmq?=
 =?us-ascii?Q?NS5lrkUvBm3LJGHGTRktG0gRvRNQlzHUE0fFMPe63pWnkXVIMVXZyyoEgfPs?=
 =?us-ascii?Q?bdQ8zQ1Thz82gzYIVUIJbk469odVygIOBipb3i6pJppTkT553EHStH5ObmdU?=
 =?us-ascii?Q?nD4pB6Tb05T6BL/f4S2/RNhQ3p8BwjmW4NH774GjeX/qgZ9zGzd5mef9axP0?=
 =?us-ascii?Q?CwuPsEl1m/LQlAL4mjVQ8ZJbqS4zON0cUvXcPdHA04PGO8SpEUVnzi+dw78b?=
 =?us-ascii?Q?9uimTxwva0MLUxCKFzIQl/vtpHDIouUlfH4X/SmlWB/KPXWScCPdXX1O9Ioo?=
 =?us-ascii?Q?f7/4TONh6avAC0jjsuUG1s/asrGCBrIEywcjp5fwpvr2VLDGje15/lGwVwsU?=
 =?us-ascii?Q?VGe2Lnt11/6PprgB80BypqA4VAi736n3ehaU0pmcqCW72USXNMBbOvHDQJUw?=
 =?us-ascii?Q?1x3VYZ9YrHca2NRC7Ya4pOU2p1z4EkeNe+KuWOR8RLyP9aUJ2otmS1fBH1XH?=
 =?us-ascii?Q?qWmdUzZy8Pzi8hTgI84qgoFmXlx4hnyL4KvRmqYDZN+IG9AMHfHBTDAkPjVL?=
 =?us-ascii?Q?JVDE/Y9Ut+WB6JX6pR2wgUO1H7scbMsx7dbDLhYGgYORE99XwQyPmR1INWyf?=
 =?us-ascii?Q?soaJdE8FTtiEInoTq4AUPR5HDTASZpPXezTFN6NcOEdNcOJ/mqtxFGv4c2Fs?=
 =?us-ascii?Q?kM4DtOwHXMIEPwj21n9tAYScN1Pcy6ImKHgJiHszE3TaJ4uX4iqU8sNHMZNU?=
 =?us-ascii?Q?dlnFYYN5hLSoI2cBNvfa5X0u92wH3vmNG5XC4ncVoKbsgvWMVxLJnDOiqtIp?=
 =?us-ascii?Q?zHuwbrPrQzCLitS1ymJhHZiSG2rXPYC7liqbleZHy4dwKB4e6lvEYsS13rEW?=
 =?us-ascii?Q?phoMqcAGbkeEAI0DcBAR33puCAXWYc65zz1G9bkzYHMipwiwmbAxMg2YdaPC?=
 =?us-ascii?Q?AthGpdoiHSn4UZNPxS0JQBJedD09bFIQ9eoyTM8ZybZhWlqphUtx7hVgzgqf?=
 =?us-ascii?Q?g6722+14nGucQ3v7inw4lpce7UGG79VQIJWe3VULYzN7tBPOhH+MhO3clwHF?=
 =?us-ascii?Q?we5L5p1bFZuy192hUgWtFM1wXNP316d/2284BGrppUAjBmn6J4FLC1ZsER7Z?=
 =?us-ascii?Q?PN53WeFhBguEhjgrK7YjD+5+ZRtbmWqqnK+0p7Nx8rz+I4sWf9Y2TiXdDq+E?=
 =?us-ascii?Q?xn4IC7uE9e/fWBTzKilTjD5YnMF9vgNyx2s7Fm+TJo14Ve1EKvrtOS+pn74h?=
 =?us-ascii?Q?GUITxq14dWC7eWPiGUjAbtV6I1Y9oSalxUhmG07vqttCP6SFf2jkb5Eng5ZE?=
 =?us-ascii?Q?SDOQpzcJ6+Roqh4XWmJGY/ZR+XELbJ8o+GgU8RzBCPh3bYEd1wy333mVWQPN?=
 =?us-ascii?Q?3IGQMbLa0YPyyXMkK2i4PBMaj7geVYfYQLar+9EiZ5DyNRKymEolotPADqdT?=
 =?us-ascii?Q?FGJLHVbnltYVf1TicX5MgOWUNzjrTfUHiFhWXGs6x3GPb2SiclRqPtAAaieq?=
 =?us-ascii?Q?Jf8jsf8ZEVCJcxOt+dvVGHJ7YBLTFcSni3aAwbsE6SdaZDcPDRYc6ro3oF0b?=
 =?us-ascii?Q?OVaLwodWRXJOac7hcWCTeGVGudHks4xPsPUL5ObunciNKIniPt850ZF+64w8?=
 =?us-ascii?Q?W0bdzdYgKM2XzvRmjI87ymggKLnbOh7v54TSsqjCkerWl2gihdBPsYrfxxH6?=
 =?us-ascii?Q?Jc8ba4zuSQlJ6tSkE0JxrqwEyEVElRl/a35to6A6mNseEWVl/tPVrNPRS4Gj?=
 =?us-ascii?Q?ZYzEyBGA6Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8709847-b20a-4fdb-8ebd-08df2ef6c58c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5102.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 22:09:12.2074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w46MpTj8SnLnj7oIPupA5pEYRNtckrp6wSpqCnR3ZO7aegJmQxG7XM+w/vfNk0TFVuD/8khwMEZlbpfKvKRbzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373

The notifier callbacks are kept in a hash table keyed by notification ID,
but struct notifier_cb_info does not store the ID and none of the lookup
helpers compare it. hash_for_each_possible() walks the whole bucket, so
any two IDs that hash to the same bucket are treated as the same
registration.

With the 64-bucket table, hash_32() maps IDs 2 and 36 to the same
bucket. A driver that requests notifications sequentially therefore
fails at the 37th request:

  ARM FF-A: Failed to register callback for 36 - -22

because update_notifier_cb() finds the node registered for ID 2 and
rejects the new registration as a duplicate. The same lookup is used on
the delivery path, so a notification for a colliding ID can also be
dispatched to the callback registered for the other ID.

Store the notification ID in the node and compare it in all three
lookup helpers.

This was found on an arm64 laptop whose embedded controller partition
declares 38 notifications: the EC driver failed to probe and every
EC event (AC, battery, lid, hotkeys) was lost.

Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notification callbacks")
Fixes: c10debfe7f02 ("firmware: arm_ffa: Add support for {un,}registration of framework notifications")
Signed-off-by: David Cemin <dcemin@nvidia.com>
---
 drivers/firmware/arm_ffa/driver.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 28abc808fd32..ae8cc3a2ba2e 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1223,6 +1223,7 @@ struct notifier_cb_info {
 	ffa_fwk_notifier_cb fwk_cb;
 	ffa_notifier_cb cb;
 	void *cb_data;
+	u16 notify_id;
 };
 
 static int
@@ -1302,7 +1303,8 @@ notifier_hnode_get_by_vmid(u16 notify_id, int vmid)
 	struct notifier_cb_info *node;
 
 	hash_for_each_possible(drv_info->notifier_hash, node, hnode, notify_id)
-		if (node->fwk_cb && vmid == node->dev->vm_id)
+		if (node->notify_id == notify_id && node->fwk_cb &&
+		    vmid == node->dev->vm_id)
 			return node;
 
 	return NULL;
@@ -1317,7 +1319,8 @@ notifier_hnode_get_by_vmid_uuid(u16 notify_id, int vmid, const uuid_t *uuid)
 		return notifier_hnode_get_by_vmid(notify_id, vmid);
 
 	hash_for_each_possible(drv_info->notifier_hash, node, hnode, notify_id)
-		if (node->fwk_cb && vmid == node->dev->vm_id &&
+		if (node->notify_id == notify_id && node->fwk_cb &&
+		    vmid == node->dev->vm_id &&
 		    uuid_equal(&node->dev->uuid, uuid))
 			return node;
 
@@ -1330,7 +1333,8 @@ notifier_hnode_get_by_type(u16 notify_id, enum notify_type type)
 	struct notifier_cb_info *node;
 
 	hash_for_each_possible(drv_info->notifier_hash, node, hnode, notify_id)
-		if (node->cb && type == ffa_notify_type_get(node->dev->vm_id))
+		if (node->notify_id == notify_id && node->cb &&
+		    type == ffa_notify_type_get(node->dev->vm_id))
 			return node;
 
 	return NULL;
@@ -1422,6 +1426,7 @@ static int __ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 
 	cb_info->dev = dev;
 	cb_info->cb_data = cb_data;
+	cb_info->notify_id = notify_id;
 	if (is_framework)
 		cb_info->fwk_cb = cb;
 	else

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.55.0

