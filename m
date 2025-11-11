Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79A5279787;
	Tue, 11 Nov 2025 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762849932; cv=fail; b=Q6oRRFP/v9mUoSHiql/6uIhJNpmzWp2HSVOuCGN9hpkmVJTLPeq2qWINdhYdjiD3/dQc/sJoo0oHrYkAoD4rSlvljW+1MXKA6uLQ8vVYcM44sHg0yDYJ5NXy+EKmayHWqF4X/ij8dNxDm9Ca8irJg7PTejVey6aETcq2jgwDwyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762849932; c=relaxed/simple;
	bh=j3T6fZM27Mhcbi0bAEC23F1Xb58cX31lQijsobS2CDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WylklS+iVLLNed1WmOuwfC6oLrmOdI+bE8+L9m8QK3gFzjPNHj7Dy7rPrLQd7411GOV2iBolTQ/tvQ2z2CIdVjD+xLgBJFc1SQvck5pI/xtCvO2bIJW8noveE6FpHofPNfsXC6v3awvtKjJ5sXfF6z65zQK5sOeYP1qOHdehYLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FS0jZg2U; arc=fail smtp.client-ip=52.101.48.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FS0jZg2U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ql1i2RJyw2ojSCU75GaXuUZxRHXlBANP5ckvzt+WPcP4rvp/+1mN1QBKXR83H1uZiOi9xZVJapYMsCh5BCRrqNGPEUkR+6+qTKpn2hL1fzBk5X3BPiyJ6gXIISEy9EJ4chHbEliUuVcARhVIwbZmfSmDx8XFixJEbSQhAxM8QnVvABArPtKhpkUxrSa87CuAEGI86uKnvDLqrX2xyz0/VJihxhd3ODf0QFqI9cozmi/kp6r6NCyC9S19nSzctNSEv6+3sDOmNVV6ZTCGezpWb2E/J4eGFOIMklQZUbEBXRgfpDUk3auRVab1BHbB+b8p0L1aNQmUzwsqEDODtxFKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AFiZsmvgCFiaaY5nzuT5NotOFmcmssQRzntc0FHxV8=;
 b=VVgQofIC5WFOWOcsokasScrOGvrV5QjVVm8n4fKaLCTPCuYaq6Mn1iqLvdyEWOHgrllBuz1e9xXa20k7zI/Vkjqo4rn4+jSWXAIsT5i6evzcI8V9Li26iS9nic4+js8c/u00hT0eCT5rFvk8AoSAOpZBTbAtT19yyaPWV9W+FKl2MaykWnB2wrn6mhk8fTfv+UShrrh9H9G/3cIYne0V06Rfu3YaXist6AM88+p+QB5QQVhPSl/1uY6TRT+vvzPpXAB4udk8m9LT9vxavBb10iDiL5XNzn025sKJYXoswlB84GE0kuTom2VmtHxLC57BrZZHweDAbkSSld0lWB/v4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AFiZsmvgCFiaaY5nzuT5NotOFmcmssQRzntc0FHxV8=;
 b=FS0jZg2UhGeU2YNtuNKJ9HaKESKNpeswh0us1daqMIbBfcBbCIN3cT9RcoImxbVwUFs1rHOiR73EL2LNXV3a8i73YjrWXMx1IUf45VRyWIOxJZOnAYSG8yuL/ZvWSsN3xOyKzB2TnsCrX7GSi6/krDraA6x2tSQWLomh0OMZGjxEeacFtNU/HDK3KbXfagRArzszfWZnh2h+zyyw8LXDmE54hZokFoopxuGfuydHtNP8BjcgUfzDIq1bbWj6PbE6SunRGT5Gwk80S6AqevKvqtqeG/3L5i/GR3RVSSAZMeyfTrsB2CwsxctLyx+5Cv3z7djX5NC9X7soemBYhYzhFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DS7PR12MB6310.namprd12.prod.outlook.com (2603:10b6:8:95::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 08:32:07 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 08:32:07 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, webgeek1234@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH v5] soc: tegra: fuse: speedo-tegra210: Add soc speedo 2
