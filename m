Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010000.outbound.protection.outlook.com [40.93.198.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058A22ED86E;
	Wed, 12 Nov 2025 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762945182; cv=fail; b=jrDLVherteUTPN37zDyoQF34U0gh5YXcYWt5CE1XbIA4K2UggqyF2Emj0kcSeJ49sNJwfs2tfPyF7mNT0IZOE8ddVGobBgJtduSXWE8Gfq3weIRWZ+QFqXWEm/oEpCyg8Ta5hmX4ZZWn5HiTVzpb748JWKJfurl5+kvsfRxXhwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762945182; c=relaxed/simple;
	bh=XeOsqy8CSSAaFqKcM3dHaz0EOze0NUSSP50JG7RQTa0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lo3+Flq8SSeGmJIA6FWSegBAJDSkLUaeoA97fxe+kWxF1Rcch00C1NS7zydXmWncJljleyIv2Xxc6ZXM+O5zVcAjImRhMCiLyvQa0aNGEbd/t9c65bGuGAxHqPgoBvHOKq45ZOqybSsLCIpaNbPt2i9SVACNuMYqEIIvwf4nQ0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rtszRwz9; arc=fail smtp.client-ip=40.93.198.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rtszRwz9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SM9ECRo/Bru+bXXpvxrb1NHNrKl5Tld4JWGymJz5/mt4OWqriOjKh/pRNozQ4YEmuCBFYnfM3M2mYpt4CocjlGb+bPi/GRRSVYrzIZtLvTxCsAfZTki+XXJBX0PeEYGei7Pqyk1sKvF6RftPaRKMl8IyYaYFIzQiQst35UoT2aawAwPtrbGTw6AbBsGbPdSP4i+8kzfXP5AX219ncf4Xi5VmgESija4ueffcbaLzRpp6eGMHkAW2AeI7Q+yEKl8EMQTJ5469kpc+ptDEJ8v4lkBfWm4P+/MIzLZ4rEf7desNLnagLMFWgO0VffVPP1iiz59TZTj8AIMvTq0AEr91lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edNiEqqKmBb4PUnzw1E65xwM+40/VeWZcTCf9ec5Gh0=;
 b=WvyZ5fBIWAx6GWhO24xbEpCRLFH/wbSBxmj36P/1hbNu0n4kVKTbRZLAV2zQ1swMn8L8NkFv4aCEE/qEnvd7ZqY00WmJr4ncEUVfkN19kPgDWfpRHVpxZQDASDywUQEqnP3SCCCqvxoqzboXbHPicHW+Cz7hSQYb1zZuZcV/pZQth2c+lnN63njVoZksBjfQXqWPsxWbew/RA0hlplkiMdjyrZAJA1qLxnhhDbughf270x/N5w5FXaRMtAkIKnEJSjaIqAiXztPSJ430QsoScJ+JQvqbvDVhgoHDqNMCUSzNmkeYZi1QHqnrnMKRcxCPXUAxhnNRc31idk6OGz/mSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edNiEqqKmBb4PUnzw1E65xwM+40/VeWZcTCf9ec5Gh0=;
 b=rtszRwz9BNBCrz0ORiSBxtNKR2TutI0+dsJkdsXRAXCg7vTymnk6ys9xpIsCbIMV6xO+ydNKKUlL/KqcxL7f2AnnfPAIlgvOCxVhoT7KVRYwMGKIhozfXfscwkukDhS1eqOi/fCgA/RfgpqzpBwqwYZqZ9uTnqR+KFHx3lzHXp3D9EB+omI0rnxxha7Wi17YomD//z7+Ig0HgnfGLnwkYUCNAWCsM9R7kOIYzKYujqxC+rlAshyD2mKmmEpWeJdAF32vM/mJ1HE7b+KGbzMo21ih1BewbNbBHJPMI1nd+rN5S7GYJKouH+gWL+25afjucN1NG9Uog1giLxJxUC/H3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 10:59:36 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 10:59:36 +0000
Message-ID: <f0cf2f70-f2b4-47b2-b6d8-358e36c750e7@nvidia.com>
Date: Wed, 12 Nov 2025 10:59:31 +0000
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
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
 <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
 <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
 <6904a858-d7a3-457b-8141-692238d01582@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <6904a858-d7a3-457b-8141-692238d01582@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a34ae45-d199-419e-a6fc-08de21da9150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2FVZ1J2a1A3aXdxRzdHWXNCNXJnTUlXYzQ2clBJRnVqOXVQZTNwOW9hUmVl?=
 =?utf-8?B?WXFLbzBpWmRhMW5CbFpXeTdPWTFhSlMxNWY5R1BPdktaSGFWaVlTbHZEYnpu?=
 =?utf-8?B?SDZYL3JwYitKcksraUJtcmFzOUZMZ01iREVXTjEyckMxTGZmc3BadlVXc2pa?=
 =?utf-8?B?ZEo4eHY3MjdTWmR0WnFBZXpVWi9NeEpNVkp2WHZ1dWdLNXBYTVdLUXNYUGlU?=
 =?utf-8?B?aXRwRUhpZUcwQzllQjFsSGlpR05jTEdWOHRFdkc3czU3QnlrWk0zUXgxOGdI?=
 =?utf-8?B?L2NXeFNCaWEwSFZOKzR5ZEVvNUY0SnNtSXhBUXdoN1g1NldUUDJGcjY0Y211?=
 =?utf-8?B?QWtka212cTJ3RDNoMzNVLzJpM0FFNXRzV1g0V2QvdzRTc1ZIYWNsZG01ZU1y?=
 =?utf-8?B?WGpjeEFib05XcXMyb1phZFQrcmJOVjIxTy9lei9CbFE2SWtEbi9DS3VwTnJ6?=
 =?utf-8?B?V2pzTmkvVDV3R2x5aGtvREdhUXJBN1lIRHRBaldDaS9UWkZHWlRWV084ejRN?=
 =?utf-8?B?NmhKNFY1dVR3TXhmWHMweVFZVld5VEhFTTZmbkYvRzNiYjNCR3phZWZXcEVm?=
 =?utf-8?B?OW05aXUzVmZXeU45bzlBUll1aXQ2Rlp3MlJyVlhMc1VrZU5hcU9saTYxekxC?=
 =?utf-8?B?b3NLSFRtODE1VmFwZXJ2eXhsNTN2R0diSDUwc1lKK3hXaGI4NDIwT3R1ajVY?=
 =?utf-8?B?RXhPZ01EZWFNendQZzlCQ0gxNVJZNW52alI2c1dZeFdKU0YrY1MybVVZRjNo?=
 =?utf-8?B?bzdaVUNMSVJQK2hUSmp3aTMvTjhzOFByWlN2UzY0ZUozRXBHdlVuNFF1WVRp?=
 =?utf-8?B?WEMvcTZMczY1a0pROE85ZUVPMzdLMjNmOGxFSEY0b0VkU1NMRkNJVllRQ0Z3?=
 =?utf-8?B?QW5hcEp1Q0t2Tm9INXdxTys4VENrQ1VyMHAwSUpJU2JwLzVKN2lwU1lUM21H?=
 =?utf-8?B?b2pabGpaYmQ3QWM0SHlvOW9ZSzBGR0ZmWW9iSnJzcEt3NWdnMkl5VXZqOFFU?=
 =?utf-8?B?cDlkZmJEVklIRXIzNTNYc0JtTUN4OUdTTWEwekhEd2crWnA4WWl1VHZQQUxB?=
 =?utf-8?B?NExKYVpKV0dzOVhPSmhMRjg0N25IbWZWNmxZODA5NFo4MEdIc0dHZStUeEhV?=
 =?utf-8?B?ZjZ1dW03eXZBMTQ0VnZzQ05NT2U1cEtTK1JZemJpZmRWZlVWc3ZBanprcmg1?=
 =?utf-8?B?WXVFVjJDbk5Nb0ZSM3JzV1h3eWRwbkQrRmwxWTRySXUwUm5kZGZiakxDS3h4?=
 =?utf-8?B?T0JtdXB6SWNwY045ZitXOFI0T0krNnc1YUxDSktGc2p2bGZiZHJpL1pCRmM1?=
 =?utf-8?B?QStLQzVSd2VqMXcvL1V2aUNkOFdlTlpDcnRWN0krOHcwT1JHUzh4dmFrNG5C?=
 =?utf-8?B?Y0U5RndOOFI1S1NraWY4Vks0dE9rVWoyOTBsdC8zMTV5cHVzd3J4REdibnVv?=
 =?utf-8?B?d1kycmtWaTZCTFlDbkh2OHFGTUJlb2NnbHhvQVdLa1JURE12MFM3eDJTN3ov?=
 =?utf-8?B?ZUk1L1BDYkgwUWtvcHVhREgzWnVvUzk0ZjBtSlh3ekNOSlo0ZCtpMUFSdVU5?=
 =?utf-8?B?bXRQdG9SeC9tMWZBaWZBVWR1bVdzNXhqK2xzSVVvMG1YbnlHMEtUT1hPcGwv?=
 =?utf-8?B?eUVqUFZOaktKNXpuTTlxNXEvU2kwMTRpNTlrdTlFVVF5cWlUekVRT2xOTjB2?=
 =?utf-8?B?S1ZyMlBYdVREc2cwZDZxanZHbXdsVjVHOXFTSXpMUDlLUlVsTytIaE5hbnVB?=
 =?utf-8?B?NDlBMnVMSGNZVFQ5Q2JycytuTHBncHFnTXVBdTlId3ZtZDJKK1RvWmpYUW01?=
 =?utf-8?B?dURNWEpTOGplY1QvVmJMNG1RUUxKSU1BSklXU3h5QmlpV1hIeitoLzNJWFI3?=
 =?utf-8?B?cDRXa2R6M01xTkNGNkprT3cwRG5iYXBpS0x6d3NGM0RhUXRGcG1OUHJHUE14?=
 =?utf-8?Q?ENe1VO3uS61oiyY21zmuky8ymlkv8l6j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V21FTnRaQnI3M21jaGZlbDUyQlZBb2Z2NnB4SHRBbmNqZGtDbUNBN09OT2JI?=
 =?utf-8?B?c1VNWmVsM1FVQUwwTUxNV3RVVGprZFBkN0RIQ0ZKb01qMWJINTJJUXJxYmNt?=
 =?utf-8?B?anI0c0RpL2J6Z1NSMWY4eU9nZHpqMHUyNHBuenBqSXA0cDhzQzNLT1dOaUoy?=
 =?utf-8?B?UElmNHdBczZ0RXJBaWlGZHJNdGxUbmllOENseVIxV2ZYOS94SGxabTN6V2lG?=
 =?utf-8?B?SHhwdXlJVXI2cHpjMjMxenNJN1p2NDJmWkxBaytkUFA2cU41ZDdSL1Y4Sm1P?=
 =?utf-8?B?U1dibzZUQXdsRUVvRm5WOHVBVDBpMjdmREViSStDLys3cVZyVEpmRGNzN0Ex?=
 =?utf-8?B?cmdrckJ2eExuRGFCbklQRXJQeUdjamJCeFB1dk56TjVsbVVQZWs2NGJRK0RB?=
 =?utf-8?B?N0JZWXJUUjluUlRLN3hBZ1pHZ0grU3ZneS8yZVU1RGt4ekJVTUtWQ1NrMUlR?=
 =?utf-8?B?aDlsZkorZmJaRmM0MFMxY1JzWDZQeGFiN3EzZUgyNEFGOG1PNlI4S0JVaE0w?=
 =?utf-8?B?NHRZb3h1ckNvSXNLQ0ozZ2NtVElORjV3VnQ4M2JLZ2hscStrWG1EYXZlZ0lx?=
 =?utf-8?B?MGZ0UHdzY0pTOXphSmRtamlDcHgyWG1LSE5zUTBRaHk1RnAwSS9Mb1dPR0lT?=
 =?utf-8?B?MEoxRDdyZjFKbkpNVnE5OSthdUhSeFlWekVQdXJlZGQwSzYyZTVqSDV5dHBh?=
 =?utf-8?B?SXRKaVNxZ1VNYlZuQld1cjB3aXNhRXlDQWpDemNQeWFxL0lZbmZFZW5SSmU5?=
 =?utf-8?B?WGYzU1ZEbVdDVU1OZ1Y4RTdjQmZUZXRTUDd4bWI1L01DbTU4dGo3d3pMdDBP?=
 =?utf-8?B?czI1RWRqelllcWdBT1NIWjR5WnhLNEcvaUtkMnJqa0NNMWt5VWgwZ0kxbDhP?=
 =?utf-8?B?N0tYR3FZNlE3Q1M2a2VxTk9MUzdGWnRCcVVTMEJ1SENsT3FwVGhMbG5iQ2FK?=
 =?utf-8?B?cGdqeUFYN1FwZDI4RTAvZ1VwQjIyTnU0eUVYaWtaUmYvdU5oZm9nNzFjYUxr?=
 =?utf-8?B?TEUyZkxYZFN1SGI2bXJDUXN5Wk9GMEIzSzgvK3NCMktobkRObUVlaFV1RHhr?=
 =?utf-8?B?VXJHVTV0d1Q5eTJERU5VMUdBazdyMGUzcEpqK3kybzJnZ3BCZTJTTyszN3V0?=
 =?utf-8?B?RVQySDBQQXk1VE52VDlsVVBiU01lODlHUzV3WjlPSkIyVmthdGlhZ2RVWUJL?=
 =?utf-8?B?azdnUDVKM0V3TWxuRUhkRWk3bE5XT1dpTndDMktHcW1MTjJKU3U5UGlKMlk3?=
 =?utf-8?B?ZFF5TVdscjVzblhodmZJK1RsYWRHQk4vdmt2T3kydWM1eDBwMTlQR3k1NzdH?=
 =?utf-8?B?andpd1Nxc1oyNU56Q3d3UThBUSsxMllmQTYxVWRISEU2ZEpTMWl2SDNKekkr?=
 =?utf-8?B?T0Q3L0JVejZocmZDSFAyeklleGI5b2lPeWM2TUJ4UWVrMElSTFNVZXVLaXV1?=
 =?utf-8?B?NTltVkRocEtqOXFMSnRIQXpJNzhseDlnSnhSYlBxdUxoci9wRW9lZ29YWXZh?=
 =?utf-8?B?cmZTb3dudTh6UFh6MG1JYzk2ekhodTdsYkZxNGZxUHFVOHNOaE8zcGtocGVk?=
 =?utf-8?B?RkEzZGZjbDFLb2Z4NEVSYWMranA2c2VlWWdoZi90aDR1U1NQSkpORXdWazBQ?=
 =?utf-8?B?YUl6UURYMzR4RE5PK1o3MnArY1V2S21ILzFoWlZEdzRuOHN1TW1DcnUzS0Fk?=
 =?utf-8?B?WTljSzRWK0RiQzNIWW9MTVhiQnBxYjZndFk3R3huS1k5b0c4d0NIcHRBMHBm?=
 =?utf-8?B?YmxMNld6N2QyN0FpcjhZOTZBT2IwaCt6djN3VWtvZUdWRExhWUdFaWc0ZGJL?=
 =?utf-8?B?UkRxSElHbTlzTm9YWm0rQXhueEtMenJ2UzNnR1N4UTRRNHQ0SXRNNFNvMHhM?=
 =?utf-8?B?ZmxIQTJXemxLdlQvSk1CVkh3TnE3bDdhdWY2cmJrWmtYdUhCUWRiT25XcVRr?=
 =?utf-8?B?clY2UTQ0Z2pyck40MVIvMG5uRHNKejlJWXNraGthVmExbFV2NnFOWlFrcTUv?=
 =?utf-8?B?cmlvR0JMUlZtdGFKcndHVFR3SWdNbm1BWU9xZlFueDhBMDlpV1pUQXVDWlVj?=
 =?utf-8?B?amRqQUZyWDFITUFhYWE5U0RtWlIyR3JWeTdFR080aXRkVXNaeCtIMEhwejVi?=
 =?utf-8?B?cFJNblhSOXRQdFZVK3phSjVuekxIaDAwd254MnNiQ3l4cXB6MWdWOHdOaGhk?=
 =?utf-8?B?VncyL2MwdjdEaGZDeUo0dFFRbXNmeWVobVJhYm1XOTVhS0ZPeGNZN2lRazEv?=
 =?utf-8?B?VEZOYWhwdXB1dEVzMTJNWmhId093PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a34ae45-d199-419e-a6fc-08de21da9150
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 10:59:36.0362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cj2fj9Ul4WNVpirUcz3ipSnWucyE7dkL7WXxWMpSLesAnwkrGpa5VaX513CNvEao8mO6PyZV/asuwnqWFIeOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578


On 12/11/2025 07:26, Krzysztof Kozlowski wrote:
> On 12/11/2025 07:18, Jon Hunter wrote:
>>
>> On 11/11/2025 23:17, Aaron Kling wrote:
>>
>> ...
>>
>>> Alright, I think I've got the picture of what's going on now. The
>>> standard arm64 defconfig enables the t194 pcie driver as a module. And
>>> my simple busybox ramdisk that I use for mainline regression testing
>>> isn't loading any modules. If I set the pcie driver to built-in, I
>>> replicate the issue. And I don't see the issue on my normal use case,
>>> because I have the dt changes as well.
>>>
>>> So it appears that the pcie driver submits icc bandwidth. And without
>>> cpufreq submitting bandwidth as well, the emc driver gets a very low
>>> number and thus sets a very low emc freq. The question becomes... what
>>> to do about it? If the related dt changes were submitted to
>>> linux-next, everything should fall into place. And I'm not sure where
>>> this falls on the severity scale since it doesn't full out break boot
>>> or prevent operation.
>>
>> Where are the related DT changes? If we can get these into -next and
>> lined up to be merged for v6.19, then that is fine. However, we should
> 
> It's still breaking all the users then.

Yes indeed.

Jon

-- 
nvpublic

