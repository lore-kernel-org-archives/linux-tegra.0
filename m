Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E14930F815;
	Thu,  2 Jul 2026 04:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782965468; cv=fail; b=HlKrDkc2nD2894q1EU7nn7YoElR3cK88IiObWZVK+ET1LFk4ohGAG/louOnyjujXLGnOCTefnAhzB3Mj4B4bZzi+hwK8u7rHbGIVguJdeqUyy6Zhs4GtmW1ZpFXTqTbxzC9Xs80aGEEp4Oiae2gXCUzdjA0HNFDcS5FpLtY8STo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782965468; c=relaxed/simple;
	bh=81If45SjF1abNiOH57pswBrQj8iUwHawoXF/+cHwY48=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AY6vvxN03o32TbeUbpuaqc9uIqqZYYU+D67XWOHmNSLAJF7b22TNbzvn+IzNWR/ye9tnHs+OJ3NhbD3rinXn5JKhbf8xBKZip5VodwDznXHD/p4t4cBh6g+TkV4mYrGUyYKFRIpg6rAQoCJdiKV1H/dNCm5idy5skAJuhgaU7S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LF9nvSJS; arc=fail smtp.client-ip=52.101.48.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LF9nvSJS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arQ7UaipBMifXn27ls5sX46i0R/HALZ9ztl1ia2YcvliwrsF3qWEoI+TReUfrpyLaNuYSO+2QKCTEbzuMLLLHk9RtjxFCfNMlftFokNa6C24DeYypgt9zhiGja4Lwlhvylz3vvKcSTcl15qrWa7C5rNK/OUz5Tg3xWdTSJ+Tl0ii6BQTTrjsoj0fFbhHikKGH6OVQAA1FCuJAwH20ukvsfnBy7JYy9RWkA6Qkt1kUnSX/xmhzpD6epynQ1eGWOQPl6Y8ZvexqUQJho7sr/Mgj3vpsR/ATLT1HSAYoSOV+Jv1DSu6WBg9DQl5Mevy/B0XSJMYHwnktf85wPh+XKYarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxZo70fjSvnvHlkWeYhKZNpnQVbcu8pLhPUnZd4LY9A=;
 b=nGKE5GpW+sp0zcWaVEasy6Q2U+mvDankXiZ3vGjd1UfwCq7SmQrsOWZPnT4Rrm9D7INWdUOwrzzqoVYR5iiSQlUSkl/ZnG0g/m/DtArfAT1te9EZojzk/E7l9OUQOh/LOl/TLsqNRL9ggzVRcm4WOeN2YGsixAKzbytAGUxTKYJtEZSkw5khgkGe38Z08md5J7dOrzxlTQlEcMdrruPCzwHghlThrwHilZnVVI+orurMdBfjZokH7xz/NhKvwwVvAtJ226rMnKgI5Yt7NldD71qCZ/OaWvl5oQVsKAQ6tPCVHp1zG90Xh0G+/Tl8nkkmdlbcqKOoGmGTFdUAh0mozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxZo70fjSvnvHlkWeYhKZNpnQVbcu8pLhPUnZd4LY9A=;
 b=LF9nvSJSfJdUtWbzr3OI0slmZJt7nRy3KqaiBI7KE+1WQtZPt7onysKo85xD22bgrYV+vMaWBx1080pCckviOjmwmBfGtSpFSaPGPaUVIS6Yk2r3ohS9lSHHGNm8LwZ5Vd0wRxJNYaKAoxETRKIt55Ge3Xqg9BI5zrsCoOgCTTYcjLU7wUUaarknprw+SmoIs2hhdVLRrpJYC89Gr82hxVWfPC+JSyg9jyOQv/DgHVVJJUrJwn4/1g1LoRWRus+Vl6o7GAEP7PQVbUZV39+BHCqLY1wdawDCf9gsyuLR0/3yGc6WnzciE0qtHCdUzlnPzDFIw1kvdvfYchl9oCaxpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 04:11:04 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 04:11:04 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Thu, 02 Jul 2026 13:10:27 +0900
Subject: [PATCH v2 2/4] dt-bindings: display: tegra: Add channel/syncpoint
 range properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-host1x-nohv-v2-2-e6d88bac0af6@nvidia.com>