Date: Tue, 11 Nov 2025 17:32:04 +0900
Message-ID: <2318763.irdbgypaU6@senjougahara>
In-Reply-To: <20251021-t210-actmon-p3-v5-1-e1ef5e93909d@gmail.com>
References: <20251021-t210-actmon-p3-v5-1-e1ef5e93909d@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0099.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::15) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DS7PR12MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 7790a37b-582e-4883-ba79-08de20fccccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEUxZFFXOHp5YnlBZEFNYnlkRUFJSHJNazJwY1JwTThsd2VGRkN1R3M4cjZt?=
 =?utf-8?B?WTlONC9CSE1MNHE5eWMrWUdvQXpmbWtCRUxQVEczQzBaaFovM0NnRGFhSFA2?=
 =?utf-8?B?b0lYT0RNbFdNZGdCZ3NuVDNEK0M1SklUODYrejJSREJ0d1pKUi8rSW1PNjlT?=
 =?utf-8?B?YUNOOTIxR2hCNWg1K25aWVJxWEZDOWxaMWZjRUZPOTB6MEx3OS9Wdy9rUUdy?=
 =?utf-8?B?SFdqYXlLS3dOeUFnK0hHbWNsZVNRMGtzM3VVY3BOV1RQYVJiNDIwcWI3TDBJ?=
 =?utf-8?B?bkdCdWxLeE5DOFlKOGtSOFJlNS96Ly9DWGJLMzNGMnUvY2UweFUxaGpRdXJo?=
 =?utf-8?B?RXo3Z2s3bmh6RitWZXVvcWt4aU1KWlRiNXp5VHhOczRueUZCZStGRWpRQW91?=
 =?utf-8?B?eEZIN1J1bjRqUzU3Uk1PVGxLWEdSbk9yTHB3RXFBd3VNcCsraWVCZ0xnL1F0?=
 =?utf-8?B?ZE16Tmt5RHM0R1JtWVNkWTRuUGI1bUhtTXJ1K0ZxQ3pEeklHcldJNk4xd25S?=
 =?utf-8?B?YlBVRW55ZnNPZk43MzZtKzlCamk5ZCsrS3ROR3o5Ny84Nk00bkN2K0duWjNR?=
 =?utf-8?B?Mm5tbDFGTytpWHJ2SzY0bFB0WHlWbW11MVAvVGY1RW1lK1N0ZzUwL29wVkRs?=
 =?utf-8?B?Q0wyYnBFa1ZGdm1uOUQ2MVgxck5NNElMSGtheEVnTjFjWldqQzJFMHZjVjZy?=
 =?utf-8?B?cmsrcUdGamVqa0xaYUhxb2xFUFpZR2ZYajNManh0V0VkRXFJZU1kU1l5Tkow?=
 =?utf-8?B?dHNyeEZ0ZTlpN0RnU3VldEdyKys1UXNwd1JGSi9sOU9OOG5MQ0x3MlVFeERi?=
 =?utf-8?B?aEwwdFoxRjdMaHVFaFpaaWdQSFdiaGtLVDhqb0VkSmRHYm0rUGUwRmVRcDU3?=
 =?utf-8?B?Nlh5Y2krSTRzdjc4REdxZUlpbStXeUVmZTVtaCtHTUczSlBadFRiQSs5dmRO?=
 =?utf-8?B?bDFUOVRtNUcvTTJDVHRqRjVzaTJ2a01uSWRDS2hKTmU5N2srL2dVUUl6VWpt?=
 =?utf-8?B?bGtqNHdFREUvRGdYYlFtMnFWL1BKSVhaeE92akh6dG9EdytOYnBVaTBHbVVn?=
 =?utf-8?B?ZzJKVCt0ZmRoUnlRSnVjdGgzOXg4YlZMdi9KdFBvQWVSZFJQN2g2WDk2Z3VS?=
 =?utf-8?B?TFhiY0RDVFRGVmNmNTBrWHdVOVhySUdCSHRJWDFIOUh6N2IvTEJYb1Rwdkx1?=
 =?utf-8?B?VzFLdEdNR29McVQ4MGRodjZtT2hTV2QvcSttV3JYSWNQczJRVUdySENLSzY1?=
 =?utf-8?B?TGtIVGZaN1dySXJIQ3RNSlVzR3J5QS9GM3U2ajVZNzkrbE5hN2hHTSs0Z3Fh?=
 =?utf-8?B?WmRQMWRkM1lmVVhWQjE4S0xmeUVvcEZrNFpBRCttZlRIQnBFbUR2MXlPdDhw?=
 =?utf-8?B?VzRLVmtzdEhNWjg2ZXRUU0hBYStPeEJ0ZXZmYUxtTXdNY2tqYWpHQTFaUDZK?=
 =?utf-8?B?SEJkOEoyZDc1dGhwZ3BZaWd0eVdkeWV1YjJFVjVYdmFES3JPczAzbXFjQmxR?=
 =?utf-8?B?TkhyMDBhZzVFV3hKenBoTDV4Tm9jU0dlWnhMSUdvelBDb3pMTHlLNjZFN0dr?=
 =?utf-8?B?MW5wMTZ6ZFJJb2VmTU1xQ0FvbS9TS1RwRXBsWUF0Njh0ZlRyWlE1S0toc2V3?=
 =?utf-8?B?SnZqS05lVHFTSm1qWTl6WTRpa2xjTGJ1VGJiYjFYTnhDMkxJRTNhUmlFNUF6?=
 =?utf-8?B?K29VOWhnNUIydit6SUV0RGFHamVOYkkrb0NuWW9maW9vUFpMbUJURVJYL0Jq?=
 =?utf-8?B?RmtjU3lTWTQrdFFaQkpsbHBscFI1bWk5S1FaaXB6YkN3UDdDb09LL0MwWVFC?=
 =?utf-8?B?MXlXcmRraXpvV0gvSU16dmdSUWU1OXhqNW5TYUNldzhpRzRZencvNVFtSytx?=
 =?utf-8?B?b1ZsMkd3VkxOTHRxRTRSM3BBelhLUThrR0lzK0k4TGxvZitUVFZ0dmp3NEdY?=
 =?utf-8?B?Mk1vZVNXZ0lhM0pPTXJqS09SNmlJdExXa1ZjZVhnVWlHV1dvazVtZnc0QjFD?=
 =?utf-8?B?OHdoQy9UM0NBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUZCZmt5U3o0TlBmVnZpell5STMrcGk2TlZ2enVLeUYrQS9Hek5ENzlQbWw3?=
 =?utf-8?B?T0ZJVlhnNUU5SzhiU1JSV2JuSHFzV2hqdHZNQWZreHI5d1B3clVQRXJnb0p1?=
 =?utf-8?B?NVN1dWdDU2F3L2x1bjFmNXhjL0FhTno4d0tNdHdleHJnSE9UZ3NwRWVYYkVr?=
 =?utf-8?B?K3lYcVFtM2tpWml1aVY3N2FTMzIxY3hTSkN2SThZL3ZnOU00V0YxMGJGOTZH?=
 =?utf-8?B?Y3V0VFRIMG50c1A3Z25uNmJoK0FlUDVKRlVEMFg1Rm1oT2FrWUlERDZ4SzZV?=
 =?utf-8?B?Y3BmaEZxVzlEemdDWG5YU3RRMHdlbnZlZWxiY24rNksrRm1CYTVCR1J3N0Vu?=
 =?utf-8?B?SkZDbGVTQzJwNWQzUzk1bGpxYUZxYjZ2L1kvQnozM0V4VWMzdUJNUGRFNlJt?=
 =?utf-8?B?Wlk3L0NiRDZwcXEwTFk3dzFzNWVRUUkrdnlnMXN2bHlzNi9TSGhRSjZ2N3kr?=
 =?utf-8?B?UFJHVnNsUHFxQmlhVnhMdDdmR2JNZkk4ZUVIVjlLakJMK1YxS1NpaCtCOTBV?=
 =?utf-8?B?MWd5eEgyNEZGckVUVTkwZXRlVXJEbFA0eWpOVnhqRWRpa0plNkhYcVppUmdx?=
 =?utf-8?B?bFY1ajFiSHJLT1psbUIwc3BORmNRcERQSHNtVjhTQUFrUjByOTF4eTRRRjdI?=
 =?utf-8?B?dkRqTzQxR3Y3eUNLV3lVd2tmbHlZRTVsSmxBMmJOWXNmeDNRWTNqNStVTHdi?=
 =?utf-8?B?dW15T0dQbzgxU3pLclRwVVRNUlpNT2ZzbFljbk9JNVpUYzRySkR0Sit3aHhL?=
 =?utf-8?B?UUZBeEZKeEFSc25jVWgzN2dMQ1JmWjFDZUpRSkVubVlPMWpOeENsUG1GVHJa?=
 =?utf-8?B?QU5KOW1Gd2Z1Z1o4M2tBekFEdmZuUUxCRzIra3RGQ2VNd3NNaHA1SHFqazBp?=
 =?utf-8?B?U3VnejdsKzhMLzhTb1B1c3FMbjh3TWxJMmNUbFQrNVNncFZ0bi81SlZwV0JV?=
 =?utf-8?B?ZXdpZEJrRkljQWlTQjBzL1BVNmtKWmF4bTg4YS9BSDBNbURkbUFRc0c4WEZt?=
 =?utf-8?B?SThEM2grWFV0Z3dLQlBPMHNnbGc5TVBjSmNXRHdJUzZtRStxK0J6aW5wazFw?=
 =?utf-8?B?cW5yWW5JSHFQRnpzM0FLLzJvcnF3QytvMFNFN21wOVM0aUVRTk4xM3BrOXd5?=
 =?utf-8?B?dHdCN0grcGJqWUd2dk1ZNkRtS3hid2Y0L1E3bS9kTEx3ZExoZmtjc1kyOTJP?=
 =?utf-8?B?L21SSitnZmdsYUdRVnE1KzhxbmZranZ5UkF2YW5RZUFzR0dRc3pqdUtyRTlD?=
 =?utf-8?B?MmZieDd0ckhzNTBNZ2QvQzJrQXE2bHpyMFJjUmxIQkRQY2pwcTByNWcwalZj?=
 =?utf-8?B?bzV3eE1yeWUwajRGalliMEJ2cVNuSER1NFd5bVhHTWJMUHBqOElweGtHcEsz?=
 =?utf-8?B?VXpCaVhqdjN1THg5N0I5Z3plOUdmY1ora09xU2IzdlA1SjFHc2ZNS3IrVEEx?=
 =?utf-8?B?UjRvS2FVNVZCUklZY00wenVFQ2hWS3NzdFhobUlMbERxQWxHT0gvLzJTYlpj?=
 =?utf-8?B?akE1S1JzaUpYa08xUmVsVjZSeEo4T3IvZlZuTXRNOE9KZXoyaDdtWVdnN2p4?=
 =?utf-8?B?aTNPcllwZ3c1VER6TXlrSHRkSUUyWG5NTWFYdWQ4TlU4TlJlN21raVkwZWFh?=
 =?utf-8?B?cVBsTExNS3hUM2FqT0YxTHcyYWNXNWRtUWNja1ZtbGNkbmtraGlJTUxKeVRh?=
 =?utf-8?B?cnI0RXpCNHpwTFlyV1hnQ3E0OE1RY2NIV3I5Y2lIOVp4QXAySzFacHcrR0Yr?=
 =?utf-8?B?WlEzS09jdjg1dmZOOURDaTRnNGF3aFdzQmVheWxrWDdjWVRqSkZsNDUwbVE5?=
 =?utf-8?B?Vi9ZQ1pNeE40U2d5a1JjYVhvSkdDL2s0a1hDd3dvT08rbkNEQjM2YTU4YlE4?=
 =?utf-8?B?UGtJYWZjc013MGo5TE5ycWZQMW0zOW85MFlNT1RTM01FaFBpb2Jjd0drYmJ6?=
 =?utf-8?B?UDNqRnN0OUZZQ1B2bXV2ak5WQnJrdjZvU3c0cklFd2hvREZuak92dEU3M1hQ?=
 =?utf-8?B?ZmU0VmJnUjlMQnRuS0p4dUhpckJUNXpEd1lpOG43SStYVmNTdmpsM1VtRWoy?=
 =?utf-8?B?aTRtVU9EMXlNQllGc0RCc2Q3MkdKYjF1Mzl4WTQ2RTJrbCs0OTFscno4QThJ?=
 =?utf-8?B?SjZjRTVoZUNTQ2RHdVg5N2xRMEF3ZmJmNnFHb0hiWU1lVHlLV2ZVMTN2V1Ny?=
 =?utf-8?B?R1VoT0lFMWNQZ1N6VFlmVnV5bzBTRHloUUFGcWhwaEU2MWJZL2VJZzZqVXZU?=
 =?utf-8?B?UXhkM1g4aVdHeklnalN5MFhrZWd3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7790a37b-582e-4883-ba79-08de20fccccb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 08:32:07.4441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHvV2THd7Xer4b9sEUlW8MqaNwzWTNVQy4EkSe+P7QSeFT+pMvk6uJMOTKsNP1URqqtA11Mu0c4EQWjKM/987Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6310

