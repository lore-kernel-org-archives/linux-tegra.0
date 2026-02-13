Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E7225775;
	Fri, 13 Feb 2026 03:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770954285; cv=fail; b=I4q+ZVzZmBjBB1mdjJC5qH6F7zcJwlvp01sGVm2T9okaaI+zTj4baWUu/2Yhtg7SxTz5e+G32fLv1A2KtwvOBiBIH67bxS0H/P9eivxckbFGMEjsYLUiEo1QbQqvrPYzF3g26tNgcywOjptP/+9eAxbgiGhDKFkeT2OyxJN3W00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770954285; c=relaxed/simple;
	bh=mTkhYkXUjz91R2CMsNYwc/d/fThk0w3VweXsL5v57X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ax4YJiWvQT2WM7OxTX5LpeyfBIW9X9Ar2Xn6xcI3mOADY3ZU7Fo5DbO9Z9FskkB3HIsYzcXQFYd1k8EnQs+NAndRWta0rq+NK3KU/hV3fKs33COKQXnHrCU9x6qhP+S3w56SFOVbpOeI8v/ZGEwP24wU14jkuKfvKjHM6ZbloaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oVdyFeiU; arc=fail smtp.client-ip=52.101.53.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oVdyFeiU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HC1BZUAoVZFv/1e7MoVGsCttWbG4pTnzOItOhxwp5bZMUJj9oqrwUJNcRxaoZur6z8BBPHNV+Oil7DqwrLPSrFCdC/oQHF0bfS2en/4xhpjFUOWiV0nQ79Q1c0zuXwarZT3Ww78yw0n9hkOprJzkb0f+SVbKMdiBsVA8/EyCoLztRLB5cYObp7JGJ+9nho9opy5yQTIUr/QRvRC3Xg6AbXuVHqEYn3kgKPM8e24+WpWZj+dccFt+cc1wpJqMVpQ82udpfEH9BGDg80NT6achc2CJ+YQff6qEE3yFHfh4Ch66syMVzb1SrbuOQIMwqGSHDao48DPCx2O5Xz5WPGphlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQOj/aKwuGrGdYXtsdJrp4y96GIMUnjf5sMk85JllAw=;
 b=Q8Yw6hjDd1tOwz1iAAqgxCY5CM1zZyDKPfpM6TGp4wpxRw+c0PVTIdFIkv6OYmGqfGFsNTjfk86y0MLW3zmHL7yV9jLlTNHOPlVX/6HeTtTGCgcB8lb6iIB7VhPLQ39UJIBmy0ongjG9oyx4dkR1G2t2UtdYUsZ3I4S801C9c5oMeTEaYRr7hWhzOGje60gnMsZ+Wrl5vTP18aVwJ5rkqIdE5W8TOGaqVI/mrkiHIVuI2MqB/xT/TrbHM8bQ4cwjr2ifBmDHwYUb68H7b23xbacWICH43Y2+uxnRSukNRQJcg9339EJZYOzNAxUKCCj0KQL2tubd2PrrJFy0Oe9yKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQOj/aKwuGrGdYXtsdJrp4y96GIMUnjf5sMk85JllAw=;
 b=oVdyFeiUELSLv3PsBL9TQ7Jqw7xSHR/jasNSvKrOguELStKWdTjqGDKAmS+Vr1fls6vH2ZAZCMVktuQ1VnbhA33jLQLonKPebynOWzfsQuJWxFNN/myC0YEuPLEzdHTlv6EgseltCXqZq2g9nTluM+Q2SM0VeedonBG6MFEnXEoYjVsBcyt8S0g8MBqoF8fO97i4rTN1vY5Fcq0yOqxuNaIRKiO6KE+NBYNzgZwTC9pb3E3stotCPCGcIxWDwTIY9QqJlGgjJMPto6lUA2kxDRlIaGwwk0Pwnfywo9+6s3vHCUpJTNxrIK+fSKlnGvy/nD4hBKNIjYfF5EskMjq7FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BY5PR12MB4305.namprd12.prod.outlook.com (2603:10b6:a03:213::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 03:44:40 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 03:44:40 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Ulf Hansson <ulf.hansson@linaro.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v1 1/1] soc: tegra: pmc: enable core domain support for Tegra114
