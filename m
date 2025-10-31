Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011043.outbound.protection.outlook.com [40.93.194.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3286A17C77;
	Fri, 31 Oct 2025 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761907652; cv=fail; b=R3RyHhf2vKhDnA6QKRfY1bvKhTIzzq5DCSQY6ZYiKIFdmq2dWxm3XTZM1l305xXOrJKdGg9fXPiSHixP4rOqia3DSl+21ZT4wcSvRNVe0kDOt3E08MzmFVaO2fkJ0L3KbHbfBnBCKdv1lYnxDtkPJ7rTdbqR5/ctWMMVdxCxZZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761907652; c=relaxed/simple;
	bh=wFjb22fWHDmePgCJRcnB0RwseucGqQ+HPE3DPAJFy0E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Uzu+gambw0+vHcUpUZuP9Kd2FJa7/jUj7FcDOFxwpQVpM4RbrZF5pMbqK0q1aEbf+4Zrr6dFH49xeWbUBonxq5Ko4lJY/OFJD8qK043z+w0ox9aUVKSge6wWlKX9ouL40AixUKrwzkUgjhO8gog4MPGQmkZX5yxc47Zo4KTdbdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V8aDldv8; arc=fail smtp.client-ip=40.93.194.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V8aDldv8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XybYz+rSO1F5sgmZdMsX3ejMgThjDzctqGz47zK3JmAwQm2X2XhYpCSddFu/qAMFNV8FODItofIcroANubn4Jd/lH7g2I120iONbr02QtTKvZWBOOewCnTVVD3mLXvlYDSqLLCemqfmIdriIG7lD2LPywEYRyaVDHCsBeSP8qmE4xu/xE0HvW7OQOuva7UhCNop73wWt0Mibe4spKkGRamTliK5R+AwfE7KaPd6PzeYzSXX9A1IwCkVZM3rII9liFcWW0ttIRT37axGLhqIImKWCW90i5WoAkeMhahd2Kia8TsK+60GNc4qQY+aqkwTOhqfSCo3t9DlLOpx5auUM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iDQTgjTuU9Mdjfvtfqx7rdrn5er8RQ5IoCVnQKyVko=;
 b=A0grgRxkKFFUUPO5m14DT5SdS7PDz5al8mFKjbPgdAmtibuoMw1iL8CmiXpGApqaQjT/WgN3Cc4SuQWcLfHDqAleRpKwaB3y037iC69O6+t6HGxEyVT2tr7+k+YFgqN2+EvC6/ZRc/FtxjJtNESlFUSeWacoXu2vY1FwdfWaHq/Xt3DvIvJ0JheatatwEfnVsczifmvOfypfrx3KAN8Kq3iKbEbWNYqSjm2MDkKEOo3WQPztSsRwazkIAMLdUmORTw5l4VBOoKO7xu/8DMicKOafScdQdFpohJBtwXa2cQ5m8TXQYhNiHO0xKrOpjUhtXWCgUYqBH27AKsyGm07L3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iDQTgjTuU9Mdjfvtfqx7rdrn5er8RQ5IoCVnQKyVko=;
 b=V8aDldv8wblm7sLFndOZqH8ThZI7eyU4K9DT7S96vpBkJK6ngbluEADtsUogplrBON0I3/IMvgNQT4PdooiYt2mJ4Wf3fJkSATuzFP2R4t7oGyTuBFpgKnfMlSkyC+ViCKcEhVsdXY96+qJ2CL7o5SYjR2fN4kNagcvy/K4zpAYkzYfpM2/uM3Q4KB2j11lTSMIxEFYlPLVysBqdoTd4KjXlsMwpUrYtD/fb4NIa/vzGnw3byVDTX8jwNRhooRCJ1F08j9w6e6Ba3hVRrvPcGeEmTQ3ucLL+knBPhLwP0JtilOynIbHNFdpWB3Qai2FpjwHT/7Ni65UrC4hmzKHcsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15)
 by DS4PR12MB9564.namprd12.prod.outlook.com (2603:10b6:8:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 10:47:26 +0000
Received: from SA3PR12MB8761.namprd12.prod.outlook.com
 ([fe80::4d63:f057:7c2f:c157]) by SA3PR12MB8761.namprd12.prod.outlook.com
 ([fe80::4d63:f057:7c2f:c157%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 10:47:26 +0000
Message-ID: <00c5e342-50c7-44e6-89d3-3b879742c204@nvidia.com>
Date: Fri, 31 Oct 2025 10:47:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: tegra: Add reserved-memory node for P3450
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
 <20250803-p3450-mts-bug-v2-1-6307125408c3@gmail.com>
 <8ed69b4c-f656-47fa-a247-1c8d94dcc35d@nvidia.com>
 <CALHNRZ86NjcNJhRJd+jtD_7fRTFJ2szPFAAN3HSad_xwnVrHWQ@mail.gmail.com>
 <0049bde1-15e2-4c33-8de9-49f3df0d7650@nvidia.com>
 <CALHNRZ_odC8jcu9h_ZKJ9+449pBhmYfXF=vBkprxYkqXhabM9A@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ_odC8jcu9h_ZKJ9+449pBhmYfXF=vBkprxYkqXhabM9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0251.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::19) To SA3PR12MB8761.namprd12.prod.outlook.com
 (2603:10b6:806:312::15)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8761:EE_|DS4PR12MB9564:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ce30e1-a0c4-4e3b-5459-08de186ae170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czFCd1E1MWlUbWlCc0V2clY0TzRndG5TaUx2dUc2UEZxWGJPNXQxYTFJeXF4?=
 =?utf-8?B?bnM0dnNQRStEMUM5KzZuT0R2cEJjRmpMZUF2Q0E2Z1VtOUtaaTRWWUdhcFJD?=
 =?utf-8?B?WlFxYzZjUktyYWVtUXRzVytIcEs5YXRBUU03aFNqVHI4S1VJRGFJZ29ncW9T?=
 =?utf-8?B?VHVDVkp5cmxtUDdEbnJFamlCcVV1Q2tKbkNzVHdnVk5WUEhLSXZKbER6NUlE?=
 =?utf-8?B?dEYwK3phejZWTi9aa0g2anRVNGR4c1g4OGN3MC9oRVpWYmRNQU1IZVN1LzBl?=
 =?utf-8?B?YVRZTjFGcVFPc3lTMmJaZlY3YzRPQ0x6L0MyV3NNZGRqaUJRdGlqQ2VkMFZ1?=
 =?utf-8?B?UW1pWUpXcFVubzNER0VlZi95UDFrQlNjb3pHcUxGbGFHQ0I5TTcwSjcvVjZy?=
 =?utf-8?B?dGVwaGdFT041bjRVd1drRVlnQ3VaWmJRaGwxK0M3OW9ORXByWll1RTB0dFY1?=
 =?utf-8?B?cTFlcEVuaXEzeTJVK2hCc0g4QUlDTUxDNVF4WWRVNHpHdkNnb0h0U1hCQ0VT?=
 =?utf-8?B?UnlUai9WZnJYNTQxckhKcWxlZEkyWDdEOG5qTUhMTUlONmRVQjRISFFxNmRK?=
 =?utf-8?B?R1htR1ppcUVocU1GQ2xTTUJNQ3BCTExOZ09CMk1UWExPTEhYa1RVWGN0RXNT?=
 =?utf-8?B?cGE5cE5lOHo0ZVVJNUdWUHE5Qy9RRHo4TmU2ekJ0WkJoWWhLMjlwWnRRRjlj?=
 =?utf-8?B?Z1RvQnUzT3RyQVNyaUpVbG1OU3p5cmZ0dFdBbEIzYW14RVFwV1c4M21qRkZQ?=
 =?utf-8?B?eDR5WWF1cWtRdG1ySXBhaDRKc2VpcHBVQkZQSXZERVk2cUpDeDMzU2d6dWVu?=
 =?utf-8?B?K0NXZmFnam5Qa09HWHRPQnhqMnpqc1J1VWdUOWxSeU04QWQ3aWxMam9pK3dE?=
 =?utf-8?B?MGFRdnRtMjgzaTJzU3ByZnVZWE40dzdscDBnVzkvVWdGa3ZLWnhXNWVGTUpP?=
 =?utf-8?B?dVpJdlVwdTVCbmVRbkZaVFphQWthbWRCMlZtQkJnZEpmZFRLR1hkT05xd0t0?=
 =?utf-8?B?dDFOL2xydU9ETy9MTHBZamp6K1FsMFJhVGNabWZYLzBvRWhpdG5FUWRleW5M?=
 =?utf-8?B?YSt5NTJUcVFCN3B5YlB3ZGFpZTVXM3pabm1OclJsOWZ1V2pCKzhJSndEbnVh?=
 =?utf-8?B?d3hVUENEVW9EVXBjbHVOTmpKMXJCdUpMUXVKUnFZM1Roc0pQb25vSkwrckp2?=
 =?utf-8?B?eDg5Vi90dlB5RlRXVHlMcG91QjZ3NUJqOHVyR0d0NEdxOTBuemwzcVhNM1hD?=
 =?utf-8?B?bmd6ZGhWUmMyWG9YbnpYd0szVWtEZnJaQ1RiaTNCbVZDTFYrQkU3R0xSU3ND?=
 =?utf-8?B?Z0EySC9hRDZhdU41UEhHNmdJclVETGtSZVJUWHM3OVlCcmV6bmdSQkxDd3Ay?=
 =?utf-8?B?empvcHY3OFR4YTlvRThmdUN6Q0ExVlo0WXlNNGJYZFcvWmpQQThZaDdXVGd0?=
 =?utf-8?B?YktuWlMrb2hZdkM1V3Q4UWpVYTFJdzVMRTlOWjhvOGREZDZNb0JySHV1cklO?=
 =?utf-8?B?SEw3aC9Layt1Y3FvSUJWSzdkVzJ5akVtcUcybGJNZVpFZlZaZnd5Y3c3d2dx?=
 =?utf-8?B?RWJ4K01KNjFaZVo5aG0yK2dqWmNuQnNoUzF5bkU0cGt6Qit1d2JvRXA4M1RM?=
 =?utf-8?B?TEpUUWtpajhuMHEzVWFLYlFZY0R6TjdJcURNeEMyLzhDdXlCc2M4VUZIRFFo?=
 =?utf-8?B?SVBDdzY3ZWpsRkc1am9oT2d3cUpBaEhjU0VveE90ZjNOZUZNaTY5NVdsOTdH?=
 =?utf-8?B?bS9ESFVtLzgzRVZncVhJT3hXK1VQOUp2cTY5Q2hoUDd3NjNKNzZYa2dIU1pH?=
 =?utf-8?B?QlhVajV0Wi9QMjdsQ0pkbEpwdkdtbjZwR2t6eHZFTFpXNTh3RzEzRE1BRC96?=
 =?utf-8?B?a0hmRHhseDlIeFM2WFU4czlseDRNblgyc0IzSEpZVkg2anFDYUM0amNkekd0?=
 =?utf-8?Q?bPKS7j8oi1cjUMTsHu7BCGBiFxUc5gpw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB8761.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1pKTjZZcW9peDRoYzE5bG44b0s1UGJUNEJoOUh0amIxTDVPZlFkS0xuTElF?=
 =?utf-8?B?eXVHWlBGSFkzcEM0UGlDYTkvMHZxbjAvc0w3bmVwUnFuVnNENy9SbTl3ckFo?=
 =?utf-8?B?WFBKZUdud3k2RUZ0bWF2RWY2U2JzSkpOYUFGNWNPTjR1NXE0S3dTa1ZhMGVZ?=
 =?utf-8?B?a0VrQnNVYVpZa2p5MTFNVXZCV1hEQzFSTUlXd3dMRzVHN3hiU2NZV2NGcEk0?=
 =?utf-8?B?Q2N2YStveUpSQU9mYVY3NzFLaWliN3hJZFpXRXY3YzdybTgrb3Y0eHI5ZDBX?=
 =?utf-8?B?VUNJSU9haExkTWRLcE5IV2JvN3Fnb3NFNEcwaStIRjIzWno1ZGJDekw5d2h2?=
 =?utf-8?B?YUltWUxtWkVXaFRQZHBNVU1ZNzUzQW1VSnlGek0zUmF0RldIRUFBMkdCNGR1?=
 =?utf-8?B?VXhHQ2t1S1RjdWpNMm8rcFErQ0tyTjl2cGljZGxLTVFyTWdmTVl5Yk92UCt6?=
 =?utf-8?B?UVZkbXpsUk5pS1FFTFo2UjRjT0FzNWdNR2M0OVp3V1hLMDFqTlEyYldCYVhL?=
 =?utf-8?B?YlZDY05tdEVGMS9CVzQ3ZVVPYStSdGlRZy9sWmRFK1pvWnByb0diOFZCajdE?=
 =?utf-8?B?cGNGMDlYejgwQk5XVkpDVENRbTFNUDFFWnBvWWQ0QXFOT2NuRzZwalMyNFhK?=
 =?utf-8?B?Sjl6blE1Z0NXWlhVQVFjRlB1Z1cvd0x4VktGRUtqQmp4RjRjNkhZVHRkUGMy?=
 =?utf-8?B?V0lCL3RwTExpL2Qwa2wxbzJadlJFUUJaQVJXekVkWTNsejNWOVZxd0RKbS96?=
 =?utf-8?B?R0oxL3F4S1FXUEd2V1hGdXRGemZmclVCYkVBU0Y5WXVPQ1NjbjNzYXlYNXhV?=
 =?utf-8?B?QXhxbWZISUNxcjZ3VmxRNVU5TTVUaldlMDE4T2JaQ2t2Mkk2VUcwVFluN0tZ?=
 =?utf-8?B?ZUVqRm9xWWNFTy9LT0RGSjRYTUZDaVpGbUF4ODlSTndPOFlRQldGclV6eTFw?=
 =?utf-8?B?RzVpc1JMdTRnU2JnVDIrWFJvL1BoK0NINy90YUNVL3FKa21UdFVjOWR3SmE5?=
 =?utf-8?B?UVVua3NpdGRuaExHMERSWFVpUFY4Mk9qZWN0WUIxVnI4RmZwMHc5WnYzeHNX?=
 =?utf-8?B?YjgvMGp4R1piUXZoMHg4RDRydEZsNTlLSUNSbWFxZ2ErK29la1hnSDhKVTh4?=
 =?utf-8?B?U2lXNzVSbFNwdkpJMWdDVDhxd0U5bjU0Ykc1Q3VqZjdYKy9Zc3RzWG5oemlm?=
 =?utf-8?B?WDNTMGR6ZjNGY2JmYWZ2WGZBVGhWVVVqTHhDYW9FZHpOQlNpbVBCeWJuT1RS?=
 =?utf-8?B?TkQ5ajhaYWxGREMrdVczZHhSNTZTYzFGbDNta2ZtVC9Oa1BWVUVJczVSbXlM?=
 =?utf-8?B?WVRIQW5sV3VMRWYxODNiOHFtQjVpS1BidVdZRDVtR2Z6TmVoM3JtbHNpU1Rv?=
 =?utf-8?B?Qno5T29MeVNWbmt5WmNwaVZqSXRDVVZGWWJrTk1WRkJtL2pMUzB4NlN3dWJP?=
 =?utf-8?B?OUUyK2JVVXBlZWdtTmdIMVl5Z0RHNGxpL0hUSmhPeGxta3hvM0oyKy9TckZ6?=
 =?utf-8?B?aWx6bGZ5TVAvcktMcnFFZmp6UmJNL292NG0xMitaeG9vN1kyL2pqTGJiRU03?=
 =?utf-8?B?bWJ6QUdwVjBDcUI3R2g4RHNrNytMaVA1ZjVsODJ2cEI2ZUV0cTZtNFJQOFVD?=
 =?utf-8?B?T1FaMHB4bEk4SkV3YjJ5cTluL2lQYStKOVNaTmE2a1FpQndMcXRyOThMejN5?=
 =?utf-8?B?ZjhOR3Rta012UDNyRGFPS0lHTHUwdHBacWpwYzVUZWxIM2ltbzhsZmZLOUxu?=
 =?utf-8?B?V1gxcnlGWnQzaEM5TlE1REFCZStUNlg0UGt6TjM2TlpVc0phWVZOWEhucDJ3?=
 =?utf-8?B?R2ZvanpoOHU3L04rNFQ0VFozTGpMZklBZjR6anZSVEtCNFdudUw4dDJpY3Rp?=
 =?utf-8?B?bnYyZ0FUNzBmOWpXSHFuRXI4NHVXa1NIWjc1dXoxUnhwTDZldWQvblkzZS9u?=
 =?utf-8?B?SWx4UmRJNEJXelFocWprWWRyY3FXakttRm1YcjlPUjN6UVIyVVYxeEhVMVgy?=
 =?utf-8?B?ZFN2aDJCUXNDb251azdWZUNqeTJsSWsybEQyVDJ6UGxQOXNMMmcxdzB4NTNJ?=
 =?utf-8?B?VTZ5Q29pSGM3V2toL05ubFRNd2pScmVNR09zQ0hQM3VJZENFTFlyb1Z5MW1L?=
 =?utf-8?B?UHZJcG85dkd1dU8veWtIa2E2QjVRQTcybnRuWm1pcDM4VFZPU0lKN1BuMkFV?=
 =?utf-8?B?dGRlaW13N0YzNHJwZTlDeFBiZUx1d2tvN0hWV3NRUHRHdlprZ1FuR2c2K1Zo?=
 =?utf-8?B?QnVHWTlBQWw1Ymd1WlhGMy90VU53PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ce30e1-a0c4-4e3b-5459-08de186ae170
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8761.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:47:26.3688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnvLnN4hGBlLL/w0jCj3BnNXX16RiRrgMWdmWt0ZUGo/DBCRoaTZjzzMKJZc5CTEmkuyWBm8Qw00GVm5PJidSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9564


On 29/10/2025 19:54, Aaron Kling wrote:

...

> So the problem is with memory training, which is run in
> TBC/nvtboot_cpu. Iiuc, which is a limited understanding, mts primes
> with the dt emc tables from the bootloader dtb from RP1. Then if dt
> emc tables exist for the kernel dtb from DTB, it will copy the trained
> data to there. And on newer l4t versions, I don't know which version
> that started on, it will copy to a reserved memory location and set
> the location in the kernel dtb from DTB. This piece will fail if a
> reserved-memory node doesn't already exist in the kernel dtb from DTB.
> Causing the cascading failure described before.
> 
> For Android, cboot just boots an android boot image on LNX. There's no
> u-boot, extlinux, etc etc. I've got the downstream dtb from RP1, since
> the bootloader only works with the downstream layout. Then I've got
> the mainline dtb from DTB for handoff to the mainline kernel.
> 
> Extlinux isn't useful for my usecase of android, but I'm in contact
> with people using Linux distros. So I'm curious if your setup copies
> the reserved-memory nodes to the extlinux FDT. Like, does the emc
> driver initialize properly and allow scaling?

Looking at the boot logs it does not appear so ...

  OF: reserved mem: Reserved memory: No reserved-memory node in the DT

We can apply your fix, but may clarify in the commit message the exact 
scenario where you see the bootloader 'corrupt the in-ram kernel dt' 
because yes this is probably only seen for specific cases.

Thanks
Jon

-- 
nvpublic

