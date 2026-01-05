Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE38619258E;
	Mon,  5 Jan 2026 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767629198; cv=fail; b=ZTh6eDLlYYOol9gogH4OZo9K+SkB7gJoC7t12yAtVuaEOi+BLFZXNZxkLpjMIB/Bw+LByiLGc0vQKyw5ao1UchICH5rKPKHbHbgNnjLJ14RELiofCIG7Yt65jkxWcsSBf8ym27lLTEUJB6sK3RYdympPSfxbthHimvXXwTmZ7do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767629198; c=relaxed/simple;
	bh=Dpe4QKIHSJJnTv5aafZgJtSnNxsOFUrlbw/cMKOmi74=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pPA4DlvYU9GvlZ0L9Bu4x5cgGctpzMS2BVkHoNhSqqepv0+dHICRwU+8F6xOu4Hw+h52ngbUqddDeIStw70cwqZ2+dJ1+x6vKWj5jKbQkfdShoRF+SBZ6QJWGFuZ1CMZRk9UqkAVqc9LsoKNn0YIUTBN8gNOnXMUOJKs902v35A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MaSqcrTr; arc=fail smtp.client-ip=40.107.209.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MaSqcrTr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K321UBRiP5i64tPmZXmKO1C3yMx3cH18yUblZ9itWgo1FcrKxP64zl5srTTEtFDLfL1iZh/A2UydNoGaQbX8KZUst//wIoVCnuYMi00Td43wDXwIMdspAh5cc2IpXTgj/oWoku5KXepR5/Ra2MfRCBEdu4x2g2e5YyXeBsjzVtycmVDXt3XmSdYHGleqITBoh+zYH+K/rBfygpBZBJO2IH3VzeZlxtU6s71ofYJp2XRULjEHhQh/EKv6Pq1pead7i8cR0EebNrNM3fCe+gyTYmloka/rsQwww2w6PFGBUYZ3nuIbSJU1HibV0pjNblbwqroYEL50nFfU9H7r4tFuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1x5JUkVi2/J8Ls/9Ss8B9NChNj+25iw4JvJhMFMzZk=;
 b=e0v9gOoAol5AiPALsjU0NgTJ7iif7pE4u6knyBm809fcExwwQA77/YfwrsCzSrdyKwORgS/DkiGECh/HrbG/wDrFgVhnPiE0rJqMq99okhRlSWK83B2hpsi/PXPAYSLLTi/wGZAnfwKn+8IeN308FfCUJeCWD+EmoIDqbt2x1l0uMheQkJiN+ZjoXgDW16ksXP/KrWD2Vho1rzfeoo93Q1pNN7ToNrhYl4mL+68qlP3VaCntYYp0XrcCxB8uTx/EjdGroxJ6jpfQ6+F4orsZXEcB00x5ZhZ/Xm2RxvVD2ti3jWo/sNx66m1u+aNmVRxHVT6i2v1bxR2pMImQEyGReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1x5JUkVi2/J8Ls/9Ss8B9NChNj+25iw4JvJhMFMzZk=;
 b=MaSqcrTrIvV/lp2zWCd6Wkjz0piPWT8mWnhCLwP7D6yutK1BDWlsr1FFia2RxJnEEfhq+qe80pG2jzf/nxn//sNpueEsDxCzlvNuq/KmKnQcVc5cZ+LfEvz7ToD6YvVFUIauSx3o6tCaqB/9UvZ3gLBAgAP0+oWvdM5avSCwD5ypy42KUCGsCgApjXdyYSOR4KskiSrVMvPPXYIrOxZeVDg/P14Zm+St4E7MlslFxvJS4aZQv4bAHdnuASE+ZJQWBoq3sg+O4unFzmwAsvon4h0+n+vaExvmnodk091+L5JbmolrZoyge8Nkvm6Rf3PS8fwLHGL0rTHURo3cFP29vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:06:32 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 16:06:31 +0000
Message-ID: <f44287d4-2f76-409d-b537-038896c5bc59@nvidia.com>
Date: Mon, 5 Jan 2026 16:06:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: tegra: Revert fix for uninitialized flat cache
 warning in tegra210_ahub
