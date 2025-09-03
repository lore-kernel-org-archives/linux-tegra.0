Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2067.outbound.protection.outlook.com [40.107.96.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B5A2BD5B2;
	Wed,  3 Sep 2025 05:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756878646; cv=fail; b=mXBBj0l9eCVgbKdvklyWiKKd+qQ4wbv4j6lkuGKWLz1sPO+xJ7kJ9wyWlj/tfzSfLqT8SGCZC+70tgcJbs5lHTTZPJERKCUpNiMhIgdLcHPH3wJFmCeV/esbzzYLm769n25N2DikfF7piKqtOFb+XX2p9kM0zWaY8HSPHsQJe68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756878646; c=relaxed/simple;
	bh=Er3vWOK1ojGx/a5P9CMZms1lj1i2CwdaqV5J88h93as=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=El+8W1WnL82B23JTQ/3W8g6rNFgvdx4iL5W8ZUXL+PMTTiUjWsS46/1zDtaoRburtHU0zcSDYrYqBRiRnZMe4pPRO68xmxk5+BStzyA6NET60iaTz0IJ6eq+JAt4ban+b6oiNY1IDeV1LPMCXOh1VQuwAmZ2lnMEYulva56TbVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KMAvzyN3; arc=fail smtp.client-ip=40.107.96.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KMAvzyN3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJl+Au2z8XAcjNmR/zXuGYuqkmuSMEPEdQm79xU8XfYZZdQs3h7gk143BM2BuNIFKvdNvtE7MyHl+eiXWvP8bgY42yfyy8Q/Yqc8glKRHXHVs5K2cgd6n45vU4I+5uuOFBMycziDKx1PVjyIK1vCRnxXvJBowEUyEP79MzvgdFGGzvxFW1rSZs4bKQpT+WFb1XbrpxMxXTxtNRwt1C7no6YomPxSKxvDycapXtO0w7UC1ygM05W7qUK/U8n8dOLeFz4fawDeKOXEBgRu/jKjxDA7zXWWsOlHBPf+f/633hlWu51n0bN596YZPDSRJsKcvStJV357iUHRUJHblO+fEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zctHxL3QTIIHT+StpOwFlMbmLRisQlGp3syi4ryJDY=;
 b=eRKo7SAH0n/7LLOuGjKM7BRAkkbtEVH4d5V6PSPuKA06JqtGxtRWaUb3dQR5bdH2r1dpgqAzBSOuV3nyBtm4pzO/bxVt7rT1nNIPWr+dC+Gpw0XidBq4Tm9nKgwrzHY/pFfTtNYa9kJj5RzDSMiofy9vMNR0e3LQv97+y2CuxRZVEHx0BDQr7POXYxQ9xHaBUAFPbpELBQw68rF9zdgSSnV4hMp1xqcM+Bhf8iCpn6U+Lk/gHr+VbL37b5+6lnYmJXjkVQvpcizRE7A319v4hkjhKPEtWu9GpiY9Huyp4xir2awRJjeEkO6lYnDdF1NefCIf+DuBHLi4zPuh3bjcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zctHxL3QTIIHT+StpOwFlMbmLRisQlGp3syi4ryJDY=;
 b=KMAvzyN3szO3CZNrahMH5aGl0D80Ik4rwMUfv/xCpXMuvQ+PAAQGd9hLfzKYhFjmwFgX4bGqKqrmx+G9o5ebieoECu9FqbeJT7KFGyhvwZMf5BvlavsbZ5NHfOtEDKWO8tZePQfWbcH2/O+vitLnzdl2gZ++n8RrEHSe4KA4SKkOmhMgaaXvGhpe26Mzy4EVhQGL2fXhO9aPR8is6tX3pAcBby2egJdAHSeN0ZPntF1XvJgErIcgXJSz4jXJjIGWkM8M/ZNwLeP1c1E7SwOoV/os7kjZcuZ6rVYcxyLLLCxzBoVJy+03p+2MlKAtXqdOc+yygV7f7SOlKe/aMbjwGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SJ1PR12MB6145.namprd12.prod.outlook.com (2603:10b6:a03:45c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 05:50:42 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 05:50:42 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, webgeek1234@gmail.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH 5/5] arm64: tegra: Limit max cpu frequency on P3450
Date: Wed, 03 Sep 2025 14:50:37 +0900
Message-ID: <7006329.Sb9uPGUboI@senjougahara>
In-Reply-To: <20250816-tegra210-speedo-v1-5-a981360adc27@gmail.com>
References:
 <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
 <20250816-tegra210-speedo-v1-5-a981360adc27@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0186.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::14) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SJ1PR12MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5a6efa-34aa-46a2-40c3-08ddeaadd13f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTczeERBTzV3UlVYSWxZSGNLNy9FMjhqUjNoY1NzN1pkOWQxbGxMUWtDWFdJ?=
 =?utf-8?B?TURPcUlzZzZ0cURVRDBFbHl3Wm9MVG5Cc3JnVFVSSWhCUnVzNi9XdnJSanR4?=
 =?utf-8?B?WTRTK1JWeE1RbGFvK3NGRVNmeW03Q1FJN0VXZDNuamR5a3hPK2Jqc2VSUjJw?=
 =?utf-8?B?STBnR1Zad3ovY3oySUlMMVQ4ZGMxaE9xM1BqM0tFWUJ5UkZaREFOUEZ6TzVQ?=
 =?utf-8?B?M2F2S0JsRTdWVk0xejRBRHUvRVlBSURsUVdERGtCeGIxRHBSL2UvRWxKNmZn?=
 =?utf-8?B?UnBmWkR0NTRlbjlKSWY0L1ZhaThvYS9ncW1VYlZiMFNmTElqa3NPN1V2c3hu?=
 =?utf-8?B?MUwxLytndE5ibVdsektEcmh2OXM1T1pvUFg4M2FKTWVZZFBNbUdwWnRmT1Jj?=
 =?utf-8?B?VVhML1IyMDRlZWZ2NGl2dGdQeE8xN1luN3VXVEF0ekJ2SFRQQlZyYWRsZUhT?=
 =?utf-8?B?QW53Q2FOOEhkeWg3M1RIR1kxSEhUeTRDKzd1M0FPVDBRRGhpd0FxVVJEbTAz?=
 =?utf-8?B?Z2QvQkhYTnVXdXBGRmtTQWcxazFmaTROeXRWclZVRzBNRUZJeHc5U05jQ1Fi?=
 =?utf-8?B?K0lWQVE4QUc5cDZOVDhDRnRoL3pZMk5sWERTYWlwV3pEMnlXaGFpNTRTMXJL?=
 =?utf-8?B?NGJIdE5nSmQ5UkdtakdteGdZUFlzd25xQVJvTENaNDhsRVZmTWVYQVZockdv?=
 =?utf-8?B?M0pjRWtaYThrY3JWdGpZUWNWU0ZReHV3MTJvZ2kwcmsySVVDYktIVEpRUjVH?=
 =?utf-8?B?QklYSndNUVBvc3ZTM1JsZ3p4OEQySVJUaDEwczN6a2J4VUgzdURvQVFQZDFG?=
 =?utf-8?B?Y2ZJS3k3ekJnbzZPUllya0xrRjZ2THdvNTlCQW5nd012RkdHcUhvY3Y1akV5?=
 =?utf-8?B?M1MxL3FGOG5PdlJDY2w0VldZRDErcSt2ZXZSd2UyK3QvWXZTMUdWdndXYXIy?=
 =?utf-8?B?bWZlY2IzOUkvcWpNK3VOSnBRNFBQMXlWb2toVDdGRi9sQzZZNWowUmhLdFc0?=
 =?utf-8?B?Qi9tU2V5Y0RlUTFhSjBYRHhXV1JOY0UwV0pOYkZ2bXNrdUkwanV4Umk2cDBz?=
 =?utf-8?B?dVJkL2dDUkFMd2R1aXVVNFFrakVZVWRla056d0d5M2tZWVBzSE5MWlcxL3dq?=
 =?utf-8?B?bmUybnpjYjhFdmR5WWo2UUJTTkQzVWc3UmUzTVNFWFFTZ1JHbmcyN28vUzVC?=
 =?utf-8?B?UjdFYmtOSFJVVjZVTXJaaVBtTkNvOE9NTE5yVE1aM3J4aVRtbDlseElEUVFn?=
 =?utf-8?B?SkppTmdoVS94SnN5bSt5MlZia1dhNVd4SlVGLzdvclpOcHIxQ0RjcWs4MXgr?=
 =?utf-8?B?WlRCa1VvZVdLOGZXdnpZT3JPdzNvU2laUk5RT1EvdHYxV0svTS9tSHR1WVhP?=
 =?utf-8?B?eCs1Y2hUZVlxMG1zaTZKQ0tnQytDTG9qa20vVHUwQ2Y1bVd6cWpFakpkTzR5?=
 =?utf-8?B?N1VZSXVnejY5T3llVkxlRXdXcU9OcVB1QUNyV1BkN3puWmlzMlFESGhsUndX?=
 =?utf-8?B?aVliNmZlU09GUHkvY2JWTGplV3JJZU9GVkVxdWd0cUYxd3AvZXMrZ2I0WUVI?=
 =?utf-8?B?UXJyRWN6dENEZUZhWHNhNDRKWmFhL1dhZnR4ODFTbFBhclNQNTRERFdnemd3?=
 =?utf-8?B?RldqOHJNS3JvNW1lbSs5ejU1U1J4M1hlSklxQ1Z4QWJZb0lZekNXQ3BPRStN?=
 =?utf-8?B?YWNrMzBRL29taW9ETC9sZzV4Skd6S1BGUnNiU0Z5WGJIdTdEa3prTnZLeWxt?=
 =?utf-8?B?U1VWU1ZsT0VFUWVwQW1nR0VETkY2aWFaK2lHT3JJcWczeHlsV3NSRVdMTTNn?=
 =?utf-8?B?UElYTlpDV0ZJZUJnaEpEWG1OcWhCUWpCU2JKS3dlK3FCbnZHYTIzNnNoUDZs?=
 =?utf-8?B?OVJIS21oOFJFWDRWczZZeFZrd2QzeUxvK1U3Y2twNyt6OGN0dmsyR2RLQVc4?=
 =?utf-8?B?bXVCM1lLcjdVeGUwSFJnYmRJQkVUY3BtL05WdUF0aHlFdUZyd2hkTXN4NU9W?=
 =?utf-8?B?eDIvemVCd2FRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkY2MnZEaUlvL1lFdTMwSUo4N0ZGNGFGYTRtWXd4aDEzK0pjVDFKR0JuMzZV?=
 =?utf-8?B?OGl6WlhLV01sNzhmNlRYNEQyUnVpdC9yTnU3L0U3U3JBcDU0UHlQT2tnNzNw?=
 =?utf-8?B?akRrQnlETVkyeHpBSEZ2UGM0OEtWbTNpQkhlaDFPb2VnT2FVNFhBbTl1b0Zj?=
 =?utf-8?B?Zm1CUUFFZWxMb0FxNHdQT0pBcjBsaXB4OWtvcVhpaW43YTBaeGd6bWZINnlU?=
 =?utf-8?B?Rk9rUmorRWVQaUtZNGl5aTZON3FwOW1Pa1BSckJsMEdiejI5SllHVzdWQTFQ?=
 =?utf-8?B?eGsvMlVvRitaVlRoQ2szeVpBNG5YckNZYnBMNTF5dERzalJ2UFpLTGN5L1JS?=
 =?utf-8?B?QjJ0clRoRHNwVVBtU1EwMkV4WVNWdDhQTFdwUVRLMmVSVU5IUEZXNElIVVd2?=
 =?utf-8?B?a2M3WldjSXMySFZLd2tnczhrNkdONUZRMVA2REVaa0M4MHNZTTFwdzFlODVk?=
 =?utf-8?B?OG9SYyt1c0JaN1lzajFidlJ3TWNBS2JiakowZDJBcG9rSWE4V25KY01wZ0ph?=
 =?utf-8?B?cHNnOGhOS2szajBldnJFOXgzc3gzVGNGcWlWY2dpeUdha3ZBQm83OW1Ib0dN?=
 =?utf-8?B?OWtETVhJZWdFZk5tYm94VjdNdm5PODJUZVVQVTBybXc4ZGxWa0daMTVoSTlV?=
 =?utf-8?B?dXpTcC9aUFcyOVRhQ0wxVU8rUUhOb3hicExyRnh5SGNob3VOam9KbmlYMUpW?=
 =?utf-8?B?cjJoOFZBYWpUbEZhNEpKSHQ1WG4zQm56T01PUXM0ZnlmbDY4S3pBUlJNY2Rw?=
 =?utf-8?B?cm5MWDJGZjdHd3lCb0tFMzBEQXIwU3AvYnNBVXFyWXRqNEs0N2NLek9JaVJi?=
 =?utf-8?B?b1RHVVU5ekhod0pkSlhWWTdmMlhuemJWaDdheCtkZXdjbEMyMTNZdVZpWXpU?=
 =?utf-8?B?UW1tVnFlRXQyd3R4R093WlI4VDFVODNUTU9DM0J0YlVHaUt6bTlOcG96VDBz?=
 =?utf-8?B?SHltd3NGWDRvUSt6TlhlN1plNWJRMHZ2TjZxOGFKUGI4U0M4dUN1bXkwMHla?=
 =?utf-8?B?bE1kRVhBSWcwc0RYU1FSZ2VsR2l6eW91SzdGOFFPenRmN0xvQzhBWUdKZGt2?=
 =?utf-8?B?UDNSV3FycHpvNEhPVWk5d2xkMDFSQjNXZ3R0Ny81NVdVV2lCZWtRNndYdnFH?=
 =?utf-8?B?MXVHcytTRkE5NmpETEJXVm5VS2dGL2FwYkRsVEFJSVFQcGpDUVFrSUVpUHVs?=
 =?utf-8?B?UjhtV0V2R3hiRE55Yms3WXdUNkNHaGxEb0YvM3J2MFVoRXAxdjN0WDNxdlJq?=
 =?utf-8?B?TmNLOWJyM0N1aVU3TzI1RE44TlN1ZDN3b3BIZWRKQ0hWMGswL0VQTG03N3FB?=
 =?utf-8?B?THFEeEFzeFZwVUpRbzVkUWNuMXpiMlo2WjFRUjBRbm5BT04rNzRBOHh1Yzky?=
 =?utf-8?B?M1oxN3l4UnYwem9DNnhlV1dhTW5WYzUwQlowd0ZiVU9pWHNHd2dQWnY0WW1q?=
 =?utf-8?B?RFZWOE1qK2N5cnI1b2Y1bXRYYzRRQ0RpQmZDUnJEUXJIeDlhK1YwbDY0b2NN?=
 =?utf-8?B?Y3hnVko3R3VIMjhadjcwMEtGamhHbUgvTXdxYXdQdm92MXVXYW1najYyQjRK?=
 =?utf-8?B?ZlVobytIOVJ3d1J1N0RLcldHRm01QXdtTU5OUnUxSWEreVZoWkZRZE5PNnNl?=
 =?utf-8?B?WWRjcXVDVHR0am80WldQYUExb1diNy9nNlh4bGlKMTBqOW5HRFQxNHBCeU1S?=
 =?utf-8?B?RlJhNDVaazAvdklvSGtaR1NHMWpZTXgrZXorY01xc3cwUFk1VWl3NEg5cmow?=
 =?utf-8?B?RjVsZlNId2pONVM5ck0vaHBKNHMyMXpKdnlSeXRDMndETU01UUJaNnEydEpr?=
 =?utf-8?B?MjF3NS9HMFVzdU50YURHZ1ZFR1hVK3hFTnY1OW54K2pvdEpjamZzQnh1TDJQ?=
 =?utf-8?B?bjZDeVBNc3BVRjB5VTdjbFk4OGVWcERiQUx3UDlqRmg1dHFpaEZtWStjWEtn?=
 =?utf-8?B?L3lzejRRQnVNam5PbGc5Z3dXcVJwUGo5d1JsS3VvOUhSdk5VSktIY0ZsVTdF?=
 =?utf-8?B?dVNmQkVFcmJQY1JuczlWZnkrUWNEQ0hvcXFKSC9oK2R1Ykg0REhraDExeTlw?=
 =?utf-8?B?ZmwxV3E4bTdXcit3Ui9SWGY4T1BMaXcxV1pOa0lyN2dRWTRUOGlQellmakdw?=
 =?utf-8?B?QzdpMGt0TWh5aUladUpscUdGaTBicjZvUkIydEZoejlDVC84MTN1a2ZtWjhn?=
 =?utf-8?B?NVBBWXg0Rm9OL01lakU0UDdTdzhYcUJ1NUVCaVdUOHJMQmNnZy8yMURyOE1C?=
 =?utf-8?B?REFzeDZwT2U1TmNJNG55cElnV1ZnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5a6efa-34aa-46a2-40c3-08ddeaadd13f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 05:50:41.9433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAcCE0CFqpDlxSSNA2hVhajbYFcLK/9/lgWKwxa99T3rhKI5uoDTCjmYwy+sklkyAhVmdxB4XgdeWnF2D/Rn+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6145

