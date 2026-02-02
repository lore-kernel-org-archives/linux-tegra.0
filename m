Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F32126059D;
	Mon,  2 Feb 2026 04:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770005279; cv=fail; b=YNVp/CDKB51oSF1uxpto8oqg3qnabcfCTTbw5u8jK6XyDoKolJ5645dl7rntcFZ6jYH6YWgVAS0WgowBGqa5jCaUkRhZDIk/sPxn2/eFKUkbpexeweyTqZC/WL2g1Zb96ljz9cQ5ZJsa6WT7nCpHTDb0jwdcYtm/PNVf8uW6VOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770005279; c=relaxed/simple;
	bh=WeZg9Zg0LrGIq5VRToB1qV+QykvJs1spdCIu4B8uHpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hLzkL7rGoJYbyy/m/T4tTnawQmiAv4tATve8W7wSl6k7SoSsviXxGIBwYAWcr88C0NMmmGyFbBDWXIPmtvW21erusOad07NKoe1IRQvrMKFkU/UHqMMIb+XRH40G0CQcrZoL0kDCGG/qWMfoqws+7iWuaxdUKAXHSFOrJSFottE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G0p1Wca2; arc=fail smtp.client-ip=40.107.208.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G0p1Wca2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh+dqSZBfYC26Bai/mng3dkVuNcBSHnT48laiVWDl+/GgSn4P7wXJ8lOYXHtJkBK6tlfJB7qa6N9xLhzIGbQSHnT6qFdXdidq9ok8ocqcD4gbVAwfhp2Wp5VExTFWCmucYhBBSAlN3+tXFQTq2UIER6NDjkm9gxaRDWLvYM9GJGkUdW6F3XpOqnjVNiu3fayRK0M8YN1J9TxVT/GSlndKVZzFf7ZqpVzrzBJpO9NuSdbfsq9c14QH3eMQ0k9YOuE7gLmefIM38Vloh2GPSEzmomES2ULnmIwX3XSsndakvPU07WNO7OiYL63mQgMQfhf5PHuTdwanfo98ys87LQ/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCmgeb8vTDrvTEqp2bUZEkOj4/medLVtwAzulr/CdHQ=;
 b=reaC1wTgRlY6FQG+5XhuKjv9p/qu1+rANvV11rSfCrVCmtRKBDT8gTnRoZbJrTx1cOnNtsHw3oT+hIN6Fq8H2Mh3A5xR93Vzg+Qpm/czaJlzKKdhVePPYHky+zNvVj1ILuQtOMmk8gU1mC0ySaT/7UN0yl4PXxhHPzDQm0K89zZJtl954k7oMiPw+buprZ6i+zPvO2LLMvblLnZaEhmzIHi9QV+J2BvExSlaFXOBm7e0FRBjTTxe8Zbx898DQlaB7l+zClgIhSjMjVVMikGBIHcdy3FLEc+mQWjoF9iICKKcgIy6jMVwChcdVqgm2QNFuNv/rpvhRyHd79Ft6f1Gqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCmgeb8vTDrvTEqp2bUZEkOj4/medLVtwAzulr/CdHQ=;
 b=G0p1Wca2xROJ7oS6dbu4jCInxVWGPKJoGzmu26zRVEXWEM/Ckjk3dtZl8OYJQuUY4EMcQtx8BizvBwhilBY0bMFCUDP6DH4QinFoqY4uApyuG5w2IqDxuztqWdK8PcB4sRn3Qa1tpb+13U5mWYrWu0/kSgXc/3WKBurM3cNcQc4ECS4LXxFPeR/t9F51wW6TFn/glr8y8ZfJeoI2NG+wuWC+UouWyb0gR1O2lcVxoD4x2mS6xlFrTx1S5bMa+vmjMlFDWO+r7JPUAb/ZnykNYHoZSomjh7DdsySdlThvHksgwGXk/4B9dkUZa7qXVkNoRAYznnLlzpTfvWXBUVwJMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by IA0PR12MB8974.namprd12.prod.outlook.com (2603:10b6:208:488::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 04:07:53 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9564.007; Mon, 2 Feb 2026
 04:07:53 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: phy: tegra: add HSIC support
Date: Mon, 02 Feb 2026 13:07:49 +0900
Message-ID: <3677292.iIbC2pHGDl@senjougahara>
In-Reply-To: <20260122151125.7367-3-clamor95@gmail.com>
References:
 <20260122151125.7367-1-clamor95@gmail.com>
 <20260122151125.7367-3-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::20) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|IA0PR12MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e100de3-4442-4396-2903-08de6210a33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1ZCakpMZ2xvOXBwL1ZZTHRIOE1rWVF5eVlvN3FzRVMwdmdIVDBqS0dvcFpY?=
 =?utf-8?B?QVArQjZEa3I1ZGYwNzZtcTIreEs3cmlaSlhZMTUrbEtXUXJmME1MN1JxZEZ0?=
 =?utf-8?B?bFJxWW9OeWg1SUdSSGIrMy9wLyt6UzVTMmpselAxSFN3aDVPMWNqOUJHN0M1?=
 =?utf-8?B?Vm1jU3FyUlV5eDg1KytVeVM0c28zSVpXNk5WeXdHVEd0bVdpMHAyaGtZK1NK?=
 =?utf-8?B?YVJOSzBEN08yQ0w2SXJuZjZBUTl3Mlh3aDVXVlBxVjNsWi9hM2lzTE5qR3pJ?=
 =?utf-8?B?eTZHa0hsMGV5akdkRytORUkrQXB1K2ZBUWREMXh2OW5hMFFENkoxK1pQd3N5?=
 =?utf-8?B?RTZJaFFzUHBzRVIyYWxjR2pVQVBqa3BUdE43NGk0VUZjalB4QnZscVFLSHRl?=
 =?utf-8?B?L0Jac0p4allyMk1BUFllc0g4OG44SmV0ZXI3MXcwMDhVa0sxSW9OcTZxVWJD?=
 =?utf-8?B?MmZNV2ZFUmZIVmt3VDZTKzhIRG1WbDV6RFZ4cUdEMHFsdFhMRkdtYkplenNz?=
 =?utf-8?B?QU5FZzlsanFtWmpjc2VPQ01ObGw1dWpCdkFUUnNJakM1V2czS1ZkelV6dU92?=
 =?utf-8?B?N0FpNEwxOUhNR0hpZGRSY1h3dFRPbldsTGZtUjdOWWJET04ydkU0MEhOejBN?=
 =?utf-8?B?akMwemtqaUVzSHRaT0JEZXlhQUcxZCtWeG14eVB2cUlLbkpIMk9IYzR6a0Jn?=
 =?utf-8?B?bzd6aWpPWFkrMmZGdlRxRVdOYTBzaE5xQjcvUWQ3Sy9Jb25oWHRmb1VYeUZo?=
 =?utf-8?B?YVlFR2RPcjMzQ2E5ZXNZMy9VT1oweVBiZmR1Znh0THlDVU5sRXpEZXNGdHZW?=
 =?utf-8?B?bDc4TzVWd3JOMG0vRG9lWURUNzh1MUxaYlNIR2hvK3ViRjJCUkVYaDZZOE1o?=
 =?utf-8?B?MkZlYXBSd2FuZWU3KzI5djFsT01VTklWZ3VJMDcrODdNUGw5MGNJK2ZnVDZz?=
 =?utf-8?B?RFpiT2t5SnhiWlZnOEc4aDJTbmdkaldtTFNnYk1LQ2FBd1ovWFV3UmRvbW9W?=
 =?utf-8?B?bVZEUkt5T01VYm9jb2xRb0RrS3hoRWZmNTR0TDlZSkd2eTlCd0UzckRKYnEy?=
 =?utf-8?B?M3lhT0IzbDN3SW5sOXU3VzdzSVZvQmZDdS8yM3FPWjcvSHFQL3JWVWxqN2N5?=
 =?utf-8?B?d0tDVytyNFhHU3ZyWlB0WkRzRG9YQ3BZMGNDSXh2ay9aSWcwNXlDV0lOaUR2?=
 =?utf-8?B?L0tyMVQxRUpvMnNjOFhqeVU0U1RBbjJ2WEVqU0pWMVVWWFhCUHVnYnB1N0Mz?=
 =?utf-8?B?T0NmMkRlMWNXUkhXN1ZZQk1lUXpyQzc5eUM5cGxiQ3diYzIzQmduNEtIMkt1?=
 =?utf-8?B?dHYrRFNyL0ZxMmtyazZPT0toMHNPbDc4VnJIejBHZGg3QWhOWXVGQWt6Z0hh?=
 =?utf-8?B?Wnp3Q2JyVTBZZkpWd21ycnVhSm9WM3drWEtKNE5sVVZKSlpqbzZ5YjBTdS81?=
 =?utf-8?B?TVpJUi9mWVlOVlVMWnZjZzlhZVZiNTFEcXNONjgwS3RtQmlOOGUreGdIZDdN?=
 =?utf-8?B?M3Q1T3VzOE9TYXlLTEx2aTRDNkFmVUptZnZEZXluZVFNUFloNENJU0xRV2ZY?=
 =?utf-8?B?UjU1M3FEMkZHaWduRGRFcXU5bHFSSEFTNTJ2aWJWNlQzTnZuVXVhdmhJeENY?=
 =?utf-8?B?U1NqTjNzWkErMWs4VFNOQmdRQW1FSGtCZTl6QUp4dHAxM3EwWkJraHRjZXRx?=
 =?utf-8?B?bWhFTFQzOWtQaE43QjZkeVdpWFZ3UmZ1SE0rVGlqK0EyTW1WbVl4alJPc2Nu?=
 =?utf-8?B?dHVCT0IzOFdIRkM1b2tTN3U2cXZicXZsSWxKWjg5SndGSjkrc0NhM0lNK3V6?=
 =?utf-8?B?YU9wWTJXYmVsZGY5cm1laFZLTkphdXV4OUk0ME0wMXdTYUdhc2c5SFNTV1do?=
 =?utf-8?B?VThHc2pWaGtlQUorRkF4aFg0andBbmhnM08zcUFBY0NEOThpaDNQbWxaMGQy?=
 =?utf-8?B?T0Vibi9FdzAwUE4wMTZWUDBrYlF1WXJ0TjB6aGF1dWg4V2s3RzVCaGI0MXdK?=
 =?utf-8?B?dG0xQTYxdEgrSmYwL0JTRm5NMGhMaXFhZE1nOS9MYTd5RngvSnVnbXhCcXRy?=
 =?utf-8?B?Sm1Ldkp0eTRhMWk2MDVwNjdwN1UrNkFKUHZFRzZOU0tzTzR6UXJHQ25kZkpZ?=
 =?utf-8?Q?Qp6s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXZFUjlpRi9tWWs3cW90ZjRWQzlHN0VjamcycWlnLzQ5Tlo5ZGl5eDdUc09n?=
 =?utf-8?B?UTFZUlhKNC9yUXRia3NxNW53anZSOXorT0dTYkxHVXZJckM1UTR6VXh1NUdl?=
 =?utf-8?B?LzZOeFNDMUtOd1hpdUdkRDR3cVYybGowZXpsNjZPRE5BYVQrWnQ4ZkdPSTZZ?=
 =?utf-8?B?Vlhsd2lsdzF1WkUzbEN6dWNRTXF0V3BOeERheVJsYXpycXZuaGhkQkNBaFR1?=
 =?utf-8?B?YkVyQUx0eWg3RlI2L2xxckZseGgzV2xCTGF1WldqdnBISWRSZy9SZTdhYk5Z?=
 =?utf-8?B?Z3dHaERNdXJKMEYwejZyZi9QTExZN1B5Vy83eEtSRXB0Q1VlSkNjOXFNSzFY?=
 =?utf-8?B?OWxPRjJkUmdYMHM3aFRUcmNDNjIyZGwvdzEvOWcwbzViNlFzTGt0VHQ0RWpy?=
 =?utf-8?B?aXNJS2EzUy8rRnlVQzB5Zlh6aUN4UE0wTUoyei9ZT3VReVNtWFdabFdMQWUw?=
 =?utf-8?B?ZGlBcWkyeGIvc2Uxanpvc1gxZjhqK0w2MEFFdm9iQlZsMFJRL2lCQlVRb3Uw?=
 =?utf-8?B?eERMdy9EUVdidkxKYmdwRWFDSnQ2cVlHdGQ2VDlkLytWTUowa3N0dXhMcmQr?=
 =?utf-8?B?UkJHdEczOWdOVy9GVHdSRUlNd1YvRURmMnp5VXEycllrUERCQTE5NVhyOWV3?=
 =?utf-8?B?NFBTZU55dXlDQUxHWGtwWHFBam16bGo3TkZqK2RSY2oxVjNkcEJOQ3dRMDBu?=
 =?utf-8?B?MVRUNDN6MXI1TWlid1owM3RvTE9MMDBIaXFEK05xdEdvRkJXNFhJQ0VrVHVF?=
 =?utf-8?B?WWRTNUR2NHFYMkJYNzFlSU4wZmF1ekx2OWphL2dRcDJyVk1wbjB2NUVoaSth?=
 =?utf-8?B?WVhoQ0t0eXRGakpoYktUSnhlQXFpSXI1dStuSzhqc3JOYkdEN2hRVjFmVXZi?=
 =?utf-8?B?cUtrQXB5dktvSlJncDZ5YzdBSDVkU0tGQjRWaU5BS0lWZ0NsVThMUCs5SUNI?=
 =?utf-8?B?WU8yM2ZrSkJKUWVyWDU3VTFOaVhjai9uUTAxOGxCcHFrTW83NTRQRm00OGRQ?=
 =?utf-8?B?bEhFUzNuYmx2SWI3bnMyTHZhM3hvQ3RlN2xJSG1paE9BeC9yYW44YUhjOEhS?=
 =?utf-8?B?ZjF4VkUyQTZRZ3R6bVBLTFZ5OW00dFpXM1VCbXNyNVlKN2xFSklFQkhCUW1X?=
 =?utf-8?B?eEZrTTQrOXZHVDBFcnVHdVRuODJyd25UYXlhdEw0Z1FJcytlS0loYjBNcU4y?=
 =?utf-8?B?SVk2dlNOQktwaDdWcHBLdUFJWlFrOTBvUFlWK1h0Z081aEo5T2g3TVhMNktk?=
 =?utf-8?B?MUNjVlZLc3VVeGQ2SGh6WjY3clBuUVhuQmRicjEzb1JDMHNJSmkvaGRnUGhz?=
 =?utf-8?B?MzdEQTAwUnk2NS9vblQ2NkMxNW0yQUJxSzNwbTFtaU5obUlsYlhxa1Y3UVh4?=
 =?utf-8?B?Z0x5bVVncjIvVS9ubG1laUtiaXVBZEZ0K1d5UGtuL2ZUL0dMUG5FMFdRTHlv?=
 =?utf-8?B?MkZJSi8xSXdUWHh1bDI1d3JuZGxxMklIVjBwUjlvc0EzdWt4ZG1SaGVuNmQ5?=
 =?utf-8?B?Q2FrRUcvUW9EU3RCaVFJeHlRL2pwZ3orYzY5ckdXWGF4cjQvUzFkWldHbmEy?=
 =?utf-8?B?UlB5Vy9IRGJObWsxeDl1U2Exa3VkY3NLd0JRWVVXdDMza3k5Y2ZnbnVqdFVy?=
 =?utf-8?B?cUM0NDhyTG9qUUZacXR2cXNqdU1wL1dDdEVOcUxWRTliZWdkZlJrR2xiQm1G?=
 =?utf-8?B?N3FseTFlNVVKTW1JS3A0MkVNYTljaEN6TzZZMitBTmdReURwN3J1S2hrbytV?=
 =?utf-8?B?WTY0blZYU3h1ZXZSbzVMWDhWeGhEQjBmTE5FSDBUQXBueitSeWlsYWVCNVov?=
 =?utf-8?B?a3pDbnI4aFpvMzA2VGhWYlNVbVJnYnNaK0ZhYXUxWGNpTEwrcjUxdDk5ZmN5?=
 =?utf-8?B?eVNHTmpWU0kxTy9EQnhGYnZrVFhCS1lrc0VPeTU4emFiSkphaTk5d2hnbmxV?=
 =?utf-8?B?OXZicHZvZjdqWVllRjZieGNiWDJvWDVBV0kweU0vNlBBWG9pcnM3aXdEU0du?=
 =?utf-8?B?YmxMeERBWEs4N3JKNTk5UWhiNlQvMzR5L1JFNHdJRlJRMG9JWEFwVmpaSkdZ?=
 =?utf-8?B?UGQzN0VnbXZmTXhQRW0ya0ZQWG5qdDVwRjJlUHZ3Z1o3TEVZclliQmExN2Z0?=
 =?utf-8?B?aFdISElzWC9QZE1ybnN1YjgwMmhDVCtTUWNpeGxqRzJSQ2tOMFd6M1JGTUNv?=
 =?utf-8?B?TGJtUGpDTERibGdsNVc4Q1pwajBOdTVxSEsyLzFvblYzR0hEWGtUWm1JZ0s3?=
 =?utf-8?B?M05FVnRSY1VwUCs5ejN3OVhUdXpkVURselVFM2RoWEtpeVB1cGJVUUxsTEZY?=
 =?utf-8?B?TWlJdkZWaXhuK0x6WmxHWUpZUTBpckEzUFMrS2dMaUZoNXFlRmdseE85Rkpy?=
 =?utf-8?Q?2N8Cv0RxkM5FOvVSS8IALt7/q5FQIoHOmsC2zkVhVyS8i?=
