Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3CB3191AF;
	Wed,  7 Jan 2026 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790044; cv=fail; b=qJecJijw6fZnr3y2Ix22PXaa8Hnz/lHtC9LqIW42FoIijZPTbOzwEivJMyj6P/Py65l+MVCMRhP7jWKqE8aM/Z2Ga9grkYxmcwHPGSXjGlG8XZZcbsplMLikTcHpq0oFH2f+Q1JoPCZgo4fO1EZfN+fm74TzOB6No9YAUbHE4oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790044; c=relaxed/simple;
	bh=QGh5pxV8JWjwCgqClZnRyYvz+oTfV0CUYBxpsm4Fww4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u1i9wcm5G3NPagQGKfsKJk9OuorWHWEcDmAI1A6zB1ZKMJ5utmNgZL+pCXS+q6cXKC9aHzmmfujx8wWEtwqhEf3DuyK851JOFu42iejTDnpa4V+0ASGioNHHoCBBllcMWlijNtkFCsvovRfwR+WT3qpyrppTrMVmZbEFFSFN/6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A0wSur2y; arc=fail smtp.client-ip=52.101.56.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A0wSur2y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Opjl0vyQQqin1oNF4jvCRwnCd1LMKKwZWQkaV8eWNNipts+maSPtCuowHpMM6u6JZWdC1JI9NOtkCE+k+9/h70qaiPST9daCzJtqPQ/wTKR8ckAPG1c9gEWrHjNls3ZEKcQ8cHTfFsbwSK1ZcZ/CaFMMedPBm3LVs+yrDbMVfiosw7rvscNlzOJZl03vDoElzVe97S926TSXQ5XLgxsvCDfjpqWZUWPgvtpnsvNAzi6eKXyH4aw4FHFDDm0eOTjrGssx5KaEYRAWhhPqczwvBT87ntdB8vF+EZCrLVMSP2P64YLerm1OGzPTm/ccDHwBtFanH8q+yzb3K3IjfKL1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66YQ3FIKqBHx+MQ0CX1ZvSRvuIfZWpcx1nAnuDow8jY=;
 b=LVXh848nflCzCkU4f45ZqzyGRztiySncCcbgKNQFKbHLnauNryaI3t03SJMEc3mqNl4/lMeOsgIaU6oQfYVwOuWTwYHB9T2mS6NMXpgP95sAeH8zE41wc9paXrmFskfEI8IGPV+xG0TFjbhDOyoA9KvidwD9o9nv9C9tXzd0p/3Yv+9WH86XFGlhSkusvpEigHFtA40SDqg7LqpjDcax6Yfd2RIy15C2j0Vjvuqcnm/MG4NPLXRN+NGcPDJWA9SGZ1Ng2aLPItxpOPnWE3MN0C90JqiDwKMtrSOLCLF7fm4F+dSuy/fxDdxhyrh56B+ovsz18dkAh9epGR6GzyQHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66YQ3FIKqBHx+MQ0CX1ZvSRvuIfZWpcx1nAnuDow8jY=;
 b=A0wSur2yQdwJwDhO2UwBPo2G0GmheA8ueJ0C/kxsT8Cp9zE1K7XufuLEoXlXbEsjU3sBT8U62a+SKVyWFJNukMJPznoHNzdi5ELcVyZxPTAlKy93YvpnNZxPqG6W1QDd01aote4LrWMfV407p07uFPrZ85Ws1UzndY1Y/6tg7pomKEjJG17A5tJkl1igebcWlZJzDd3wD5gmgIkiQ/lS7P6uQXomCATyBIlDKoXkPKtk1UAsWq6Cr53z5rSeiIxhmscNov//3KYPmFFrgvcjP+lnrd/b8NYyCvVD7m2fv6QhLLTKvbkK9O3eQsPpDFtDufV0PS2gQqNCS7+1UVUf2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 12:47:08 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 12:47:08 +0000
Message-ID: <d6333e4d-4525-4b3e-ad7c-95750435b0db@nvidia.com>
Date: Wed, 7 Jan 2026 12:47:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] memory: tegra: Add MC error logging support for
 Tegra264