On Saturday, August 16, 2025 2:53=E2=80=AFPM Aaron Kling via B4 Relay wrote=
:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> P3450's cpu is only rated for 1.4 GHz while the CVB table it uses tries
> to scale to 1.5 GHz. Set an appropriate limit on the maximum scaling
> frequency.

Looking at downstream, from what I can tell, the CPU's maximum frequency is=
 indeed 1.55GHz under normal conditions. However, at temperatures over 90C,=
 its voltage is limited to 1090mV. Reference:

static struct dvfs_therm_limits
tegra210_core_therm_caps_ucm2[MAX_THERMAL_LIMITS] =3D {
        {86, 1090},
        {0, 0},
};
(rel-32 kernel-4.9/drivers/soc/tegra/tegra210-dvfs.c)

Here the throttling is set at 86C, I suppose to give some margin.

1090mV perfectly matches the 1.479GHz operating point defined in the upstre=
am kernel. So it seems to me that rather than setting a maximum frequency, =
we would need temperature dependent DVFS. Or, at least as a first step, we =
could have the driver just always limit the maximum frequency so it fits un=
der the thermal cap voltage -- the temperature limit is rather high, after =
all.

If you have other information, please do tell.

Incidentally, some of the CVB tables in the upstream kernel seem to ignore =
speedo (I assume they are conservative) while rel-32 has different tables. =
So the upstream kernel is probably running at slightly unnecessarily high v=
oltages.

Cheers,
Mikko

>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/ar=
m64/boot/dts/nvidia/tegra210-p3450-0000.dts
> index ec0e84cb83ef9bf8f0e52e2958db33666813917c..10f878d3f50815d1f0297d156=
69048ab9cad73ee 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -594,6 +594,7 @@ clock@70110000 {
>  		nvidia,droop-ctrl =3D <0x00000f00>;
>  		nvidia,force-mode =3D <1>;
>  		nvidia,sample-rate =3D <25000>;
> +		nvidia,dfll-max-freq =3D <1479000000>;
> =20
>  		nvidia,pwm-min-microvolts =3D <708000>;
>  		nvidia,pwm-period-nanoseconds =3D <2500>; /* 2.5us */
>=20
>=20




