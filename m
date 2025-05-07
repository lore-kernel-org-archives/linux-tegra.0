Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BA313C816;
	Wed,  7 May 2025 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607675; cv=fail; b=XgV/hMsgxu7ZuX+M38knC4Wkn4grJTaUH1rnkdVjb2jp9KPcRfnj2BbYxeqWu61gIm9/me9I0SgCNy9/MLrTm+b5tPwYNpd3+Eo22kCHKS5Ism8+8EbOnZuZaBjNzh167uR2TsbYZxpBPGSVD8lEFMJaccJjJ1eqYuR7y3MjelA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607675; c=relaxed/simple;
	bh=cOEnVWMkFJilTadez1y2ft/EiiEOsl7A6bVoqLBEczE=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RiZVzOSrX7cICEzJLsppvjo9B1vANcdVwqrYN1VN3ZUDnQZ9eNDDzWyo04lIdjhOkMNgcCYjlRzDFJZSLvwEm983eUyKjV5ywPIs0hzK8YwR/x6GTdeJQ0XQZPVrWA9M9KYGzqVGTMMcQooF6lvToO91uRYnSaV35y31U/I4ZQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AqKsmfVu; arc=fail smtp.client-ip=40.107.220.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AqKsmfVu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6K2Xf7ZrJ5mgQuZ3c1fVpzR3qn3tH2DAxY+68vJYJ7q5ebC1oW7kNWnNjBmWaCZJKUVMZ6SV/4EPPux1UJ7N5unNi+EJ8tGliIs3ZyJ1tZ23Um9G5jgX3G9azsMOAdYtKXObe5HnX3UiBeJXqfLCDCd2JRKhzEflKFbNNn/6Wm7dJgP9NmdOaRnYI/FuDAvxT0abMxHnTPJFI6qgK3jrl39lvtCAZADj8W1+1BCeKXPRouAnVM8Xszm5z0aXHBYVsHOleth0EuzRG2MDUvPIahoOhXTEuYwri91X+HVODCRtOB9FRNeGjW2uGeAhhjFs0kv9873aXlPrvg9sIPKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qv21X1VZ1fTo6V9aMJLbj0kAG16Mtr9WMapWnnr5gBM=;
 b=PQVdz4UpJi3cSl175F3fz3Iqz1qp9vnmeEzI4CWqoVohiEztQb6/uhSRyvtMrocc3RCHkKaUDZotm26CGl6fL2Sa4jOEOZ9xtvm09cTDLzDpfLFYkdYIsbYB8926lW6zatBL6E2POZiE1MMnNi5knJxOZ5JvLXITlaMutSEPSCwg9ZlCjUgwLF3Mb63MsVVFBPACuI0I7X8L0pYxXJUke384/SgauWo/oKLMmPjdsg2zswnciePw2k+chgmx8ivDZ89X/RWAo701cqE5LEZnW/UyJKjG8L6SWZLtsBTbGOMiwKnH2Pm/w+v6Hw8HbBouTUA0WbWdHQYaLG2xMcAJpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv21X1VZ1fTo6V9aMJLbj0kAG16Mtr9WMapWnnr5gBM=;
 b=AqKsmfVuEaiB42hlFelq7JGqg4vi9ETeDhCHScCmSAdEQlHiVmecfVGiJRax2x4ohw4u9+b18zPfh2J+s5sekt6btK4OLt6ReMA8bCdEAN9eg5HWnmkxRhkkZjp6SWkAAhJTNLNtBoC0+2VQoXJ2PAlX2BjbbzmIQxGHNJo+VgT7m8+S3svXW/v8jFjgrrM/9q+MsiazLLyyakUMmuSGkRh620E8O2lOfrWzVeTryNQt7k0pY+z3rFFaZhH1BJuXHvH9W8wlz1t38iUojj/eV+zsg4voELXP91WEPV7kt/71+ZyQ4wVcbJjvMnXIQoHEd8ps1Gii1rr0HwnoXWEN4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ0PR12MB8167.namprd12.prod.outlook.com (2603:10b6:a03:4e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 08:47:51 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 08:47:51 +0000
Message-ID: <8b152449-06fe-41f6-a56e-e5f451d60382@nvidia.com>
Date: Wed, 7 May 2025 09:47:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] phy: tegra: xusb: remove a stray unlock
From: Jon Hunter <jonathanh@nvidia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Wayne Chang
 <waynec@nvidia.com>, Vinod Koul <vkoul@kernel.org>
Cc: JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aAjmR6To4EnvRl4G@stanley.mountain>
 <a153d595-cc77-4996-a9d5-9ac0497b9e82@nvidia.com>
