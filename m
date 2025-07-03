Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D0A2ED85E;
	Thu,  3 Jul 2025 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553794; cv=fail; b=UsPJXEq8kZvD9T5g8+QpemlOzdHjvYawS5dHSdxbrQtqvFM4b7/tpIuO3Qy458S/sjSIRS1wui2owxCH6DOLtH8Qhy/DTn+9kwPz8uHc6+7ZAWrwMXXLGI5SLPl1LzHn7zgxlXVS0SItR5waorfLcDTzZJr0Z0j975KTE/aT/s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553794; c=relaxed/simple;
	bh=lOH8YgJ+Z2qA/jT2cjy3JoiRnkF20JuuZ+lQclGu3TE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oJq6S/JCw0pEVsDaUfdTzZuUnjFlNhfYeQ1nxqsRH+5kioxPIDn8wayvRjWxTakVAowrRqReZGTi6hJL9psKIRG4WruY1Uy6opZiJLSphNx5uMX49+wdx6zpgk4BFVbCAKS8s/yOddalBsANRdbUwBZTZvSLALAJiJPT6PPeCgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qLDMuBO/; arc=fail smtp.client-ip=40.107.101.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qLDMuBO/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cmk9R6PLL9duAQr0+AFPKMJ83WSbQVG8hyw6aOa+xP7rEZWUeXQaBwLihnPjfRQpagqsClaGLFiZJVdCfwuh4C8/jv9hDMtWxWZ/D4YPYt+5XKGbt0ZGgLpkdvNiIpD64H1Y2ynXPTE4qizG7ZoTC5wNHO4CT3KjotNuL6xLg0B0Wx3uvJ8yeisnObdgYkc2dPCwMXath81mw6H9MtH8M35uQQ807LaUcIjANLeMAmZOshtQEnRTgP6xUMc4evagpFMUx8EfZa2vYVTQTdTRGEOcQs0XEc/2/tousIXx7GRSCAGPQ4HDLje+0QJR6Jl5wowlC2ZkwPsbxMn299/WIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmK4Z4jSuweZLJ6DdpINv4VztGsvsVwSMbSi4AiyLjg=;
 b=sIDvmpf1eZV37KXo35eMNUQNl4LiM+PxE4GZPNqjcdTuunQhc3M/D+TeNQLg729RREAoJQywwB1Xvdpeg5J/8+uAg0r7OQdeFLQL1zvCIarqr1/98GkrhikqYBG6th1jgZr8k+ONzAec5Nk5r0Q6NqsOGO0RLa8te2k4CW1nT/ml/5SOQhLbNTrN+ZCzZhXOb0MmG0LdwdjXethboV380zzVK13wtcXH90WwjMy07SP8X6awuqkgUOFpqkbOKpQRbmDxadW6lJDb48xIqUKkYW3xHcr3172kCrCq2xBp39lebgXCKACZagPPXfqjPRvY2pm/ihvwf3X44hzo7IRMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmK4Z4jSuweZLJ6DdpINv4VztGsvsVwSMbSi4AiyLjg=;
 b=qLDMuBO/YSSKbZA9iowaKtXuCtNHLKafgz1doeWxfSgPhj3tAVWMO9V6PQdDvRnBo3548vJzFuFByFtjnXV0GG9fuCQy5d+9QmCisHl18kUCh6mZReJmMjycA2xfu2JtDiaYedwtzQhyhxymlae/j45nZ8kOVydBLjSSPV9Y5dQKU1CWcO7THQpVPw0aU97P1Blph9EXAsSmuZJpC6LSGYlQd39GHor1EX/61ppYqRlqJuozzGMZPeXjcNA5Y5HtIXONNuATwmDPGPzBuWBppSQ1vLiBRra/bEw8rPMfWfFQVI52v8koLdCuxO+NXDehPZDxSf86ZjBrlFkT/AC5Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA1PR12MB8744.namprd12.prod.outlook.com (2603:10b6:806:38c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Thu, 3 Jul
 2025 14:43:09 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 14:43:09 +0000
Message-ID: <f39db414-1e51-45ea-bd5c-4c1d6fd9b87f@nvidia.com>
Date: Thu, 3 Jul 2025 15:42:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, daniel.lezcano@linaro.org,
 tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250630110135.201930-1-kkartik@nvidia.com>
 <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
 <a0d7a8c6-af60-4f70-9d60-a87e0701bc91@nvidia.com>
 <k2t3dkh3acoenhxtsd3ekvpnwl5yir6qaun52h5prdfwcx5lsb@h3ieoj7jfu6t>
 <79974980-7218-4fa6-b5c2-f3936ecd1fce@nvidia.com>
 <q7fi2hpswm2tsowrtbanlnidxnyq3fyb2xxr6gcowxv6sglhop@nsvwlol4dac3>
 <2b6f9898-9c46-4397-a440-102e21309488@nvidia.com>
 <fkepbr45smdcoyv3nbb3jvywmxqvh2f3htgamuya2lup3kll3u@4frpef756mpu>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <fkepbr45smdcoyv3nbb3jvywmxqvh2f3htgamuya2lup3kll3u@4frpef756mpu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0497.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::22) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA1PR12MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e76ac5-aafa-41ad-73f7-08ddba3fedf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFc2UnpMZUh5R0xwT3JjMEtMdzBWT2Z4cVRwN3JnSHpDMS83RmUxWm9aUFRh?=
 =?utf-8?B?SU9PUG04Mkd6RGFzaXRrbjZHMmF3Zm1CRzFUSkIyNEIxdHFIK0RRN0hHNFl5?=
 =?utf-8?B?VHFwLzVXcmVsQkVpYUdBY1BYVnZyeWpTdW1Da25KSjJ3aW03YTBSWWxvOFRt?=
 =?utf-8?B?VUxlV0VqaGoyOXNia1EvUS9nWk93K2s3dUpUdElJWVVQSlVkR1U2OEZOLzhB?=
 =?utf-8?B?VXhJdTZQeDU3c3hTRW1pSXpmK1NTWmZ5QlRRc09sRkVSYUZFbHFjZ1d2cmUy?=
 =?utf-8?B?M1ZiNmsyeGJJUTF3eG03MW0yQXlYckRROWFxSVVlNCtOcVlaWmdKV01WZVp1?=
 =?utf-8?B?YXNIRy9iQnlUMUMvakd2NUl5S21WYnBvWFNpNFdydVVYVm5BOVdJRVFPcm12?=
 =?utf-8?B?UlI3VXN5bHdwN1JGN1VkSlhRYUpmK1JRaTZQU1ZwME5qVDJSUENpQlBjcEU3?=
 =?utf-8?B?ZWtYYlc2akh5S0RqWW1WSEVBbk1QM1ZOTEJmb25FV2ZJVUx3bTZMNFFLcGJv?=
 =?utf-8?B?T013SHNoQ0ppMlhrK3NuQ3dEVWN0TCttaXh0YTh0K1JpaWxHRVFZVTFGK3hx?=
 =?utf-8?B?WFpadUFCemRKaTVuUlNKQ3oxUEN6UUszWVcwbFhaZXNSNGtsWkZ0bzZjRE9E?=
 =?utf-8?B?c1I3OHhreUlQK3RBQ1h3cE5FL0lVWGI5WUhzWU9RRTg0b1FId2RPV3RpKzNi?=
 =?utf-8?B?eThFYnI4N3RDOE1HeW5OREErUEtVOWg2Z3RpS09rL1o0eDg1bGFGOHk1cDVo?=
 =?utf-8?B?NE5IQ3p4K245UWRWbGJjTDFTaExwTW5ESWxDQzdlRUNyTWU5WEtwYlF2Mlcy?=
 =?utf-8?B?Y1QyZ1pGZmZvWmpvb0p3ZW5UQUVJaDkrY1N1Rllkaks0NTErWXNWQ2oybzN4?=
 =?utf-8?B?eXR6V2QyenRMYlVLQWJlWStRamZtMjdYc2cydGVQcjFTVHFyemFoT0lDVGcv?=
 =?utf-8?B?aFB5RDVYOG1idzFNb3RDcldKV2VZTFFIeXVQYjcxNnc0YW5wVk9TVUdYUXM1?=
 =?utf-8?B?U3RuVDk1SGFwYnZ4MUdmeGQyUk9FUnY4TlJDZGNlSHlwdFJWVHhnQThXaTFN?=
 =?utf-8?B?ZXIyM21kUUF3b0JlWk80N1Y3ZzJXNi9lT0JER1kzMXRrMGdWUVdpTllIY0lF?=
 =?utf-8?B?M1hNY3NVU0VVVTZtWmlKRkxaWndDYkVsSWR0cC9NcDFCNVRNaGpSdDdsM2N3?=
 =?utf-8?B?blNVRzNDZk41dk9rOUxleTQ5ZEdrSE54Qzk5d1h6Z2t2ZUJxMFdjd0RiTTA0?=
 =?utf-8?B?Q1hVb2Racm5XL0ZkRXN5RFR2ckFVSFV2K0NXWlVqOCtpYVpabkVFbEQ0ZXFQ?=
 =?utf-8?B?N3c0UTFiYlRuT1ZlRGxRcW9yV1dRTnNuZ3dYOE41YjhvWDZDYUw1NmY5ajR3?=
 =?utf-8?B?RHZSS01CUUhWbzYzR3lHMmozZnpKaWc1NkZYMnQ5YUJLWjNyalA5TWI0NWNB?=
 =?utf-8?B?NFBuRDRBTkVFTmRvazBid25wMWY1T3Q2QjZsQXNnc0xSVnRyUWUrY0NPUEJ3?=
 =?utf-8?B?YlRpV2JUSktpRzl1M3E4NS8xeVdxZTBSRkxvQUpiUk50MGFtR2dXc2pqV056?=
 =?utf-8?B?Q2hzVHdsVUlYczN0Y1BmYk5rMlpQUkg1ZEZudVRxMzdnWVFQb0pXbm9JV0dj?=
 =?utf-8?B?MW9rMDVpaXZpVTBFRG14N0g4SDZGd044VFEwRnpORUFVanNRcXVrOW9rUWJl?=
 =?utf-8?B?NXYxZVh6Yzk5Q2FSc3NRbjhqSzVRK1VqOXN0Z25QZThUMWxEemlvWmxwWW92?=
 =?utf-8?B?YVQzRG01UEc2WVd6UlluQlR4YUtEc3dxa2NNM1J5MzdZYUVjMEZqVkNYY3A0?=
 =?utf-8?B?aWZPck9tRk5oM0tnT3lTQm4vTzVwYXE2MWtuUXYySVI0NWpibk81U0Q0UlNk?=
 =?utf-8?B?YTRDVkNwUGxJUEZrc2FEOXNDakRrelQ5M2VYd00yMFVZRGFHakRKbTlNMTlL?=
 =?utf-8?Q?dM/693XWgsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVhNcXZEWTRsVGN4c1Jnb01DSVlMM2R2Vzl2MEk2ZHBnbjR0Yy9FWVlQTEpO?=
 =?utf-8?B?ZGdreExNWHIxMC93YXV0eUoybFBvbEpLNUdReHg1bGRVY2dOR0l3eUxENW1V?=
 =?utf-8?B?aS90SVZIQ2dSK2hpT2ZUNEQ5eDh6WDhZY09rQk9IR3ZGdVBTdnRWWFNrN2Vr?=
 =?utf-8?B?bnpVNThsT0dUWkg4ZTM1YmNGSnBzMCtRaUhRRFVNWG9oZnVmdFJCeWtEQXVy?=
 =?utf-8?B?cm9KN0o3dkVjSEtSQWRudWM3QzhVNUMyOGZkL3BFZkNNNFFFZGp0alpJZW0y?=
 =?utf-8?B?UjMyTGNRNTVyNjl5S1hvSmJFRTNqemxNR3dXYTd2c1FSSEdiR1hOK240eU5R?=
 =?utf-8?B?cUZPWHAxYmpzVkw0NnpuUjZmZDVsRitJU044T1JrUW5GTkcxbWc0RnZGNGx5?=
 =?utf-8?B?alY2Vll1L0xlWnQxQTV4YWxncGxoTGVVY3B3UEJQbUFYSVF2Z2NiWTJVUkpt?=
 =?utf-8?B?ZGhZV2ZBZ2tDeGc0Nk1xZzM4WkQveWsxVWFFblh0S0NacTcyaGkwVmJWMERV?=
 =?utf-8?B?OGh2WHg4NHN4OUpKMTVCLzMvNmJBNWhIektRbmFlc2lMR2JJNW1xNk1ZVExT?=
 =?utf-8?B?OFhWT21iNnFkeGZyVk5WM2c4RXFqTlJsSHBHZEs1U0N0V3lIbDZId0VTTzB0?=
 =?utf-8?B?ajR1U2xPR0Qwd0x0Sm9yUXlEL3NZckpKWEZPRHhSRTJzMEd5R050MmpYdnhE?=
 =?utf-8?B?YTlOTkFHa01aNno3VWNtODUrUGFsUjIrc0krV1cranU5a3BrMEhUdEhZVGFP?=
 =?utf-8?B?ZU4xSzFaVnFIc3k5aTdvVlhZNG5lOGRZbm4rOGlLKzBzR1lLVEJwbnFEaWc5?=
 =?utf-8?B?Ykd4S2wwNithaGgxNDNobDdSVldPdW9RYXpoVXpZamJwZkh4MUMvVXN6SVBq?=
 =?utf-8?B?UVhrTHRlbFRUdHNscEVUblJxY3J2RE95TXcwY3lUbStOamF0VEc4YmdkQkEz?=
 =?utf-8?B?N0RKQ2FJY0pXU2NVQ1N0K05sQ3VqZVNEQStVUFBORjFYUFRzZ3ZyWkdtaW9k?=
 =?utf-8?B?clB4S285Tm5DcmZ2UmVRK0wzWFZhdHowWU5OWFZkNTY3dlBXdXZZRTlzczR6?=
 =?utf-8?B?cVhEdENxQlNoczUxa3MvVEpzYlp3NDVYcW1UcjJrdFF1SWN5cWs0T0QzOTZ0?=
 =?utf-8?B?cDNnUzZibHB3STY4Z0hNMk5MV1JIaGxTUDd5UVVnMmZOaVdRL1JrMjJpeDFl?=
 =?utf-8?B?OGdTTmxud1VzYTRZTEFiMlY2VklxbEt3RzdiSDhXTE04aW9iWjdmV0o4RmpC?=
 =?utf-8?B?S2g0Zk12T0QycnJRTTdCMUVWdTVMQisraXR2UGUzTDBHUlNQc2VTcVhSOXRw?=
 =?utf-8?B?SFM0bmJydW0wT2dwY0RpUUFJRnVLa21qRXNSUWlrWTU2ZnpCWC9uUTh0OXU2?=
 =?utf-8?B?bnFYNzhDZ1JsTnZsK3EvSWF3NUVIdjRqYjg2bW5qTzFjMHJ6clF4bHc0TEZQ?=
 =?utf-8?B?aDhYa0xOVExsdkg0WlN6cTFXak5ONE0zdUVJS0pxVmRBbFYzRlZPc1JQYjNl?=
 =?utf-8?B?UlhlNk1hMUZ5YzZSUUd2c25NaGtKeWR0L290WFlZcitJVDNHVFU3TTF6MjV5?=
 =?utf-8?B?OU9mZkZMdys4eEg0NlNmaWdPdXhScUg0dC90MUMyOEVLaGY0eWEzanByQzFH?=
 =?utf-8?B?TVpoUkx6NjhMWVlYZi9hblpGenE3V2FVV21mb1RzUzFudU4vUXBmTW1OdTZT?=
 =?utf-8?B?OCtmNlh5U1VzTk9iMjBtQWErRnN3QlN1NkNBTzhHQUpIOEhiR3R0L0xPbHZy?=
 =?utf-8?B?bTVJdWJvZUVvdDFIQm1WdEFNK2VwTGNmVHhtejhzY0o0dHNKbzBSN0s5ZkI3?=
 =?utf-8?B?RkZxamJoajJibkFBaGVRbytYdVU2ZjI2RFZRSndOLzlkeklzeU9zVXg5QlRN?=
 =?utf-8?B?UzIvSEU4c2lwVXdsMVVCM1F6RDNaYXI1NkFrNjUzOU8rTUNaSTU2Z29jRUNF?=
 =?utf-8?B?dVZwWGk3dHgrMmV4cTQ1aEdYOXJxUXc3dTNTWmF6R3BZWlJERWJ4L0NJbGlO?=
 =?utf-8?B?OEQrM09sTFlkRjI3cm13RXJwZmZQQ1orWVFBR2lpTkRjbGJZZkYrR1lhMko4?=
 =?utf-8?B?NEU3RjFXZjV5eUdsWGRYTGVwZUQvaTBlWWM4UlhIaGJ0UDluQmlnZWxqQ0o4?=
 =?utf-8?B?OVAzUTVsRlFQZ09Lb21FOVNwVFNmTjNXNG1lMmtNM1RsNGdXanJjWDl5dktz?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e76ac5-aafa-41ad-73f7-08ddba3fedf0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:43:09.7754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LE3+ruZO7W0mY5DLgOZcdKhg+8kBkCjZcb45NaitOW5q73p2CI19tYOOTbhgdoTcf+ZnyJuec6CrejYuxOaXKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8744


