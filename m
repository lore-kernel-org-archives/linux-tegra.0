Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456B76F53E;
	Thu, 18 Sep 2025 01:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758160790; cv=fail; b=E4SDaxrJMC6pRmD4rdoUebvdk1gGfFG0q0NQrHMU1wTUrfqXkNtvnEZyLIfid/9gkRPKNpIRaALsZa2FoVJgsWK/OsRifjFI7ALuPm7/tjL6KqgFkrs5maO+o359wC7k9+ddum9eqzqO2Y2Ca5En6w0MczBgOm4y9x9ksfbD7eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758160790; c=relaxed/simple;
	bh=+eEb5A8yta8v1Wf0Wrgwe2ia7VxQCWro6LsVwasfzac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bFI4AC2ykBOhVtig9Cp8gQUqdz0vsurZX4OJVFD0RHAiRM91X2eD3toFMfJB8gO49acS7z3EFmufrxXsa1B/pRDmjE73rpYruhEKQyTFZ3pqgAaK/zw1SOh++ekDRkU+lZkbhcsE4atDOSIkAeSaKvLsQwL+rTvPTsIyUZCRFH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RjlmcPNi; arc=fail smtp.client-ip=40.107.200.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RjlmcPNi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqGksk5PJlsDAFbj22VBzvE0ZZLoXeCR4UvPyueIMEiXrN56m26XfEWiHCJ87sNzrmiDJM0wxr4a+QqrdfdT1D6CPm1hhFZLsFY+kBb99E4gBZIwphzwqBs5peTx86utoqItJAt7vhwLOWJtcTLEszD+yDO1rKsBraZD0NsJOUi27Nse3zser10z/diOSspXeg29x8DyjDkfd0b5fQzcuHx6zuy/PxVZh6OMqSoWvD1KWlDcAv7/tHHYcmlexiH9EIDIAJD8yu7cvWKrRbui76ZHZ5vp9t+RzfSopDY2M5F+SmwjR6xnaGCpe50tSpv0/mJ6dtI/DYeB37F/s8WFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVTXkokgjlwvvMFbzlBRm+WL9Wdy6qhsUzQpiAxm5PU=;
 b=bred1YmPnouGn5CEE1rMwzRk51c8dkdbnd1pc00GKEX55ge/W8GAqQ6P3Hs24zINyFACIVe/yRggdkP3y8w/rJGTx1y7MrlOMDsbo3+5iNjreZlNt+lJ7ES5OQHNg9zf04E6IqoAXXPfBd2vTD2exUE0wJudPI4eXkjlMjbrpU+s4UPxTtpPXKPa3GXMdQg0BiBfrXVvSzYr0dwgTXWpoWLVg+o2q4R69ANKwTQahOfQrK4PVSCbNvwmFkk3J1TqBrKzeIfh2XPPSHE2VgMM//UnCHSX8PhBzwVxk7H1XUhARt/zzKe/xjR4e9bsDzQfY7jygFXaH/EYcS48zTr+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVTXkokgjlwvvMFbzlBRm+WL9Wdy6qhsUzQpiAxm5PU=;
 b=RjlmcPNiqXA89qDlwg8qC16D1K69hGH7mOQq3GQixC65EqThi1wzHUTsz7U54lYmqvIrR14gabQsuJKcpAFBI1kjHOrb0AZ1OyBc5M60ea6UTPvoTQemuWA9KzBRgu4g8lHFQU4Fztdxy68IY/6l1tfJTBLzeXMc1xQGel9GYAYQCHJfkBMNS5klncKNjImBg4X1eUHVBroTbOJI0K6RHzizYy2RWbqletfRh3DdsMxPiAkCl2Jf4cNmG6HcjnQi4XkVAGgP1c6OHWp9/ubLLxKnbTFgNdwLesn+TvgEXTvUTRwjSmJeJ4PEfgNAOHAs5i5GJ+XW/4tdBFAcRslDmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 01:59:45 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Thu, 18 Sep 2025
 01:59:45 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: sboyd@kernel.org, thierry.reding@gmail.com, linux-clk@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pei Xiao <xiaopei01@kylinos.cn>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject:
 Re: [PATCH] clk: tegra: super: Fix error handling and resolve unsigned
 compare warning