Content-Language: en-US
In-Reply-To: <a153d595-cc77-4996-a9d5-9ac0497b9e82@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0408.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ0PR12MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cd5f82-e270-497a-8c7e-08dd8d43d99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3BiU2FNWmhqdms1eEwycUZkWjNFTnM3akRZNkk0dVVCWFRXUDh5WXpCV2Ja?=
 =?utf-8?B?YUNBcDUvdkxpdm84ajZGNTNhUm44MDVZWHllcklmVVJPMlpROVBTcmMyU1JB?=
 =?utf-8?B?SHczQ3BWeWd3MDM0Tm9VWklrM3Q2YjdiQktPaG93cEU1WnJsWTVwOVhRK0FD?=
 =?utf-8?B?RkZyWlFWSG4weTRaL3NvNVRGSEdrRXZMWmpia0szcWZmOWp6QUxidnVzbWZM?=
 =?utf-8?B?UE9qZHdCUE8yOEJENEFkbkwvSHBLWFhIanBvcUo2bSsxekdvVU0wcUpwayta?=
 =?utf-8?B?ZjhkcXRMTHY2RnpOR2FESGJxY2VaZE4xYjFhc0VBRWRYTldqRktJc01OZ3dH?=
 =?utf-8?B?b1VyV3N2aWltU2RJYnlLaXhHdlczVlI0VmNtcHhzblJuRTdYT0pjeVd1dkFB?=
 =?utf-8?B?azBCKzFDL0Qyd05oc2FDeVh1VlZpWVo2Y1ViSjU2em9XcHhIN2hheHRXSytB?=
 =?utf-8?B?a0ptaUxmaktJdHQ2S0gxdFpKcTN2NjFoYVhHK01wZll1U1JYc2E0Mm9jTkpQ?=
 =?utf-8?B?a01wakNPcDV1VFloTi9kTy9zRno0K1VzYmlTeFVsREQ4OG1aenE4bSsySjg2?=
 =?utf-8?B?VjdOVzF6VTNiMzJ5OWFaV0RsQi9WdWI0Q2x5WmI1NnA4Tjc0SDBTVndOL0pF?=
 =?utf-8?B?WjBPNENESCtJblp1WS8vc2lCVEJQNVIwOEI1bklOdjRyc1JBNEFtZFVvd2da?=
 =?utf-8?B?RkIxdE04UWx4NzArRkkyeVJWZmhISnMvVno5QlB6WU10TXdzazFpbXU4a1NJ?=
 =?utf-8?B?bVdndDQzOWoyVXJzMG5wOElhQ2NVbzlvTDBFWjBNamhKbm9ZU1p1QXBJb2ZK?=
 =?utf-8?B?d2tBN2ZiNmRBSUtWWElrb1dkV0pLVVZxQ0xnRXFkWWp2aDNSZHYrZCtnWkpZ?=
 =?utf-8?B?VUlvcjZMRllXclBZTXlJWDZHM0JuM1g5QmJoS2FWRDV3SHhXWmlUSjBPc1BQ?=
 =?utf-8?B?ckUrSnlJWUxvVlJmUVNYNnZZV01uK3RSQXdOME5PTHI1c3hXV1NuNmFXSkhr?=
 =?utf-8?B?S2V5STdVTjZLWXZqYWxrNnIydzkrNEFMOWlvU3FzeUk5UWZZY3NmVHdoSmgy?=
 =?utf-8?B?SjM2OXRLb2lDaW1maEhpZXNrbGZ1MHRlNStYZDR2aEFJQ3hDU0FoYkJqV3hP?=
 =?utf-8?B?azl1SnhPRXFsbEhQbUU3MnpkbEF3c2JVS3Bxck1KQVRRZnlFVTc0WCtHbG5T?=
 =?utf-8?B?c0NrcGtsTjk5Yzd6bld6eG5mamZHanFjdGM2NTVUZ21xVmZhZDczdDgzYXE4?=
 =?utf-8?B?WXJDUGlMZnFyOExtbldhdy8vck1EWVFTdWI5MkhibW1SZjRIMjJhZHhlUHV3?=
 =?utf-8?B?dndpMVJwenRwQTFNTWhrVHQ1QXRWcWFwcTF5RFA1T2tUUUxPL2ZxRnNOWU1V?=
 =?utf-8?B?bU1MWjNaVzllWVp1MjY1OXFEQnpaeUk4SVFUWUJqVEtGVlpQMEY2ZnVlbGQy?=
 =?utf-8?B?NkpHb3lObW9TYk5TcXJQWU0vajhhVzhxb1BzblRIRkQ2ZGg5ZXcxVUg3OXpj?=
 =?utf-8?B?c1VrSVgzK2w4VVJEQTBGRElRbzJkbnc5SE52dFBvRllIWVF5OWlFcCtCdk52?=
 =?utf-8?B?WHR1WnhBaDVUSGdRblcvSit2U0RGZ1haUlBpUWRhWmpCNkwxREhOaTF6dWtN?=
 =?utf-8?B?RHRCT1p4UTZ3S2ZmNHZyT0h5THh4K2poTGt6UkxzNGRCWUsyS1dOUlNuMWlP?=
 =?utf-8?B?V0FORzhLWWQzMEhDUkh2WDVpUFQ4cG4wV1FyL0F3Tjgvcys1N1Q2N1J1OWE3?=
 =?utf-8?B?dit3M3VnS0lhb2dRUFkxc1Nobm1sRm1NWkVRTGtiaWhxL2pjT01lMWkrMXdK?=
 =?utf-8?B?SkdUazZwNE1kZFF0azBKWk9ydThHUExDakRjQzV4azQvbG1qNUZiT1R5R1hu?=
 =?utf-8?B?VThMQzZ0bDhKRE9BSDhmM1gxZjFrd1dSTTdhVW9RV1R5aXpML0llUGRTdk5m?=
 =?utf-8?Q?387FUEDc3+c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2V0VTg2VU1QNVhEbGwrbDA0SGpuZmd0QlFKQlE2VW5EMmhOUXpSOFBpK1Vh?=
 =?utf-8?B?QlUwbjBydW5QZHFleWJKaWNaMFdxbDJSZ2JkMmlhUmVPSEtXTWZCN0FIYVZx?=
 =?utf-8?B?eFJrTE1tdWJpbmhxVXRVa09xRTk3QUlkQW9jMmhtWlVkMVBiQVVFMk9OZGoy?=
 =?utf-8?B?aXltTVNrZG40K3VuTmhnVzRScVFIUDgyd3ROMEpHZ2lva3dsK1lwem01KzJM?=
 =?utf-8?B?UnFySVNNKzJZUlRsQlkrcEcwc0QxQVZjKzJkRDZ2RmVsMm0xV3hmcytxTXBm?=
 =?utf-8?B?dWlDNzE4Sk5uS2t6a3BlN0dUTFhPY1RZUFRqYzBYQlR0S3VYejBNaUNxVkpy?=
 =?utf-8?B?TGtYeHFSYW1yNjltdFIyaVZGcC9neWZHMDZuSllCYngwNnJOaDlBYVVuYTln?=
 =?utf-8?B?NVB5a2FPdG93UlJ4bER4em1SVTRuaVEzWlBkNHVWU04rZzdOU013K3J5c1I1?=
 =?utf-8?B?aHdYZk5yY1ZnSk5QWnc3Z2VyazJjYTBUTHdOUUg5VitnTGVlQkJ4dWkwR0Ew?=
 =?utf-8?B?UVdud21xRkRSSyt0VHlZeUZiMjRoczR3NmJrY3hyQ3BYajRMWGJEUTlOcDIv?=
 =?utf-8?B?dXhRTm9mdlc0b3ZmQlNVejdwTklMbWMySm80Mzg3Y0ZlV3M3d2UzQzVtRldS?=
 =?utf-8?B?OTFWNVdORzlOYm44dUdpSktKSWo2ckRNNXdQOVZ1cXpoMWFpUGFZK0pjQWRy?=
 =?utf-8?B?TWJlRXNpMUhpcjJIQ1BiWUpGRVRsUGNRYTBsWEZ5eHR1UGV3cFJpSG5TVC8w?=
 =?utf-8?B?bDBhNWg5SFBWRHJTMkZ5V08xNnhMamkvb1NPMml2b0FSSlJQNUF5NDE0RzZw?=
 =?utf-8?B?R25XaWxuSTBnUVlJK0hkQm1UU1lOcVJXZG1PQTZVUzZ0LzZlWDRoSUxreElM?=
 =?utf-8?B?NTd4dHpMWUpVKzBVMlRWSUVHNkxMajRFQUN2V2UrQmY2ZytuWDI2b0JGM3dp?=
 =?utf-8?B?RUp4R0x2R1F0L3ovbVNibUV4cmdjV0JBOElzRzUrangzbXBrYjl0MHdyOU4z?=
 =?utf-8?B?dVpEcDNxTzVVdWxNRjAyQnVuaUN4OFJGN1RjcDRSeGxLcjJvRTNTcXBNWExU?=
 =?utf-8?B?UURmb0pXTkVIQmRVOXV3M05zR0ZHZDZIMGl3SUpSeG45WU44TmEyNjBuaExi?=
 =?utf-8?B?V0dOTTRkaUVZd05yL0d6bmFkeVc1eWIwVFlTVUJNbHZZaEU4OTZzb2FXSlhJ?=
 =?utf-8?B?aXUwcDZDV0dScHZleENEbE5pN1NCdGczZldrQUM2Z2Q2b0U3YWNwOGNXQmFw?=
 =?utf-8?B?YVdFVHZhVHZmcEszNXBTRTVhM0V1eHM2Z1dPdGFjRzZ4SWJ6T2VyQXN3TmFl?=
 =?utf-8?B?Y3R4eWpKcTlaYkZkTURTdWJDT3pUeXFkK2dBNVFFNVRaVGRlMVBxbG8rc2li?=
 =?utf-8?B?d09xMnhSMXRvNkxuZVpjUkk1djQ5WlFEaEJvQ05zY1Fzc2VHcFd2bi9nME45?=
 =?utf-8?B?SU8yZC9ERnJ4NGpzSUpUQlJvNDFzY2FQeWZITEtsbTc2V25BNDhsaDg2RFFZ?=
 =?utf-8?B?OFVleExPSzlpUnJmMWtvQjFqaGJGY2I5dVlWUExHbmtjVCtQeHRuWW5EdlBP?=
 =?utf-8?B?VlNkQ3ZYTTBmQWxFQ0h0TGdCcXltRktYcklkdmVOR1M2VDBFZms4WUl4MCtr?=
 =?utf-8?B?Nm9DMjBHNFQxdnNvN21HbFJpS2hOUFRoQ2swYjJLR1FyL1psU3BKRWZhMzUz?=
 =?utf-8?B?MGpkR1lkM1BYRnlOcmNDQlNIcEFndFBOWnljemdySWhiSHhRVWpzZHJzaVl3?=
 =?utf-8?B?U0NWUEpvV09meHZJaEM3S29XVWtUeU1XV3h6cGtUTDVyUGJtMlRDcmc2bVBT?=
 =?utf-8?B?RDhDdDJaemVUaUFsRzBSRk1FalFUKzBYckhtVXpvaU9ldk9UVEdhSzljYWRY?=
 =?utf-8?B?WFcwcVljZkN3WDUrUDc3NnZDMitLQldGUU9mMWhxdHljc2lZZFArSUxJZGI2?=
 =?utf-8?B?RUk1QWdGU05VTk1RdnhWdVdUOFRmYUVLMDFVYWdTUlB1MWxSeTNKVEprcitZ?=
 =?utf-8?B?ZG4yTFhEdlJSZzBZa2xiZ09hdnd3SVVJOWdZN3l6UmRETkRlSnF4QVFjdFdX?=
 =?utf-8?B?OHVQUHptcGhvU0xuZEpVcm95S09OUXAxWDMzS3p3QmlzcnFSRFZZUW83Wkxw?=
 =?utf-8?B?QU8yaFdWRzRlRndWMStIRWxSaG42YytXTjEwcE9JOG1VeUR2SW5vajRQWnQ5?=
 =?utf-8?Q?GvDwAKLV/CHLnaixfB1jWraewFNbbDXEarczAaL/p+Py?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cd5f82-e270-497a-8c7e-08dd8d43d99f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 08:47:51.2897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9XGOIg17z7F2mgxyT7J2KYbmrrRbIEcF/3kFXuc+WlI5zP6yIQzmn8oN2pq6hMk6+5UzHgDH7axu4Gpjm0/uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8167