On 03/07/2025 15:19, Thierry Reding wrote:
> On Thu, Jul 03, 2025 at 03:11:57PM +0100, Jon Hunter wrote:
>>
>> On 03/07/2025 14:36, Thierry Reding wrote:
>>
>> ...
>>
>>> I clearly can't read code today. Seems generally fine, then, but I'm
>>> actually really enthused now about using a second watchdog for kernel
>>> petting. Since we don't use any of the other two watchdogs, is there
>>> any reason why we can't cleanly separate both use-cases? It would let
>>> us avoid some of these special cases that are not intuitive to
>>> understand.
>>
>> The only reason would be if for some reason the other are all allocated for
>> other uses outside of the kernel. We are currently only using the one for
>> the kernel so that it would mean updating all the device trees for all
>> platforms to support this too.
>>
>> I was also thinking about how do we identify/select if a watchdog is pet by
>> the kernel or userspace? I was thinking that the presence of the 'interrupt'
>> property in device-tree could be used; if present the kernel pets and if not
>> assume userspace pets. However, the 'interrupt' property is currently marked
>> as required and not optional.
> 
> The other two instances are part of the TKE block, too. It should be as
> simple as doing something like this:
> 
> 	tegra->wdt_kernel = tegra186_wdt_create(tegra, 1);
> 
> and using that instead of tegra->wdt.


OK, well that is much simpler than what I was thinking!

Jon

-- 
nvpublic

