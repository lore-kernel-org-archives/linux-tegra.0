Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71192494D8;
	Wed, 10 Dec 2025 04:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339698; cv=fail; b=QXp8CRZ/md0HWfv4LOqiPuAHZQA45ePI9XobGpT1+DtEPRQ/gHf8X8R8jOW3ShGJqoVv12PrRoooYHynlKQ/rnthMhspDjgsDUi1G9pdgqmfI86UCsXLxYrpDCjB2vJoL2nDDZ64RnQ92ohW0ceVK0PcGZc6fcymGtfsRLo4U9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339698; c=relaxed/simple;
	bh=GRp/trOy5w4FNTxBDJ4jFnPJxAQS70sLpfvqK8XKttE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jOMi+2OkatdgNm/NGbi138qpR6T0351mzSQhuB2T2ofU7MiqG1hq7JNgO4ARB5dzSgpqNkrxhOf9G6ft0OKxbKyCC3T1uOrVhLvFLj3NgGwv70PxAVJjLARKFT8BzVtJZ++MCSQ9z3fa0UlyBuBAocalzNE3xTqsyGHkMLfk8bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rgK85eti; arc=fail smtp.client-ip=40.93.194.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rgK85eti"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2WwKgiKfE5TA0DrD+uTv+1BYmZ05d/+/VZyZqgVRGNR/HiFsfnu8stYZ/ieLrrZ5ts4agd8L5p/xBWW3vVV0lv+t6tKGlYrjtPqMt+/lR43bIIXXBT1rjJNeX0ZaoOC94M5hphL6PbGG8vO8RnUdY0asDW0i66M+IZa2q3A6mBZjYoxEKlXPZkDPZL2kpNjnI0wwvdvhutCWhNLFU1OP6bGCFS3KfDpTzWYXIIQT+vkFa7szbE/cYKErLjEGDEvIK8v2ywqaRKib6A0XAuAPzNK6O27rfljM1ivMPJtObGEs5xOaMk5p4Pw6ndzixGqDGbJF3QePcEx76XYF9yYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZgL3GTuQP76jQpRxpoCObG19f8WBxHvBrqJI7jXjh0=;
 b=Svya2kBIxRDuXxhMt++0kTJ80isHocZZTXBFvMjCvCRKae6C872PqvxXBhE5RgpB2cZ6xJjSM9G9ogXpgd2dCySvsRS0ss62Dl+q4y5r9rnC/1qx+cuo50haWA3Pse1Sq+PgkBfDsvAtPlhBgHs7L6/xKPMeCcR274s19g7VZD7fjwYkURsQeqrF6X2zquYb62UetyxLO7JVM/smZ9LBSCt5ND/Mb3UGBCgNxCRm/eGk00WTStq8OPF20g4rPE3kkgU1DC0vDtcpo1cyM3skVdBUH+yhkvdp2/bJZjvL1YUtIT6ggfivUulH9SOYCHJJMX6nICuz78/WdcpNFKwmJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZgL3GTuQP76jQpRxpoCObG19f8WBxHvBrqJI7jXjh0=;
 b=rgK85etikhIFVCQ/sw/dgtzMtI8PrEJd92ziokagLSeafyMCDblf0OqnO+kxNhjgTp+8YsLcWvL3r3ywSLmuh2Yrhuc58qNa0LZrLTLhr3ASpgpgBhGRhVPA/73sw8UlY1s9NlDUNziErD7GaK7/n4Zg7bOSWqWm+FCW/rgNjaVM876N2oM7uBctTjBFGT47JwPEmx5xF/sLzwVsdsoZGFtp0PfZTElILwfhulUw4qKtbgvzdhQ8KwOnXLb7SfRMEkP7ffNgdUsm/sK8ZlyT2TspLkF5XX3+1Dvr6CasjxEda0Fr3O2TMLn6raHf7bKKuk63PeMIbpvyClNryJIbJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 04:08:13 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 04:08:12 +0000