Date: Thu, 18 Sep 2025 10:59:42 +0900
Message-ID: <2792406.iZASKD2KPV@senjougahara>
In-Reply-To: <3841056.aeNJFYEL58@senjougahara>
References:
 <03d0c47832c7a0fdc19733d15077197ad2c54946.1756430095.git.xiaopei01@kylinos.cn>
 <3841056.aeNJFYEL58@senjougahara>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::15) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SJ1PR12MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be91a6d-5a08-4dd9-9f4e-08ddf6570a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3Vxb0t4VTYxOTAwVnlmeTd4aXo3KzV6bWJ1bW9nVzNGVjhpaHpHaUN1S0Ur?=
 =?utf-8?B?dWNERHRld1VwazlzQkN1TUFDMWRNNEMwZjFYOFVKNEx5aTNnY2U1UE1UdEZ3?=
 =?utf-8?B?c01ZNG1TNmJwekdrU0NOMDM2RlA0Q0JhVHpmblhaZGVZb3FTbmdTN1g0VVZV?=
 =?utf-8?B?WDdJcTVwaExhTCtxaHRoUmw4UUVXZVlBSzloMDBvRzNkZGExODQ1dE9GVm00?=
 =?utf-8?B?a1lpdllmOW5FeCsyNHBuaXFHRjdWVDBNWkpqUE1BaWxqaHhnbXhqNTBYbmhM?=
 =?utf-8?B?dDNBTDRjRUZpYWpTNEpxY1hxdVFuWGMxU3JKeHpKL0dsTG9DNWVyVDg2dDR2?=
 =?utf-8?B?VXVodmEvUUhuZ0dxcUpIUjMwbCsxRC91UmwyaFliK0R0MThFWnlFUVlUWUVR?=
 =?utf-8?B?RUkvdzhIUTE0Yk4rSGFQMSt6MGdwRGs2OXZ5QzhOK1FKNXpuTHhCcXc3djRh?=
 =?utf-8?B?ZmdDblRGZmk5TWlsL3ZTQnhONUhzS3JlbDN1NXBvYUt5QzY2L1ErRWJFVU5S?=
 =?utf-8?B?QzRncW8xY2Z2bm1KS2MwVDdUUlVwTG5WR2k5cEJkTWFGZXJQU0FvczBjOWZq?=
 =?utf-8?B?bzVuWjhiQWZhYzRCaDlvaUsxdExlV1EwMnR0NUpwNHpHcUpXc2FaN013ZjdV?=
 =?utf-8?B?U21sUmhsTmVrT3NlL3BLS3ZIQTN2M3JQT05YQ0JrTkwxcHhWUDAxWStXU0dj?=
 =?utf-8?B?UXU3Ti9mZk05TjhqOTJ0Q3JtamFETTVOellxbHY4KzFFSm9MNWpnSjN1TjNW?=
 =?utf-8?B?eFdKVmFWZ0xrc211T0F2Szl2U0lrUkVxWmFXZEdtUkhpNHByOU9mUGhRUFZU?=
 =?utf-8?B?NDFmNlhuby9YVXFRZS9jWWdoY2dzS2VBMTY2MnZ3QUVidjFMSTJIS08xRmtj?=
 =?utf-8?B?Mm9Eemp2cjliRDZBTkI0NENLaUZBaUJzWUxWUDZaTTVFN0lZZTRyT21QVmJC?=
 =?utf-8?B?TGI2YmFVN1dhNzdnN3ZaRTFmcklrZGUxVWZ6TEI2YjZ2SndDM1BsQ1k5R1dm?=
 =?utf-8?B?M1d2L1RMRmV2YXRQaWtZQUVhc3ZSbEtEbmVwd09VbjJ4UTAvc0RlZHBwT1lt?=
 =?utf-8?B?QUVPWEJzZmV5Z21XMnFRcVI5cWdpc1k5bjN6RzEyQnRJVDZrSlR1bit5eGxn?=
 =?utf-8?B?MElaVHVCTzF2UTFEWmZ1aEZHdVpiRWNINTlzaWkrMDZQNUlYak5IY0ZqWDNk?=
 =?utf-8?B?Zk0vcytVcHZicnZZOUlaZFN2Tytsb3RiYUpLcEh2eXFydDBqS3RpSmM0WjdQ?=
 =?utf-8?B?L0JhU2ZCbDFoQkVxVEcrVmZvZEtYaHAxTFNFbWwyWjdFUTBLaFZhcnY4cnZT?=
 =?utf-8?B?L2dPTFZSalFBTy82NGoyaGVwWDVmOEg3K1RzK2pvZFdFV2VEY3RGMW01VDRB?=
 =?utf-8?B?L3Zybys4VDZ6S2tMOFB4VW9RWnNXYWFNRnpuaGN2MmsrVVRBcm8vOXlIVVd6?=
 =?utf-8?B?V3NnWk0rQ1BocmthR3J3WkZtbUxGRnBPSytVZUtzNFR3MkNlT2JlK1I1dWJN?=
 =?utf-8?B?Q1pSR0xKU0NIS1p5ZHo2YlJlbnFpZlkzMEV6QlFUb1J3bmR3Z2FuZ2Q1YnZx?=
 =?utf-8?B?THlBZUNOSFp1clpBS2xtL2NtNlVGYU5sVWRrc0ZiUVlENDhSeXRpYWFxRmc3?=
 =?utf-8?B?NVFZaXZjUWNyRW1XYkFubTR0eDIvT3hBaE1VUkNtZWI5V0VIN015YStadWhx?=
 =?utf-8?B?aURwYnJlcThKbE1ac016N2J6OGZ6ZHJvZ29qaHVqT3p5Q0NVR2RtNmlkaUpG?=
 =?utf-8?B?NUhVYU1tcFBKWVJjWC9tRE5lNVB3RkI1S21ERWNoc2xLR1pSeVdRVUFxeFJH?=
 =?utf-8?B?aG1aejUvQmxlYkNqWHNhcVlET3REVTArTk4xYTVKYU5tOGxoWmYweU9jQ09L?=
 =?utf-8?B?ODdtUEQwbmNUM08zNFNUTE9haDFLYjEvMWxCOUU3SlpycWhFVTBxaGlvYS9z?=
 =?utf-8?Q?Hq8/wWTvvvI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0JrY2hTWlcwdzVhSGQ5dklvUXVaTEZtbWpDZWJaM25udFpHcHludyt6NWlV?=
 =?utf-8?B?Skxvc09rRWJzZUhGVVJheXVPTGY2RmZpVTJPTkpyNmoxVVZ5RzQveGQybGl1?=
 =?utf-8?B?QmFwZ1k2bVEwZ2JjYTV3RkVVWGNCQ0I1OEVHb0FPdnJ5U3NvSElTcmpLMlFO?=
 =?utf-8?B?ckpzeWU2T1loaFAwcVhab3htQ3QrWmdkZWVLMG5aclkxRzE1Q2E0V2hIZDlq?=
 =?utf-8?B?ODVjYVlPVlVUMkJNdFN3TG11YklHZmsvSldzRmR0ajB0d3lNbFRYeThmVVky?=
 =?utf-8?B?K2pvVVJobkxST1ZJbFAyek5TVEk2TTVjSHFmN3dSaUhtL1BTY2dpbnlWajBw?=
 =?utf-8?B?RitDUDNBTmdsTk1GdUtCMHZFOFBpejJEOHdWS1JDblZmL3JHYVJOSXFQN2Rw?=
 =?utf-8?B?VFJlekdlWDRmTHd5Tjh2aDF6d0ZNc1cydThuZEFQSHNwK1NoSXpIazAzVVlz?=
 =?utf-8?B?ZDJvUStPMVh0ekhSU1JTc3RsV2lkUzAzeDhTTzBLWGEyd2pYTGE5YUdoUUc4?=
 =?utf-8?B?YzBjL0V5N0dFQWhyS0VEdTlqanRRUnJabWk0dFplS3R6azZOZWVCR1BlY0lT?=
 =?utf-8?B?RERGdEp4Tk43aEsvdzhsZXZqSXdIM3R3NzBqTlZXeWZnUWxXbjUvN25FRWtV?=
 =?utf-8?B?ZE5KTHl1VzhoZmtQWGphWWg4Z0dNNEM2L0xYbkNGQzE1S3UxeklsYXVPWit5?=
 =?utf-8?B?ejJjdTNXUWhWWDFGTktLcThLdmVHWk9jM1I1bkZ4UDQzckVXcExiakkwcWxj?=
 =?utf-8?B?a21UWDFxSGxyQ01aVnZqcHFQeEFHajNCeDBKenc3aVgxSmRDT2JEanBDM0RE?=
 =?utf-8?B?S05rOXIrQmdXYWpuT3pZQ0pDMTYwVVc1ZXJISUhyY3V4a1lJYnVEMUkvV2hv?=
 =?utf-8?B?dWJJb3N0bGVkVDBRUTc1b21kNnN4aDRzRG1wZHlJK051cmNSb2I0UVpOZHRm?=
 =?utf-8?B?bzRRRFkwY0FjdUEvdWFna0xrNUhad3N5dkNlYTBUNmJEZndZQWdxOHR2M05O?=
 =?utf-8?B?ZEVRNG1PaUthMCtxS0xjWXVaWnNRM1BlaFdjalFYaGQ2OWNSQjdkSmJ1NzQ1?=
 =?utf-8?B?OWdwUDJjamJ1dUdpM3g2OWJmMW1ETm5TUDVIVk1aZTNuZDNnajFiYkI0NWp6?=
 =?utf-8?B?eGk5c2FZM2pZK2d6MkNVeVFwUVg2QWJpYmk4Z000NDFRb3dTNkh0YVhvR095?=
 =?utf-8?B?b0dGMStNZ0k2a2puM1dpZUpXcXhEbUZvYWRaNGxUUi9xWWJvUFpEdzc2USsw?=
 =?utf-8?B?eUxUQ3NLalRoOUVLc0FSWTJMYUk3Qy85TnF0RllaaXRyZHRLK2s0MHBhYi9H?=
 =?utf-8?B?dUlVb05yNnk3SHVLZEp3MnZSRlFLTVQxMXlDS005WWwvUFNuWGNGd2wzRy9U?=
 =?utf-8?B?SVFnK1pKYklUQnZpUElKOE9RakJpdUtKRXJHS1FqOXowQlFtSnk2VGp5S1Fs?=
 =?utf-8?B?N1NoVTIydUErQWlKcUR3aitReGNMMklHK0ZqVVhWZUxPMjR0V1pBZER4UTdR?=
 =?utf-8?B?ci9CR1dMVmV6eU5McGhLSlJGcHczZm85ekJFeVVTOWsrc2xOc2lINC8zMzQx?=
 =?utf-8?B?RVczRTNKeXVUU0ZxSFF2RVh0S2E3UHdiODdGck1FbUNvYmFxOUEyek44bXM2?=
 =?utf-8?B?d2FRVHMrbEs5NWw0ZTVDLzhCWllYQkEyZFA2LzdudTJ6SldjUTRmUlFnTUo0?=
 =?utf-8?B?TEZJdUtzZldaS09SM2tOQ2ZCZXFpVkpvZGpvcTJZdWxsdDluZ08yUzF5QUo0?=
 =?utf-8?B?MXpPSy9kRmhocUZlNVR2SjYvbVRXYzhBWUxuVDEvYnBrY3BzUmZIbHBQWUtr?=
 =?utf-8?B?cDR6TlAvS3VhSVdJdkY5UTRzU0g5WnhkZUNwK2FFQmxvcDRrQ3Y3UFQrRTFl?=
 =?utf-8?B?b3pmRGlQUWdVeDVsc0J6VzAvOWZkd1VNeFJSMEJRR3V0cGVMc2xUOGtUVWI0?=
 =?utf-8?B?c2gvUVJLdHBYNWd0cTQ3V2p1WEwwbjZtT3dYUnV2dk1Qb1cvYXU2OXhwcDFS?=
 =?utf-8?B?enRCV1RtUHRDdVB0VDNacktlZmc5TUM0TW9wMzFvOXRDRDFEd2pyWEIvZVRZ?=
 =?utf-8?B?RHg4TnZoaVVpeEM5NGRzVXBld25rd0hCcnE3cWEvbkZXOGZwUjlFOFlDZExQ?=
 =?utf-8?B?VVBNTEdudmowcXNHWTVEaU9VNi8xNkFRKzlYNFFUMmptQUR3K2hyZW9SOU9B?=
 =?utf-8?B?dnRqeVUraG5sdzhnNTJJREMvbDZWdTFKSWJ4anRBL1YxL1c4Q0dYc0JLN3hy?=
 =?utf-8?B?Vm13QlZXWVhTUGJjd0JJNnFLcWtBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be91a6d-5a08-4dd9-9f4e-08ddf6570a7d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 01:59:45.6312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mpf4Rmqov2GUPv0MZ5H18yFG68EI+wv71PDVuY+ictLDjDCAqyYzcIB80wZrZQpKw6woqjiBTe+TedM9WOScQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313

