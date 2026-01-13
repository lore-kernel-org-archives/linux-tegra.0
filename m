Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DE935B12B;
	Tue, 13 Jan 2026 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305391; cv=fail; b=VD0h12g1NLiFivub86lWrekISrCxSfMEdst6fg3JL83QbTGklAGAe+h6Xp1s6euiAHPh8g+rw020xOLWDT2JWkSOB8iNOM6ogIEP/4WKl5GkxDJ4uBjz1yHl6dDv8/F9urssZ2aCGYLKFek+d4aQzXInoDRxalvk9g+k/dJBsuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305391; c=relaxed/simple;
	bh=WCSKzld1pT1y5cUCrPyuOhbUlKp0vtK7AGu2tCWGowc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IyXKl/Bk4OcvDD41kY/W5yfqYiRMAVtaWEfDmJePdiR41aLTA7+7DCS3zSkR+YPsIpgZRcR8K4aLdqomjJsm+NxYFzS0DAMZaSDobHBHszeofIcHZ+RLtho5iUoTWdoYnDFnqSkXTtrZTmnlisEymLPI7xXwkqluYWfuUAmrO1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ts0725uj; arc=fail smtp.client-ip=52.101.56.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ts0725uj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewl54fCqa8Yca/hYzPK3AEYXtnKkGwgraRohaymxO/KbwVhISVlv++CsZuKqhRK1iGXpMCm+mFhB7lYgeG4GVYY9srwufLenA3p05qWAmKjpXEbzhpsGVUkvmFW1Nploeknvv4R9gFBJjvxhjop9XgtcFOora+N6HsD5JNcnCwvVMk2y5buAGzR73F/vel0l06s9cBEbPsCJQmhlSkMYy3x/fIYExKMnJf8keVvIDovlo+oByXx4sVuqZWX+/i7bkRZwaXbZYfZletpiEJNZXDu4QA/qrZzyItUw8qPhRt6+sx8AU8lRGYZgJNlv5tgj6M4rmtrJiUs2BknCPgoptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pycj8gyC3JVy1MX4RWRUYAbyFWosXJzddL30ysFPrtk=;
 b=Nirr5QDICOeKh5ZxU6W/kgaX6JjQQHINJzOJlFAG+0QZBsJfpvUNFTnp654Dfa35OuA+xoADbqfjlCHYBF5ro71fx7dj/X0HJdnrbyKZaZa007wvUXGDhkfs38hdD/Vin6+3XRDcq4qiEUf53cOnCgURMNNouLVnyndIoGrzDPMmkZl8ULVXQ+pvmYkr02Ezio9p1ZY4ZP8rBcKkZYrJSUuNEHMcwhO78Q/A4cGtJLilRyEfoXvTSZHe2pbrqU6Mjw11kjy+G4+Jb5mH4gu+b+DI72L4YolaU6y9WncDLEu/FT2aYbnND+0lVzjxregEh8yeSZ6B695EHN9CrFLWKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pycj8gyC3JVy1MX4RWRUYAbyFWosXJzddL30ysFPrtk=;
 b=Ts0725ujzrR1GM/gCe7EoKGYHGl4y0zjOEGmaD6vxJS+yzYyQwe7HIAAaKt0RURt4edfN5IjCPLOqkDbvtt/Fstp3JuqkCCfVxCFamFbeAzI7zuuBR/SvHDnJN4yr63LKqR5lNKA7HH75HIMLAiF/ZWzcit8F70ZJklclPSXopMeoSLxpyaM42x9b8gmsdijJwVngzjA6nfuq1X0lVNTB+wsG8BYk9QRDCXpuEO5eI59tsdtZwYBaRo0b2aplAB2c23lYvxEUk4q/giuj0/fwjJkeDIw+zzferyDeFkxZksrXX33NwLZn2NvFiuG6nlGhz3feDKeX7dA2B/JtqN46Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by LV8PR12MB9206.namprd12.prod.outlook.com (2603:10b6:408:186::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:56:24 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:56:24 +0000
Message-ID: <86cd3ff0-1609-44cb-911c-f0e97652ca1b@nvidia.com>
Date: Tue, 13 Jan 2026 11:56:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: tegra: xusb: Fix ordering issue when switching
 roles on USB2 ports
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
 <20251204-diogo-tegra_phy-v1-3-51a2016d0be8@tecnico.ulisboa.pt>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251204-diogo-tegra_phy-v1-3-51a2016d0be8@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::6) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|LV8PR12MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: 306ccda2-99e5-4edd-9660-08de529ac66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjdJb08xQy9yOTRaVFVONDdUbFlZK2thOHZ5bEhmcWJGY1NjeTNaZmFvQ2I2?=
 =?utf-8?B?QlBCbUFQUGlGbHdRVmt3bEQrL3cvSHQvYXgvSnRCZGZiaDArNjRlVlNDV2JG?=
 =?utf-8?B?dzRlSG4weDE1ajhWZkV5SmhUdTlUSVVwS1ZXU3FMTEhjbXFpUCtrRGp2Sk4r?=
 =?utf-8?B?eTF3dDd5Y21jc1ZJalN5RTZrSy8yRmJXd1JyRW1KOFZ5WnA1eTZzMnBjdmxY?=
 =?utf-8?B?Q1RqaUt1YTdlVXRkZ1BpWE9DU21ZMFhtMU1vSVkxS3hIaHF4bWVuVDBSK3U0?=
 =?utf-8?B?dDNwUkw3emJ2bDhNaVJlZ0twVTlRb1NlbGtUakhTMmdDNkFpUjZqMHZWckxY?=
 =?utf-8?B?SllUdUp0Q0lQWmhlRjVlWUwxWmtqSUhibm00Skp5a3ZPZVhXNW50cGFlWVBF?=
 =?utf-8?B?d3lsVXRGZ1hsaUY4bVZRV21NZjd5SjllczVEUGQzSStLdDJKZ0JtSm5hY3Mw?=
 =?utf-8?B?eEVlb2o1ZW1BYnR1bC9PWGNzUkhqU0NmRTZSVUdaRURDNGdzakNpUldVL3Za?=
 =?utf-8?B?TVhUejV6NkMrUDRram5qajBXVEVyeHhXM2liWEpFM3IwQ0xkdzAzN0VBU096?=
 =?utf-8?B?R1BTNWYzVjYyMytGZU54cHhSRmVhd0N1LzV1RXMrWVNVL0xJL1pvMDlPcnFS?=
 =?utf-8?B?TXp3UnBNTnpSZGNEMUhMeEQwNWp6dDBUMFVNanB0MXdVci9IZWx2ZldWaG9G?=
 =?utf-8?B?Sjl5NEhMWnZQbGdURVo3amNlMkxZclhkWHR4OFdiazRKR1lUeFlhT0FSYzZv?=
 =?utf-8?B?VnF1M1VzTkl0VE01ejVySmF3M0dnRk5WdW1YMkdyNGhxZFc1c252TFlReVJp?=
 =?utf-8?B?a0xzWHF4MHpGM2ZOZFI2SnQ2cit2OWlZazZjWE5Ycys1YisxUC92dlhtdHBS?=
 =?utf-8?B?OFhVZDNucURueFl4SGNscTg3ME05MHNtOFFlQWVVc25GOGJ2WnpUc0llOFJk?=
 =?utf-8?B?WjJyVU9UTytrU285dzcrNFRTZ1draTdnd2gwcjZUc21selUwQ1lEZ1NVN005?=
 =?utf-8?B?TGZJU0JoVVdTMmtqT0kyNjMzd0hrK01tTS8vWkdDT3FRQ1UxUTJLVitwM0Vl?=
 =?utf-8?B?Q3lTMHBRc1JQazhwNEYyNzBOL1ZhNGt6RDEyY3RScmRLM1NjYm1tWHI0NFp0?=
 =?utf-8?B?QnJjRGVrWGtZM2pwR0M3WVlCcWRQcGlFV3lvMFNOdmc2RnJoMU0yemhaWHNt?=
 =?utf-8?B?Ynp5TVhkdnhxQkdSNVdUcll0QVhTNjRpaGdLYkt5alh4dkFQSzUvMllFZmU1?=
 =?utf-8?B?M0xwSmRjTi9IRGp0bXhlSmdRc3M3dUNpSWJwNWxaZjZ2Y3Z0RU80SVFiTnM5?=
 =?utf-8?B?blZRTHkwZFZQR2gza2dkalU2N0JGRittemVvbDdlaUpFNWRZeElaYmNicVpI?=
 =?utf-8?B?RUN3dVVhTG5wSmR0VEM5ZkIrVlhSWVpuaEVlR1VXYU5qdGNTZm1CeHhCZWVP?=
 =?utf-8?B?bk01YzV2c0dHUjcwUUcyL05PbDZXSnQzd3hGK3RwSzhPTkUxMjRCSVJlazVs?=
 =?utf-8?B?ZTZPUnlHalQ2cDJ0NUh3UEI2cVFoNVhHVzZOVWlmczZVTGNqSzFKMXBCK0hI?=
 =?utf-8?B?djFIY3dJekE1bW9aNHZ6TWFNNzVjbCtyWDlMeXNTSjVnS21JaDFhNTNneHdZ?=
 =?utf-8?B?MVlETDVGZEFlVllKZXJaM2E4M0xDWC90dUE2MDVaZkRnQWRJQXN2RmR2Umdi?=
 =?utf-8?B?NXRqQit0WWhOb3ZXeWEzYkR1NWE5SDRPZUJhakVRNk5ramE5WkRGeHgwQm1W?=
 =?utf-8?B?eHdnZ1lDaFRiMDMwZTNvZmNmckg5L01DNU5XMjNUSk5kSW9WZXNrRzdSbFNo?=
 =?utf-8?B?QjJ2OWFNdVRIUEZ4N3VXRzRpNDhJRUpXam9ZSExRS0hpSnBFL2JRV2twSS9t?=
 =?utf-8?B?aGRZb1hFb3JadjZGa1JpLzB3b1lRdnpiUkYvNUZVOEhiaHo1QUlNcmRYcEcw?=
 =?utf-8?B?SCtTcHVVYmRHV1dVdWZtRysrR2dLTnFwWUVtYjkvdmc4UkZNbHhBQ3BpcUNx?=
 =?utf-8?Q?sg/8R+W4yqvw9o3ns+lG+d6Yl76Xig=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnVNbkMzd3VsMUwzUDZySlN6NkFVMzk1bW9hSnUwNkh0WU02ZjJXc2FNNzFZ?=
 =?utf-8?B?U2oyU2pYTnlhZCtDc0tnWFBZWWNhQjVGbHF0TnVQaEQvZ3ovNXBxQStJSjRL?=
 =?utf-8?B?bFVVaWU1L2ppVnNpTFlEWnN0ZmdvWUlVMTB5dEIzWDIzZ1ZQMUJhMmRpdEtM?=
 =?utf-8?B?UmZVOVhveVUwU0ZSQmxNaUo3ZXIwRW5Ta2pXYXJMUCtLTHdUUStNYlZwSzdD?=
 =?utf-8?B?bFFjODhNNkZ5ZWltcGlTQnlJcmllNnRoeXI1aG9sRmJPQ0t1ZTZ4U3NEMDRt?=
 =?utf-8?B?eFhpVWFjdHpDd3hNU3Fqd2xrb3JNRU9CY1I1ZTlCb0taNGpVMjFuS2tJRGNV?=
 =?utf-8?B?UVNlejN0U2VudVRXWWhOZzNyaldVa0VNZWJDbEQvaHBkZlBCMUorOCt4UWlC?=
 =?utf-8?B?Q25qejBqU3BFL3ErZFkrMVBubTRVemszL25nbVIvSU1UVTdRVzhHdFlKSWhx?=
 =?utf-8?B?VkxENHk5YmRubEVyVFhZcmdsM3Z6ZEZ2NDFQMEZ6cVlwVWdNckVibEJKbEpJ?=
 =?utf-8?B?NDI3b20rcC85VG9HRzVucXo5YlRlSDBmRWhtNjFzSlRLbUEvNW8xNTVra0I0?=
 =?utf-8?B?dVl6U2ZFalU4YW96c3FKdXBoWTE5R01TdXhjaWZnY2pvcitKT296bk1tNUtZ?=
 =?utf-8?B?T3NDN0hwVFpFSnRZVVJ5UWtrbW94SERNU285MnFPc1ZicUl2TTFDMWlpSDBt?=
 =?utf-8?B?Q2VCMm5EZHlVSzdGRVluVlU0UTUzT01sam9Jb2Y5VlNVbHJhNUV3M0t6WUwy?=
 =?utf-8?B?bExDSXVFNmpuRVQ0clpBOGZDOTREbW5GYkM5aVpEbHB3TkY3cXJIaXcxd29P?=
 =?utf-8?B?RHNsWHpyeDF0M0VQaUp6Y0sreGVlY1JENzc0ZVFrR3ZmdEN0QW44VlloUTJB?=
 =?utf-8?B?OWY4aGkxMGxBWmUxcko0dmZGTmlRSldaUFFnZXh5OVV5WnJLeDhWZFVYQmw3?=
 =?utf-8?B?QjdOZmxOUG9NMUhMUFVIbW1xdFFPdnBrQ2QzYnBKUTdJcnkrM0pwOFowMWpP?=
 =?utf-8?B?ZmJmYjNIWlNBNVdicmlMZWVIK3BvRUdvd2ozd1o0QXo5bWtkMEJsUFdWR2p1?=
 =?utf-8?B?T0VnS3V5S1B6OUdycFZKRkVMVDJ0azFidXhtWmpnMTYwbURZdkpxMCtJeW5T?=
 =?utf-8?B?VWZQdTlrM0VMLzAzbENCVXVnYjRuWktCcS9IVWFRc0lPNjROUGhYL1lWRTdm?=
 =?utf-8?B?T2VhVUowQ2d6WStGN0dUdDVQbXBuWXNrN1BwUC81eWxhSE5zaVhkUm5BamRt?=
 =?utf-8?B?R2xkcWNEVmVEWXl2Mmczckt6Qi9IRGpheHE3UVp3Z2pqUE5LUk44VmtId2Jp?=
 =?utf-8?B?OHBtdmVzS0g4NVg1ME5vRkpxTkFlVzl0aUI3ajJTUGR0OGZMUW40cE1NSWNP?=
 =?utf-8?B?WFNLOFErdmJHZkxycGM0VWxpMmI3bEFFUTJ4dXo3Z1p2cWxWN3k0V3BIYW9j?=
 =?utf-8?B?NTVycjllUTVwcUwzOUNxdThqMWUva3kwUmgwNkdPeU5tTGtsNW5sa1AyNG8y?=
 =?utf-8?B?ZnYzWEVsclZZc0k3UmRLU0lPVlRjLzRpUi9tMmpFUHJOWWJuVWtTSnoxbUxI?=
 =?utf-8?B?cDVtbVV5S3NuOFV3bGd3RXhGeGpYamF3VGJhVnhrWStVUThxTGRWbmEwL1VF?=
 =?utf-8?B?SjYvSnpKMmxibC9lalhldnpITFU5aDNBVUtsaGtyWlR3QVUzS1FNVHhobEY4?=
 =?utf-8?B?cnBXb1MyWWl3S0srUENmU3Exb1JSODdOaUhrTkFLVVdhd0N6SUZ5dGRUVkhL?=
 =?utf-8?B?VDR1YldueTB0ZTVhb0w4dm1VMnUxc0NZTHF2TjAySXl1NGRRZFFZMFdDd3dN?=
 =?utf-8?B?UE4vUmt5eW5HMm5vejh4b1ZzQ1lnbktaM2c3UXZFUzRraVkxcDlDZjkxallR?=
 =?utf-8?B?Mm9SUXU4YXdUclBQUHdKcHZQV3NHc3A2cG1sMExWeHBiOEc0RFlrRFI3b2lQ?=
 =?utf-8?B?WDBNZEt1U1puVjdPNWVRZlJ4ZHNweEtWL0FCTWVnR1RKdVhqV0xUcFRPemZv?=
 =?utf-8?B?M1FEVTEvR2FCc0dkODloQXp3VzkvZFo3K01neklvUlhlMjBZU2JkWTRuRnEw?=
 =?utf-8?B?L29manNUcTFMeWZBQngvR2NqQlFGZXJ4WkRTd0h5c3ZuM1ZoUnFwanc4bld0?=
 =?utf-8?B?M2RlOEhoZGNLSjkxaFlsaE5vUHhYRVVLL3NtUnNMV3BCSVJnOEJ3UlFYVHRT?=
 =?utf-8?B?MUVxL1c1N3NTcm5wYkZLU1p1bm5pdVdsMVNrU0RGbTdnMnFjMU9EdE4wek44?=
 =?utf-8?B?amZYMW9XeHBBdW5SU05DaDJDcHF5d1l3UG1yK1dxUUtBNEpDN1dYK3Q2Tzlu?=
 =?utf-8?B?SkpFVnV3Slk3TlpLcXhZKzZCQlhTQWp1TjNLYU5wNTkxUWtualVrdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306ccda2-99e5-4edd-9660-08de529ac66a
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:56:24.2384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eY2xWhE9nrwBaakIA72ymGq+DfmDaQ1XU3+3ZogoqUUbhLvgtujyzOgyVJ+BnBeEScA/9yrNkuGh14864nUnfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9206


