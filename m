Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012015.outbound.protection.outlook.com [40.93.195.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653063DB656;
	Tue, 24 Mar 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343502; cv=fail; b=b3TfNpUL8b1VolL6uKdW4Dke14extaVv2PxtfaHnLXLDwS+9FbHYd9UdRz+EuU/b8fBAYH8/nk2em2K1UnDnawT3YgVtHI2WUKtVzifMlT1fsbRX2SdAIRKm04umugZLGjc5CIqC3OT8sQWMoQ8bkU4MBnMZL34+/rl4M+2+h70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343502; c=relaxed/simple;
	bh=mZxfe0s9W2kfNJfDfvJSJQfeHpv0XSjA7cYZmZK9wpc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DA8j0lwaOp/jlR6pWN027Y+6tEXOqp/AtW70SOBRvAX0PkiulsFV4NjZS+j9R6G2D20ddWJ7ccVjlQx1ET14d6nh6J8cIKQ3jVmtevkohSyJYUTsWwnW77pPLybRuGKnYmfD/9lRMS0R6/uZNh6hrZWXdYdy3rOF8uinDo5FA/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=THZLffNW; arc=fail smtp.client-ip=40.93.195.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="THZLffNW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3rkiiY6HWH/PliF240FnDEafMjIyLy2eJpa+aG3GPgWjgI4oGNp3XzdzwUQmGIUwJ6mfBXYFuIky4/mlD/avT2HxrqDi5+IPRGCV4M9Y0DK1qC9qACQmZrbk73wD7xKh1libM3DG91zYOVBfoBW8i30WLyUCQWCvHMaHKkEQ+7xqorpw1BQrjMUCnD7WDkrhu+ySM+maYdi70Re2zAKuTDwKircRPJ/U5nqM12eLinrTHWJFzVYwOTDCpau8DpUycfCT3tdwJXskJlduTZsAVnaclXdSKLYS0c5c5UWSy9nAnRkXtW9vDPhHVhJBvzcGI6WQGD4oyAi1enJAYUASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRoV4YsyFouIFMdeoswkp+pV3mfPSc9P89W4EzmbIK4=;
 b=qxOlmWoxCnKSpljNgjPAM8pnkokD0aj8CxAtK1oPLqte8fNgqkcMtLvdrg2Zqnyv5pSFoMZyZ0d9b4hB8LF2LnpzgNV0n1h2VvvvUPqAJreVtBfxf7VqF4Pmy4nUTq2XLAts+q861mmp/jk64awyuzWulgosvqQ8z3oGLT8Gj2Q6e7f5ASqU/PDhVCDOj++HW0hYRtuwPhQXa/aswKk5tKKTS1x+hTNzB1S+rYeGz0whyeshEfX4jNBqoWj3r/PcRGnDO4cExCYczIS6GQ7Nqkka+9DNwHleFRBSAeWi8ustGq79iaot57hWUFbUQGeJJj15zYa67te6QHvoDOtjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRoV4YsyFouIFMdeoswkp+pV3mfPSc9P89W4EzmbIK4=;
 b=THZLffNWxie8j1lqJYwkWPRhetz7WRCRBT5F9GbnIJYqX+sKWqFbVeUwM3TIq0ZVne+9+Td5r1NK+MFLoU1pWTNF+pC5xx3Co4A3stC9jUQAQyikTfWq9g/P2ZxF9xRMjWC4g3VAbe09MmgS69AjyFN16cXQYPbVmEz3FFOElaz6Ehi/cQRasWo3aZOw/OYWcyNp8tlMs+kIBlWUTDLUtjAponPjtcMrzDInNk4q13OL07J2fMqsdgIcCdn6SHHd8W6m1Fa56c5/VMMGX3oOWflZ/a4kjOsnhyto4VLQGmiVatFnvXqad+Rxb+VuV9LDyPfrDbgw2z3HHgcwdSNyjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS4PR12MB9658.namprd12.prod.outlook.com (2603:10b6:8:280::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 09:11:30 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 09:11:30 +0000
Message-ID: <82f3ca77-7b8f-41b8-85fb-c502bc343778@nvidia.com>
Date: Tue, 24 Mar 2026 09:11:26 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: tegra: xusb: Fix per-pad high-speed termination
 calibration
To: Wei-Cheng Chen <weichengc@nvidia.com>, jckuo@nvidia.com,
 vkoul@kernel.org, neil.armstrong@linaro.org, thierry.reding@gmail.com
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, waynec@nvidia.com, wtsai@nvidia.com
References: <20260304102649.3670783-1-weichengc@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260304102649.3670783-1-weichengc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::20) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS4PR12MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aed4a87-9912-49c2-e57e-08de8985564f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q1B4x7oWZpHNSbFiNsXmDo6WhK8RzDS28PICKUEOwpKu215eJGNGV4b9AwtimHvvJPn/f39RLX0YOeMiRAi0q892yyWklAeJnwX1cfclpuE8gZo1hFQpWY+qrb9seYt6PkDDQ53SGl9WpUnIdDtf2QZK2UO9xgktSqv3byKT0B2LfydVr7flB1thUMq+VACYi+WQT+0IiyKwE2492ja0wxyksiK0uAyPrqPbE2oO+KrxMpvg5F420GVnEwIcZYNb26IHQI1aUxnd1Ele/xCN0zarTINSBxxwxX5b8tYgiUbiAENyOnMXs0n7DUD1koBPtZLV5bStjW33XOV6kbYlQJrKwjVZmQg5C3bNgBUsGSugJ0olnDr6g6k/AK7N9VJgOebTTc+E+ApCVUF/yPnEE8m+EGEI0ucRlGcMMZeWy5lI9uobEbnnzeZpKefZlqkCzbhWDqLi6pXEq7bT6zbdegC3aHrIjbmMmlG0qk8fp5k43AW9Q7VNMs8A4duDH9rH+1Xyl7MZJdppsEGFzweZH88XHbjbHJoSih/BqoeC/13rDqh5vI6c+qJB71i9JPKMh9VruzgUI5qgl+T3PSiAeg535vLqlllWeOKd9sGWUh62F6QCR3yuQ9Mrpwd9uGtlmThCwH2YOrysTCOtJqK4n/AvvIIVATy0c34ZwMvMIvSUDTLjE6kua03NVf3CN7JvQwHxqWONgh5b1YPSI7p64jbQ1iPJhJu1+7q9t0qh+/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXdiNGZZUXk2VHQ2eCtIRzdzZzFDQXlpVTRlcHF2MjhZaXpiRWFmUHZRWFJz?=
 =?utf-8?B?NWZxUjYycTZibDNISkVGYUpPMjU2SHl6WHJBSzZBYU9oK3R1MGJaZlVCU3Ji?=
 =?utf-8?B?a3IrdXpyQXZTcytNU2VtQ2NpZk9tbWd1aGxBMU01VGEwcDVzRGROL3Q3Wnlr?=
 =?utf-8?B?MWJtY1picmFDZUhpSDgwQ25sL2pYUXd2ekd3WW43YWZMTEoxUUFvbFFvMWc2?=
 =?utf-8?B?aHNtclE5ekordDF1MnA2MWduK3FkdUJCWitkOGcvUnNaUFdDeTJHRzlyQVoz?=
 =?utf-8?B?akJHWUgxVVpsajVYL1ZQN3NLUUxRejFhcTVPeGtjSmV5OUtFbVNid0tTNDZB?=
 =?utf-8?B?WldLSmdxTTBmWjlEUmxMQlEwL0FKVDhuVVlKeUhFVUY4Q0lMcysvdHIxODVy?=
 =?utf-8?B?U2tOWDF6cnRwb1BjT2U2S1RwMHhyM1VXR3hIL0dqNGZqelVyMUs2NEZhcXQr?=
 =?utf-8?B?NCtrNzBrU1UzZnlkdm1YUXRTNVlpaVZiZkcxbThycTFSVG03OGcyd2xhYkZy?=
 =?utf-8?B?cWt2bHNVVjB3NGVwUnEvYWluU3dQOEtQQU5SZ2QxOFZVTTk0R0huU2QrUkhC?=
 =?utf-8?B?QXF0aFgvd3pTck5mWTN4QTlQUmQ2VDlqQlBZRFdtT1J1dTFGVEorUThINkpw?=
 =?utf-8?B?VEM2MEoyUXpQTUFTcXBvYlNkR1JLSG1WT1orOXB5cTJkcDUxclRZREE3c2ZW?=
 =?utf-8?B?Q1JoRFNJL0dFK0l1L1F1RHFYSlJxMUhEZVM2TngvQlBXSEYvVWhpbzNrQ2R2?=
 =?utf-8?B?UEtxTysxemVZM1J6TG9BUWRmOUxXenJXVU9keVIwcUZBcThjRkIrRzljaDJL?=
 =?utf-8?B?cmhvOWVuTi9HZVZVUllTUnoyb0FNUnprZHhUZkNHOU5lRmFmelJxWG0yOWFl?=
 =?utf-8?B?SjJDa1p6Q09JSXlFMUZwM2V2U29wQk5rMGFRVDF3b1M5NTMyaGRSWHhEaUM4?=
 =?utf-8?B?N3gyQThoTFVLMlJhNlRkU0l6TkxrcWdNc3ljZ0k5QkpnSmdEdHBkcG5aRkhx?=
 =?utf-8?B?cFN2WWJmMDVUWEk1VTJBaUx3RGcwTGhMUFh0TEN2QnVaa1RRU1Z3Rk44bHBl?=
 =?utf-8?B?VlVSenZ3VCt5NGNUeDBtSWQ2dzdmMGNKaERuWEQ4NjlrblNpYVpvTFNMS21k?=
 =?utf-8?B?bWo0Snd1Kzc0Rlc2WkpxaGZ1eGVUOGlqOEFCVVR4eS9McXRibngzbHNQNUtj?=
 =?utf-8?B?d0dOOU43ZUlkQWRkOGYyNG1FK3RjRjBxVjJmaHVGTE4wNVpVY1dDcFFPMStj?=
 =?utf-8?B?REVmcVFaM0xtc0llaVhlT1p3L2IrSHorbFFEYitOekJlYTJ0aGs5MDY4eUE1?=
 =?utf-8?B?WW0reitMUWcrdHN2aUFJZGVnMkdydmJ2Y3kxaTU3ZDFKSmRmQysvc3Bha3hI?=
 =?utf-8?B?RVE2bTlnSjBGUVZXd1VncmtRMjArcGpuZDNTa3lEd1JsZ1FCamRCenV6L2U1?=
 =?utf-8?B?aEVHSzFtNHhyNXd5Q0RGQUlnMWhIcVpOOTQrb3BtaUtReEdSdThsYm8yNmN0?=
 =?utf-8?B?bkJBQ0xKenNUUjZDOGtPSUQvMU9CVDd4aDFSVkEvR1Y1QlM4SlBmRFN4Qlkv?=
 =?utf-8?B?THpXWStXOUFiRWNrUHhTZ2QzdGVyQTdpRjdzdmR3WWNUeW92Zkh5Vnhnc0VJ?=
 =?utf-8?B?ZDl2Z1BPWG5PN1ZmeldkQ244VFNkTzhac09qaEtzdW5oRWp1OWM0bE1ZOVZB?=
 =?utf-8?B?Sk5xTGl1OHBjNjFtRGRYR1hrK2VMYkI1RjdFS1JaMkJOd3YyVHEra1gxdDRJ?=
 =?utf-8?B?WmpPY3pCYk1ZR3RPb3FHcnAwN29zNkYyVUpBc3ZqckpORE1XVTZ5NE10RTYx?=
 =?utf-8?B?Y0w1RGxQaUlPdUdZMjBMRW1ETGI1SlNRYTZoQXN6ZWhyWFZySEpqODF2UlVQ?=
 =?utf-8?B?QXoxRkdmSzBGMXNIQ0xjVHpEWkU0YUtwbWNvaXorNmtacHJNdVBmcE1SbmpL?=
 =?utf-8?B?OE5NYXRGS2lpYnkzdFBvRENQQ0tWbXI2UmtwdTNaemZEU3RlUTdOelZtVzM4?=
 =?utf-8?B?R2gxZVhtdDZJbHFDK2tnZERBNzNmNlhIYjRjczF2WjhhZ3dsVDdZcGFYRmxP?=
 =?utf-8?B?cDNwTHREZGNOOGZaOE0reE4yaDRqWmpGanVxVFV4SkQ3YmN2N2RoSlRORHFD?=
 =?utf-8?B?N2laTm5CdkJ3dm9ES3lRZTluaS9zMzJSN3orcnRuVVVtZmZsV1p6ZHlRRkpZ?=
 =?utf-8?B?RGNYVHFOekN0SkhaaEdqQ0NwVE84bTkrcHQxYkdkTXNIWWk2Ym5sdWxNenhh?=
 =?utf-8?B?bU90K2hObkRYcUtoQjV1cU1mazRlcWxzY3hDemc3QzJiYnlQQW12bTNMamdT?=
 =?utf-8?B?aEduRm5xSjZJZVdCS2xwVzhzZ0thTGd2V0xaN1QxVjdKQm43bTBMQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aed4a87-9912-49c2-e57e-08de8985564f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 09:11:30.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+fPEipm4w47tXSWKferMsd4u99HsD2+GWai4jU3yPCqGt0PSUdvQzSYWv6pJB8F80qHvnLtKNTNfFbBkTnGYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9658


On 04/03/2026 10:26, Wei-Cheng Chen wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> The existing code reads a single hs_term_range_adj value from bit field
> [10:7] of FUSE_SKU_CALIB_0 and applies it to all USB2 pads uniformly.
> However, on SoCs that support per-pad termination, each pad has its own
> hs_term_range_adj field: pad 0 in FUSE_SKU_CALIB_0[10:7], and pads 1-3
> in FUSE_USB_CALIB_EXT_0 at bit offsets [8:5], [12:9], and [16:13]
> respectively.
> 
> Fix the calibration by reading per-pad values from the appropriate fuse
> registers. For SoCs that do not support per-pad termination, replicate
> pad 0's value to all pads to maintain existing behavior.
> 
> Add a has_per_pad_term flag to the SoC data to indicate whether per-pad
> termination values are available in FUSE_USB_CALIB_EXT_0.
> 
> Fixes: 1ef535c6ba8e ("phy: tegra: xusb: Add Tegra194 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Wei-Cheng Chen <weichengc@nvidia.com>
> ---
>   drivers/phy/tegra/xusb-tegra186.c | 33 ++++++++++++++++++++++++-------
>   drivers/phy/tegra/xusb.h          |  1 +
>   2 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
> index bec9616c4a2..4452e73fb82 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -20,8 +20,8 @@
>   /* FUSE USB_CALIB registers */
>   #define HS_CURR_LEVEL_PADX_SHIFT(x)	((x) ? (11 + (x - 1) * 6) : 0)
>   #define HS_CURR_LEVEL_PAD_MASK		0x3f
> -#define HS_TERM_RANGE_ADJ_SHIFT		7
> -#define HS_TERM_RANGE_ADJ_MASK		0xf
> +#define HS_TERM_RANGE_ADJ_PADX_SHIFT(x)	((x) ? (5 + (x - 1) * 4) : 7)
> +#define HS_TERM_RANGE_ADJ_PAD_MASK	0xf
>   #define HS_SQUELCH_SHIFT		29
>   #define HS_SQUELCH_MASK			0x7
>   
> @@ -253,7 +253,7 @@
>   struct tegra_xusb_fuse_calibration {
>   	u32 *hs_curr_level;
>   	u32 hs_squelch;
> -	u32 hs_term_range_adj;
> +	u32 *hs_term_range_adj;
>   	u32 rpd_ctrl;
>   };
>   
> @@ -930,7 +930,7 @@ static int tegra186_utmi_phy_power_on(struct phy *phy)
>   
>   	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
>   	value &= ~TERM_RANGE_ADJ(~0);
> -	value |= TERM_RANGE_ADJ(priv->calib.hs_term_range_adj);
> +	value |= TERM_RANGE_ADJ(priv->calib.hs_term_range_adj[index]);
>   	value &= ~RPD_CTRL(~0);
>   	value |= RPD_CTRL(priv->calib.rpd_ctrl);
>   	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> @@ -1464,17 +1464,23 @@ static const char * const tegra186_usb3_functions[] = {
>   static int
>   tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
>   {
> +	const struct tegra_xusb_padctl_soc *soc = padctl->base.soc;
>   	struct device *dev = padctl->base.dev;
>   	unsigned int i, count;
>   	u32 value, *level;
> +	u32 *hs_term_range_adj;
>   	int err;
>   
> -	count = padctl->base.soc->ports.usb2.count;
> +	count = soc->ports.usb2.count;
>   
>   	level = devm_kcalloc(dev, count, sizeof(u32), GFP_KERNEL);
>   	if (!level)
>   		return -ENOMEM;
>   
> +	hs_term_range_adj = devm_kcalloc(dev, count, sizeof(u32), GFP_KERNEL);
> +	if (!hs_term_range_adj)
> +		return -ENOMEM;
> +
>   	err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
>   	if (err)
>   		return dev_err_probe(dev, err,
> @@ -1490,8 +1496,8 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
>   
>   	padctl->calib.hs_squelch = (value >> HS_SQUELCH_SHIFT) &
>   					HS_SQUELCH_MASK;
> -	padctl->calib.hs_term_range_adj = (value >> HS_TERM_RANGE_ADJ_SHIFT) &
> -						HS_TERM_RANGE_ADJ_MASK;
> +	hs_term_range_adj[0] = (value >> HS_TERM_RANGE_ADJ_PADX_SHIFT(0)) &
> +				HS_TERM_RANGE_ADJ_PAD_MASK;
>   
>   	err = tegra_fuse_readl(TEGRA_FUSE_USB_CALIB_EXT_0, &value);
>   	if (err) {
> @@ -1503,6 +1509,17 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
>   
>   	padctl->calib.rpd_ctrl = (value >> RPD_CTRL_SHIFT) & RPD_CTRL_MASK;
>   
> +	for (i = 1; i < count; i++) {
> +		if (soc->has_per_pad_term)
> +			hs_term_range_adj[i] =
> +				(value >> HS_TERM_RANGE_ADJ_PADX_SHIFT(i)) &
> +				HS_TERM_RANGE_ADJ_PAD_MASK;
> +		else
> +			hs_term_range_adj[i] = hs_term_range_adj[0];
> +	}
> +
> +	padctl->calib.hs_term_range_adj = hs_term_range_adj;
> +
>   	return 0;
>   }
>   
> @@ -1708,6 +1725,7 @@ const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc = {
>   	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
>   	.supports_gen2 = true,
>   	.poll_trk_completed = true,
> +	.has_per_pad_term = true,
>   };
>   EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
>   
> @@ -1732,6 +1750,7 @@ const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc = {
>   	.trk_hw_mode = false,
>   	.trk_update_on_idle = true,
>   	.supports_lp_cfg_en = true,
> +	.has_per_pad_term = true,
>   };
>   EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
>   #endif
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index d2b5f956513..810b410672f 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -436,6 +436,7 @@ struct tegra_xusb_padctl_soc {
>   	bool trk_hw_mode;
>   	bool trk_update_on_idle;
>   	bool supports_lp_cfg_en;
> +	bool has_per_pad_term;
>   };
>   
>   struct tegra_xusb_padctl {

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