On Thursday, September 18, 2025 10:55=E2=80=AFAM Mikko Perttunen wrote:
> On Friday, August 29, 2025 10:16=E2=80=AFAM Pei Xiao wrote:
> > ./drivers/clk/tegra/clk-super.c:156:5-9: WARNING:
> >         Unsigned expression compared with zero: rate < 0
> >=20
> > The unsigned long 'rate' variable caused:
> > - Incorrect handling of negative errors
> > - Compile warning: "Unsigned expression compared with zero"
> >=20
> > Fix by changing to long type and adding req->rate cast.
> >=20
> > Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> > ---
> >  drivers/clk/tegra/clk-super.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-supe=
r.c
> > index 7ec47942720c..643b3cb83cd0 100644
> > --- a/drivers/clk/tegra/clk-super.c
> > +++ b/drivers/clk/tegra/clk-super.c
> > @@ -147,7 +147,7 @@ static int clk_super_determine_rate(struct clk_hw *=
hw,
> >  {
> >  	struct tegra_clk_super_mux *super =3D to_clk_super_mux(hw);
> >  	struct clk_hw *div_hw =3D &super->frac_div.hw;
> > -	unsigned long rate;
> > +	long rate;
> > =20
> >  	__clk_hw_set_clk(div_hw, hw);
> > =20
> > @@ -156,7 +156,7 @@ static int clk_super_determine_rate(struct clk_hw *=
hw,
> >  	if (rate < 0)
> >  		return rate;
> > =20
> > -	req->rate =3D rate;
> > +	req->rate =3D (unsigned long)rate;
> >  	return 0;
> >  }
> > =20
> >=20
>=20
> The proper fix for this would be to implement and call div_ops->determine=
_rate instead of round_rate. With the cast-to-long approach, rates above 21=
47MHz will incorrectly show as errors. While for this clock in particular I=
 don't think we can reach those rates, I don't think this improves the situ=
ation either, as the round_rate implementation invoked here never returns e=
rrors.
>=20
> Mikko
>=20
>=20

Looking up the list, looks like Brian Masney already got to it.

Cheers,
Mikko