X-MS-Exchange-AntiSpam-MessageData-1: mHU64OwhEHf+rA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e100de3-4442-4396-2903-08de6210a33b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 04:07:53.2756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XamKSjwdNI5Lnff4KX40KtxOZUM/aglZdYlfGdE4DF3nBRYtzLeRGZ8+H+uulyLze9kvx/qIleqV6EmL3Xing==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8974

On Friday, January 23, 2026 12:11=E2=80=AFAM Svyatoslav Ryhel wrote:
> Add support for HSIC USB mode, which can be set for second USB controller
> and PHY on Tegra SoC along with already supported UTMI or ULPI.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c   | 249 ++++++++++++++++++++++++++++--
>  include/linux/usb/tegra_usb_phy.h |   5 +
>  2 files changed, 243 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-=
usb.c
> index afa5b5535f92..4f0fde33647e 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -29,17 +29,26 @@
>  #include <linux/usb/tegra_usb_phy.h>
>  #include <linux/usb/ulpi.h>
> =20
> +#define USB_TXFILLTUNING			0x154
> +#define USB_FIFO_TXFILL_THRES(x)		(((x) & 0x1f) << 16)
> +#define USB_FIFO_TXFILL_MASK			0x1f0000
> +
>  #define ULPI_VIEWPORT				0x170
> =20
>  /* PORTSC PTS/PHCD bits, Tegra20 only */
>  #define TEGRA_USB_PORTSC1			0x184
> -#define TEGRA_USB_PORTSC1_PTS(x)		(((x) & 0x3) << 30)
> -#define TEGRA_USB_PORTSC1_PHCD			BIT(23)
> +#define   TEGRA_USB_PORTSC1_PTS(x)		(((x) & 0x3) << 30)
> +#define   TEGRA_USB_PORTSC1_PHCD		BIT(23)
> +#define   TEGRA_USB_PORTSC1_WKOC		BIT(22)
> +#define   TEGRA_USB_PORTSC1_WKDS		BIT(21)
> +#define   TEGRA_USB_PORTSC1_WKCN		BIT(20)
> =20
>  /* HOSTPC1 PTS/PHCD bits, Tegra30 and above */
> +#define TEGRA30_USB_PORTSC1			0x174
>  #define TEGRA_USB_HOSTPC1_DEVLC			0x1b4
> -#define TEGRA_USB_HOSTPC1_DEVLC_PTS(x)		(((x) & 0x7) << 29)
> -#define TEGRA_USB_HOSTPC1_DEVLC_PHCD		BIT(22)
> +#define   TEGRA_USB_HOSTPC1_DEVLC_PTS(x)	(((x) & 0x7) << 29)
> +#define   TEGRA_USB_HOSTPC1_DEVLC_PHCD		BIT(22)
> +#define   TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC	BIT(2)

