Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012034.outbound.protection.outlook.com [52.101.43.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66929A2;
	Tue, 13 Jan 2026 12:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305710; cv=fail; b=QHMO7D57q+dlrE9wZKocqv/B3cXmyJKXQKRnvvftjfRkWKIucGg/Jr8C98ys4UDfH4zG8hEyUX0p190YEvm6TyXKeuupLig3PW2W2KnwEztnvM55cnPpsrK9e7IJ62Oo/VwBrHDszK6lRGPrYjGgxouBBVMqgrOEHFBWxbe5Evw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305710; c=relaxed/simple;
	bh=ISoNfgCNDmgOkSLY4ipuNqV/tArOONpVBKoLvTIFN0c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cw+6Im/AZ8gnbdjdoP/fjtP8WbjNwtmHloZPJFSrIQhfB89BnH4bJ/zfVj9FGLpvclb1wzM8gYbiCVp5FAX324VnabOmC22lBEXm3K5I93ozOL5hR5tyKn+m419CKX1EJ03hNr+pdaUECmBjEXyooH5ckyuywMtIrbtj8VvCEzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ieq1JfMw; arc=fail smtp.client-ip=52.101.43.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ieq1JfMw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Colsjn04R55h5tLH5r42d5cTxe7wVAQtyGEsoNGQmOfDn+pTD3fks5x0msoPZae6CIVPGJ8WNoBNgykk4CRdrBoX70yJF5+ichz774fc1q+Xyjp8zKcqV8RUXYci0iblaoH8jEzyHtawwr2/URjjP7Lm0xwuSCXqBRja5c5wLCMdw/S3fEADV8UqB4lIoxwfXE+97PHLRL13OpzgLASxQ/OpMZ9ZTEHx4/MZ0m/eMhKYkrZrSuj1XxwAWCb3K7xYsBzM/O6qy3iqqgE6zbsZ9ZjByt+yrURVWiJlCb8HPFGw0+ejza99ra+C1azWQUOhqTIwe0AqkXHvMc5GM6n50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+P+Cy2/lQknuJJiwl/zsb9d+0yXJKJgRxtr4XHL4nw=;
 b=g1MuaOYbtNGlbG085aKsq8ayDz1MPnhGzPYvsW1NzJww1w7lNFRUpnjzzlcHxp1wWbaVy0xzO+GpQbhFJ6XNYk8cZbP/Bjx4PGp6p8bzwFRjB/5OZTeUE0D5LdqY/jZ34K2Jpp3CmgplWyzW33n6wSw+dbcUoMQ1/j/X4oEjcW/MqAjg7q+So7SNR6f71w7e7plTPkqdE/UXeNCS3ucEBMwZreb0ntoVqELo9CfEqybLbbq15aY0MqRgmKuXvCtJWbHm3EPJpaF4YhY43A6Ce3trvaM7OMXcNrywsTuYw39yIPRJBmlZK0zIpiKg+sOh3QWdNTTKYODRprQl0hTbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+P+Cy2/lQknuJJiwl/zsb9d+0yXJKJgRxtr4XHL4nw=;
 b=Ieq1JfMwckrBRqdrfkQAnF/+7dZdJ/TzOoxm2pVtNfvOIumtIbceQpJGcOhk7QcrJ+vBC1bHGj01X/c6Yvmh2OsGernGJk17t1eoRrZdWCPE5joXdmbtksBGy2Wdnhha1KrPJRw7mUzSwcxcMja47Dtd+XeBe+46keSt4MFv1gT41t2nPILNO02ZvN4d8TS3FhadtLbcrZzcJWCdYI3O96mCiTEjRA7dToIAotMBR0N/AGqW96S95UCdMBcgJAV9I7/4QTrePEsvxl/1aOQdYHoWEH+R5sS5fqN7kr7zLyN6qzPDj9zWkfqDZ0aZhzWD0X0bg7cieVDy3iXLYegpWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SN7PR12MB8772.namprd12.prod.outlook.com (2603:10b6:806:341::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 12:01:45 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 12:01:44 +0000
Message-ID: <c5450fc7-230e-4435-bd1d-3db4f1f6e736@nvidia.com>
Date: Tue, 13 Jan 2026 12:01:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] phy: tegra: xusb: Fix USB2 port regulator disable
 logic
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
 <20251204-diogo-tegra_phy-v1-2-51a2016d0be8@tecnico.ulisboa.pt>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251204-diogo-tegra_phy-v1-2-51a2016d0be8@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0038.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::6) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SN7PR12MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: c6bd460c-3fb4-4d70-1225-08de529b8521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEEyNm55cTdSTHFib1owK2pmNWIwSHA2ck1Qdk5LL0lXYkNIc2JpTm1BZE01?=
 =?utf-8?B?N1ZpclorNWlWMXc4SU1BTUxGUXBPbFNvL1p1Ym1yeGZER0ExelFXN240OVM1?=
 =?utf-8?B?UFBUakFXSW5tZHZmbWNxb1B1amZseDlDeHdZUTdnSFRkbXRrb2g4N0JoVE96?=
 =?utf-8?B?NEhNRmw4eXg3WUhkNDlsWEdlUTVyV21pZnlZNDhmN0w5djJYdTFyOG5pRzc1?=
 =?utf-8?B?V2U3eEtoMUtDQXNpd2xoUTRWaW81Q0Fnb0daUG5ZbnBrek9UcjNTMVBEV0RJ?=
 =?utf-8?B?bWxVY1VqNkdHeVQvdGY0U2tnSkpROG9XY0dMMU1KSG54ZVkxSjhwU3hjWE1Z?=
 =?utf-8?B?c0FmN2R6c2tTcXAyQThrR3hxMG9IUHRXNGRiNVAwMCtDVktnN0xRV0JabWZ6?=
 =?utf-8?B?eFAyMzhLeExDYTVidXI4Y2swV1ZLR0xCVTBwNVo5NXE4QWNuS1FpUkdpOUJI?=
 =?utf-8?B?M1F0UzNCbEo3Uy9kU1VBQ3lwSlBXM1paVjM5Ly9XSWFqRzYzQ1FVbklVWjhD?=
 =?utf-8?B?QmZqbkZHRnBDWkRzUk1TK0VzVS9YMEZEcHg5ejRDdWVaSTM5bzZCVk1qQ0xu?=
 =?utf-8?B?dVFMN3ppbkx6WnVxb29KWWZvUFRCN1JaMFZETXRwbXEwYWlBQWxRTVNTeWx5?=
 =?utf-8?B?V2F2dkNhSXY5bGc4T3JLYy9ILzRHd0ZSblh1aU5pRWt5OVo4bGVkUU5TcXJG?=
 =?utf-8?B?ZUpGNTNFQTBjTFJTZkFyZGp1MGlMRnNraDlwbjJiYVZ0UmJwV0lDYVVRT1U0?=
 =?utf-8?B?YzZmdldkOTNSdFp4aXRHeXBlblM2dnpsWFVDNWYyU1B0bjdhQ3hiVXVqeFh2?=
 =?utf-8?B?Z05nV0FFNm83ZGIxS0dPTUdodGRFb014Mm9RSEc1a0V6Wk5PY1dhVXUwaVV2?=
 =?utf-8?B?RzFjSG9IWTNaa2kzYXI3ajBBOWJzVmN6T2pxRDVxMjNsVGpKUnZCbk52ZE04?=
 =?utf-8?B?Mm5JWjVWWHFmUlA3alcxNUVwNnhkNmw3elNybUkzR2djSFlyR2pyR2xiQnVP?=
 =?utf-8?B?L0tpUnJjb01NOW9Ra3RrekYyWGdacXYxTzVsYjcvRndvWXM0ZEROelBlcVlp?=
 =?utf-8?B?NitnTTA2U3NzRktOMTB4a2F5TjByMDJmWTk1ZHUranBvSDZkeHhvcXBTZFlM?=
 =?utf-8?B?bDcvN2hXL3dkWWwwU3pGZmxacjZVYnpkUmNvRU9BOWtYd29YNVdaTUc5QU1s?=
 =?utf-8?B?bWlPWFB5RStSTjA0dGlGWHhXZWpNd0RwMDNxbkRGamFVeGNIeFNjY01pVHY3?=
 =?utf-8?B?Mi8rMGN4UUJTNFQ4dytYS2dlU2VreFhhY3FNVkc3SHlQdXQrdXVOY2VMQVVx?=
 =?utf-8?B?RnkrSkpjckIveUsweVBNbGg2S1NMMnpmTXhXekZRZE52b0pHQmR2bjBqbFZL?=
 =?utf-8?B?cHJDc3dSSXkrWlhZWTNGRWxYUUtXMlFub2NUR3RQNUp3THVKVmlZVUNxTHp6?=
 =?utf-8?B?dEVWVVFlNWNBT1AxNkI3Z2NLU2NjQ0FlakdUMWt5UlZBZ2VzcWsxSTRuZ1hy?=
 =?utf-8?B?QnpiemxQS3VMSmVQNGw0VXc4Ukd4bC9OdkQ4aktjQldmTmdNOHN5cjBESlNr?=
 =?utf-8?B?bGZtOUhvclUwVjRqTFdoQnV4NFUzYWJsbEVWaXBoVEowM2VCd1JOUW1RTXNp?=
 =?utf-8?B?TXBDOXZVeUJrT04wamVJUlhBZ2hzQ1JoN2RmTWkyLzVkQ0Ztc2FKRmt3SVZP?=
 =?utf-8?B?d2hxWjdRSm5GVjdkWDZVWXNBODQvZEVGMmxiYkRsdFE5bVBUQ0ljdWpJa2xW?=
 =?utf-8?B?ZnZzTld4TlZsK1FSWTl2RWU4YXlxMnBiRERPdlFhcS81VVp5ME1uN1ZvSnU0?=
 =?utf-8?B?R2Q1V1BOWWtYQUY4N292YXhwelViY0xkeE8wWU54U0JTZGZ1MWsrSXNrUThU?=
 =?utf-8?B?ZmUyZlFrRmYxRlNleFplemtVK29yRFBDZWF0Z243Wk5NQTUxMjFwWi9CMFBi?=
 =?utf-8?B?NkhsUlQ0Slp6TGZjSUZpZFJqZ3l3Mi91TmJOYU5GK2ZtQldQUlpFeVVyNUhT?=
 =?utf-8?Q?AVIxeKTN32MBfyFacbdbBySdSm0To4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFpWTElmMzlrOHJDSXpYTXhOVDZyRGVxVlNjQS9DcmcvYm5nNFJoSTJSOHQr?=
 =?utf-8?B?M3NUenkvSnlrendLOWxtdlZHMUU4YUMyVmN3U3FPdmlqaS9oNkFoL254a1pW?=
 =?utf-8?B?bmcreUJxblFVbU5Kb1J0VlRkUHd4VTl0UTZsN0FuMlBWeGI4ellxb2JNOU9V?=
 =?utf-8?B?VktqZDJKUGpZc1A5djdYSHcwOVAxUVFqUFVmR3c0Uk8rUFhqSERtbVg1bWNT?=
 =?utf-8?B?M2ZGclNRVFVmQzdhaCtGcFVsY2VPUG05MnhNSmswLzZ5REZqYytNemtheTRq?=
 =?utf-8?B?N2tRNE9kQmNSb0REWnR1VmREV0ovSjk4L0hZMjgxZmJ2M3luaDRac0lQS2xw?=
 =?utf-8?B?dG83dS9LSmhwSXl4QjhxNGN3RDY2ZHNNVHd0eEdubU9hSS9ySVZIVVNCTWNo?=
 =?utf-8?B?TjBWTFl6bElNSEtnYm0zeGtrUC9VWDMwZmRFbGJXMmg2RFA0cTl5SytyZWVL?=
 =?utf-8?B?TWNydlhrM2NsNFZNRHl0UERSZXh6L0VmS2pKa0VKbFV2c0JyZGtOc3hybG5P?=
 =?utf-8?B?aFR0cHJiR0NXOThDYkhFTUpvUEVCTjl1N2Myd1MraEhqRjR5NkJDQkJWL0R0?=
 =?utf-8?B?d1lkY0pGcmEvYXdzcDNDNzVZK1ErU0M5NGt5NnpZRDBvajNJQzFVWE5JVEc3?=
 =?utf-8?B?N0ROYnRRSE9sNVg5Vng0SWhjL245bkdPcjNJK2xKVExBdjNiMUpGakNCQlFi?=
 =?utf-8?B?YU44V3hvQTFqZkFVTUpaUG14QUhlbitCb3MvVTc4bjdJMzNuUTRjbmdrQ3F4?=
 =?utf-8?B?WEZZZGZYbEEzeDZuNkZlNnZPT2FmSnM5c2ZTWmFKays4dENUZ0trZk4waXdo?=
 =?utf-8?B?alFvV2RIcmh5UGpWL05PeEtuZENjdmlFelRUaE4xa2kxYmJQYnhIalRMdjI3?=
 =?utf-8?B?VG5Qalo4NUJCbzVJOHNuR3dIV1dyenN3OHhPSjV5VkxEUzdjV3hYY2RBYzlC?=
 =?utf-8?B?LzQ3ZUhwM0NLMUtDaUdmaFloMXM1djMxM2xPUHBjbEd0UitPVWt5dnpCT0dQ?=
 =?utf-8?B?R1FmSDNENnAwa1BwRFdGb0w5enJDR3ZrZWtzL0VSalY1TWk4akNCQk9GNjUz?=
 =?utf-8?B?aEhEdy9UNVBIMjdLRTJydnBjcjllQSs1SVVsT1JUUy9sWmMwZTk4UkxuYkx6?=
 =?utf-8?B?dTdtbXBIcnFTbUthNGovMkJIOERra0xlNG43TEFQL2N5TkpGQy9HcTdVbHVq?=
 =?utf-8?B?ZUkwT3VGekhYWUt4aUcxdXFQY1NKU2ZBMTdCVGFiMmFPdUhNeFdtdmpiWG8x?=
 =?utf-8?B?UG9haGtZSlBVaGh5aEg5R0x5dWpEOC96RkprOUlrN0xiYXcyTWZLUU85TjZB?=
 =?utf-8?B?bi85SmdzdEp6NHV5N1NWVjJyTnlBenJYc1ArNjNXQzVUcW5OaGZSZXNtMWVa?=
 =?utf-8?B?WUZpOVNlRXVWc0JHc0g1L1VnZnB0ME1NUkcwdkRRbCt3OXpUV2JmY0ZSbjE2?=
 =?utf-8?B?cE9uUXQ2NGl3d05DYit5UzJUZjYwenZpNnU4UXpuZlk4dkpOL2JEd2ZuSjQ0?=
 =?utf-8?B?TVJHdE5Cb0syNUNkWkNvVUp3MHo4QkFKdXQ1WTRxYmFhRXpUOXVmT1IzZkJZ?=
 =?utf-8?B?WmJ6c3ZVTXc4b2xiVmRkRDdjeHhCR0ZrMFFWcWVJNTkxNDcrU0ZSUDMzM29U?=
 =?utf-8?B?Z1VBQk1Vdi9hYTF0NHNKeTYyQzd4UG5NTzlVc2thWGlYT25vUGRVUGxjdWNl?=
 =?utf-8?B?RDVtOEJsSmxIYWNrYTlnYTR2NEtHUU4ycjdRdmp2MVBoMlpCdmtNTDdHcE55?=
 =?utf-8?B?NUhYUnRrd0t5NnhtUklwaUR2a1BsSUpLMVFWc2orclFYZ01TUWJEbklnM2Jm?=
 =?utf-8?B?akVNbC9DRnM2V3dEc3M1dlVSaU1TakFyR093UWxFckJSSVVCZCtpNjZUUVJi?=
 =?utf-8?B?aWFQbm1WRHlHRll5bnNqK084V1J2MDhlRGFDM1hKSjIySG96OWtwMHpjNTZu?=
 =?utf-8?B?NkNQWldNMGRYTmxnYmdDOGFhUElTY3hrcG0vdmhlOHRFQnhsZkVpVWVIZ3dn?=
 =?utf-8?B?eVpRY2xWL3NYNnFsTVV6dHlYdkZCS3pQZVVxc0dHQnZha2g5VG5WeEVDWUJo?=
 =?utf-8?B?bDkvR3hIUXdOMzBqNkxGS0JJdlRicnZHVE00QXJNellrdjY2aDV6Q1ZPbFZa?=
 =?utf-8?B?bjFla0FWV1JXbVBjekdiL2hlZWJ0TU9HQjJXQ2Q5bW9PUHRXV3BZVjVrSmRY?=
 =?utf-8?B?VzZ0QndDK21keS9PTzhxakVJWnNybTltMlBLWEdDYkgvZDIxWmN6SVN1VkZ5?=
 =?utf-8?B?YjFRVmpWK05lOFBFVytXQW4yL3J2ZVk0aDM5ZE50WDVFV3JsQVJwNHFPZ3hl?=
 =?utf-8?B?cERKYitCdlpabFdqbkhtL0JDaWx3RElxbXpnenV1R0dmUFpuS3NLZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6bd460c-3fb4-4d70-1225-08de529b8521
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:01:44.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28VfumsKj73lQvsjAs1q5sQzxGEDuq8sUKQ+fpsH+CcRE+MdHSlvuJ9wHxG1KdLf37ezl6EzHfEprLkfDyGx+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8772