To: Ketan Patil <ketanp@nvidia.com>, krzk@kernel.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251219114354.2727906-1-ketanp@nvidia.com>
 <20251219114354.2727906-5-ketanp@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251219114354.2727906-5-ketanp@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0244.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|BL3PR12MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ef8835-72ca-4f72-6aa4-08de4deade12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R203TDZuR1M5STdIcVlOdzhDTW9ZOUN3SnAydWYvekl2V1pkK1RTVlVVUzkv?=
 =?utf-8?B?VmZHcWloRnFPZmdKOE1MWTdIK1VBTWtkSkU5cVdnQ1laeEdvazJsRUhaVllO?=
 =?utf-8?B?SHRPY0d4SXNBVDc1V3JrOHl6VHlPWlI0bHRudUtZSlZQV3RBSkRKeVY3NFla?=
 =?utf-8?B?UTZSSm1EWGh1b0ZOTnNxU1hiZGRvOFJlWTRPZC85QUJlOFJVSEFOdVZiaE8w?=
 =?utf-8?B?MXNZaGJyazNiK2o3WGFKckM1bUEveU1vNVhSbncySWxKdEp2dlBWNXNtZ0lB?=
 =?utf-8?B?VGFsQ0g2NG12akpHZTVWbWRCYjVsZFlVUXhOYWFadXVTR3YrS2k3NXlGUjZn?=
 =?utf-8?B?UlNHU2xoQXByR1RON1JwTFBsZUo3d3pQZ3BBTkw5NDduZWpKTEpGYU4rTUhJ?=
 =?utf-8?B?MFZjMFlmektFRy8vMk85aXZ6amJwbXRTVGtXL21SWjVIZTVkVVpScGNQTlZK?=
 =?utf-8?B?NTl3QkJMeWpKV2pBVzdmQm00Z2IvTTM3QjR6Rmk1aW9BeG9jYkdjRVlNQ1lV?=
 =?utf-8?B?ei9HenlQZkRlSFhaeUlhZ0JPT2IreGtFQnJCYlhSQkZlbXU3cXlvRzRQRTg2?=
 =?utf-8?B?UEtZQ2pKK0x2M25tN3NISFBoblByTkQwa1NJMzdQSklzRXhnenYwTGF3bUw2?=
 =?utf-8?B?L3dBd1p2TXpZZEJrSldNUWVUUW8zMGgwMC9idjZadXBUYnVPZTVlNWd2L3Uw?=
 =?utf-8?B?NzYzck9qa1NkdlRtTXY1bmFGb3NNaStabXRERkkxOFRrVGVoYlpCSkc5MjBm?=
 =?utf-8?B?MllIYk9kdE5uOSs2ejdZWEtrNGZHNUQrblgrNlVtNU5XdTUwZVdkbjRqQzhT?=
 =?utf-8?B?enpBVC91cnR1Y2t5MTU2dFJzeE5HeHVkeUp4QmtndDJJR0ZGYzlqWmRDWDE3?=
 =?utf-8?B?djlwUXc3ZTUyQVZKVk9qc2o5NlphWGs5a1pQWDRaS2JiczZ1RTZpVWFVNGdB?=
 =?utf-8?B?d3ZZa2cyaHZ6dXFkTE1Ba2pkZy9JU1NyMjRwSGFWYlJScnk2aUNTSWJvd1Fx?=
 =?utf-8?B?M0tZZXJhcUtZQzhJdlVsNEk5ei84YzR5L0JuTDNvT1I0SGxEOEpWUU93V29z?=
 =?utf-8?B?UnMwc2RNMnhZRjJIMzFFS0hWRkhoNnZLVnFJMVI3MVVLYmgzaGI4UDBUY3VW?=
 =?utf-8?B?QUgxSWRKbnVBNm1yM0t5U3ZxZW5CV2dhY0FEY1dla1RvMlhOdW9DM01NYjlP?=
 =?utf-8?B?aEU5a2ppd29jZUdHcUpNZWxXMkpLc3FkL0tWME5aVTRYdkpza00vUnI4R2Fx?=
 =?utf-8?B?a2wxbWlFNDdFTzc3Y2F1aEJLYXVia01qM2YzVkRFSnVac3hKTnZIUVNQUkFJ?=
 =?utf-8?B?dHl3RjNRTnBwUnZCNFp0UlhId1JNNkFYYTljVFVabTNrNTV6TGhaOXZJV1pr?=
 =?utf-8?B?VmVCVnZtbWpUbFBNZHlGMVg0TVZqeXhUSTNJZEJWL1hGVDlUYTdtR004QjEv?=
 =?utf-8?B?VUdOMlBzdDBVVytVeEtacVRWMGRlODlrYzRvYytIc3dLVVRqcnpHczZGYjUz?=
 =?utf-8?B?aGJiSnhoYUdwK3FXUUduTlVWOGlBQkVWeVpWQktTUmNhcFNOUGlkQm9uOVQw?=
 =?utf-8?B?SjB0YVgyRlhFMHoxQ1QxTXFYWXNhQUZxWFUwcHF1T3hxSGM0WjhBYzZjazZy?=
 =?utf-8?B?R0t5alhaR3VLSGN1ZXBjT1hVWnQrdG1nZGNra01Gb25WOE1TSVhmU05rZkZ3?=
 =?utf-8?B?Ly8zUVhEUnY3aldCWXVWaW43WjFSKzBMT0JoZUd3UHkreDkybHlMZm1yclBO?=
 =?utf-8?B?NUNwYmZpeUwweVZjSFgyT2ZDMTdBNGZLSktHbmE0aVVzVDFhZWFYc25XOGpG?=
 =?utf-8?B?YThONHJmOXJrSUFSWVNzMHFsS2JkSVd5aUVKMGtiUkFFMlpqRFdJVGt6Q1Jj?=
 =?utf-8?B?bWRwNDhqR2dwZmV4eGJZQ1diWHlUdyt4YzQ2TDFMamRsZ0ZMbnB0cklqRkNT?=
 =?utf-8?Q?vCviTMw2Y0mrBKpFCHyC94qp79nGMrhd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N21aNnFvYUk1V05mOGhjM3hXeWxpVmZtejNZaHpvRlNJbmRLVWFWdUNSY3FM?=
 =?utf-8?B?cjZDVU9WNXNNTlF0TG1TZk5KK1lzSHR0dkZvdlBCbmZNQkM5MFpGOVpCTkZQ?=
 =?utf-8?B?SldSb20vQmVpMitGQk1icmxEWXBKR3YvTGlOdVNwVEJYbkU0bkpFZ1I0cTR4?=
 =?utf-8?B?MXpFUzVZNHRRbFNadXd2dHlvN0xqUDhIaHpnZ0ZWcmljRGx4Q29SaWFsYWI4?=
 =?utf-8?B?WVdTbUxaZUxDa0tQZ2JEL2VDTTVoNkZUcVRHZC92RHVXNVRYU3U5RThnVk01?=
 =?utf-8?B?QysvZUNhVHBRUVowZW1xdEZLTmpEeVVGdU10REZlSitNcjhNYzdJaVRreExM?=
 =?utf-8?B?WElpbkJvKzJIYzVMSDMraEhKTDhZZytLVDN0TVRHdFE0cU9YSVZ0WjJ3R3RZ?=
 =?utf-8?B?Si81ZjVSOFpPOXkrdkl5Z0JBVGx0aEtwR3Zmb0l3czB6TTZVMlREdlZVWkpY?=
 =?utf-8?B?TGUwL2w4czYwT1oyeGtCSTVveDAvNk9EcndoSDV5QU1EVU5LL2JXTmtyYU5P?=
 =?utf-8?B?enhsMDBPK3VTY0NVNEYrTnVIMWdPUENaVkZKb0o1YkpiZHRjNHZ0TG4rVkE5?=
 =?utf-8?B?WkVRSmhJOW44Z3ZGdzl0SFFkYSswMjdHVmNSazFzazNkRXc4ZzhSOFVzb3J3?=
 =?utf-8?B?MFA3T001NXBsREtvQ2t0YnF2UnQyYnA4NzlmWmpRQzZnN1F1MFk0cGpwamp4?=
 =?utf-8?B?MWFuM1JUVUJrckw3S2dSeFNCYmJldlI0dnpNd0s3SUFiZFpYdWcvbnY4RHBx?=
 =?utf-8?B?SVJLUDIxZndrMEp4QXlSMXZrYktrekhaZFhUekNmRmtjVzFlRjlTMmlOdVlu?=
 =?utf-8?B?YVlwcmZycDIrRVY2OTJSTGJlMEhmQm1zbmhZRzNkY25PeHJTaW5BOTBITEZD?=
 =?utf-8?B?c25DNjUxQm1sMGZxclNDRVdOVlpCVnYzYjh3V3VVUzVsYWdndkQ1a0xwWkdz?=
 =?utf-8?B?NXludnhHb1VaVDJCZ01wb0IwUll5S2J1T1NZWktacXZib2dPTlA2ZW1Jbk4v?=
 =?utf-8?B?YURubkVaTEJuWlZVbFJWaXg2cU5VcmhVUzBuZll6Rk1rcDdkTUtzNmFQZFU0?=
 =?utf-8?B?dVd5R1RudWhkN3kzRmxKdWxEUjlGK3FDbi9zenR6OWliTUxpcnVadWRjc1JV?=
 =?utf-8?B?bnBrNDdJdVZTU1BkNGM1ZU1pNnBvNWI2QnhQc01rSk9xU1hjY1FmWWY1aWtt?=
 =?utf-8?B?bk1ibHprV2RLSFpTa2Fsb0MzRWNhTEt2RUtBZkxIVmVoMW9WVnh4UnE2WGpi?=
 =?utf-8?B?aHZiSUZVMURuZnJ0b3I5dndhUFZQSmlnVytLM2l3ZXFvaTVQdzdRRzNic1dq?=
 =?utf-8?B?aURwMmVFS3RoWDVRdjlhNzkyOGp2QWVETC95OXI0eml6RmxCdTI0QnByUGpK?=
 =?utf-8?B?T0JRY1JRVUliVktkanZySXlLZ29ycWFqMUlpUUJINjZGUkR4RlJKVjdJZ3Zk?=
 =?utf-8?B?b0hGRmswTHRZcjRHVTFCdEtkL09NKzlEWU0ramtkQmdyQS9FWmlYUHAxUmh4?=
 =?utf-8?B?TExIU3g2WHFyNERha21OR04xaW1LMUZEd3VVWGZCS0VUUmw2YWo1b3R0aUhl?=
 =?utf-8?B?cmVQY1BvWmRXSmJSRktZTmdTRzZ6Zzg1bWp0NFlrMlZQUXk4UlFsZ2tybEpG?=
 =?utf-8?B?V1VnVVNldzlIVFhMUW1VSEh6TmNvdW5vbHhaTU1Ia0IyN085ZmhQVkRqNlBk?=
 =?utf-8?B?OStlUjFYbHhNYTJ6eGc0S0tndGtzNlZWMlhRdjV6TXpkU0d1M0l6K2dHNTl5?=
 =?utf-8?B?aWVMSEkwK0dDYjRNQ3V3cFJ4dTBpOU9CTXVvZFdsKzY2dWhMUDVxSFp3Tkx5?=
 =?utf-8?B?RUZpNE5Nd3Q4cE16OU4wUEliMzVuQkNrZGYwZ1R5VlJiVGlzTGRnZkNmcTE0?=
 =?utf-8?B?Z2tSSkMrbHlSL2Eyem5Odk83UG9ZSmFKMmE0Y0kzazNmbUF4ZWxwWE9DNDJV?=
 =?utf-8?B?V1ltRXM1U1NRSmVYZ0RNbW1ydENDcUJUNTBRMXF5SlJyOXBEU3drZHhKbFBZ?=
 =?utf-8?B?dnJZVUttbGNqclNLRm5UZW9pRVY1dWEwNkNQZytIeFFTQVZBSnc4WlYrdFJo?=
 =?utf-8?B?Y2FtZXhsNFNmQ0FLQUhrbVJoWUlhNm5YbGdJSGNvaHhPOTFTMmFpK2hSYW9z?=
 =?utf-8?B?bWtaKzFrZUZjZXVnYWVTcDJZVlBRdlZlWDY2d293STJjU0ZuRVRGWnJURERj?=
 =?utf-8?B?RGZubGMzRHE3YU5nd0h1T2NVQjRkVTlacUp3NzlZVjJNWkZYWXoyZFFvdjB6?=
 =?utf-8?B?c3JNVjlzQ0dDRjF2OWluclNVblJxYUlkbWxsQ1RpUVo3N25uNVA3dllHQ1ZW?=
 =?utf-8?B?VXJzSXRwRkxOMDU3WnQxcnBheTlVd1l2dkR4eVFEanFTdkpXVk5tRzArWFBz?=
 =?utf-8?Q?whu/mpNkD6FTmTZy8vRQOrIwlEys7a3M6KeybJhM7ru5E?=