References: <20260702-host1x-nohv-v2-0-e6d88bac0af6@nvidia.com>
In-Reply-To: <20260702-host1x-nohv-v2-0-e6d88bac0af6@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.16-dev
X-ClientProxiedBy: TY6PR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::13) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH0PR12MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c90c05e-3e29-4e21-c7c1-08ded7efef3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|7416014|376014|1800799024|366016|921020|6133799003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	SvGT80hTZSB05qQjajgAjBVFfPW7xaxpIktqGv8rqdboxBTxWthNdXPWQo6rEp9yC88ou5Q2kABH+RW9Vi5+zUBrLi8R2Yp7wKkN3achJJmmR3FH0CgXNhVWTzXwHyg7LW4b3gTbE1roUrhKZyIlsOAPoWgyb2tqyqsJarT5jaI0Fnu086eXiVzd7xgiZg3ud9vk2GABUGuSy5fH54G/aUtuphobR6sO5XvvmZOxLeYRpAN2lWA+vpnOylaFbHOKgjnfU8ncUaiw119Uh2FYL/W+040jScEdqwVO/CpuYvm+gi/pXXqsaiIqdRJs7AJ7f4jAjiTgbv3aafIqFvbXjuH73Wuf/92C+Pu6IrgyFaWYw1vsG/oGG4x3k52b/6clrZGDLpucLK1TQncaqNimuEk3RfSFHDjbUAPU1SqCBJzDgKwcVp8ZGxZ3jwQUPTO9xgbIPukUzdNf6W+08NBKZ4Ji4adyG8Q6V2lUYDs0TE+vZ8PLNgyPhSbaa6lsNDenGbGL1G8j85pa+gThPyPW68GbOiJxWH6wCB4+AKFxEmLYxm4mYozMhQv6izjCrz7/E7NlSNJLt9RCjfs5xmyt7kp7sQik/COva8WExpRZaVZqUVPeZDBHnDh0eT6HY56Sh+ypUUIRkU8RSsFHJJVCBS2Ze7OalsHJKPw5y+aSZBYwH8y+RGI6lYcOIWTjPs78+QRTEhKOzwNWNUqsKv58yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(376014)(1800799024)(366016)(921020)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c21hSzRRMHZGSWxseWNlS0tncnpyUkRPYWM5eEV6QmhUMnpHMEl1aGZ3UlJn?=
 =?utf-8?B?elBBemxkZnhIV0tJNFBVNmtjZjlyamJIaXAvVkRhTmR3dHFjL1QyTmFsWCs1?=
 =?utf-8?B?d2tMOTF2N2Z2a0VsNHNxbElveXYwM1lmVTNoS3J3cnE3aTFVdWtabEtxdGZE?=
 =?utf-8?B?Z3h5YzBsMzhkSFRjWlJPQnJPYXdzQ3NqTVI1RlpHTnd5RnpjUjlPblNTdHY2?=
 =?utf-8?B?V3ZPOUNieFlVazBJLzFyd1BjcWNqY3pLYkJiRnlGTjh6QVRjMnZ5TWQ5dVc4?=
 =?utf-8?B?MHFwOWZISklTSFhsd0k3bVdneUlYZHhFYlJxMDBNTU4rS3pOVkovOGYvd2p4?=
 =?utf-8?B?STJtcDZka0l1dTB5V3dpNEFsSmJ2a1lvalJlZkhFNVVNR2lsWEZOZVFqQUJL?=
 =?utf-8?B?OGxKaDJOQTBkamRRd0t3V1IrcWNRV0JFVWl1dU5MTDlEKzZLd016dnE1ZVQ5?=
 =?utf-8?B?aTN2a3F2ZnRmM1JldC9reWFrMUFmR2FrenczSldhUmtEWkYxUlZTQWNvRjFk?=
 =?utf-8?B?a3I0UW4vT2NIQklVbWkwSFZ3M0szNlZFOGNQb2FqMGZrVXZ5K0dvSngxanFl?=
 =?utf-8?B?cy9YdjdDbGdwVzNyNDhiUjcrZTkyZXZwWERtQkhySUNVcnhwZmJvOVhpZmda?=
 =?utf-8?B?ellweW5URjNKTzdvVFBBcWJuRXAwUmR4ZjVpTUNIUVZmdllqWXZ6NkZmcmpU?=
 =?utf-8?B?em9JVUJ5cUFudm5JL0hTa0dsbVo4MGhTK2NyYkNoaHkrUUJGRjFNMC91M1Vr?=
 =?utf-8?B?SVhwaXJQMGRnQmxEVW9RY2h3Y3cxTkFtdkNLMEFSaTRrTUpaQVVmb1A3VHh3?=
 =?utf-8?B?dTFNa2QvaGZpcVR3ZytIblBvK2RmRDJ4dFJFcXJDOUVZVVlhOUZFNDhyLzJI?=
 =?utf-8?B?N3VydFRsR3RFOTBxMUd6ZDVrR21sRklkbjEycnRMRjZZUFNqYUtMSlZCNFRo?=
 =?utf-8?B?a0xMVm1hWkRyNm5nVkVTSnpZSUh1SnR5bVhWSitZTTI2QnBONHptazUxSEt0?=
 =?utf-8?B?K2M5dEZzalRnKzFWWHpFdWdXOGJUSjVic2MvNDZxbHA5dWNmRVovajJRODBO?=
 =?utf-8?B?ZGJpU3ZLT1ZONUZkUzRWcnJRSTI3N0IzRXVBWG9KUjYySjBRZ1oxMFF5N2hO?=
 =?utf-8?B?VU1SWHl2Qk1ZZThkQVp3WjhSTWxjQVNUMkdMRUhMUDVPeGhSY0pkcWJDUHRl?=
 =?utf-8?B?VnNXeDhhc3oyMHFBaG9lSXV3bjc5bXNhZXFLYzE2QzJRUE44SkVPZEp0QWl1?=
 =?utf-8?B?c3h3Wm1jOWZkYTRCeW5YWDEzY3BTUHZBVGxDbjRmU1h5SW9UZzlmcnRRTUN0?=
 =?utf-8?B?WFVncWhVUjBNWW0xSzZrZkpLSVYzVWU2dXNNR2k0K2hNV0hMdkNqZlhtUnBO?=
 =?utf-8?B?K0wxTFpocXd6aUsyM3hVL2pKdHhQSW9FdER3R09lbzV4YVpUSG1BTEJiNlJp?=
 =?utf-8?B?N0p6K2ViR0xLS3BEajh3QkRjcFB3TzUwWFh5RFk0aXN6ajJHVHJxdmh2UG9N?=
 =?utf-8?B?dlZrU09JcjR5bnFyQzI5QlBwNDNyakErOVB3Mk8zZGRVMzgzaE5rbEVJVDRH?=
 =?utf-8?B?OTVjMTEzb2hvNUZMU21SMFNxVXI1R2I1SXJsdzJ3YXUzVnpmNTg4b0UyamR4?=
 =?utf-8?B?UWcvazNEdmYrY1ovcEVwYmxJY0w5UWx3QXBkaHlxbjhCSkxoeFBycDZNbTRw?=
 =?utf-8?B?a3lSaG11SGtoNW5sV2NIZkxsTE95elF2QXVBb0pQL0FKd3YwY29hQVVuYzdZ?=
 =?utf-8?B?YmExT1pHUHJxdFFXZWNyK3Y2WnQ3cE16UDVvSTJzcGtVdUliRFUwQ3paa3BT?=
 =?utf-8?B?RUNjQmVyK3hpRUJWVy9XZkxDYjBpUHBXQzZreG4xNVk5czRtOTdBT3JCbEVk?=
 =?utf-8?B?SWhPdVM0Q2FoYzYxbFNlVFEvcVlmeURHTDlYRTYvdThIaGN1NncrOUlFMldm?=
 =?utf-8?B?VXFaK2xKSnZDR2tXZVNWdU5mdnlxVThKM1c5ZHZJRmx0NWIrS1BwWEVIenJW?=
 =?utf-8?B?d21GRC9FQUFFMDlGcmJCdFB1YVNtRjRoYWNPUWdUN3oxZFRqdXZHR0grWUhT?=
 =?utf-8?B?UUkrcjVjY0ZHQXc5T2RJK0JrVG9JbkFPZG5hQ2JhaFVyR1FKMngvRVNDZ1JI?=
 =?utf-8?B?TW5SZ0NaNmJ6YVBocGZ0cW9GSVA4eWxIcHNtcU9jU0l2alZNTStoRUVkMXN0?=
 =?utf-8?B?cVduOEpFcGExT3dlMW5lc21nQmw4K0wySkUvd3RNaGpuQ3RwblF1eXdQeWgw?=
 =?utf-8?B?eURnRytzRmxtU0M4QjZRNXpOVldIa2pxT3E3aGNUUk5yaEZPTjR3b25XenRN?=
 =?utf-8?B?K2hlNU1FYzE1Z3RYWFQwcVZPZlVLVHNucWFGNUEyRlNmU2Jqdi9Jb3BpVUJ6?=
 =?utf-8?Q?Ra9hL6tQVlGasrvKLIlYY9ejMpaTTsTG0hCAwg4x0/3fq?=
X-MS-Exchange-AntiSpam-MessageData-1: 0q5et/d/gcac2g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c90c05e-3e29-4e21-c7c1-08ded7efef3c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 04:11:04.5102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aW+0dPcD9ikoH50db18IGaVMetlrvbT+2zZtE6IoIKUeV25g9bGdqfSnQzKdZo6XVyiDwX2yd7snGBZFrz2YBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864

All of the resources implemented by Host1x hardware may not be available
to the software in cases where those resources are assigned to other vm
partitions through the hypervisor register region.

Add properties nvidia,channels and nvidia,syncpoints to specify the
range of resources that are accessible by this partition / virtual
machine.

The hypervisor or bootloader that configures the partitioning in the
hypervisor register region is responsible for updating the values of
these properties in accordance to the configuration.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index ffd0ed857d28..a6bef28e8559 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -96,6 +96,18 @@ properties:
     items:
       - description: phandle to the HEG or core power domain
 
+  nvidia,channels:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    description: Describes range of usable Host1x channels as a <base count> tuple.
+
+  nvidia,syncpoints:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    description: Describes range of writable Host1x syncpoints as a <base count> tuple.
+
 required:
   - compatible
   - interrupts

-- 
2.53.0

