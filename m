Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F81D63F5;
	Wed, 17 Dec 2025 20:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003544; cv=fail; b=XNFx+ocRTkUbETlwFpGgqZ2nzaCLzvcAu9NiM0HmdKAKgZS6O0HvoTkcZxdOkFhKFsfgT57nM3xXM9tAGkBBrYixOWNjoZg0w1T//svYiMg0kHlOJz5XKgY/nxqia+IYLQ9foiuquV3a5MXX3AOfFEGm1X2CtYHjDHhZW0Rlhvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003544; c=relaxed/simple;
	bh=JPId1lEG2Wu+94KONOnfCRFTlZV51E8oQWf0V3qFXuM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QCkylXjs0P9YYnEFawp44tovLiOo4/ZrOI3xO0Dv9miDODkEoEjhjZ/fbFdggGocdCm27uIl7RGqjB/FHTBAGTmJQigjTvKGZ+9Q1QygmgFtVXlJ0ZZmT1vg42HZ6+L7eQ5zbFPubd/q9Wj8Q4bcuEv6G+v59rIC9WVnAAgiPYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H95CJXWx; arc=fail smtp.client-ip=52.101.85.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H95CJXWx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8DFgWvWtW99016lF3nthtBpkLLcpWF/1BGPRpT36gcPCWwikF0S95T6moIRqMEYPmvMQ3sdRR50Q+ttMxufOPLhZ6LXh80Oi0mKtY4Qdz/0OrVAX0/sAY4sKauv2z1sPR7egwsg1Mcz5dxpfCQN6qOr26SgLe86GslGXQisgWTYA4S/d54r94SOM83GmqMPwF3RHoChGaqJnblcxT5d+lqb/Kp6c2xuNQz7Pl/osrjtyuIgHqTV2QtWJjVieQ3A622hCRQ1dBe2B6pYNEhjumxi9QyRhK31y4DE+gNsdGcisZBKsIC63/2uvci2tw6P7wypDftTxHpk/Qqf27ubxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+P9+MoCEEahwHsPdhwdM4QIuyjZKQRIYaA3xEe0pgw=;
 b=nGDlxlqleDo0dSd0U7fKA8dPdo5iDb8lrutn4vZ984LhbBwH8d+++z5qdvMhr8wAHbE+pnRaAs8VaVnGJh1uhr8OxZ/qer9vC814nXInrOK0vK62aycxvhwWopk6rMyLw6qmIlDIAyORLr+9SMgmkGXzqsHbe3DYhApWBpGRsJ4BmCousGO3dzoGbX/gDJ6mQpA62qoznWCREL4Pc6bwpmLhK5HHrLfjw8MDUqxA6etVU/Ibi4g+So8S2iPQNm1kSSF3M0qGsZ+5PSIhdgsPtP75dK8bQghwGqbPMtZMAeJFM+RGlCjdr19fZg8D4jf1NSXcY9wOmZBAo9YXJsKvQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+P9+MoCEEahwHsPdhwdM4QIuyjZKQRIYaA3xEe0pgw=;
 b=H95CJXWxT5ZDF+cTpPNJquLyhwVoR0gBapul6K+MbsqAciWTbe7ezJwBfARIhxoVjDzdLfiuznCsQbxsF4uSczbwSndku9h5BzkjsfE5paOLZJhCXCf7wkDSJDPuRMOLQ+xnRO6QrlRnEVZuUUl5qHqRVQo8Lma//0JJ4D0iLFy01XusQNlpu/qOLZfIezRYvnqXzYr1v8RsFZhqlW8dyyN4bZy/EXMPJt8tqs/MYSJXrprF/dEzUowGbnGo3T4KgROeFLitHJ+wJkQehLzoszxjehRT7MDiUgfKlpBwGw8A7HM5N69m+3pIc7McSoMaZThBq2ykdpuH0f3J9+54Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 18:59:46 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 18:59:44 +0000