From: Jon Hunter <jonathanh@nvidia.com>
To: "Sheetal ." <sheetal@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251217132524.2844499-1-sheetal@nvidia.com>
 <41cb1bac-5503-4765-b45a-200963448e5a@nvidia.com>
Content-Language: en-US
In-Reply-To: <41cb1bac-5503-4765-b45a-200963448e5a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0655.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f39fa36-c9d8-4069-689d-08de4c7462b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1hxTjlCNGUvdUVITFpqRE5IZlFCbkZvOERzYlVSOTZFZVFSNDRQOTM2RERC?=
 =?utf-8?B?RWY1dTBRUFRQOEoybjF0ZzRuVnR2WTFnNitVdzlpUHEzV205TkNua2ZGaWxW?=
 =?utf-8?B?ZXExbjZWRlRwSmhyb3NpOGdXei8rQ3JqR0FjMlVFMmJSeldNc3kxMlVWcDdO?=
 =?utf-8?B?U0k1aWRDWUpFcmNPbVZkeTZuK1ZCQzZMKzFjbVFWbzJBY3RhNlBiOUNtcDNs?=
 =?utf-8?B?YXNOMXhpWlI0eThIb0wwU0p2dTV0Z1VuUlNmYXZEK04zZGVBRThPempSc0FE?=
 =?utf-8?B?U1Y4Rk9OMFJjcSswc1ZvNkZ2SzZiYmM1SGFGNkVsN1ZJVVlWWXM0RC9Ka1gy?=
 =?utf-8?B?cktSWlpMbGJtVmo1UmZidnFOY1NwMkpacTZNeWhjRXFBZU1zMlZhcGJ5cUk2?=
 =?utf-8?B?eGxmVW5hQmMxMy9DWjAvL0l6K0FPc0ZvdldTUnF1K1dJVHE5NUZ1NXBMM2Ix?=
 =?utf-8?B?UUg1Y3BBRWRtaWUvTWVTWXFDcFJrZkdFMWlPb1JnOUlXRlhWWGRhQU45eldO?=
 =?utf-8?B?N0loVTVYY2NuZHcrZTNrOHlUWkZVeENJTUxMZVRza3NCZ0diZHRoUDgxTDc5?=
 =?utf-8?B?eFNaRFgxNTRsZUs3V0lGZlhPSUg0K2Vrc0xYSXBZMGluR2lacy9YUnJOQWZI?=
 =?utf-8?B?UHI3UnJBZzdYeHVPclZUZkhJZG8yRkNER0VoNThOeU4yV2s1OG03aXByMDdD?=
 =?utf-8?B?UDhES1dvRTZ6aDBZMSsvOWFJbnZKaVpXMFJQVFA2aDJiem8xSmh6aFdZR2I2?=
 =?utf-8?B?MW1vOXVXNkxSOXVxY3JhSDBEbTZBYldkOVRGS1ZCVHgyd1BhV2FhM3pJWW9R?=
 =?utf-8?B?RE15TE5RQkRSLzF4U1RubVlkaWpGY3hJcnpNMlMrOHVTZHgrT09YNHdhUWh3?=
 =?utf-8?B?WmdqUGcxcmUwUDgzQllVQlo3K3BGUVJOd0x1ZWhsekZaTjEwSGhZMjJuRmNP?=
 =?utf-8?B?L3J2ek5Ua2xXZFdWeWNJUnV2UG85UU8yNkJPeWp5b3BybVlRT09SSDVmQ0sr?=
 =?utf-8?B?aGNNc0IxUXFQY0pod3VDOEVyS3FjQThvczFpcmw5WVF5cXRMWi9XYXMzYkJ6?=
 =?utf-8?B?VjVDbW5BTlJLZEZCcU4rWkR4WG52Z0UwRnJwSCtDOGt4YXlTK21SK2FhQi9v?=
 =?utf-8?B?bEV4RjJScWM1V21FTERHZFh6MHU1VUpBTzZQMHQwYXpEeU4zeFkrLzBuM1Zu?=
 =?utf-8?B?TGtrOE1FZ1pUeDR5eUhaUFFYSHM0RGRWUlY5RkYvc20wbFdrTWtXVEVEdzFw?=
 =?utf-8?B?T3dTZzJZZE1hbkI1WnRCS3FaalFGWTVUKzM0K3RiajJNZXI2ckJiUzNodGd5?=
 =?utf-8?B?b3hNVXJMK0ttalV2djRpRHRROFNrU0s5WTNuSlhmQjh5N0N1RU1peS8wNnRJ?=
 =?utf-8?B?RDhCZkk4UWhVUEplSHNNaFdiM2w4YVRCVksvbFRkUmJXMTY2MW9qZWdueGNT?=
 =?utf-8?B?VWlMR20rRmJWMlduUklERDJmN202Z0d3RG9OOUQyZmE1djkwZm1UcUlmYzFr?=
 =?utf-8?B?WVB4eVlxMlhpeXVyVDN3S0duUXV6YWduT1BxVmpWQTZNVEU2UEtTZTFZMlpO?=
 =?utf-8?B?YitYV3NSbjZZRFJGYkpxUXBsbTg3eTR0QXR4dkg1YjVPQzVQZUMyMDVNNXJJ?=
 =?utf-8?B?anY5azN1Wm9NUmV0T3Q5ZkpTSDkrYVBCVWpLU3BBbHhjMnlKRHgvZW4wSjE1?=
 =?utf-8?B?bXNnWmtXOGpmMkloVVN1N0xpc1BESVM2Nzh0dWZWcy9oRU9Kd0VHUW9zTjR5?=
 =?utf-8?B?dHp0N2Vrb2JZNWloS3VyendUOEl0eXJHRWJ2QzNHb1Q2T1dHb3lpc2pvMEVv?=
 =?utf-8?B?RkJsVzAyU0szdVVzdjR4M0RsbExDZnRITTBhb0d1TGh3VTE2RW5lbGYwcC9m?=
 =?utf-8?B?ZFlmbFhJRFBQb2U0b1V4UWYrUWdsVndSTTdyVzBaTDF3b2prQkI1d1dMMFVm?=
 =?utf-8?Q?I2sjrxO/1dI/n6TGRX3tHvlQb0fY/Uq2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEJjRXl0V0lwQno2aW9tNkpJM3V6YXFPTXkyRUk3aU5kTDVTM1hXWG8yMjgx?=
 =?utf-8?B?Q1VjYS8rbWc4WmJyOTcvNmJaZm04YXEreVhOdG5QYmtFaXEwMmJqbi9rVHJF?=
 =?utf-8?B?bVVrWlp1dkwvak5ZOUU2VWtaTFNxSDdnVVdVVmdUbjNyV1BKVHE3MWtjMFJS?=
 =?utf-8?B?M3lSSmRBU3FEbUNRcHhuQ1FrKzZBZVphL0tyZ283TEJWbU9jK2M3ZksyWnFY?=
 =?utf-8?B?M2JjTTB6RVg2dkdhaEZiOWlmUGRIMGJFb2NDY1BRd3lTKzBEYVJJQnJ0aU9X?=
 =?utf-8?B?UVpxdUxuK1VZZnRGeFpWbk93VlRDblovNDVVN1RIYjZHazgrYUFUZkV1KzRT?=
 =?utf-8?B?TGdOU2M2OUpJU01FMnRBazhvb0FkVk1pOTRkNnpMRzgyWVpmdVpDazZ5NlFP?=
 =?utf-8?B?NGJ5T3lZL25wbGIxZHRZS01ZejdTdk5oK3BVQVQxRTF5bmx3RTd0NnJqM3Ir?=
 =?utf-8?B?RmFMVUUyVVZiWFVVWHJkeXE1NDh4NkZraXg4aGhYcC92Sy9selNIRVZMaHRw?=
 =?utf-8?B?QjgzbVQvVUw3NGVwS3VwK2xQak5ZRzZXSElXZEoyamhwd3dINjhmNkp4M2Q2?=
 =?utf-8?B?TGg4bXRncXZYaTlDMVZ4WW9rbEswdDIxM0xvamprek85SUE5eGFVemVhWUo5?=
 =?utf-8?B?bW5Vdkg2Nk1hTUhWWi95NWpTT2hFYk1iN3Q0U0p6MmhRVHMrTVJoQWZuVmpF?=
 =?utf-8?B?SzRUOE5iU3ZkOHlyN25hcEc2dG1XZ0ZTZkowSDFFYVJ5REI0SkFiemF3UU9k?=
 =?utf-8?B?V0x5V3N1UVQyK3FZb2ZzR01lSEVJTnVYRjlNQXpQckR1WURSbmFFZlpuVGQ3?=
 =?utf-8?B?T2lCSG0vTW5SWjZkSmdBak5OQmpRaktFb0V0dHF4aENpcTFvUlZCQTN2NjF2?=
 =?utf-8?B?QU5WZHVHSkdlVGpHOXY3OEN6K2tTNDdvelFzQ1VJSVk0WW14RWFONjgvMzNl?=
 =?utf-8?B?bWJOYm84RG5jLzlRY0tyYkFycDdocXIzVklnWXBqU3E2ZFJaL09NeWNZT2RD?=
 =?utf-8?B?WHFLOHEyZGRnM1BHSGUwRW4rRjdnRmowekpORFY3cnR4ZXdQNFdzbFlmYzlB?=
 =?utf-8?B?NlRRSlA1NXFuL1Z2Y0pFWEYrN0FzckFvSTl5aWs3TWdTYmc5NmFPY1FtTTlE?=
 =?utf-8?B?MkF1ME5KazFuT3k1TTNBRis0S0FUd0x1UmxXRmJpT3lxOU9WSHlaTDNqL1VR?=
 =?utf-8?B?dDY0UnBmdjNLbE1XNG52NzVUdVkxT3FYM1R4YkdwamxpRllxSnFySVhUWlc1?=
 =?utf-8?B?bHhwRXVlT0pIT2tkRTVCdEJldGdqd3hLMzFMUzQrNk1FeFJZSHo2UEFUVGR1?=
 =?utf-8?B?eXgrZGkwbENyVUJVbmJER3J3YUNhU0F4RFR2cVZzMWU0ak10VjRTTVJzejhH?=
 =?utf-8?B?OE5haFVEVCt1U04xRkxTRGdNZ0kzSlFiSzFZZmgzSTR0T2JNNU9uRGJlS1BB?=
 =?utf-8?B?Ykl3WVpQSTc0L3g1TXBvRVdTZjVueDlWMUhhNmVtUEhsRER0NDNwNEh6QXlu?=
 =?utf-8?B?RXM0QmRwWHVlaUVMS2p5M1ppZ3F5ZDRsaVVmZFhVaUJJbnkySStkZEcyKzZx?=
 =?utf-8?B?UU1PNjZiTHErQk1mNDVwNTFZOTlaSW5ndWk5dVpsamI2VVUySUZ0SFlkTmFS?=
 =?utf-8?B?QWMyQmN3VWdpaUtUdTVxZ2R2amhRalNXanFodllnemZweEQ3VllKNnhNRnU3?=
 =?utf-8?B?RDk4Y0QwZ1dSc2hBUGROMWF2KzIwMERubDdUaXVrSDJ2TTBVMm1GSnZQbS81?=
 =?utf-8?B?VXYzQzlBc01MMzBoRDVsNkFSTlB2YmJhNkFLTzNONkd6Q2V5ZUJIcTJYRGxX?=
 =?utf-8?B?ek5NV3FqOEdPNUttZUNMazZaWktNdUVCOVBiazFNWUhESm9oeW13a2ExZzU4?=
 =?utf-8?B?ZURZYWNtRXo2enJObU04UlJlQ1Mxd2lGQjZ1YlZ2Z0ZNWE9sY0NPNUtKUklv?=
 =?utf-8?B?dytncG81SGsyaGtoeEU0bTB6TjFWNmlhRHMvVWdJb3VXdGJBMklvSlorM1la?=
 =?utf-8?B?RHBySGxMYW51dFhGV1k5RGErZCtHQWFRY0lURXVLWnQyQkFCL29HWDdSdkpP?=
 =?utf-8?B?ai9wZDhXb21COXozOFZDSXV5L1c0Qmg4N1FNS2cvQkFSMEZIY0g2V1RNRHFz?=
 =?utf-8?B?dXpOcFp0REMrbVhBV3UzN1ZWOVNnYjRXempqemlNOFZFeXpDWWlPZE45MzFX?=
 =?utf-8?B?eW5QWW16VXZzTXJWK2hwR3JZQmR4cHRhQTlHTDBzYW80MzdVV3owekE2ZWRy?=
 =?utf-8?B?d21qQzljRTNPSWRRd0dORHVGWWNXTDZYS29VeGptY1h4UnBZWGpDNFZKTFJu?=
 =?utf-8?B?RXB6cFp2dld2Mi9BMjU1QnE1N0xSbnNncDg3Y0NCck93SGhTbnNna1ZvNWNi?=
 =?utf-8?Q?CqAIvFWFtVOoFS04eeQt0XrBQTFS2LX+6NokjaBvJOLI/?=