Message-ID: <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com>
Date: Wed, 10 Dec 2025 04:08:04 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
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
 <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com>
 <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0017.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::6) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM6PR12MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: 426bc8ad-9657-4219-521e-08de37a1bc6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U25DZEEva0c5KzNON09MRTZvVnV6V01FSU5OM0w2RjhhZ2NxWVlLaDJwRHlB?=
 =?utf-8?B?ZVpJaFNDNWsrbVJGUitBSDB4NFpDVDk0SDFrSkZrZEJOTk1oUHFVS0RLcTlk?=
 =?utf-8?B?N0ZLZGxLdlY4TURKVDlXQjdKdmE1bXdEZ0FWUzg4SG54TXREQndOdjl4NnNT?=
 =?utf-8?B?RjdzUnUxeERobjc1M25yU0huQVA3b0xDek1KbXJRcDhZdDAweUl3UWx1ZFFt?=
 =?utf-8?B?TG5oMkFGaGU0Z3FHekJkRXdFYXFpMVFGbTc4bFRrRTYvMElHUEd1L2pBSXZj?=
 =?utf-8?B?R0pEQU5VNWtUUWplUzJWY0RpZmFLMTZCQlRUWWlvMFZqWTBYWXhPbm8vY2lS?=
 =?utf-8?B?T0drdjBJSXRxNHREbHBNb0FhSUVmc2w1QW5YM2pScWNxTkI3L3dicldjbm43?=
 =?utf-8?B?Y2JaY01zSlltZURaVGR4SVJmc044RnBFMlk3K014TUpuNmZONnRDV0R5UFdR?=
 =?utf-8?B?aWZFQmJ5RVUyK0tOSlY3aHg1MjFMY0NLOXlkaEZmWnNrTjMwWTB5RERjMThJ?=
 =?utf-8?B?dE9TRkFtSTkxdldCZXZzeEZxSGZvVUE0NGQ1eXdlWElLbmQwdnBzMXRJSWNU?=
 =?utf-8?B?emhBaGp5bWpyTXN3VFhmeld1bkl5STB6eW1pVjNIUTFBRWRuTnJFa1FKV3N6?=
 =?utf-8?B?QjhNcUZneGZMbGR2RjNrK2lrSmNJVTB1WjNlNnJMVzBGYllYUjBLYytWcUlq?=
 =?utf-8?B?UTlteGF5dXA3a0c3UDd1dXJLdHpNaStjbUt0bXd1TTNKY0FBTy9rZS8rZmc1?=
 =?utf-8?B?ajlWd2s3RmdRUzBwL1ZlbW5VcDQxZU1hUVluL2JSSy9mQnA4WTE5Q1VkUjR5?=
 =?utf-8?B?OWdaZ1hKdTNTbEI0LzFxcFJJZ3dKVXplTm1hV0hJVjV4Y2NyK3Y5blFyNWtx?=
 =?utf-8?B?Ym1ENXM0ZlZpejJnbG1VZ291bStTSHM3TU9vOGJUL20zcXVHc1NtdElXYjg2?=
 =?utf-8?B?bTNmdnhYZFpTVUhRNWFSNmxZYnlJbkgzVVQwRzNRYWVybkMzeTB5aHFYWFdw?=
 =?utf-8?B?WW90ZUtOUjlrMWZEY0h6YWwzQW04aHNZa0JzK2dsejdkRXYzNlByTmVpSVJI?=
 =?utf-8?B?dmZpTXlxSlNXSzRMWmt1a0UwNlQ3aHluUjlPS2Q3TW1Ya0lnUDlTem5FR04y?=
 =?utf-8?B?MGFWYkpLa2doMkI3WmZLL2NnWlJneE43S0xSaThIeW12QWRvbjQvSkZpeHI3?=
 =?utf-8?B?YjdxdWUwamZBVEhWR0Z0WGpBelRLTk9jRWFRK0lZb1NDRkRjL0d3T0dnVGVS?=
 =?utf-8?B?TTNoMkFHQldua1g1cDlIVGt6RDZ1M1Z5QlgzRU9GMUVZKzdxSW9yWGdDUDlk?=
 =?utf-8?B?WUZ6c2MrZnBDend3aFFKRjBmc1pRMVVuaUhaeVlIYWVOQVpTUHY1Vmc5dkhO?=
 =?utf-8?B?VFBtcWoydjRYSVVsQUN5NFZPNzhvdHZ2WmtzN04wWncwRWdtaDEwaDNuZWhM?=
 =?utf-8?B?S0c3YllRVG9FdERFVzRUMjM0U09aZFcvQUFBczBFeENnS3V2cWVjaEZjdGlN?=
 =?utf-8?B?RmJJTkU4dWV4NkJGOHFMUDVadmxVQWxISGNzbXE4bWdIWGFSdjREL2JwRDQw?=
 =?utf-8?B?N3h3SFZpUUxEQzdIMFNUbTlVS3phWVVKdWlCdlhIUXhiVU5sWjJlK2I3bEcw?=
 =?utf-8?B?OWRiblViM3h2dENBUjlCRjRiSGt6ZmszYnRlVnkwQ3NMblpaNVZhdm1hVjNp?=
 =?utf-8?B?ODlnam10enNIYkFxZ2xMWDd1dURxbnBEQWUwVTZmd2FQdFJ2cXJLS0JhVGFG?=
 =?utf-8?B?YUlqeXdpQlhVa1BMaEdDYWhZS3YwR1JYckRoTEdPVnk5bHFKOUdZWWNoZXUr?=
 =?utf-8?B?SElLRGdSZmtoYjJhRUo2YkVhSG5rSXJ0RjZzYUJOYkpGdHlXMXBCeWMvd2pj?=
 =?utf-8?B?a0x1VzhiSURzQlpYWHRodzcxMW9EV1M4ZXB2c0RKbkVxRVo5eDlwRDdxTVEy?=
 =?utf-8?Q?xjNZ41FlxAawX+3z8DyVDH6iT/CAm7Zr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0pqckx4RlFtSGExSDlmcVpJbldFdDQ2c0JkN0czakR4QUVMekJPL1lzWlJz?=
 =?utf-8?B?eTU5UzNiUXBvZGZEaU5YdTMraUY1dEVXVnlCaUxzK2M1cTBCMWZNYXFrZ2ls?=
 =?utf-8?B?d01vaFBBZkF2RENtUUpER29HNkg0bDF2NXdUOXRwaVF4RStTTlF5U0YzcCt2?=
 =?utf-8?B?OHIvaE1LVFo3ZlIxazg4NWV0dWdsZnpCR3BhaGdMWkJrQTVOTDBJdWx2bFY4?=
 =?utf-8?B?cnRGamM1N0pxbjJKdDRPc3ExV1ppVkJTZTFDenNqZWZUNHQ1U25ENXNnaTRo?=
 =?utf-8?B?eXNubDhSaXQ1QmdQNkxjMkpmYm5UNjZUWmxPdVZPeXpEMkg1NnN0TDlIeUNu?=
 =?utf-8?B?eGxJNHFyMU9CeHVBRk5tOXJ6SHlhYWs0YzBaY1k2OW50aDNpV3RJS2E5VFd1?=
 =?utf-8?B?SFQxQ1g1Q2hPaG1nYmZGUitaTnh1dTJyUEcraG1rYzQrK3Q2MHV2SkpEVHZa?=
 =?utf-8?B?dEdQSVFncVlTRFpBdTB5M0hINUoyeGl2YS8yN2lEaSsyS0dCUzAyTWxGd1dI?=
 =?utf-8?B?b2M4bm91N0h5cUxPME11Q1B6VTNBbVZ6VGo0ejU4Ry9BSnc5aTc5Q1FWU2x4?=
 =?utf-8?B?dGFSTk8ydUg4Y2x5cnhLcjRDN1hxWTgxdW9Qc1lhMW94TlNORHZYTENLUEFJ?=
 =?utf-8?B?dzdwd3Z6WGhTVmVjRHJlM2wvK0NBc2lhWEFiL0czd3R4TFplVDdEQkIwM2JJ?=
 =?utf-8?B?ZVpwZks3ME0rc2diYkd6anVBSGwyazZ4cjBoRGZ6enEzby80NEI4MUpRZTZk?=
 =?utf-8?B?M3N2QzBtUW5adnJ3bThzNzVxa2N3THRxYkNKUnVMUnIxVzF4UUVoWUtjU1lP?=
 =?utf-8?B?ZVhRUjJ6cmZRMmxQRVY4WWUrRWdDa09Fd2RXRlgrOFJuWndvWFkxbm9YbmVz?=
 =?utf-8?B?aE4vR2cyVExpbktxYmhXaDkveU5qWTJzYW1sM3pwaGxMa01ZMjVrSVVhVElm?=
 =?utf-8?B?QVdNTzduaitUZEljS1ZMRlpnMGVlaThlVE10NlQ1R21ZUFBHM0dEOXQxNk5B?=
 =?utf-8?B?SFRLQVZuVHFLT3F3cWV2UzhLOGJjTFZqRjFnUjBrNDlqOWIremJBck5BaHds?=
 =?utf-8?B?ZEVPYjY0b2tSeHhGRzB5d2lSS3VaZHRxclJ4MlR5bTdFUis4MWFnR0llY1BE?=
 =?utf-8?B?UEU0aVlKeEZKNjNiU0J4bldGV2tnRTZRUmRhRVpSNitqM1AyWFdPbkhLSmNX?=
 =?utf-8?B?aHVOOEY1Q2RVdFVUbW81K2N3dDN0aVBnRG00UHo0Wkt0WGpYZVVNMGdvV1lt?=
 =?utf-8?B?eHFUOW00WDIvMUJOU1R2SnFsSThQVWpkU011TTJFcU10bldVTXpJSUtrWGhp?=
 =?utf-8?B?Q2w0ZE5udnJsZVNhY3NuQ0lIeHdMTU12QUE4V1hXc2ZNdDVHV1VqZXVidG00?=
 =?utf-8?B?Ny9rWVpQcE9MVEQ0ZUdoQ0xYaHhOVEZUaU1rUDVpVVo5aUJvM2dKdHpXcVc1?=
 =?utf-8?B?OFdmY2tIT1U5VlF0L3EvelMrVVV4cmt1RFdQbW05RlU3a0QzdWtHMEE0cUZH?=
 =?utf-8?B?dHMycTNJZ2IwYWdJTGI1SktuQ0xNL3pHcTZ2MU9TQm1yZ01iTWFUNE5DcnVL?=
 =?utf-8?B?S2ZPZXNrTnJtZStnb01sMWs2eFJxTXpPWC9OOTJMQkNhY1Z4L3J3NE1tdk1U?=
 =?utf-8?B?RDVFS1N5YjF1b29UUFN3VHVoM1VKcEU1UE5oN3NlSVJWVWVYaDduUi9UOHZm?=
 =?utf-8?B?eUtSNmozTWEvM2V1OENXMWw5a3JDUmV4YjVXbnpRdU1SdC9IaitMZ1lpdTFw?=
 =?utf-8?B?WnFWWUlYM3l3ZFl4MHh1OGVXRkNQS2drclpGRUk2bGdGcGZ3TTRJVUlVYUlL?=
 =?utf-8?B?b1JQYmZpSlRaT0RIVGIwTTVCOG0ySENTZmwxUlBrc29nY0xBZEtldWphNWFC?=
 =?utf-8?B?U3g1bkJybm8zV01xZ3hMN0p5S1NNdERRS1VUQVloc0xxYUR0dEF1Ym81dVpE?=
 =?utf-8?B?dDJ6VzlibHBDTTkyd1AwSHVBT1l1K3NGMHZVaUlGeU1SaXZjdHhoSkZjNFhi?=
 =?utf-8?B?Q2hHdEFVWDBwWTlMZENpUWhKTU1ZcldUcm9Wd0RCWktCSm4xS00ySElMa0FX?=
 =?utf-8?B?c3ljek1raVhYclNJTFNzSWhRWFMrazM2L0lDNlEyMHNRVS9PUVFkTDY0cTF1?=
 =?utf-8?Q?9FvI+LajYAJlOgWmOqRHS6Tyi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426bc8ad-9657-4219-521e-08de37a1bc6b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 04:08:12.6855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55bqNCAqMX7hFlZyaQgUEEqufZAToMEz2rX3/lvbFLS9vSSxF1YYdRDCBoLmpbv3tNWs24y2aV1prE0YjCf8aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041


