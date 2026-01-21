Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013038.outbound.protection.outlook.com [40.93.196.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1706D346E45;
	Wed, 21 Jan 2026 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769023163; cv=fail; b=HCMwAbQSu8rlNmhD9+6VJwV02rbUo7mYuCPcWkK3XIHgfUQSlne9zKWcgF8i7CY5gfcuy0UQZ+60SgE1c5/Imafwn6dTcBf+Yn6tRXWKh2BrgvwAAbxCWKiEe7gktuGV5h4pYg1H/awxdTpbeIAUvGx3sqwjhHHnCluWyeZOLKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769023163; c=relaxed/simple;
	bh=fQrc0+nY9pC4XjZZWKeH/VPduSEfpkP8S1IFlpm0LOo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h4VoPRxLr5t07THZ1D3Kah6xhHZzyJc8eTJRKbqV9oDNYXsTCa4hLzv6kEG6bAjrOoZy0TGMtuTd2oJFBTHGOZH9pg01Yvf5httP1OGJ5NLT6qwMdAZ6sjr94TToX4C9M4po1/xb23ZJlbsX6mwopwMTDFm7TFC+W0XkrbgWPfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Lx/qHpFZ; arc=fail smtp.client-ip=40.93.196.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lx/qHpFZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmm5oCTtvn2bn82nGe7zdWubujuxUCD6xIKwsQsfNaadtL4IGw+Ui9KXOWGsJs38Xi+lIhn+aN1U6wRthaztGXZVIvo7EYFgBvmURa0ixZ8+7Oniv0irTjdryAoMb2PrOG3fb0i1W/MmJkAS8FNclKA1wgVYB0zcDemfHFwI5XSY+gNfZIEdHbc2afBwUpRmxk2evXybKNdRrZYm4qU3j9OInOsaepaIkeTy84ypE8zz5TY4ze7U/VOJMzfh7qLRWMvvuGltUhiRSw5gwQ2A2jpVIYCh7fs8H1fJ8zZjnDeH8XKI1FaJ/iz44FxLa0qPtSTfP2CRs7/HXnd71uEqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX0g54aQXnm0tycUdj5IXiXTH94t1RsZ+A61376eFIM=;
 b=xA7QD3EX50ERmekt/MdwUPNhTBb4CfUq0dLvP3OFRQqqc9EJHKMeGf0gkI/eIO9nzs9l5k/YGkyWBnkYhy9mg/UkonA3KpbCZ0BWdEG48E8Y7S6mq5N+lITNQe0q+Q8gZvj+qU2uYtmWe2kSlCr/VAJQiCMGkptCJll2T/s/77ySmlM+6gK/ItkiiBF/RlmU7iRBZsupdBapJzDR+Y4g4PeX0IXN6jcjjsW58CACNtN2nBdyy/yo8Jpz0NjRCvdiYEpvhJ+EPnKu2Wf6Z1+/2C80040rbU8X640lCWI7HyZd8WveJyVaHdinYN93HUusfkQNxnVMQHo3OYKOygMihA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX0g54aQXnm0tycUdj5IXiXTH94t1RsZ+A61376eFIM=;
 b=Lx/qHpFZomMa6uAbr+TzQ85aLkRo4BS+JEPmPea42IvIgxZcn8teqdTcYmi7dmT3Ks1y11PEYOY6PxmklpnZ8SNIFwv0MFF9GKxFa6YFJYauuKXxK0k9sP4drtO1MWx3nNfC4fK0zS/67yaaS/TG4hZmTlS/amsXNWZ4t5kM3OJsGGp5faGKhXcpLzSGjPybrL7UZDmsaKTzmnHpANzLrc8GJxKejDdwXpwUpiLkqgwTS4ocMZgOEGW8aDvwzJZj5FMkzTsuvHBiRpikCongTJSGMB14IRxzp+J7A1uf3PRS0Xq3uutoiKrrLRghoAaiSlfv5Oewmmj7DmCMR56RFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 19:19:18 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 19:19:17 +0000
Message-ID: <94627662-c8a8-483d-92ee-0cea37ec6361@nvidia.com>
Date: Wed, 21 Jan 2026 19:19:13 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] Add I2C support for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260121153012.92243-1-kkartik@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260121153012.92243-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0217.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::6) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd9041d-da68-4c6e-fde5-08de5921f877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUU5UDNoWS9nckFGWXBDc0Y5VlZnOFFrajJPVnF6eWdDSmJidkFuaXhvVnMz?=
 =?utf-8?B?Uk5OVVAvQ2ttMXlVdlo0cGJoS3BFeWhGSjhZdUh6ZU9lOHJIcFlhQXAzYy9S?=
 =?utf-8?B?MVZTY3pvbGpxWURjUXZlZzJXY2hKS25GZWd4cnV0czVoZjVJcjlaZ0FMTEgv?=
 =?utf-8?B?WU5TWThMaCtXakw0WmR5d0ZReE5McEpOQ2Znem9CVlN6cFZhV0FQTkFYNG9h?=
 =?utf-8?B?VEFrK3g2cmxOZzFBS04zSG5xMlZoK1hneHFBN2FrWjBlVjhNSzEyK1huUUI2?=
 =?utf-8?B?U2tJVHZUdXpCdC9DMkNIeWs5RVpPYWU3NFRKZnVQSjVjdnJMTmVhU2hSbld0?=
 =?utf-8?B?VGZpMTl5Tmw0N0tvaldJWUJwcnphVjNZcndnNmk5c3FoTzNGTWE3eklOcm0r?=
 =?utf-8?B?OENPUW5VUTgxQlpiWTFDM2FlaHBrbHY1S2h4cTI5QjNRTUFUWG8zZ2lEdWFJ?=
 =?utf-8?B?QUxGT1lzTzRrcyswbGZWQTJqSVY4Wk4zbTdoOUMvNmtKdng2ZnlEdGpNdWhk?=
 =?utf-8?B?S2hCU1JVYmNVVE5ybmVJaGtKbW9MZUV5L3J4b2F2QWFPaHd4NWtLZ2U4U0ow?=
 =?utf-8?B?a0Z6RnRwQmFUNjJHbVV2dkVUTUxqREFRR3JxdExWZ1A5S0JGNHFCVGFGdUNW?=
 =?utf-8?B?VEhzdWpCaTJaVFE2YjdwWW92UUpSZ3I2RFVXN1ZuVElJRlBONVA1WkNXRHYw?=
 =?utf-8?B?NW1nY3QwTllhU1pEZk5ZSDNxbG5Ubkc2cENJbzhGWXZ4empOcVRkeU9rM1ps?=
 =?utf-8?B?MGZHM3FiV2hWU1ZrUzFsRjJiaFVVS2dkRTlMY1R4SGEzY1BIcExKUDBBVW1s?=
 =?utf-8?B?eEk2TzNYclpNd01Hd29XZUZNd3VVNWZmQUdBbEFOcCs0L3B0QnRmU2V5SXRZ?=
 =?utf-8?B?RlliQlVEcmtVWnVCRlJVRmNoOWRsM25BOVRraFcxbXJDQndzcUlKV2xJQzFX?=
 =?utf-8?B?akV4cGxIYXZSZllsM3g5THVlV1dVd1JXM0JLM2ZWbWg2MTJmbjVXTytUUjdJ?=
 =?utf-8?B?UkxjYjQzM1BVS1VYais1MENLR0ZVdjY1VzJkQ0UrN0tSOHh0aEUraXdqSDF1?=
 =?utf-8?B?MDgva1pUMDUwbHRXRUptWk9VWmRmZHYyY3UzN3BFTERISUtsU1pKS2RINDNN?=
 =?utf-8?B?Q1g1ZWJSUEJaN2lJcXpGeXRqcTY1a1hRNmdsZ3BKcXZrYVZrOXlqbEJtcjM1?=
 =?utf-8?B?OFJWNlYveDJBN1FIS2JxU2FYZUtGaFJLVnFKR0paME16Sms2R2xUSFZMdWJN?=
 =?utf-8?B?N0wxbFNyRXZ1VnhKYndGYngwTHQxaHFkemNieHRtMEZOYkZhWTM2WEdXR0JP?=
 =?utf-8?B?eXpDaDFBVlRlRkgxSXlCZ0t4M1gyT2h2TmhsU2N2dEZlK3E2TjBVNk90YU40?=
 =?utf-8?B?c2NyZ1BQbFZXQllKaVAzNjBoeC9HNTN5WGhqVDNPVFZEYjE2WTBhY09rUnEz?=
 =?utf-8?B?Y0xNTm4wS0JFOExIRlRTVkRIQ0hONi9EYjU0SXRVb3J5L1VkdHpzUGd1OXBW?=
 =?utf-8?B?cjNEMW5tR2xBNEprU1oyU2g2OHVBclgyMVRiRmlrZElkWjJPMlU5TWpqaW1M?=
 =?utf-8?B?WlBLUmg3VFpzUURvWVJtM0VZZTkrcUl4bTVuY1Z5blRsMEFoK3N2OTcyNmli?=
 =?utf-8?B?d1VQY0FiRWw0aHUrcUhQS29HSmkzdFdkeUlEUW9Fejl0TzQ4anJ0ME0vTENS?=
 =?utf-8?B?bzJheXhnbkVJS3A2UWNjYnE2QlBDeVdjQlkwMlE0aWYwcm9MUzF2bG9GS09h?=
 =?utf-8?B?UCtKbEhrS2xmZzlCbWo1bFhGTmxNbVU0OWJJUjczNkFhRmRweHh6WjVMUHlH?=
 =?utf-8?B?U2g0em51VWNoMVhUTFprYU9XVG0vRWRzMmhGQjZCbFpIcThIMUJvYVlOM3Vp?=
 =?utf-8?B?WVo0WGhUYmYvNEwyVGcwQStuell3cTc2UGxpZmZIYlV4M1duSFBGS2dpajE4?=
 =?utf-8?B?cXdpdWdTcGpySERiWUtaTXlDVmpndHFETTR6clJnZzFPU0hKSi9Cb0svdlk3?=
 =?utf-8?B?eVRSdlJoc1djbG1zMzFXNGpJV0VTQjdnTEhXdW0wK01nSUJiOUttbjJJNkcy?=
 =?utf-8?B?bjdmYU1QTURhNi9nTisrSHJqeklIbGZ6NWFaTmh2UDFDRHpzMXdxNkRzZlhN?=
 =?utf-8?B?b3RmRVVMMXhoMGlETUViUG5mRTVXVXU5YjM2MlhwWFBLU2pZSjJWaC9wQ3Rl?=
 =?utf-8?B?dnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFl2RTd1bVZjVnREaWJQSi80eWd6akhpcFp1Wi9WQXNqTzhvZ25aWXlicnVY?=
 =?utf-8?B?SFBDcURXZVBnTU9jeUsxSldWTEl6SVk4cktBRjVORXE2amMzSEdKb3hoektE?=
 =?utf-8?B?NndIQnVqRGxXeHY2OTRoYU14STVCL0dQM2VpZ3Rzbkp1OWpSSW5qQ1ZnWnU2?=
 =?utf-8?B?aVlydTQwNkZIQUkwUFdMbEFNWDI4Z2t6ME8xMWNBdUFpUE81NjMrbmo0OE9G?=
 =?utf-8?B?NWt5Rnh0N2V3aSt2TlU3QUJndWNRMU9rZTJBWU0wNTg3ZU5IREVvbHBHSXcy?=
 =?utf-8?B?VlhsR240aFVkRVhPZDBlc1JUKzZSK09ydU1Vc1kzYVVjOG5TYjNVVWVnekNJ?=
 =?utf-8?B?VDFVQzF1Vit6ajNiN3lLWnZPWTR1TXB1MmZCQk80V2N4REFCOVcyQkVQWXp1?=
 =?utf-8?B?Wm5Pb1owS3RyTTVwK2dJL3RSODRHaUZ5allmOTFXTW04MldOS2xtR0Vkanli?=
 =?utf-8?B?Z1JJZEFVRE1vUnEvNjI2dnBTeXNxb09UdGFjcmM1WVRLanljWXNQeFAzbnNP?=
 =?utf-8?B?SmV0OVh0ZGpDSGZDUlVOYVJUVnd0NkZNYmtNWElVSWh0NmhiekFYNjFrZ2Ro?=
 =?utf-8?B?M2xPOVJWSXVMckZDY29CS3NJM0drby9rVnptS3FNL3J1aGhXd1FGV3VkN1A2?=
 =?utf-8?B?dCsvcVNJRU1wZEVra1RVMlh2S0hCTFNWSTNqc1pmV1lQTjFOd0paYjFDRWYr?=
 =?utf-8?B?U3I5TTl0bGhIa1JxNGRVbHVHQW44SVFiZ0lEWDJCYjFINE9ETHVLM2xmZXlh?=
 =?utf-8?B?TXN1cUp2WTF3ZXlTcFdZc2l2WkFqNVlyWGcxUUV2OWNaTC9hUFBUM24xMUdw?=
 =?utf-8?B?QUFVUG50UTBaNnJVWERiV3ZRVEdvbjVrL1VNaXJpNndlNHpZT0xBaU44SUZN?=
 =?utf-8?B?TXpuRW5QTzNMM3ZXRWpWU3IzU2pCRllibmFpWE1WanlieFVBb0FEUlllNXAz?=
 =?utf-8?B?NWRkc09pS01KdnlqSHJTMmQ4bGtIRjZPd3c3TjlpSEp0M3ZZc2lGZGtKYm5Y?=
 =?utf-8?B?TFpiTmVlcnc3Q0FmL3Q1bFlLZ0YybzFCQ0oySHhqcjM4N3l3eExDU1ZvVzZQ?=
 =?utf-8?B?S2xPT3BNMFV5WVMzemJOM0J1K2J5RE5yZEpZTTZvd3lNOERNazlTZmc0V1pE?=
 =?utf-8?B?TC9EZFI1NVFmVS9oZmxMZzJJYXBpYzhlYjg4SzNWUzBVRW5lWGE3bWtVSUkx?=
 =?utf-8?B?RWlhcHlGMjV3dzc3dzN6NGxLYm9UUXFRZDlxazlwVjU4NkszYU1GeEpqbm5q?=
 =?utf-8?B?eUhENGFxVi9tbEtrb0xiTWl4Wk9JV0ZtZHZ5UGR5QS93TVdOQXRCRXRGNWh4?=
 =?utf-8?B?V0ltMHRUY1VXdVFFaDU1dGQ1UkYrY2RodjJlMlNyU211SUcvcS9TZFZibHAy?=
 =?utf-8?B?ekpTSjZYbTB3ZDJQajJlem5zL0ZjSjlmZFNaVENvc01oQnNzREVpOWZRY1E5?=
 =?utf-8?B?S1pFSE9aNTN4QngzdTJCOThTalB0dVBNN3NiYWNSamQxNVdZM1dCMWJpek9h?=
 =?utf-8?B?NTZMR1NocTBXbVh2S2wvYjBkc1ZGbFkraUZuUFQyWUJsb0JDdDdWUUNZaVNU?=
 =?utf-8?B?Z3FCNG5vTXIxVWNRQnJTYXd4aUpQSU00SkRzcWdHTVFNTEloOFp6cE43UlVh?=
 =?utf-8?B?K1FUWjdKSDhZSW9ydXdsNVE0N0hNWk0zaCsvdS9uOVcwS280ZW5CUUJDY0Zz?=
 =?utf-8?B?VGxrWXl3U05ERitPTDFIai9ldVFHbWVXQjhLRlFyQzVFOFpTWm5aVzc3WEQ3?=
 =?utf-8?B?Vk5nODduNEpwL21SaU1lUmdMWHpDTk05MzhqdnBiZXV2OGw2TGdvdkZ1SVNr?=
 =?utf-8?B?bDBwZ1VnbVZwcVBjWkZlZ1k0R3BIQTdPNmExd0FlelhiMldVTlZWMW15VkJP?=
 =?utf-8?B?aytZWWhqeENVQ0dZaUx3Z25WT25vTWl1aE1WS2txeVo0OFlnUVY2Tm9zVHFz?=
 =?utf-8?B?MUtEM2U4S1h6cSticlJxN3k0YlVnVXVOUHBNR1hQdlUzQ3RyN2l5ZFhxaHo4?=
 =?utf-8?B?aWJ5V08ycGtJV2JxR2pGekIyK1ByUlk3Mnp5bjBKVkE4anJ0OWh2RVRNTUpy?=
 =?utf-8?B?b0V2WVNzRDdOckI0RjlpdDY1cy9mUURRQ1RSODkvSXdydzg1YWJSWHlsSDBI?=
 =?utf-8?B?NENSMjhTWU9aWjF6R2tOQlBTcng4NWRQemNyZW5FaGZYU3BTMEF4V2NOVSt4?=
 =?utf-8?B?QzFEOHo1T3VNQyt0NmxOMVhiclA0bFBEQkovN29telBtcmlKYWN0SlhMK09a?=
 =?utf-8?B?d2xjQXpEaWdVeVVmREFZMFVxNDE5Y0RpTWNkeFlvOS9nYStUTzlBdEVnZlpy?=
 =?utf-8?B?QytHM3E2aTBRa1M3NEJmQkhuY1NJektuVUJQdSt5TVVNKyt6bkF6S3BMWnBw?=
 =?utf-8?Q?Qdhvq5lzxqmWpzFrjxxAdHaLPGEecmnzKvAVvKjxHDwMb?=
X-MS-Exchange-AntiSpam-MessageData-1: WbvvYf47NlakNA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd9041d-da68-4c6e-fde5-08de5921f877
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 19:19:17.3053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKPm/UuIML0vsiIDjer16vM1XcrJnoXGJKEhAFCKrB7Z5LdDrxjU6j5/EK8Bj6xo79vpnF42tnTkeubkROUqCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446



On 21/01/2026 15:30, Kartik Rajput wrote:
> Add support for the Tegra410 SoC, which has 4 I2C controllers. The
> controllers are feature-equivalent to Tegra264; only the register
> offsets differ.
> 
> Kartik Rajput (4):
>    i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
>    i2c: tegra: Move variant to tegra_i2c_hw_feature
>    i2c: tegra: Add logic to support different register offsets
>    i2c: tegra: Add support for Tegra410
> 
>   drivers/i2c/busses/i2c-tegra.c | 534 ++++++++++++++++++++++++---------
>   1 file changed, 395 insertions(+), 139 deletions(-)


Thanks for the updates. I am happy with this version, so ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers,
Jon

-- 
nvpublic