On 04/12/2025 21:27, Diogo Ivo wrote:
> The USB2 PHY mode handling on Tegra210 incorrectly relied on
> regulator_is_enabled() when determining whether the VBUS supply should
> be disabled during role changes. This is because regulator_is_enabled()
> reports exactly what is states and not if there is an unbalanced number
> of calls between regulator_enable() and regulator_disable(). For
> example, regulator_is_enabled() always reports true on a fixed-regulator
> with no enable gpio, which is the case on the Pixel C.
> 
> This then leads to the PHY driver wrongfully calling regulator_disable()
> when transitioning from USB_ROLE_DEVICE to USB_ROLE_NONE since the driver
> did not previously call the corresponding regulator_enable().
> 
> Fix this by keeping track of the current role and updating the logic to
> disable the regulator only when the previous role was USB_ROLE_HOST.
> 
> While at it fix a small typo in a comment.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   drivers/phy/tegra/xusb-tegra210.c | 5 +++--
>   drivers/phy/tegra/xusb.h          | 1 +
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
> index 3409924498e9..63ad57d95514 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -1934,9 +1934,9 @@ static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
>   			/*
>   			 * When port is peripheral only or role transitions to
>   			 * USB_ROLE_NONE from USB_ROLE_DEVICE, regulator is not
> -			 * be enabled.
> +			 * enabled.
>   			 */
> -			if (regulator_is_enabled(port->supply))
> +			if (port->role == USB_ROLE_HOST)
>   				regulator_disable(port->supply);
>   
>   			tegra210_xusb_padctl_id_override(padctl, false);
> @@ -1944,6 +1944,7 @@ static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
>   		}
>   	}
>   
> +	port->role = submode;
>   	mutex_unlock(&padctl->lock);
>   
>   	return err;
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index d2b5f9565132..273af147dfd3 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -317,6 +317,7 @@ struct tegra_xusb_usb2_port {
>   	enum usb_dr_mode mode;
>   	bool internal;
>   	int usb3_port_fake;
> +	enum usb_role role;
>   };


A similar fix was made to the Tegra186 code by commit cefc1caee9dd 
("phy: tegra: xusb: Fix unbalanced regulator disable in UTMI PHY mode"). 
Although the above looks simpler, I am wondering if we should make a 
similar change to the Tegra210 code so that they both are implemented in 
the same way?

Jon
-- 
nvpublic

