Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012043.outbound.protection.outlook.com [52.101.53.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8852206B1;
	Mon,  2 Feb 2026 05:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770008935; cv=fail; b=CVfHDfMP5750qXRT/FwmJqGOuqnfHZ8NY0BxPBP/uhFbfbowsRDWb2Ikwpe4FSgGblahgwOlEgV/beGxSUWs6z6bB/GRjT3MgjSvO6o/PMicsnKtG9KL18vfFp4+x8ImzCZ/8FdesxC5APmVrHuIioPoIN5l/R4Jio8vtLRDas0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770008935; c=relaxed/simple;
	bh=R5272bhrXte8dmVvTsR/wy3PY4bY/god27J3QNRmrf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m1hyJiP4s6l7XWKhlMFWKMQoVezV5jNOmImLmnghwTCVUI3QXfz3hqwQu9Zo0XGlkUapI4QoZF6TPC6htjluEhd8JLC3OR5jH1KmRa+IU1NNAKYUSTzu62QYA9/R7+wWFO4RjaD2KP/fERi+CZxzzSJNmXKuvSU70IqO9DRn4e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jwSssI2F; arc=fail smtp.client-ip=52.101.53.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jwSssI2F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCGEdgF/KcurhgLpDzdaJSq0P/kEzWdZuGk+OCy4N6R9heERSG37GD27+SYfCFY83gQKJWCK3VjqZGskjPfxj11qjeeU86s9wV32F44C+bgNjlR+cRAVJFQs1M5cLyQnI/dX5ViRKl6vNoWKhefc3zCZPaUfkTznGjfGZIrxoZEY7fH7w91W9SHCgdn1mosBAyCUvmaUQkaI9dUjSzBAyyZLthmzhl3GbTiQ+RvICabmGAW1JkihjBEIwRMXtND4p8W+2ZMnMhMXmMGq+nOoHswWPapsJ2NDK5MaAlPVoPZiTQnNqYpJHYrziLzadrDtizvKfIgcY+XiwWABZV9a7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPUZcnMQL/pMRMybAtAA+6K9Hl+/W357GFIHXBWcfa8=;
 b=G2aviHM3MKw5SnK9GRwacBFGV0rWOityqMh2LukUV+Mb1AON0xZ/tMYODlNeqXMQVgAphOph+D9iU8svIoA5PiJjwynQXkhYRLcyrI2/A0Asc8D+Mx1PwwgoabNm39C7t9Gc3DbUOAiqsi19/KvOPM26ursXKVK60zZmNL16wrcwBrWt74t3k9ZvGHc2U6Z2E3MMQJz/DTL5b45JZPheM21gChL99yZNoLVv32rcU95hsqz/ok2CLIKaozxSKKOJxmELwa4NHX5+pk8VCfcbTRql7rnBZhr/lXNNzoeRMKjn/ua14bXD9HjoHKcZJ3+3o8YMMESP1v0pLiXOrHnwfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPUZcnMQL/pMRMybAtAA+6K9Hl+/W357GFIHXBWcfa8=;
 b=jwSssI2Fb3hGJhi1kkya8BkKxWA9rjAgdk1dUry/OODo3CgO4kvawhLNvLYsprvJe3sdGvi4cQ19tuDQ2z06bixlBaptBmVrzPi6VmzYDbB5IhMdye//AHHqpKTzaBxfEtCsOpH+MlAhUzFHbU+Ph1IrQUkLxrsgrd9wnwqy1HewGIJGQ18aHsABNExwPG04lsgRCGqtIpqfXRsDdtzMbI2gxPYlNt/hTDGl/dUDyA6ZX06qrfvDJ8R2b/Z65D+5T8p+OZhCNluq8cy2PVrc0hvHUaVaYacwxs2nF/72dLcgsjaSsLX/A7YrDf7nCn3ZMYuyuRDjOu1LViTjMyiUKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 05:08:50 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9564.007; Mon, 2 Feb 2026
 05:08:50 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Don't mark devices with pins as IRQ safe
Date: Mon, 02 Feb 2026 14:08:47 +0900
Message-ID: <3325924.5fSG56mABF@senjougahara>
In-Reply-To: <20260202-i2c-dpaux-irqsafe-v1-1-5b1847e8bc97@nvidia.com>
References: <20260202-i2c-dpaux-irqsafe-v1-1-5b1847e8bc97@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7a7c0d-2a23-4416-cf1d-08de621926de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWpSNW93eFNJOU45cklPM0xNdmVDT0g1cU9BWm1uOGg3TC9pVWx3RXpXaGdo?=
 =?utf-8?B?U3o4SzlTbkwxWWJlcUtHL2FHemdkZkh1RTFiZGF2ZkxlQXNhbFVJYk9jQnV2?=
 =?utf-8?B?cnBSemk0dnNKaVVSMmRVMmRXQjhpMzgwR3VoR3FsZ0d5d1JFK3A5U0FkY1NH?=
 =?utf-8?B?S0hrS1ZzUWRmbHVKR1RaeElzUlpqZGcyOTl0L2ExeGdycC9KaXJCakU4WTBW?=
 =?utf-8?B?UVh4Z1pZNGo1eTg1S3dxaDVTbXpiSjNKSnRwa2lVMnZYRFFNV3NyY09qSkI4?=
 =?utf-8?B?VDdSMVJxdk1KNldyM0VjUFNoVUVqYk10VXFKVE1PNjEwNTVVc2R5ajFoSFdy?=
 =?utf-8?B?RGN2bG5PaENiMHZxV3NMZVZFU2lsMm5WUGtDL0hDWlVIOHdsZUkyZ2djL3RH?=
 =?utf-8?B?T0JYNFJFdWh4MlFFWStRbHNGN0VDMDRtZFByQllZVGh5ZVlORVdUR3F0bW9q?=
 =?utf-8?B?RThaY0NTZ2ZiTTJ6aHN4OGhHRm1ycTkzOTlFdHAyWHdSK29XeXBad2JmdWhO?=
 =?utf-8?B?d1F2NENkUERBUWE4ZnlybG9CSTdpa3U1SVUva1piVE1lb0NpMnpuVnlWZnRy?=
 =?utf-8?B?SVdsNGY3dmV4Ymd0VFVzaXB1cGF5S3FvcGd5ZHJGLzJvd2ZCKzNRbFFQNmho?=
 =?utf-8?B?UU9BT3hmTXZ5QTkyTlZ1RnhPMExrNHpRTUU5bTVkdm5TQ0lxNVk3bGNEOXZO?=
 =?utf-8?B?OS8vUlF5OUIxVld4OFFJVlozcUVwa3Q4d1JBdEJMZ21VaUM4dndtY3VidS96?=
 =?utf-8?B?MjZiYnJyUzJGNzJXMnp0Z1lYSnVqNnBUek13Z2Z4a1lqaVBTa2Iydzlpc1pq?=
 =?utf-8?B?cUFrcU44cHpXNjMyQndxWk5iSnFsOGsreGcyTHNtdi9VOWYwVlh0b3hvcXI0?=
 =?utf-8?B?U0pIZmEwNmFrOUNmbVc1eWxsTXh5dzErUnFVcDdVT2NlODJnbU1JcE1ubnRR?=
 =?utf-8?B?Y0hFMkJha1RBcGxTd2FFeXFRa1hndDBNOFVYNllVREp5RHVUajFkRlIxZVdx?=
 =?utf-8?B?Z2hUYmF5dW4yaWgwODNNY0hndm4vQ01iY0lQWE9UYUsxbVBPVVZDbnlkOTdI?=
 =?utf-8?B?bWdYQnRISHhZRGF4dkJWaCswdE94QVlJV1NDRlVyUFc1L0JDMVh0eTV5Z1RI?=
 =?utf-8?B?eUxlSzRLNW00M2hjcWhQY3AxQ2d3cWlmNDZBN1l6SUt6a0tGZ0hWdXNhdWtZ?=
 =?utf-8?B?SEc3MUU5OWhOSnBtYkpDK0hiYzdMekJhL1VhdEdLYSttbDB1bDZpQ3NWOHhL?=
 =?utf-8?B?SmxHZHJRcVhTN2x3QUlPMktERVJpRXpJajhpOWdhdHo0UXpFYlRKbVRVL2tq?=
 =?utf-8?B?aEVOMTF1TXNTNnUzeGxBNE5EOHc4V3JFWHVyNU53dGJRbXdiejNRci9BZTlx?=
 =?utf-8?B?bjJYWFUwWlJOSFBVWUU3RFZZUDBXU3pVOFRUOHBVMDBNMWl5VUdGMXgrQzQx?=
 =?utf-8?B?MWxWMnpEMlpnYUo1Q252ZTd1TnRCaVZsQzRPU3N5bDRSa25NMVNOcy9qZW85?=
 =?utf-8?B?WHErejFDaDkvZGpkeGhiVVRIL01qMDdWVU53dmI2UGFqeEl0MkdlSzNBMUNW?=
 =?utf-8?B?d2lacE1Gbi9lNWtpZ2hCMUd1UW9HZHg1YUlxbzlvOXpWWTIrdFJxQVJTaFJI?=
 =?utf-8?B?Nm1OczdkUE0wbVFRa00rSGhGdHh3UXpSQ2M3aDNZSkVJU3d0QkkwdWFHY0xv?=
 =?utf-8?B?TjF0cTB6NzhVOVV3cDJ1cnExbG1tV3B0WmFZOFcrN2pieWU5ZGgyaFpXTEQz?=
 =?utf-8?B?b01vZ0xqbFlGTS9uWXRDUzJpSGZXZDMyd0M3TFgzdVhiZHFCZDRTT1JVR0hl?=
 =?utf-8?B?dXc1M1k5cEErMmd6UjBlanlPK25ydXpzZnZqa284UllrN0w0L1pybTlOMERQ?=
 =?utf-8?B?dnpGVzhCTFp4WmZuQkJCaGlDZXN6N25yOFg1aDdQUzlzWlcxYUlLNnRVWnJH?=
 =?utf-8?B?ODl4VWlnNFk3NktTekhlTEl3QVFLWUM3bHhrZlAyZTMyWm9yKzVzWmozWE1B?=
 =?utf-8?B?ajgyL05IWDZoVDhwRDA4N215SmNLWXpXdlIxV2d6citZNkJ1cVd1TUUyanFT?=
 =?utf-8?B?UWhFeHFsdHYzcXY4R21BUjRibDVTZzUzeW5MWVRndVFHWlRZSzhXZE5DbGYw?=
 =?utf-8?Q?BqLg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmN5a0JpY3pBNm1LcWZEaEFTUFZyUUtDM3htSE9rNklSdU1VYVRZNzZZWFlC?=
 =?utf-8?B?Uml1cXp1R09QQk9LdXlMVUk1c3BqdFBsVXlFb3lNUU8vMy9nMVZyUW1TdXRZ?=
 =?utf-8?B?UlVZWW41WVRHYU9TQXYwTFBBN2VqZ0pSRXVFdnhLOXoyUFI5bkNsTkdOeHlJ?=
 =?utf-8?B?NnZJOHBFZU5pc0JLWTlDaUFtTnJiRGpkSmJMM09pVVlyeS9iZkNQSWJkSUNF?=
 =?utf-8?B?NTA5ejhGYTJ6YUNsMUJDakhEeW4zQklSMjRJNm1YS2hXTTlYSmRzd0pXdGdI?=
 =?utf-8?B?ekxpQXRDYTd0dG1lYkwrMFNqN0s5TUdvUkpBYUlBeWFsUXluSmozaTcxMUJI?=
 =?utf-8?B?aGR0UCtzTlNZMWtDWkY3eXd6OHR2MXlsVU9CYUR0ZVRJcSsrWlF5bkJDNWxn?=
 =?utf-8?B?RkZadEZvdUtTVzV2Q3ZFUlpxK0pvbTdxMk5wanhlM00xSngzdUhDVWs2cHNS?=
 =?utf-8?B?SGhtR1RiNnlhbnFiQVluVUtFSlJ5SVVwcHVnZ2k4WE50SnREby93ZjdkNGNI?=
 =?utf-8?B?UHBxdVowVWpNVzc4ditJMHZxcEFTS1BFYVVoMk1qVy9rNUFEOTVWaHNDU2x6?=
 =?utf-8?B?K0NYRzZzMVNaUFVsNi9WRXZmaEwrRGh3TzFaaDVZNkRWRGN2V2Y0UWp4VVFm?=
 =?utf-8?B?VlZUMUlabkx1NEk3bzhFSVVrTklBY2h3aTYyMHVWdzN3WDVGbDYzWTZNa0JZ?=
 =?utf-8?B?dE1SSkNqa1lXeFNxbHBaVEs5Y1QwM1lHN2JLUHhESUpOSGlOcHBFNE8zWEJS?=
 =?utf-8?B?UkdtV2ZraGwwMEwySmN4N3hTN1Yva2VUajVOcjhDRGtsVlVTT3FKNUV0Zkwr?=
 =?utf-8?B?Z3FMdmkxL0ZQNnNSWURNdjRLbTRkTFhzQlF6bXN6N1dSY3l6Qi9NdVRlSEVo?=
 =?utf-8?B?K0JLOWJrQjFOQnpybFlMZGNldnF2bFEzVFJvemU0WFdqYU1KS3dZTW5Hd2I0?=
 =?utf-8?B?cVdUcWpnZEw1K3pMbjE3eVRSNXFtUjQ3YWJKUm1zd2ZXOWRnNkRxcyt4Z3Nn?=
 =?utf-8?B?YktXV3R4YTJOT0hOR2g5aFVPdGkwdk9BbTl3YnhkbzlHSDdTRXFvdDU4dDBn?=
 =?utf-8?B?M3UvVGk2REczNkIxMXg0TzZRNjZQelltSWIySkVRT0t0WU9Ud1N4bktMc2Vv?=
 =?utf-8?B?L05uaGgvVGY2UkNCNDlPN1JzbXBSSktHRnkyMXZzc0NoVTNEK2NTd3E1dFFz?=
 =?utf-8?B?emhCZkdycVo4dk5XazJ2MU1OeGo0TXdCeTVwK0MzR2ZjTkZ1dy9lNmU3ZFVR?=
 =?utf-8?B?NlRMWXIyWUhjNWJoK09TaDY0T3NaMVcvcFRiN0hUSys2SkxHVFNENWNKdzlL?=
 =?utf-8?B?MFVDNjZyWGMzeUtqbjhYQ28vTG9hVGdHSzNkanFlTEpKK1NsN0Vaemwxak1X?=
 =?utf-8?B?bVMxMFVzMmdMN3c3K2d0VnkxTW9PYVJuekg4N3JjL1E5QUNOZE10eGdWZHJG?=
 =?utf-8?B?RUNMNGZHclRTNGhhZ2VkejZYWUxpYS9WTjU4eWVxYWk5M3IrdzE5WTZqYU1p?=
 =?utf-8?B?RFgwTWU3NE1xdG5WY2R4UEVLMmFpWEJFUDZxRjF0MFYrTVloWFJPRU5RdXFF?=
 =?utf-8?B?VkZUTVkwS0lCaFlxbDBkS2dmWW41STVRelhzT0FtWVNuYkc5cERzckM4STR5?=
 =?utf-8?B?VWVWbzVhSmR2WGdRQTlYRStuRFlqWW1Ma0JrRGJ1WEU4cGt0SDRqZGgzQnlN?=
 =?utf-8?B?ZlVTbHgwVHRzbGVPYmJwb0ZBQnp4K3Q3NHF5UnhsQThua3lZbWJRUlIzOGVI?=
 =?utf-8?B?VzcrL2pzZXJPYUJRY0VDU2VET1ZVOHBPTDZhQnJWYnEzeWQ3VjRCWU5sMnIv?=
 =?utf-8?B?ZzE2aVpBKy9IMmNkcm1ncHM2N1QrbnV4dndYSUczcjFxT254QVhmNGJSRnFN?=
 =?utf-8?B?dFlsQi9zRGkwL2xRcGlKWTA5YnFaSHVaQ2FxbDVmSSsrcjN5RG15L05zdTBB?=
 =?utf-8?B?b1p4Y2o5TzVWOWJncG1mKzdrQThpY0ppRThEL3pIcWpoTlNOUE1ReFFUaFZR?=
 =?utf-8?B?clMzU0t4U1BWVEtqdjFMblVzOWJ5U1RTUXlmeWovbmQzYjgyd1BFdEJvQVFC?=
 =?utf-8?B?bWZiTlhGVE9qZCtRcEVoeHBra0pxcXRsb3lXUjJqUkZNS29RaW1SNU43dzIx?=
 =?utf-8?B?d3pBbXA5aWFKQ1hzUngvcmczaVJmRU9Gcm1Ed0srSTFuWEt6Mk9OUkNXdXNi?=
 =?utf-8?B?OFRkRzJONCtNZnlRRUdPNFdmRHRreVd4OHRyVHBpempqbFU1amNuOTNkd3R4?=
 =?utf-8?B?R2FST2M1UnJUTkxQZ3pOY1ZoYlJmV2c1Q1RhaWJjNmx0Skl5VElSWWxNa1dp?=
 =?utf-8?B?ZFhmc3U2dHdTbEJzSGlObWt4a1ptNXFiU1hqSzg5Skh4MlJ4bXd6K2lYMzgy?=
 =?utf-8?Q?tihn31hDrV/L94mYqczlUk8cwtfrWJA3rmnWkswoH9W67?=
X-MS-Exchange-AntiSpam-MessageData-1: BSYzKdgCHtd2FQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7a7c0d-2a23-4416-cf1d-08de621926de
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 05:08:50.0234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeEJ8dF0XIKXRngk9BTEmLWfp1xjCP/Y/T7ufv2Ltrs7/OdawrI+/xlRjOXdPqSeDtf2/BeNt9uBS/um+RBmDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119

On Monday, February 2, 2026 1:42=E2=80=AFPM Mikko Perttunen wrote:
> I2C devices with associated pinctrl states (DPAUX I2C controllers)
> will change pinctrl state during runtime PM. This requires taking
> a mutex, so these devices cannot be marked as IRQ safe.
>=20
> Discovered through lockdep.

Eh, I guess not lockdep, just normal lock debugging..

>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index bec619b9af4e..4eaeb395d5db 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -2047,8 +2047,11 @@ static int tegra_i2c_probe(struct platform_device =
*pdev)
>  	 *
>  	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
>  	 * be used for atomic transfers. ACPI device is not IRQ safe also.
> +	 *
> +	 * Devices with pinctrl states cannot be marked IRQ-safe as the pinctrl
> +	 * state transitions during runtime PM require mutexes.
>  	 */
> -	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev))
> +	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev) && !i2c_dev->d=
ev->pins)
>  		pm_runtime_irq_safe(i2c_dev->dev);
> =20
>  	pm_runtime_enable(i2c_dev->dev);
>=20
> ---
> base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
> change-id: 20260202-i2c-dpaux-irqsafe-edc04628b401
>=20
>=20




