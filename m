Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B03BE64B;
	Thu, 10 Sep 2026 08:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028796; cv=fail; b=j9RgoHn/+OpbdQNgP/YTZFCbdQ05OIRV965x7cEZ/LDlo3Nx5nluwbc1YGl1hwUHHuD7CIlY7Gm2mi8NRvrqzLGFC9sICOThIWOXFtj/J4cmV/ChrKY3unXJhUrJvd876wNroiOflud6LGHXORVprr8CScRLpcSfnv5aV6nKDNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028796; c=relaxed/simple;
	bh=JL6/1AbHGVTqx2ajeh8INrFLuThrXEacNHI3efBUHpQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VImrzBRn1/lis/b3IAspCGce72q7ABHIO3aj8DOEeTdNI4qQCT4jt6YjQipR3AUX/ldeiIk1rTEglrrNExc7SoUkHl5AGrSRvF6pSb7CAnrwG98pEZCd6ICe+x/qQ4HBrM8V3xV0cWxOYNFp+TLcLRqT8GqPhCoi++hZ3CqCUtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Lx1JDEwK; arc=fail smtp.client-ip=40.93.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lx1JDEwK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFxAURwF1Y+FzNebPB4sTd3OtCiazy6TC7+ZAM+ZMSwksgQ/TfXN+iDtYLfRtQ6hvdZ6Obr/CyPv4fR/DXiAGU1CZfARY8wBqa6O5tU3SfyQiCENzEDb+IYuAjoCFpjlYv9sPPqHnH2T9TdyYkJME5s8HTAgo4Y5qUBgQKx5kUzpKQfKW5S+79zKxhvrUQ7S8HTKEa/zOqTnVIjm2lp7FB/TzvH9ILsxUj7GTo5sOqeJvbcuuD+BmXKq3ScGcan67yPDLqtoeUHqsUKjH7Z+fV7REARRfRWG6nNpx44J/msl3e2xEXHiUOzeVke8Y/1wtfcRfUaQogJJkTgaRU86zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTF704Dc04445OCHjkUfl/EC+16BbCdrtWj3xhOkUj0=;
 b=Fr2f5SS+uIgipcAJDi9yeiuGMIJYN+LPli5lQ0LE2qoBn+bBFwAMUAV5wyryUBRKo5+j4kjhuptOrGavrWwltDC0kPlHVBwt6bQ/G2fcLG9/TwUw+J4Rtl+f+j+uMNo68D95JhP+MYACuXx9+J1MMpx1sqefRft6szDipw1lRqQ/0SziFgaY/hLFqfNPC5wfQyW8Y1qpNKXucQESZPDExOnu16F1ByGx/dE3GHJ3WgX+BYTOg4c9Iq35p2WMmuJYGAYB+CThbXOnL+Vt6P+pM4PA479LcYogPp8GH2dEflQsbORpUi86T93vlVwsi4wFRa5BxIVZzskcXzb7aca1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTF704Dc04445OCHjkUfl/EC+16BbCdrtWj3xhOkUj0=;
 b=Lx1JDEwKOaH/IWCug6nBM9fkvu9nw2FIdGh+M5CwBGYYRwGVGOCw/T14r9m2TCRLuv7BufTqQV/2fJQ2cHQn1LiZ5SyoV2pt2YO4vdMi+dkUz2peveMnyd/3H8XPWgWR7vesuGTBcTEyWqax0F3EoU0rottxclBOIOZVNHEAAaZOhTNGP9Ep5LIvkdp4y8HlbUFwtqSDWsHwXQlZ87E8TruuG9fOB6IYXKXfv5uX7Zm7kBidkOlOUhb3RahPCPU3To8sHVR/pD7KxrLLES+epor0AerxEyg1W+CbdrCLOyPzBwI0IAtp7LOOlGMaO5/QPfTA9+E/fm7hi+/d2vK4AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by MW4PR12MB7484.namprd12.prod.outlook.com (2603:10b6:303:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:26:28 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:26:28 +0000
Message-ID: <29347083-d892-4539-99d7-020eeeb61151@nvidia.com>
Date: Thu, 10 Sep 2026 01:26:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] cache: add SMCCC-backed cache invalidate provider
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Conor Dooley <conor@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dan Williams <djbw@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260608220709.1300245-1-smadhavan@nvidia.com>
 <20260608220709.1300245-3-smadhavan@nvidia.com>
 <591e7ac9-310e-40f4-ab22-161d6ea8f487@arm.com>
