Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8C645BEC;
	Thu, 29 Aug 2024 03:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724901101; cv=fail; b=kon7OjfXeRxDwbFstVy0CJYWybmynksV2l0GNjVi+XCjrOrVDnxA72M2w4L6OZG8gJHom3KylQBNxrHIpR+4kZet9+axg3jBEf4BDrcUuJ1dFryV/9NyNAGWKPfqNHgf+ARqqMMxzzhp8qR0UZI93ZMSZQZjK/nQnmkMruqYmYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724901101; c=relaxed/simple;
	bh=pBSasznh6gslNCQfcMlN0TC839ooiB9L5NSLByN0xkE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TQQcLt/9LodFAR2HVGE328WIVMMwVqveKy0IBowgGpbS563veBeRtau7peEtfK+NyOalIVJzzbCyqJF7kA3hJfidsBCnXhDoKy4jxF0MuyNZXBpIqKWbqnyMyv6Eh9uCdM6ojj+hk4k2EevfuiMSa6I+gGHgnS2QnsxSMECjon0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=buBj45CD; arc=fail smtp.client-ip=40.107.223.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="buBj45CD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3aQKFK5ILl4QkRufGu1wvrLTXGAPX4mvZs/BLW5/59lHQMPe9KidCMAUwRQAIPHbUeRoS33HdHVbqcMgG+T55maBropGY9y76o90wO547WlsFUqA6H/Bv62Xfqk/Wby8le9KFSpf3Z2FJqUlehE9hPhVOa6nPb977ojlPmo4tqzKiGCswtMOYTwJlapozaSh8ReE5KgMHfp3xXA8VK223Pv7XjT6ifRDgc5sAhTHFvx8Ubtzwf46gEZqJCcrVdMvGLszMQJPACwPJIWmPNxAIFpR9Hy078JwWY+32rxjPD5gKkNpX1gOnCLF96xgmnZPEnm9ilTKeJAi6w3Cc8Xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTHwD5h2aSW5RsZEeNTGspItlFgdeBON5M3v2hRNbDc=;
 b=Wap1hzbP7Gqj8IFUJFej1RFffUL4nHETucGHZKrlAm3bEr52u5jlb5/K8OpUbDbP9P/RDNh9N+PhEjyufwE84u+vI+85ychwht19FUBfkXKdoAM7ZmNw6xmf1ZEiImUJAMUNXuOMQchBEr5EwqrqYXtzG/9+Jf5EtvScTwBlEcKnv9ox6dstV8aEfbiBSuBGsW6Glc10AnMeKedwg7jCAHI5YoGwe3szf0yBjE2MdbpH3dECFEGLoSFSqkQKdPqbuJIHDEkgvzda3Q8TLx9qagwTEjKExY1uPmaG+GMr6nth9V35PPU4ul+OJoDD9Hr2XVGwPqJi5UJ8d/vP2su/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTHwD5h2aSW5RsZEeNTGspItlFgdeBON5M3v2hRNbDc=;
 b=buBj45CDCbRSns4Bznwe7f+w7LtroWaYbw3Ra9aV22kfPbJoTEEV3Ac6Ge6TyYuyMiWa5kVUyPX0+OSldbHtDBR7TBXfmJC2NIKa7KWaaL1+/CcspycAq/qfxMa335Qa53y3Z/o97dEvEld73qYUHRc4HGYZJ0GmizcJGER+FVkv8f/5sUBVtA2D/GSbEyPcw3cu1a/mnzOt9CF289h2Kt3Hr4bTVjRJyT59ORJV/supbiCOwIHmZTseZBHxGUpQbQy0kywPeLo9ag9USHlBY/JCfDmgkLsOxz1lhtNMt6uCdXayLtDhXL/F+ywYzbRA5ncIS1c9BKGOPcKSf0zHsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) by
 DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.26; Thu, 29 Aug 2024 03:11:37 +0000
