Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013040.outbound.protection.outlook.com [40.93.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED278312830;
	Wed, 10 Dec 2025 15:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765379046; cv=fail; b=okOvc9ShwSiwOw12Bg0GX/rhaii6EonpC19btw99FuPjI0WerT8eTlrSBWM2AKSxc8io8zE7gBTLJDejz0jzk0Wy7FcYBtPbOBFnfYVFNj4maAGvcjC8qyOc7+dD8URU/fpEkaM+angEgBgKFdj3v7vXcekr/YxRaTmn7C09U8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765379046; c=relaxed/simple;
	bh=xkjcC9dpKoQ5LMZLTVXMcivg32SYjhILbp7ykmMlU/c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dsnLQ/yWpoRW8oBaviX9T11d+VA32ZJ58uoVAKnkcEvGM1XX2t31TyioYkmLbaVZlFdtevCrEJEiiNG11NYj4s7+gje58RzNWJKm3CEAf68iaf+M9ziHQFTRMzYurWzsTD7Meuq+kY30PQ3Er3AH+VN/l3E6qInT15Mbv4E7hHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ox0QGGMx; arc=fail smtp.client-ip=40.93.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ox0QGGMx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wq7VMGFl70pLRDk47femqEZWwmFdVX1Jg2ZvUddgHnJtfMDr0Xna+S6Ris1Ceap6y394j770HGCJbSG5bPnOUfEb5HBWHAsNWFzc5TZmArAKrTozW0v5MomWf8XyugIKbJ6Qu9se0ydvkJEpDPrCpfvXFr6hsoH3A1XZCNV9UaZe5thwZzKxGjf5JawEhSfg63o3Xy5MrUYho6nF5Kn1mNzugRRJE4rXE72jOC2BiONjmn/DYJp5AaJ8q9ptRSs5BA5yRZMDjrZqOpM2gnT3nFWu65GthNrfN1RveQrMxVECJ8xOkCQv1n6V34296ggSUKf/FRY3C2cIoc08sPxbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6fExj8vWs7+Ffg0LsxNWnGiMThOq/UsR/81DNy/rDg=;
 b=WmyYRksyQwMCzP4sOkteXUwlWZE7pLo5Zn3uHBKcGo8/yoDzueGIM75CzZ+4hXw+u+hgz2dVLyhQsTYub8+7WGmcBE0I6Ur44QxW+TP9fv+aqajOkAUsBNBkJiSZmKrczho9efXmIVIAWOyV/8uxquz3PExdwArlzBBnrvbGSNjk0pupl9iqSCvrIQQ3DS17PslXv9tgVFguUrUL1AiQogWuz7v8znxeL5lcdQFmsqbz9POuoIcu4dr14EdaCmaFdZmUBB5LaKDbtVoWkH1nv+rx6+dhFIuPrmxd59EJixaWxfw9F8eWnIE53vrDvFgpK559/d5cStFtWDy3hkPHFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6fExj8vWs7+Ffg0LsxNWnGiMThOq/UsR/81DNy/rDg=;
 b=Ox0QGGMxqz3oi2kT/S6Hj9fVr/wlAzDdd4p0pgF1eTuLg51RweuSV4Vp2s5jLwNXlOCoyN6LJLUyxCn/kAplK0UkcxJWImoeFW2g6gWihHn3j1hgHvdzwj+wj7u84awXxYeEBcw+x8NjxF9azQqRepW/lvXYIdngOF+mwu22S+53nSVTFdoErPw4F4bYrc5HZK/thWB9bkjh/qs4rV/Q8iIrrEMn4Dc49rqzu9H2Qu1izGByxWAFEywzL2vQrI3lTj4BwxKCmPOhTpO5oRT6mbJiGAjWvBFOOHDw+m//LH7cO6AKv5tvkOaYIIBWa+qyqcS7WWlvrlRtg9s10qQHjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM4PR12MB5793.namprd12.prod.outlook.com (2603:10b6:8:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:03:58 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:03:58 +0000
Message-ID: <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com>
Date: Wed, 10 Dec 2025 15:03:50 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com>
 <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
 <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
 <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
 <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com>
 <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com>
 <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU0P306CA0026.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:16::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM4PR12MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5a1dcf-e523-4bed-9e26-08de37fd5844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODV4LzVSdHB1SWoyVitQTGN1a0x2TU42Ry9KUEU4dkVXY0txdHhnMGNKZzdS?=
 =?utf-8?B?TTZvSXVhSG82STdDb1l2NUhVdDdORUovcG83TnZBYVFwcGhucEtqaDcwRHhy?=
 =?utf-8?B?cTFObEFMaExlSHBKQWh4WTI0RkZvblZsUlRCNWpBU0dCV1lyNE5TQ294RmQ2?=
 =?utf-8?B?aGQxZk9kY1QxWUV4OGhMSVdaQmhtMVVQNmtlencrZTY3Z0dnblMrODB4bzJF?=
 =?utf-8?B?ZWhCMHFWaWZ2YytoR1gyc2RUMUsyQlEzR3BJN3ZwNVBNWnh1QnBwV3ExSkVX?=
 =?utf-8?B?SVpoNGtobHVRMFczaUJhSFk3Smd4SHh2M2VCSEFXUFVKZXZVYVQ5RDIyL2Jz?=
 =?utf-8?B?c2p1QWE1UUtVd1VNQ3J3aFFMMTVGSnZOVFZjbWJ6UXdsaXNIZjJrVTVWQ290?=
 =?utf-8?B?MnZsOEFzR2VsWmVBamxoMnBCU0crVnlsMkc2amFNTlVNTCtIb2VDa01IMVVj?=
 =?utf-8?B?L21WWjdSOGg3TnFnNlZFdXltZS8rMVAzRkp5VER2N3pDOE9IdWRDcHgwV2Z1?=
 =?utf-8?B?K1ozZnJtWG5XVStmYndQY3ZGRTI3c1ppU2hpc2Z6ZGF1YzJxalZ1QllHaWt2?=
 =?utf-8?B?a3hvc0ZQa3phU3JLNUtSVEozYzFWN1BtOW9PbVNZdk5ESzZOWkUwMmlOZ0F4?=
 =?utf-8?B?ZVZ4eXpNV3U2SG1qeGwrR3ZRemZNNVZ3NlFHbTdZN2h2YkJpVFpIRy9IaUl4?=
 =?utf-8?B?MytNdDhhOVNGYUsxNHVXTlVrZzIzb3JWLzZ4cDFNQmxOWlVzdEl5S29MZUc5?=
 =?utf-8?B?V0JQUFY4UUV2TGJuNDh4QnBuZmgxRHMzTzh6MkkvcTdPdXRzRTZ4bmJORVpW?=
 =?utf-8?B?K1RXSmx3Z3huQlA2b3d1Z3NoN2tLSjJlSHNMbS9JRlZSRndrQ1FZSFd2K3ky?=
 =?utf-8?B?aExpcTdhT2JCb0JYK1U1THZpdDJodnZPNEkxOUJmdnk5SlZVZUI1U2ZWT2t6?=
 =?utf-8?B?UFFHVWVwcHpCVkZicHlPOFhJY0NNQmZuYlZhMHNwbTZoblc4SzR2REpYWS9R?=
 =?utf-8?B?T3ZRQkl1NWN6cFZtOVhZaXhBTGswd2dJWDlsTWlFKzlGeHdMWTZJNlVMZUF2?=
 =?utf-8?B?cEZZN1hUeUdndnM2Q0hTOENKQnNjUW9KcENQQ0poTGhBVjZGd0xUSWZwNU44?=
 =?utf-8?B?S1lEa2lkS1FCNTNBZ0pXZm5ubmdTU1oxS00yVW1STU5JK2krVjZqeEhFbCtB?=
 =?utf-8?B?Mm53UUhYWVlQZ0xiOHhiN1hibDJHcS9NOTR6dkhJdXZXSmFLcXNsZEpDRTFB?=
 =?utf-8?B?cFBDRmJJYnN1d1c4bm01ZXhWaEVFajZvRDdENDBvMEt2NVozZFlDUDI0TGZq?=
 =?utf-8?B?RGdWTERBWFNUUkR2ZlZlbk4vUFBsR0lER09Gcit1MVdQWVJLZTZxbjFXZ2h4?=
 =?utf-8?B?ZEN5aWxsWUc2NnlDb2tHcG9UUHMzeTNwMUJNNDdreHJGendqbkJzTlNzc2lX?=
 =?utf-8?B?T1N1YWU2bDBPejZMNmJzanFSY3pabzNURlpOSXlWZnVDT1ZjcU5CMjNZQXlB?=
 =?utf-8?B?UWk0akhIbTVCR1ZXbEQvM2svZjMyTms4ZGdwK1NiWGN2ZVpHd1oyYVlMWlZY?=
 =?utf-8?B?cnVmQWtGVisvemZlZXNsay8zRmk5a0hzVzZYYzFNV3Z3K1JQcXpqSmpJVnJu?=
 =?utf-8?B?RVBOL09VbHo4TldDMTFXd0R4S0w1eVVKQlJiVDA1c1oyWmpTYjNnREY5U0Nq?=
 =?utf-8?B?b0doWHZmanlVSDB6SjlyYy80OVMwWWZPUnN6TVQ0ZnB1ZGZQa1RzV3pVZFBu?=
 =?utf-8?B?dlpXTU9QMERvUTFPcnE5NSsrZEdQNnJnZDI0bHNZM1VudnNHR1VJVElSdGhJ?=
 =?utf-8?B?Njl3Zk5GMDVCR1k0M01zTU9YeGk3eEJVUFU5WG1nSDhZNXl2S0hPS0xLQzBn?=
 =?utf-8?B?M3gvNVJWVlB6bzc5ZjhDTVc3aVZKV1F5MXp5VGZJS21ENnB5TjVOZjI0bGRw?=
 =?utf-8?Q?kInuoPLdwGjCiuAo/yIMR0HE8IlqgebV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFFKbnZ4dXE5WjF0TjBwdjhsck80ZG1UVkVIZmRRcjlNcXRseTFhS2YvY0x2?=
 =?utf-8?B?MjZLK2lKWVZDSjRLa2hubGFMSFNRTC9jRzY3Z3lOVDNQUGJyYnllcVlndkdJ?=
 =?utf-8?B?MkFkYk5RWUZnZHEraDV4Q244NTFDdjZIWXMwdVI3K05obkxjL0F1aHIzUlpy?=
 =?utf-8?B?aExhNmFCNFZnQ0RNZzhMa05hNmdzYmgvdGdXMGJsdE1HN0Yxelp3VUI4WkY1?=
 =?utf-8?B?Z1I3cTZ2SE91anI1amtKZEhGRGU3OW52LzNYZU5kalBjYnNtL2NxWlp5YU9y?=
 =?utf-8?B?em50Q3h3QnJtd1pGQU1PRjRXanQ0VWNsY2t4d0hhcXlSZXdHeUp4OHBuaGNo?=
 =?utf-8?B?M0Y3OERsWjVTM2Z0aktpaXEwWXprWmU1NGNqNkNzc3FnVFE3L3czSGJFUGJi?=
 =?utf-8?B?L2lxZDNTLzBpV2FVU0ZPVzBEeUo1RU5YT0huYzlLWmlQanNxM0ZvdEowTkpE?=
 =?utf-8?B?VmZBNE55UTRzQlR2QkFCZjRSck9ZdHpCaXNDa0hORXJzTHBSUk9pR2gwVHhT?=
 =?utf-8?B?T1pIb0I5LzRuY0lRanI2V3BjaXJlYWFwTHQvUWZ1TjNXNWw2OXo1SEljcUxj?=
 =?utf-8?B?SzJIWlpCSTFybWZMdzNqZnBZUkNWb3ZVZVhYSnppWVJ5RFJVNExHSG5OSVBH?=
 =?utf-8?B?bWRMb0FoN2RMSnY2cnRDUDlDajE1Zlc5SXloUGdvaitNM2NINmNVUjZFZkdU?=
 =?utf-8?B?REVhUG1DdEd2SlpsMTJQQm9IYXg1YzR4ZysxUkZ0VnpDdVdGTk9wM2FuWXpn?=
 =?utf-8?B?WkRpTlNLWHIyUzFLWmZhOHZSRFZkSVpheC9BUTdqV0VNZTdIc01jVmZZdXdL?=
 =?utf-8?B?Z1M1ZkFpS29KK29PZndEZHFkK0pHejB4NXY0MklwZDZ1RkI1V1JkYkcrSHRw?=
 =?utf-8?B?aHRUNXd2VUlwdzcrYVczNDZSb0RwVGRjUjFTbGlveWlzYWdyNEpCeGNwQSt0?=
 =?utf-8?B?NnFJa2VDRWt5LzNsdnJrK044NjByQlZiT0tSN2I5dzFvQm1USXljZElPZ0xy?=
 =?utf-8?B?Rzk4MFhwWml0eGZZM1lZVzNsSDN4dTE1S1A3Qi92aUhBQnpOVXFpak01aVdk?=
 =?utf-8?B?WGF0UUg0NTUrNkdlY0RMQytscC9mNjhMV1BFZlhBRFpWMHRUZS93aEtTN2I2?=
 =?utf-8?B?aVVEdkFvUTRZUnk5YnQ1Y3FYcEpjbE50c2FmMy9oa2dCMU1NL1JTOHNHVWw5?=
 =?utf-8?B?VHRCUS8wVXArS3VQZVpwbm9HLzJRRjlHdVBERXQxVms0QUpHSGpYcHJLa2hv?=
 =?utf-8?B?MHk2WXZ2YUdPMFA3cUUxd2p6Y0diSTZZY2lZdW8wbXV4cjNENzloTXE3cUd6?=
 =?utf-8?B?bzlHQStQaEx1aUhNRi9QWTNaejEyNEdBenVRMmZuaDBzSTRPU091TXRHSHk0?=
 =?utf-8?B?SkZIbHlhZUFlbVpHZ3pwdUdESVFXcXZTK1J1WUR5bGR0dmV0bGZtMW9DenJv?=
 =?utf-8?B?U054aEJXWVk3MVJXem1FY0R6S3ZHNTlSMnNKMXhEMEpudks1cVRNRURDaG5q?=
 =?utf-8?B?b0pEVW8rSVdHYzhsdWcxN1NPb0xRNlR1VnlQeVp1RVJOUWVzOS8zOXUxSjY3?=
 =?utf-8?B?aFVWRVZUUEdWSUJUR3duWHdZRkJRTWhBSXB1SmV5dTFqcGFFdGhaREtUWTJZ?=
 =?utf-8?B?RVF4VnR1bDhvMVVjb1d1L0h2RmxGSnBPREF6NFZQc25iNUplWk1YR2NyTG5U?=
 =?utf-8?B?aDNtMkxvaEJqdXRQWkx2NUR4MmpMTE9YSml2UXFyTGp3SkI4bzdRTUIxNENp?=
 =?utf-8?B?T0dnbGVKL2hzV1JqNzhmV21YWEt1K2VrV1ZCaXNrNEVqU2tTYjQ3TzUvb0pB?=
 =?utf-8?B?dmdQTXg0Wkt2ZmdCbTh6dnlYWHoxNVhuME9sd21PcXVlWmpiUVZDSmJoeU9t?=
 =?utf-8?B?eVVsOFlieG9MYUJBM3pzNGRzY014UXVaT0hHdGNCSlZFL0xkV0lLaWdJMzk5?=
 =?utf-8?B?dHpyVFZvSEtNUWU3OGNZZkNJY3drb0s0RUUrbDkxWnY4ZVNEcGpDc1Z4M3d4?=
 =?utf-8?B?NVg5ZGtFWk9sWGpkM09BdjBOSE9BQ0RkV0RyNjZNTzJKNkpPRFNHcnRHTkJX?=
 =?utf-8?B?dXMyRGdZclJPOVRrb3oySTZqRkxJNzhBMGZjRjEwUC9yY3VROE1IS25NdXBi?=
 =?utf-8?Q?vG4QMSh/uPzzD3muDLKASbO07?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5a1dcf-e523-4bed-9e26-08de37fd5844
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:03:58.2219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waT5c6UnXJsIYpFJuhwwnwjk70yKcOlRhadu63DyN960j+nsOD8x8IRZWj2/QEGQD7A0Prb+ojFOhEsDwm0HMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5793


On 10/12/2025 05:06, Aaron Kling wrote:

...

> Let me try to iterate the potential issues I've seen stated here. If
> I'm missing anything, please fill in the blanks.
> 
> 1) If this change is applied without the related dt change and the
> pcie drvier is loaded, the emc clock can become stuck at the lowest
> rate. This is caused by the pcie driver providing icc data, but
> nothing else is. So the very low requested bandwidth results in the
> emc clock being set very low. I'm not sure there is a 'fix' for this,
> beyond making sure the dt change is merged to ensure that the cpufreq
> driver provides bandwidth info, causing the emc driver to select a
> more reasonable emc clock rate. This is a similar situation to what's
> currently blocking the tegra210 actmon series. I don't think there is
> a way for the drivers to know if icc data is missing/wrong. The
> scaling is doing exactly what it's told based on the icc routing given
> in the dt.

