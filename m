Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D8E26980E;
	Fri, 10 Oct 2025 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760111547; cv=fail; b=s1io+k6WCIrSXXCxjwBrCfeQhxjEV8DOjxdM3obYaplDPrxM7wcssX9b7qHMIKLqc5cYkUiokIQhLCdaMzjb8ZQA5FGEhb/wNu4rZgAMsHFABwvhp5aFu+pJi1psDTD0VedCIabFepA9OXt28eoq1C27tCVnlsOLjaviggc395A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760111547; c=relaxed/simple;
	bh=luZx4mjZxMzpyYs8N2UWZyDYdLFND2mBWMsvGZtKoKM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DE2sPDzLUHYV8M5BJqQfTySP1S+MKE8W5l9WRd22fH9dm1aScmiHYUnjrDJZLg3ENiSrkdAGMWfLWF61XictyP5K50xLTvFSySc7cWWWCEY3k3/MATQMBa9An+OgQ2hPcjB72KYHUlnu9/tkzOsdScUiVVGcRo9rk62PJVuMyF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kf3dOGnq; arc=fail smtp.client-ip=52.101.61.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kf3dOGnq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wI/+Ondvs4rcVVZ2XFSMV9nU9Pr+1/OtxJBI/vcNK46g2gr8HYQqIPZ46TFGf3Alee0x0vVpUNDDrMgMfQGm6rMibBuRibOnf3z97y+Exdk4ZNWBR8g7aXf51zbiLx6rt8MVWuLdPxupGoe6isb8/mlq+hhFK7AJYhcuRnCZaSZ0v/hLKC+j9kXJWaxr3aFHDUERZVTp7dum2aA4qjw8nje+wlwknJLd4AjKbXmHOcFQIV6Weyawjdc4dC+u9t24gt0rxUjPRXsQsvYOMsMCQ6KqvFl347/dOk7TVaB/uCFWTEG1Si5D34fscOOlt9QFqDaIly7TN8CMYbUn8BjYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky721EbQnFVr5+xwC1LUGhIlvtYIq61Mlzk0lbQIF9o=;
 b=ZGU/5mFxUssmyI5ckwIIN2h9Jnx/RK1n5FnyVs7LhnXJSD815kLM/eqJq7X1g3LCIckMTmD8tG/8K88QXbcqDhnp61vY39m5MUNXd/iiXtjGi34mX9PHflrZRn4feknOUVUKvWjwOGBGmZqYc4i8IblwyRqiKj5WwTHmjEk8R1al8iUaJoO3nsGptUiKTyHFI4/PEwwb923t/PVdTTWWuYwKtMnk79W24pEaJ3NkzZUay3PegvwhfDgicC2MwpBITlgJo3bvOwFVvDAQ0PbuVdwFkDqZIgvzCABTUzc3cJuDgjDl6RfJ7x+BhZjjbehgiZB9Z7xlJhQS2CvAoPb6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ky721EbQnFVr5+xwC1LUGhIlvtYIq61Mlzk0lbQIF9o=;
 b=kf3dOGnqZiYkEei9XZ8CQhm2BRJNeBAW0w17mV+gxU3qbnL5MTZBAq3I3hrbfuc0r2fJfu9xfhJv8mtwQwZckRY1fmz2CFQPxujii6kiYSHbGRxwcoSx43QmS7K2C0sAT80QVWU/TJDm6hT2RSSjxO/2H5nANiVeP/POc4aHULjtSZX5epv+EJBVdRu5JRASuv26B4jb+R0LlhQ0SMiydQpXJKmIUuk8HAfM2wvquvRDf8ulZyc7ZdFLAkCsQVHrJeME1DJwbvfsxm/FMnN1hhOjCy/9/R8xsNixDkLj8Hdl7vSOBandUOWGd2hpN/hCWevEnmYQNny+yazxAnBPlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA1PR12MB8238.namprd12.prod.outlook.com (2603:10b6:208:3f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 15:52:20 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 15:52:20 +0000
Message-ID: <b719e1ed-1c63-45eb-a6e8-31f590f3079a@nvidia.com>
Date: Fri, 10 Oct 2025 16:52:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: IRQ thread timeouts and affinity
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
 <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
 <86o6qgxayt.wl-maz@kernel.org> <86ms60x7w7.wl-maz@kernel.org>
 <us2hfdn7jpfepdmwk2p62w64p7xagaeoemg3hdt2vm54emtwlv@m6fkuti7hvfa>
 <86bjmeyh5m.wl-maz@kernel.org>
 <c7bb79c1-c760-4b44-97c3-86e1c34fff40@nvidia.com>
 <q2g5abyqniku2uxbjsndiwcidx5cqxbqaixcvdhkurupdnhu7q@pyhpxylwrtrs>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <q2g5abyqniku2uxbjsndiwcidx5cqxbqaixcvdhkurupdnhu7q@pyhpxylwrtrs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0212.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA1PR12MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b166d3-91c6-4800-e5fb-08de0814fefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anYrb3Q0eldUNHUvbkpBQlQ4eDk1cHlSaDVGdlJoZk1kQUMyTVZBbVEyWE1s?=
 =?utf-8?B?dVpPWTZLWTJ1RUhXWUxTaHhZVzd1dmFVMXpPSEtoTjBXa3RiUmpNMWZxYkpE?=
 =?utf-8?B?QnRBM0xHcGloQ0g0dnpRckhGRlBhM3NJakc0NnJldFF2cTR4WnBPbG9MbFpJ?=
 =?utf-8?B?SlRNN1dZaWJNNDRnTFcxaEFzS3U5WmxDSWtSZUlkNitqVHRERjJTeC9yeVQz?=
 =?utf-8?B?WFZCQ0o5K3BYMU9JTFNrQTBSNU5MUUV1QmtvcHB6ZWxVTnRPTEs4aWc4SUoy?=
 =?utf-8?B?UnRQd1M1bThTUmFPNEpNYnZOTlIrSzZRUVBaT3VCREpRdHYvS0dWdzdIOFNF?=
 =?utf-8?B?b2ZrTWIyeStlTjRpTzBXcDFsVW85R0djWHB6UTIxRGFkdldWczZaeVIzVFhq?=
 =?utf-8?B?cDQ2Unc2V0pYMjVJdjZwbFFOeFcwbHZjcE5DeXJ4OHhHSmxXdWNobFpjVHNN?=
 =?utf-8?B?V1ovN0FRb1A2UFB4Q3l6cGJBQ2h3eDd5KzI3dDM3bTR1TWxLaDcvYmRxS0xk?=
 =?utf-8?B?UitkL29SeG9ObHBBQWFHalVrUHRFdjl1VEY3eFkyRkhKeHRWc1gyWWJjQm5X?=
 =?utf-8?B?Yk8vZWVkWFB2RytLQ0ZGRzlTTFNGRFk4V2Ftdk1NWnkyN0JSOWEzUVJpemVm?=
 =?utf-8?B?b0wrd2ZpenEvdStDMC83cWU1Wk5GS1Nob0xkcHp1V1dpakthVGk3Z3g4d3dq?=
 =?utf-8?B?Q2xuYjNkQ2dDa0xDS1ZZdVlEWkhrU2FTZDI0ZlFnVnhKd05XSVBEZ2xFWDRQ?=
 =?utf-8?B?UkpSb0NPNzdKbDMwYlhVSWRLNTVubUR0eVBKU1dNUlNKMzg1aExjb1l6WUhK?=
 =?utf-8?B?STZPdGxGTmJuOGIzd2oyaUZuNWxjKzM2MlBGSGljNStPM0hwNFRkVGxYN09z?=
 =?utf-8?B?YjhqVUFsVXpkQ2Y5d2tPbGpFRnlzV3p4eXRUV0U3b05vNUxGVnJQd2lwVmN4?=
 =?utf-8?B?WFR4ckJXUHF5VnFpOGRtT2EzNFl2ZUFIdTgvcnNQMEtIUHBNSDJTV2RON3lJ?=
 =?utf-8?B?SjF2OEZIaCtja1I5MUdtTXpGVGw4V05IOTQ2VjZROGsweDdHbHRVUm9UWTNu?=
 =?utf-8?B?OHBtNFhKajJnNWg4SHFKMkwwNGRCWHdmZVV1bnBFcVNnUjdSWEtkcFRtN2Nz?=
 =?utf-8?B?ekY2SEhUWm0vYm1BSkZ1QjV6dW5qS3ZDVW9JVHhPWTZ3eklMRHFiWkY4dm5I?=
 =?utf-8?B?bnlCekdVN0V3cmNXVFBSSzFwTmg3Z2NxWElRci9kTFRnUS9PNGlpWDdkNi9H?=
 =?utf-8?B?RERFY04wd2diOFBBMzhXTmxjVk5xNm1jSEpNUnR6eDBHcTdrMzBJK0RLdGJr?=
 =?utf-8?B?RzlEVmwxaUs1UkhzelgrVUY5b3gwb2VHUFQzM3hmSHIrQnVvOHFZYXpPSFUw?=
 =?utf-8?B?aWVDM2hCVW1HS0cvZXZIRWp3VzduREt4UEVpQ3FHeWEzWjUxZ2psSDIraWpE?=
 =?utf-8?B?eWRqNG4yeFZDdEM5NUpmcituRjZVSnRzWnFWTHdoY256M1ZLRWhzSkNsSG9S?=
 =?utf-8?B?QnJXYU1vRzBYOEplakw3cmJXaDdvSG0rZDREOU12bGhpSE0zSVJSdW1mU1Rs?=
 =?utf-8?B?dElMMVpWWDhkSTkvL3JzL0w0SEVJbnc0TkVoRWR2VXM1SGo0cUgyNWlvSjVZ?=
 =?utf-8?B?QXFWeVZDV2VGeUxXbzEybllacnNsT1BOckhHR095QzIyc1VjZFZ1ZkN0TTdV?=
 =?utf-8?B?VlRMbUJhNmV6aHphRTZrTjh4R084QmFPZWtENDZIZE8wZ2tDam1XakNxTDZS?=
 =?utf-8?B?dnVyRXdpd0VBVEVOMUZ5Rjl0QVU3MWU0VHNTSW1sZFdyV3VTd2xZb2svMitS?=
 =?utf-8?B?MkNlLzZpbnVoWkgvNnNwSlNiNEl2Nk1hcWY2dU9QNDgwYzdkeDNQby9jRXlF?=
 =?utf-8?B?Nk9wM2J0SjRKblYwNTRlOFBtR1pYcVZwV2plUDRNVDQrcE9UaXZQMld6am04?=
 =?utf-8?Q?9s9mrpkeRC7NUq1uRFZSeI5qeJmpicFm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzJoY295OVMzeGdZOGNwRkhHZlBEWU1SVktNcm9QUnZLMUU4Z1FzT1o5Tzlu?=
 =?utf-8?B?dkZWeTJiakdoQ21Qa2dHcjhkU2s4Y0NRS1ZNc1hLc0dQZTEvdVBjTjE4dUFG?=
 =?utf-8?B?cE9uK0g4dit4NUNpSTdKTUc2YlJ2alVJSmljLzhBam1PWjgyMCtpT2wvRytE?=
 =?utf-8?B?OEFjOFJzNThYdXFqeDZaclVCRStqMm5oWHA5Y3JJMStMTnNUNGl3THV1WDdP?=
 =?utf-8?B?cmpZRHZDZ1VvQ0RKbEJ1L3JLb0RtRWwxWWo0VTRVNisvMS8yVFhwZ2FzbGRC?=
 =?utf-8?B?UUUyVEFBditLWWdZY2VocXBkV3NlOVNSYkxiMmJHbG9QNUVnYUxBMlluUFRr?=
 =?utf-8?B?WFBuK0tzN3JzOUJaWUNvWHRpZklNdjVTUlZYSkhNVUo5SDZzNTVUT0NKcHAw?=
 =?utf-8?B?RHptUVE4NnhubGpjakdCbThhKysvTHdGWDgrQ2JkcHNSejdHR2xpQTFsd0c5?=
 =?utf-8?B?STNzWmpKMmJVeS9ndDJZaTFsb3NNR3VBZlh6YWNCS1crMGxNb3hwblB2b3dM?=
 =?utf-8?B?UUIrMGtyZU9nWnBxRFQ1YU56ZFV1SmpaZnRDaGp2VnJJVDRnamlDcnlHTkhx?=
 =?utf-8?B?eW1rN1dMeUx6akg5eGgrN3JDZks4QnlQbHZmdHRSUmxKUExSMkJRbW5VVG5h?=
 =?utf-8?B?Q3lxaVpld0ZXNTNsZVRkaDd1a05XOWhKR1ZZQnNLeitCYU8xR0R3VWE1Q0Fu?=
 =?utf-8?B?UGVhNms4ZjlZK1VuZHdxd2p4Z1UzVjNmZGFxSXlMeGdna0xHUmZlcEFyN2JF?=
 =?utf-8?B?T2tvM2JDRVl1YnZpZFJqUEVqYWR4TXpiUFJwK0VOd2dnVWg0RjNFWk0ra1g5?=
 =?utf-8?B?VGpEUENmT1FuOE41WnBIeHpldzVHK3QrdTkxcklCdFVxYm4vdm1sWldDSVBS?=
 =?utf-8?B?bTJSRXVHeWJsTWdzT2dtOFdDLzlzRk81UGhDQ25oL2RCTVFTTjFGWFRVYVhP?=
 =?utf-8?B?cHNEMnAzT0g4U3BSbjR6U0Rra3h5cUxrc2pQWCtRcGdXQk1iL1VZQytoQ3pO?=
 =?utf-8?B?dnIwdzEzWmVVUHdOQTNjNEduNURvZ0NPZzVhb2djTnFUaHA3ajlkbzBNNjNm?=
 =?utf-8?B?NVZnbUdUdktwZG8xb2lTd211VExBK3pJWm96M3piVldzR2xGbS9PSGlaRzFY?=
 =?utf-8?B?MHNNc3ZlNTN4c2JDMFlsZmxLOHdWUDNxQ0dvNEkwZWpsWUE3Q3E4Sy91SEpS?=
 =?utf-8?B?WDF0OTZlN1ZhWTZ4eTBmN052SUREbllvenp4M2loMHplYzl0STJJVS9OTHUw?=
 =?utf-8?B?ZkxTcDMwVC9VRUh5b05RN3N6SmQ3bm12azNwNHV0S1ZrSlpxNzk4RUw3Vmxr?=
 =?utf-8?B?aG9KWC81eTBIR3k5SzZnMFZuOUZDYkdxcFRFTHlrVWpTMXRpeW9CbDlyWERh?=
 =?utf-8?B?aGZPMC9DUnRyOUxyWmFLSW4zVUdUelZVcnNUMGhEZzh6Q29LVTJXQlMzSCtu?=
 =?utf-8?B?UEFqeVVlU3pud3FLcnA4YlEycFlCcFhLZzN1V1N3QUdaZDYwU0NoWlVGQVpU?=
 =?utf-8?B?TGw4bXRnRmQ2cDZPUGJPbmtCL3MwOUpodXpoZkRaVWswMnkyNEJQeXd2a0ZY?=
 =?utf-8?B?RTV4VU1BZUFWNFB1ZkpRSkdNY0xhd0JETWlEUzA1RWZPUFBleVhwcDdqeDNy?=
 =?utf-8?B?NGxCLzRNYUV4aSsyY2J1UkZSZCtGMnpNWXR3S05vVzZtWllYc1BxRTV6aTA1?=
 =?utf-8?B?eVdxaVZIbDVQdzlHa1cvL2NvMCs4L084N1NaVWx6ZzZaK1VKUEgvZkNxSjFM?=
 =?utf-8?B?OXpva1pyMzVsK2pLMWlDeDVOT3FjSGlETTl5bFRQU1BVSkl6UjJUazlmU3VV?=
 =?utf-8?B?bXcvZys2dEdKOE5lTTdER1ZDK2QvNFM0cVhtdys4YWNNZUJydjNWdkdNVDEz?=
 =?utf-8?B?bmhnaUlYRkllTU1qNVBGZCsvMjMyQjhHcFU3RE9sSWRaVlNCaHRMMzRFbktO?=
 =?utf-8?B?QWZqOXdiMnRlYkFzK0tqREl1NnNFQWlEdTRublhxSE45SmkyNHhneUVkUkxi?=
 =?utf-8?B?cFBmM0tNN0ZLUjFraXd6cTkvTFZ1VGNkZVY1TVVxL0lCWWphK1c5ZnVCSndy?=
 =?utf-8?B?Q3hId0lLaDU4b3loczNPNGg3TEdQS1Y0TlJ1RmJ5dGxTTXlrNlZNVVZxTGVo?=
 =?utf-8?Q?vsYW6BjOXK+UsEdmMnrHhCR3x?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b166d3-91c6-4800-e5fb-08de0814fefe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 15:52:20.5480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMrcnl3KOxY38ScQRf+xtVwO0eEPhjE8SQRJikyrb4qYgK9RPzEocqtCnfN6yMUBWyr8ypRvjRIynto/HYCTgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8238


On 10/10/2025 15:54, Thierry Reding wrote:
> On Fri, Oct 10, 2025 at 03:38:59PM +0100, Jon Hunter wrote:
>>
>> On 10/10/2025 15:18, Marc Zyngier wrote:
>>
>> ...
>>
>>> CPU hotplug is the main area of concern, and I'm pretty sure it breaks
>>> this distribution mechanism (or the other way around). Another thing
>>> is that if firmware isn't aware that 1:N interrupts can (or should)
>>> wake-up a CPU from sleep, bad things will happen. Given that nobody
>>> uses 1:N, you can bet that any bit of privileged SW (TF-A,
>>> hypervisors) is likely to be buggy (I've already spotted bugs in KVM
>>> around this).
>>
>> Thierry, do we ever hotplug CPUs on this device? If not, I am wondering if
>> something like this, for now, could only be enabled for devices that don't
>> hotplug CPUs. Maybe tied to the kernel config (ie. CONFIG_HOTPLUG_CPU)? Just
>> a thought ...
> 
> I've only had limited exposure to this, so I don't know all of the use-
> cases. People can buy these devices and do anything they want with it,
> so I think we have to account for the general case.

Yes, but the point I was trying to make that you can prevent this from 
being used if CPU hotplug is enabled in the kernel and initially limit 
to configurations where this feature would/could be enabled. So you take 
CPU hotplug out of the equation (initially). Of course someone can hack 
the kernel and do what they want, but there is nothing you can do about 
that.

Jon

-- 
nvpublic

