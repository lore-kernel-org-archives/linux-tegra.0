Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510F775809;
	Wed, 23 Oct 2024 20:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729715438; cv=fail; b=dqC/UbPKFpqkQOmnxGpEQkU/flatQjj97sjqBmaUrW6EymE/b2PU3rv9BYYemynF+F31HqiKp8shNdqsWzglX5ilGgKV/vRAe5Hguz8cBoR5j85YM2T2HvHHAn9M0klnCuiWGokHmFTDl4ynUAB3fVQIDSRPw9hW9hO+fdJWaYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729715438; c=relaxed/simple;
	bh=ZfPN+eRemdR97RQb2zUvOxxwt2DcCkoWHIOnHMPT9bk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Le9vyY5F/2M+XdXJJzwXRiqJ5Gs66hfH0Je3LCzc0Z6rxTnx6h160CqoMagNZp6gHaN/ia9fU5Y9Zl3GNBNnLEBEKQVB9WfjEHYW+CS3w0NdspUDXtX1aQaM4m/F/AmPMpp54xXW9s+SxIf1ZhnakfHUAGnng0sjEVrYGBuUmpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JdSUvtFK; arc=fail smtp.client-ip=40.107.220.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JdSUvtFK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECM4qI0ru0Ccwd11t/ZJAbLuU70F4tu6S4DrcUuCIcbYLTon9JENF7sNDJ/4QQ4Qyzwu9+SCzuuuQwR8JMPMI8ugYANBX9IpTJvC9cKx9uPX34QTjSLxFT2MSEbfUkPAwhIS7zukoAgWTwG/fQEp8YpOkASIdiefc0gvq3LuxM9cVf2/GDO25/qkmMpfZfelnAc3vMnz6McgPjFr3fjcLBy/XhMD/ZbSH7j6HhHEAoUSdA6A00ZLNknuDob2yuUXE5+T1a9EiuRcUPnWu7YRRFwVQOE1QGmq2s3pcnpw+8+lneTFMLnB5gQAbbQR6wZj+ScypfuC4ZzKTYOx+3Vwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY/mvJ22rymAFm+SYUyNK+IpRZdn9sngwbzuJnITFVw=;
 b=clcuLzkf9Q/E+pwhxX7Np5CcVxMkLJHkOfv6dSlbbD3n/M8PEi8F4sefHxLDxsL5eFvTyFcJ1owxeJNBcNW3Ow3iTJ2aVnthtNEuVTe6zYGGcJOQxSS1Zdyfz388X/3idUdkcvE6NSq23pJwam2JCwIbawtyAj5Jq4KMReFQIuXc/A3SRun1n+Vu/5X+iCZNm3e7z1RwXzsr2e+8gu81cB6ICoWvYyA0NKdmN2OK5m7/UCpsMw1Gziqg5IYS5nmmBEbbmPUBYT5v0OIWRwqbJxa+/hrvCfuJUQ/HJU2TG1k+i+xu+aISZxixmvsA5qU3GxWSSQRNCIf9kZG+Nvf4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY/mvJ22rymAFm+SYUyNK+IpRZdn9sngwbzuJnITFVw=;
 b=JdSUvtFK2PTL12JiaxwHjK67kPmWhohu0XTTScebiKBo89h4oH6Tsy8QnJfn0FPKKBI0frBe/ERwCtapXbyH7TEIiJ38Ei9bzGKrP4dPPMmWRlFuD2kpCpVtuY2WjCbrGqxGpEcNUFJetBwUzzoSoou/OJ5qcdlzFDxOTrxhmrPzOrxQiBwFVx3HeSFJ15hRs7vSRLQSUSUh62EeYmoyk5yog5fl6gE/RugCQ0XkOf77T8EkdRJYyetJTpEhA1rGYn6A6ej6zHmNDjJN10FqHmFvYFXMXYZ8CETwXuxLPzZGCovb3EdWu0yhXoxJN7p+SXLqNGJ/k0lHidHIK74lpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB7762.namprd12.prod.outlook.com (2603:10b6:610:151::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 20:30:33 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 20:30:33 +0000
Message-ID: <4fd7d73f-d90f-4d0d-bd1c-75acb2ddae4f@nvidia.com>
Date: Wed, 23 Oct 2024 21:30:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20240910130019.35081-1-jonathanh@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240910130019.35081-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 6332a22a-5842-4a5e-b28e-08dcf3a18b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RS9aVTMxdXhSZGltcG91dGJoSTM5R09XNFVZbGYxWGIwcW9Ka0ZHYWJiWEJK?=
 =?utf-8?B?Z2RQTFMydk9jNkZNa2lXeGQrcG4rV3ZIWU9JVFlUd0lRZWdmbUZDMUdoL3Bm?=
 =?utf-8?B?Y0NFS1pwaDNxMGg2c3R5THkreXJCdnQvTWw2NzNwQlY1ZEJtc2NqdklobGNw?=
 =?utf-8?B?K2YzODVGQmZnNWxxY01XaDZvV3Z3aTJ5LzNOejkyZCt4WHhOVitWdEhnYjFo?=
 =?utf-8?B?YWE3Zy9QQ1czNEVtbDN0M1cvVWhJZzNQUmdvcEdNcG9RanN0ZHlQajMwRTgr?=
 =?utf-8?B?ZDdzanNnR1lWZ1QvQjFCS2Q0MHRDUnB5NHBHbnNHU3dvRVB6ekJTMlNrTStB?=
 =?utf-8?B?UUlFVHhoaUpHMFUzdWJKTlRGamVmTnpXS1FrVTM4SGFoSFMyaEVqUlltWTF2?=
 =?utf-8?B?cVlLUmpUVzdDZFdYT21vdGRKNzNwb3BWSlFvaTZuRnJJWGVtekRXVU5rbEtN?=
 =?utf-8?B?MnhHZnZSYnNxSVE0bEF0NDVrZlVheHVLR0grUXZOYnd2dFNpQnZVaTFJUEFZ?=
 =?utf-8?B?N2NSRUNJSVRrbEEzVFV0N2NKUGpneC9PWU92dEJrS084NDhNc1RydHhHcXBk?=
 =?utf-8?B?R2RaMEhHbExGRnd6MGxSTC9lYXhTNVJtaVY4NURkVUtrQlVVVnZmN0dGUllL?=
 =?utf-8?B?N0VobkwybFNoakhiV3Q0QnZvKzgrVjhSa3g2anFiV0dXWUQrRVcvQXdVUjNU?=
 =?utf-8?B?bjBkYnhtc2FOOHlZTjVQRmZiM1hpK2s0MDVyUmcwNDB0MkczaTFyanhWVVZi?=
 =?utf-8?B?M3dsalIybHZuckpZcTQzWXJJcnA1Z24xVUh2ZVZDRVFMYU81aDJEa2dabDI1?=
 =?utf-8?B?SG93RDFXaVlsek9ONHU3MkN1OWpya0dSSnJzRHFGbVo2QnNidWxkdzlwellL?=
 =?utf-8?B?VjFBZWdWenRIcUVkYllBeTZyMXVPTHhzLzhIa2tKZU14Ukg4Q0pyWTgwMjdN?=
 =?utf-8?B?Y2xPUG1yb0tKUExuMXRrdTM5U21mc3NndndBV0pETWJvbnNSN3FxVDQrMnZH?=
 =?utf-8?B?SHVnTWJVNk9UVWp6THFEU05mNVpha2NxRU02OStHc2E4cHlFQmxqUlR2cnFy?=
 =?utf-8?B?dWtMZWNBS2hsa3BxejVuRDEzeHh0YzU1eGI2WDViYUo0dHEybmJBanAxcHh5?=
 =?utf-8?B?S3JrWjZUTWI3SHpYRlhkMmk4SXJSRjNHd3FYRGVPTzhMY25wTjBiUHpxMG5o?=
 =?utf-8?B?NEVWSUpVUnNYbHU0L2VmNVZtVlh1VDQzNW1ReTRqdmJWd3NUYUV5ZHVKY2RZ?=
 =?utf-8?B?WlFCVmVWek9EbWNHV1FpMTMydVlCMmdSeGFlOCtIUmg2TThxNW5QckI2Rkdi?=
 =?utf-8?B?TWEvUXJ0bGlTQUtWdW5DdGRjSTg5TEpqaEltYzlWQi91UVNBdGJSTkNGS0g1?=
 =?utf-8?B?d2ZqVjRlcDR1c0xNOGdsQ2tleXhuVE5XQXlmMEYralA5MHVvdU84TmxOb1ZL?=
 =?utf-8?B?ZDU3U2lYaXZHMk5SSXdDc0ZpaVJicXdaV1pITlphSklyRHRXKzFPZCtJa3ZM?=
 =?utf-8?B?S09ZeEJPWGZPQ3EydENOQVFpb2UzbExYMXNmWi9UT25WT21oZ1VGNGFiWUlz?=
 =?utf-8?B?T3hnQ1drVlZFODhZZWxoRjJkNndRNUI4aXhNcnA4MGJiU1ZNT1FZS1MrYmZU?=
 =?utf-8?B?WlRYcUorbVdEdkJIb0tlbGVhZlFwT09HY21mZkpnWml4clBRYlBPQjhLZFVa?=
 =?utf-8?B?TmpERkR0S0N5UFVWSHJ0bk9MVVl4SytyZFdwRmdtWUU1YnRBUjIxVWhqRndw?=
 =?utf-8?Q?PrEQzfLcuhIRRiGDSnB6tliy1Lpppyi83iwFOTG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE1WVVZ3RE12MndjZ08ySlpFQ09lTmQ3cUgvRGVVUE1YZ20wNWlkVTJDeEc0?=
 =?utf-8?B?ZzVTaXVvOFppNjM4TzczenV1Tk45ZEVudzRXdnBzajlyMFlzT1U0QVVZeFZE?=
 =?utf-8?B?K09wSkErc2oyNlVnVXlDSmFlWkxzU3BPMEUzZUpJSlR6aG1jM09ua3ZtZG95?=
 =?utf-8?B?aExjd0o2bDRycmlhbFpYZ2lzeFora2JKTXNYT1BCTXFIMEUzaUdrNVpuQUMr?=
 =?utf-8?B?bm84TXZOTDlGd2NFVlNnL3JiQms2QWp1RGJFOVR3bGQvNkYzUGV2ZDRFMmhB?=
 =?utf-8?B?SHRaQ1FqL29DYnBmZ2xjWERqMGExWmwwYktRL1FobXYybUU3bEwwZkQ3SHFt?=
 =?utf-8?B?Y1J2dDBZWHV2Tkl1b25DU01QVllIaXdZMkhJRGNpZ21kcFM3NEV3UDRLQXo5?=
 =?utf-8?B?RFVYOVVBbDRyNVF1RzJrdHdNWUkxTExPcmx4NkN0bEZyeVd6NnVJWmQ3MVhY?=
 =?utf-8?B?bG1nVzI4alFVWlNXWXpkZEZsdCs2TnB6cWNMMXNYVGlrejBHWnEyaFh5Yzlj?=
 =?utf-8?B?V2J1QzRaajkwblFOS2M5M1hnR3ZiMFFHSnBneC9ZUUVwSkdpM3h1NDJ3S2M3?=
 =?utf-8?B?YXE1RThXYlFwZEgyS0h0NXJsdlRMQmwwWEhRUlhCdWQxOHFyZUozQ21aOGxq?=
 =?utf-8?B?Q2xBZ2xsUzNYUmo2SkFoZ0djWVd6VE1WWFBXQ2tsVlpSTnhuTDg2ek5rWTAx?=
 =?utf-8?B?MG90Yms0aFBOa3VOek4ydzhZbjMvbjFxd3JDR0Z0bHpOcEZMVmR4ckwzejJ2?=
 =?utf-8?B?RER1MGRhSlpueEFBajRMUGpSNWF5ekZYNjMvKzc5WEVsb0dEYmFvUjlqOXEx?=
 =?utf-8?B?U1hLUzlCSUhMNkNFRENYNW9zeDBVdkVNUEZzdkQ2dTZYcVZ0T2NWYlpUZUxK?=
 =?utf-8?B?dTFXMG5CdW9Xa2swbHA3dDZpbUxWVCtoUEYzYTU2SFdDRU5ROXJpU3RNbW5z?=
 =?utf-8?B?T3hWTDBiSUpCa2ZIQWVUOE8rNnNCZ2R4dWR0Y1g2dmxoNExLRzZtY0RBdWE1?=
 =?utf-8?B?ZlZ3Y1BmNmp6NFpWcXVxTWpmcy9hKzV6Vnd3NHoydVlSQnphSk5TWnRMcHJS?=
 =?utf-8?B?Q1dtZXhWaWpMSzRoVXpROHlkQW1QUlFFL041UWZrT1NCYlh0aTN3SkhTWFVo?=
 =?utf-8?B?VjNBYVBOVmpJT2hjNkVWSUZSUjk0dVlGOVRvTS9iOTFhLzMyRC9Ud1BzaFJU?=
 =?utf-8?B?Z05GYmN5SUZ2UkhlYSszODR5ZVgyWElHYS9hSmlqTm5FaTBxKzNDWDVtbzBY?=
 =?utf-8?B?THMxVmJOcklLREs1ZnZubGZQTnE5Yjdxak93dEZncHdqcVZ0dHFBNVI2REFu?=
 =?utf-8?B?NTEvVDkwOFJyeVk4Q29hYnBvRENCY1FUdE9hODdrL0RKNTlIc1ZwQTN6NTV3?=
 =?utf-8?B?S2FoSVd6aGdwUTRVM0NmSEVBeGJEZXJJL2tQVWZ1SVd2VjUvekV2dWFsRG9J?=
 =?utf-8?B?NjIzdGpEbitEN0FPckxjczdYZXFtNmxVOXlrdVhzbUhkNVVRSTFkencxZlpV?=
 =?utf-8?B?OThSVHl4aGNtUjU0M2c1dDIwSnZmNk04aFRqMkZuRXFSRjNCQlB6VDNLaVVC?=
 =?utf-8?B?TW1nSHBlMFFsRkE3c1hXUFRHOFBXR2dXaE1HVTdTL1pSUHc1bFh4MjBReTFL?=
 =?utf-8?B?UjJFS3ZvV29QR2dFZElodVNCL0czc1A2TjNKTm51cWNFTW0vS1BvTVJPSHNR?=
 =?utf-8?B?dDd2ODRtRkFIQ0ZWN1VQYUxvYUhXRkQ3b241ZExjbWV1dXpVenZDV2dFZU1I?=
 =?utf-8?B?dytpZDQ2bkxHV1dNSjZWQ21vbjk1b09aUGcwR3JocEZRS2h4d00rRkVrZnhV?=
 =?utf-8?B?Vjg2OXVRVVFNajV4Z21naE8rQzhBVnFER2Ficy9LR3ZsU3FDVnNQTVpKNXkz?=
 =?utf-8?B?U1lHWituWUlXVWNocU1QamlNWUFlOHU0K3ZkdzBvcHY3OURLZEJDYzlHSEM3?=
 =?utf-8?B?VTRjazZFQ2FGeUhmR1RsejJVU0toU2l0RmFpd0ZaWkpUWHd1RE1zcDI2eGRt?=
 =?utf-8?B?VHhQb0xFcktFcDdvSG93RG45bnd1ejhJUXZ4eDd4aDk1YnNEZWhxaXpTZS9H?=
 =?utf-8?B?UWFEeHJWMHFENVpVWVFxTG9XbVByQllUblVuWmh3WGI3NXpDTTFFQm5nbXNZ?=
 =?utf-8?B?YjVnbHMzR2Q5eWRPRzNBMFVqRnBrTU9KMWdLZ0NBaFh6dm12SnZoU3hCZHVs?=
 =?utf-8?B?bWxSN3RyYXBkeXdwRCs1WWUySk1zS0ZqZlZvRk1TYlNGckFOODdVRTlSWGlC?=
 =?utf-8?B?UW9KdVl2MXY1UlBHZW5yU3lqSllBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6332a22a-5842-4a5e-b28e-08dcf3a18b7f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 20:30:33.7831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqrxWbG1F49wx18CbABQY+XwwIwLneQC9f+TK7bErhOCZ8e4F5SLu9T04VVt6yDWTM7Av6ui1PH+ZvbuVjqYJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7762


On 10/09/2024 14:00, Jon Hunter wrote:
> The following error messages are observed on boot with the Tegra234
> Jetson AGX Orin board ...
> 
>   tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>     with 1-0008
>   tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>     with 1-0008
>   tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>     with 1-0008
> 
> In the above case, device_link_add() intentionally returns NULL because
> these are SYNC_STATE_ONLY links and the device is already probed.
> Therefore, the above messages are not actually errors. Fix this by
> replicating the test from device_link_add() in the function
> fw_devlink_create_devlink() and don't call device_link_add() if there
> are no links to create.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> I am not sure if there is a better way to fix, but given that the
> function device_link_add() is exported, I figured we could not just
> move the test. Anyway, if there is a better way to fix this, let me
> know.
> 
>   drivers/base/core.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index b69b82da8837..5d6575e63e8b 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2181,6 +2181,15 @@ static int fw_devlink_create_devlink(struct device *con,
>   			goto out;
>   		}
>   
> +		/*
> +		 * SYNC_STATE_ONLY links are useless once a consumer device has probed.
> +		 * So, only create it if the consumer hasn't probed yet.
> +		 */
> +		if (flags & DL_FLAG_SYNC_STATE_ONLY &&
> +		    con->links.status != DL_DEV_NO_DRIVER &&
> +		    con->links.status != DL_DEV_PROBING)
> +			goto out;
> +
>   		if (con != sup_dev && !device_link_add(con, sup_dev, flags)) {
>   			dev_err(con, "Failed to create device link (0x%x) with %s\n",
>   				flags, dev_name(sup_dev));


NACK. Turns out that there is an actual issue here and the proper fix is 
described here ...

https://lore.kernel.org/linux-tegra/CAGETcx-cgst26+2bRScx7mmJtOmrHzEfg0eVxzqHfQDTewy_yA@mail.gmail.com/T/#m5b77f8372671e5c4daec898f767370c302511949

Jon

-- 
nvpublic