Message-ID: <45057c95-1dba-4302-94fa-f63941ee2b20@nvidia.com>
Date: Wed, 17 Dec 2025 18:59:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
 <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
 <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com>
 <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com>
 <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com>
 <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
 <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com>
 <CALHNRZ_GGAg_VP8gSdtw_1CA2A0netrOeA2+guZfxyG7POhHoA@mail.gmail.com>
 <adc7ca5c-69d8-4164-bd89-3381b101576a@nvidia.com>
 <CALHNRZ-SU_kyak_u6mfUZBHJ9Cph6=-edhL+yhRizu8DDy=Big@mail.gmail.com>
 <CALHNRZ9mfO_DQR-RuH_QH=18R8zTt9VqbPaVCdnDKUWzx1pm3Q@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ9mfO_DQR-RuH_QH=18R8zTt9VqbPaVCdnDKUWzx1pm3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM4PR12MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: e088564b-feb9-4f8b-4144-08de3d9e709e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlhPOVJFR1d5MEtyN0w1VzRISTM4YVpxbWMrMER1RU1TdEROS0dFNlVtK2hi?=
 =?utf-8?B?TncwOGxPYlNqeGZVMkFjVUxaSTVyU0I1SjE1eG0wdFViSmRiMStxZzA5TDJH?=
 =?utf-8?B?Rjc2TkNVTkluRmt1NGxnMFlwelpFS0hNbi9ZQXZZNU1nS01FRDJrQmkvWGJH?=
 =?utf-8?B?MzY5SmZUNHA2aEIxY0hMeEVvUHBNM3RwclhEOFRYS3N0MWhpN2JXVU9KemM1?=
 =?utf-8?B?aysyWDhuSTNmOVhJTEJQRVRCVGNJa3NJRUJmVjhXSmZzNVhjZVF5N2hFYlNl?=
 =?utf-8?B?d2RLdjlqdnc5azd1bFRhVlpkVUhmZFVKT0NDNkV0REJPZlA4dEhTdGhkV21R?=
 =?utf-8?B?M2RDbHRuTnJQY0Q2ck5SUDlsNEl6VmpXQU9weC9hd3pCU0lab2tmUXRLVFBP?=
 =?utf-8?B?WDdHN0dBa2xVNDY3a2YxeHNmSGpPZ0pWSTN3aHZlalNaMjByZ0lYT1phNGRp?=
 =?utf-8?B?ekpERFVCRUN0N0FpNXYzc1BudmxESTVXV0RKbHE0cXpTa3dJWmtnTFhPWHd0?=
 =?utf-8?B?aTlsU3ljemVOSGg1aVRsTkVoVnRwbVNzVWNxRGYyWWxjOVNmR3JGSFAxckp3?=
 =?utf-8?B?WXQ5bUJ0NW45NXdZa1NrSjFLbUVibW1DQTlyQzFQR2Zua1VEY2hIajV1M0tB?=
 =?utf-8?B?NzVOR0J2WE1LbzdVNWJTcmgwMEYrMHlWVEJvS2M3dlRmZWpYdVZ2L2hjQS93?=
 =?utf-8?B?Snk2WmdxcGN0MzNzS3kraXEvaEZIVEMzR3pkMmNvdHVnTXFVSzNCS1o3ZkZE?=
 =?utf-8?B?VWV5c1JsUTVGZkVZTVNneENwRXJ4TllFUjdTL1Z5QzFkTXBqb1p5V3VYWEN5?=
 =?utf-8?B?QUJndHFxNEdKeTRzM3VzMHNIenltTC85TzVrVXRYWGozUWtVaHdvcS96SWdi?=
 =?utf-8?B?cno1VytMMnpHVER2ZHlWYnNHdzd0U3p5LzBzVzZ5ZHFWK2FLMG41ZytmT05E?=
 =?utf-8?B?ZExBODhDRXhHYjBpbHhWU3Boc0FpNmxob0cySGdUL0p3Rmg1QTU5enc2VTRs?=
 =?utf-8?B?ZGxhR1NnTGR0V3ZzYmtURk1LUFdSbUZ3c1RFbk9XM3hjeVphNnhyRmxabWM5?=
 =?utf-8?B?N3BuZXpGV3U4b29YUkRRai9DcWxsNlFPbXU5d0VqY0F3eWVkNmhMZ2xUSDNP?=
 =?utf-8?B?UTd1ZTE1TGl3aHRYNW5pL2J5UkthaHlkbUs0UmZiSEY5bDhVUHVPN3AxWDl1?=
 =?utf-8?B?L3A5WTVaRzVJSWpIMkFPQmZXT29JZW5LU21rdEpaTG1XYnBZWE00b3lxOEdS?=
 =?utf-8?B?RktMbzJ6ZjZTNFU2K0VNWXNnMnNmZTZTSzl4ckJ3c3NQbXVINnZZZnNEZmdj?=
 =?utf-8?B?ZFU1QlBROXF1Vk1xUFlhVkxNSWo4ZUY0dHBUbFdVVXZybnBRSG1scEEvTytE?=
 =?utf-8?B?ZUp3dmZZZnJ5c0ZxWEt3eHRQakpudElacnlPWkhQVXhjK081S0pjQ3YrYTZK?=
 =?utf-8?B?Qk5rOWI0SW9aRmcveU5UWVU4TFJSRHFId0RnNGk4MDN0MmtLMm1uaXIzZDNr?=
 =?utf-8?B?STZ0aGYvUU5tZklGaXZGb1FacU5FWUpzWG9PWTA2ZDBtSzJ2V1pUYkwzM1V6?=
 =?utf-8?B?NEJzSVRXcDNYZzZyYkdkY3R3RFJnUmNjVlJDTU12K3NXNmUzUGNMaEpveXJT?=
 =?utf-8?B?enNnQlVPVlErU0EyQmdSVFZEZzBoRDJxaEs0OXJqM0lhOHhCdnRiS0FOUHJa?=
 =?utf-8?B?NzB6RnFKemlXVXJYNUVYQ29ndVdJMkpkeFREVld3STk2USt6YzZBQWtYVXFV?=
 =?utf-8?B?QytrblZJQkw3dEh3VEE2K2VQcGVTQjcwWktVeE5PcUVudUo5VG1GczhIRStv?=
 =?utf-8?B?SWluSEcvcldLNU51VmVqNzA2MzdZbVJ1Vy90bE1VM0x5Rk9XdkFGVE5NQjBp?=
 =?utf-8?B?d0s0OEZwLzlmZXVwSS9pZGF5VHJoRW9MV3BrZ1FWMTlWcGZCazZra3ZVbDdK?=
 =?utf-8?Q?GZ83+v/1WrlmnU64nOonOF4zQ/3V4qbY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3Q0b1FYM1RIY0NPVzc1M0hWSWhiZTJaaHNkU0pJdXp1NitjTGZGQmIzSVZ2?=
 =?utf-8?B?KzRrMXBCTXRiWVQxbzBrc05LRDlVRy9DMkNRZmNrVCtwcVN5NS9sSHQvQUt0?=
 =?utf-8?B?dHRoR0dsa2NzQlVYUTJPaU9qTlIvMVJ2YmR0VnhpWHZORUtxMU4rZHA3VGhi?=
 =?utf-8?B?L0piQ1BIUXU3elE5YXBhWDVEaVFtOHRQQXVUQmMwMmhPVXhwZVE5MHRSOUh3?=
 =?utf-8?B?SmVsVTNENis2ZW1JeWZmRmRVOFloMHZhZkZOV1NsbWNDeVRUanl4UnNXNkov?=
 =?utf-8?B?T0QwYVYzTU5mS3B4R2ZoSnNBYmNqK0o1TU5qWmJoZVR1MnZBazFTbGhBWjJO?=
 =?utf-8?B?M3YvNzF0cXFtU28yYW51TlFyTHgyYVdhWGptSEdic000clJWS2FyVTBKQ3A0?=
 =?utf-8?B?LzR6SFVJN1ZOU05lQlU1NWR4Sm5HYnIweEpMcEZMZzZkWGFncDh4MUU5eHQr?=
 =?utf-8?B?SkJpa0tjUURGUzIzYTFZWnR6RkRXN1IyaTNZcFRyMkZNMDdGWjRKQVVFSFZv?=
 =?utf-8?B?S1JEZS84cGcrK28yNkpCdGlJaEVWQ0cxcllEeitidXBKU3FHc3AzL1RmNlJO?=
 =?utf-8?B?NXd2aDFISEYvdldpNkpkM0p1ZVVQNkFmSS9TQlI0NTZVdjZKK3hiVTBIaE1u?=
 =?utf-8?B?Q1dNUXV2cnF3dld4SE81b3dibTFRS0ZnQXJLbWx1bVFXN08rY1pxTEc4THFO?=
 =?utf-8?B?dXdSQ0xKd0dRR2pVdllLSjZJeEsvZ2R1bnRSL1lyYWFXdGx1ZlBZUVdKUVY0?=
 =?utf-8?B?cURKZThrZWNqekppL0wzNU5jVDNvcXFGQ2paUWU0eDJ0YkFpdnF4RHF5eElo?=
 =?utf-8?B?TkVYelBhRHZYMUJ4Qm1aRFdZZVVBUEFQaG9BVVBveCtBeDFMUWlRL083bktm?=
 =?utf-8?B?ZlBLWStOWklJd2hVYVpJalJqQzEyMEVGRVF3YXF1MnA3OXVYY3hscTRCY3lu?=
 =?utf-8?B?TCs3MTJISFk4UTlUcGR6d2Q4T01ZaGpESld3em1jNnkxeTFWalNMbkphcWR6?=
 =?utf-8?B?ZjZHNWxMcGd4STZ2czlUeFdLVEthZHFkTWVNZ3kzMU5UeEhPTHFVSkFXaGQz?=
 =?utf-8?B?OGRiWWlOOWVkM2tHRnBOU0owaDVzZDlBT3NlVm8rTHNzaEh3cFJWVG0vL2lK?=
 =?utf-8?B?V1M2NnRhQ2krTHJBekhWZkxtUXpQOXRocWFJTWlTL2tDUFFkMEpuNWtaMERC?=
 =?utf-8?B?R2lpeElnN29TeE1WTGovRDA5bDlLOGRkRlVuT214bHpibVNXZ0U3MzlGbWhW?=
 =?utf-8?B?cmpUTDRIRWNKSEdXZVk2SUtNQkFZSXgyUGp6UVM1R3lHZVlWbHdoZHhTcWVM?=
 =?utf-8?B?V1ZqbnRqQ1UweEJUdEc4Z3RsSmdFMFNGbGZaOHVtSm44d1d2Q3ltNENOWnFh?=
 =?utf-8?B?ajlqbWhMdEdMRUM1d2dFV08zc0xONldFaFAxM0tHZlZscVJxZ0xVSHhGZ1dD?=
 =?utf-8?B?eGxIeUpwRjB5V2pKQy9HT0U0NWsxQWNsV1dtU294cnZOREM5T0JRQkdGdStv?=
 =?utf-8?B?THo1THlYYnZQbEl4UTdlRXNpdE83R3Fzc21GL0xSU0hPTTVpVVdWQW5jak1x?=
 =?utf-8?B?empzYi9jQjRiSU5YTTViRTIwTFRpMlU2a0dWemE5TDJCMWJBK1dlTGtBaW85?=
 =?utf-8?B?UHp2VHh1cFBxTCtEZys3Wm4yQ0U2TUFjb3hqVWp3SGl3emxFbkgyR2VXL3l3?=
 =?utf-8?B?aXFUV3YvQjJlTDV3MEVNZGFVOXc2bnRvdUc0czRBZy9HZ080cHVNNU5wNnlq?=
 =?utf-8?B?NU9ub0VFY2NpZlZDUnlSS01JbFpBUUJpV3B6bUlsVzBhK2VkSWFwSjFMKzdH?=
 =?utf-8?B?VmJXYzBNQlV2bHFwaTI0YnhWL0EzZWJRSjFCK1NjSkJ4YXF3ZnN5YWw5OTdw?=
 =?utf-8?B?Q0FBRXlMak9rWXAydnY4YXJZS3RzT0dJaUJTdDR2U05VejJCTU1tTGNZMXMy?=
 =?utf-8?B?Q3dBbjdwVnBZSiswL0pvcHpRNkQwU2JzQllJZ01GSmlPOTdkU3lacFJhaXJZ?=
 =?utf-8?B?WGRUejE1TGxyanF1OUJmM2Q3ZmJ1Um4zWFhBZnYybStJL0lDWW1nSFZoMEpM?=
 =?utf-8?B?eUZNVXhLNEFTaVhkdmE0SGxqb1dZcVA0YmZOcWZ3blRPemV6T2xaeWRiOC9K?=
 =?utf-8?B?ZnUveThDUit5a2dnZE1pQmMvdHc1MXFwZXE2NWJ1VDJqeDdrWHBGSWtHNi9F?=
 =?utf-8?Q?q2JfX45XoeLJ1XIXk02phYgSkF76VEVLv8GNg0c1ONAM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e088564b-feb9-4f8b-4144-08de3d9e709e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 18:59:43.9786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaWz1YGx3NND2nZh10bJ/suv6dsC5+vfZCXI7HdzoBhufGMrFPzgbzeIHePscFmBuOouG8DAR3u9CRt/7SlDVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474