On 04/12/2025 21:27, Diogo Ivo wrote:
> The current implementation of USB2 role switching on Tegra relies on
> whichever the previous USB controller driver was using the PHY to first
> "yield" it back to USB_ROLE_NONE before the next controller configures
> it for the new role. However, no mechanism to guarantee this ordering
> was implemented, and currently, in the general case, the configuration
> functions tegra_xhci_id_work() and tegra_xudc_usb_role_sw_work() end up
> running in the same order regardless of the transition being HOST->DEVICE
> or DEVICE->HOST, leading to one of these transitions ending up in a
> non-working state due to the new configuration being clobbered by the
> previous controller driver setting USB_ROLE_NONE after the fact.
> 
> Fix this by introducing a helper that waits for the USB2 port’s current
> role to become USB_ROLE_NONE and add it in the configuration functions
> above before setting the role to either USB_ROLE_HOST or
> USB_ROLE_DEVICE. The specific parameters of the helper function are
> choices that seem reasonable in my testing and have no other basis.

This is no information here about why 6 * 50/60us is deemed to be 
sufficient? May be it is, but a comment would be nice.

> This was tested on a Tegra210 platform (Smaug). However, due to the similar
> approach in Tegra186 it is likely that not only this problem exists there
> but that this patch also fixes it.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   drivers/phy/tegra/xusb.c            | 23 +++++++++++++++++++++++
>   drivers/usb/gadget/udc/tegra-xudc.c |  4 ++++
>   drivers/usb/host/xhci-tegra.c       | 15 ++++++++++-----
>   include/linux/phy/tegra/xusb.h      |  1 +
>   4 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index c89df95aa6ca..e05c3f2d1421 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -740,6 +740,29 @@ static void tegra_xusb_parse_usb_role_default_mode(struct tegra_xusb_port *port)
>   	}
>   }
>   
> +bool tegra_xusb_usb2_port_wait_role_none(struct tegra_xusb_padctl *padctl, int index)
> +{
> +	struct tegra_xusb_usb2_port *usb2 = tegra_xusb_find_usb2_port(padctl,
> +								      index);
> +	int retries = 5;
> +
> +	if (!usb2) {
> +		dev_err(&usb2->base.dev, "no port found for USB2 lane %u\n", index);

This appears to be a bug. If !usb2 then dereference usb2->base anyway.


> +		return false;
> +	}
> +
> +	do {
> +		if (usb2->role == USB_ROLE_NONE)
> +			return true;
> +
> +		usleep_range(50, 60);
> +	} while (retries--);
> +
> +	dev_err(&usb2->base.dev, "timed out waiting for USB_ROLE_NONE");
> +
> +	return false;
> +}
> +
>   static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
>   {
>   	struct tegra_xusb_port *port = &usb2->base;
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index 0c38fc37b6e6..72d725659e5f 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -698,8 +698,12 @@ static void tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
>   
>   static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
>   {
> +	int port = tegra_xusb_padctl_get_port_number(xudc->curr_utmi_phy);
>   	int err;
>   
> +	if (!tegra_xusb_usb2_port_wait_role_none(xudc->padctl, port))
> +		return;
> +
>   	pm_runtime_get_sync(xudc->dev);
>   
>   	tegra_phy_xusb_utmi_pad_power_on(xudc->curr_utmi_phy);
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 9c69fccdc6e8..9944593166a3 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1352,18 +1352,23 @@ static void tegra_xhci_id_work(struct work_struct *work)
>   	struct tegra_xusb_mbox_msg msg;
>   	struct phy *phy = tegra_xusb_get_phy(tegra, "usb2",
>   						    tegra->otg_usb2_port);
> +	enum usb_role role = USB_ROLE_NONE;
>   	u32 status;
>   	int ret;
>   
>   	dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra->host_mode));
>   
> -	mutex_lock(&tegra->lock);
>   

Extra blank line here.

> -	if (tegra->host_mode)
> -		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
> -	else
> -		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
> +	if (tegra->host_mode) {
> +		if (!tegra_xusb_usb2_port_wait_role_none(tegra->padctl,
> +							 tegra->otg_usb2_port))
> +			return;
>   
> +		role = USB_ROLE_HOST;
> +	}
> +
> +	mutex_lock(&tegra->lock);
> +	phy_set_mode_ext(phy, PHY_MODE_USB_OTG, role);
>   	mutex_unlock(&tegra->lock);

I am trying to understand why you opted to implement it this way around 
and not add the wait loop after setting to the mode to USB_ROLE_NONE in 
the original code all within the context of the mutex?

Thanks
Jon

-- 
nvpublic