X-MS-Exchange-AntiSpam-MessageData-1: wmk7k4XpQgg7Rw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f39fa36-c9d8-4069-689d-08de4c7462b1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:06:30.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqQoMRNkCFBXP4RYsKzuTlsG0cDmmIPpvGPsx/GWME5nJ/KnA0Hax8qd+qs4HMg/b9hcib1LYGnTpUXQLj3NvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053

Hi Mark,

On 17/12/2025 13:40, Jon Hunter wrote:
> 
> On 17/12/2025 13:25, Sheetal . wrote:
>> From: sheetal <sheetal@nvidia.com>
>>
>> Commit 4d4021b0bbd1 ("ASoC: tegra: Fix uninitialized flat cache warning
>> in tegra210_ahub") attempted to fix the uninitialized flat cache warning
>> that is observed for the Tegra210 AHUB driver. However, the change broke
>> various audio tests because an -EBUSY error is returned when accessing
>> registers from cache before they are read from hardware. Revert this
>> change for now, until a proper fix is available.
>>
>> Fixes: 4d4021b0bbd1 ("ASoC: tegra: Fix uninitialized flat cache 
>> warning in tegra210_ahub")
>> Signed-off-by: sheetal <sheetal@nvidia.com>
>> ---
>>   sound/soc/tegra/tegra210_ahub.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/ 
>> tegra210_ahub.c
>> index 261d9067d27b..e795907a3963 100644
>> --- a/sound/soc/tegra/tegra210_ahub.c
>> +++ b/sound/soc/tegra/tegra210_ahub.c
>> @@ -2077,7 +2077,7 @@ static const struct regmap_config 
>> tegra210_ahub_regmap_config = {
>>       .val_bits        = 32,
>>       .reg_stride        = 4,
>>       .max_register        = TEGRA210_MAX_REGISTER_ADDR,
>> -    .cache_type        = REGCACHE_FLAT_S,
>> +    .cache_type        = REGCACHE_FLAT,
>>   };
>>   static const struct regmap_config tegra186_ahub_regmap_config = {
>> @@ -2085,7 +2085,7 @@ static const struct regmap_config 
>> tegra186_ahub_regmap_config = {
>>       .val_bits        = 32,
>>       .reg_stride        = 4,
>>       .max_register        = TEGRA186_MAX_REGISTER_ADDR,
>> -    .cache_type        = REGCACHE_FLAT_S,
>> +    .cache_type        = REGCACHE_FLAT,
>>   };
>>   static const struct regmap_config tegra264_ahub_regmap_config = {
>> @@ -2094,7 +2094,7 @@ static const struct regmap_config 
>> tegra264_ahub_regmap_config = {
>>       .reg_stride        = 4,
>>       .writeable_reg        = tegra264_ahub_wr_reg,
>>       .max_register        = TEGRA264_MAX_REGISTER_ADDR,
>> -    .cache_type        = REGCACHE_FLAT_S,
>> +    .cache_type        = REGCACHE_FLAT,
>>   };
>>   static const struct tegra_ahub_soc_data soc_data_tegra210 = {
> 
> 
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Now we are into the new year, I just wanted to send a reminder for this 
fix. We need to get this revert into v6.19.

Thanks!
Jon

-- 
nvpublic