On 17/12/2025 18:39, Aaron Kling wrote:

...

> To try to move a resolution along, let me try to enumerate the issues
> again. Again, please clarify should I have something incorrect or
> incomplete.
> 
> 1) The primary issue is when an old dtb is used with this commit and
> the pcie driver is loaded. I can reproduce this issue on t186 and
> t194. If this becomes the sole remaining blocking issue, I would like
> for an exception to the normal rule be considered and this merged
> anyways. Since it does not cause a boot failure and distros package a
> new dt normally anyways. And to my knowledge, working around this
> would involve redoing part off the icc subsystem itself, a major task
> in comparison.
> 
> 2) T194 is reported to have low clocks even with a new dt on the
> Nvidia regression bench. I cannot reproduce this, even with the pcie
> driver loaded. Can this be re-verified, please? And if it still
> happens, can logs from the failure be made available and/or more
> information provided as to the state of the unit? Like changes to the
> default defconfig, modules that get loaded, etc.

Can you list all the patches that need to be applied on top of the 
current -next and I will run it through our testing to make sure I have 
this correct.

> 3) Setting the max clock via debugfs fails when icc has pushed the
> current clock higher than the requested rate. This is a logic issue
> with all tegra emc drivers that implement dfs via icc. The suggested
> resolutions are to leave this as is to keep consistency with the
> existing drivers, perhaps updating all later, or to update the
> existing implementations in a separate series, then send a new
> revision here to match. I am personally unable to verify anything
> older than tegra124, however.

Thierry and I chatted about this last week and we feel that debugfs 
should be able to override the current configuration. So this will need 
to be addressed as well.

Jon

-- 
nvpublic