On Wednesday, October 22, 2025 12:11=E2=80=AFPM Aaron Kling via B4 Relay wr=
ote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> The Jetson Nano series of modules only have 2 emc table entries,
> different from other soc sku's. As the emc driver uses the soc speedo to
> populate the emc opp tables, add a new speedo id to uniquely identify
> this.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v5:
> - Split series
> - Link to v4: https://lore.kernel.org/r/20250923-t210-actmon-v4-0-442d1eb=
6377c@gmail.com
>=20
> Changes in v4:
> - Various cleanups in patch 5 as requested by review
> - Fix a couple typos in patch 4
> - Link to v3: https://lore.kernel.org/r/20250906-t210-actmon-v3-0-1403365=
d571e@gmail.com
>=20
> Changes in v3:
> - In patch 5, don't fail mc probe if opp tables are missing
> - Add more mc bindings to patch 1
> - Add patch to use tegra210-mc bindings in the mc driver
> - Re-order series to align patches within a subsystem to each other
> - Link to v2: https://lore.kernel.org/r/20250903-t210-actmon-v2-0-e0d534d=
4f8ea@gmail.com
>=20
> Changes in v2:
> - Assume 64-bit dram bus width in patch 4
> - Add dt-bindings patch to document the new properties on the
>   tegra210-emc node.
> - Link to v1: https://lore.kernel.org/r/20250828-t210-actmon-v1-0-aeb19ec=
1f244@gmail.com
> ---
>  drivers/soc/tegra/fuse/speedo-tegra210.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra=
/fuse/speedo-tegra210.c
> index a8cc3632977230fbfda0f8c3bfa7b7b25c2378fe..06c2bcbee5734207e3ebacb40=
57da2195f85321c 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
> @@ -97,6 +97,7 @@ static void __init rev_sku_to_speedo_ids(struct tegra_s=
ku_info *sku_info,
>  			break;
> =20
>  		case 0x8F:
> +			sku_info->soc_speedo_id =3D 2;
>  			sku_info->cpu_speedo_id =3D 9;
>  			sku_info->gpu_speedo_id =3D 2;
>  			break;
>=20
> ---
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> change-id: 20251021-t210-actmon-p3-3810039d81e7
> prerequisite-change-id: 20250812-tegra210-speedo-470691e8b8cc:v4
> prerequisite-patch-id: d32dd215b54ac46086377c1ce2c8d53d746690c9
>=20
> Best regards,
>=20

While it can be argued this is upstream defining new speedo IDs non-authori=
tatively, I doubt there will be any new SoC speedo IDs coming otherwise, so=
 seems like a fair approach to me.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



