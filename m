Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BBC34F466;
	Tue, 11 Nov 2025 12:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762862721; cv=fail; b=LiPC+DQ+37zKbHFvOvTK7KWPVpo0Mm0qnclld7eAkFTbQMQm6+0xZYXuIbJAhVsHV0PVKkYcYx9/fCck+DSA6//MUKBzMd+BJD4ePFigR0DdoOr/H39qhiWjcGA23y7nj4oXo6Dsteci4OAZBnecgW+k5SXNcgYvb6JQqGMcCpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762862721; c=relaxed/simple;
	bh=iB1qU4IulcrOJf7uA+g8ym2aXE/qa7TiSQvQGlqQlJQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ItSfo714Eb0BHU3XtMyrTnUvXSQ6Rkhw4iYxn2pRWqEvk67zibxdEmg4gdHZ2VFFPPqz1accVK6l3jeOvfWx3ovu+cQDGGXwmnuE9OnnHjGbPigob+sWwHFR8EX/7RmZY/aonaenhte0t7PfB8eX7gRqi30bJRew73+FUywW2yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f4zy77mO; arc=fail smtp.client-ip=52.101.48.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f4zy77mO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nomZxKvu2KRqfDUWuJ6sAjelbZNAx1izPrx/8oCcg5Yk6X/tzqGI9R8zb8zV3wG7hSS7QiAdA+eQSP2n87MqnoRu9cFsyN2O9XB7/j4K4PkfImQ75+1WgxQ6+kmj7o9fKaD/zLWqZ+9VrtITfe+iALrybXcFrF+G385zWrvw3TeBFR4cBuAFStoE0jR3rCLQOO2PBDvbDScK+uMPbC5Ri3O7TdXo71VgGePkEKYekvoJiZzxj3Wqd7uWqbmnsdg9RC/BmPb5EIjxJAK29cIoq8nA2M33MiRlWSm8E9N2uo1EHZSgeNH8oEJOCTo/iGcz6hkRMgkoZRI4eQWnsRN/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjYmkCHo2o6FF7rx3ot6VefKNcV+p+Xl7KCtRIR6sz4=;
 b=l9zKmF16tB2gVGXwWcARcMxdNQgZV+rK0/ZYnImhuKlcV0c3ZuPqIxWAkANQ8JeZ0ClKG8HPExkoZM2AYBmwZURCyRxEE8mVO+ihhnfRAcwnZk/7NGBwuSw/+fQ/vgKmIkAnMiMgZTfiq7nrI6kS65cFJEBQwDa/z7UYtEqJpSEbzIl0OLmYw3p90Upb44Kg9V+3YaWFlsJYMsYANmcRYvds3ne5PJHg/Vwa54lVEy1Ss6HcIYa0UA4ilnRREPQ1SyOKTUEkd4+JvkwwdmZeQE3SLpjJCyLX38hCdV+hY0VrxI3FcYQv6RLSHt+1o68amTY1Kx0wOT97cOGjSNt2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjYmkCHo2o6FF7rx3ot6VefKNcV+p+Xl7KCtRIR6sz4=;
 b=f4zy77mOmgcdbpUnEgKoF3Tsi0PPAcHlih3Euuc16Y4z8ECY2yZdo/dUa5J1DPuro99NvaFoQLmDrzrI6qS8JL1QhtjCEybxAEXfZkpSKwt0xLuQWeTAG5qMBwCIokTEdtnQjI4EUSZozK3mFs21WwFPb7kr8GCii8XnIfoolAfvfonHkUfSc6G0H9bEda3k2FuC8FTquSn0PWI8ouWy9/okDe4KxPQsc7YiOsincs5AdSrz32FPn60w9eTMfJHoIY+22LBfFvdvXIQ3MT/E5T61AXa9IoeMgdRkg6ikAj/Vd0VzLUqQnMPaWJ4Qv1SeJkTO8yEP4EmldzxvLfnGqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS0PR12MB6534.namprd12.prod.outlook.com (2603:10b6:8:c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 12:05:17 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 12:05:17 +0000
Message-ID: <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
Date: Tue, 11 Nov 2025 12:05:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Krzysztof Kozlowski <krzk@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com>
 <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
 <99ca4992-5736-417d-854e-379542549bee@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <99ca4992-5736-417d-854e-379542549bee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS0PR12MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cb3c42-d647-40d8-f1ee-08de211a9416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUx3cTZNWWFYUmhiU3NZYmJMOHhrKzhWbnJSUUpXNVByN0ROYTRhYVdsTDhS?=
 =?utf-8?B?emVjVUNaWmZuVUo4WndjSWlMSEp0QmhjZzdGaG4yMUM3dFdacVMxYXRxa2d2?=
 =?utf-8?B?MnFqVXdvQnhoME9mbnlheFp4RHJNYm9xS0hMNVNha1FzZlluK3YvbTQvTHZD?=
 =?utf-8?B?cnhneTljSnFHTktIdFF1cnFFT01VN0RlS3B5OFMvTGZsczZZVHVCTXhTRi8y?=
 =?utf-8?B?bkxQU2NoeGUwMVZSb0lrRGtIY3Y5ei9mRGJCcUxPc3dVblU3U09JNzU4ZVo3?=
 =?utf-8?B?TUw1SENML2h6YmllcU9ScFhaZXUrRXM4QWQ4VmdXcDBPVVRlRm9RU01XVVpW?=
 =?utf-8?B?VlBOMHc0UHE3R1JPd04renFiSTBDVUovbUJYM0swSkY4VEdtVHdSNVBMdDl1?=
 =?utf-8?B?eGhETnZkbnQ1eWRHRU5UVDRKWFUvcVpqWGVkRzRxNzRtc1FGd1hGaS9obmk1?=
 =?utf-8?B?aG9HQTliVVQ2T25mbjlPenZNbGhLaHF1eHo0MEhkRGVuRVBWdzFsZkVSakVu?=
 =?utf-8?B?WVd1UlJOamVqc3VrQ2ZsSDhVbWMxaHFuUnJzUDA4ZU9UWmZLclpOeWpPS0pG?=
 =?utf-8?B?WndMMkRMNDd5RnEzZzJyZVFsYUdxL3ZKcDVodEhjWllaOXVxOWtoSXV0Wm5v?=
 =?utf-8?B?WE90Vk1XU0tzd1pDalZ2Rm1wSkN5RHFFMUxsVjF1enBwOTRJTCtpTXhOTUc5?=
 =?utf-8?B?UWYvTDFabmJZT1pBMW43ZVV4WG42QVhoWGVjQTA0Wk95K0EyckVCQmN1MGdq?=
 =?utf-8?B?VllYMXNSaWlUR3ZkUEdDdzJkbEMvd0lCakN2SDd1QWhka3lDR1ZYbkVBMnRk?=
 =?utf-8?B?Z0tuUDVSZnVQZnl1YXM4dkRzNDV0bFAwb3k2WnE1aTViNzJaYjdEM214VUQ1?=
 =?utf-8?B?YzdhamEwRlNQTDNmdjRXSmVMMmlhcWVjQXFDUG9XYnMxM3h2NXFJQnd5L2or?=
 =?utf-8?B?eGxIcHE0S0tucXVyQ1lZell4OFUrMi9reXFPVlJyQzltaFhtdWo4a09iaGd5?=
 =?utf-8?B?dWt5eXNrNWxqUXp2eHQrZVZ0anBXRElTODFYTHBtRmJOQzBnOXEvVDRUYTdm?=
 =?utf-8?B?bXBxaVdxSEdzZmRpaXlwNm5jWHo1ZnBRV0NUUGl6bktCVUpUUUl0Qy93UHRB?=
 =?utf-8?B?NUVnaW5Id3BzOHBPN0V2KyttdG0vMDhKUDJnRDFMbE1RbEJFcGVNUTk5TUx0?=
 =?utf-8?B?MSs1ZS9sMTRlaG5lemZPaEI2SmF4ZG9GcjlRaFZNUm0xTS94VnE4a0Z0ZWhz?=
 =?utf-8?B?ai8yUTJpTXZLNmYyWVc3YTNSREh0dWVJWXk2SFRhSzhlZ0R2SWFiaHh1SW1m?=
 =?utf-8?B?NHhaR0Q0dTRkbWd5bDU1R3Y3S3RuZHA0YUFUUEswc29uVjNVYmtVVFc0ZHU3?=
 =?utf-8?B?Tll1bWlLSHYvemdSSDQyV0RQQ05tbFlrREpqakVLYlp2YUNvMERXTWwwb3c2?=
 =?utf-8?B?bGQwOHE3SkZEeE5PTEFGdzFEbXJzaXpKK3NBbHZ5a3FtSVphWExJMmR0MUEy?=
 =?utf-8?B?YVRoOHpsRjNUWjNJTXdtZ3dxelY2SjhCd1YxZUFWVzM1UC9uMjk5QlRKV2hP?=
 =?utf-8?B?NEVmeXZsdGIvL1JDWDMxWE5TbmhNd3BzVkNKUG1xQ2E4Zkp0b0E1dDRHMkV5?=
 =?utf-8?B?UHNtQVorRDExZTdoK1o4UHJ0Y0tWbThOL1lwN2tIclBQSTVXd0RCdWUwVVFZ?=
 =?utf-8?B?RTFoZFd5bmJkaS9lTk8rV0V5ZmJQNDFPNURTaHYyS2ZzMElDNUVlK3dyaURv?=
 =?utf-8?B?MGpJZW54ejhERkxRSVJMT05TSExoL3N5d3RtL3U2d09uZG5vQ3dPbDFSZlFH?=
 =?utf-8?B?REtiRzArMUhoOVNSbHlUaFVPb01VcUZzSStuaXlhQnpkOWRRZXprOTMvQVVo?=
 =?utf-8?B?UnBmSHlHWjlJR0VUNjUzSDNYU2Vkd3JSeFBKT040clNqaWRFanVnWU1rOVlt?=
 =?utf-8?Q?YoE+HfunvWXvEB/ceYCo6QnMv/4HgYR5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXVtazBEMi9jWmFucURXQS9lUVhUTDdXdEFBbm1OM2lreG5HQjJlb2ZhQ3Y2?=
 =?utf-8?B?R3RZZFh5VXdISk4rRUwwdVRucUNLV1ovS3VWK2c5c0ZJNGZ4R0RDOUM5MTZC?=
 =?utf-8?B?MCtINnd1aVo2Sm1mOW9CbGQweDhtWXR6V29wa1QyS2MzTlNQMUF6S3ZZMkM4?=
 =?utf-8?B?WHdnZjZCaWZSK3I4Z1NzdHl5TXBFUHl5aXc1d0ZqdVJ2YXNVaUlzNlZmRGxy?=
 =?utf-8?B?Z0ZPdkVHSzBIVUhxM2c3K0l0d1JFV2RvYnByM3FRek5TeERPd3ZIUW5xNlV6?=
 =?utf-8?B?MlVRZ3pIYSs1Sk16MW52RE1FaVlsZ0JJNkRWek1odS9ybUFUU29DSEFFSDhi?=
 =?utf-8?B?WlJFVlVINXU1OUZxaHl4SStMZ202UXlUcVhYbnRIdDFPVC9STjNiN2VtTEFK?=
 =?utf-8?B?WU1HTldCUU1WbURXVWZXQXlZbk93enMzY0NrTUQyM05HeEdhK2RxN0ozaktW?=
 =?utf-8?B?WE9VaGIxR1R0aHR0Y2syNENvT2FJZlY5NllLOGtVbnZWcnVKWHVoTDJrcWNh?=
 =?utf-8?B?QkJiNVQ0TW9FMnJRK20vY3VubU5obVdjOHl2MHIwdEpLV083SWZZR29TUDVN?=
 =?utf-8?B?cjR6UDY1OWdSTVl4cmw3SkhaSExVQTVUZnBqaW1zOGZScFl6SUtSZHFXOWZq?=
 =?utf-8?B?MHFkVjZYMDhkN1hDbjRGb2dvMm1VeFVrUFZaYitJZWY5Q2xRVlZ6dkppUmpG?=
 =?utf-8?B?MVJGc1FnWExab1Y1OU5YR1pnTHRsQ1BmK0NZVmM5NWpqQzg1R1F3RThNYnFu?=
 =?utf-8?B?em5URS9OQ0ZRazZxUTNTUHp6eHJzbkx4UFZURCtJSDdLY2xWaG1WbWdSTC95?=
 =?utf-8?B?U3NUTTNsQ05BbGY4RFNpWE1BTmNuMEN5WEpyNDhzaGZRcmNxR3ZEWHZnYm9r?=
 =?utf-8?B?TUlQU1RoRTV4WXJOaXQ1TnBWdDRpTmdLcStXK3oxOVFMejlWQjVYWUphZVhx?=
 =?utf-8?B?dDRReUtkditWZWswRkgxSlprYVY0L1BoQXQweWp2VklHVGY3WHJPRlVjeHdL?=
 =?utf-8?B?SG50bktsdTRxendkNEZqblRnSm1IV25NRlhVdFMrNVJHZE5aY1ZCVFJWY3pL?=
 =?utf-8?B?amc0cnRZZ2RDU3F5ek8rb3I1L29keVVzQUlyaDUrdUlYU01EdC9aQkV3bGJ6?=
 =?utf-8?B?M3p0OFhITVlPS0hWNVp5UC9CZXdiakl3WnpNemp6SHZaTGhEcVNISUlhaTYv?=
 =?utf-8?B?RW1CZ1c0OE9GbkJJRFdPSHRjVy8yT2VWRnh2TVNCV2RVYWVkQkRLOGg4L1F2?=
 =?utf-8?B?ckg2aERxeFZ1anJZbTdxcVJLOEN2Q01vV2h2RWd2bTJiTkYrak8rUFJSN0Vu?=
 =?utf-8?B?NitrZ2JNOHNVOUtnTHFRTDBXOXZjNUppeTBwclFJNmIzd1JxdnJDV2NCY0Vs?=
 =?utf-8?B?WUt4cS83WWI4VGppeW1NRTExbmFJc0ptM1FLUE1ENzB5THRONWJMRUtyNXFn?=
 =?utf-8?B?OXdTN01ab1RiaTJSRzUrV2JWUnUxdGxiZUVhbjJDdFdhMW05aFJIMHQ5Ry9V?=
 =?utf-8?B?M1oyMktpZjRseis0ZHBwQUJaSlZkQ09mQ3VnSXlsNGVXUUNENE5oYzc1QWR6?=
 =?utf-8?B?WVhKc0t3RVhTOFRPa0VJUkIvU3c2SldrWm1hdURWY2MzbnZwVUtVOFQrVHBv?=
 =?utf-8?B?UUEvOVdnT0l4anJoS1QzajIyWWIwa0xHSEpZZ1hERHpRV1IwZHZaV2ZpRE52?=
 =?utf-8?B?UElLUkVHODhpYXRpejRjVzhnSXZzWDI5QVpYWmREZDlxTk4rdmdhQStkUXZT?=
 =?utf-8?B?OGhRekRweFk4Q0tuZzZKd0o2aDF4UGFkOWgwUGljMVk4dlhoYjJ2L3NqbGkr?=
 =?utf-8?B?TlJXS2JIRDRFdjdkZjV2OWQwYlVQcUVROWQrYzFvdXFlV1FIT1VsMlVPTEJZ?=
 =?utf-8?B?akIxWm11UjZPSVZRbEZFU0JNYjVUbFd4L2RHYVZOR0NLd0hVRUE1TzY5cVV4?=
 =?utf-8?B?WG1Sc3R4cVBzeGEzMkszd0lpZnMwOFdqYTkyTjBZNFc4YkpCRXZGSU1ob08y?=
 =?utf-8?B?Y0JyakdGZE9CTVp4VENqeE1WZUFXREo2WFBRYStHV2ZpdTRVejE0ZUJKek93?=
 =?utf-8?B?K1BVVUM1bGh4YTJVNEQyOWhuMG5pUXc2K3gxQVpPaEhGOC9Kc3NnTFBMVkFV?=
 =?utf-8?Q?z352IQg2bQFTXTNg9foyO4uqz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cb3c42-d647-40d8-f1ee-08de211a9416
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 12:05:17.1633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mla0E3vneiAKpQO8OZHT1dGiNN0RI59CLHbYrCcLQNlwCY5dCcCg/3nrtgmpuhPRrqxl98uYM+uR+5cnnhOnPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6534


On 11/11/2025 11:16, Krzysztof Kozlowski wrote:
> On 11/11/2025 12:13, Jon Hunter wrote:
>>>>>> +
>>>>>>         if (tegra_bpmp_mrq_is_supported(emc->bpmp, MRQ_EMC_DVFS_LATENCY)) {
>>>>>>                 err = tegra186_emc_get_emc_dvfs_latency(emc);
>>>>>>                 if (err)
>>>>>>
>>>>>
>>>>>
>>>>> FYI, this patch is causing a boot regression on Tegra194 devices. I
>>>>> noticed that tegra194-p2972-0000 and tegra194-p3509-0000+p3668-0000 are
>>>>> no longer booting and bisect is pointing to this. I will have a closer
>>>>> look and try to see why this is.
>>>>
>>>> Interesting. Both were booting for me during my verification, though
>>>> my use case involves the dt changes that I don't believe have been
>>>> picked up yet. Thought I had explicitly verified without the dt
>>>> changes too, though. Since I was asked to do so on this or one of the
>>>> other similar series. I will try to check linux-next as-is soon.
>>>
>>> I just built next-20251110 using the standard arm64 defconfig and
>>> flashed the resulting Image and dtb's to p2972 and p3518 (p3509+p3668)
>>> and both booted to cli on a barebones busybox ramdisk. I do not see
>>> any errors from tegra-mc, and the only error I see from tegra186-emc
>>> is that it can't find the opp tables, which is expected without the dt
>>> changes, and is not fatal.
>>
>> Thanks for testing. Something is not right because our boards are
>> failing. So may be we are doing/testing something different. However,
>> this should not break. So there is a problem here.
> 
> 
> Did you meant: "So there is NO problem here"?

Nope. I mean that this is a problem here.

> I kept these for 10 days in linux-next and yesterday sent them in pull
> request. If some patches are needed on top, they can still fit coming
> merge window if sent soon.

Looking back I see it started failing with next-20251103. next-20251031 
was fine. Reverting this commit on top of next-20251110 fixes the issue.

There may be a difference in the firmware being used. Our testing is 
based upon an older NVIDIA L4T r32.5.1 release but nonetheless, we 
should not break that.

Jon
-- 
nvpublic