Date: Fri, 13 Feb 2026 12:44:37 +0900
Message-ID: <2724083.Mh6RI2rZIc@senjougahara>
In-Reply-To: <20260126192030.79119-2-clamor95@gmail.com>
References:
 <20260126192030.79119-1-clamor95@gmail.com>
 <20260126192030.79119-2-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::18) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BY5PR12MB4305:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c5db1a-6765-4c7c-9d78-08de6ab237d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWt6TVVOcXFhVjZkT3NuM1VsaWdQQk9NWi90bHZJcXU5RHBMODg5SE5rOTVn?=
 =?utf-8?B?eXVocDBQNkJMQ0RxNkREUWFzL1NOUFZyb1VXeis5NGV3NjZKUm1iNVRtYzIy?=
 =?utf-8?B?em1QSi9IRjlXYzNDOXVmeXhLM3packs0TlhheTFUUS9tS0UyMC9pVlJJRlM4?=
 =?utf-8?B?RFpnRHp4ZHdNeEJsV2Nmd3g5SFI2SjY5VlRhdGY4dXJGTUZlSXVhNzVET3JH?=
 =?utf-8?B?NHNJOFd3UUo2UURTL3pXWTRzOE1oVXUzY0trSW9aZ0EwTmF4YWR2WEE1Yndk?=
 =?utf-8?B?OVZhMDlMWFhSOEFZTllyZnFrM3M3cFNZS3luaS9MNk5OTWpoQXdEU2NhUis4?=
 =?utf-8?B?VStnZGs2SE5HZlhMZ0ZWQUVCa2VDQ2RUUDN6aDh3TUF0U1RpY0xra25kS3RB?=
 =?utf-8?B?eDBKNTVWRHhyUmRIcnhrcS9VaEozYXl3YUIwWEZvQXpvYjBsNWhDRWR5THg2?=
 =?utf-8?B?Vk5kWU9uclFqUkcxdW5jUGMxZTRGT0FjNDNBaWRmKzRMc1BRZmdWdnlNZWxI?=
 =?utf-8?B?cWZkcUU2Ym9OWnhhMW1wS3hKV2NFMS90V2s4d1JrMmloT090QnZQa3hIWEQv?=
 =?utf-8?B?S29OSWF2Y2xpd2diVDIybUhLc01PRUZmK3o1Z0xGU2Ricnl2bjhrTWg4ZXFI?=
 =?utf-8?B?MWxUSmdZZ2pSQ0d0ZmVOWTY4SG5mMkM5SFI2SWc5LzhuTS9BV3BkZG1FZGtT?=
 =?utf-8?B?a2tzYkNZMmo4a0cwRDBSQlA0eW5iNDN4anZoNnk4TzZVSG8rRWh4VkFWVzhv?=
 =?utf-8?B?eXp5ZURNbjlkdXBQZGJxdGFGandHUEF5dVNmSjJnWlN0bFNtZ2dscXQxQk10?=
 =?utf-8?B?N0VKUGNyRFNlemlSdjBVV25Bc21NemowZHNIQjlTWDF6Qm0yQzZINFM3Rlpx?=
 =?utf-8?B?QlFqcXZicUFyZEsxVld4UjNOaXhDMjZjMmEzbDdNWDFuSkpYR0dKRzlKVXo2?=
 =?utf-8?B?ZkR4dEREb0w5Zjh6U1A5aDFUSTUycUdXVVVZODNqYjUvNnY4NjcyNHgzSTdC?=
 =?utf-8?B?YzlKMTBTVkk4Q0JlYU81N3pCUTQyNE1Db2w4NDVQZVdTQlRtUUpWQTJiNEdG?=
 =?utf-8?B?eFNkazFmMEJiWlpjWG5ZSEY4cFVGdkQwemlRdXJwTHRUOEdld21nSmhobHh0?=
 =?utf-8?B?MEFTZk9kcGx3ellhU2xmQjdzeDhHUXRESTRWU1NReGJXcU13ZHFjV3hxSm9x?=
 =?utf-8?B?a3o5elpsMGZHdlNxa2NlRzUxMUNzazdpZ3ZYOUR2bGg1N09qQURWMjlBUmFv?=
 =?utf-8?B?NG81Z3Z2S0k0dzVRTnFJVk5LWTROeHRZSDJtZTFJZmJuM0RJMWdsQzdZdWly?=
 =?utf-8?B?TXFjNEJZWGZjdjVONVVMNVFPbDdVRlRBdmp6UXBMdWFqNGE5VTluMEZheFQ2?=
 =?utf-8?B?R0RTWDN5a1Y1Q1ZzWmcycjJoTTIzTVB4dHpEaDBRVDhYKzllanpWYkVTa2dK?=
 =?utf-8?B?TkNpc0xsMkFoOXNCczJybiszdXJKYnhYcFl6cFpYOElFUWRTaGwwVFI1M3hn?=
 =?utf-8?B?M1oyK1Y4QjBLMUYwbVk4a1VVVThVZWpJRzZsZE9PMVV4VGcvRzN0QnpOTDZj?=
 =?utf-8?B?S2djWmVaS29WMWo2MzZWTXNmV1pCY0tWSjZqazYwRnFUOUlscmlGZmdhRjlY?=
 =?utf-8?B?N2hGMzZMN2Y4UmxYRHZnVTVOQ0NYc0ozWW91bzdJbVMxY2k4Y29KeGJqNWpt?=
 =?utf-8?B?RlVMamdLNk9iUEhmS3M5cGF1dWozTXA1WjdaUkRmWXFmbkV1SlFOdW01NTEv?=
 =?utf-8?B?QitJMzV1MHBrdjg3dkZ4R0RpbkFnSlF5bUNZekNBem84NlM2Zld0aHBpbHZO?=
 =?utf-8?B?TkQ0QSt0NkxWL3dqMGI3STE1c3llNzlTYXcrZnlCVjJuTkNheHFmTGo0NHFG?=
 =?utf-8?B?RlROalhiOThZWUp1OXNRWGJHZ2Z4WjBNNGxNazhka0gzbXdLZHVqNlpSaHBp?=
 =?utf-8?B?dElGeDdoVGhlaml2TXlsQ0Jzb2ptRTRsTUlzNDVwRWluRFBWa2lBOVNRaEow?=
 =?utf-8?B?VTVBd3lFYUk1ajIxREFpTXg4bWZOelNiNjVXVGZVVk5BdkxqalRwWi9NWm4y?=
 =?utf-8?B?T1U1K01HTlNPNy9tdGxMNDExcVBsT3BKWFVvQXBENDVQbGR4RUpMUEY1ZXFh?=
 =?utf-8?Q?H52A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vjh4WXAyNGtoa0ZJRXdWUE1qa1A3a2lPTTFTellwT3IzVmpmVUFQc3dzSFQ1?=
 =?utf-8?B?OHVGK3k2QzNST201SDlDZGp6K0w4aTRUTVE3OW1VOEE3YTg1U21nZ3hoVktt?=
 =?utf-8?B?UGFUTkM4Y3pjaTNrekxhVDlvWFk5ak1xUWZmQ2hFVERsVE54WWJjUStnSG1S?=
 =?utf-8?B?d1hLNVowLzJKMkZCbWpnOFFsSGQwUXFtZ1ZMRnpyK0I0bjNkdDlaUlpyd1NH?=
 =?utf-8?B?TXBKbVhuclA3MTRlOGdyTkZ0MUtBVmJwVElTMWVKUnpINkRDdXVmd3pUSHNK?=
 =?utf-8?B?dXZoNVhWSkYvU3Y3NTJFb0dPblEzeTZWb3NNSUNNRkR4SDVjbk82c3RRYVVK?=
 =?utf-8?B?NU1wZDBueTMwamxVT3dSWWwxYmc5OFZsRU4vSnM5aVZONHZSRG9GN1pNK3Ax?=
 =?utf-8?B?bzc0NmVianBUYzBHV1pPcEY1eFpRSWE0aDRvazM2U3hYZ1hKa2x5bW9WOVRI?=
 =?utf-8?B?K0hYSXpTUmhzeE9pbWpVNUcwbHhsckdXVUJQR0FXdWdjVC9SRElrU1Vobi9i?=
 =?utf-8?B?YWhZMVRuZHgrTEdsUU5YZVBUV1ZaYzNqUCtKdTVlbnVpVGRWYnlWVEpwbzV1?=
 =?utf-8?B?bkNRZDNINTgybXJYZE1JYkx1OTFCSWhoVFQwUFdRNzNPSzRXZzI0eHdLckI3?=
 =?utf-8?B?ai9rTG9zNzRPU2s3eVQ5NkUyL0lHR0tZTll1bzIrRm1LcGpiV1JpZkx0VVBB?=
 =?utf-8?B?UFU5TmlZZGExL0t5ays5SE55RldVenlNelFkZTNzMWdraHVnWEZFOVBkbmZk?=
 =?utf-8?B?Q0RYZ0I1dXJZYVpmYmUxSE4ySmJGN0hvOXJBZ1hhd2dCaFVLL0FtUUVUcFl1?=
 =?utf-8?B?NGxCdlk5ZmkyU3RZOHdyY2pVR2FhYjh4cFBmaFA4U2dzV2tyWHJhMktzNTE4?=
 =?utf-8?B?ZHZzanc5b1g4Z0oydlFTeXpNN0NyWE9DdDVveEhrUHdGQmJEd0gyQVc1Umw0?=
 =?utf-8?B?T29pcUNiMmkzU3MrajdNa2tZNjR4Z3g0RFZxYzNjZk1meEw1WElFQ1VPUVZY?=
 =?utf-8?B?UmU3bVpvQW1nS1h5WjJCcngydUpHYUZtNENaRVFFZUFnTGlhbmJuM2k0U0JJ?=
 =?utf-8?B?WVJyUm5TUDJldVczdGttMDNSSTFqL29HSkxBRUZQaGFUYWdONkx0cHJPWnpR?=
 =?utf-8?B?RDdMbk9MZFR4ZkFrbWN1a3RYaGdiNHljMTU3WmYwcE94TTMxVndoRWo5K3hx?=
 =?utf-8?B?YjdENFF4aUZjMVpqaFBlY3ZkaWZYcGRrbXdDV09FYnExSkN0YVNyWkNMVm5y?=
 =?utf-8?B?bjJ0VnB2Vjg3WEFOeHZnU0xrMlJuc1ZvSUViQUlkNCt5c3dxbUV6ek50a3hQ?=
 =?utf-8?B?eDA1SGp5QVBUdEUwbVFCU0xobUJDL2ExZVk2YVUyZ3ozTzFIUmxjckZnZm1V?=
 =?utf-8?B?VUIvTVFYajdVZ1NqMzJyeG1jWmo0Y1NSQmp4czJLUzAyN3V1YmcxWDUyZk1i?=
 =?utf-8?B?MlV0NnVZMXBWQ0NvdjJxQkwyNDBSQmtMd25iMHpVOWdFaUFBYnRaVEpneW40?=
 =?utf-8?B?VE52RDNXV2VxL0w2MnkrK05hdldVa3JYQi84RTVQQnhEWFk2S3lQYkdWajNi?=
 =?utf-8?B?clN3cnQ4bkQrbzBVRTZHL3BkNmhEbG5qa2xycjd0WjZYR1pSSTZESkV4NjEz?=
 =?utf-8?B?dDVIZVZvQ3NNSHpSQ2FFMjBvVC9jdkExeXdTOUx5SnBUeUF1b1JhbDVSWHRn?=
 =?utf-8?B?THdRWDdudXFWRDFoKzhtTlk1VElWckQ0SllBU2pINHlqanRxcmpCNFVWVXhD?=
 =?utf-8?B?K3BMM21BdGRyVUpycENETGlGRTJ2YXVGMzZIemlXbkxQSTdodElYZjE0aW8z?=
 =?utf-8?B?MWpyRGpOK2I4TlRsYmg3ajYvRUY5THUzZWFMelFNU0xwMTk1bWd3YnFUcWtw?=
 =?utf-8?B?M0krbHo0N1BlVDdleDlLM3Q0UGpGcWY0ZDhtbmdQWlRTMWxVU2tmbFBWM040?=
 =?utf-8?B?ekREWmZqZ3BrVXNMVVdxVXJTOHNtUXcvSkYySGJuWGNKaHRqNHFkV252VVFs?=
 =?utf-8?B?WWFpS2JHV05mWDZFMGlDeldPMHJJUTNRbEhEV1J3bUJYRC9jZDExeGVJNWRa?=
 =?utf-8?B?a1VRdFRIOW1zWkNaenFJYXFnMEt4ODlQRnY4bDNabDJOck9mR2M1MU9wK1Ew?=
 =?utf-8?B?bUlHNVZPMTA0SFhTdmtQMFdPTDhXRno2ckxwQXNjdkZGTmJIVmRRa2tvc2k0?=
 =?utf-8?B?b3k5UlNOcWVKQ0J0eTByNExtQ042andxQlNrMDViUmhVSmVweldzamFKeW14?=
 =?utf-8?B?aHFwaXowTFpRSlhVS1ZzZXIyV1EvN0RXMGk1VkIyZDgrelpONXp2WjVraVZC?=
 =?utf-8?B?RFVKZEp1NitMZGhkL2xlZmNacXpnbC92NU1VQlhXNTRDN0FMZ1hVWGFyM3hS?=
 =?utf-8?Q?Fdve/Lk9UsWrPIzKAGCq6MbR6WKq2NQFK0y1XyA6Kcu92?=
X-MS-Exchange-AntiSpam-MessageData-1: WHkje/XdTTkXFw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c5db1a-6765-4c7c-9d78-08de6ab237d2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 03:44:40.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdEFqmIAsOx2yUZBtvNlKcaA1Mzo0e4xrm1Qermc7gGhuN9OvZ4JwB02xwt95U6+4g7qG713Zp2D2IkkmcgbZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4305

On Tuesday, January 27, 2026 4:20=E2=80=AFAM Svyatoslav Ryhel wrote:
> Enable core domain support for Tegra114 since now it has power domains
> fully configured.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 034a2a535a1e..621dbc02afcf 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -3398,7 +3398,7 @@ static const u8 tegra114_cpu_powergates[] =3D {
>  };
> =20
>  static const struct tegra_pmc_soc tegra114_pmc_soc =3D {
> -	.supports_core_domain =3D false,
> +	.supports_core_domain =3D true,
>  	.num_powergates =3D ARRAY_SIZE(tegra114_powergates),
>  	.powergates =3D tegra114_powergates,
>  	.num_cpu_powergates =3D ARRAY_SIZE(tegra114_cpu_powergates),
> --=20
> 2.51.0
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