PTS is an enumeration, not a bitfield, so I would say '4' instead of 'BIT(2=
)'

> =20
>  /* Bits of PORTSC1, which will get cleared by writing 1 into them */
>  #define TEGRA_PORTSC1_RWC_BITS	(PORT_CSC | PORT_PEC | PORT_OCC)
> @@ -51,11 +60,12 @@
>  #define   USB_SUSP_CLR				BIT(5)
>  #define   USB_PHY_CLK_VALID			BIT(7)
>  #define   UTMIP_RESET				BIT(11)
> -#define   UHSIC_RESET				BIT(11)
>  #define   UTMIP_PHY_ENABLE			BIT(12)
>  #define   ULPI_PHY_ENABLE			BIT(13)
>  #define   USB_SUSP_SET				BIT(14)
> +#define   UHSIC_RESET				BIT(14)
>  #define   USB_WAKEUP_DEBOUNCE_COUNT(x)		(((x) & 0x7) << 16)
> +#define   UHSIC_PHY_ENABLE			BIT(19)
> =20
>  #define USB_PHY_VBUS_SENSORS			0x404
>  #define   B_SESS_VLD_WAKEUP_EN			BIT(14)
> @@ -156,6 +166,58 @@
>  #define UTMIP_BIAS_CFG1				0x83c
>  #define   UTMIP_BIAS_PDTRK_COUNT(x)		(((x) & 0x1f) << 3)
> =20
> +/*
> + * Tegra20 has no UTMIP registers on PHY2 and UHSIC registers start from=
 0x800
> + * just where UTMIP registers should have been. This is the case only wi=
th Tegra20
> + * Tegra30+ have UTMIP registers at 0x800 and UHSIC registers shifter by=
 0x400

'shift', or 'are shifted'

> + * to 0xc00, but register layout is preserved.
> + */
> +#define UHSIC_PLL_CFG1				0x804
> +#define   UHSIC_XTAL_FREQ_COUNT(x)		(((x) & 0xfff) << 0)
> +#define   UHSIC_PLLU_ENABLE_DLY_COUNT(x)	(((x) & 0x1f) << 14)
> +
> +#define UHSIC_HSRX_CFG0				0x808
> +#define   UHSIC_ELASTIC_UNDERRUN_LIMIT(x)	(((x) & 0x1f) << 2)
> +#define   UHSIC_ELASTIC_OVERRUN_LIMIT(x)	(((x) & 0x1f) << 8)
> +#define   UHSIC_IDLE_WAIT(x)			(((x) & 0x1f) << 13)
> +
> +#define UHSIC_HSRX_CFG1				0x80c
> +#define   UHSIC_HS_SYNC_START_DLY(x)		(((x) & 0x1f) << 1)
> +
> +#define UHSIC_TX_CFG0				0x810
> +#define   UHSIC_HS_READY_WAIT_FOR_VALID		BIT(9)
> +
> +#define UHSIC_MISC_CFG0				0x814
> +#define   UHSIC_SUSPEND_EXIT_ON_EDGE		BIT(7)
> +#define   UHSIC_DETECT_SHORT_CONNECT		BIT(8)
> +#define   UHSIC_FORCE_XCVR_MODE			BIT(15)
> +#define   UHSIC_DISABLE_BUSRESET		BIT(20)
> +
> +#define UHSIC_MISC_CFG1				0x818
> +#define   UHSIC_PLLU_STABLE_COUNT(x)		(((x) & 0xfff) << 2)
> +
> +#define UHSIC_PADS_CFG0				0x81c
> +#define   UHSIC_TX_RTUNEN			0xf000
> +#define   UHSIC_TX_RTUNE(x)			(((x) & 0xf) << 12)
> +
> +#define UHSIC_PADS_CFG1				0x820
> +#define   UHSIC_PD_BG				BIT(2)
> +#define   UHSIC_PD_TX				BIT(3)
> +#define   UHSIC_PD_TRK				BIT(4)
> +#define   UHSIC_PD_RX				BIT(5)
> +#define   UHSIC_PD_ZI				BIT(6)
> +#define   UHSIC_RX_SEL				BIT(7)
> +#define   UHSIC_RPD_DATA			BIT(9)
> +#define   UHSIC_RPD_STROBE			BIT(10)
> +#define   UHSIC_RPU_DATA			BIT(11)
> +#define   UHSIC_RPU_STROBE			BIT(12)
> +
> +#define UHSIC_CMD_CFG0				0x824
> +#define   UHSIC_PRETEND_CONNECT_DETECT		BIT(5)
> +
> +#define UHSIC_STAT_CFG0				0x828
> +#define   UHSIC_CONNECT_DETECT			BIT(0)
> +
>  /* For Tegra30 and above only, the address is different in Tegra20 */
>  #define USB_USBMODE				0x1f8
>  #define   USB_USBMODE_MASK			(3 << 0)
> @@ -174,7 +236,8 @@ struct tegra_xtal_freq {
>  	u8 enable_delay;
>  	u8 stable_count;
>  	u8 active_delay;
> -	u8 xtal_freq_count;
> +	u8 utmi_xtal_freq_count;
> +	u16 hsic_xtal_freq_count;
>  	u16 debounce;
>  };
> =20
> @@ -184,7 +247,8 @@ static const struct tegra_xtal_freq tegra_freq_table[=
] =3D {
>  		.enable_delay =3D 0x02,
>  		.stable_count =3D 0x2F,
>  		.active_delay =3D 0x04,
> -		.xtal_freq_count =3D 0x76,
> +		.utmi_xtal_freq_count =3D 0x76,
> +		.hsic_xtal_freq_count =3D 0x1CA,
>  		.debounce =3D 0x7530,
>  	},
>  	{
> @@ -192,7 +256,8 @@ static const struct tegra_xtal_freq tegra_freq_table[=
] =3D {
>  		.enable_delay =3D 0x02,
>  		.stable_count =3D 0x33,
>  		.active_delay =3D 0x05,
> -		.xtal_freq_count =3D 0x7F,
> +		.utmi_xtal_freq_count =3D 0x7F,
> +		.hsic_xtal_freq_count =3D 0x1F0,
>  		.debounce =3D 0x7EF4,
>  	},
>  	{
> @@ -200,7 +265,8 @@ static const struct tegra_xtal_freq tegra_freq_table[=
] =3D {
>  		.enable_delay =3D 0x03,
>  		.stable_count =3D 0x4B,
>  		.active_delay =3D 0x06,
> -		.xtal_freq_count =3D 0xBB,
> +		.utmi_xtal_freq_count =3D 0xBB,
> +		.hsic_xtal_freq_count =3D 0x2DD,
>  		.debounce =3D 0xBB80,
>  	},
>  	{
> @@ -208,7 +274,8 @@ static const struct tegra_xtal_freq tegra_freq_table[=
] =3D {
>  		.enable_delay =3D 0x04,
>  		.stable_count =3D 0x66,
>  		.active_delay =3D 0x09,
> -		.xtal_freq_count =3D 0xFE,
> +		.utmi_xtal_freq_count =3D 0xFE,
> +		.hsic_xtal_freq_count =3D 0x3E0,
>  		.debounce =3D 0xFDE8,
>  	},
>  };
> @@ -541,7 +608,7 @@ static int utmi_phy_power_on(struct tegra_usb_phy *ph=
y)
>  		val =3D readl_relaxed(base + UTMIP_PLL_CFG1);
>  		val &=3D ~(UTMIP_XTAL_FREQ_COUNT(~0) |
>  			UTMIP_PLLU_ENABLE_DLY_COUNT(~0));
> -		val |=3D UTMIP_XTAL_FREQ_COUNT(phy->freq->xtal_freq_count) |
> +		val |=3D UTMIP_XTAL_FREQ_COUNT(phy->freq->utmi_xtal_freq_count) |
>  			UTMIP_PLLU_ENABLE_DLY_COUNT(phy->freq->enable_delay);
>  		writel_relaxed(val, base + UTMIP_PLL_CFG1);
>  	}
> @@ -812,6 +879,153 @@ static int ulpi_phy_power_off(struct tegra_usb_phy =
*phy)
>  	return 0;
>  }
> =20
> +static u32 tegra_hsic_readl(struct tegra_usb_phy *phy, u32 reg)
> +{
> +	void __iomem *base =3D phy->regs;
> +	u32 shift =3D phy->soc_config->uhsic_registers_shift;
> +
> +	return readl_relaxed(base + shift + reg);
> +}
> +
> +static void tegra_hsic_writel(struct tegra_usb_phy *phy, u32 reg, u32 va=
lue)
> +{
> +	void __iomem *base =3D phy->regs;
> +	u32 shift =3D phy->soc_config->uhsic_registers_shift;
> +
> +	writel_relaxed(value, base + shift + reg);
> +}
> +
> +static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
> +{
> +	struct tegra_utmip_config *config =3D phy->config;
> +	void __iomem *base =3D phy->regs;
> +	u32 val;
> +
> +	val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
> +	val &=3D ~(UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD_RX |
> +		 UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
> +	val |=3D UHSIC_RX_SEL;

L4T r16 (Tegra30) keeps UHSIC_PD_TX set until after UHSIC_RESET has been cl=
eared. Commit message says this avoids a signal glitch.

> +	tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
> +
> +	udelay(2);
> +
> +	val =3D readl_relaxed(base + USB_SUSP_CTRL);
> +	val |=3D UHSIC_RESET;
> +	writel_relaxed(val, base + USB_SUSP_CTRL);
> +
> +	udelay(30);
> +
> +	val =3D readl_relaxed(base + USB_SUSP_CTRL);
> +	val |=3D UHSIC_PHY_ENABLE;
> +	writel_relaxed(val, base + USB_SUSP_CTRL);
> +
> +	val =3D tegra_hsic_readl(phy, UHSIC_HSRX_CFG0);
> +	val &=3D ~(UHSIC_IDLE_WAIT(~0) |
> +		 UHSIC_ELASTIC_UNDERRUN_LIMIT(~0) |
> +		 UHSIC_ELASTIC_OVERRUN_LIMIT(~0));
> +	val |=3D UHSIC_IDLE_WAIT(config->idle_wait_delay) |
> +		UHSIC_ELASTIC_UNDERRUN_LIMIT(config->elastic_limit) |
> +		UHSIC_ELASTIC_OVERRUN_LIMIT(config->elastic_limit);
> +	tegra_hsic_writel(phy, UHSIC_HSRX_CFG0, val);
> +
> +	val =3D tegra_hsic_readl(phy, UHSIC_HSRX_CFG1);
> +	val &=3D ~UHSIC_HS_SYNC_START_DLY(~0);
> +	val |=3D UHSIC_HS_SYNC_START_DLY(config->hssync_start_delay);
> +	tegra_hsic_writel(phy, UHSIC_HSRX_CFG1, val);
> +

L4T r16 (Tegra30) clears UHSIC_TX_CFG0.UHSIC_HS_READY_WAIT_FOR_VALID here. =
According to commit message this fixes an intermittent failure to connect t=
o HSIC modem. It also sets UHSIC_MISC_CFG0.UHSIC_DISABLE_BUSRESET  below du=
e to same issue.

> +	val =3D tegra_hsic_readl(phy, UHSIC_MISC_CFG0);
> +	val |=3D UHSIC_SUSPEND_EXIT_ON_EDGE;
> +	tegra_hsic_writel(phy, UHSIC_MISC_CFG0, val);
> +
> +	val =3D tegra_hsic_readl(phy, UHSIC_MISC_CFG1);
> +	val &=3D ~UHSIC_PLLU_STABLE_COUNT(~0);
> +	val |=3D UHSIC_PLLU_STABLE_COUNT(phy->freq->stable_count);
> +	tegra_hsic_writel(phy, UHSIC_MISC_CFG1, val);
> +
> +	val =3D tegra_hsic_readl(phy, UHSIC_PLL_CFG1);
> +	val &=3D ~(UHSIC_XTAL_FREQ_COUNT(~0) |
> +		UHSIC_PLLU_ENABLE_DLY_COUNT(~0));
> +	val |=3D UHSIC_XTAL_FREQ_COUNT(phy->freq->hsic_xtal_freq_count) |
> +		UHSIC_PLLU_ENABLE_DLY_COUNT(phy->freq->enable_delay);
> +	tegra_hsic_writel(phy, UHSIC_PLL_CFG1, val);
> +
> +	val =3D readl_relaxed(base + USB_SUSP_CTRL);
> +	val &=3D ~UHSIC_RESET;
> +	writel_relaxed(val, base + USB_SUSP_CTRL);
> +
> +	udelay(2);
> +
> +	if (phy->soc_config->requires_usbmode_setup) {
> +		val =3D readl_relaxed(base + USB_USBMODE);
> +		val &=3D ~USB_USBMODE_MASK;
> +		if (phy->mode =3D=3D USB_DR_MODE_HOST)
> +			val |=3D USB_USBMODE_HOST;
> +		else
> +			val |=3D USB_USBMODE_DEVICE;
> +		writel_relaxed(val, base + USB_USBMODE);
> +	}
> +
> +	if (phy->soc_config->has_hostpc)
> +		set_pts(phy, TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC);
> +	else
> +		set_pts(phy, 0);

This (and below) are abusing has_hostpc to detect Tegra30 vs Tegra20. We sh=
ould instead add soc_config fields hsic_pts_value and portsc1_offset.

> +
> +	val =3D readl_relaxed(base + USB_TXFILLTUNING);
> +	if ((val & USB_FIFO_TXFILL_MASK) !=3D USB_FIFO_TXFILL_THRES(0x10)) {
> +		val =3D USB_FIFO_TXFILL_THRES(0x10);
> +		writel_relaxed(val, base + USB_TXFILLTUNING);
> +	}
> +
> +	if (phy->soc_config->has_hostpc) {
> +		val =3D readl_relaxed(base + TEGRA30_USB_PORTSC1);
> +		val &=3D ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKDS |
> +			 TEGRA_USB_PORTSC1_WKCN);
> +		writel_relaxed(val, base + TEGRA30_USB_PORTSC1);
> +	} else {
> +		val =3D readl_relaxed(base + TEGRA_USB_PORTSC1);
> +		val &=3D ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKDS |
> +			 TEGRA_USB_PORTSC1_WKCN);
> +		writel_relaxed(val, base + TEGRA_USB_PORTSC1);
> +	}
> +
> +	val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG0);
> +	val &=3D ~UHSIC_TX_RTUNEN;
> +	val |=3D UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
> +	tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
> +
> +	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> +			       USB_PHY_CLK_VALID))
> +		dev_err(phy->u_phy.dev,
> +			"Timeout waiting for PHY to stabilize on enable (HSIC)\n");

