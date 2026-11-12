Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794485424;
	b=Bt0TTDRs/B2BJMv49QLxHmKvdJ4dtyLFUof5gduZ9je0AW27bMygikIPDuWcfJAs0WV+
	 B/T+8b2kRRFSyCUIn21xGQcf5b44wBFMAeNRVYI/FNxrzqa/p/Cuc3lFrnzqi1kam+1NN
	 DJeXjXwTToOajDiXaHXm6j4GfiOGFywxwRmX1b/PZVufNXEPALQ9XESwLHDHKKKnaKDhY
	 ROuiU5RsrYzqSGAyOiCrjabgTD74n8Q04C0IXuC+BzvUfCQB9WhOabYbwl6YcImd4M5oI
	 2hdds62KQfzEKijpwWa3uogptpFfhJzTMPOCZCTw/vOCa7gCkr35UURHWcbXuhAP+qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485424;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=++P4tUxD0aLveQfTiNKpTgXhYIjbi8UMwAgNDKu8I1E=;
	b=q3YLk/3KZB0nJLnQIbZfcWNqa8gJhpxIHMRVZZdNAfdvCAN2vS8FfEAL3G1R5cJ5eQrG
	 K8eOvFkolAeWRYhOhs9hdEIH7HfntkWFuz5v85TyFND91+X1UjbvfCS2lZHL0HLNOGq4G
	 CP1FaI047bvh49AmMxrA36aohgXIqief2ZLKSFc2m5dVRxj7oyoft0cclURSKaXpUIvNJ
	 xUOb+STFm+duM3QhJQW04tDXH7MRjTmvQ4qspEBF89c7iohjUPXrgHaouMHm7Jo9pCqxr
	 rjQEDrooApF1zN1VMVkuhOqrb/pfrrW8nqbBSzGq0BGMGRJJ8JkRUqheGH9ny3Lko4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="ZsbAz9E/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.11
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0104606A321;
	Thu, 12 Nov 2026 12:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0104606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZsbAz9E/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F53L4Jy7t9vazMS+V7FRnobEKshCmVKCGlcXJeUXU+RorSQqtu8k1NFVDpnW5sfLuMGMzTPVJ2s/Yf1Qku1GtBKBhZnCxBZh/J2iq4/ku/FLZn5p2OKR/BQmDFTEkcQR22o/cbqYfxbpuoAN4yoHFGRunCt2IswBe4DaADPTuqxjy0pNY5TAlABefkc8A7+I1fQE1w63fUjlCXSyClokBJXyyq5s1Uz56klE3P5ACkZ4MiR3y0pie4Kex6/TuBo7xjN9+TGaaHJQRaXojxG9IFvkVsMh7mmU1YPMPBpNsiE+W9i5q/gKuiHiUpsYBZoAKm5289NvzIGeLVKd0tK3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++P4tUxD0aLveQfTiNKpTgXhYIjbi8UMwAgNDKu8I1E=;
 b=vP7L6AqRiVDYCBDoeAdD2e2etA/r+hCFGtLgHmlcHDfsgdcGhsgNTndmA1HZpZUgec403OJ1e3sZ4MMSeufA1tNLpFAINC+X7BDfuC6uhx+ELA+2ISSVcsvb7LECcWsu/v6p9FMz3UrznQtx7i0kJ5vtEz5RwrSlAJOxhOaiRVTQRRsMnUy51h025+wbMDk2das/lWYxQh/6RGkpR3PyMEcbEB3R+NMWURqXJjI666l0makB3denjs2KcOO9Mbgb36iTt0OPfgeKDMv4Cg0LWa42/i5gsMwe8M7t9UjWEUasO2Pu7nT4A/6YDBU9GktVAEXfxFw2KxalW2TQBdudyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++P4tUxD0aLveQfTiNKpTgXhYIjbi8UMwAgNDKu8I1E=;
 b=ZsbAz9E/pceYQ3vlzUS15FeijWVNa1K27HXYIOoPe4KR7+m8h8unhGkJ6WADMyXTK/sxQcobeMhBdJkz0olLYA5o+uKTJpwJNZu1UIY9zLM0CAxPJsmO1lQ+2m9FvsK7ruI1RDmRTwZkPMCbqMtV26elCrND/ECldKJeX33O/jqmRITYmWFOq5PfwHdOW8sOo9GGit4lKjhPfqBuF093oZOuRc/rsp+krusYTDJ4i4qV3N1gHgwQwLKTwdKURVv36LOjdbQ/NysdT/bh57drXhNpW54clKxY1Y5ue5feZOBR0/KTZH3UI6VuQfcx+00RnASWJwmyR5Xs+q5xVw+m6A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.13; Thu, 12 Nov 2026 12:10:19 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 12:10:19 +0000
