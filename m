Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46815314D11;
	Thu, 23 Oct 2025 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229475; cv=fail; b=jAfo3jiLhpENk1VO7kZNfkccHQQ9jDjmF2w5laqbvLay4XYpX+7TAVHiOqx0fLCGwBkSx2uv5R5w2/8IIVxobF9KARdIr+OQHUNa0KUyuQjlpaVtbXgFVnDXJymN4E9pFhhqp1mu6v81SbHkQyh8zq3FmaRXKJC7tXqvxrusGlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229475; c=relaxed/simple;
	bh=aJczdU7JqHk9Ix8o0x2szHtImOyEmVZNro1IPPHXT7A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kyRgNUpe4d9H8OFJ5br7AfHJ+Z7cUt0sjtFDKYn8lb+xXQiwBGIhV875Qqg/ZC+9H4vR4hejLjM/xFQCvn96nD0u9gkHDtWs/pBiHw3+GYkMtrLruHy2CUrLynD8joh5gUoW+Fq6uKV7AhWZ+n55cwUtWe34CKm4/GXgRnI9/n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gu9VsJkz; arc=fail smtp.client-ip=40.93.194.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gu9VsJkz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1hBosreYPzYsDvxBil/Owy7fqNQSGa7wSNF0ymFLwA54XksWYADkxumcTMDbIpwk3GvRHHh7/9szVRcqpsHVMRYjBno90+exNu9gIZhrelMJibDvCmrB+KP+k8mkL+HQo/kxfNXWaL3AJJLgya4FJeySBKjz8Tm6R4HQr7uJJLYi8dpYvF+MEgA+/QgyNAt9kHUzCPXx+lUr83dmdXmbQyKlmixBygTp1Z64I11fkBkICJRVPxwf/BVW2nGZrs8EoUdWJxAhmzO4ZoTiZynQWxcpN2NHsvIGkgO5aYzpg/3eDNzJI3nTp3q7ysZMdzf60CwPhV4iL2rv/610GFkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6t4PnAjK206wvwbAzqMRyumY8dZfY3KY8Gij+O1JB4=;
 b=zBKJR5ZQKPYJdpP1QWSmEF1C7Ilzntba5az7GA9PSx5NpwsQkbbN8ma6vtM8tQUrQd3jX0JwKnUD5i/eNFAS1vXvNZaK4YfQGIM5CtFoTZn0GTzwV/5CI2HfLiD/sEt8XNakT0bcYXnc6SpLz1qQQjNTLS/vwrg4yXNA8vncjlAU4S2FlCYVpfVicXX2+vlw/yYaznn0IkOFbwEYBa7i7rZviOkmp0edkmY2vTaSBOPjtDc0ue+4c0lvIL6k92ghVCinYEV6gomp1uYB9Yzt+hti3DoMjIbhiEd8rI1AqE+0hAUZeKXxMcbL2u1mvmZ5LfTu6geiNLXiopeAVWb0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6t4PnAjK206wvwbAzqMRyumY8dZfY3KY8Gij+O1JB4=;
 b=gu9VsJkzePJB+thOlm4JlCphwWWFAxLrvYunSDnyc7mx6ddRkHYPJYjkqVprcGnorxcDRujFZA1LqwG51/XXKMF6RrvdPtq12wISUogX7AWV3XEEHWwHEyt4vpFstzKFVHCON0Oe3NPiF8Tpy3OPw05qKHnGjmxac3Rgc5weWB2Tmz6QZxtHqPCw/QjX2AkXIy0APJs8TNTsDJXIhxjOas0wz3uXJFrIQ3PlOczdDDJ2X6mNxY5y+ZI8NFn13T4sgMV/naQqVOZunk3+BEAhP7LlUxyjtX/0ACYwPIxksHYSr5cJZP6G3k39xGUgv2vHY7e4y66kSPX8kVJNmx5l2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 14:24:29 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 14:24:29 +0000
Message-ID: <4a8decc1-3538-4040-898c-20a8e6d43617@nvidia.com>
Date: Thu, 23 Oct 2025 15:24:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc/tegra: Resolve a spelling error in the
 tegra194-cbb.c