On 21/11/2025 18:17, Aaron Kling wrote:
> On Fri, Nov 21, 2025 at 5:21 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 12/11/2025 07:21, Aaron Kling wrote:
>>> On Wed, Nov 12, 2025 at 12:18 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>>
>>>>
>>>> On 11/11/2025 23:17, Aaron Kling wrote:
>>>>
>>>> ...
>>>>
>>>>> Alright, I think I've got the picture of what's going on now. The
>>>>> standard arm64 defconfig enables the t194 pcie driver as a module. And
>>>>> my simple busybox ramdisk that I use for mainline regression testing
>>>>> isn't loading any modules. If I set the pcie driver to built-in, I
>>>>> replicate the issue. And I don't see the issue on my normal use case,
>>>>> because I have the dt changes as well.
>>>>>
>>>>> So it appears that the pcie driver submits icc bandwidth. And without
>>>>> cpufreq submitting bandwidth as well, the emc driver gets a very low
>>>>> number and thus sets a very low emc freq. The question becomes... what
>>>>> to do about it? If the related dt changes were submitted to
>>>>> linux-next, everything should fall into place. And I'm not sure where
>>>>> this falls on the severity scale since it doesn't full out break boot
>>>>> or prevent operation.
>>>>
>>>> Where are the related DT changes? If we can get these into -next and
>>>> lined up to be merged for v6.19, then that is fine. However, we should
>>>> not merge this for v6.19 without the DT changes.
>>>
>>> The dt changes are here [0].
>>
>> To confirm, applying the DT changes do not fix this for me. Thierry is
>> having a look at this to see if there is a way to fix this.
>>
>> BTW, I have also noticed that Thierry's memory frequency test [0] is
>> also failing on Tegra186. The test simply tries to set the frequency via
>> the sysfs and this is now failing. I am seeing ...
>>
>> memory: emc: - available rates: (* = current)
>> memory: emc:   -   40800000
>> memory: emc:   -   68000000
>> memory: emc:   -  102000000
>> memory: emc:   -  204000000
>> memory: emc:   -  408000000
>> memory: emc:   -  665600000
>> memory: emc:   -  800000000
>> memory: emc:   - 1062400000
>> memory: emc:   - 1331200000
>> memory: emc:   - 1600000000
>> memory: emc:   - 1866000000 *
>> memory: emc: - testing:
>> memory: emc:   -   40800000...OSError: [Errno 34] Numerical result out
>> of range
> 
> Question. Does this test run and pass on jetson-tk1? I based the
> tegra210 and tegra186 [0] code on tegra124 [1]. And I don't see a
> difference in the flow now. What appears to be happening is that icc
> is reporting a high bandwidth, setting the emc min_freq to something
> like 1600MHz. Then debugfs is having max_freq set to something low
> like 40.8MHz. Then the linked code block fails because the higher of
> the min_freqs is greater than the lower of the max_freqs. But if this
> same test is run on jetson-tk1, I don't see how it passes. Unless
> maybe the t124 actmon is consistently setting min freqs during the
> tests.

So we don't currently run this test on Tegra124. We could certainly try. 
I don't recall if there was an issue that prevented us from doing so now.

> An argument could be made that any attempt to set debugfs should win a
> conflict with icc. That could be done. But if that needs done here,
> I'd argue that it needs replicated across all other applicable emc
> drivers too.

The bottom line is that we cannot regress anything that was working before.

Jon

-- 
nvpublic