Content-Language: en-US
From: Srirangan Madhavan <smadhavan@nvidia.com>
In-Reply-To: <591e7ac9-310e-40f4-ab22-161d6ea8f487@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:332::16) To DS7PR12MB9474.namprd12.prod.outlook.com
 (2603:10b6:8:252::17)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9474:EE_|MW4PR12MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 519d711c-7da7-4afd-3e03-08df0f153624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hqvMDCZ4kMgV97F4bSzgIlvMhb1pJ4Sq9ptNkG670Bn1Ho6adsVt4npt5FdaZ8rWRgEue1oHJeuz4HTJAhuT+enlaKQquBBDEsz/siVxWBF9bS1EBPDXdL4XAfVHVdgWFet9J2/tc9vfAvnpikwQS5UR9pt1W42deXpx6j4LG/O17nD0dx4FlfKlU6dV9SV8w443vrOeqDxody7lRCdhNQEvWKaqWXBaMB4lVut4rSLykeRYOW5prWiM2b3SPz9bc3OUhJto/1bfQ9fYisvIglA7h6v6oGohLd5ONTSbQBztMtigXDGWfn7IRDlEfTdpZTil9GNp8ku9OlM/dkSj143Svr5Ui7ZHlkkytSHriH2c2eTO0ooEteCFLeYjkrNpWfkWEQ3iop1IJbaVmG4+U/sGR7qm06yzCYHUtp/0ok1XeqRJcT0M23stUh5LB19TRLU6Q+ai/3IjXp1/zIqqZ84rLmZk2uuYiY33JxQKiaZCyQXb6VryEuTr2d8qijrjo1ovSzdePYSBo7R8BwXbu/wNp82GdTSlixKKwWyhxutrt7P5TDmu0El5OEvrODgXwYEFgmBAFU/2vzIpYwGNA6TDql9VqD2e2lvZZbXsrZ9cusufFjNYQvkrVuUHakzDihJzFAmswkn25z0k+3KPMR36ugFyzi0hfOagjYIJ554=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDY2bzN4TTEzTDVOcmFFZm5HMG1qRGdsRnRja3plcFRqU0ZFdVpSOFFQQ0NX?=
 =?utf-8?B?R01yVWM1L0VVZFM4MUQ0UGVLSjFHUnJ6RUNheUYwSXIxSC9TQzZmcXhzWXY4?=
 =?utf-8?B?c1dFZkVjNG1LQzVFRDBaZEowaFpLVHgySXpSdWpmbkI3RTllRG01RnVSYXNy?=
 =?utf-8?B?OUpLVzRJMFVWWXBBRWNvOWNmWkIrWGJVT1JWTFZBQkV5QkhpQ0QvQ293S3Nu?=
 =?utf-8?B?N0txVlNJa3RXcnZWQ3lIamVnSytUazBhTWlVR2pPNExLWjYrZ3k4bDFEZW5P?=
 =?utf-8?B?b2s0K2lLMTJtbG5rc1ZTRTFrSXhNRFlsRmNJZTAyWFc0RCtNWFBhSkZibFFX?=
 =?utf-8?B?cktyWUNXZkZZRW0xRzJKcWI1TVUwVVZsdEg1ZzhQZ2dmVHVQUCtUdlhLOGQz?=
 =?utf-8?B?UkxWZS9mYVJzTEZUYVBGZm1FcXBnY1ovbmdqdGNBaWZRQzZyYnJtYStKaSto?=
 =?utf-8?B?Z3FmVmRCRXlybEdtdWJjYnVndVljNXBkSkhWcm1KWTFMOXRKc2ZMTHNraWdS?=
 =?utf-8?B?UE95c3UyekI3ZGhFVlg3cC9mU3diMi9CTHFRbjlQQlVVUGJGaC9maVd5c0Q4?=
 =?utf-8?B?UyswZHBVR0lRc0dtMWNjcnQzTGIwVnFiMkN2bi9CVjdhNmdSeURZMG9sbTYw?=
 =?utf-8?B?TEpJa0pXd29TK0lidTBScng1THdTZWFPSzVQT0tSZnFBK2JvaXpheUJMUU5z?=
 =?utf-8?B?QmxCTmhLYjMrdWVyMXJiWFkxSDlUQU9kbzdFTDlLRzZLYlM5RENvZjRLMkNH?=
 =?utf-8?B?QmNOWkxJekxrWFBNMGE0V3AvWUNmUFVSRGJpVGVkSE8zU2VRK09pKzNZeWp5?=
 =?utf-8?B?QkRtYjlOMm9sS1NuUE53c2ttM01pQVBFaEdYZzFTWUk1dTNZQ1FqTHJQOTI3?=
 =?utf-8?B?VXlkRlJsd3kxVGdEVUJpNUs3T2JIOXJTRERZQjhvMDhMVitXbDZqTUNtdWcx?=
 =?utf-8?B?Q2lIQjgvZ2FwYzdMTVBwZmdzZ1JkMGI5VUo3ZThUMEtRVCtmMkdZekhacFhi?=
 =?utf-8?B?VXovMTRxVXpHVUZlU3ZyQ1JWMW54RGlxcEs3OWt6b1Z4Nnl6dXJTOURWSU1v?=
 =?utf-8?B?N3Jobk1oVHdwVktvY3VXNENUL0NKMnNra1JJU3FVZ0w4WGN6R25kaWRiWmZT?=
 =?utf-8?B?cktwdHRqVGZodTY4anVPM3d4U2taWVFXTU1WU3NEL3FYSXBNblpTU1BJR2lY?=
 =?utf-8?B?czJPbHdYWjY0bkUrMVNTUCt3SitKODVRVzVlcjl2QzJYMmczdzZ3YjZiMlhw?=
 =?utf-8?B?NFUwS2RnVVdWc1cwcTA3SjYwQjFodmhLTVBOR2xJK2ZOTWdqbmJNZ3pUTVZs?=
 =?utf-8?B?Z2pIeFl4TW9LemRuMEhGWWw2TzJWQWd2cjRKT1ZlRGRmbUhvcVd5aGNsd3cr?=
 =?utf-8?B?NW5PdjRlOWhKMEpyNS9uTHlieVg1cHJ2TDk5TEZPbldXclFvZkhRT2JRWi9U?=
 =?utf-8?B?MzZMTnY0SmJhOXpQQ205ckFsZVJsV2hlUjJJT2FhL1NMcmZLR0hONGJKcVdy?=
 =?utf-8?B?ZXJ2NGc1bVp2R2V3d3RBVnc0WS9ielJYUTZDWDhocHAxbE5FdWpYazF4OTJQ?=
 =?utf-8?B?WllPZHh5UTFvUzFsZTQxOVhvZ3NNMXRBOE15dVFySEUvTW5PWWdyS01LSjNZ?=
 =?utf-8?B?eU5RbmFOcndsZ3JCMzE0dWhRSDJ4OWx6cVkrc2tNWmlGRDY4R0h5RmZuV25r?=
 =?utf-8?B?MGQwY1JnYnFVOWtDd3FQMmk4b2poMWdvblAxOElPU1hkdUtqWXZ4UFA4UDVq?=
 =?utf-8?B?T3U2MzZESm5pekFtYTBadGRTaC9KdXZDNndtRjJzS1M2RDNIc25BNjVpUGNy?=
 =?utf-8?B?aVJiVEZVTGxHbm1oZDFwUUEvVldmYW1sZGdjNFBQREVIejI3ZkRIaUZ2UDRD?=
 =?utf-8?B?M2lGRE03ZnNrbnVlaDhiUXpiR0pldHk5eWtsV1RWNHpqc0o1K25IcmNQQ2g2?=
 =?utf-8?B?QWNCb2F5NXIzYVloNWpkbExXV1JMVTBqL054Y1FQTnVUa20zYTBJcytVaUov?=
 =?utf-8?B?MUI1ZTh4STR5dEc4SG9OT1loTHJSK1gvNjBwaXM4RGF0UGJJUXVFYW1qZnIv?=
 =?utf-8?B?UXNRM3VGTElzS25XU3o4ZGo1eVVOSVNEbm1kUXhCdkJxRmFnMnhzd3lUQlJj?=
 =?utf-8?B?RUhjTTJxRnU2cUlsNjMxV0VtblNlSnl5MmxNZ2I4U1hudGRPODE2bUZUMVk5?=
 =?utf-8?B?ZkFCZHExNWJ6cnVNbWMzTG5nSXNtZnhqWnB4Y1c0Wi96MmRhV3YzNTc5V0lq?=
 =?utf-8?B?R1VKZkdQM29JUlR2dnZGMGdVU09ud1c2djNUSS9uYUNsZUFSelR4Y2NXbWlC?=
 =?utf-8?B?L3F2YlBKT2U0V0tkY0VhNlhUaFE1WFI5TkY1aTNIaUQrQW5wRThCUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519d711c-7da7-4afd-3e03-08df0f153624
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:26:28.8355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whZtr4NQFUGQy2keMOmjPGVRcNrsLBTuNqCGE+F10ychr3d0rjEkSV/Ybo9fmDRRiSMogoysnWzO2E1mTRQshw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7484

On 7/2/26 6:04 AM, Bence Csókás wrote:
> 
> I'm reading the 1.7 H BET0 [1] version of the spec (released
> 2026-04-20), and I see some discrepancies. Not sure if I'm the one
> reading it wrong, or if you had a different version than me.
> 
> [1] https://developer.arm.com/documentation/den0028/h/?lang=en
> 
> Either way, thanks for posting this patch, I'm also looking forward to
> seeing it get merged!

Hi Bence, 
  

  
  
  

Thanks for the review, and apologies for the delayed response.

I have addressed the declaration ordering, preserved the final BUSY or 
RATE_LIMITED error after retry exhaustion, removed the redundant feature 
query for the mandatory ATTRIBUTES call, retained the full 64-bit X3 
rate-limit value, and removed the routine registration message.

The macro values are already aligned to the same column using tabs, so I
left those unchanged. I also kept the status-to-errno conversion local 
for now because the mapping reflects this provider's handling policy and 
there is currently no other caller that would justify a common SMCCC 
API. Please let me know if this works, else I'll move it.

I've sent out these changes in v3.



-- 
Regards,
Srirangan