Should return error (return value of utmi_wait_register) here?

> +
> +	return 0;
> +}
> +
> +static int uhsic_phy_power_off(struct tegra_usb_phy *phy)
> +{
> +	void __iomem *base =3D phy->regs;
> +	u32 val;
> +
> +	set_phcd(phy, true);
> +
> +	val =3D tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
> +	val |=3D (UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD_RX |
> +		UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
> +	tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
> +
> +	val =3D readl_relaxed(base + USB_SUSP_CTRL);
> +	val |=3D UHSIC_RESET;
> +	writel_relaxed(val, base + USB_SUSP_CTRL);
> +
> +	udelay(30);
> +
> +	val =3D readl_relaxed(base + USB_SUSP_CTRL);
> +	val &=3D ~UHSIC_PHY_ENABLE;
> +	writel_relaxed(val, base + USB_SUSP_CTRL);
> +
> +	return 0;
> +}
> +
>  static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
>  {
>  	int err =3D 0;
> @@ -828,6 +1042,10 @@ static int tegra_usb_phy_power_on(struct tegra_usb_=
phy *phy)
>  		err =3D ulpi_phy_power_on(phy);
>  		break;
> =20
> +	case USBPHY_INTERFACE_MODE_HSIC:
> +		err =3D uhsic_phy_power_on(phy);
> +		break;
> +
>  	default:
>  		break;
>  	}
> @@ -859,6 +1077,10 @@ static int tegra_usb_phy_power_off(struct tegra_usb=
_phy *phy)
>  		err =3D ulpi_phy_power_off(phy);
>  		break;
> =20
> +	case USBPHY_INTERFACE_MODE_HSIC:
> +		err =3D uhsic_phy_power_off(phy);
> +		break;
> +
>  	default:
>  		break;
>  	}
> @@ -1256,6 +1478,8 @@ static const struct tegra_phy_soc_config tegra20_so=
c_config =3D {
>  	.requires_usbmode_setup =3D false,
>  	.requires_extra_tuning_parameters =3D false,
>  	.requires_pmc_ao_power_up =3D false,
> +	.uhsic_registers_shift =3D 0,
> +	.uhsic_tx_rtune =3D 0, /* 40 ohm */
>  };
> =20
>  static const struct tegra_phy_soc_config tegra30_soc_config =3D {
> @@ -1264,6 +1488,8 @@ static const struct tegra_phy_soc_config tegra30_so=
c_config =3D {
>  	.requires_usbmode_setup =3D true,
>  	.requires_extra_tuning_parameters =3D true,
>  	.requires_pmc_ao_power_up =3D true,
> +	.uhsic_registers_shift =3D 0x400,
> +	.uhsic_tx_rtune =3D 8,  /* 50 ohm */
>  };
> =20
>  static const struct of_device_id tegra_usb_phy_id_table[] =3D {
> @@ -1360,6 +1586,7 @@ static int tegra_usb_phy_probe(struct platform_devi=
ce *pdev)
>  	tegra_phy->phy_type =3D of_usb_get_phy_mode(np);
>  	switch (tegra_phy->phy_type) {
>  	case USBPHY_INTERFACE_MODE_UTMI:
> +	case USBPHY_INTERFACE_MODE_HSIC:
>  		err =3D utmi_phy_probe(tegra_phy, pdev);
>  		if (err)
>  			return err;
> diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_=
usb_phy.h
> index e394f4880b7e..4e79f1c2173a 100644
> --- a/include/linux/usb/tegra_usb_phy.h
> +++ b/include/linux/usb/tegra_usb_phy.h
> @@ -24,6 +24,9 @@ struct gpio_desc;
>   * requires_extra_tuning_parameters: true if xcvr_hsslew, hssquelch_leve=
l
>   *      and hsdiscon_level should be set for adequate signal quality
>   * requires_pmc_ao_power_up: true if USB AO is powered down by default
> + * uhsic_registers_shift: for Tegra30+ where HSIC registers were shifted
> + *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP on PHY=
2
> + * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS/PMOS =
driver
>   */
> =20
>  struct tegra_phy_soc_config {
> @@ -32,6 +35,8 @@ struct tegra_phy_soc_config {
>  	bool requires_usbmode_setup;
>  	bool requires_extra_tuning_parameters;
>  	bool requires_pmc_ao_power_up;
> +	u32 uhsic_registers_shift;

I would rather call this 'uhsic_registers_offset'. Shift first brings to mi=
nd bitshifts, and we often have fields in these config structs for bit shif=
ts called '*_shift'.

> +	u32 uhsic_tx_rtune;
>  };
> =20
>  struct tegra_utmip_config {
>=20