X-MS-Exchange-AntiSpam-MessageData-1: pXudeYyTjej4Aw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ef8835-72ca-4f72-6aa4-08de4deade12
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 12:47:07.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTddMMj0coo3LLNhLM/ZTgf405Oz5pJEnLqGkJ/qa7aZZJW3KNG7KC+BgJb5neM1NVc/dZPsuExTJixNMraVjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9052


On 19/12/2025 11:43, Ketan Patil wrote:
> In Tegra264, different components from memory subsystems like Memory
> Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
> and MC Channels have different interrupt lines for receiving memory
> controller error interrupts.
> 
> Add support for logging memory controller errors on Tegra264.
> - Add MC error handling flow for MCF, HUB, HUBC, SBS and MC Channel.
> - Each of these components have different interrupt lines for MC error.
> - Register interrupt handlers for interrupts from these different MC
> components.
> - There is no global interrupt status register in Tegra264 unlike older
> Tegra chips.
> - There are common interrupt status registers in case of MCF, HUB, HUBC
> from which figure out the slice number or hub number responsible for
> generating interrupt and then read interrupt status register to find out
> type of violation.
> - Introduce new SoC specific fields in tegra_mc_soc like interrupt mask
> values for MCF, HUB, HUBC etc., which are SOC specific.
> 
> Signed-off-by: Ketan Patil <ketanp@nvidia.com>
> ---
>   drivers/memory/tegra/mc.c       |  49 +++-
>   drivers/memory/tegra/mc.h       |  78 +++++-
>   drivers/memory/tegra/tegra186.c |  10 +-
>   drivers/memory/tegra/tegra194.c |   2 +
>   drivers/memory/tegra/tegra20.c  |  10 +-
>   drivers/memory/tegra/tegra234.c |   2 +
>   drivers/memory/tegra/tegra264.c | 439 +++++++++++++++++++++++++++++++-
>   drivers/memory/tegra/tegra30.c  |   2 +
>   include/soc/tegra/mc.h          |   7 +
>   9 files changed, 569 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index 82a81ae3c50d..655f58cf59a2 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -606,7 +606,7 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>   		return IRQ_NONE;
>   
>   	for_each_set_bit(bit, &status, 32) {
> -		const char *error = tegra_mc_status_names[bit] ?: "unknown";
> +		const char *error = tegra20_mc_status_names[bit] ?: "unknown";
>   		const char *client = "unknown", *desc;
>   		const char *direction, *secure;
>   		u32 status_reg, addr_reg;
> @@ -671,7 +671,7 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>   					addr = mc_readl(mc, addr_hi_reg);
>   			} else {
>   				addr = ((value >> MC_ERR_STATUS_ADR_HI_SHIFT) &
> -					MC_ERR_STATUS_ADR_HI_MASK);
> +					mc->soc->mc_addr_hi_mask);
>   			}
>   			addr <<= 32;
>   		}
> @@ -696,11 +696,11 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>   			}
>   		}
>   
> -		type = (value & MC_ERR_STATUS_TYPE_MASK) >>
> +		type = (value & mc->soc->mc_err_status_type_mask) >>
>   		       MC_ERR_STATUS_TYPE_SHIFT;
> -		desc = tegra_mc_error_names[type];
> +		desc = tegra20_mc_error_names[type];
>   
> -		switch (value & MC_ERR_STATUS_TYPE_MASK) {
> +		switch (value & mc->soc->mc_err_status_type_mask) {
>   		case MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE:
>   			perm[0] = ' ';
>   			perm[1] = '[';
> @@ -753,7 +753,7 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>   	return IRQ_HANDLED;
>   }
>   
> -const char *const tegra_mc_status_names[32] = {
> +const char *const tegra20_mc_status_names[32] = {
>   	[ 1] = "External interrupt",
>   	[ 6] = "EMEM address decode error",
>   	[ 7] = "GART page fault",
> @@ -768,7 +768,7 @@ const char *const tegra_mc_status_names[32] = {
>   	[20] = "Route Sanity error",
>   };
>   
> -const char *const tegra_mc_error_names[8] = {
> +const char *const tegra20_mc_error_names[8] = {
>   	[2] = "EMEM decode error",
>   	[3] = "TrustZone violation",
>   	[4] = "Carveout violation",
> @@ -976,11 +976,36 @@ static int tegra_mc_probe(struct platform_device *pdev)
>   			}
>   		}
>   
> -		if (mc->soc->num_channels)
> -			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
> -				     MC_INTMASK);
> -		else
> -			mc_writel(mc, mc->soc->intmask, MC_INTMASK);
> +		if (mc->soc->ops->num_interrupts > 1) {
> +			/* Unmask MCF interrupts */
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->mcf_intmask, MCF_INTMASK_0);
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->mcf_intmask,
> +				MCF_INTPRIORITY_0);
> +
> +			/* Unmask HUB and HUBC interrupts */
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hub_intmask,
> +				MSS_HUB_INTRMASK_0);
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hub_intmask,
> +				MSS_HUB_INTRPRIORITY_0);
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hubc_intmask,
> +				MSS_HUB_HUBC_INTMASK_0);
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hubc_intmask,
> +				MSS_HUB_HUBC_INTPRIORITY_0);
> +
> +			/* Unmask SBS interrupts */
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->sbs_intmask,
> +				MSS_SBS_INTMASK_0);
> +
> +			/* Unmask MC channel interrupt */
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->mc_ch_intmask,
> +				MC_CH_INTMASK_0);
> +		} else {
> +			if (mc->soc->num_channels)
> +				mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
> +					MC_INTMASK);
> +			else
> +				mc_writel(mc, mc->soc->intmask, MC_INTMASK);
> +		}
>   	}
>   
>   	if (mc->soc->reset_ops) {
> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> index 06ae3dd37a47..fabbebf8a36c 100644
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -25,6 +25,7 @@
>   #define MC_INT_DECERR_MTS				BIT(16)
>   #define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
>   #define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
> +#define MC_INT_DECERR_ROUTE_SANITY_GIC_MSI		BIT(21)
>   
>   #define MC_INTMASK					0x04
>   #define MC_GART_ERROR_REQ				0x30
> @@ -63,6 +64,60 @@
>   
>   #define MC_GLOBAL_INTSTATUS				0xf24
>   
> +/* Registers for MSS HUB */
> +#define MSS_HUB_GLOBAL_INTSTATUS_0			0x6000
> +#define MSS_HUBC_INTR					BIT(0)

I assume that these new registers are only specific to Tegra264 devices. 
After adding these it is no longer clear what is specific to what 
device. I am wondering if we need a 'TEGRA264_' prefix for these? Even 
if a future device also uses these that is fine, it is quite common to 
have register with a prefix for the device where they were first added.

Furthermore, instead of removing the registers in patch 1/4, I wonder if 
we should rename the registers that have a different offset to Tegra264 
and prefix these with 'TEGRA20_'. This way we can have 3 register 
sections ...

1. MC_XXX --> for common registers
2. TEGRA20_MC_XXX --> for Tegra20 offsets
3. TEGRA264_MC_XXX --> for Tegra264 offsets

You can still use these definitions in the new tegra_mc_regs struct but 
it will be clear what is common and what is device specific.

> +
> +#define MSS_HUB_HUBC_INTSTATUS_0			0x6008
> +#define MSS_HUB_INTRSTATUS_0				0x600c
> +#define MSS_HUB_HUBC_INTMASK_0				0x6010
> +#define MSS_HUB_HUBC_SCRUB_DONE_INTMASK			BIT(0)
> +
> +#define MSS_HUB_HUBC_INTPRIORITY_0			0x6014
> +#define MSS_HUB_INTRMASK_0				0x6018
> +#define MSS_HUB_COALESCER_ERR_INTMASK			BIT(0)
> +#define MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK		BIT(1)
> +#define MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK		BIT(2)
> +#define MSS_HUB_MSI_ERR_INTMASK				BIT(3)
> +#define MSS_HUB_POISON_RSP_INTMASK			BIT(4)
> +#define MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK		BIT(5)
> +#define MSS_HUB_RESERVED_PA_ERR_INTMASK			BIT(6)
> +
> +#define MSS_HUB_INTRPRIORITY_0				0x601c
> +#define MSS_HUB_SMMU_BYPASS_ALLOW_ERR_STATUS_0		0x6020
> +#define MSS_HUB_MSI_ERR_STATUS_0			0x6024
> +#define MSS_HUB_POISON_RSP_STATUS_0			0x6028
> +#define MSS_HUB_COALESCE_ERR_STATUS_0			0x60e0
> +#define MSS_HUB_COALESCE_ERR_ADR_HI_0			0x60e4
> +#define MSS_HUB_COALESCE_ERR_ADR_0			0x60e8
> +#define MSS_HUB_RESTRICTED_ACCESS_ERR_STATUS_0		0x638c
> +#define MSS_HUB_RESERVED_PA_ERR_STATUS_0		0x6390
> +#define MSS_HUB_ILLEGAL_TBUGRP_ID_ERR_STATUS_0		0x63b0
> +
> +/* Registers for MC Channel */
> +#define MC_CH_INTSTATUS_0				0x82d4
> +#define MC_CH_INTMASK_0					0x82d8
> +#define WCAM_ERR_INTMASK				BIT(19)
> +
> +#define MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0		0xbc74
> +
> +/* Registers for MCF */
> +#define MCF_COMMON_INTSTATUS0_0_0			0xce04
> +#define MCF_INTSTATUS_0					0xce2c
> +#define MCF_INTMASK_0					0xce30
> +#define MCF_INTPRIORITY_0				0xce34
> +
> +/* Registers for SBS */
> +#define MSS_SBS_INTSTATUS_0				0xec08
> +#define MSS_SBS_INTMASK_0				0xec0c
> +#define MSS_SBS_FILL_FIFO_ISO_OVERFLOW_INTMASK		BIT(0)
> +#define MSS_SBS_FILL_FIFO_SISO_OVERFLOW_INTMASK		BIT(1)
> +#define MSS_SBS_FILL_FIFO_NISO_OVERFLOW_INTMASK		BIT(2)
> +
> +/* Bit field of MC_ERR_ROUTE_SANITY_STATUS_0 register */
> +#define MC_ERR_ROUTE_SANITY_RW				BIT(12)
> +#define MC_ERR_ROUTE_SANITY_SEC				BIT(13)
> +
>   /* Bit field of MC_ERR_STATUS_0 register */
>   #define MC_ERR_STATUS_RW				BIT(16)
>   #define MC_ERR_STATUS_SECURITY				BIT(17)
> @@ -70,12 +125,22 @@
>   #define MC_ERR_STATUS_WRITABLE				BIT(26)
>   #define MC_ERR_STATUS_READABLE				BIT(27)
>   
> +#define MC_ERR_STATUS_GSC_ADR_HI_MASK			0xffff
> +#define MC_ERR_STATUS_GSC_ADR_HI_SHIFT			16
> +#define MC_ERR_STATUS_RT_ADR_HI_SHIFT			15
> +
>   #define MC_ERR_STATUS_TYPE_SHIFT			28
>   #define MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE		(0x6 << 28)
>   #define MC_ERR_STATUS_TYPE_MASK				(0x7 << 28)
> +#define MC_ERR_STATUS_RT_TYPE_MASK			(0xf << 28)
> +#define MC_ERR_STATUS_RT_TYPE_SHIFT			28
>   
>   #define MC_ERR_STATUS_ADR_HI_SHIFT			20
> -#define MC_ERR_STATUS_ADR_HI_MASK			0x3
> +
> +#define ERR_GENERALIZED_APERTURE_ID_SHIFT		0
> +#define ERR_GENERALIZED_APERTURE_ID_MASK		0x1F
> +#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT	5
> +#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK	0x1F
>   
>   #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
>   #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
> @@ -188,15 +253,18 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
>   
>   #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
>       defined(CONFIG_ARCH_TEGRA_194_SOC) || \
> -    defined(CONFIG_ARCH_TEGRA_234_SOC) || \
> -    defined(CONFIG_ARCH_TEGRA_264_SOC)
> +    defined(CONFIG_ARCH_TEGRA_234_SOC)
>   extern const struct tegra_mc_ops tegra186_mc_ops;
>   #endif
>   
>   irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
>   extern const irq_handler_t tegra30_mc_irq_handlers[];
> -extern const char * const tegra_mc_status_names[32];
> -extern const char * const tegra_mc_error_names[8];
> +extern const char * const tegra20_mc_status_names[32];
> +extern const char * const tegra20_mc_error_names[8];
> +int tegra186_mc_probe(struct tegra_mc *mc);
> +int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev);
> +int tegra186_mc_resume(struct tegra_mc *mc);
> +void tegra186_mc_remove(struct tegra_mc *mc);
>   
>   /*
>    * These IDs are for internal use of Tegra ICC drivers. The ID numbers are
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
> index a3727fc383ac..f977a317d1e8 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -23,7 +23,7 @@
>   #define MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED BIT(16)
>   #define MC_SID_STREAMID_SECURITY_OVERRIDE BIT(8)
>   
> -static int tegra186_mc_probe(struct tegra_mc *mc)
> +int tegra186_mc_probe(struct tegra_mc *mc)
>   {
>   	struct platform_device *pdev = to_platform_device(mc->dev);
>   	struct resource *res;
> @@ -76,7 +76,7 @@ static int tegra186_mc_probe(struct tegra_mc *mc)
>   	return 0;
>   }
>   
> -static void tegra186_mc_remove(struct tegra_mc *mc)
> +void tegra186_mc_remove(struct tegra_mc *mc)
>   {
>   	of_platform_depopulate(mc->dev);
>   }
> @@ -124,7 +124,7 @@ static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
>   }
>   #endif
>   
> -static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
> +int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
>   {
>   #if IS_ENABLED(CONFIG_IOMMU_API)
>   	struct of_phandle_args args;
> @@ -154,7 +154,7 @@ static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
>   	return 0;
>   }
>   
> -static int tegra186_mc_resume(struct tegra_mc *mc)
> +int tegra186_mc_resume(struct tegra_mc *mc)
>   {
>   #if IS_ENABLED(CONFIG_IOMMU_API)
>   	unsigned int i;
> @@ -916,5 +916,7 @@ const struct tegra_mc_soc tegra186_mc_soc = {
>   	.ch_intmask = 0x0000000f,
>   	.global_intstatus_channel_shift = 0,
>   	.mc_regs = &tegra20_mc_regs,
> +	.mc_addr_hi_mask = 0x3,
> +	.mc_err_status_type_mask = (0x7 << 28),

Why not used the MC_ERR_STATUS_TYPE_MASK definition here?

>   };
>   #endif
> diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
> index fade258c0ea7..66916bf4b7d2 100644
> --- a/drivers/memory/tegra/tegra194.c
> +++ b/drivers/memory/tegra/tegra194.c
> @@ -1359,4 +1359,6 @@ const struct tegra_mc_soc tegra194_mc_soc = {
>   	.ch_intmask = 0x00000f00,
>   	.global_intstatus_channel_shift = 8,
>   	.mc_regs = &tegra20_mc_regs,
> +	.mc_addr_hi_mask = 0x3,
> +	.mc_err_status_type_mask = (0x7 << 28),

And here?

>   };
> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
> index 75eeb49054cc..1ecf98764297 100644
> --- a/drivers/memory/tegra/tegra20.c
> +++ b/drivers/memory/tegra/tegra20.c
> @@ -700,7 +700,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
>   		return IRQ_NONE;
>   
>   	for_each_set_bit(bit, &status, 32) {
> -		const char *error = tegra_mc_status_names[bit];
> +		const char *error = tegra20_mc_status_names[bit];
>   		const char *direction = "read", *secure = "";
>   		const char *client, *desc;
>   		phys_addr_t addr;
> @@ -713,7 +713,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
>   			value = mc_readl(mc, reg);
>   
>   			id = value & mc->soc->client_id_mask;
> -			desc = tegra_mc_error_names[2];
> +			desc = tegra20_mc_error_names[2];
>   
>   			if (value & BIT(31))
>   				direction = "write";
> @@ -724,7 +724,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
>   			value = mc_readl(mc, reg);
>   
>   			id = (value >> 1) & mc->soc->client_id_mask;
> -			desc = tegra_mc_error_names[2];
> +			desc = tegra20_mc_error_names[2];
>   
>   			if (value & BIT(0))
>   				direction = "write";
> @@ -736,7 +736,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
>   
>   			id = value & mc->soc->client_id_mask;
>   			type = (value & BIT(30)) ? 4 : 3;
> -			desc = tegra_mc_error_names[type];
> +			desc = tegra20_mc_error_names[type];
>   			secure = "secure ";
>   
>   			if (value & BIT(31))
> @@ -784,4 +784,6 @@ const struct tegra_mc_soc tegra20_mc_soc = {
>   	.icc_ops = &tegra20_mc_icc_ops,
>   	.ops = &tegra20_mc_ops,
>   	.mc_regs = &tegra20_mc_regs,
> +	.mc_addr_hi_mask = 0x3,
> +	.mc_err_status_type_mask = (0x7 << 28),

And here.

>   };
> diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
> index 23276f622aab..1f5a5e13e4ab 100644
> --- a/drivers/memory/tegra/tegra234.c
> +++ b/drivers/memory/tegra/tegra234.c
> @@ -1153,4 +1153,6 @@ const struct tegra_mc_soc tegra234_mc_soc = {
>   	 */
>   	.num_carveouts = 32,
>   	.mc_regs = &tegra20_mc_regs,
> +	.mc_addr_hi_mask = 0x3,
> +	.mc_err_status_type_mask = (0x7 << 28),

