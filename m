Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2064.outbound.protection.outlook.com [40.107.96.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A272DAFAF;
	Wed,  3 Sep 2025 07:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884581; cv=fail; b=U3mfncgBos6hWcgl9O3s0I1l4VC9iHgGoucdkm9rUK4+/ffzW5Ck8OjTYlckwqL5TZ4QBOc7IRsxNS+6g6zdajRJFZGvcw8MwzSEzPFbmQFvNTINPc8DBnh7aEFlRrxXY36QVf0lSE9JZUMZ/iFnVClrm7UQwD5Qwgfo5oqV9CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884581; c=relaxed/simple;
	bh=g86LrW76sxkbt5BFrUERWYxGa9Qn0j48Z0qjZY4UnaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R3Oia+0kxNAYQwF0POjDVSLtp2Ij+UnpW3bhftzncIPCm62VAYg1732aPrvmd/9xiegkzdoWlqgYI3Q5JnXyy/DUNZFju6ES6xBKiitA/LTrL9QwKHjDzf63lLpqu1SqUgpwv9cp8O8RK2LS89CcFYPA6TG6Dsgyu0TDkuPJGqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=khAAHRKz; arc=fail smtp.client-ip=40.107.96.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="khAAHRKz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldOlEPlHB0DJM03f4v4DNGYbSTyMXxw/p52eUGKfkw/KzX+Z2q+w6o1QQ/aAM4JmGPoE5IM0M3ZDaP3Vq8BRbjMV3frfcWIrPq3QqO7KdwHz/3oB20vwvdE/R1n0goYgSL+I5kgPEd/4UvD3DL0WaJKw0zqAjLLeAaopMN1IgswoXtO4bwoFjyKjQ1Pm8xmZ0ZtJWIx/Wc+S+IpF+kl8/ponLHEm24ey+TFkh6WfsGoBddsnA0q1Apa+zItt4Hqw3WlREb6k+pHH3qwREa7XPCVZJqFYOW34iIqID/2oXXZ+yA7CbZYqDJ3oUmmveT4JHC9be1TkOyoAZY8l7HDIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhJcBOPyQVWSEiw1KRk//AVQdysqg38+P7dvUn485+c=;
 b=LnvhXIhcBILqPyjn1vBiemYUpIwLjCgH+HNipdPxRMDM9+9hLjdAgKb9y4DPHYbMBWMhRBnHhSKhrjchSoDc/nnx6VVWZ20MD/6gwe4KRwTxWyqwbU+u3nsulqEmegqpgnna7mwvDMb8KUAYpdVhjFRiWAPaL00OyJ7MY/T4EEFkrpJ4lo0FFk1QQ4+s+Ktj/2rsPgehs/+OCQ7iCK54/xxmG0e43wd4/FfW7U4f4t/JBxEc9eQtrTvIXuWhYSD5s9BwqqcRyCvV8myEc+SCPrsJvcKWnR7lNCT+5s9UK65tQysK031cw6PeJNJvmUiaBds2eeRux+hS1y/dmv1ftA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhJcBOPyQVWSEiw1KRk//AVQdysqg38+P7dvUn485+c=;
 b=khAAHRKzEcqhOF3YiRTVaE5y8EpzAHr6IF08CUhgdVuY3e74NeX7ay7T0QBD0JYfERkeJLHbOHAOA2JO8P/8Z8ZDY7qDgnTnYfDSyNBhs5f62yxHr4mABM4AAR3xMWVZg/VUM7lYFh/b6ZQPhCQt3auhuj6Ky7tO5WEURWbgw8NZ+iI4/Lp4E/u7Bsuh5QvBD1WYX+Hdd5E7XztcrCa6zT5UW9rJVTjezjKFptROrulVkcp8CuSlIF01rprBSq+Lg1JTEnVQUFT7m8G17H6XJ40P/Rbn1ooY3K6AlDQ+j7VlhKxYtSC1K+MsFpmI8O4LRw7KkNeoUPynR4IhY/WmbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CY5PR12MB6621.namprd12.prod.outlook.com (2603:10b6:930:43::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Wed, 3 Sep 2025 07:29:32 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 07:29:32 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 5/5] arm64: tegra: Limit max cpu frequency on P3450
Date: Wed, 03 Sep 2025 16:29:28 +0900
Message-ID: <26156028.ouqheUzb2q@senjougahara>
In-Reply-To:
 <CALHNRZ8pn9shfq6PdeVe+CEzbq9wu-Vv6UDvD19=MsFrZQsBKg@mail.gmail.com>
References:
 <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
 <7006329.Sb9uPGUboI@senjougahara>
 <CALHNRZ8pn9shfq6PdeVe+CEzbq9wu-Vv6UDvD19=MsFrZQsBKg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CY5PR12MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd87824-d169-4d3b-1fb1-08ddeabba021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1U5M0lVYTNuY0dGRTVKcDdjdVNuVk81ZGVSUy9qV0VQZVFaUlFkZUFTUm9j?=
 =?utf-8?B?cXZBK2pYSE5VeWN1eTU2N05uMzZUdWh3d0hPOE8rNmtwQ0U3RGMrMGVSdmVN?=
 =?utf-8?B?Wm9TdDMydjJYZVh4OENqelpBRUdqd3BYVWhTaW5VcW0wYmdOZ1NsTEtFN0J3?=
 =?utf-8?B?RmIyaWt2QTRWUzBLaVA4VkJndWZ3amtOem5UUnFiM2lJeVQvSkp1Wk1pTDNu?=
 =?utf-8?B?dXg3aWRXZGh3VW9HN0p2TzFBNmhCL0U3WXJzaXJsbVRpRUZEdEp1TXh3dlo0?=
 =?utf-8?B?UmIraDZENzhxMzQ4UjJ6azkxZHh0WkIzbElTaFZZT01sd3ZhNFRHSlVEWFE4?=
 =?utf-8?B?TW93VzJOS3Y0bFE4WjZIbkxKMnIvVlUrbFhsa2JNVElITCs5RXNSeWNuMnky?=
 =?utf-8?B?NjhkSForbW5ydHBjV3FNQVc4UDBUUDZtaXdMdTdLRzhuRVFXTWN2SUNaM0tW?=
 =?utf-8?B?TktacHh3Vm1haDl0VDM5N0xSdkpIZ053aHBmRVE5UnVHZ0I2dUl0Rk10U3JH?=
 =?utf-8?B?di9QN014WlVsWmdHRGFGYkdNRk5Na09oQXAweG9EYkZPVTJTTS9Xb1pBWkls?=
 =?utf-8?B?OEdXNnlsSW0wVXc2cFpCK25VcHlMT2ZNMml1bjhHMVVvM3k2dVJiOFRXbzVR?=
 =?utf-8?B?dzMxZHo3WTZtYmdEWU9CcnpJd3F1NmwvMnE0S3BWSS9ia1RhWjlHdEYyMVky?=
 =?utf-8?B?VWpGMDluQVNreG9UcS9WR3RiaVFISnlBM05NTVdDTVVMOHl5eFVORWJhYVN5?=
 =?utf-8?B?OGdvbXYvam1nVUtxczVtdEFTMDNaSGVIZGNrc2lzNlo5TGsyNHM5STZMVnUr?=
 =?utf-8?B?dkVJb0FYZm8vaDFENWVwUDluNHkxTHlvMEk3TjlJZ2JSZ2YvYy8xUlAxMGV1?=
 =?utf-8?B?eEdoNFFSVitUSW9xT0xEMFRYN3FhZzlqZlpNR3NicnBlTnNYQ0MraGRVMzkw?=
 =?utf-8?B?aWJzZmppdHQ4YjZHdTVtdUlnVzFtaXJEUndya2dQdVRkZHM4Y1JoZWU2OWJ5?=
 =?utf-8?B?ZWt3c05zNVBGTFU4Q1hzN2ZjOG1DTmlHcGpUL1VCRGM0NkJqUmR3N1lJMTJn?=
 =?utf-8?B?U2pKTThWeXFsYXh6VzU0RTQvbERFMmtNS2FEb3lsREoxSk9Fd0lxSEsyOFZ0?=
 =?utf-8?B?VGNTNkk4L2R5L2NqalRBUDRjcDR1a2tuU0ZPVmQ2cGNrTVdycHo2c3gwd0dK?=
 =?utf-8?B?d3JiZkMxdVd2ZjVKOW90WHpSN3V0U3JLMXZ0UXYvbHF2SENaeVhCNXpxUmhr?=
 =?utf-8?B?MWYvUDEzQWhHRGdJUHRDMXZERTg3T2JORHpBbnlyWUYwbEsvK3VjZFVnblBU?=
 =?utf-8?B?WGt5S2F5eWZUVzhsWVN3TTBET2V1a214L1ZFRy9mQnJEckI3NnliWmlHL21r?=
 =?utf-8?B?QTI3OGovQXlSa0kvQ1FmelYrMitUc2NLNGRPTDBUcGtlTllKYnEvU1drRFJi?=
 =?utf-8?B?dU5EOVpjYU5QTklkS29iYkgvK24zd0thT3g2RE1odmZNejB0ZlhLNmR3bTBL?=
 =?utf-8?B?czRZYndJOWdYTG9GU25BOHV5T0R1bkRwMDlNeVpHOWFreEVmejBzeUxqWXlr?=
 =?utf-8?B?WTN6NmNFYzh3MmcrTEQxWEcrcUtuT0VETWs1a29RVUZjTGQ5bXlBbEwyVjRI?=
 =?utf-8?B?MlQ0am5mQ3JUcncwajZZaUdLdUNOTXBoUmZxTUZLRGFESy9HRExhSE9wdndN?=
 =?utf-8?B?cStUdkl4aHZYQVRjaTZqZ3pRTEUybmlCSGQ0NkIzenpET2VCeW5lbG0yRkZl?=
 =?utf-8?B?YWJHczB0UTN0c1dSMjEwK3QzYk1YTnF5bUE0aXNBbEhmOFFBM1VocVZ0UVox?=
 =?utf-8?B?WkNkdDhDYSs5QXFDUGxyL1Fxb1JONXBJZlhqVWY5ZDNyK0swODlJMXBCRUM3?=
 =?utf-8?B?bHhOZkFLTlY0RVU5dVYxOU5kaFRpVXA4UVRzVlJ0cU84OTZRVzExYTE1Vm5o?=
 =?utf-8?Q?spcWwdJu+rY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnlheStSZUNPMHg0RjhuSDR5UU1KbTRYMlFUYnN2YzdwNFBRZmtIZGltT0JP?=
 =?utf-8?B?K1RLR1lWaE5XR1U3eC93YWVSSDE0eThURDlJS05mS3pqRFRsRjBDSnVhK1c5?=
 =?utf-8?B?Y3pRWGxOenY3Q3dOd1hKTFhPeVZsZEpIdHloRkNEcVNSeEpwQmF6SmxPMW55?=
 =?utf-8?B?S2J4UTI1OGMrZ2dKcEFhOXc4L2FIamtiRnhNdmt3aW5ZcDdvWGVzbVUzYnF3?=
 =?utf-8?B?L1psa3RWd3B2VHFEQ2lXaTZNd29nelZVdUI4TjRTMktIWUNwbmY4dVJrWm5x?=
 =?utf-8?B?TlE3V3pzcGZ2bEhhNnV5QUhpSEs4aUYvMXA0dWt3aFRBZldvR3dSWXNDWDNk?=
 =?utf-8?B?Y2pJd0ZLNG9VS2twaExLWWp4bzdkdVBvZm9tT2V3Q2REVVJsMHVmcTB4c1Nm?=
 =?utf-8?B?WUlVa1JlVk5UZ2lqdEhRY0EvSmtwRnkxSGN6alJXNHRKdEpldmh2dE9NZGx1?=
 =?utf-8?B?RC9talpITmdoZXZJNlljWEQ3aUJOVUpPZHdTclBSTzRibDBwZGl5K2JTa0dK?=
 =?utf-8?B?SmVxYXl5VXNLOGcvK3I4dFNucHN1TXZLTlhDZGg2NC9PUkZDVXRhd1l0djVv?=
 =?utf-8?B?SXY3VlAzd3RDRTZtWUtWMGpBSFg2WnJsd3kybUhHdkVaYVZWUFVhM3VIbzNh?=
 =?utf-8?B?bjBYcWNCN0NiaE1DRVNzSy9JMzNENlZ3VEdmVzEra2lENzNTUHE1d0M5OWpE?=
 =?utf-8?B?ZFgxbFJKeisvOFhScm4wcklCWlV1bE9jOU9yNEx0MTY4a2h3ejVkc25PaHdR?=
 =?utf-8?B?ZTBiNWZ1alBUQUZNbmJKMDVuQXJWMTJDVE9hT2NyRE5ERlVzWlhnbS95bElB?=
 =?utf-8?B?SjNzbUNvQzRBU2VqMVgwM2ZHRVRUUXJHMmp5WmpvczNCd3ordDJaRVpURW1n?=
 =?utf-8?B?QUZEOFBJNC9VSUtnUkdMQXNhNE1ub1FMb2xCazNBSDdWSFQ1NFNEUnhrNnZw?=
 =?utf-8?B?Q2NXRzVHS2pnMCttWUFGcGJKd1JtMnVva0NMdlllbzRNcHFPSG0vVnZkVWg3?=
 =?utf-8?B?TlRuUjBPUGFuUDJVeE9VdzZrSjk2UmRDYUprTjIrYjZUL3loMnZPQ09tci9W?=
 =?utf-8?B?K0VLOFlVR1ZMdjdvY0NZRXN6NmVwTXlDYStQckFoalltRThSc0lJWExiK0xv?=
 =?utf-8?B?Y29kdTJ2WlBZZmZlejg5WTFGbG00RjVObzlIelBsU2xuNXBIMHBGa3Z4eTdo?=
 =?utf-8?B?Y0VYUnAvRXRiOEl3U1k3cmpYNE9EZXZDb01DaHhSYWNqTDR6TjlTSGZpK2Vy?=
 =?utf-8?B?WlJDUTJLeDE3T0hsUXFuenp0TnFuVSsxaGdTRjdjcUN1V2MvdlVvaXNZL0Zu?=
 =?utf-8?B?Sm96TVUzNGlmWFpLdUdieHYydGhuTDZmUmZKaUdZa0QxNDErQ3pxeWhJNGtB?=
 =?utf-8?B?LzVWeEdmMDQ1Tnhkc1FCeWNDWFdjUFZGcHFQaDkySmNRZ3MvV1lkd3NlTVVK?=
 =?utf-8?B?Z1k4SnRMa1dJMnhSeGtCeUZFUFhNbzd4ZUtFS3gyZGY5M2xLM3pWVW9malV3?=
 =?utf-8?B?QUhDbUwrMzQ1YnlvZjZTU3dhZWhuWjhMQVA3L3ZacU9NWHZKLzZpQ1RPN1JH?=
 =?utf-8?B?NHZWY1FEdWkxMklmS1JPbVhWc001TmJSWC9XY0pNUkJlcVp3VHh6dWliWDE4?=
 =?utf-8?B?aUZrbXNoUFJlN3NrS3JoNmc2dzBLWDkxZEdwRFFoZ09oNzBlTXZsbHlWazJr?=
 =?utf-8?B?UTM3cmY3Z2hEc1VFL2JLWHN6TThJTzBqUm1CU0pSU1BieENGc2FKSXl2QUNE?=
 =?utf-8?B?bTBkVEYwMWxDbU1QMUE2UUZORDFrTFhZR0QrWVNlYmlDTW5ERDJjZ1ZIcUJM?=
 =?utf-8?B?Ukd4eUY0V2JXVWFWMDdGeDZSNGVEdlRwcWRCTE9DelI1SUhxUFdhQ0orT0Ex?=
 =?utf-8?B?V2lGcHFYSzlaVzNKZ2dPK0dxZmIrVGRUSW9wbXZtN09kcElJR25memhJak91?=
 =?utf-8?B?UzNjb3RiZVJIZUNNWCtvUFVOMjNhdEtLaTl2bWdaUm9OUUU3bklyYkw4eU1j?=
 =?utf-8?B?MVc0Z3h3Q25yQ1B1bldQcVJpUUErdDNqbHo0b0d5VjZIdFJtSzFsenRGNnFo?=
 =?utf-8?B?RHc5OURMQ01xMGtRS3NBSzFOSUZYL1BnSFI4MDBqaDg1dnVaRGIvOUVxdjhD?=
 =?utf-8?B?aGZxdE8yZTc1LzdReUpxSitTaXhuYmI5WmpoR2ZtRmpCMGgvQzRyeEtvd01O?=
 =?utf-8?B?YkVIUkVwUFY2ZndsWU9ZV0lwK04rYmlDb0t5WGxEbWdTT0FWQkRBaXgrT2dN?=
 =?utf-8?B?NXc3ZlZuZWs3bzFCc2xUUFR5bHV3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd87824-d169-4d3b-1fb1-08ddeabba021
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 07:29:32.5979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZP8sqsFeAlhH3iq+m8qhRjgVZ6J/zPUmt3maTsxHQvN+l1NX2oVbA12qjo2XitOaU8xqUpN5Irq4WZV7LEjEOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6621

On Wednesday, September 3, 2025 3:28=E2=80=AFPM Aaron Kling wrote:
> On Wed, Sep 3, 2025 at 12:50=E2=80=AFAM Mikko Perttunen <mperttunen@nvidi=
a.com> wrote:
> >
> > On Saturday, August 16, 2025 2:53=E2=80=AFPM Aaron Kling via B4 Relay w=
rote:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > P3450's cpu is only rated for 1.4 GHz while the CVB table it uses tri=
es
> > > to scale to 1.5 GHz. Set an appropriate limit on the maximum scaling
> > > frequency.
> >
> > Looking at downstream, from what I can tell, the CPU's maximum frequenc=
y is indeed 1.55GHz under normal conditions. However, at temperatures over =
90C, its voltage is limited to 1090mV. Reference:
> >
> > static struct dvfs_therm_limits
> > tegra210_core_therm_caps_ucm2[MAX_THERMAL_LIMITS] =3D {
> >         {86, 1090},
> >         {0, 0},
> > };
> > (rel-32 kernel-4.9/drivers/soc/tegra/tegra210-dvfs.c)
> >
> > Here the throttling is set at 86C, I suppose to give some margin.
> >
> > 1090mV perfectly matches the 1.479GHz operating point defined in the up=
stream kernel. So it seems to me that rather than setting a maximum frequen=
cy, we would need temperature dependent DVFS. Or, at least as a first step,=
 we could have the driver just always limit the maximum frequency so it fit=
s under the thermal cap voltage -- the temperature limit is rather high, af=
ter all.
> >
> > If you have other information, please do tell.
>=20
> I am basing on this line in the downstream porg dt repo:
>=20
> nvidia,dfll-max-freq-khz =3D <1479000>;
> (tegra-l4t-r32.7.6_good kernel-dts/tegra210-porg-p3448-common.dtsi)
>=20
> Which in the downstream dfll driver limits the max frequency it will use:
>=20
>         max_freq =3D fcpu_data->cpu_max_freq_table[speedo_id];
>         if (!of_property_read_u32(pdev->dev.of_node, "nvidia,dfll-max-fre=
q-khz",
>                                   &f))
>                 max_freq =3D min(max_freq, f * 1000UL);
> (tegra-l4t-r32.7.6_good drivers/clk/tegra/clk-tegra124-dfll-fcpu.c)
>=20
> If I read the commit history correctly, it does appear that this limit
> was set because the always-on use case was failing thermal tests. I
> couldn't say if it was intentional that this throttling was applied to
> all use cases or not, but that is what appears to have happened. Hence
> trying to replicate here in an effort to squash stability issues.

I can't see any reference to failing thermal tests. Can to point to the com=
mit?

I looked into why this was added for porg -- it does not seem to be related=
 to reliability, but more so consistency of performance. I don't think that=
's a huge concern for upstream -- though in any case we should be capping t=
he frequency in the DFLL driver for now since we don't support dynamic ther=
mal capping.

>=20
> > Incidentally, some of the CVB tables in the upstream kernel seem to ign=
ore speedo (I assume they are conservative) while rel-32 has different tabl=
es. So the upstream kernel is probably running at slightly unnecessarily hi=
gh voltages.
>=20
> This is worrying as well, though most of those tables cannot currently
> be used as the fuse driver never assigns those cpu speedo ids. All I
> checked in this series was that the correct cpu speedo id was picked
> and the appropriate CVB table was applied to p2371-2180, p3450-0000,
> and p3541-0000. I haven't yet researched what the speedo values mean
> and do. There's many other sku's missing as well. Such as the one's
> used by the shield tv's. I have as of yet been unable to boot to
> userspace on p2571-0930/1 or p2894-0050, so I haven't determined which
> sku(s) are used by those to add them here. I'm in the process of
> getting uart access to continue that endeavour.

The speedo values are coefficients used to calculate voltage requirements f=
or frequency operating points. Usually that kind of stuff starts with conse=
rvative constant values that are then refined, so my assumption is that the=
 fixed values we currently have are safe but unoptimal (at least when they =
get used).

>=20
> Aaron




