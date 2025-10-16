Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012066.outbound.protection.outlook.com [40.107.209.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCDA1E32CF;
	Thu, 16 Oct 2025 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760608018; cv=fail; b=I+h5EHb1il+6tdkVkYkqTlW0g/1+sGIr+SldKp6zH8JQ9t30lBR+Lm/ZuHBkc26MMZfAYtOA+BaRQqi+g2P1jXe5Zq6bDD70zRwSh8krhDz0MOex9NVThNhT0mKI+EAHEQ/WDvm/CJjP7mj8OJmGvDt1sKmJ8EX9Lc+gbjpbmQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760608018; c=relaxed/simple;
	bh=eWE/Z9OiePIUw3/hCuDq3Ol2j/Mg42jZozRRR18IygQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ESzVUP8WCUSqL/xESNSfV6lZUS/oNau0jzJEbVp/GS3PZLy3IivgJrQJtYEHwknk4fA7DzIf3PoI/RnFWf/TTDHjUuC+19z3wZAePMrpsyFEwzpj/FwStLJi24K1/AzE+RaBtEJaeH/RWX/6IaVxqRsF+uTdZ5NEc11yEBGLjcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Um1114Ou; arc=fail smtp.client-ip=40.107.209.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Um1114Ou"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDlYxW+nbRrCWWCeKxga3/cXyB2rSAl/LPqqPFsZ2MSPW3yLHJtJA18h5GgR5h//lRmm99k6fIlQwIA0JZSo2QNKXFeNGKRi8bzCapwNbam3iz6R7rmbv7695ZubAUWvf3On3qO/lVhIKGAsjOQr8zZYnNw6j4HArsSmkApvbepmaDiRDX9n7GYf9nWV+mvBZ1J0vPLylUpLNQlRLdNJeY9tPThwwdhWR1Vp00qLeXrz/eD1mMZBFSxNhOSoEffJllxr/mYFxUPJ8Ss91NDLoqKASOSDKBxtckAO9x0Z1tN+M+sOhUhAQHtr1lyPRH2fhFXMBRDjLEcxCxsFh+sFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6exGXbsG1Ex8RquSV8/f3vrZ8bzxfdthgH/kVUE6AI=;
 b=qWLW7C3BMHD6HibIJpcFZsOWPvdvISpuTsOez69Nh9jt6DJeLJl/B+kIEWh8D39j7XacmvBMcRGINewiXJGJ9khH6UQTLWFno0VQGQH3S0trKRq2qKV5eBZLSlfGbxAcrENg2DWiZNvVXS+fGgyi6X/3+Qgn1Us1Bs2Z7DDX9BdwMjd8U2ftLJsf3Roo24r5FXd/pFRMdHzhrbNYfXvu3aQJfT9F6KUASvM7Rbcd5lUR2gTZzUP6Ps1kG2dvbfwR+pLWrEMbZG5PwETsguennYWx+Kcf8Z2PWO9tc3lxp/WgJuJ7PpX+S0D5NY68WL0jwxcnJqJZZWn/dXhkZJ1Slg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6exGXbsG1Ex8RquSV8/f3vrZ8bzxfdthgH/kVUE6AI=;
 b=Um1114OufJxRDCWVyReYQeSdOeywZ2WElxXHmQDVSijz9FLuCqVdoGrSrCw86X8+5pR8+lrTSjZUObtmOPrvFir9F7ccl8A9IJ1CT3x0tZpgskwlftOwCpTN0rl3NrM3WYz0gmqXRvzHyGhnFex8UA6u05BgQcShNdATW/o/m/GG056YIojsA5tNDkrtrP1zPUkAKlafU8e2icaCR1Y9vQlGIpWZl8ETfbDAGp4F7LuRrq6+4K5q2TPzSxflNoxSl5niCCuQM6oazmjLMSFi4bM33cguYuLV4eFw2sWf+Xka8fIibauDZ0jYhxkXJTgLcYF0pyfuApnUkwFse48u7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV8PR12MB9617.namprd12.prod.outlook.com (2603:10b6:408:2a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 09:46:54 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 09:46:53 +0000
Message-ID: <cb588468-959c-43c7-b16d-a8387151d524@nvidia.com>
Date: Thu, 16 Oct 2025 10:46:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: mark Jetson Xavier NX's PHY as a wakeup
 source
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Aaron Kling <webgeek1234@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <E1v93ne-0000000AmQk-1nHh@rmk-PC.armlinux.org.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <E1v93ne-0000000AmQk-1nHh@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::6) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV8PR12MB9617:EE_
X-MS-Office365-Filtering-Correlation-Id: f8678115-d1f6-4a3c-d625-08de0c98efda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmpKOVFIeUFlaE9JSEFBSUtueXdUc3BkK0ZLVzU4TlUxWlg5WTQ4M3k0RTVm?=
 =?utf-8?B?NTlLVnhWM3liMWJRMElqaUJXdHRXb0hOaFRrQ1d5N1RQRzFpSEZ5NkdaR1hx?=
 =?utf-8?B?N0t1d1Z2eUM1Tm5kcUpXcnlOYndWcjY4ZFpvNWp3Z2V1VGJ1ZHdjMkFPUGho?=
 =?utf-8?B?VUJ4SFdGdElUYWoxSFlxeXkycXZpR3BENmRuaFRndW50Uy9WSlRMRTFQYUth?=
 =?utf-8?B?T24yZUd1bHFESFBGWTBHUVZLQk52ZkVhTlRJVVM3YTNwSWgwcytscUlaeS90?=
 =?utf-8?B?cDE3bFpOVlA0RzcyL0FEVHBxOG1NWS9mbHkvb2RXUnV6L29COFp4YnRhSUF1?=
 =?utf-8?B?a2cwYnhqNUJnUDg1cGJEK2JzamRwQjNQNFAySTJvVitZNnA2UnpEVW8xV1ph?=
 =?utf-8?B?aEVGYW0yUWRoUUhUdzI1czJGMmtCTWVFdVZpckpudXFMSUlMQ2praHNMRjAr?=
 =?utf-8?B?bmxwOXJKM3RIa3FiQUNtdm1YNStmTWhSUHBTWW9YSWFSNk1UZnJzWHJrZllR?=
 =?utf-8?B?WDV1bHlVVmFINElHS2ErajlZYmExOENYMWFzUzVRRE1VY2xQN0ZXN240OGlL?=
 =?utf-8?B?b044THlmeGZxaUNvWTNsN2tNQURxaTA1YXd4QlUvbzIxTStDRXNkWklxSWlD?=
 =?utf-8?B?RlRiM0x5VEFyS1FieWJBMTZ5TVNScG9TOTF3bStFa2x3bHJlNTdZTXZyWUJa?=
 =?utf-8?B?UEE3bTNqT25wRmdJS1lKYU1jMnVNc1J2L2hzOXdKSDBXcGQ5TlJINWVDWVN4?=
 =?utf-8?B?MkdCcFIvbnFkR1lhWWJuQlRJVkpwNnVNVkZrZzZhbEc0bDBmWDc4ZER2VEht?=
 =?utf-8?B?allXNUo5QzQxNkNzVVhXaGp3ZU9CdDIvQk9DdTJ5ZWRYTng0cUdwaGQxT0Rj?=
 =?utf-8?B?ay9SS1E4c3lueGltTDVCUzlDWllybmRiRUpFU1liWDB4dDZnV2tFT1hUTjBX?=
 =?utf-8?B?b2tzeWVVUDhTeHNaK3FKemdCemdxekpNcC92NzkyWlc1RzYrK3JGek1yQm1X?=
 =?utf-8?B?aFZBVTYxU2xxbXpPRHY3UmRvUzcxRGVyQmpGUGM5Q3dISlhYSkVlNlhTL2hV?=
 =?utf-8?B?U0VCZU02WjI1MkMyN09DSHdmVTM0REQyZGZBTThEUkFaMGp6SnZqUkFDcjE4?=
 =?utf-8?B?UElLRFkvSmNuOFRKNS8vbnJuOFNQSkI5dWRpakNXT2FkcVdGaW8vaW8wL2tW?=
 =?utf-8?B?eGZSUVpwbzZINGFhUTE0UG5tL0RCeGQwQy9YOEoyTW1SVmhZQkR0M2xDMGl3?=
 =?utf-8?B?WUQzN1l4Y3dYRk1pa1EzcTZkSkwwRE5IeXE5SmU5U01KT2p4dW41bzNRMy9C?=
 =?utf-8?B?OWF1KzllMGNQNldLbUhHNjdzd2ZCWlJWcXRyZTZIWXdCeGFFWjVlUmN3dXl1?=
 =?utf-8?B?N1AvTFZQMGNPVXE4eVRsWTE4SlVTamZqcGo3TGdBdkRKZHhrdjJhUTRlak9U?=
 =?utf-8?B?Z3QxOHc0Vi9OMnpiUTMzaFhUQ2ZRcVBUYW9JUk9sYW5tbEJEaE5VTHZ4MnlQ?=
 =?utf-8?B?MnZjazVZWEJjTGc1alpJZjJML2VyZzhPRDlReUcyNnRWRmsvNS9YNk9iL1NI?=
 =?utf-8?B?N01ZVUJGV3RIWis5T2JkdURrQjI1T1pRWUJEWlV3bEJMTGs1M1V6WWx0NmRM?=
 =?utf-8?B?MnRya1FsUVNPWXJiRHNvcHBwOVZxbSsvL05lOW96VnBockR5dFkyVmZHT01P?=
 =?utf-8?B?YXNuTUgrSVB1MVpYNGhxd2ptL0t4ZjNJSUNxT3RlSjNNK1F5dmozZU1tRzIx?=
 =?utf-8?B?Z3RVOWJMMFd4RVNaSlIvb1JUOEJVL0M3YkFhcFFCcmhTN0ZtZXVEVmNwa05t?=
 =?utf-8?B?MWdybFBZb2FGVFJFZk1kQm16Q0E4K2dmbk1pemgzeDY0N2x0eUtTZ1I2bWxL?=
 =?utf-8?B?a2VEVlFubzFZWlk0SG9ZRnY4b2Z4cE43ZUwrZGU5bFJXdWpGNlZ3cHNYL1Vh?=
 =?utf-8?Q?CWYHp3lb9+bqScqQdfloMXQ6OPOMFnI2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9BK2hUSjFnUzlPU2pUcjZxclJCeVlCelpLSjdYNmNSZC94ekIzWUc2UUkr?=
 =?utf-8?B?SkFuRGVhemR1cWJmR015dW40dStIUGlxdXVXR2d5eFl2RklNREVITFZCRmEw?=
 =?utf-8?B?b2l0S0xpVUZGZFFtMnlJeFVMTjVsV3Q4MFZVYWpJZjFYTys2cEZkOEJpbnVk?=
 =?utf-8?B?K2p6QWpYdTNWenJvTXVhUTRDakMzZU9vYkRoZUQ0NmdwNCs4bC9FNHl6Tkd5?=
 =?utf-8?B?WG1PMFp2Qk9UZEN2aDFZb2x5WkM4dmlBMWI3UFNrcTVnUnoxNE04Wkg2U1Ju?=
 =?utf-8?B?aDZ3TERPc1FMOHJXOW5HVEhCSFI1dHdtVWdyVERkL2FLblpSZjNRZmQrbWNz?=
 =?utf-8?B?YkJYMnNNYjNTSllrUXRadWFpczE1dEZ6a090Y2FDRWRDdWpNU1ZndUNuSW9L?=
 =?utf-8?B?UFl6ZHlSZFN5UFJVVTVINVJPTlQrbitLSGJwZFlMM1YwUCtKUTVPeUtxUXNl?=
 =?utf-8?B?d0x3MldONzVJQ0VFSHZGUm05QnNqa0l4cE9rZFRBcEphSFhpRlpNQnU2TTND?=
 =?utf-8?B?RjlPYzFCWHRSOElBT21hSjdxN1BCQW5NSGltUy92dzBVaUk2K0JlekNjdEI0?=
 =?utf-8?B?WHpzTUlrN25ialRwNkdLZkt5ZTlWY08vTFUyS2d2a1UvYTJrMFpBckpmejVr?=
 =?utf-8?B?am1wcUJUbnFVODFIQU9MU244bjJtYm8xSUlQbnZocjRlTEszK1M1enRaNElh?=
 =?utf-8?B?U083LzdJUlQ3S3IyNWFsQ1kvalpQblVkbDV5Um5oRklDWDhiVDE0YzFrOWk3?=
 =?utf-8?B?YXU0alJ5MDZ3UTFzd2QrS3ZLZUFOcjRLNGxLZHNXVXJMK251b1hrNUw2eURY?=
 =?utf-8?B?MGxFaXk0QmxKUHV3ak5iSFQ0WTBDaitMSStOa2NvMDRWa1RIZ1N1anA0ZXZM?=
 =?utf-8?B?QTZ1VHhBdkppY252NUk4SkZoZzRVamJTVUpvWVdtK2hqWnNJNE1zWFJReEpm?=
 =?utf-8?B?akxvQUkyNml5UTFmVHZram9xV0o2aFlNcDNhSlE1SEV5M085aE1wejd6VDdv?=
 =?utf-8?B?OU5iWXdPamRnalNYWWRsTVZaSDgrcVFJR2w3dVJvRC96U2lKb1lyVENjeEd3?=
 =?utf-8?B?d1Z5aHA1dFBURm9rdHc1YzhaVXV2RTQ4Z3JpWXdQeEhSUVJ1bExlV0VXNnJa?=
 =?utf-8?B?dVVNdXU0YUhzUWtpN0F0NVZOUmFjNFZUZk5yYzYzZGVKb3N4NjJiTlI5OUxi?=
 =?utf-8?B?em0wRjV1eXA4RGdxek5JMWZ4aUdHYTNpbi9NdzZMRWFkMnN1aTdwUmhTZGU4?=
 =?utf-8?B?NE9zYk8ySGlwNGtPRkErQXhlaHRKZzVnVnZkRW5aY01PTUc3U2tMeEI5TFpR?=
 =?utf-8?B?Qk84QlQxeUFXSXRoSVdPVWpQZmNZSVdZUmlER0tySUFIdHUzSzJPWkR4R3Yz?=
 =?utf-8?B?NVU0YytZRTQ0Q1BrazU2TEN4NmJyRjYyQldKRVBSKzRNeHlka3hHZ1NjTThT?=
 =?utf-8?B?VndVODBaZlowVEp1VFFMNjl1OEV3cDM5ZW5PU2UvbUJuY095OHBJUWdKZU02?=
 =?utf-8?B?a1pGZE5wWWhHTklDeHdyK1BsQm9PMGp5YUdCcEJRcmFYV21mOWNDc3dpV1U3?=
 =?utf-8?B?YkFhdHhTakx0elhZYWZXSk51RHI4c3NhTUxJSXY5eHp2Q3pLTDUxUHpGdjhw?=
 =?utf-8?B?MTRPQy9lSnBGelBjS1ZJYkFXRjNTQkx5UFIrZ0JUcXVKM3kxWVVYa2VhVVp0?=
 =?utf-8?B?SzRURElURC80eUhLMjJIUW1mL3oxUGZWL3JWUm1FZjdDNXk3c3hFQUhkenZ5?=
 =?utf-8?B?cURBZjJEVHNhNXUrVUJOUWxENjhBdnVHYnNpK2VoVm16UDNyRmVVTjZpdzFI?=
 =?utf-8?B?RG1IaHhBY01EeWNzNGNpUkNhWTVWd2puYURBZ0RESTdBYjhqeTJzSUx1Ynlo?=
 =?utf-8?B?a1J3UVFodExjRVl0Nzl2SlNPVjhyTlAxTTcxVUlYZlN0V2VWN3IvRlBIOEEv?=
 =?utf-8?B?Ymo5Q3pRNjZMRmFabXpJc0s5YWtmL1FZZ3RVUDlXZTBMSWdoZ1RGL2RMSXdP?=
 =?utf-8?B?NXJ0Mkk2emMvcjFMcDB5WVlYTGJDZGduMXQ5RVhIRFVqUER2bTQyc2htRlNm?=
 =?utf-8?B?Tm4zdXczK3pXUFkvdWpOTVlIQWlSZGpaWk1RUVUyOWNiV1MwdFJVeklkTFR6?=
 =?utf-8?Q?O19c/wcbXimOEEhEYFXeAATzB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8678115-d1f6-4a3c-d625-08de0c98efda
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 09:46:53.3034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jfsjv6WmyrCJnDvnbyrSLcJSiiCiRtVwJDdsT6nEp8UJ53a85dn5WwccSGP05jdPnZqZui2eTanYmy47BR1EWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9617


On 15/10/2025 16:52, Russell King (Oracle) wrote:
> Mark the RTL8211F PHY as a wakeup source for the Jetson Xavier NX.
> This allows the reworked RTL8211F driver to know that the PHY is
> wired to wakeup capable hardware, and thus to expose WoL capabilities.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> I thought I had already sent this patch out, and I'm sure someone said
> that they had queued it for the merge window, but it wasn't merged. As
> I can't find it in any of my mailboxes, this must be a false memory.
> I'm way too overloaded to properly track anything right now.

FWIW, I don't recall seeing this.

> It's not a big problem. WoL will go from not being functional in
> previous kernels (and actually causing problems with interrupt
> delivery) to not being supported (ethtool will report so) in v6.18
> without this patch. Options are: merge it into 6.18-rc and have
> functional WoL for 6.18, or wait until the next merge window and
> have WoL working in approx. four months time when 6.19 is released.
> 
> Note: the bindings update was already merged in commit a510980e740c
> ("dt-bindings: net: realtek,rtl82xx: document wakeup-source property")
> during the recent merge window.
> 
>   arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
> index a410fc335fa3..c0f17f8189fa 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
> @@ -42,6 +42,7 @@ phy: ethernet-phy@0 {
>   					interrupt-parent = <&gpio>;
>   					interrupts = <TEGRA194_MAIN_GPIO(G, 4) IRQ_TYPE_LEVEL_LOW>;
>   					#phy-cells = <0>;
> +					wakeup-source;
>   				};
>   			};
>   		};


Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for fixing this!

Cheers
Jon

-- 
nvpublic