And here.

>   };
> diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
> index 5203e6c11372..1aa023110ee7 100644
> --- a/drivers/memory/tegra/tegra264.c
> +++ b/drivers/memory/tegra/tegra264.c
> @@ -188,6 +188,52 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
>   	},
>   };
>   
> +static const char *const tegra264_mc_status_names[32] = {
> +	[6] = "EMEM address decode error",
> +	[8] = "Security violation",
> +	[12] = "VPR violation",
> +	[13] = "Secure carveout violation",
> +	[16] = "MTS carveout violation",
> +	[17] = "Generalized carveout violation",
> +	[20] = "Route Sanity error",
> +	[21] = "GIC_MSI error",
> +};
> +
> +static const char *const tegra_hub_status_names[32] = {
> +	[0] = "coalescer error",
> +	[1] = "SMMU BYPASS ALLOW error",
> +	[2] = "Illegal tbugrp_id error",
> +	[3] = "Malformed MSI request error",
> +	[4] = "Read response with poison bit error",
> +	[5] = "Restricted access violation error",
> +	[6] = "Reserved PA error",
> +};
> +
> +static const char *const tegra264_mc_error_names[4] = {
> +	[1] = "EMEM decode error",
> +	[2] = "TrustZone violation",
> +	[3] = "Carveout violation",
> +};
> +
> +static const char *const tegra_rt_error_names[16] = {
> +	[1] = "DECERR_PARTIAL_POPULATED",
> +	[2] = "DECERR_SMMU_BYPASS",
> +	[3] = "DECERR_INVALID_MMIO",
> +	[4] = "DECERR_INVALID_GIC_MSI",
> +	[5] = "DECERR_ATOMIC_SYSRAM",
> +	[9] = "DECERR_REMOTE_REQ_PRE_BOOT",
> +	[10] = "DECERR_ISO_OVER_C2C",
> +	[11] = "DECERR_UNSUPPORTED_SBS_OPCODE",
> +	[12] = "DECERR_SBS_REQ_OVER_SISO_LL",
> +};
> +
> +/*
> + * MC instance aperture mapping for hubc registers
> + */
> +static const int mc_hubc_aperture_number[5] = {
> +	7, 8, 9, 10, 11
> +};
> +
>   /*
>    * tegra264_mc_icc_set() - Pass MC client info to the BPMP-FW
>    * @src: ICC node for Memory Controller's (MC) Client
> @@ -283,6 +329,359 @@ static int tegra264_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *pea
>   	return 0;
>   }
>   
> +static void mcf_log_fault(struct tegra_mc *mc, u32 channel, unsigned long mcf_ch_intstatus)
> +{
> +	unsigned int bit;
> +
> +	for_each_set_bit(bit, &mcf_ch_intstatus, 32) {
> +		const char *error = tegra264_mc_status_names[bit] ?: "unknown";
> +		u32 intmask = BIT(bit);
> +		u32 status_reg, status1_reg = 0, addr_reg, addr_hi_reg = 0;
> +		u32 addr_val, value, client_id, i, addr_hi_shift = 0, addr_hi_mask = 0, status1;
> +		const char *direction, *secure;
> +		const char *client = "unknown", *desc = "NA";
> +		phys_addr_t addr = 0;
> +		bool is_gsc = false, err_type_valid = false, err_rt_type_valid = false;
> +		u8 type;
> +		u32 mc_rw_bit = MC_ERR_STATUS_RW, mc_sec_bit = MC_ERR_STATUS_SECURITY;

There are a lot of variables here. Do we really need all these? Surely 
we can get rid of mc_rw_bit and mc_sec_bit and use the definitions 
directly? And ...

> +
> +		switch (intmask) {

intmask is only used here, so why not just have ...

  switch (BIT(bit))

> +		case MC_INT_DECERR_EMEM:
> +			status_reg = mc->soc->mc_regs->mc_err_status;
> +			addr_reg = mc->soc->mc_regs->mc_err_add;
> +			addr_hi_reg = mc->soc->mc_regs->mc_err_add_hi;
> +			err_type_valid = true;
> +			break;
> +
> +		case MC_INT_SECURITY_VIOLATION:
> +			status_reg = mc->soc->mc_regs->mc_err_status;
> +			addr_reg = mc->soc->mc_regs->mc_err_add;
> +			addr_hi_reg = mc->soc->mc_regs->mc_err_add_hi;
> +			err_type_valid = true;
> +			break;
> +
> +		case MC_INT_DECERR_VPR:
> +			status_reg = mc->soc->mc_regs->mc_err_vpr_status;
> +			addr_reg = mc->soc->mc_regs->mc_err_vpr_add;
> +			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
> +			addr_hi_mask = mc->soc->mc_addr_hi_mask;
> +			break;
> +
> +		case MC_INT_SECERR_SEC:
> +			status_reg = mc->soc->mc_regs->mc_err_sec_status;
> +			addr_reg = mc->soc->mc_regs->mc_err_sec_add;
> +			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
> +			addr_hi_mask = mc->soc->mc_addr_hi_mask;
> +			break;
> +
> +		case MC_INT_DECERR_MTS:
> +			status_reg = mc->soc->mc_regs->mc_err_mts_status;
> +			addr_reg = mc->soc->mc_regs->mc_err_mts_add;
> +			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
> +			addr_hi_mask = mc->soc->mc_addr_hi_mask;
> +			break;
> +
> +		case MC_INT_DECERR_GENERALIZED_CARVEOUT:
> +			status_reg = mc->soc->mc_regs->mc_err_gen_co_status;
> +			status1_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0;
> +			addr_reg = mc->soc->mc_regs->mc_err_gen_co_add;
> +			addr_hi_shift = MC_ERR_STATUS_GSC_ADR_HI_SHIFT;
> +			addr_hi_mask = MC_ERR_STATUS_GSC_ADR_HI_MASK;
> +			is_gsc = true;
> +			break;
> +
> +		case MC_INT_DECERR_ROUTE_SANITY:
> +			status_reg = mc->soc->mc_regs->mc_err_route_status;
> +			addr_reg = mc->soc->mc_regs->mc_err_route_add;
> +			addr_hi_shift = MC_ERR_STATUS_RT_ADR_HI_SHIFT;
> +			addr_hi_mask = mc->soc->mc_addr_hi_mask;
> +			mc_sec_bit = MC_ERR_ROUTE_SANITY_SEC;
> +			mc_rw_bit = MC_ERR_ROUTE_SANITY_RW;
> +			err_rt_type_valid = true;
> +			break;
> +
> +		case MC_INT_DECERR_ROUTE_SANITY_GIC_MSI:
> +			status_reg = mc->soc->mc_regs->mc_err_route_status;
> +			addr_reg = mc->soc->mc_regs->mc_err_route_add;
> +			addr_hi_shift = MC_ERR_STATUS_RT_ADR_HI_SHIFT;
> +			addr_hi_mask = mc->soc->mc_addr_hi_mask;
> +			mc_sec_bit = MC_ERR_ROUTE_SANITY_SEC;
> +			mc_rw_bit = MC_ERR_ROUTE_SANITY_RW;
> +			err_rt_type_valid = true;
> +			break;
> +
> +		default:
> +			dev_err_ratelimited(mc->dev, "Incorrect MC interrupt mask\n");
> +			return;
> +		}
> +
> +		value = mc_ch_readl(mc, channel, status_reg);
> +		if (addr_hi_reg) {
> +			addr = mc_ch_readl(mc, channel, addr_hi_reg);
> +		} else {
> +			if (!is_gsc) {
> +				addr = ((value >> addr_hi_shift) & addr_hi_mask);
> +			} else {
> +				status1 = mc_ch_readl(mc, channel, status1_reg);
> +				addr = ((status1 >> addr_hi_shift) & addr_hi_mask);
> +			}
> +		}
> +
> +		addr <<= 32;
> +		addr_val = mc_ch_readl(mc, channel, addr_reg);
> +		addr |= addr_val;

Similarly addr_val only appears to be used in these sections, so why not ...

  addr <<= 32;
  addr |= mc_ch_readl(mc, channel, addr_reg);

> +
> +		if (value & mc_rw_bit)
> +			direction = "write";
> +		else
> +			direction = "read";
> +
> +		if (value & mc_sec_bit)
> +			secure = "secure";
> +		else
> +			secure = "non-secure";

I would be tempted to get rid of these and just ...

> +
> +		client_id = value & mc->soc->client_id_mask;
> +		for (i = 0; i < mc->soc->num_clients; i++) {
> +			if (mc->soc->clients[i].id == client_id) {
> +				client = mc->soc->clients[i].name;
> +				break;
> +			}
> +		}
> +
> +		if (err_type_valid) {
> +			type = (value & mc->soc->mc_err_status_type_mask) >>
> +					MC_ERR_STATUS_TYPE_SHIFT;
> +			desc = tegra264_mc_error_names[type];
> +		} else if (err_rt_type_valid) {
> +			type = (value & MC_ERR_STATUS_RT_TYPE_MASK) >>
> +				MC_ERR_STATUS_RT_TYPE_SHIFT;
> +			desc = tegra_rt_error_names[type];
> +		}
> +
> +		dev_err_ratelimited(mc->dev, "%s: %s %s @%pa: %s (%s)\n",
> +				    client, secure, direction, &addr, error, desc);

  dev_err_ratelimited(mc->dev, "%s: %s %s @%pa: %s (%s)\n", client,
          value & mc_sec_bit ? "secure" : "non-secure",
          value & mc_rw_bit ? "write" : "read",
          &addr, error, desc);

> +		if (is_gsc) {
> +			dev_err_ratelimited(mc->dev, "gsc_apr_id=%u gsc_co_apr_id=%u\n",
> +					    ((status1 >> ERR_GENERALIZED_APERTURE_ID_SHIFT)
> +					    & ERR_GENERALIZED_APERTURE_ID_MASK),
> +					    ((status1 >> ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT)
> +					    & ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK));
> +		}
> +	}
> +
> +	/* clear interrupts */
> +	mc_ch_writel(mc, channel, mcf_ch_intstatus, MCF_INTSTATUS_0);
> +}
> +
> +static irqreturn_t handle_mcf_irq(int irq, void *data)
> +{
> +	struct tegra_mc *mc = data;
> +	unsigned long mcf_common_intstat, mcf_intstatus;
> +	unsigned int slice;
> +
> +	/* Read MCF_COMMON_INTSTATUS0_0_0 from MCB block */
> +	mcf_common_intstat = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, MCF_COMMON_INTSTATUS0_0_0);
> +	if (mcf_common_intstat == 0) {
> +		dev_err(mc->dev, "No interrupt in MCF\n");
> +		return IRQ_NONE;
> +	}
> +
> +	for_each_set_bit(slice, &mcf_common_intstat, 32) {
> +		/* Find out the slice number on which interrupt occurred */
> +		if (slice > 4) {
> +			dev_err(mc->dev, "Invalid value in registeer MCF_COMMON_INTSTATUS0_0_0\n");
> +			return IRQ_NONE;
> +		}
> +
> +		mcf_intstatus = mc_ch_readl(mc, slice, MCF_INTSTATUS_0);
> +		if (mcf_intstatus != 0)
> +			mcf_log_fault(mc, slice, mcf_intstatus);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void hub_log_fault(struct tegra_mc *mc, u32 hub, unsigned long hub_intstat)
> +{
> +	unsigned int bit;
> +
> +	for_each_set_bit(bit, &hub_intstat, 32) {
> +		const char *error = tegra_hub_status_names[bit] ?: "unknown";
> +		u32 intmask = BIT(bit), client_id;
> +		const char *client = "unknown";
> +		u32 status_reg, addr_reg = 0, addr_hi_reg = 0;
> +		u32 value, addr_val, i;
> +		phys_addr_t addr = 0;
> +
> +		switch (intmask) {
> +		case MSS_HUB_COALESCER_ERR_INTMASK:
> +			status_reg = MSS_HUB_COALESCE_ERR_STATUS_0;
> +			addr_reg = MSS_HUB_COALESCE_ERR_ADR_0;
> +			addr_hi_reg = MSS_HUB_COALESCE_ERR_ADR_HI_0;
> +			break;
> +
> +		case MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK:
> +			status_reg = MSS_HUB_SMMU_BYPASS_ALLOW_ERR_STATUS_0;
> +			break;
> +
> +		case MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK:
> +			status_reg = MSS_HUB_ILLEGAL_TBUGRP_ID_ERR_STATUS_0;
> +			break;
> +
> +		case MSS_HUB_MSI_ERR_INTMASK:
> +			status_reg = MSS_HUB_MSI_ERR_STATUS_0;
> +			break;
> +
> +		case MSS_HUB_POISON_RSP_INTMASK:
> +			status_reg = MSS_HUB_POISON_RSP_STATUS_0;
> +			break;
> +
> +		case MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK:
> +			status_reg = MSS_HUB_RESTRICTED_ACCESS_ERR_STATUS_0;
> +			break;
> +
> +		case MSS_HUB_RESERVED_PA_ERR_INTMASK:
> +			status_reg = MSS_HUB_RESERVED_PA_ERR_STATUS_0;
> +			break;
> +
> +		default:
> +			dev_err_ratelimited(mc->dev, "Incorrect HUB interrupt mask\n");
> +			return;
> +		}
> +
> +		value = mc_ch_readl(mc, hub, status_reg);
> +		if (addr_reg) {
> +			addr = mc_ch_readl(mc, hub, addr_hi_reg);
> +			addr <<= 32;
> +			addr_val = mc_ch_readl(mc, hub, addr_reg);
> +			addr |= addr_val;

I don't see the need for addr_val.

> +		}
> +
> +		client_id = value & mc->soc->client_id_mask;
> +		for (i = 0; i < mc->soc->num_clients; i++) {
> +			if (mc->soc->clients[i].id == client_id) {
> +				client = mc->soc->clients[i].name;
> +				break;
> +			}
> +		}
> +
> +		dev_err_ratelimited(mc->dev, "%s: @%pa: %s status:%u\n",
> +				    client, &addr, error, value);
> +	}
> +
> +	/* clear interrupts */
> +	mc_ch_writel(mc, hub, hub_intstat, MSS_HUB_INTRSTATUS_0);
> +}
> +
> +static irqreturn_t handle_hub_irq(int irq, void *data, int mc_hubc_aperture_number)
> +{
> +	struct tegra_mc *mc = data;
> +	unsigned long hub_global_intstat, hub_intstat, hub_interrupted = 0;
> +	unsigned int hub_global_mask = 0x7F00, hub_global_shift = 8, hub;
> +
> +	/* Read MSS_HUB_GLOBAL_INTSTATUS_0 from mc_hubc_aperture_number block */
> +	hub_global_intstat = mc_ch_readl(mc, mc_hubc_aperture_number, MSS_HUB_GLOBAL_INTSTATUS_0);

mc_ch_readl returns a type u32 but hub_global_intstat is a ulong. We 
only need a u32 type.

> +	if (hub_global_intstat == 0) {
> +		dev_err(mc->dev, "No interrupt in HUB/HUBC\n");
> +		return IRQ_NONE;
> +	}
> +
> +	/* Handle interrupt from hubc */
> +	if (hub_global_intstat & MSS_HUBC_INTR) {
> +		/* Read MSS_HUB_HUBC_INTSTATUS_0 from block mc_hubc_aperture_number */
> +		hub_intstat = mc_ch_readl(mc, mc_hubc_aperture_number, MSS_HUB_HUBC_INTSTATUS_0);
> +		if (hub_intstat != 0) {
> +			dev_err_ratelimited(mc->dev, "Scrubber operation status:%lu\n",
> +					    hub_intstat);
> +			/* Clear hubc interrupt */
> +			mc_ch_writel(mc, mc_hubc_aperture_number, hub_intstat,
> +				     MSS_HUB_HUBC_INTSTATUS_0);
> +		}
> +	}
> +
> +	hub_interrupted = (hub_global_intstat & hub_global_mask) >> hub_global_shift;

Should hub_global_mask and hub_global_shift just be definitions rather 
can variables?

> +	/* Handle interrupt from hub */
> +	for_each_set_bit(hub, &hub_interrupted, 32) {
> +		/* Read MSS_HUB_INTRSTATUS_0 from block MCi */
> +		hub_intstat = mc_ch_readl(mc, hub, MSS_HUB_INTRSTATUS_0);
> +		if (hub_intstat != 0)
> +			hub_log_fault(mc, hub, hub_intstat);
> +	}
> +
> +	/* Clear global interrupt status register */
> +	mc_ch_writel(mc, mc_hubc_aperture_number, hub_global_intstat, MSS_HUB_GLOBAL_INTSTATUS_0);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t handle_disp_hub_irq(int irq, void *data)
> +{
> +	return handle_hub_irq(irq, data, mc_hubc_aperture_number[0]);
> +}
> +
> +static irqreturn_t handle_system_hub_irq(int irq, void *data)
> +{
> +	return handle_hub_irq(irq, data, mc_hubc_aperture_number[1]);
> +}
> +
> +static irqreturn_t handle_vision_hub_irq(int irq, void *data)
> +{
> +	return handle_hub_irq(irq, data, mc_hubc_aperture_number[2]);
> +}
> +
> +static irqreturn_t handle_uphy_hub_irq(int irq, void *data)
> +{
> +	return handle_hub_irq(irq, data, mc_hubc_aperture_number[3]);
> +}
> +
> +static irqreturn_t handle_top_hub_irq(int irq, void *data)
> +{
> +	return handle_hub_irq(irq, data, mc_hubc_aperture_number[4]);
> +}
> +
> +static irqreturn_t handle_generic_irq(struct tegra_mc *mc, unsigned long intstat_reg)
> +{
> +	unsigned long intstat;
> +	unsigned int i;
> +
> +	/* Iterate over all MC blocks to read INTSTATUS */
> +	for (i = 0; i < mc->num_channels; i++) {
> +		intstat = mc_ch_readl(mc, i, intstat_reg);
> +		if (intstat) {
> +			dev_err_ratelimited(mc->dev, "channel:%i status:%lu\n", i, intstat);
> +			/* Clear interrupt */
> +			mc_ch_writel(mc, i, intstat, intstat_reg);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t handle_sbs_irq(int irq, void *data)
> +{
> +	return handle_generic_irq((struct tegra_mc *)data, MSS_SBS_INTSTATUS_0);
> +}
> +
> +static irqreturn_t handle_channel_irq(int irq, void *data)
> +{
> +	return handle_generic_irq((struct tegra_mc *)data, MC_CH_INTSTATUS_0);
> +}
> +
> +static const irq_handler_t tegra264_mc_irq_handlers[8] = {
> +	handle_mcf_irq, handle_disp_hub_irq, handle_vision_hub_irq,
> +	handle_system_hub_irq, handle_uphy_hub_irq, handle_top_hub_irq,
> +	handle_sbs_irq, handle_channel_irq
> +};
> +
> +static const struct tegra_mc_ops tegra264_mc_ops = {
> +	.probe = tegra186_mc_probe,
> +	.remove = tegra186_mc_remove,
> +	.probe_device = tegra186_mc_probe_device,
> +	.resume = tegra186_mc_resume,
> +	.handle_irq = tegra264_mc_irq_handlers,
> +	.num_interrupts = ARRAY_SIZE(tegra264_mc_irq_handlers),
> +};
> +
>   static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
>   	.xlate = tegra_mc_icc_xlate,
>   	.aggregate = tegra264_mc_icc_aggregate,
> @@ -290,18 +689,31 @@ static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
>   	.set = tegra264_mc_icc_set,
>   };
>   
> +static const struct tegra_mc_regs tegra264_mc_regs = {
> +	.mc_cfg_channel_enable = 0x8870,
> +	.mc_err_status = 0xbc00,
> +	.mc_err_add = 0xbc04,
> +	.mc_err_add_hi = 0xbc08,
> +	.mc_err_vpr_status = 0xbc20,
> +	.mc_err_vpr_add = 0xbc24,
> +	.mc_err_sec_status = 0xbc3c,
> +	.mc_err_sec_add = 0xbc40,
> +	.mc_err_mts_status = 0xbc5c,
> +	.mc_err_mts_add = 0xbc60,
> +	.mc_err_gen_co_status = 0xbc78,
> +	.mc_err_gen_co_add = 0xbc7c,
> +	.mc_err_route_status = 0xbc64,
> +	.mc_err_route_add = 0xbc68,
> +};
> +
>   const struct tegra_mc_soc tegra264_mc_soc = {
>   	.num_clients = ARRAY_SIZE(tegra264_mc_clients),
>   	.clients = tegra264_mc_clients,
>   	.num_address_bits = 40,
>   	.num_channels = 16,
>   	.client_id_mask = 0x1ff,
> -	.intmask = MC_INT_DECERR_ROUTE_SANITY |
> -		   MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
> -		   MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
> -		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
>   	.has_addr_hi_reg = true,
> -	.ops = &tegra186_mc_ops,
> +	.ops = &tegra264_mc_ops,
>   	.icc_ops = &tegra264_mc_icc_ops,
>   	.ch_intmask = 0x0000ff00,
>   	.global_intstatus_channel_shift = 8,
> @@ -310,4 +722,21 @@ const struct tegra_mc_soc tegra264_mc_soc = {
>   	 * supported.
>   	 */
>   	.num_carveouts = 32,
> +	.mc_regs = &tegra264_mc_regs,
> +	.mc_addr_hi_mask = 0xff,
> +	.mc_err_status_type_mask = (0x3 << 28),

We should use the definition added.

> +	.mcf_intmask = MC_INT_DECERR_ROUTE_SANITY_GIC_MSI |
> +			MC_INT_DECERR_ROUTE_SANITY |
> +			MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
> +			MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
> +			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
> +	.hub_intmask = MSS_HUB_COALESCER_ERR_INTMASK | MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK |
> +			MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK | MSS_HUB_MSI_ERR_INTMASK |
> +			MSS_HUB_POISON_RSP_INTMASK | MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK |
> +			MSS_HUB_RESERVED_PA_ERR_INTMASK,
> +	.hubc_intmask = MSS_HUB_HUBC_SCRUB_DONE_INTMASK,
> +	.sbs_intmask = MSS_SBS_FILL_FIFO_ISO_OVERFLOW_INTMASK |
> +			MSS_SBS_FILL_FIFO_SISO_OVERFLOW_INTMASK |
> +			MSS_SBS_FILL_FIFO_NISO_OVERFLOW_INTMASK,
> +	.mc_ch_intmask = WCAM_ERR_INTMASK,
>   };
> diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
> index f22febcbee59..bae473527a57 100644
> --- a/drivers/memory/tegra/tegra30.c
> +++ b/drivers/memory/tegra/tegra30.c
> @@ -1401,4 +1401,6 @@ const struct tegra_mc_soc tegra30_mc_soc = {
>   	.icc_ops = &tegra30_mc_icc_ops,
>   	.ops = &tegra30_mc_ops,
>   	.mc_regs = &tegra20_mc_regs,
> +	.mc_addr_hi_mask = 0x3,
> +	.mc_err_status_type_mask = (0x7 << 28),
>   };
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index 4a2cadbc0084..61943a3e6249 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -216,6 +216,13 @@ struct tegra_mc_soc {
>   	const struct tegra_mc_icc_ops *icc_ops;
>   	const struct tegra_mc_ops *ops;
>   	const struct tegra_mc_regs *mc_regs;
> +	unsigned int mc_addr_hi_mask;
> +	unsigned int mc_err_status_type_mask;
> +	u32 mcf_intmask;
> +	u32 hub_intmask;
> +	u32 hubc_intmask;
> +	u32 sbs_intmask;
> +	u32 mc_ch_intmask;

So now we have a u32 intmask in tegra_mc_soc and the above which have 
been added for Tegra264. Given that the above are only used for 
Tegra264, why not make the existing 'intmask' an array and the size of 
which can be adjust accordingly for each device?

Jon

-- 
nvpublic

