Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012037.outbound.protection.outlook.com [40.107.209.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67FA24397A;
	Tue, 13 Jan 2026 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301930; cv=fail; b=urwqHg/ZToFXQGw5+hQ57iqiI0ZOoaSb5sRh1p5qjjfHNMd1PenKBnea+312/88aFUDaZ3byhJ8TDoJnIxklKbSex+KnhI8TLdPksDszKQjBV4xF4MtaBPu3e76uAAg/3RQVdgs0C335+Bxvlau3ZYRA9nXBUvzAi0emWnenpNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301930; c=relaxed/simple;
	bh=kwIlFAG0uTLy3xq2vrR+wyiLm/CiYMWU/l5ZNUQtF0w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gBbntGnBDUrfeU1qIl18LvPhsDtXmgsJgWOosygA3cJawEnfisJnADmdN7BTDaEko1WO/Dqwoc1yi4qI3su7c4xuB+78ndTFC4eaicmZK+UxijgG76m1cPO+6/EIZiCs9Qt6eule9s9Sb+P07+5rchdTFQR5CtieTO1Kq0i0wAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cHKnIIrj; arc=fail smtp.client-ip=40.107.209.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cHKnIIrj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/06zntHFh5vsv4Zwvy7W6pZm56+JJ76YL7lJFuG6a0X+06rC14ADqZ8XH1LWLBSoP15E4DveOUNoZ3wqd50SE6q5fbkkIUksL6wMatCXT2KLMPojcrLG7aWPRahEl33sDQNicEyrCck6tX9ZPDakIds8cdiDf9E7N0AXXrzskm8Y6UUIoEWOZAiqIpj59GjRsJF0fSmqzCJbEpsfcVj5078L4oZVjgCpJCibYYYJMm/NYW1GDdrCl1und4daEVhW4TlqkoaBaJ45/Jtu8wBaTP04JrL9NTGRCzEmfKISUU5yH31QZbWVYlANf+lstiGaeMFFT1kmu4oLrnQI5JDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkXBvzWu9rCoT1uTvODYEBfmm5pzaXb2cUTCKXxR4RA=;
 b=EPu3MZHRh9u6lT5xPbosbUldJsAQnSDBCJ3oLQQCPYOsA5l0SDEkD37Ruf9PSjfhQ5DitJ7p032fEJ6/RDkn5fs5RK8MlLOh2TETtDFdNx++0Ku8vychieqEmnYnD8DVAVx0t2DZFie8oyZHH42JjF/1Oeelmv/nyU4hRmDqb3hUAHmWQN7WRBqA0IqLyao0YNonF2yhsNnTRutJDw4CTDHTddBgu1cOGXiXrb6cUTahlVFtEfOsa0OYLHtVWc8B6qLQIIZPH0VDBTPjpEmvitFdQQWe/6ab0iLy+8u0VQYxr1tmTstAkVEWU24RTUZDRxbs92VvREoikET3v1XlGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkXBvzWu9rCoT1uTvODYEBfmm5pzaXb2cUTCKXxR4RA=;
 b=cHKnIIrjPnYDP6nkLAybJSo5OHB5KHwjoTNGxv+NRSZh2MehEEtMkOlcndqfPknGNzicFaDmlmpNJjB4rG1JybF9yNrhPbhSE2erQLh9D7LbgSaQQe6jwPotThCx3kiy50hiMpCvJUoBA95TJeP/Cf05ttwuYkt9StcIQPl5n1TWrPyqowyOSUM6otisykHDjmqjvKz6e2+mDJPaGBel6ZD+0s22fXWzfnCFmU3NyNKNSXuoi1xPPZmo8BOd0jHz8bS264y0G+VUoj1fsAyluCKyr4XovvmjIRQ7seTTg5ri7QJD1Jr686myMkQrceS0csYKkL7tLky9Cq1l097D7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 13 Jan 2026 10:58:45 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 10:58:45 +0000
Message-ID: <06c3595f-7aa6-449f-bd91-55b4db377579@nvidia.com>
Date: Tue, 13 Jan 2026 10:58:40 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Fixes to Tegra USB role switching and Smaug USB role
 switching enablement
To: Rob Herring <robh@kernel.org>, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 JC Kuo <jckuo@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-phy@lists.infradead.org
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
 <176497381829.863612.7431013132555369131.robh@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <176497381829.863612.7431013132555369131.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS0PR12MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: a5eddbbe-d9d7-4378-c567-08de5292b8a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjhlaGdwdHM2c3hOL3FlTjl4a0JRZ0xwd2RMQk9DeGNIbGkyazYvN011T01X?=
 =?utf-8?B?SnkzUlhNdzZ0ZmgvSDhCSFU0NXNrd0NxbXNUR2VMT0VkbHoyNGxpb3ozTmhV?=
 =?utf-8?B?bmFnUHcvdWRxbjVMU0lITzdJaFdCampXQWM1cUhEUTlLRmpsQ2M3dU5XbXZB?=
 =?utf-8?B?elQ3eGZRU1dHRlhxMlI1VmtpdUxVZDVpWHRoVGVzZ3c0Z2tBZ1k3MGk0ekN2?=
 =?utf-8?B?TmdMS2h0MzY0UTdPVVdVWFR0S3VMNnNxVC9pVHpnNVlWcVpialQvUjFXWGMy?=
 =?utf-8?B?dWNyRGZCQjg0RldLaTdTT2tUNXY0NkVURGhnaXh4RlJEVEpZSDFTZzQvZHFa?=
 =?utf-8?B?SFdlQmRWWlQ3cWdDL3BPNUFxWndZUWlBLzBUczVML3pVaHk3VkUzaVE3Y0pr?=
 =?utf-8?B?dHc1dlpJTGlHT0NycmtXZ3RTaFE3U3lEMlFhcWV2UTQzMS9URFJ3NVhOVTc5?=
 =?utf-8?B?TCsvaWkrMllXaVVmKzhIZ3JsRXBDTzc0MUZYMjIrMlZWUVRVUlB3TURON2t5?=
 =?utf-8?B?amFydnJDRzFCZ1NHcUtPTUtac0FHNFJjOXVMR2l3cVhudnlqbjNPL3F6UC9M?=
 =?utf-8?B?WUFkLzYybUhHOWtXUnh2MGh3OVlYREtqcjVpUVdZK3FmZGFDa1o0VHBkcWxO?=
 =?utf-8?B?NnVjSEVGRk9SNnVFNEJGZVFxdC91MmVrZnRhcXNUU2VaaXdMbzBZdStxWExQ?=
 =?utf-8?B?ZUxKRm82ZnROS1lMSk5XcUtCeXR1ZXJPNHcrSExJaGN2UVZxVU5qTmVkK2J4?=
 =?utf-8?B?VXRtMkM1ZlNxNzJiTW4zbXRtaERmNlc5bHBISHRJdHNvVXJnYko5YlJIQXc2?=
 =?utf-8?B?UGUrQi9sY3M5WnFrUzhLekxnM3dTL3ZNTWVmZDIzQngwZCt2b3AzMXVRWjlB?=
 =?utf-8?B?Y2l5WXBDUDByTVRHRzRQTmVSSFVkaUpTdHMvaEJSclpEU0FGdGF1dmNMMVVu?=
 =?utf-8?B?WEZlQ0ord1FqTlZOUHVweS9IcTJMVFVTQ0xwOS9kYmE5OEc4bmFJRW51M1Np?=
 =?utf-8?B?VmJsbXNHSUg2dUV3bXhYbHdSajBLV2lPdUl1UTdCdGxoRFZudVkrRWRIc3lz?=
 =?utf-8?B?U0hxTEwxLzg3ZzVnQmpZMU5FQ0laQVVyamhHYStWWmNCa1NhcU5BVEgvWVVD?=
 =?utf-8?B?TlphZGFlRlYyMGJGaGZiOGw0OE14cWR2OTNKeldJdWdLeU52ODMxWkhLQ3Z4?=
 =?utf-8?B?b3NDNkM1U25URGJUYk84NFFjRU9EYWtjQ0lQd2Rya01sdTFib2crS0hPZlAw?=
 =?utf-8?B?Z3VVTHR4ZWUydXVXeXlRREJpa0x4elgySFRCOC8rUW05MW4xZ1R3NmhQaC9x?=
 =?utf-8?B?amRqcGJBSFNuYXNVZ2JIaXJRYVRWeFhkN1F1ZmVVQkE0YVY5Q2ZZaXlXZGNN?=
 =?utf-8?B?ZXQzdzJDM2VtQnd3ckltcmJFbFZDQVFlRGZ6eWNrZzRmblh6WGRLYXFjS3pl?=
 =?utf-8?B?eTdZRjdwd0NoV0s0bTJJNG1mamVLUzd1bktmRmdwbjlSUHV5YWVPZDNseGlr?=
 =?utf-8?B?UG9iUGRxUE8zUUFwSk5PZVh1UzhkK1lzblozYkZsWkRDVG1CMkRIZDJoR0N1?=
 =?utf-8?B?UWovMnJYQXFsZ2lHUHJQSGhhSVZ0SlQ4R1pxUVpvWnR5dHZJTzd3MVdjdDVV?=
 =?utf-8?B?WW9XRk5zcjJ5WktOeUhJeDhJNlRoUVNLOUN6VGZDNy9Zb3BHMVNaQXlKeXNI?=
 =?utf-8?B?dXE3alZ2UG9yZzdIZkFEQVRUL2lPc1A0cStISTZkS0RtdjNKK2E2b3kwY1F6?=
 =?utf-8?B?SlhaL0RaRm10emd0ODczKy9wMDd0ekF2RmlOOUppSlphdEV2dzJBR2lXVGZL?=
 =?utf-8?B?eU1BVXFmcUtGeTVDcjVtQk43WlYxQ0oyYlBjWlpjS2xkZFNLcUhiT2xVUW8w?=
 =?utf-8?B?dnVqMHRRWk5NcVNHTi8zYnBGQkZ4dXVsQXQ4cEhRY3VlVjJrM2I3YjJ6bjRL?=
 =?utf-8?B?S3B4Wm1WREtUSzd2L1BubVUzRTQvK1grdkJZcVk4ZTYvSkNEWjRjWkJ2cnRV?=
 =?utf-8?B?eEZJSStQK29nPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2RWSWQ3cC94alRERlhIclc2RkpBaW5ZTm80Vk0zdmhHQXZNMERScE5qWXJW?=
 =?utf-8?B?MFlabis3RVRCVTQxWXVJL2ZpQzBTOFdoMVUzNUlBK2VIbzlZZzZJZ0tRVUND?=
 =?utf-8?B?YUhqZm9SOWFmM2E3cHZxSWNwV3B0UWtmSEdRZWg3cW41V2pzZEtjaVdLZ0p3?=
 =?utf-8?B?ZXgxYVFJQ3c0Vy9ybTlyV2JUQnpWNGZ1V3FwM0FJNEJlSHhiRFdZNy80Q3Nz?=
 =?utf-8?B?LzdxSDI4NStGTlBJZXFrSGFBN1gzdktmVEduY1k1anM1Um9YcWgyTDdsT2xP?=
 =?utf-8?B?N25HT0VxVmVINE1sTVNyQzU0dzcrMWtBd0ZzQWRHNkR2Z3YvZmZwb20xZkUr?=
 =?utf-8?B?WDZjYmE1ek5Lek5UQUxCS3JNUEVQdFFKSTlJU1hURkNrOVNBb3l4T0hPMHNY?=
 =?utf-8?B?K1F0MVp3TFpIQllSckxzYllhNTlnTXEvS0ZaczcwVW1ZWEFmOGk0OUVDMllO?=
 =?utf-8?B?OVYweHNHN2twQVgzU1RaZG8zcmpKc1Y1RG9YcTY4VU1EQno0TmNGNVNrR1Nz?=
 =?utf-8?B?RnVEQmcwaDJoRkJNTkxXdFR6UXcwYWx2azhxU3hVeDM3TGs3bG1XOE8zRGdH?=
 =?utf-8?B?RkhIN1htYlh6NUdqQi83b285bjF5eHhPOTE4Q0VoR0JhSmpLQnR5MThFWm5n?=
 =?utf-8?B?Nk5KemY2RFo5MHZaekxEY0xPMXVrT09zUDFHV3lxa1hjOXZpR3BvbUhYY1Bo?=
 =?utf-8?B?T29VdmNjRnBEWDIrcExtRnZ6azNXUDRpck9mc095WUxJbHVVVy9TVmtZQk1X?=
 =?utf-8?B?SDVWbUVhN2NEWWgvTzVnWktvUHZRQW1WZmU5dEppZjRDb2p4N0xLZEs5UjVO?=
 =?utf-8?B?b2xQVVhWNDAxWXE5Sk9SNmg0Y1cvV29wMUdlVmtHK1JhM083TlIvdldyOHhP?=
 =?utf-8?B?ajgrTnZONnp4U1FUUFQwcEhlazFqUFlHYzhFM1ZVVVRHamYyaEgwZ3R2TCtx?=
 =?utf-8?B?eWpSMVE0TXNzcGdLWW5MMDZ0WGVuVDRqVjhjTU5BRDIrRGR0SkYxaU9XZ2Fw?=
 =?utf-8?B?TzAzVEhqRUtvVVRjSjlNY3JTcUh3cFp5ZXFuSkpPOGhVZ1g0bTBmTDAwby9q?=
 =?utf-8?B?Q01FdFlNa0VyUktlN0ozTDR0SFFRWkpaWHlRa005SVlaK2tMVUhmUG1lYy8v?=
 =?utf-8?B?c1BMVzlXbVZWbnZmVHdvNzFXRlhvc0xIbXNFamFiVnovcWZDQ00vMzhuTmdB?=
 =?utf-8?B?aERhdUVvTWIvbXF5b0Eya25qbVN6RmhXTDAzVmxQTEhiQmM4eE5GNk5GU29h?=
 =?utf-8?B?dGRrc0diUDJBZWFmZUpQR0lJSmxpeU92V3k0eE93bUthcElRMGMyOXh3Y29G?=
 =?utf-8?B?UlN1b2loM2swaFlDUlo3WE1xZC9wZ21yVXE5bXkvUkJacU54endRWnMyUlFC?=
 =?utf-8?B?TlJGMWRIclQxdE9aUXFZdmRURXlHT01JMnBRcEI5WkVHN0srSk1yWmZpb05q?=
 =?utf-8?B?R3hlNmhmandsaTBWV2NtbW5DcG03Q05jQ0pRWmtoZ0QrMGhkNWtoM2ZMZmRJ?=
 =?utf-8?B?V29sMVZJZGpwcWJta3kwU2FEK2RKSFoyMmdiT2RNY0lvZnpuR2NuMVhmSHhq?=
 =?utf-8?B?ZFVxMER2azRmeW9xVEZUUkxuTDZJSSt6VE9QcVVoazA0ZVNwcDdXTEpYTzRk?=
 =?utf-8?B?ZndQSWNtTzVLdnMveFFtbFFsOEFrYjNpTHlubWRKdUx0RHZqMXV5c2REdS81?=
 =?utf-8?B?VjRqM01qZkVkdThCRloyOG5MQlZKL1p1UXhLVVRSZHFXSXo2eFYzSzlUVmFO?=
 =?utf-8?B?NDRBcnJBY0xGbGQwQ0JHbDRiaVJ3MkpyL1U3ZlRoUk1ldSt6L0M4VUk1RXFp?=
 =?utf-8?B?RkdSZHNFcVVPZzBPcm9ZT1pBMG5XMWtUT3FJaE83QnBRTHJBamwrMXR6a3Vr?=
 =?utf-8?B?K3VGTndrVjZGcVVZSjl4YldaL2Q5MzgyRUR5UXBad21yVnZiNGFZZmJnRGVw?=
 =?utf-8?B?SXE1NXNkN00rY3Q1R1VoRjRVejlFSkVVc2tIRVB6Vk1MQnBOVDJCWi85aXh0?=
 =?utf-8?B?NG9nRU9CT3FIdHJYc3JJb1c3Y1R0dExiUzIwTWZTSGFqN25MYmhrWStFWGZz?=
 =?utf-8?B?ZnlGekMyMzJoK1lvNHpjamowcHZIT1FQK1hpMDNNMVlRa21OZEJ3VHgxUFha?=
 =?utf-8?B?NmVOQlJ0L0FhdkwwakhqOGt5TnUxUVB5UkhaaEdRKzVrWDA3RUc1d2VsQkps?=
 =?utf-8?B?c0o2Vm8reW9ud2p0UGp3NkZWZmRnWDV6Mm83b0NpVFhhazh5ZmtpR2k5ZEh1?=
 =?utf-8?B?NDZmNWQ4UDhhYlAvdXdSbU04N3pZWFFiUVJCWlhOeXZNdHo0N1lJWDNqdTN1?=
 =?utf-8?B?STc4RFlCZktwcUtDNVhHV2dsM3g2aTA1b0RxSUJFMFVZMDh6cGpTZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5eddbbe-d9d7-4378-c567-08de5292b8a1
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:58:45.0321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vuh8BoFhrtMfR3/iXhwgxErCn5VPxVC6W2r2ZCmP183LL1uC+/tHPL9vq2Ub/CEnZzwP6XSHguUwnzpOQJM0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6559

Hi Diogo,

On 05/12/2025 22:36, Rob Herring wrote:
> 
> On Thu, 04 Dec 2025 21:27:16 +0000, Diogo Ivo wrote:
>> Hello,
>>
>> This patch series contains two fixes for USB role switching on the
>> Tegra210 SoC, as well as enabling this feature on the Pixel C.
>>
>> The first patch addresses a wrong check on the logic that disables the
>> VBUS regulator.
>>
>> The second patch guarantees proper ordering of events when switching PHY
>> roles.
>>
>> The third and fourth patches then add the necessary nodes and properties
>> in the Smaug DT in order for role switching to work. Currently with this
>> patch series this feature can only be controlled from userspace by writing
>> the desired role to sysfs as
>>
>> echo "role" > /sys/class/usb_role/usb2-0-role-switch/role
>>
>> with role being one of {device, host, none}.
>>
>> Further patches will enable automatic role switching via the 'cros_ec_typec'
>> driver which is currently broken on Smaug.
>>
>> N.B: This series does not add a 'connector' node under the 'usb-role-switch'
>> property added on patch 04/04 because for Smaug the connector should instead
>> be under the node for 'cros_ec_typec' node and as stated above this
>> driver is currently broken for this device. If it is deemed better to
>> describe it but explicitly disable the node let me know and I will send
>> out a v2.
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>> ---
>> Diogo Ivo (5):
>>        usb: host: tegra: Remove redundant pm_runtime_mark_last_busy() call
>>        phy: tegra: xusb: Fix USB2 port regulator disable logic
>>        phy: tegra: xusb: Fix ordering issue when switching roles on USB2 ports
>>        arm64: tegra: smaug: Complete and enable tegra-udc node
>>        arm64: tegra: smaug: Add usb-role-switch support
>>
>>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 13 +++++++++++++
>>   drivers/phy/tegra/xusb-tegra210.c             |  5 +++--
>>   drivers/phy/tegra/xusb.c                      | 23 +++++++++++++++++++++++
>>   drivers/phy/tegra/xusb.h                      |  1 +
>>   drivers/usb/gadget/udc/tegra-xudc.c           |  4 ++++
>>   drivers/usb/host/xhci-tegra.c                 | 17 ++++++++++-------
>>   include/linux/phy/tegra/xusb.h                |  1 +
>>   7 files changed, 55 insertions(+), 9 deletions(-)
>> ---
>> base-commit: a8817ff3b5cd99b0a5af57a92d1a3a7980612550
>> change-id: 20251201-diogo-tegra_phy-86c89cab7377
>>
>> Best regards,
>> --
>> Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>   Base: base-commit a8817ff3b5cd99b0a5af57a92d1a3a7980612550 not known, ignoring
>   Base: attempting to guess base-commit...
>   Base: tags/v6.18-rc7-8-gf402ecd7a8b6 (exact match)
>   Base: tags/v6.18-rc7-8-gf402ecd7a8b6 (use --merge-base to override)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt:
> 
> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default-mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml
> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
> 	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml

Per the report above and my other email, this series adds more warnings 
and we are trying to avoid that, even if such warnings are seen on other 
Tegra platforms.

Jon

-- 
nvpublic