So this is the fundamental issue with this that must be fixed. We can't 
allow the PCIe driver to slow the system down. I think that Krzysztof 
suggested we need some way to determine if the necessary ICC clients are 
present/registered for ICC to work. Admittedly, I have no idea if there 
is a simple way to do this, but we need something like that.

> 2) Jon, you report that even with both this change and the related dt
> change, that the issue is still not fixed. But then posted a log
> showing that the emc rate is set to max. If the issue is that emc rate
> is too low, then how can debugfs report that the rate is max? For
> reference, everything scales as expected for me given this change plus
> the dt change on both p2771 and p3636+p3509.

To clarify, this broke the boot test on Tegra194 because the boot was 
too slow. However, this also broke the EMC test on Tegra186 because 
setting the frequency from the debugfs failed. So two different failures 
on two different devices. I am guessing the EMC test would also fail on 
Tegra194, but given that it does not boot, we did not get that far.

> 3) If icc is requesting enough bandwidth to set the emc clock to a
> high value, then a user tries to set debugfs max_freq to a lower
> value, this code will reject the change. I do not believe this is an
> issue unique to this code. tegra20-emc, tegra30-emc, and tegra124-emc
> all have this same flow. And so does my proposed change to
> tegra210-emc-core in the actmon series. This is why I asked if
> tegra124 ran this test, to see if the failure was unique. If this is
> not a unique failure, then I'd argue that all instances need changed,
> not just this one causing diverging results depending on the soc being
> utilized. A lot of the work I'm doing is to try to bring unity and
> feature parity to all the tegra socs I'm working on. I don't want to
> cause even more divergence.

Yes that is fair point, however, we need to detect this in the 
tegra-tests so that we know that this will not work. It would be nice if 
we could disable ICC from userspace and then run the test.

Bottom line here is that #1 is the problem that needs to be fixed.

Jon

-- 
nvpublic

