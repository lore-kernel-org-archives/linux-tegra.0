Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013006.outbound.protection.outlook.com [40.93.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FCE11CBA;
	Tue, 21 Jul 2026 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784618912; cv=fail; b=SVbgOgr/23DKzyiH5ZfmIpL5/iSFm+/vdQ8zKogJ8k4anVsglJZwq3g+mF8ac6xym9tuf8NbIClXOE5Trgy63airaF13G1Ok7EyLGIbs+cVj3xOJNujfoWBpN7Z9gXuVMjsBryWTdx80Ejfd0CJbRZTqmF94HTqshSeHOL+Raio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784618912; c=relaxed/simple;
	bh=+ayNr7yzjXLHvJk3rKbxy6tj6YlzdyXVWISxB65gpb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tl0hNfed96NfL4vwVCDMG/bahT97vBckTWh56kHTOs4y8dYkOdirmcfy0GWbwEGzylanjTie8B4SSiDOl8CQgveUn6S0gCpGkhlLQ1/+xrR460dJqUhVm1b0lQN0BwTjENPPjujyWyWBy8ZMJM9VcM0qt2S9u7LPLc5cgP3nxt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=efnd5PSX; arc=fail smtp.client-ip=40.93.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="efnd5PSX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMuyf5vrwq2xJ0dwJFstM2xQ8CPWdHTBmUcTNp3bt38+0DOwx/Tj0NoR2E72BB9ypwFhlqT98/+xqTp7nRYXV1hMYJKZWZ4ZtrP12dgcvWjcjwZK5i/mfhP5Xwe75JTJzLSVbai0FS590RPmO5VcpuWOrKdLpzhevK+7sKfwVRMtkIUE0mk/LyXa1mimtlBmg7tYeQafGikbi+8jQpQOMo87m0ZTUTbPpMdeAogkGSmqFjxd+riv9Aq2n4VxB2tjR6FKhrSWq+RkleRYGTF4BMOhIpoW9XwFqW19qV6cFcKZSdRKOfg+lcLKKy5k9dx6sBxoVxq6vsIgJgnbaSkQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJ5ukUSmpVtJ1+aNizJtres9r7hajyKrZeo8gaoJ/M0=;
 b=vwsEJCidVl9ay1U4mdScr4YfZ6r3SxbYnepAd4Um27BXEVwPn94sLT6O0NUSUzQeiuSHbIqsh0GbU36wJcBwq1HF3g1/aVCcksZKHlmeIrRvU4020MXY/+Evr3bZ6+bvpIgQ0914yjlOIT+ioEaKWHjOj1V2A0nC0D48s9Px4WGyRPximCjXV/TSgqI5ylpFi9/ZxjH+U7BfkUrCDxrNkUU8zG+K4M4kqN+S00T1ncdWDNj9p//kRZqIz+scQB4ic+GEpNbiXwE/jbxrvuYPwn++WJq67T0xZ0qM6YDO1l42y0C/0GHf7m0+YqmVKfEZmojuJtk+9/7krTBGB4LpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJ5ukUSmpVtJ1+aNizJtres9r7hajyKrZeo8gaoJ/M0=;
 b=efnd5PSXr+GTH/DROjDDd5FPVevNEU6nt/R4otN9rEPg+Od41ng3zSI4yK6AUaYy8B3xHaHJGs8HZgcFClSYtY3SQ3g+myu/gkI6E9clLI2nLuFQ4ZFS/QCxU0+2J+5ZbnQNtgCmFQWKuFxzAETQyNCSxImAmCHJBj9ePf2LrIYMQux0IHW8oixGaXeCOv/jfU3Z2ivF7l9M8TQDtQBztS0cTNcs7B7o/SzwewXHsrnKDa6vQAlRQrvwC1s9isc6706p8U7tdBEfEMic6wjz4Hs2rAugi44Jhlp8NUdPhmLCw0pjO+/PqeQaJdEkUlKuEgFdPN41zS5wRJy12LNTvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH0PR12MB999114.namprd12.prod.outlook.com (2603:10b6:510:390::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:28:27 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 07:28:27 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:MAILBOX API" <linux-kernel@vger.kernel.org>,
 "moderated list:MAILBOX ARM MHUv3" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:RISC-V MICROCHIP SUPPORT" <linux-riscv@lists.infradead.org>,
 "open list:QUALCOMM CPUCP MAILBOX DRIVER" <linux-arm-msm@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Pan Chuang <panchuang@vivo.com>
Cc: Pan Chuang <panchuang@vivo.com>
Subject: Re: [PATCH] mailbox: Remove redundant dev_err()/dev_err_probe()
Date: Tue, 21 Jul 2026 16:28:23 +0900
Message-ID: <tdOrdi__TZC4GQEnmWeUIw@nvidia.com>
In-Reply-To: <20260716025215.33592-1-panchuang@vivo.com>
References: <20260716025215.33592-1-panchuang@vivo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY6P286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::17) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH0PR12MB999114:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b62cf3c-21f8-450b-21e5-08dee6f9a7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|11063799006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	d769c8MmEltc7pUI5FyAWrMYObKTZPPVDmK2TTc5NjnK22V91+OijMzxfHeNfa8JQOIx4NYqkrnpKXfIm2wsCZDQu9794s3mrifzmHVnNBaIwiN8A6Jnme8OH3a+Cq3fJrgMdK3qUUrzYhuAbBFaJJH6AhjC556WXc11vOFHWFcq8sbc7BXOYX36bQqf0pC+SGN2mtDF0Si0Fb67Qedj01B3+1Rvyg7+JE+q7B01eGmePtGnWa9hkNS2RFfY5bYkUQvahIYSACc4O9AMqUgIffKE5x5l41qSbFlVzW5kwkLpw0Y5GGLpkuEH/YtOexicS614ALZZQ025W/+tz43xI8edikyk3e0KMZcXiVgTOMZx3+bFsn+OdGetoe7YEzJ1x+fnZWHm7Dgn6Ksam3f/uQGtG5Jr26dJjblvNwruD9aigZcNdgnFoz91cqxDf9bnz5VQY6HOF3Lbf2zQw+Sv2DsGpjl57ixRliNgTYUekYHqY2XWvA5RKoDDvAsrjAIbnLhN36neK/8J8NK00pvmF0sLg1Jr4nIhe957Ulm9azWzzpBbpegoJOxu9bYTS1gpogZAbLgOnWevQ/qwvPl7J90hXNa5B0YJnhivLGtt4d11tsyQM++Kt6181MtD2G4QtJ1zQhwEWP6r3mMsB5kUyq32kKaSc8+UIu/xU2v5eJFgRfmN3dhR2yu4q2Ji1980AzAENslG/oktKu4cU2lrTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGlwZklmSCszK29TOUtlTEdMQlBxN2ROWVNlOXU1a3RnbWVZU2xTcVNIczhy?=
 =?utf-8?B?dW1ia2xBNHduZFl5SWZubmx3YzZNV1ZlMWh1ZkRra0JlSlRLK0xWa2lEdjZy?=
 =?utf-8?B?aVlWdkVCekFFb2lwOEZxQjgvNDVaTGswV1F0STRMWER0YVNFaXF0cG9HR3h1?=
 =?utf-8?B?SXVYQXVqMmlnMENKMURzNFdQSnU3dkVlaDVtbmgwb2N0SlhzVXN0TjU2WjN6?=
 =?utf-8?B?ODRUbXpRV0FIbWFoUURlUUIrVTk0a1RaRERXQU8vblBrY0RvWnpic00ybHlM?=
 =?utf-8?B?Wk1oamc1K3BjRDd1dWJYNHFONlVDbDFyL3VQQVc5T25KREVuVHlHam5MRlNE?=
 =?utf-8?B?MXNHVXRpKytvTTdWZEZiME9jZGpoeEdPby9vR1Z5UEhGejB6czZjenNxbFlF?=
 =?utf-8?B?V25OcU5Nc25XQXZlY1FFUTByeTE3UHFtUmg0c0I0YTlSVkl6djlWRmltNTZi?=
 =?utf-8?B?OVZIcUVERVN2eEc3dVdxd05nWmYrNTliRnp2VkFCR1l2WWZmRnNwMmh4WnE0?=
 =?utf-8?B?aUpxWTZhSHRjTEM4aWlxbk13WGVlWlR6dDl1NUtDYmhCcTBDOVp2Rnk5T3Zm?=
 =?utf-8?B?U0tESjY5Yi9lMFNHTEQ2NzhVaTlJVktGM1JRWXl3VXhRcjJxTmpQaTZQQk1O?=
 =?utf-8?B?c00vVXZKVUFLRS90ek5oZ21mSGlnSEZsZHRQNTRIdEtqNnJpQ1pUQjZGNDVw?=
 =?utf-8?B?M2ozWnk0OHFzcFVLRC9oc2xZSy9heExFcGJwbExSQ0ZWL1JIbEs5YytGVm9O?=
 =?utf-8?B?TG1NWHcraE80MWpqWHNxdUk0NHM5OUN2L1FNbmN1NzZ3RitvNU51VjhaeXUx?=
 =?utf-8?B?MWI5UGRqNU5xaG9WeG5JRXZIaCtyRzJhTTRKcXZRNXhhYk1hUGhYbitaOC9r?=
 =?utf-8?B?Y2I0WHdiaFk1YmNJYlpkd2ZrWXRyeVNqYkh2MUQvTkt6cFpLZ2FpSTNNRTM4?=
 =?utf-8?B?RlN5NkQ3TldBdXByY2hGNitaMHlVUTVaNWlMSm5PVW1lR3E4TVRyOXFydFpG?=
 =?utf-8?B?a3AyU3Vhd3JZTnlzMHhEMWxVM3hqRG9wSFZUZ1VSdEtSTFBxZFVyeVpKcWhU?=
 =?utf-8?B?S29Kdk5lQUJScHV1MDdzcUhhUHFETGZyOHdoNzQxUkM4NVhGYndwOWV4dlVC?=
 =?utf-8?B?cnBTcEp1UTdKRE9iQUJ2b0JoV2tWN0xiTWtrQ014VXo1bUwrWFlYaUdGaGtC?=
 =?utf-8?B?R0t4VlB0WkFzTC9qeU5KVS9sVnV2Y1dYR2ZzNXQ5R05YeWNXcS92eklKU3NG?=
 =?utf-8?B?Mkk5eE1EUUFVNDRjdUxMWDROcHdrUGY2MG1KaE13enBNYy9aa3RjNGVadHNN?=
 =?utf-8?B?TlhkTHBZYzdDQjg0R0RLVmFOZ3Iyb0UrL1R0VjZvczJZY2JnTE1LY3VxTStY?=
 =?utf-8?B?a1Fpb3NMN1BJU3FTditpNUNBL3E2TUdqVTVZYWhYaVZKcFAwOXo2UHRZbDVC?=
 =?utf-8?B?MnVzaCt4UXQxeXI3Z0c3SUlteHhGaFEvRGVQKzlZcTdnN1hEM0Juby9pVFhY?=
 =?utf-8?B?RmRMZmdEc1ZlQTMrbjRDbFV0bzhRdnkxK1pRTHZ4cklpclpaazhOVXhBNzd1?=
 =?utf-8?B?SVNSUFhtWmpZV2dDZmVBbVM1NDJXOUlsUnExdmdNUzMxbnNSUW1RZ3ZXNEpN?=
 =?utf-8?B?U2w1Vks5ZTBWQTRVSXMxd3lXK1NIVnRXK0todVRXWWhsR0lRYWZuRWJ6VDNM?=
 =?utf-8?B?UGlkaVI0YmlJZDNQWFJZNHNxUG5HUWRaWjVrWmR3ZVEvNkc4Q2tqa1c1TTVI?=
 =?utf-8?B?Ny9HSjFUNW5KeUh6R1NxR3p3dkhFR3cvbkt0VUZ1dWk4NU1GK1Bndi9lK01l?=
 =?utf-8?B?MnF6b2FCR2l6aGZmMzJISURIbDRWUVlWd3pvZ2llaUhGaG0vTE1VbmV5Q1VC?=
 =?utf-8?B?cGlvOVR4Y2VFN2xxTE5VR25Ybmd0RllJUUZlVklkRUZlNTlXM1BqK2xzdHNq?=
 =?utf-8?B?bFVqeWRHT3BpWmtHdjk0R1FFRWFCNFE5ODJlZEI2anVOYXJSNjNPODJHQkJY?=
 =?utf-8?B?eXIyLzZLUGx6MFhHNVNsVHZab1hocWFsUDdPN2hIYjlFc091SSt1M0FYTmNO?=
 =?utf-8?B?aHpvY215Z2w0dURlYkYzdU5BL2R2WEYvekVqYk5EMjJDOFdVVUlSR05CZ2RR?=
 =?utf-8?B?MmdnTFdLYlhEZ2t1VmlPcms3Wnc2YXN6eHo4L1E2bzBONElQWjRmMEs0Mjkv?=
 =?utf-8?B?VWNqTmRBYXdpSGtBMVJTUzk2SGlNdVpsMjgzVGRYZTNlTzFzNTVJK2JUcEl6?=
 =?utf-8?B?QmNDOFVxL1RxOHZOZGVtUVVyNy9tTEx1d0dMNUVlRnNPMXlObnJheTc1V00y?=
 =?utf-8?B?K3V0dHVXanNsOFlCVVdSc1lvV2lHb29GbkxibThqRHZvWmZuQnFONHhxZDN4?=
 =?utf-8?Q?+ArSHwje2/vaBgWbKAqvGNGEAxSh5EeDMwvMc720RF/g1?=
X-MS-Exchange-AntiSpam-MessageData-1: APyQcgwpllVkZg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b62cf3c-21f8-450b-21e5-08dee6f9a7b5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:28:26.9288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUviEGit3S2SPzuWhljUwpbP7D9m7ZNVio3bk0p7CgUFnX255SqbA0nHA+OLF1G90sbgpb+mRpNfhmAXPyeJTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999114

On Thursday, July 16, 2026 11:52=E2=80=AFAM Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq(=
)
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/mailbox/arm_mhu_db.c               |  1 -
>  drivers/mailbox/arm_mhuv2.c                |  9 ++-------
>  drivers/mailbox/arm_mhuv3.c                |  5 ++---
>  drivers/mailbox/armada-37xx-rwtm-mailbox.c |  4 +---
>  drivers/mailbox/bcm-pdc-mailbox.c          |  5 +----
>  drivers/mailbox/bcm2835-mailbox.c          |  5 +----
>  drivers/mailbox/bcm74110-mailbox.c         |  2 +-
>  drivers/mailbox/cv1800-mailbox.c           |  2 +-
>  drivers/mailbox/hi6220-mailbox.c           |  5 +----
>  drivers/mailbox/mailbox-mpfs.c             |  2 --
>  drivers/mailbox/mailbox-sti.c              |  4 +---
>  drivers/mailbox/qcom-cpucp-mbox.c          |  2 +-
>  drivers/mailbox/qcom-ipcc.c                |  4 +---
>  drivers/mailbox/sprd-mailbox.c             | 12 +++---------
>  drivers/mailbox/stm32-ipcc.c               |  4 +---
>  drivers/mailbox/sun6i-msgbox.c             |  4 +---
>  drivers/mailbox/tegra-hsp.c                | 11 ++---------
>  17 files changed, 20 insertions(+), 61 deletions(-)
>=20
> diff --git a/drivers/mailbox/arm_mhu_db.c b/drivers/mailbox/arm_mhu_db.c
> index 9e937b09c5fb..a39239e38a47 100644
> --- a/drivers/mailbox/arm_mhu_db.c
> +++ b/drivers/mailbox/arm_mhu_db.c
> @@ -318,7 +318,6 @@ static int mhu_db_probe(struct amba_device *adev, con=
st struct amba_id *id)
>  						mhu_db_mbox_rx_handler,
>  						IRQF_ONESHOT, "mhu_db_link", mhu);
>  		if (err) {
> -			dev_err(dev, "Can't claim IRQ %d\n", irq);
>  			mbox_controller_unregister(&mhu->mbox);
>  			return err;
>  		}
> diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
> index f035284944c0..213fd4a39993 100644
> --- a/drivers/mailbox/arm_mhuv2.c
> +++ b/drivers/mailbox/arm_mhuv2.c
> @@ -986,10 +986,7 @@ static int mhuv2_tx_init(struct amba_device *adev, s=
truct mhuv2 *mhu,
>  		ret =3D devm_request_threaded_irq(dev, adev->irq[0], NULL,
>  						mhuv2_sender_interrupt,
>  						IRQF_ONESHOT, "mhuv2-tx", mhu);
> -		if (ret) {
> -			dev_err(dev, "Failed to request tx IRQ, fallback to polling mode: %d\=
n",
> -				ret);
> -		} else {
> +		if (!ret) {
>  			mhu->mbox.txdone_irq =3D true;
>  			mhu->mbox.txdone_poll =3D false;
>  			mhu->irq =3D adev->irq[0];
> @@ -1039,10 +1036,8 @@ static int mhuv2_rx_init(struct amba_device *adev,=
 struct mhuv2 *mhu,
>  	ret =3D devm_request_threaded_irq(dev, mhu->irq, NULL,
>  					mhuv2_receiver_interrupt, IRQF_ONESHOT,
>  					"mhuv2-rx", mhu);
> -	if (ret) {
> -		dev_err(dev, "Failed to request rx IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
> =20
>  	/* Mask all the channel windows */
>  	for (i =3D 0; i < mhu->windows; i++)
> diff --git a/drivers/mailbox/arm_mhuv3.c b/drivers/mailbox/arm_mhuv3.c
> index a1c528be47f3..6569c3dda377 100644
> --- a/drivers/mailbox/arm_mhuv3.c
> +++ b/drivers/mailbox/arm_mhuv3.c
> @@ -982,8 +982,7 @@ static int mhuv3_setup_pbx(struct mhuv3 *mhu)
>  						mhuv3_pbx_comb_interrupt,
>  						IRQF_ONESHOT, "mhuv3-pbx", mhu);
>  		if (ret)
> -			return dev_err_probe(dev, ret,
> -					     "Failed to request PBX IRQ\n");
> +			return ret;
> =20
>  		mhu->mbox.txdone_irq =3D true;
>  		mhu->mbox.txdone_poll =3D false;
> @@ -1020,7 +1019,7 @@ static int mhuv3_setup_mbx(struct mhuv3 *mhu)
>  					mhuv3_mbx_comb_interrupt, IRQF_ONESHOT,
>  					"mhuv3-mbx", mhu);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to request MBX IRQ\n");
> +		return ret;
> =20
>  	for (i =3D 0; i < NUM_EXT; i++)
>  		if (mhu->ext[i])
> diff --git a/drivers/mailbox/armada-37xx-rwtm-mailbox.c b/drivers/mailbox=
/armada-37xx-rwtm-mailbox.c
> index 456a117a65fd..047926711e96 100644
> --- a/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> +++ b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> @@ -108,10 +108,8 @@ static int a37xx_mbox_startup(struct mbox_chan *chan=
)
> =20
>  	ret =3D devm_request_irq(mbox->dev, mbox->irq, a37xx_mbox_irq_handler, =
0,
>  			       DRIVER_NAME, chan);
> -	if (ret < 0) {
> -		dev_err(mbox->dev, "Cannot request irq\n");
> +	if (ret < 0)
>  		return ret;
> -	}
> =20
>  	/* enable IRQ generation */
>  	reg =3D readl(mbox->base + RWTM_HOST_INT_MASK);
> diff --git a/drivers/mailbox/bcm-pdc-mailbox.c b/drivers/mailbox/bcm-pdc-=
mailbox.c
> index 406bc41cba60..6fcc4002ad4f 100644
> --- a/drivers/mailbox/bcm-pdc-mailbox.c
> +++ b/drivers/mailbox/bcm-pdc-mailbox.c
> @@ -1403,11 +1403,8 @@ static int pdc_interrupts_init(struct pdc_state *p=
dcs)
> =20
>  	err =3D devm_request_irq(dev, pdcs->pdc_irq, pdc_irq_handler, 0,
>  			       dev_name(dev), dev);
> -	if (err) {
> -		dev_err(dev, "IRQ %u request failed with err %d\n",
> -			pdcs->pdc_irq, err);
> +	if (err)
>  		return err;
> -	}
>  	return PDC_SUCCESS;
>  }
> =20
> diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-=
mailbox.c
> index ea12fb8d2401..5af1e434c71c 100644
> --- a/drivers/mailbox/bcm2835-mailbox.c
> +++ b/drivers/mailbox/bcm2835-mailbox.c
> @@ -147,11 +147,8 @@ static int bcm2835_mbox_probe(struct platform_device=
 *pdev)
>  	ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
>  			       bcm2835_mbox_irq, IRQF_NO_SUSPEND, dev_name(dev),
>  			       mbox);
> -	if (ret) {
> -		dev_err(dev, "Failed to register a mailbox IRQ handler: %d\n",
> -			ret);
> +	if (ret)
>  		return -ENODEV;
> -	}
> =20
>  	mbox->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mbox->regs)) {
> diff --git a/drivers/mailbox/bcm74110-mailbox.c b/drivers/mailbox/bcm7411=
0-mailbox.c
> index 344cfc35984b..c8709d509912 100644
> --- a/drivers/mailbox/bcm74110-mailbox.c
> +++ b/drivers/mailbox/bcm74110-mailbox.c
> @@ -601,7 +601,7 @@ static int bcm74110_mbox_probe(struct platform_device=
 *pdev)
>  	ret =3D devm_request_irq(dev, mbox->rx_irq, bcm74110_mbox_isr,
>  			       IRQF_NO_SUSPEND, pdev->name, mbox);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to request irq\n");
> +		return ret;
> =20
>  	mbox->controller.ops =3D &bcm74110_mbox_chan_ops;
>  	mbox->controller.dev =3D dev;
> diff --git a/drivers/mailbox/cv1800-mailbox.c b/drivers/mailbox/cv1800-ma=
ilbox.c
> index 4bca9d8be4ba..b062c2c4fc61 100644
> --- a/drivers/mailbox/cv1800-mailbox.c
> +++ b/drivers/mailbox/cv1800-mailbox.c
> @@ -189,7 +189,7 @@ static int cv1800_mbox_probe(struct platform_device *=
pdev)
>  					cv1800_mbox_isr, IRQF_ONESHOT,
>  					dev_name(&pdev->dev), mb);
>  	if (err < 0)
> -		return dev_err_probe(dev, err, "Failed to register irq\n");
> +		return err;
> =20
>  	for (idx =3D 0; idx < MAILBOX_MAX_CHAN; idx++) {
>  		mb->priv[idx].idx =3D idx;
> diff --git a/drivers/mailbox/hi6220-mailbox.c b/drivers/mailbox/hi6220-ma=
ilbox.c
> index 69d15b6283e9..8eb8242209be 100644
> --- a/drivers/mailbox/hi6220-mailbox.c
> +++ b/drivers/mailbox/hi6220-mailbox.c
> @@ -297,11 +297,8 @@ static int hi6220_mbox_probe(struct platform_device =
*pdev)
> =20
>  	err =3D devm_request_irq(dev, mbox->irq, hi6220_mbox_interrupt, 0,
>  			dev_name(dev), mbox);
> -	if (err) {
> -		dev_err(dev, "Failed to register a mailbox IRQ handler: %d\n",
> -			err);
> +	if (err)
>  		return -ENODEV;
> -	}
> =20
>  	mbox->controller.dev =3D dev;
>  	mbox->controller.chans =3D &mbox->chan[0];
> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpf=
s.c
> index 6c40d865b3f1..704a259bbca8 100644
> --- a/drivers/mailbox/mailbox-mpfs.c
> +++ b/drivers/mailbox/mailbox-mpfs.c
> @@ -219,8 +219,6 @@ static int mpfs_mbox_startup(struct mbox_chan *chan)
>  		return -EINVAL;
> =20
>  	ret =3D devm_request_irq(mbox->dev, mbox->irq, mpfs_mbox_inbox_isr, 0, =
"mpfs-mailbox", chan);
> -	if (ret)
> -		dev_err(mbox->dev, "failed to register mailbox interrupt:%d\n", ret);
> =20
>  	return ret;
>  }
> diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.=
c
> index b6c9ecbbc8ec..4fb5d1b5504a 100644
> --- a/drivers/mailbox/mailbox-sti.c
> +++ b/drivers/mailbox/mailbox-sti.c
> @@ -468,10 +468,8 @@ static int sti_mbox_probe(struct platform_device *pd=
ev)
>  					sti_mbox_irq_handler,
>  					sti_mbox_thread_handler,
>  					IRQF_ONESHOT, mdev->name, mdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Can't claim IRQ %d\n", irq);
> +	if (ret)
>  		return -EINVAL;
> -	}
> =20
>  	dev_info(&pdev->dev, "%s: Registered Tx/Rx Mailbox\n", mdev->name);
> =20
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpu=
cp-mbox.c
> index 862e45e8fbd5..8d0000e2b2f9 100644
> --- a/drivers/mailbox/qcom-cpucp-mbox.c
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -156,7 +156,7 @@ static int qcom_cpucp_mbox_probe(struct platform_devi=
ce *pdev)
>  	ret =3D devm_request_irq(dev, irq, qcom_cpucp_mbox_irq_fn,
>  			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND, "apss_cpucp_mbox", cpucp)=
;
>  	if (ret < 0)
> -		return dev_err_probe(dev, ret, "Failed to register irq: %d\n", irq);
> +		return ret;
> =20
>  	writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + APSS_CPUCP_RX_MBOX=
_MAP);
> =20
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index d957d989c0ce..e5ebb4a237ff 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -323,10 +323,8 @@ static int qcom_ipcc_probe(struct platform_device *p=
dev)
>  	ret =3D devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
>  			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND |
>  			       IRQF_NO_THREAD, name, ipcc);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
> +	if (ret < 0)
>  		goto err_req_irq;
> -	}
> =20
>  	platform_set_drvdata(pdev, ipcc);
> =20
> diff --git a/drivers/mailbox/sprd-mailbox.c b/drivers/mailbox/sprd-mailbo=
x.c
> index 565502904e1f..9013d2ece55f 100644
> --- a/drivers/mailbox/sprd-mailbox.c
> +++ b/drivers/mailbox/sprd-mailbox.c
> @@ -377,10 +377,8 @@ static int sprd_mbox_probe(struct platform_device *p=
dev)
> =20
>  	ret =3D devm_request_irq(dev, inbox_irq, sprd_mbox_inbox_isr,
>  			       IRQF_NO_SUSPEND, dev_name(dev), priv);
> -	if (ret) {
> -		dev_err(dev, "failed to request inbox IRQ: %d\n", ret);
> +	if (ret)
>  		return ret;
> -	}
> =20
>  	outbox_irq =3D platform_get_irq_byname(pdev, "outbox");
>  	if (outbox_irq < 0)
> @@ -388,20 +386,16 @@ static int sprd_mbox_probe(struct platform_device *=
pdev)
> =20
>  	ret =3D devm_request_irq(dev, outbox_irq, sprd_mbox_outbox_isr,
>  			       IRQF_NO_SUSPEND, dev_name(dev), priv);
> -	if (ret) {
> -		dev_err(dev, "failed to request outbox IRQ: %d\n", ret);
> +	if (ret)
>  		return ret;
> -	}
> =20
>  	/* Supplementary outbox IRQ is optional */
>  	supp_irq =3D platform_get_irq_byname(pdev, "supp-outbox");
>  	if (supp_irq > 0) {
>  		ret =3D devm_request_irq(dev, supp_irq, sprd_mbox_supp_isr,
>  				       IRQF_NO_SUSPEND, dev_name(dev), priv);
> -		if (ret) {
> -			dev_err(dev, "failed to request outbox IRQ: %d\n", ret);
> +		if (ret)
>  			return ret;
> -		}
> =20
>  		if (!priv->info->supp_id) {
>  			dev_err(dev, "no supplementary outbox specified\n");
> diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
> index 4f63f1a14ca6..c6134de1a93b 100644
> --- a/drivers/mailbox/stm32-ipcc.c
> +++ b/drivers/mailbox/stm32-ipcc.c
> @@ -263,10 +263,8 @@ static int stm32_ipcc_probe(struct platform_device *=
pdev)
>  		ret =3D devm_request_threaded_irq(dev, ipcc->irqs[i], NULL,
>  						irq_thread[i], IRQF_ONESHOT,
>  						dev_name(dev), ipcc);
> -		if (ret) {
> -			dev_err(dev, "failed to request irq %lu (%d)\n", i, ret);
> +		if (ret)
>  			goto err_clk;
> -		}
>  	}
> =20
>  	/* mask and enable rx/tx irq */
> diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbo=
x.c
> index 6ba6920f4645..1cbc4d478beb 100644
> --- a/drivers/mailbox/sun6i-msgbox.c
> +++ b/drivers/mailbox/sun6i-msgbox.c
> @@ -257,10 +257,8 @@ static int sun6i_msgbox_probe(struct platform_device=
 *pdev)
> =20
>  	ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
>  			       sun6i_msgbox_irq, 0, dev_name(dev), mbox);
> -	if (ret) {
> -		dev_err(dev, "Failed to register IRQ handler: %d\n", ret);
> +	if (ret)
>  		goto err_disable_unprepare;
> -	}
> =20
>  	mbox->controller.dev           =3D dev;
>  	mbox->controller.ops           =3D &sun6i_msgbox_chan_ops;
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index 500fa77c7d53..03ee73aad488 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -708,11 +708,8 @@ static int tegra_hsp_request_shared_irq(struct tegra=
_hsp *hsp)
> =20
>  		err =3D devm_request_irq(hsp->dev, irq, tegra_hsp_shared_irq, 0,
>  				       dev_name(hsp->dev), hsp);
> -		if (err < 0) {
> -			dev_err(hsp->dev, "failed to request interrupt: %d\n",
> -				err);
> +		if (err < 0)
>  			continue;
> -		}
> =20
>  		hsp->shared_irq =3D i;
> =20
> @@ -856,12 +853,8 @@ static int tegra_hsp_probe(struct platform_device *p=
dev)
>  		err =3D devm_request_irq(&pdev->dev, hsp->doorbell_irq,
>  				       tegra_hsp_doorbell_irq, IRQF_NO_SUSPEND,
>  				       dev_name(&pdev->dev), hsp);
> -		if (err < 0) {
> -			dev_err(&pdev->dev,
> -			        "failed to request doorbell IRQ#%u: %d\n",
> -				hsp->doorbell_irq, err);
> +		if (err < 0)
>  			return err;
> -		}
>  	}
> =20
>  	if (hsp->shared_irqs) {
> --=20
> 2.34.1
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>