To: =?UTF-8?Q?Bruno_Sobreira_Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Gabriel Somlo <gsomlo@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022174531.1751-1-brunofrancadevsec@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251022174531.1751-1-brunofrancadevsec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::8) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1c6ab1-905d-439c-82af-08de123fe037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmFHd3czWm8wemhhQU5EQnRGY3k5TFVOemFTREtLeU5iSkhkbnJNcWZKUmRk?=
 =?utf-8?B?SWhRS3dUR1QrbGtRZkdoUGFWRE04MHNnYkF3SVNUVng3WnBKejI5cHRVOG5M?=
 =?utf-8?B?b0Y1aUdzTVpIcGIvTkZ4MXhFSzF6MngwdWw5UnUvZ1ZZemdqakl6MEFDYVg4?=
 =?utf-8?B?WlFMVFJTWHBWbFVNdWRycVJVSGRQOXFlSG5IT0ZHZ1p6SmE5cGo2dkEwRlZ2?=
 =?utf-8?B?VFFqYW15dVk4WXowbFlFNlZrMUJUdHpMeURsMHJYM2ZqMnNkdDhkWjVLS2k0?=
 =?utf-8?B?bnlMRnpmWWlCOFVmN3lxQmJTUkt3RGFoWTNFUm5rY2FydGFKTFVCTHJBK1ds?=
 =?utf-8?B?L1RaYXNGOHdqUzU2Y0lnTDltS3hDdWE4Vnp2L1dmWWluL3YrQkxMYms2YTRE?=
 =?utf-8?B?TzRTcE5JWWRLMjltbGFXa3pkOU55R3dKeGZSUkhTenZpRFR2YlgvampPaXhZ?=
 =?utf-8?B?dWVic01SQWhER3hHWjRWczl3Z3lCcjc5MFEyU2xJMi80OHl2bXJ6MGRpMUo0?=
 =?utf-8?B?ZEF1RWljZXFBREtQWUplUU5QVjZmVTBaQ1d4YkVDWHE4UVZCS0xmUE9sN0JN?=
 =?utf-8?B?UHh3cHF4K09GOEludC80Wm1qNk5Qc3p6aU9adUdPeFR6dkkrdjZrMUUxNHJ6?=
 =?utf-8?B?QmhoNmpXMG5UZGtZWS9mak41STZiMXZSN2FkZW4vdUlHejU1dXlJOFBnY0Y5?=
 =?utf-8?B?c1B0Zk50Q2xBZDBnVGh6cUxIYk1zOGdmQ0ZvaUNpWFR0cC8zVkYybmpzNFQz?=
 =?utf-8?B?aExoNVRKRlk5cVE0OEdpZFpRSkdORExYdUVxb1BMdW1CQ3lvZWl5Y0FFaDBF?=
 =?utf-8?B?bklCV09QWTFCd2trZVNFZVk2T0hYN3RWUUt5cFZ6YytzZXQ2SytGanFQd0Uv?=
 =?utf-8?B?QlRpTmJxekRkMFRzQ1JPcWxya2dOK0dOc05ZalNSTEV4NnNyN21yQ2kvS1V0?=
 =?utf-8?B?UFlGVUs3b2t5YjBLaktkeXRET2pQSFozcTlYdlN1c2wwSkZFZ2ZmTW9kT28x?=
 =?utf-8?B?WHhPK21IcUJpdmpvc3JCZW5rU0N2R3hIRlp4U3oxQTFueFhjTFRza0tNVm0w?=
 =?utf-8?B?S1pCdUpjeW5Db1lITll1bjRxYkk3UzdKZDJnWGRlYzNwRVgvOTNKamRUcGVQ?=
 =?utf-8?B?RkJONGJsN2w5NlVqWUowaWJQMmoxMGRHL0Y2bDRRZDJ6QUZVSDQ5QUZlNGJj?=
 =?utf-8?B?bkp6a1oyRjQrL3ZFZzVIMHNFVkQ5dWJkU2xsSTVYWWVsSlFFZUJsN3JWVGd4?=
 =?utf-8?B?enQzTzNlS1JOMU9CTHYycVliOFU5U2pIemV3c0ZnUjM3d1cvSkxpSmxDckZL?=
 =?utf-8?B?NFg0MjF1K0VUZ25ndTgyaThObkk3bUc4U3ZzeWJ0SHlMSHQwL1ZPMFZqV045?=
 =?utf-8?B?YVNlM2U1TlRyUXFDNENoL3BBdnNNZWdRK1p1cmlMd2ZUOGkwRlRVd2ExU1JY?=
 =?utf-8?B?ZDdnNllhcmNsRHh5enBMejRJL3hsZmZFWFFIYXlYcXhGUzFGS3pVbTV6R05T?=
 =?utf-8?B?YzJGVjk0ZThBcU0wVHY4K1JzMHZQNGVlT2RiOVdEbmN0Sy9iWFFvWEdDSDJ4?=
 =?utf-8?B?QmI4Q0J2ZlJaM0RxOE83TnFGMllIcjg0Q2k3S0pDQVlJNW92NTlEdnpDOG5H?=
 =?utf-8?B?WWwxUHdxNHN6N1Y3TWhjQWFFYUJqQUtmejJsa3paVXRLbnRoOWdVUWNpWkNF?=
 =?utf-8?B?UldOL1JacWlBNzhneFVVS0sxK0plRmtZMGdEcUZCMGdITWtzUFVOT1pZR0JR?=
 =?utf-8?B?MUsrNUQ5WGJtL1Z1TTFTbFdZVlVJdGFUYmpDN1ltcGN2WHpnMEtmRk9TY2pB?=
 =?utf-8?B?S05HMldjZGxneWVQTTBFQ1g3UTZzSVlkWmUzcEdIbWdxVVBmb1dreXA1WTZa?=
 =?utf-8?B?b3FSYko1ZUsvTm13NGdQWnVzT1pTQW1tUC9peFJXQ0U5eHRxOVc2TEpac2J4?=
 =?utf-8?Q?T0fCr7X4rzYgaPdRlo5JniXCX3XzSJJB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3FtcHJSSnM4bWR5UDdiVUFFcTdpbGVabmlOWGFuc2VJTmI1YVBDZ2ZrMFQ0?=
 =?utf-8?B?NVBYckRIT2hGUFd6RDF1Yk9nUjZYd3prbTZqUzVKb3BMcDFxQ29VTGM0NWdZ?=
 =?utf-8?B?N2U4WjFaeWo5WFg3c2NVMGVValdqNVFYQld0WnNxaTFXRjRxQ1ZnUFljUU5a?=
 =?utf-8?B?MW54UTRHbkFZWXRDRmh3eFhOUFp0Ukx6czBzbHQ1WlU1OTIybzlkMmFMb3lL?=
 =?utf-8?B?bG9PRElscVdBdzBWM3B2RjFucWRoWjdHcHk4Q3ExTGlNbm8wOGptZk9VSDlY?=
 =?utf-8?B?NHNaOFB3Vy9qMlVSY2NhQjlTK0JjeDFYdUhQNXRua1REd1BBRE9VSG50NldJ?=
 =?utf-8?B?bWlCQ1ZFUTFFQ3lqRjBreURvSzhaQTYxZU9KYTM1Z0svbC82bTA5R2x3OTk1?=
 =?utf-8?B?RmhqR3o3V0hUejlJeG1oNllmRnlSQko4alRJSU9tUzBaM251MFEvSTZ4OXlk?=
 =?utf-8?B?eXgrbzU1eDBjUHNsWDZ5OFJCOXFwNnhNYTgwS3h4Rkd5ejZoUTRFbXRyMVJN?=
 =?utf-8?B?WGNhdmcxZEJrVGxZT2lXUjdLb2syOUtyOEM2ZHdsUU1xRjlrK3BWcVRIUGVn?=
 =?utf-8?B?NjJUYXRSQUVpUUVleHNyMVM1TW9RVHpmL29IckZOc1FuMG93a2h0S0REQlZv?=
 =?utf-8?B?Mjk1WDkzSGVQbEhHM3UrL1VScFFVYTI4S1Fxb0FmMjJaTmVYTUFXcE1vVEF3?=
 =?utf-8?B?SDErWmlrK0p3akFUczlVL3l2SGtqaUNJTklrQmdMSU44SFBORVBPdTlCKzJG?=
 =?utf-8?B?Y0FNeFZLRFRERFViSXBxaHc0M1M0UUU0RXZYTkROOFJIejVPL0xGVnpJWVpu?=
 =?utf-8?B?VXZXd1RCQ1VpZzNJQjFsc0Z0WDZYOXdJWkUvdS9IZ1pLUmpySmlPeDdMa2VN?=
 =?utf-8?B?MzRoaEZLYkV0YkJIeHFLcG1TK3k5YlV6QUlreHZEbVhwUzladUlKSlM5aFRq?=
 =?utf-8?B?emR1WTJOTE03S0xCN2lKcitxOVdYTW9Ya29PMUJCR1YxRmlrSE1DQWw2UExj?=
 =?utf-8?B?a0Z2N2pVekExaCszTlZFQk5CL2NDbFpVRzljREhDdE5sK0JDTzkvRy9DNnFV?=
 =?utf-8?B?K2Z2VVhhTUNxSnM5c3VIZUZOSXk2Qjhsb3lBV3RnalFCSmNaNFFwM0M2N0d4?=
 =?utf-8?B?cHRFOTEyN3ZaVGdWdldsUzA4eDhmbzY0VG9sRFNZS2QxdXo2a0daUksxR1l3?=
 =?utf-8?B?VCtGaUNiQmwxNVVmZzFaMWJCQUZ0ZnUzQldxMVJOcmNTZmRxSFFZTGlFZ25S?=
 =?utf-8?B?MUNpRjVWOUFsV093YWNVeTltcDBJTkhydUQ0dG9NYUJiSTR6TnRqc3NsM0Zj?=
 =?utf-8?B?RlFJaFhUOWRuQXcydXUvUTQwbktkM0FvdUFNRU9jOG1zQXE4ZEd2ZlRmQTFp?=
 =?utf-8?B?R0tzTlBHQWFxWENlYUc0MmlKTTZlU1MwVVVwazNlaU5qUmVvYnRWdTkvTWV2?=
 =?utf-8?B?UDIrQjQzRUdydCszK2N4ejJDTDNlN3FCbElTV1BlNjlGS04xVjRGWHVSRWtZ?=
 =?utf-8?B?K2s0RFZpQTN3VTZNK1dJOW1WSVhRQm1zRHFaemF4N1FtcS8vOHFSVHNVbjla?=
 =?utf-8?B?b0lXYi95UGU3dnVqNWhML2RQamNOQzZPOW9JanpQaDFoOUVZUlQrUzYvRzJJ?=
 =?utf-8?B?MUhSTEhMWGhkZ3lHYmJ6SU9tNkE0VHFyS2Frd3ZDa3pULzRDaEZkaU82WVNp?=
 =?utf-8?B?bkN6TENnd3p1VWw2VlFiaXV0cXZ2Q21BMGlwSldNNmJ4YnQyTmZyUWJSZm5x?=
 =?utf-8?B?V3FaN3ZVTmlIS2ZUUXhtNUNiS3lZUDRtVFVEcHp0K3Z2QWl2ZlFJdDBhd3Vi?=
 =?utf-8?B?TWdzSlppZmlyaGxjb2l3ZThsRmVWUUoxUGd4VWZvR3ByTDh4YStVQnV1T1pY?=
 =?utf-8?B?WEZqQUNKb1NtOExCbG5tQWU0V1lEZGQ3VEZHdTUxa0pFU09SdGRKanRyNXVX?=
 =?utf-8?B?NlpFOUh6eUFISGxBamNqY21mNXB1bHNGYU1wWDJzOTF5OGNQZmhuMFRwcGQ5?=
 =?utf-8?B?aE5nZllLbFpkZ3JWRU9va1FBY3lKaklhTUkwb0xhTVFmU3dOVjB5UHA1V210?=
 =?utf-8?B?aUlyUkRtQmcrWEdpS2lDaEZoN29QV25rRkFJWmlud1F4NHpEYnhUb1VtdnM0?=
 =?utf-8?Q?9zElyQbaWd842Wfl5cpu1U9pL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1c6ab1-905d-439c-82af-08de123fe037
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 14:24:29.0362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWKgt4644HpKQcU8CQ+JuW7HEPuIQR0JlHiLMaDzOMZjLbViWlNJM4SQV0F4KeDRNSB27hf4ksrOgbQdIFwkQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571


On 22/10/2025 18:45, Bruno Sobreira França wrote:
> Hi, this commit resolves a spelling error in the tegra194-cbb.c.
> 
> Signed-off-by: Bruno Sobreira França <brunofrancadevsec@gmail.com>
> ---
> Changes in v2
>    - Really fix the spelling error
> ---
>   drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
> index 846b17ffc2f9..e1deda188fdb 100644
> --- a/drivers/soc/tegra/cbb/tegra194-cbb.c
> +++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
> @@ -1836,7 +1836,7 @@ print_errlog1_2(struct seq_file *file, struct tegra194_cbb *cbb,
>   }
>   
>   /*
> - * Print transcation type, error code and description from ErrLog0 for all
> + * Print transaction type, error code and description from ErrLog0 for all
>    * errors. For NOC slave errors, all relevant error info is printed using
>    * ErrLog0 only. But additional information is printed for errors from
>    * APB slaves because for them:


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