Message-ID: <8a065e1a-7e80-428d-b3f2-7dafd445184e@nvidia.com>
Date: Thu, 12 Nov 2026 12:10:13 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: tegra: Add Tegra268 ADMAIF support
To: Sheetal <sheetal@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@kernel.org>, Mohan Kumar
 <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104111836.1100527-1-sheetal@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20261104111836.1100527-1-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0179.eurprd05.prod.outlook.com
 (2603:10a6:20b:496::35) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|DM4PR12MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: d15e10e2-2844-4c43-704f-08df40b5eb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|7416014|366016|18002099003|22082099003|6133799003|10067099003|11063799006|56012099006|261022075727099003|261028144727099003|261021121427099003|261009223027099003|261022105027099003|261026140227099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	mK7tFJPGUrN2WrnBpOXcc+Qvr3us0NvID4fvDYdLa2MdNyZA1AS6oivv8HZ1zsXF0patPsBMhuFq7pUKkHJ2bY8xoooiA8nf6cDq7W4jBz7UQ2pRi7dDHW6bne7mvV2v4ui+pOy9Yzt9TkhCDIG/qWnvNW+9lW0uCM9VqjKVLjU67eyh2YPxm7y14xsM89F/9RxpMZdGidtSnQsnEbDLqUS/ao1pudjZHWxdZT79fvI27bvutrSoIztsEuQJErgfI4/4hizk8x0B+4CA5yWNYGPXZyfXo+Bi1rr0gRFcIHvBz7b7mqMjKnhUK16q0DlZgzc6hsDHy8UaZxS6VAfQ0pp6eFHc0bbTqipOQuJdRFIwffM+XUjQlc+8DBQwb2fSrO9CbwhhYW4Tkf0OV8MkLCmddzfHVFKhq27yAa8ni9PvU92C4fmtYiRS9j382v00gaJs/E7NMBYaHPXXpMViutNSG1fIAZX7ZcRt4PnqG30WvevqQ5sQnef7us5CyIV+7lgKb/MRpBWiJK4hDrrIKQOcgaImreXOQ0i2RCQLVDWQ1XrAQPDUykg9a0hunkxqn76Vdj56K+9a5mLi0oc7cJ8vhYBF5j0fN7QtfoX1DENmdDgVcTcZM1cTxeylpKKefVxdWrbWXZcgr1BLU4orZqQgfn7QXma3CutgQm5AmHA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(7416014)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(56012099006)(261022075727099003)(261028144727099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3lxTDIrQ3VmV3pOK1pnZWhuMW1nYUQ1NXRLZjkwZGVZdmx2aUpsNER6dkc4?=
 =?utf-8?B?cGNuV2JqRUJuZUpMTkxCYkNOelhmU1BoRm1UZGw4aU5ZcU5ZTXdadTFRaE1W?=
 =?utf-8?B?Nm42eG5wcDUrMjNJMGJwbjJaaFdlMWtLY2pxc2pDcWQ4YTV3ODJzbDJMcU1F?=
 =?utf-8?B?VzJ3aEFmVXJTaFNSREVpa3E3SzlNQzFGK3F0SFNsTElpUk9pQW84K2dWSG9z?=
 =?utf-8?B?OXloVUs1cklFNnpMdG9ZcnRpNEdPU2w1N1FQUkNsSEJKQm1VU0NvRmx5MXRr?=
 =?utf-8?B?ZWpDQ08vVkJpQjZ4cFFVNnZGRGFIWFNHaTJ1dkVjRnVDOHFiakpic0JsRXRu?=
 =?utf-8?B?VkR4OXZmNG5ZSDhkVDQzWnRHN1krRllEVlRoQUkxOWNUbmo4Nnp0eVNubERi?=
 =?utf-8?B?TEZZbUxoSEJwNVp5b3ovdGJ3b2g0NkxYTCtmVHM1aHRkTTlUWVV0d2FHRk1H?=
 =?utf-8?B?ejlHQWdHSHBTaVBxK2J6eDVzQ0ZPMmh5YnMzMHNnaExBaDZaUTlWb1JsdTB4?=
 =?utf-8?B?MnF0V2lBcWN0R0lhUmkvY2pQWHZiK0JodThSU2U0S0FaYzNuclZJcnRYVDI2?=
 =?utf-8?B?UmoxZkVpTmlqNmNwUjMwdjU2NHZjNEpwY0R6MGErZlF1SEkyclFBRmVCeWg5?=
 =?utf-8?B?aGpXRVQ3aTdiNGNpL0o5SHRPellyeXdLNy9ubEZrdFg0ZTRxdEVMU05BZjF4?=
 =?utf-8?B?a1IvaHFuY2l4Tmx1aE1VYUJHam1VdWk0djk3TnFoYmQrQmd2SGlKdG5rNXVx?=
 =?utf-8?B?cjg0aWlBMkt1eSt2S3dFMUVCTFRuWDhoWUFnSnBOMHB1VGw1Wi80dUxqKzhZ?=
 =?utf-8?B?b1NnL1p3eUZJekN1K1g2T1dhdEovMEgxc0YwaGxlNGFKWjd3T09IU242YTlQ?=
 =?utf-8?B?TDFnZVlCc1B6bUNRL1BBMUFhYlQzSGlxTS9YZTJFT2pXN0pTSGdmdUZIWHpD?=
 =?utf-8?B?R3F2QjRhYjZvUXBtRTNRWUV0M3lOVU5qZGdtSTlZZVo1N3RBRE03MDBpT2dN?=
 =?utf-8?B?ZlpTRVZkaVR1NXJHdlFiN2R2RWFRaVBzZm9nTkZhcHFid3hBOEE3eVdLY2VV?=
 =?utf-8?B?V0xmUFVvcEFpd0orbVZYTmlqTG9iSXIzenlObDk3OEtMS08wTm9VN1g1LytF?=
 =?utf-8?B?dDdMSWtkS2syQkU2RkhvWHQ0aEdVTDQ5MUR0L2VhZTF4V2NTNVU3dTNoUUlu?=
 =?utf-8?B?c2t0Zk5MQWo1bW5GTTJCQTdqK0cwb3hqajVYcUxRT2RuaHRXQW5kay9WVTJa?=
 =?utf-8?B?VTNQeHpEdEh0UFVGWEtXaFBSeG9lT2txclBWMFp3amVIT2ZKN1NJb2F2NEpu?=
 =?utf-8?B?Skp4V3EwV1RQeUZLcnZIMkh5NUpyc0huam56eFFJcno2R0kvZTZ0RXR2TDZZ?=
 =?utf-8?B?N3Vvek54ZjR5aXhsZmlmTnpzRmllZU1ZMzYwUk0zYjJUZUM1VllmVHB2TkFB?=
 =?utf-8?B?YTA0ZUlGYWV0citxUWVhazV3Y0t0eHVieFJrRlk3aGxlMmF5VlpLbk9Nazd1?=
 =?utf-8?B?QkltOXo2RGxVelpxbjRSODJ0cWpEdGllbVJJb2ZyTzYrSEJ2VU5JMnlZbEMw?=
 =?utf-8?B?RTdhcHZwSmxSakhRS3BIS2JBcHh3eFRBb0JhUUR6d2R2WExSQ0IyekhkMzBH?=
 =?utf-8?B?UHJoRFFKTUw4Y1VVRHFld3k1enNBL0FOczM1SFJ5M2E4ZnBiTEhCdkRoSFA4?=
 =?utf-8?B?TzFLckN2bG5IM09jTzk3S2wvWEVZbC9ZVXBJd3V2bHRiZ0NsS2VSQlJIWkt2?=
 =?utf-8?B?MjlaV0RQcEdLZ25kVkxyLzdlL0l6UWhwcWE5eVRqTVhBUDRUc2JzS3VaZXBB?=
 =?utf-8?B?d3VycHpsaXpkMFpsNmJINE53MFBkY01EUTFaUmFqbCtxWTNkcDJFckJaaGts?=
 =?utf-8?B?bmV0ajNhcGw4M3lIS29CZFJ5TmRMQWMxNnNkUDYxSU9jYkMyVEhkTENuamdZ?=
 =?utf-8?B?YSs0djlTSlp3c0l2dGY0c1RMYUNxSTFaZjFmL1l4OFhoYTB5OUhGcHYrQWVM?=
 =?utf-8?B?ZHRnQ0xTWWd2SWZIVSsybzRaL1ZWa083a0ZTVTBrZTVqLzZUQ3N6bG5sbEpk?=
 =?utf-8?B?QWVoYWpLODZwZG55cllTRnhuUFg0V3hZU2dnb2ZteTd6Mm81U2RGVVRJaXJH?=
 =?utf-8?B?WmJmMFlzM1hPU3V5VkVZTzVzWXlRRG95eTRZMllpZGQyRlhRcVFGQ3FmQmFs?=
 =?utf-8?B?N1NSbXpxbFRHUzhtSExaMGdCSUtia0V1dDNtZFQ3cFpzS2JVckJ4b1orbHR6?=
 =?utf-8?B?dlUrWk9CRG5jcWZFOU91UWUyN3o0MkpUdWRYZ2QzS3JXa1YybHpya0VpdUlQ?=
 =?utf-8?B?a1NNS2ZRUDIvYkVZY1cyRlR4Ung3UksrQW1ueWh3YW00cUV3dUpFc05mSkkr?=
 =?utf-8?Q?BTQUPqck/OqX4rXY4Dcp8tCgG3eI/jvs+JjOKDpIX5rGb?=
X-MS-Exchange-AntiSpam-MessageData-1: 2Gmytdh76lxdjw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15e10e2-2844-4c43-704f-08df40b5eb6d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:10:19.4214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/0qzNo1DDFtW6Za7+MkwPYIqcrlldCgdBgSLbOlAVG7OTYMjayUb9wKXk4DSuIFhwSQcdgvI9GOcbJNmbXkyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6542


On 04/11/2026 11:18, Sheetal wrote:
> Tegra268 reuses the Tegra264 ADMAIF register layout but provides only
> five RX and five TX interfaces. Add its binding, SoC data, DAI and
> control tables, and FIFO defaults to match this configuration.
> 
> Anupama Kunkulagunta (2):
>   dt-bindings: sound: Add Tegra268 ADMAIF support
>   ASoC: tegra: ADMAIF: Add Tegra268 support
> 
>  .../sound/nvidia,tegra210-admaif.yaml         | 22 +++++++
>  sound/soc/tegra/tegra210_admaif.c             | 66 +++++++++++++++++++
>  sound/soc/tegra/tegra210_admaif.h             | 20 ++++++
>  3 files changed, 108 insertions(+)
> 


For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

