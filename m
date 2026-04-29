Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADA3B9DA1;
	Wed, 29 Apr 2026 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453867; cv=fail; b=HCM2PHmwPlFwM30JOPqO+u8r/VvUE/JJkLlpVxzA5E8z6+9KbBAd8C+sTJPprJLD3iwdHMQjuiR5nWU120N6V4E0d3lmk0UJAYKmtn9E5bKhX80ONNGLhL41LweNRy8xOKqdmHFWglvc3TAfzUUadz7H9ksCS3BQ5TToX9wOwQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453867; c=relaxed/simple;
	bh=NJdplK0C9QK99wyzT3zbwQ440E/AQDLF5SGbL0RLEug=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Sk2ZbRK0jbCOPu7ehcS76/nPk75KVbZUTxrGncPwnc0ntZ3PiGC4oWirA9sZQQwIICLfQFIBy4FvaqTTbid36VJaUP4/dHj1S4Rddtss3TGdFrfs7RQLIvmoC0I/NLO42nmnVCZqX6jMnmgOxo4GLRiz12n+cMyhU+F3alMupYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g6nWsXCi; arc=fail smtp.client-ip=40.93.196.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g6nWsXCi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjZbyFfsfOK9iCJY7xxtLxzHleKZVnzoFzbkyLEl1wTbmGArz9wv9mFeGzFFP+dI8S5O/y6dSQek8wUPiZiJQizuCFOmbCNov9+sySEQPb23cIN07+Pxmz1Aqo+FxPHw+qThiOxS0unxpSoa5VUwhyTq1vKoZvXncrP8I3uofC2v2KdDgUe2ZbmSyhIwP0HHaVJNpFx/S7P6Zmt7xrL/ZugtbCRGiLuUYJc+x5soDDJEwZ8EyST5IRcFYHxgcE4+blPtytrY41GrpDC+OoYKmlAqXTJ35ADAf4c2zn++4AWdIxmPHAuWm0VL1U1PDn5rEtlQ7TawoMbswbNmWF4Mpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShEfvG4M3Ap8U6u8Kv29ELoHnvhCbwMWunFYqLE0pfg=;
 b=yAd4vau90gHLI87WItGcTOtP97+3RTbDfpX3wSSbwva0SGAPdQmakzGp8hjRnSOQIqMsdUuB/yse0KZej3Zcx2xEHtqlkYqFImgootHMfYtUj7YX/G8YgUtFBLd5xFmPEYfcE1NoQe3xxsXwIxL+L1SgJQvsFNEIZxWWJ8JnV6qPO4I6sFlrmhihffnJTPUGXf5oCYFTuO4dYzy5qEfxs3t6VN7y/8K1WT41HzPPuEj53Ya3Iqd2Q5kE6GDsLgZQASDhdYySmwxU7UC2LnW6kNr1xTAC/yRjzLO6G0UXknUSYBtof+zl+XyDWSh/qHVqxEvFR4dem8V9qxAEJrh0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShEfvG4M3Ap8U6u8Kv29ELoHnvhCbwMWunFYqLE0pfg=;
 b=g6nWsXCijUVH9uzLqr2n5+kfS+SaeFAkTExhrCpcaUVZS88eH2XRRE2VJKuG0F95QL8dgALSDai0XgmqmTZ2vZqIazvhjsXHpOrQeqcVyX0gFXUo45XfOgNZPU8763I0J1/JqhEUi+WnQjBMR7v5w38RH+SPFWBYnyRT/jcNW1kGHEM30UVHy27+J/bOtYDrOe5evfl77KAyfzsbFi6yYt4KJ0k1eAnRYFqFnMyODG712EQTTwk7Csb10u6BUqxvyNngVD49eoen0Sz/GO6pMnH33ZN7Zr7bZl3agRB6j6bnw8sg09LcOh6d5Y2OP053OqICUNiYvXfYT8BWzHnngA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA0PR12MB8646.namprd12.prod.outlook.com (2603:10b6:208:489::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 09:10:59 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9870.013; Wed, 29 Apr 2026
 09:10:59 +0000
Message-ID: <77285dd6-e240-4944-a034-a4bc3acf4052@nvidia.com>
Date: Wed, 29 Apr 2026 10:10:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: tegra: xusb: Fix per-pad high-speed termination
 calibration
From: Jon Hunter <jonathanh@nvidia.com>
To: Wei-Cheng Chen <weichengc@nvidia.com>, jckuo@nvidia.com,
 vkoul@kernel.org, neil.armstrong@linaro.org, thierry.reding@gmail.com
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, waynec@nvidia.com, wtsai@nvidia.com
References: <20260304102649.3670783-1-weichengc@nvidia.com>
 <82f3ca77-7b8f-41b8-85fb-c502bc343778@nvidia.com>
 <fde997f6-c0a8-430b-8e45-38a490e683ad@nvidia.com>
Content-Language: en-US
In-Reply-To: <fde997f6-c0a8-430b-8e45-38a490e683ad@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA0PR12MB8646:EE_
X-MS-Office365-Filtering-Correlation-Id: 272d0ec2-99bf-43a5-7995-08dea5cf3ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	R1xFgKIeOpAvQAmyBOuRRlHlqamWxANJzufLu1H+eXrXPR6f1DKAJ50r4oVOwadCWag0RFsclummFn1Y+nJxN+Oy2ra1vWw5d51GUrZ30MZ2NFUMbNZjJ2njevDSLxdsbJgO6y+WmKRtX3q1RWcaXZAoMtPIxBZRLrP6npKF5gcS3NtToma4PF+Igifl7YinkIWIU338VZ3sYSKMAAUEkI+vS5zWMZuHAK78u+3NLzgJ8x1Au/cx6RJ6nyQxLIDUY0iF6dMOeUAUGyp4zLosfM/VG6VDVxbqRyUBxO+d26LM0LQUVnM0VbIQrEtQQtjBxzmzSPdsCq/SNA5cMQf/KRClN2z0ubjNiQPqDqlr9F/YH5SVhiptR4P+1VqS9NsDhmbFti9DEY7IlY1oe1JQ9gi7QU/0J4hfOn+dmYcEwZpkr/rt51dUrQXJ/EjtF4hcpbPAEethtXQTGG4CPUdcxqNZILeQubWvjoPo0uNx5RUHvSP1EInl7hDtzTyekyN18vEi3YLD6pPwAr9J5YzlEhtujEXdY3aHfomOSqFID3Iqpl1j5lGIY8XyqOljbvVJTEHB4FY0B47scIpDGhT3iuYZgjp7IMkVfRvXL7xkrwsYs3eSpWoH8NxfjZ5S78F7WgzFZQl99LrQHej8LGtiHrcFwbuNoA704rUHKPN1r0pfPBeFjM6jouIC5StUBL2PkL3OzBgCTgSWeRJitpRfnTfqyXkFA+2bw2Xquxf8J5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1JMU2drOXEwV3JqTXpteVpBbXNvaWFJNVQzTjZSbzJDRFhTWFd6ejVtNnQr?=
 =?utf-8?B?aTk5YlM2ZHVaajVRSXJVQ0FwZ2N6cUdNTEFqVnpxd2lEcUo2aGo1WWJ6eXJa?=
 =?utf-8?B?a3JpZThXVVhpR2pxeUlnZVIrVU1VYnV3LzlWVHF3WVRXbHZPQmNRenk2TDQ4?=
 =?utf-8?B?SXFyMTN6cks1THMwbmVUYVNaVG85VVBldnNXNS9YcmtGeStKNjk1SzVZZ0p6?=
 =?utf-8?B?ZFpJTjREYjg4U25XZXVCVGxCSjhuYUdjYXdvd2paaFNyd2hZYXIybVZEdXQw?=
 =?utf-8?B?aDJ1SkJFc0NLdzRLeW10Yys5OUpOWVVERnNoRWpCZGhRVW5hTlhscGJSditF?=
 =?utf-8?B?YmxlT3pTOEVSbjFWckRSdFdMSWtHTk91aUFRbkI3UmJqZjVzZE5OS29oVTIz?=
 =?utf-8?B?bXIxYkNnYkM0ajVZWDVEb1RianBCUXArTVJMKzFja3R4QlNrK0RrazBTdGVa?=
 =?utf-8?B?YytWZmhPcWZST1hqTlFNbzdpTGVuVDBEbVlTd2h5ZWs1ZjVhalVveXdVYWlY?=
 =?utf-8?B?ZGZCQXFZaUpnYzMxMkpKTzlVa3FWM3ZPZzc4SmV0NFM4eU82L0l2aXowN2dx?=
 =?utf-8?B?TDk3bnBwNm5SeU5rM1VCMGtsb2dTRTF5ZlFmZ0ovaVlzVVNramJYVU5oV1Q2?=
 =?utf-8?B?MHBZYlhzZjM4RVMxUmxOWTV1L1o2anpaZXlIVEJPQ1pNdHZkVkE0bjF3Mk5x?=
 =?utf-8?B?Rnp2b01nN1lRbHI5RmNHQkF4WHRmcG1mUDZ3ZjJpSVYydTBLSUNobHV3dUFo?=
 =?utf-8?B?RUZKcTFUSnZWU0hXbjMwY2lwTmlNVkU4eXhXTUVidkowTDhoUHZBaER4NnVZ?=
 =?utf-8?B?eGVCSTExV29kTE16UmNSRFM5VEpuMjB4MzhTYlkyQ3ZyZTZCbnFQaGowUUNM?=
 =?utf-8?B?WnY5NzQ2dlFMc1hRK0x5YmVXS0hCM0JQRm5PSGc2NFRMdDNqamFXNStmRG00?=
 =?utf-8?B?OU0wSjVrQ1p5emczVzBiUk5qM0xhK0ZnNGwreXovUCtrTFhsMzlSelZUMDNC?=
 =?utf-8?B?Q3A4SkRNOEY4Undaa2Nsd3VZeUk4NS9WRWNUVVlud2dpSnFmZUE2bE8rYmlu?=
 =?utf-8?B?N2R0MC90M1pGeWFxdkZ4VlJxVzU1V2pUMlBjQjlRMEtmaENxZmN2Uk9CRzVj?=
 =?utf-8?B?T3czZHo3d1A1YWFPNlNtSTl2RGNHUlFKYnRub3JEVFNvM3dyaThLaGx5cm0x?=
 =?utf-8?B?VHJ5VXlsWjVWb1BUOUd2aTRRUitUd0ZnajZza1NVSDRDcEFOQVBZZVBDYUF3?=
 =?utf-8?B?Zk45VWphdlg0NTUwQmYwMUZNQ0JCUzBhNDI5Um95ZzQrZ3JidXlSRkQ4UTlW?=
 =?utf-8?B?dXZvSUR6OEh2SGtqK3Ewa3VBMXFtblBIeXlOcmdBcmFsejFwOWppdTZyUHFC?=
 =?utf-8?B?dDQzeEVHVHFJeEc5ak1KOHoyVUIyallJZTBsWUV5a0s2SEFad0daQUpiRlgz?=
 =?utf-8?B?bnVwUUdMUWI0ODk4TWRrbDBiV05oOGxFbUFEaGttWlFIV1N6ZDJxNGttN3cx?=
 =?utf-8?B?WHJ6eHd0bmlaZjZySU1PK28rSDI3dSs4UEQzWjFlS3pHeURjb0prbS9zVDNy?=
 =?utf-8?B?NVR5QXN1MUpiVEJGVmwrNmVuWCt0aDlpbmp4VFI3eTFRVUxvdFRzU0N1clQ1?=
 =?utf-8?B?THBra2lsUENGb25LV0c3T2p6M0E4Q3JCbVNNUllDNnRXZ29sWlM1em14bWF5?=
 =?utf-8?B?b0tzZ2dEeTBKY3ZBQU5FejkrV0RSUWMzejZJMS9OQWNtbXp2OGlpVTZmWmNB?=
 =?utf-8?B?L2loZjNBYXkyVXc0S2ZpWVlqb2dHSmJKMzRRVjhUYVdSUi94SjM4R240VWZZ?=
 =?utf-8?B?ZmcvZlNuQnRIQUhXUm5vUlNxeXQxUjZqODRhZG1rZVpCMWF2WkNmMjVKZ1ZU?=
 =?utf-8?B?RWRSdE95U1FERnBuZXJDalNEekdyZGR2QnNKUGNlS1ZzZ1Bubm9tWVA2QTgw?=
 =?utf-8?B?eHg0YmE4UUsyMnk4ODQ3T0xwbXVkUGZDaXBJRkhjTURUSzNFS1cwOW16Wlpj?=
 =?utf-8?B?SnQ0b2N2VnpHL2NTOEhwM0ZVTC9WbHlsV2R3UlV5R00vVUdCV2VZUGw3cVhs?=
 =?utf-8?B?QTNwY1ozazNMb3Y0dE0wSk9ob3JMaXhvSXpMV2kvdGNLbXFrVTFRanFHblZ3?=
 =?utf-8?B?WVlRRy8zRHRxYnA5K1h6dzlUWWZGa0VqWkNHV3AvbzVMM0hYUHFkU3VkWkpB?=
 =?utf-8?B?YXJvRTZpeVIyR3FzejAzUWJRb2lrdk52V0s3b2JTcXluSXdTSjFjVVVuQ2ND?=
 =?utf-8?B?VlNTNXlaUzY2aS9DU3d1QksyLzMwaTlrUWFwcWNrRStveTFKU1dERlJiaFE5?=
 =?utf-8?B?Qi9yd2I3dkdTNUxXa2xnUUNsQW5YN01tb1ROenRYQU11bGJXWGRBSkp3V1JJ?=
 =?utf-8?Q?C8gtQHBl8Reribn4kfLQGhRbnfq46tiDIx9G3HciLPl9S?=
X-MS-Exchange-AntiSpam-MessageData-1: qN124gVNLD4kHw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272d0ec2-99bf-43a5-7995-08dea5cf3ac1
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:10:59.6881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7UpOx/wIqx6mKYawnbQWY63lfvxqcyX4r9gE7E2vKXR8KWsG+u7myIu2JlwKTPdZWr2qa2pVC8EpAQx7nC7iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8646

Hi Vinod,

On 17/04/2026 09:23, Jon Hunter wrote:
> Hi Vinod,
> 
> On 24/03/2026 09:11, Jon Hunter wrote:
>>
>> On 04/03/2026 10:26, Wei-Cheng Chen wrote:
>>> From: Wayne Chang <waynec@nvidia.com>
>>>
>>> The existing code reads a single hs_term_range_adj value from bit field
>>> [10:7] of FUSE_SKU_CALIB_0 and applies it to all USB2 pads uniformly.
>>> However, on SoCs that support per-pad termination, each pad has its own
>>> hs_term_range_adj field: pad 0 in FUSE_SKU_CALIB_0[10:7], and pads 1-3
>>> in FUSE_USB_CALIB_EXT_0 at bit offsets [8:5], [12:9], and [16:13]
>>> respectively.
>>>
>>> Fix the calibration by reading per-pad values from the appropriate fuse
>>> registers. For SoCs that do not support per-pad termination, replicate
>>> pad 0's value to all pads to maintain existing behavior.
>>>
>>> Add a has_per_pad_term flag to the SoC data to indicate whether per-pad
>>> termination values are available in FUSE_USB_CALIB_EXT_0.
>>>
>>> Fixes: 1ef535c6ba8e ("phy: tegra: xusb: Add Tegra194 support")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>>> Signed-off-by: Wei-Cheng Chen <weichengc@nvidia.com>
>>> ---
>>>   drivers/phy/tegra/xusb-tegra186.c | 33 ++++++++++++++++++++++++-------
>>>   drivers/phy/tegra/xusb.h          |  1 +
>>>   2 files changed, 27 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/ 
>>> xusb-tegra186.c
>>> index bec9616c4a2..4452e73fb82 100644
>>> --- a/drivers/phy/tegra/xusb-tegra186.c
>>> +++ b/drivers/phy/tegra/xusb-tegra186.c
>>> @@ -20,8 +20,8 @@
>>>   /* FUSE USB_CALIB registers */
>>>   #define HS_CURR_LEVEL_PADX_SHIFT(x)    ((x) ? (11 + (x - 1) * 6) : 0)
>>>   #define HS_CURR_LEVEL_PAD_MASK        0x3f
>>> -#define HS_TERM_RANGE_ADJ_SHIFT        7
>>> -#define HS_TERM_RANGE_ADJ_MASK        0xf
>>> +#define HS_TERM_RANGE_ADJ_PADX_SHIFT(x)    ((x) ? (5 + (x - 1) * 
>>> 4) : 7)
>>> +#define HS_TERM_RANGE_ADJ_PAD_MASK    0xf
>>>   #define HS_SQUELCH_SHIFT        29
>>>   #define HS_SQUELCH_MASK            0x7
>>> @@ -253,7 +253,7 @@
>>>   struct tegra_xusb_fuse_calibration {
>>>       u32 *hs_curr_level;
>>>       u32 hs_squelch;
>>> -    u32 hs_term_range_adj;
>>> +    u32 *hs_term_range_adj;
>>>       u32 rpd_ctrl;
>>>   };
>>> @@ -930,7 +930,7 @@ static int tegra186_utmi_phy_power_on(struct phy 
>>> *phy)
>>>       value = padctl_readl(padctl, 
>>> XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
>>>       value &= ~TERM_RANGE_ADJ(~0);
>>> -    value |= TERM_RANGE_ADJ(priv->calib.hs_term_range_adj);
>>> +    value |= TERM_RANGE_ADJ(priv->calib.hs_term_range_adj[index]);
>>>       value &= ~RPD_CTRL(~0);
>>>       value |= RPD_CTRL(priv->calib.rpd_ctrl);
>>>       padctl_writel(padctl, value, 
>>> XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
>>> @@ -1464,17 +1464,23 @@ static const char * const 
>>> tegra186_usb3_functions[] = {
>>>   static int
>>>   tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl 
>>> *padctl)
>>>   {
>>> +    const struct tegra_xusb_padctl_soc *soc = padctl->base.soc;
>>>       struct device *dev = padctl->base.dev;
>>>       unsigned int i, count;
>>>       u32 value, *level;
>>> +    u32 *hs_term_range_adj;
>>>       int err;
>>> -    count = padctl->base.soc->ports.usb2.count;
>>> +    count = soc->ports.usb2.count;
>>>       level = devm_kcalloc(dev, count, sizeof(u32), GFP_KERNEL);
>>>       if (!level)
>>>           return -ENOMEM;
>>> +    hs_term_range_adj = devm_kcalloc(dev, count, sizeof(u32), 
>>> GFP_KERNEL);
>>> +    if (!hs_term_range_adj)
>>> +        return -ENOMEM;
>>> +
>>>       err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
>>>       if (err)
>>>           return dev_err_probe(dev, err,
>>> @@ -1490,8 +1496,8 @@ tegra186_xusb_read_fuse_calibration(struct 
>>> tegra186_xusb_padctl *padctl)
>>>       padctl->calib.hs_squelch = (value >> HS_SQUELCH_SHIFT) &
>>>                       HS_SQUELCH_MASK;
>>> -    padctl->calib.hs_term_range_adj = (value >> 
>>> HS_TERM_RANGE_ADJ_SHIFT) &
>>> -                        HS_TERM_RANGE_ADJ_MASK;
>>> +    hs_term_range_adj[0] = (value >> HS_TERM_RANGE_ADJ_PADX_SHIFT(0)) &
>>> +                HS_TERM_RANGE_ADJ_PAD_MASK;
>>>       err = tegra_fuse_readl(TEGRA_FUSE_USB_CALIB_EXT_0, &value);
>>>       if (err) {
>>> @@ -1503,6 +1509,17 @@ tegra186_xusb_read_fuse_calibration(struct 
>>> tegra186_xusb_padctl *padctl)
>>>       padctl->calib.rpd_ctrl = (value >> RPD_CTRL_SHIFT) & 
>>> RPD_CTRL_MASK;
>>> +    for (i = 1; i < count; i++) {
>>> +        if (soc->has_per_pad_term)
>>> +            hs_term_range_adj[i] =
>>> +                (value >> HS_TERM_RANGE_ADJ_PADX_SHIFT(i)) &
>>> +                HS_TERM_RANGE_ADJ_PAD_MASK;
>>> +        else
>>> +            hs_term_range_adj[i] = hs_term_range_adj[0];
>>> +    }
>>> +
>>> +    padctl->calib.hs_term_range_adj = hs_term_range_adj;
>>> +
>>>       return 0;
>>>   }
>>> @@ -1708,6 +1725,7 @@ const struct tegra_xusb_padctl_soc 
>>> tegra194_xusb_padctl_soc = {
>>>       .num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
>>>       .supports_gen2 = true,
>>>       .poll_trk_completed = true,
>>> +    .has_per_pad_term = true,
>>>   };
>>>   EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
>>> @@ -1732,6 +1750,7 @@ const struct tegra_xusb_padctl_soc 
>>> tegra234_xusb_padctl_soc = {
>>>       .trk_hw_mode = false,
>>>       .trk_update_on_idle = true,
>>>       .supports_lp_cfg_en = true,
>>> +    .has_per_pad_term = true,
>>>   };
>>>   EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
>>>   #endif
>>> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
>>> index d2b5f956513..810b410672f 100644
>>> --- a/drivers/phy/tegra/xusb.h
>>> +++ b/drivers/phy/tegra/xusb.h
>>> @@ -436,6 +436,7 @@ struct tegra_xusb_padctl_soc {
>>>       bool trk_hw_mode;
>>>       bool trk_update_on_idle;
>>>       bool supports_lp_cfg_en;
>>> +    bool has_per_pad_term;
>>>   };
>>>   struct tegra_xusb_padctl {
>>
>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> 
> I guess this was missed for Linux v7.1. If you don't have any concerns 
> can you pick this up for v7.2 once v7.1-rc1 is out?

OK to pick this up now? It would be great to get this into -next.

Thanks!
Jon

-- 
nvpublic