Received: from DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6]) by DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6%6]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 03:11:37 +0000
Message-ID: <fcaac4a4-7b76-4d67-a3f7-109ea43247d2@nvidia.com>
Date: Wed, 28 Aug 2024 20:11:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Tegra234 AGX Orin DTS Updates
To: Dara Stotland <dstotland@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20240826164725.775199-1-dstotland@nvidia.com>
Content-Language: en-US
From: Brad Griffis <bgriffis@nvidia.com>
In-Reply-To: <20240826164725.775199-1-dstotland@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:610:1f1::27) To DS7PR12MB6237.namprd12.prod.outlook.com
 (2603:10b6:8:97::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6237:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 55270d45-0d2f-4d11-07cf-08dcc7d84b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWdZOHJkK1UxNlBDOGVra0hRVXA1U3hJWXk0RlFrL0lqam1NZk1LdStxQnhQ?=
 =?utf-8?B?blhCdGc2Sk9Jc1hEZkxtYnlpVnJWcEYrL202eXFsdEZFZzE2dW9XSS9tZ1hy?=
 =?utf-8?B?QWduTGpkMlZFdjFqT0YzUDUzY05XVVNSSEgxVTRNaHhjZk1qVk9kT1pmdHpF?=
 =?utf-8?B?Z0M5QTRmdlFiVjNsK2JRSU96a2wzL25LaVZmZ0Z0TkdabXphY254YWVlRGdr?=
 =?utf-8?B?dDBUaVkvN1lQaG4zTjg4U0hLSWFhbzhFcmtoU1lJZ090UjFKWmFENFJrNlFk?=
 =?utf-8?B?Rm4vWkNrV3ZoQ2N6aW13czFRVnppWERjaXU4MHZLVWQvbXFnYTFvWHJNbEtE?=
 =?utf-8?B?MjNsakVaelhMa0tzTG55bFZtQU1ydFQ5TTNJeU5mUDM2Mmx3d1pWZlFVY2NQ?=
 =?utf-8?B?aCthY0ZhanVvV1RxQjU0eGpaUlF5Q1pTM0kyUzNxSk9DWEpxaVl6MU0wd2h2?=
 =?utf-8?B?dlk5Mmw3VDFNNFAzVDlWNGdzbElMWlAySVNlWjkzdlRJRUlWbGx2V1pqN0xU?=
 =?utf-8?B?aXhIcHIxbFdYRmdhSC9KVnQvcDVHbVYvMjkyZUVjN2l1ZVBZVmRuWXJJUXJC?=
 =?utf-8?B?d2hoWGtoUS9pbnIxUTFXUVJSRHdIZzlBWmNkYnNMZm84Mms3YkZCbXJadDZ3?=
 =?utf-8?B?V3FIQktHS3ljNnkwakxhVWV6bnhxQnNyTmU1MUFJSXc3YzhDaFI3ejg1Tlky?=
 =?utf-8?B?NTQ3SnJZQlhjMG1zY052aEtvZEIvbzBmWVl4R2FqRUJiWjFNY0FlMVV1eVIz?=
 =?utf-8?B?UlhmWFBkKy9CUU1DeE0wbnpHRGhtMXFrdWo4K3hKZWpXZ1BoMUlHUGZwOEQr?=
 =?utf-8?B?eUpTZUdVYmpZZG9vY01Sblh3K2t1SE5RenlQNmtRUmRpS3BaWHJhWlY4b2xn?=
 =?utf-8?B?c2xFaUVWRUxGZFhydVc1czdWWGZRVndZVzJSS2IzbEF6OE95ZDV6NEhlNmtM?=
 =?utf-8?B?MjRrazVJbFFUbFdEL3JJeGtOV2tzZ1NJZUN4QmZqTGcwcndiWkR2bklWZ2J3?=
 =?utf-8?B?clgxUGd3VzhaWFVhT3A3T2pXS2g0Nkl1RmtqTS81b2VGWEdIdHZDSEI1Tys0?=
 =?utf-8?B?RDd2RFQ2S2hNR3M3L0l1eGhwd3Bwd0Y2NUVFM05HQzYvKy9mMDhLK2h5VHJj?=
 =?utf-8?B?WlVqNS83czViMENQdFhMMGhLUWI3NjV2UWpXemtJMkgxdFZwVW1VcGpiYVQv?=
 =?utf-8?B?ZWdoWUZYYm5QWlM0WndkZVVud0tsUVBOZ2hkS0l0ZjA1VDRVcXFBRFM3Rkth?=
 =?utf-8?B?UDg5aE55NTNiOFdwVzB0OWNNdjlNQ1MzMUloRjVKM2lOQ1BCc3IrUm5NS1Bm?=
 =?utf-8?B?c1NqVlg1Z2puYmJXM3F3ZjlIWHh4L3ZjWnppZld6cE53Z3MyTitYRkIvc21R?=
 =?utf-8?B?TFVyUGlUYTA2TE85SGlyM08wZWdMQk9QZzdpY3JvOFF0YnUySFhzYUl3ZXYw?=
 =?utf-8?B?ZGVNYll4ZWt1YmVDY05KSldOQUVvbCtBNDc4TW5LNUlFWDhXY09FMWdGOFI4?=
 =?utf-8?B?eCt4SjIzTTZWTHRWU3NpR0NpNmxoYmpQOVozR2hEU2VvVTZicTVrT3ZINDRM?=
 =?utf-8?B?d0ZDbzgzSS9uM2hjUlRPWlJJTmlsaXNDeUNuQUJrR2JCK3N1K2ttbW1PclpR?=
 =?utf-8?B?RytmYnZXMllWSGszcWVBMCswanA4NTlsTHRrSU1idklONjFuSVQwT1duV085?=
 =?utf-8?B?Vkt5RHl2d2Z3enZUTGlEMjVZQmdZUHgvcnNTdjJtL1ZVN1BndHVZVjNJd2tJ?=
 =?utf-8?B?N0J6MlQvQUQ0RGhTaXl5eEFiSnQwd1c5cys0L0czUlBiakpBTkVmNUZiTDJ2?=
 =?utf-8?B?cXJLUk50VzRSa2tsN001UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXlCZ1ExZ0tNVFhZbTBIMWJ1dEpJUnIvcFRxM1BBNXcrQlVncVl3cW9ZWGV2?=
 =?utf-8?B?Z1ozcjFNZm1QQytiZTNGN1VDb3A5d3VvM01jMWtydVBJNVJVVHpSU2FRSXQz?=
 =?utf-8?B?TmxRb09seTVBeWZjL2VjRnZrWStJcjV3TmNrd0NaWXV0eHphQkYxTXpubXNh?=
 =?utf-8?B?SFNNdWI2TFdPaC92b0V6Q0Q3QzdNZ1YyS2ZNcGQ5WGdoOFByeWN0WWVTSjdx?=
 =?utf-8?B?YlpGcTh2VzhRK21pZ2lmMkh5UVJhRGFaS3QyOVlhZFNKY01tNTROUmhVc0dD?=
 =?utf-8?B?Q255dmh4RUJ2Sk9iaGoySjY1a05rWnQ3VXZtQW1GcjV1L0k1Q0hZWitqcUlX?=
 =?utf-8?B?S3NlVUFqMlhsMXhheGJXNnZrbXlQUzJDaU5BMUFJUGo4MGVNSlhJeHZHTGQ2?=
 =?utf-8?B?QzFGZksrOSt5b2JwcTdadG1NYjBhZS9IVjdPTllZc045WVhLV2N4Qmw4VVh3?=
 =?utf-8?B?UmgyUHZYOE9CZ1dZZ0J3ZUVhakJQWEFWaE5EYllacHI5M3dUWmRZV3RpOUNK?=
 =?utf-8?B?bjYvWTBmSGx1ek9NN3RLbGFFeHo1L3k3alRhOUVYWnkrV2l1RlZFWFpkZG9O?=
 =?utf-8?B?c1E5OUd4TUNvU2V2b3NOb3pBTXpqZ09FazA2RHlwT0U2RGdDT0ljNStsQ2k4?=
 =?utf-8?B?Ry9VSlpSQ1ZtM0E0dmR4R2pWNEZOSG1qZDFhNVNoMFRDL1FGYm5rUmNuOXpo?=
 =?utf-8?B?UFJZYUIxQUs3amRwNlpiNERmdVl4M3I5dDR4dFkvcExVciswZC9WeFRZS281?=
 =?utf-8?B?dFRQSE05OVNzbHZTQ1RwQVdDWGpOQ1VGRDk3MXBSQUhQdFZ3bmtQNWRuQkkw?=
 =?utf-8?B?TWFONzV2RXcxL21GbC96dXREWmFqcTVTWmRNSmx1d1hMZWVtZVJ1Tzk5RUh0?=
 =?utf-8?B?bUVIYVBrQ3VRNy8wU08rNHpVbHU0Q0o1enJQVUZJUDJGUmdZdVlIWDZrcFJa?=
 =?utf-8?B?Q28rWmUvc3VhRnVDR3ZEV1BEVFZnb2FDalVNSldrSEJtdFJ6OWpIQ3RJUFgy?=
 =?utf-8?B?Ty9tOEZYYkVCZmlOVndiTnA4WStzdWhwYnp2cXM0N29Nd1hHU1MvbTc5WVNw?=
 =?utf-8?B?SWJNb3VhVndMbTRkTmdyY3FYZ242em1oZ3FMb2UxYzdBZU9QYjF6OGZpdFRW?=
 =?utf-8?B?S2xyVW5YaXgyZ1JaS3pYckh6d2ZDRW1sUDljWDVialBvNlE4bFNpeGQ5L3VC?=
 =?utf-8?B?Wm1JQ1grRXg5emJKenhXQWRObnVSZ2hONU9ITjZYRG5VdUFWS1JDYzVCNlN1?=
 =?utf-8?B?S29tYUtJdnk5cGk0S0I4Q2JMNXA0Z2JRSUhEbmdpT0JmUGZWS0hjMVdNM0Ez?=
 =?utf-8?B?c3JmQXNqajNIK2tUMXcxdWNzc2hMamd3Tyt6aVZDUVRzbWEzdVQwREhUb01w?=
 =?utf-8?B?dEtqU1lOdDF0SWprNVNkS2xvb2F5eDZmakJjUG84ZWg5RGZEVWg3dEk1WEV0?=
 =?utf-8?B?Qm5GOXRBbkYwVlNNVDhjTDlVaGRUT0R1N1pwWFo0YnNpa1JsRG1aT1RONHRr?=
 =?utf-8?B?MW02UlJ6dzVuSGpZY0RycjBkMEZwUXB2djgzY3pCdk54YXdtV2RwbTgraVky?=
 =?utf-8?B?SUluWWFBeklwa2ZMTDdhRVFpOFlKMS9YTk1SbUQvUjVBZC9ZcGxWR3JHR2c0?=
 =?utf-8?B?V3ZtL2lYZWxWa25PODBTR1Y4M0cvVjN2eWxrZ2Niem95OGN1L0traU1DdTN6?=
 =?utf-8?B?ZUJsN2hLTkQrazdhZjVkTzRHWkhMT3ZNMHp1cXhPM3RmLzV4cjI5SHpXZm45?=
 =?utf-8?B?bkxoWGVjV1F4R2FFdzk0Qyt5NlJoWFRXMGZ4bzJIQVVLQXlUNHpjUi9FYURF?=
 =?utf-8?B?QWFSeldzUVpSTi9zOXdVaTZRb1RwTExNdHdvWTY3YnNkcHgwT09zSUJJT2x1?=
 =?utf-8?B?N25vVFd5VHVPNW9GRTA2d3FrRjBsUldPRzhkbkE2alJ2ZTVGQnpSYTBxY0x2?=
 =?utf-8?B?Um4rY1MxdjBrVzdIYXh4Tis3OTIyT0N6UFZUbnJ4a1d4QXRjNk5yZFZ4QXhi?=
 =?utf-8?B?OWd4WVZycEFFQncyU0gxSks4WjdoMEgrN3QrUTZTUWdPaE5iWTB5ai9UcUlO?=
 =?utf-8?B?QXlqZ3BOaiswQWhNWThVWmgxN09zNktBN0ZXSW9DbU1odjBiV2wxMjg4MTB6?=
 =?utf-8?Q?CbiOLS5QAxaPBDLy+9Iguvgzm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55270d45-0d2f-4d11-07cf-08dcc7d84b90
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 03:11:37.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w141OrmV+u6P85nKbJN5W4wf/mTyDOLdSy7O98bgxzXKbx3xKuUAq1lQEI9oXlOKLhH130FO5bCCokai2oWSwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607

On 8/26/24 09:47, Dara Stotland wrote:
> Changes in v2:
> - Added "arm64: tegra: Add common nodes to AGX Orin module"
> - Removed "arm64: tegra: Create SKU8 AGX Orin board file"
> 
> Dara Stotland (7):
>    arm64: tegra: Add common nodes to AGX Orin module
>    arm64: tegra: Combine AGX Orin board files
>    arm64: tegra: Combine IGX Orin board files
>    arm64: tegra: Move AGX Orin nodes to correct location
>    arm64: tegra: Move padctl supply nodes to AGX Orin module
>    arm64: tegra: Move BPMP nodes to AGX Orin module
>    arm64: tegra: Add thermal nodes to AGX Orin SKU8

Reviewed-by: Brad Griffis <bgriffis@nvidia.com>
