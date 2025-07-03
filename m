Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658BC2E426C;
	Thu,  3 Jul 2025 10:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538400; cv=fail; b=o6OGXSUCf050vpuYuzTOnODHR7ghfJKjBnoCiH5hM3Sf79TqD3ssvsxzNy81gFbC9j+LezvtFCwhBRH2yP57iC4U7C0AUOBPyCetu39CbdJDmGBm/XNm2/HKHfdR79+u1hkLjWkYCDSrIbuLGSAupSo0eex9S4R85KJHCfg9L10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538400; c=relaxed/simple;
	bh=WvbGDgEJATiX44kVzF9OdsdmNTo3Z4vkhJbqG8GST7s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=isU/E05P/fiocRcTT14w5WVHnhPlFg55/nBBA1GHJcqLPKn61aWxf/dfABItRq8ued3YNYwT2y0CqzKVU7n72lEiljm6ku+Jg2lyGdB/aZrQAG4XxWQVl5ya6tgEGCDqh74V4o5S+TyEft41AVjNPSdLMa/TNO7T2hM5oqHLziM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=igaM3QQ4; arc=fail smtp.client-ip=40.107.93.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="igaM3QQ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbQkARr41dFD/QI0exI1gv/Mn0RkxJzttPCxQWq71B8Bm+an/d//tzAsBlhyKTYUEHpihJecS/EX5AZPcXI7oKAPvSGi0fCRQiMwdu9RxriOIH6jdgXUO6HpA0SlPZ2PJMmVBYVeNegwUd+yulmm41J3Jb+lV2YioDK1NKtjc0392enKPrXqhp/zdfdU1m7bNf8+TRRCXJnKQcu44aOeGppbNtY5VLCM4lAisqMdfwhQ8hvsxvQbfQPCEeRiLYVjLhW+9r3i9lxpRDsuo8olQf4GPdgL1X+dGWPsG/xOebR2pb+bz3dZZOSf0VqS5qT8XUs/tCOI6RWjZxZAXrr9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbP6xs4+p74XBAQf/m837/AsUFHUAcLRgxlve3PeFCU=;
 b=Cd4IPAtXgtpIVL4rq1shrK9+ao0P8wLbpjEyVhXfAAbKP60/7whulLQZA/CWg2SlUPs73JV9TnWhvuVHQ/wpkHmQbyVDUh74cfpJ3BcVXtntRkVoJmX2SNU6HhAlgn/WfoCel0r+C3kUGr4IGRcqSV2IOO3zofrnWbONIzt8HVaHSoLsTe5rFcxMwkOPEpv2b+uUm7lkMVZPTX1wIJ/QOXFwGsap/IFCVvf0brgvMeK9xXtX4eY80bntMnqdNC+YTHiniNUa5Dnu9It0x9/DxgMVqET7gDppcblKDsNB6PZxFdhnmwk/nRODOceFy3i9R2QMTtf5OWJu1ldbCO28bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbP6xs4+p74XBAQf/m837/AsUFHUAcLRgxlve3PeFCU=;
 b=igaM3QQ4L8umSeO33VIFyYaIyIKxJBkMOoUnECa64/QahE4OQI1thkS2KpKGt1Ry8D/E0TNPXDpfyCdiCg6cELqXv8AJsfBsobIgIIeBAbP+Fd+KFg/8fKSlFevcoeWphP14DqViMKaeupYwMI/cjHvAugxywke6a0IGbJ+glYeAaEN42MdayZ/aFas/CYBtedAPHt8sVObdYj7fzG8+jcAcInaVarVw4Sz2IU+g+SYNwXAC92zoSdrQB2OGzeI29C7rw2RWemXjtv2J0cHZs8mrLZGaMZjRJ43kNbJR1K3wCzpYCDrnB6vuZaBFC89Wdo47mszSy5vIFjt63CxJJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ2PR12MB8943.namprd12.prod.outlook.com (2603:10b6:a03:547::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:26:33 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 10:26:32 +0000
Message-ID: <79974980-7218-4fa6-b5c2-f3936ecd1fce@nvidia.com>
Date: Thu, 3 Jul 2025 11:26:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, daniel.lezcano@linaro.org,
 tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250630110135.201930-1-kkartik@nvidia.com>
 <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
 <a0d7a8c6-af60-4f70-9d60-a87e0701bc91@nvidia.com>
 <k2t3dkh3acoenhxtsd3ekvpnwl5yir6qaun52h5prdfwcx5lsb@h3ieoj7jfu6t>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <k2t3dkh3acoenhxtsd3ekvpnwl5yir6qaun52h5prdfwcx5lsb@h3ieoj7jfu6t>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ2PR12MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a837f7-72f5-47c8-45e8-08ddba1c14b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VktMWS90YkszOG82SFRMMC92TmU5ekVkL0ZsNUtJRFhMY2xzWEZsM29TWUlT?=
 =?utf-8?B?WndUTS9maC9nTVFySklUQVZ3TzNEMXdLdUtIbG9GdUhjRUxoenRPTld2Rzhm?=
 =?utf-8?B?cmZscEY3RkpNWUhzOWhHc3dJd1lEbDdHRk0zL0lsVmg4YzJrdEJWOVF0cTF1?=
 =?utf-8?B?cUdsVnNDU1g2TWhZVGZjcUh5aUlCb0lubnZuRUxPYThaaklmNncyU2ZBTml4?=
 =?utf-8?B?TXRuTFEzbEZmeDVZcU15SE84cGxQc1hzbFFPS2wvUVNSQ1pCellwMittL3Bx?=
 =?utf-8?B?VCtadVVoWndBZG5RVUo0TFpvSGU4ZURoS0p4WS9DS1hXamhDOWtBeXJQc0F5?=
 =?utf-8?B?RWgvUVh6QklONStydkJoM3I3UWdvZjkyM2VRbHY5bDhLTk9nbmpjQ0FQK0pK?=
 =?utf-8?B?S3BWajRTaWtIV2Z1cEg2Z3RyN0FKZTdmL0IxRm45YnhHWVMzK3M3Qk1hTk1q?=
 =?utf-8?B?cXZxbEtmSlJkdzZMejlUM3FGTmZDeHkrSFJXZkZ4bzhEYU15U01hMXVSVVZO?=
 =?utf-8?B?YTRnVTVDNUs0enZqZkV6QUN2cWlVeFZnL0ZyQzc0azdFQlZOTTNSMnFXZU81?=
 =?utf-8?B?TXVoSGk2WSt5SUk3NFpRd01jeG5OQmZPRjRibG1kVDEzNlVuMWU1RkluRTlS?=
 =?utf-8?B?MDU2ZWpwY2MxVnhyQWhOYmtWNVRVVDdHL2JXVlprQllvb3NZWWxnNFIxRDB1?=
 =?utf-8?B?dHZNN2ZFV3o2bWdjb2JJY3FIZzNhWjlxUStZY1FLSjBXODJ2Y21iYnZXa2tr?=
 =?utf-8?B?RHg2bnVWS256VldDUFZUNzNoNm5mdzRQVDhhdFVWTmlpTkFxSDJWMkJSV3Vk?=
 =?utf-8?B?bzFaNWpJbmFPRnMzMENYMkdLMXVQcUQ1RGlpUUtncWttMmViQVJGZU5xRG5F?=
 =?utf-8?B?Q2lNZlZLTkUwRkJ1aHNPdk5veTcvRmJDTjNreENVTUw1NTBCaysrZkFwTkI4?=
 =?utf-8?B?NktJVXNFZU1FSXZpVnN4RHFrOVFidGJwN1RGMG51QStSVUROZWJlS0M1SE12?=
 =?utf-8?B?ZmN4UlZUcW1GbmhsVklPd1ZPdjRBUjVYMGhTTzR2UFlrZ3VKL3NZMmJuenF1?=
 =?utf-8?B?NFBiRGNQcWF1b004dUFkMjlGWmdieEtpUWsrcHY1cEYvRWJOMVdKSlZKeG95?=
 =?utf-8?B?di82bWsrbjhhZ0VyMmo2dUl1dHVPQzIrb3ZlcVpnamlZYnpPQ0krRVN6eEYw?=
 =?utf-8?B?Z3ZITmo0OUJieHNsUGRpOFNuaFJNdDJXUlB5b3JRdDlzMDdaUGNxT3JEbVVv?=
 =?utf-8?B?WWRzVkFSS0t0eThoSFBFSmVDSThBcTc1NGpqYldJL054VFdjeWpQcGFySEtL?=
 =?utf-8?B?bGRTUFh3OFh3V29TU0xxRlYybC9nVHh1Sm01NGtBMmhXdTR3bnY1bHZtVFpa?=
 =?utf-8?B?cTN1NTVIZUxMVlFvWUZPbFN1QVlZMjFnQm12VmhHWGh2Rm1wZjE1ZjlpMk1u?=
 =?utf-8?B?QkI2TmdxbjFTcGlmb2UzajJFWlp6azQ4eTRka0MrdFpIUUdpL3dBbVJJQkVP?=
 =?utf-8?B?R3NCY1pvMUozU01QNTBXYmUrK1I0eDNjcFF2cHp4ZjZKcjE3SWNpMmRnRERY?=
 =?utf-8?B?Snk0b3I2SnlYN3JSMEJBM0VaQi9adFBTRXYvalVZdExseG1sSTZSZ3dtY1B0?=
 =?utf-8?B?aE40MGpXcys1cEM1ZkNuaDJjK05vYjgyTUc4enNmejBjOXhHZHQ3RFBMS2ZX?=
 =?utf-8?B?cFY1T25DbnY3QnRkVHFuNnFGMGZsekQwZjBYcFg1WUtZdU9VSlhzUW5URXJU?=
 =?utf-8?B?ek5lbG9FVTNhQzRvVm9kdmdRYTNRZU9QbVhhdlJBMHhmOERHVWxPTEVaQ0hH?=
 =?utf-8?B?akhQOGt4Ti8yNGJ1b2ZHeG9IZzV6SkRnd2MyWDd4Y25PZkFEdnNkbGNzL3lP?=
 =?utf-8?B?eTNTMWhWOUM4cXBkUzJWaTQ2Z1poaTdianNHVHdEZ0tjZmV3djk2V0VnSlBR?=
 =?utf-8?Q?23Bxdz76xIo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzRNK3V4UFRLdmdPaDB6ZkFJZHBjMkVSbnpNeDRFVHNFMGdLNGxZWWV6RitX?=
 =?utf-8?B?S0Eva1NmeW01dldQeHpLU1hPZDRTTGhKaUdhMFh1S3R3OGZ5RzdkL05KUzVw?=
 =?utf-8?B?a09QcXhnWWxweCt4Zlo1elJ4VEwveHdFK3ROcExnRE1tYWxwNTdlc3BxdUsv?=
 =?utf-8?B?eXJBU3p1eU9sZ1VvNDdMMmxZWXlQSE1qMENHR3JwMXltMis5ODdOc0o1VU52?=
 =?utf-8?B?WU1vOTJUVGgrTHdHQ3hzZjFXZXBtVUtVQmwzaTNCNlJlNWx0WmdwODFJUThX?=
 =?utf-8?B?Ylo1NnZFektkT0tiZHdjTXVqcUEzbHJrS0lMYit5bzN3TTkwTVZ1RzZCUVls?=
 =?utf-8?B?aWpjcDd4UkVDWm82a29iVk0rTUc2ZVBsNnJ4Y2VNQ0VPK0MvVUVYSjd6aVJI?=
 =?utf-8?B?SncxeGVoS0VQVklHbkhEdlJHeE90VTZnNThlZC9wRlJVZVhjMGtuQ0xwUFdJ?=
 =?utf-8?B?d0plWXBjeENPQWVHREoxY3VwMlJxbUdMZXdWMloxYlZ6ak9WaFZmU2ZmS0ZC?=
 =?utf-8?B?L2NLalhEL2tuckYvbElPSHArOUdscUVIV05jMFY5WGltUHViM05Icmp2UHFV?=
 =?utf-8?B?dk5ob1VqcGMzNTVvZ2FmUk5WZXhHUHdTdDl5RWVXN2JiTU55cktZUTVtWXIx?=
 =?utf-8?B?eGJmMnJOSGsrZW9Wa1B2NXVCbFE0MU9pTytzaGg0ZEZ6RlRndWJrWUswZnVh?=
 =?utf-8?B?UEtvZFhNZzNyMlVKclErYTUwRTU2c1h3dHlzOE5vdUEvQkYyamhja0oyZVE0?=
 =?utf-8?B?M2UrUm83ZGc0Wllad3FQK1lNem4yUTg2QjUyUmU0MXc4MGlveDYyOVZaRFJG?=
 =?utf-8?B?SkQyTVM4b1lEUitJc1hkZjROc2NFUGF1ejdMRGtIUUpaWUp5Y2VtTjN4alVj?=
 =?utf-8?B?VVV4a0tjdDNrRWlseWRSUERlZVJzTGJnMHEvNklGdVArZXBPRzFQRm55S1JR?=
 =?utf-8?B?UkYvVlJtZ0swMDF4YklMbUtSYjNoZVRCQlE0cVRTbnV2V1Y1ZGhPWTdxWTd5?=
 =?utf-8?B?cnYzT3NMUkFEYXY2QmdQSGdsZi9ia0lLRUVHZ2VLbVphdk9kRE1jSHVmSjdz?=
 =?utf-8?B?VGI3TjFJZnU4SktHamc0NDUzYk5OSVlxT1RwL211b0c3Y3VibzZYU1VZU29R?=
 =?utf-8?B?NlJkem0rcU5wS2l2cFp3dFI3Sm1iK0RJRXdoTkJ6ek1tM2JpbDN6OGdxUkw1?=
 =?utf-8?B?MFNvdTB3UG5tVStwWTQ1MDBvOTdyb2cvM0diTFhrY0kvc3JGRXp6aGZmQW8w?=
 =?utf-8?B?eDEyREFUOWV6TXpxcS9SdzlkV0R3eHErMVQ1Vm1NOFEvWXZjc25TeU5WM08r?=
 =?utf-8?B?MkdaTk55R0FZeFRqbmFZbEN4Q3pSV3c2RTNDTmVlV0JOUUh3UXlDV1o0Zmh2?=
 =?utf-8?B?QmIwQ09YdjM5NThFWEh0TjJEczJiUnZmc2J3cmpiVjJ1dVNKYW5USUFqVDBy?=
 =?utf-8?B?TzBGNzMybHhYYXZTeGxlaXcvYTlLWlI5NThSeGdiVi9QQnlubDAvOU5YbzZQ?=
 =?utf-8?B?RmlHTjR2WjFRd2tPZkl6TThsbU1lVTYzR2tBRVMzb2huQ2t5Z0FOcEk0NWU2?=
 =?utf-8?B?WGVmN0tROVRSNEVUemhqY2owNEVYcWlwOVoxUjhyYkhBRDYrdTlOTzBIN1Nz?=
 =?utf-8?B?K0d4RStFN3UvV1hKdC9nSmUzOVNaYUkxeUNaK2tqaHc5SnFoS0hsekhpRzRh?=
 =?utf-8?B?eFNhN3dKNDF3Y0FIblpIV0syN24yZ1NsMFV3a2hzRFYxWjBrOEZ4eno5OW14?=
 =?utf-8?B?TSsveEh1Y1kyOEZHYytFb0VFMGt1bmpmN3VycGJKdmJJUDMrUjJCN1AwKzM3?=
 =?utf-8?B?dWJPdVRGSFN2ODhGODFNVVcvUjRqQTJiUHBGR29UNmxOTk45TmhYNDdXd0FE?=
 =?utf-8?B?bzJab1VUTVpXYXZ0bDdxYzhMbXZRYUJnNExGd2JtY1ZpbFNwUGZaUk9UcEVx?=
 =?utf-8?B?a0p0QUFCYmhLU2xNQ1VjZG10aHd5ektiY040K21MSkFtV2JCVUdyMmVnZHJj?=
 =?utf-8?B?RkduSlAvM01peUVhQmhrUjRyV2hYaVo0UzVDdjJZWHNlbTBac3JLOVZMek5I?=
 =?utf-8?B?LzR0eWc1VFZrNzI2UytlMVpBcXRJM0Z2SE93Wks5RDR5N1pyZDZZbFhDV1gx?=
 =?utf-8?Q?n2l5qTOcWxrcQruxKTgnCidYT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a837f7-72f5-47c8-45e8-08ddba1c14b5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:26:32.8114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rfWtcrZOsYfoqstppnxwJ+hJDmru6pg+qws6vPYvYRsvkPbibNDcSyfK4W28X1XFdYGrqnw1h/bra91fM8vhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8943



On 03/07/2025 11:12, Thierry Reding wrote:
> On Thu, Jul 03, 2025 at 08:55:04AM +0100, Jon Hunter wrote:
>>
>>
>> On 03/07/2025 07:55, Thierry Reding wrote:
>>> On Mon, Jun 30, 2025 at 04:31:35PM +0530, Kartik Rajput wrote:
>>>> Currently, if the system crashes or hangs during kernel boot before
>>>> userspace initializes and configures the watchdog timer, then the
>>>> watchdog won’t be able to recover the system as it’s not running. This
>>>> becomes crucial during an over-the-air update, where if the newly
>>>> updated kernel crashes on boot, the watchdog is needed to reset the
>>>> device and boot into an alternative system partition. If the watchdog
>>>> is disabled in such scenarios, it can lead to the system getting
>>>> bricked.
>>>>
>>>> Enable the WDT during driver probe to allow recovery from any crash/hang
>>>> seen during early kernel boot. Also, disable interrupts once userspace
>>>> starts pinging the watchdog.
>>>>
>>>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>>>> ---
>>>>    drivers/clocksource/timer-tegra186.c | 42 ++++++++++++++++++++++++++++
>>>>    1 file changed, 42 insertions(+)
>>>
>>> This seems dangerous to me. It means that if the operating system
>>> doesn't start some sort of watchdog service in userspace that pings the
>>> watchdog, the system will reboot 120 seconds after the watchdog probe.
>>
>>
>> I don't believe that will happen with this change. The kernel will continue
>> to pet the watchdog until userspace takes over with this change. At least
>> that is my understanding.
> 
> Ah yes... I skipped over that IRQ handling bit. However, I think this
> still violates the assumptions because the driver will keep petting the
> watchdog no matter what, which means that we now have no way of forcing
> a reset of the system when userspace hangs. As long as just a tiny part
> of the kernel keeps running, the watchdog would keep getting petted and
> prevent it from resetting the system.
> 
> Using a second watchdog still seems like a more robust alternative. Or
> maybe we can find a way to remove the kernel petting once userspace
> starts the watchdog.

Once userspace calls the "->ping" callback then, 'enable_irq' is set to 
false and when 'tegra186_wdt_enable()' is called this will disable the 
IRQ so that the kernel no longer pets the watchdog. So this should 
disable kernel petting once userspace is up and running.

Cheers!
Jon

-- 
nvpublic