Hi Vinod,

On 24/04/2025 08:30, Jon Hunter wrote:
> 
> On 23/04/2025 14:08, Dan Carpenter wrote:
>> We used to take a lock in tegra186_utmi_bias_pad_power_on() but now we
>> have moved the lock into the caller.  Unfortunately, when we moved the
>> lock this unlock was left behind and it results in a double unlock.
>> Delete it now.
>>
>> Fixes: b47158fb4295 ("phy: tegra: xusb: Use a bitmask for UTMI pad 
>> power state tracking")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>>   drivers/phy/tegra/xusb-tegra186.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/ 
>> xusb-tegra186.c
>> index cc7b8a6a999f..23a23f2d64e5 100644
>> --- a/drivers/phy/tegra/xusb-tegra186.c
>> +++ b/drivers/phy/tegra/xusb-tegra186.c
>> @@ -656,8 +656,6 @@ static void tegra186_utmi_bias_pad_power_on(struct 
>> tegra_xusb_padctl *padctl)
>>       } else {
>>           clk_disable_unprepare(priv->usb2_trk_clk);
>>       }
>> -
>> -    mutex_unlock(&padctl->lock);
>>   }
>>   static void tegra186_utmi_bias_pad_power_off(struct 
>> tegra_xusb_padctl *padctl)
> 
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Thanks for catching and fixing this!


Can you pick this up please?

Thanks
Jon

-- 
nvpublic

