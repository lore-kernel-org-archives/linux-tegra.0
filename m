Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013018.outbound.protection.outlook.com [40.93.196.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E0137C90A;
	Mon, 30 Mar 2026 19:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774899130; cv=fail; b=u/gETaC4WvW6lp/vwu31zYPRhn2e3zU48CKtB9jvJKNZIs/a+67Zaod78IN3fwc9Lb/ASbB6zHCsjf5njnP622phytAmS1vvWc3GFVZT/isPnBdGJ2GNOr31E5TmcgIxmDqC1x31GmoIxN3QPSDw5EaWN2URuBy59EdW9PcFUFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774899130; c=relaxed/simple;
	bh=g5xLoF+RcNLUzkWY6ln8z+FEOvJysRzkGX9tBu0zkFI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rADUF3YrCQXsyYhIszPXGUE+oQT+5hEQHuwNizfavynYgEOBl7Um8w8KuKYK0SVqcG9vS0addlIXZ0nM8RoRWeH88xX6tfzYGg7BNZg8lO9eKUfNhVst0GL0WUFfXwWx4MpjRWonHtfpYYhKDa8S3xAjgsfZcC9azOpUJmZ0hOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pEViNTB2; arc=fail smtp.client-ip=40.93.196.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pEViNTB2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUaa8Hk4Zpb8M0G1Br4JvYbzn0Rtrow6fIvz6biNa1DgSdzikf1xGJVx6cpNGq1NgyibqR3PR5+L/yDY1N+C0nFa8MCPgU9Ln1v1hWbLioMxx5xT/YqBo2v2YmMkZ9FS0Z6KB8feqIOwY859syzmw+9xEXEU6jZgOh1LJ5NDOVs79oz64L5/D5ru7S8e9UXCwX1h/1iYV5QrNGPrPEGPI7eHZJQ9UrgDCZMiSkMkKBU0k3PYDYbraqFkwr59f2EGpwWukboHXBtG3dqJP6OdtF8mzAykdwiZuYTux1rAs9qDaQeFss1arL8qmj2CQS5xkX3lOaQDhi3VoMjW1anL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezw31EYRjmQJCQ+bc+jMpwuIexP5rT5zlQz2uxSqY9k=;
 b=l2+5mlnCXUD1h6vgvSwvfWW7r3jfoP4oLSRGEdtlTFjNWAWzDwwju+iYDtovv24/1CqOg75X9r2iWGM1EVEwPWHL2JdLPEWBk0aYGLWv/Kd7hmvq4RY49r2/2gxevEAmZm8Ip7hk8M5qliWfvXULc0ybAwafDdNPcM3mTS5oTju66TLiXaejWrt3zQfq0HUtop5c9+avQuy6HwgqB/9csrhH7mE23F18YYFD0Xc4thTiS9xDLooDn6dz2ryXV2Cb1vCmooCHuVs/9Q35DClDXD4VL4EcNJMNSaH9a9QbH2HidB5Muevq6+eFrwFAvJwETCa36t4BE4RJn/geowTZTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezw31EYRjmQJCQ+bc+jMpwuIexP5rT5zlQz2uxSqY9k=;
 b=pEViNTB2LEEmFCBAMCxxsTWxaEhBOMf7j8dY33l3hkivyy8b4pk1z78VTAi0xedgbeIJldJewE0vHTxo1zitlL262p7rReJ6xEGYn7v/EWcxED4HvBs3oAL0DHXeGJrS6HKqqJqujxBL7L0TB7MFcZNoBoKpfAju3y0jktMZgcR461IHcULJEi6CnsphNyMoSFNf3RUH7fCdzJAG7VlsiLp+mdQJ0HBw65XpvgpYIRE7/nl7VCZsYLwNy6w6o0awCf3Al9PFhIeMQJ4JAxEAlay9Rhex6kBr+cB3+gR9y+p3KQmN8r64ZITq4NVAd8ilgpg8tPZTmw2IlIW1dBezng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by MN0PR12MB5833.namprd12.prod.outlook.com (2603:10b6:208:378::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 19:32:03 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 19:32:03 +0000
Message-ID: <42ef5cb5-1db4-4faf-93f5-beefc0d321de@nvidia.com>
Date: Mon, 30 Mar 2026 12:32:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hte: tegra194: Add Tegra264 GTE support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Suneel Garapati <suneelg@nvidia.com>, jonathanh@nvidia.com,
 thierry.reding@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 amhetre@nvidia.com, sheetal@nvidia.com, kkarthik@nvidia.com,
 timestamp@list.linux.dev, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
References: <20260330170657.185854-1-suneelg@nvidia.com>
 <20260330170657.185854-3-suneelg@nvidia.com>
 <6bbff5d0-c75d-42ef-8877-de60e7113db4@nvidia.com>
 <3f88abb3-fcc4-4d73-b003-84fc0bd28306@kernel.org>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <3f88abb3-fcc4-4d73-b003-84fc0bd28306@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|MN0PR12MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: 40120a2e-1e0d-4cbc-5b06-08de8e93052c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2Tv2kpWsh+z/MJ2ARGVc6OmJngD0HGwFHf04vh+iHK13zx/KBZbLe91ZdG4TwegqGj4tIAtK9agTLQp9Xt3E4eaCAwgkMFDFLZdDaG91ZpIhNc+vMRf0ZxVfy20vYipacOaPqSwA6EJ1cS1aeqvFragJ5+/x3fQZe5Ngywf1SAkhpSJ0P0oL7mnbiKgvwjgd0apvaUJZPzwYumWJHhS0R7JLnFE6JXf8gqMh+3ItvdaL9yvX3ovhPLk+4wOKR7QOBB+OmdJlNmmiQ7fb5Na7bhHXWr/eKzXA7oYDW7R0U5iEUugc5tqN0VxkD5jl3SBqcmd81M/4QNwgkbRPcEP++ibe1jg9KMcKQ6mF+5kdx2hsqZtUlMjkqw8lA9kn8CnKfHNJuL9XzJQKBaCj04XplpR+bSYS2R2J1tktbLru3FSE2ct2hxNEQ6uEp6W28RFWGXGuKY2zPUdj1kB4Ld3R1LsjalP6/q3wUgMTmTMHCMpeXw8moJDQ4plBlxXmn9056JqiPf26H9ClFpECKCfA/iurk31YzS7Y0z0g7/G7Kx5Ke7wg51kEPL/89YoMhSpl3qoRoaNdSAgMJx6toz1a9C7EMA0rjCBWE0HLOfDScrbwzMZx4AYnWOq1mge1mMrXF936nB3CzG1J3LC164mk+1iWdAyuk2CVqQ2I3XC6xZjgeisClZra8lu7E6w17zu/JyL8epb3l0CRRr5urJvuiXlgSqrY0DcwoY7Qj/Iwe6rB8q7s6x+TpgLCGysDJRI76Dxq9Og0/BmMD7Xuow6dUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzgyNzZaK0o3ek52bEpTeXVBQVJ6dGVycmxZd0s5RWdhb0pVRGpoanMxbk94?=
 =?utf-8?B?M2NCN1Bvd3RMUnJWdVc4SnduWkR1d1ZQMzF1NTVQTGl0eG1RanFSdUhQWTNv?=
 =?utf-8?B?Tlp0K3pJU2RZcGFvK0NNejZ6ZFVpdkErMmFocC9COG5CQTZzbzFLVDM2RGlp?=
 =?utf-8?B?ZDBWZUVXMU0xdzhUSWhXbXVWa1VUdEo0Rk1LWDcrcWRzOHFJUnp2YTZjRXFY?=
 =?utf-8?B?cFEzcjBPMWRoT0ZOd2VxVjhIQjh4V1FXRHQ5VXRZTFBTR3hTNWFIOWtHcGRU?=
 =?utf-8?B?NmdiamlRTXdRUmtrd0N3cThYOUYzMzhUSjFmN2hpWXRIK0RFSUFYRUlEZFoz?=
 =?utf-8?B?UFhFaHB3Mm1sU04yS21FaU1DRmRpVzlKZ2ljQ3k5OHNJNjA3Y1JtQ0tVTHVN?=
 =?utf-8?B?QUthUlBuWHlQczVOd29hRHpUazZDVkF0aWtQSWVaaktXT1VIYTJVSnVxQWoz?=
 =?utf-8?B?ekcxbEhldVFKbWsza1pSa3IzbzNkeFcvRjB6bWVYbzZhR2MwVEhmbnNWUWwy?=
 =?utf-8?B?SDduekZ5bTlXRmsyTDZnZWhkY2lDSnQrZUhFR2ErTlQvWVhiQ2tsckNuRnIx?=
 =?utf-8?B?cHZBOUdJVWdiSkRiZ1hSc2dMaEFrQ0FoMmhncHZGNVBDaDU3eDJmTE8yQVpp?=
 =?utf-8?B?QTFjVERnMnBLSFNpQnNaUEgrL0g0LzhWUWduL2lzN0dwTXJQQklOaWdvemNm?=
 =?utf-8?B?VktMSXJCQlpEcGY2MjY2STh0ZFdkbkdYbStmOFFZbGlZa0VibGFaMC9EMWw2?=
 =?utf-8?B?N0pPSVB2c1VHVHFVNDhrTDc5Slgxd2JHU3ZmVGxlbXNtd2lUSmJ2dVFYQzRV?=
 =?utf-8?B?K29xVkNrQlVUdkdjbzMyendFemc3VEVOTDhFL0JkRHZpUUlUbGpzM2I5eVpn?=
 =?utf-8?B?cVFsNlpsaFFaQ0FTWDhKR2ZwQzNWQmljV0U2d0FvVTA2VXJ0UUZ3bDMzdFFS?=
 =?utf-8?B?NXV5YTU0QlN4cmVmZHRscThqMzBLZ1AvUVJnajNTY3kwTEIyN2JqdU1TdkZn?=
 =?utf-8?B?RzRoeHRKYW9NYXlRaVhjR0kyOUtmQVhIT29XdElTNEFsdkdzZTJPTWluZGxQ?=
 =?utf-8?B?cTkrQUh6ZldrdFVQNHgxdTJMR1BQcmxHSVg0Zkp6Z3pkRHNtZU5BYlgxVTZh?=
 =?utf-8?B?akV1TlNoeFFOVUFyQmo0eHNTWkhGcWNLOFNHcDlSRFNiRnBuQ1NtWFV4Y3Fm?=
 =?utf-8?B?MjdJL1cyN0hnZjRDVVBRc1Bzc1RnZmJEZTZlcTBuMXNFaWVwcjhaTU5jM2FE?=
 =?utf-8?B?TVRoRWhiL01TaDlFRHVNNVZVbUJKV1hLSG92aHhsRHg2ZmFIVUxvdzUzZmtB?=
 =?utf-8?B?Lzd4TGFUaW95MWJJaWVNRTJpRjg5WlpzMG1MbnFBT1l1RGpsMTY3cFJoaE9X?=
 =?utf-8?B?ZFk3ajgxOXdQckNHcHBoRlpnaUY4NHRTTG9jOGhWbjAyV2pWYXJvZW9jRWJm?=
 =?utf-8?B?d3ladWd3OVBLdTdhclFZSXdHOThMeXI2ZEFSR3RseEdNTlJRSlk0cXd4cTl3?=
 =?utf-8?B?N0RBdlYvMDVJemVLUG5RSWpnTVM4Q1IyZVNFZjJ0VmNTRVpUc05NUk9qQ0Nv?=
 =?utf-8?B?emFXVm9yRkhEVk1GV2VlT0hQVjMwZzdCa3VmeXhjMDRseWE5R1FrZ0ZNdEJm?=
 =?utf-8?B?RTJSNzVSM1p1dHhodXE5U3NpY093NUlGMmN4V2dIYmE1Qm9xN0NHMUNoeFR5?=
 =?utf-8?B?bXhkeW54bzBSNkZhVXNmYWVPUkJwL0NFeVkxbGwvd1RqYU9QVWFWcFQvQjEy?=
 =?utf-8?B?L2NqRVVRSE9uV09QUVRCc0RCVWxHT3p2SUxVaWlxWG0zTTUrNjBDQXVDUHds?=
 =?utf-8?B?TjV0SmQyQWdIcy9aMkU4bFg5aEJ2Z1dxWk5PcDdpN1BDRVozdGRkNG1GY0J2?=
 =?utf-8?B?UkJNUm9CNkRsdUJ4eUtqa0QreXljcVhmcXJ3WUFaQ3FXR1lhWDBteFNhdGhN?=
 =?utf-8?B?YjErQ0MxZHQvWWZrWk5qc1E0VCtHOVY0RCtFY1dxUU5NT1lIOEREUEo4WFFa?=
 =?utf-8?B?UGhLZW1zR3RPekVCdEt3TzAzVklZSTI1bzhsNDg5UUxOWjR0UUhUZWp6MTMv?=
 =?utf-8?B?bnZkUW5KdnhkUHZTNWxwemt4aE1lQzYzZWpQclZsM0lpRlZjcnFpK08zVHh3?=
 =?utf-8?B?STRmMkpZcXlRQUtVb3dBdG5xR3hUWVhweWprZ0RIL2QxeWFtdldXeXZodGRH?=
 =?utf-8?B?WHlJMWpwbDUrYUJyZnRaM3BGc3FwWWprRmdNT3BtUjBuQ04rcXVCZVBTWG9l?=
 =?utf-8?B?MmxkeEd1VFFNamRHSFZiSjhOVC92S3k5a1dxS0FuMk5vcmVQU1VJYU5nSHhv?=
 =?utf-8?B?QXBJYUd3YklXMzBTb2dNZ2xpb1pmeUlNWE9wZDVMcWY2cnl4WXdXQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40120a2e-1e0d-4cbc-5b06-08de8e93052c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 19:32:03.3012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zukA/WOzo6+WkW6HpyZ48L9X5SKueyceMoq6upWRR6o6Z8t5Uos4KOOpL23LyH6gvM5xpIP7dpdeI/SuIRCHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5833

On 3/30/26 11:39 AM, Krzysztof Kozlowski wrote:
> On 30/03/2026 20:35, Dipen Patel wrote:
>>>  MODULE_DEVICE_TABLE(of, tegra_hte_of_match);
> 
> Please kindly trim the replies from unnecessary context. It makes it
> much easier to find new content.
> 
>> Acked-by: Dipen Patel <dipenp@nvidia.com>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> 
> What are you certifying here with SoB?
I was preemptively adding my SoB since I had to integrate this patch into my HTE
subsystem tree. But for now, please ignore my SoB.
> 
> Best regards,
> Krzysztof

