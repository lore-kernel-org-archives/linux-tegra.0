Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A81A2853E0;
	Mon, 26 Jan 2026 06:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769410285; cv=fail; b=BCxE4PbimIj5n18Mb5ismCeLqkC/aa8FR/8mqCTTN9p9l8alDKo2mxa5gtt8iLEuYwl9guhT06xBJTLhOP0S7+t/mRWfCXDgtZ+8Mz42z2yHBqJRU+ih6E5LvhrKwpRG4jZBPZY9ADvV9z0FH4ZLVoK9V/BmxZk+8TTPD7C968o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769410285; c=relaxed/simple;
	bh=NmuqJoJcbaU6iYvEuOUB9Oo8dvD6uBZInNft5rdcXiA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ntky8cRBS5xAX6EHImbISCinlDisL6XjX7XMFOPOYfeIEkP0Z0dbtTeszVObVqdrQQKe4ombIkI035/YXpt0WIg/lMTzv9gaujQWlDSsrZdsCcgvnYUHxhX7VV6Asn5uBNo4OMyd8JPxMn2RDWrDvJbdBzIFq4evmwzhTviY/vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qSGlLd9D; arc=fail smtp.client-ip=40.107.208.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qSGlLd9D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVTgBTN+3ZlKROc+CMBUJzhy9RdSOCN0vIBsvdOSPhR5IvesDZMsaeB+pM4lEj0tHcWhyJR37i+0XXOYoBnsPZQdVX27h8QL8Ge+SbmVGnOJHdsRQ/iVGsm48uKkQpM+27q2pZ36nxZYL6XwJ2KX7rLb8ZWMI4BicLSzMKFyKhEoMjuF7CvlYTkMBF/zqTzwyCW9lyqE6iGg034g7oOKsJxuYiMZQOM9uUeMvk+nSnLgRjszUN9Uwki2Vhxcvoc7XzVVxdSURA5DxVi6fHaaFw1cJLFCvV/DIj1XR0QAfM371NqWf1Im3SZxoEOo3zEf0jFrysu+h1SNkHHw8AUMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhvrPnkZWPqiqz1TsSSD3PCckO6HUVXoH1nfZwiTukY=;
 b=giL27+Mva9ppf0M5SFCN3nU3cm1EUu3i4HQsz5j8OxHyRytF2lPx/AYOyaeQ2h7GLZyuHjBXjMuPa7MXar7j8M53M4kvzt3p7kEyhBTS44iiRBCqcsx8aGGr4rTqXi015lWmaIgWQw97pE4kOL+mchJ1lHY9lS6IJOd3oGFZp1OaiurXfwqxdRP7+57I8LrtDoVro2Itadr8v8HDg0j3lDfW3uzMIEN9kpm5oHDdIi++VGXP4P7V7X0PWRRJIho5USEU81jLHdflZixlu9K3bV4zoFlX1E+9+6rVVh6k5y9DET9/Ldx9ibmnMEYYK1/HbwJ/zZBciFSf87rn0tZ9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhvrPnkZWPqiqz1TsSSD3PCckO6HUVXoH1nfZwiTukY=;
 b=qSGlLd9DP6kG/mLUL67SattrvkpcRh72OaWJo380pzxVsRxoGwlZ6i2IDTZuSNmLuC7xmvRcQTCnsyHRL6JM1tNW5ShdUUvozDDjwSleGDPUj/SjuH1H626wJeQUsr+wvpElAYHuUSVx0cQ9Zsd0/WQxy/Cp4fdAwPtWoQXaJKmb/lzmk2cd5Oe25wXBsuYk9BQk85P3VNHwPaZCfQyEoH9rr0RiXF5dbcRAR7Ar0+zdmIRSL/dcmw9Ba9tb5f6Iv0dwY4uVQ0cki4zE4HZwN+/7sIXeM8j4s2kszlv88frXP0/6PIXWwE5NR5AIShR7fFxdlfM7TQbyd7i9wp+U4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB9152.namprd12.prod.outlook.com (2603:10b6:510:2ec::22)
 by SA1PR12MB9490.namprd12.prod.outlook.com (2603:10b6:806:45b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 06:51:22 +0000
Received: from PH7PR12MB9152.namprd12.prod.outlook.com
 ([fe80::fc7a:4d2b:7118:d39c]) by PH7PR12MB9152.namprd12.prod.outlook.com
 ([fe80::fc7a:4d2b:7118:d39c%5]) with mapi id 15.20.9499.004; Mon, 26 Jan 2026
 06:51:22 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Mon, 26 Jan 2026 15:50:43 +0900
Subject: [PATCH 2/2] memory: tegra30-emc: Fix dll_change check
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-fix-emc-dllchange-v1-2-47ad3bb63262@nvidia.com>
References: <20260126-fix-emc-dllchange-v1-0-47ad3bb63262@nvidia.com>
In-Reply-To: <20260126-fix-emc-dllchange-v1-0-47ad3bb63262@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB9152:EE_|SA1PR12MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 120735db-2680-4246-40dc-08de5ca750aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1FMMXZRMnV4U1lqbVUwSkhjSTIvNDlLenA2TTZoU3FSUVNvZ3Jpbm5JYVN6?=
 =?utf-8?B?aHNland0QytLdlpqYkNqVWpDMy9pbE1BZUVGdDlMZUg1ZXppSWhlbDV5RVAz?=
 =?utf-8?B?a21DNk5TVFBLNlRxOWF1SldjV2x0Y211aFZvcHNUcEw1WWJuQ1BTM2JyR2ds?=
 =?utf-8?B?WWVjWXVYc1c4YmhpanhkTkJNbzRlbnAwSi9iOWhOdEo4SUp6eTY3YUhpVnMw?=
 =?utf-8?B?QjZBeDA5Q1BKTm0vRE9MYm5SUllabG1BTExhV0FYcmdNcGI3Mmk5ZlpyR3pI?=
 =?utf-8?B?UFFWL3lQMmxFUkF1V0ZRV2c3ZkhVMk9Jd1ptWGFTOTE4N1NqWHBaU2xsejdP?=
 =?utf-8?B?WXA0M1R5QUpNOEJnNUxIeUdkbUFFL2ZTd0kreDhxMDVQUFYwVjk3eE9HRENU?=
 =?utf-8?B?VDlGQXJYdGd0NW9KUS8wdDhWWlpuaUo4R0l3VEhFRXdWZVNZeWxyS0pEYlQx?=
 =?utf-8?B?cWhEemxscnBGTFYvNHFTRUdZTnNzRy9EWkkxcXFNMG56UUZ5T2wrV3NsWlhs?=
 =?utf-8?B?WlZmQUhoOHo5MURUT3BQL2VJK3ViZ2tqMFZ1Zm11cDZlQ1Vjb1UwQ1pHaEdh?=
 =?utf-8?B?ZlNVbjVhV2pxbFpyRlhnRkxBMS90TzQ1eTI5R09kblR3NzFsSyt4M2VUdkh1?=
 =?utf-8?B?U05uL2xZd2ptT0N3cEFLNC9lYkw2Uk85MFRzRmMyb2dYV2cxMVUyNHZvZGFu?=
 =?utf-8?B?cFhHd09wNWhpL2hrU0VadVpTamx5SmNtS1MzMkkvMnVPQnRZcUhjTHhBcjZz?=
 =?utf-8?B?SkJLRVQwN0FiN09jOXpvQjB4S3hsU1BlWFBKM3c1REZqMGlPb0VWc0xNNTBF?=
 =?utf-8?B?akJqUGZFc3R3cnpRaXhQTFdVVTh1R1NwT05iQlhUSWEzdENwZWFad1dKSTh5?=
 =?utf-8?B?cGNERVFaT0pqQzhYNlJWTEIyNWNNMmowN0JtWVVKL0cybmJXaFFMTXFrbWVI?=
 =?utf-8?B?VWZHZ0syaGlGNlNPTGlBVEZkWXpUSEF5ZzNPWkxjM0ZxSGFocHBNSnNFd0Fj?=
 =?utf-8?B?RzJLSVdnMHdXZzJFTjJrZng2VGo4TXFFdG52K3NHakszVllid0lKNVc4eno5?=
 =?utf-8?B?QzE2VC9YeTVaQnFjZE1xaTFiNVR0bmhQa2NSUVk5VERQZVNLbFJSYTZJei9B?=
 =?utf-8?B?bXhzMG9INmxjRnhKMnluaUFVNC9PTFZOeFNBOERRdDlzZ3RtekpQWGZVYXha?=
 =?utf-8?B?QVU1cjROeURZa0VCZjN6Mm96NHdpbVJqQ0l4VGNKRG84WWZFdHRVRGFRcVZV?=
 =?utf-8?B?VFQ1OTNwTUxzY0R3WU1LQUN0SGl2R1djUU5vUmdjYVU3MVQvTmM5U05pYXo0?=
 =?utf-8?B?K1BYS0J5UHJUa2haK2ZGQzhPczB4aDA3dDE0OXhqSVhITW1KdmNQdUdOZ2RX?=
 =?utf-8?B?MDQyZlZ2NnI3UzVhZGNFNVZ1TWtGKzFSdzltekxHNm1GV2dBYnN2MGtBeHBi?=
 =?utf-8?B?WUxKRVp0Rk5nbzUzRUR5Z3RtYzgrd0ZMQ3N0bm0wci9pWWE2bkIwOTZYRGE2?=
 =?utf-8?B?czRZWWhja1hOeUozVGJoaVNNV0NHOVYwYlNRcmcrTzZERHo0NjA4YXNENE11?=
 =?utf-8?B?aUpGc2ZNTm11bTNOUHl5NHBsTHNOZWUrNit4RmRSR01nQ1BMQVZNSWlTY0hh?=
 =?utf-8?B?c2xRMEJvbDhhcmlEYWQwR3REVGJqNmRoL0J4dk9IdTE1MEpQaFBKanFiYUsr?=
 =?utf-8?B?ZnZNWXc0eWppcTlsdm11VVl4Z1VxdTZYekdtcG52VkY0N0JVTW44ODFHa3k1?=
 =?utf-8?B?YWsyNytOVUVYa2xTd21pUVNXaDZUZ3lPK2szV1k3Snd0VXRIVHZmRko0LzZH?=
 =?utf-8?B?TEdhWEFoeUdiazJMS0NwNEJrMU1hYWFrR2tWdm9RUnA3UHBBOEVZa2Nka2dP?=
 =?utf-8?B?SXpSRktPZGZiMGZSaytidFZzTjc4MFRDUklocFY3RUVWR0ZvamgwbU5UZFFT?=
 =?utf-8?B?dmRjQmVuUFRyYmpkc1JXU1VRMi9xOFZ6d1hpNmZBVUo4MTZiL2UwUnc0MWk0?=
 =?utf-8?B?TWpveU8zblJVaDZyV3BiT0VVVVJqMklDS0JQOVQxQ3Z2QVBlblZ4TjBmR1lH?=
 =?utf-8?B?SUkvZjRPb0JYc3RMQURZUXhVS2hqVU10OG45NVhGNy9FclBsNisyQ1JQcVN5?=
 =?utf-8?Q?JcMg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9152.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmtaWjV1TFo4bm9jVlNMNFBMV0IxcFRhUU9JM2V4aERYQnhJYWJTRlVLWk12?=
 =?utf-8?B?Q0dsKzlINWRLbGpObUxUTWdHK1V0RzFtUklDT3UwbUp5Ky9zcnI3WVdVeis3?=
 =?utf-8?B?WXk0S3h4R2FOeHJUdVI1REMxSmRVVkpmSWxNNkI4a2pnMmpROGcyTWhIT2kr?=
 =?utf-8?B?R0Y3c291NVdHTW4vbXpLd1VpZE1CVjh2QjQrR2FoUGN4YklGc01lUGdrbmxV?=
 =?utf-8?B?N2x1d3Y4QnRwV3VpRTBZSW1za1NFUkc0OWhEWllURFlyeTUvMXZLUUt5ZHZJ?=
 =?utf-8?B?QmovREd5dEJEcDBjQkdZK29HdGp4dElQSzNxa2UvZHFnR1BUMjV2R1Rud3ND?=
 =?utf-8?B?TENMbEtFWnMzUHV4OTBHTVgvVzFvOEZ4cDdYbitIU05ialZHWGV1K2ZlVFFa?=
 =?utf-8?B?azA5MmZWMW8vK2c0NEhaYTdaOFVBTkw3UThlUmMzTEtTeXVGVDdLSFhkWWQ1?=
 =?utf-8?B?Z1dSaFIyaVhwYTluUVFSYXVWOHlXZHA3WFBWMXRsRGhQcHhkWXA4dUJCYmVw?=
 =?utf-8?B?eWtpcHJmdXhnbGsvaUFwTVA4Rm9BVFVyM2NST1lvOVZVYTZVSDlTdk9UUWU1?=
 =?utf-8?B?RVVyNDIzQXhhc3JldTN2YzBzckpkRUJxQ1I2bGN5czA1OFh2K0F5TXN0QklX?=
 =?utf-8?B?a3psMnoxcWgzcE42b0ZOVk5uVmU0SXczajU4N2RSMUdDcjA5ZXJtS3Y2Tjl1?=
 =?utf-8?B?QllIUzNXWGpiWXNOQkJXUUo1K0hTcHZ0Sjd1QmpnSDN6VzhPSHVleFY4Z3gv?=
 =?utf-8?B?cDQ1aDlGdUdJd2VsaElzM3h2SnJZdGZLUDZva0JkRHRYOFhRVjFiN0JWaFF4?=
 =?utf-8?B?NEpVdjc1ZzZSUXcxL0wrM1NrR1h6Vng2SFpNSm5tamMwcjlYUzJqUFEwR211?=
 =?utf-8?B?dnJPd0FiYlhDTkl1VHRwVFBndk9zTGZZQ0JaeElkOXFza1hNM1lUalhhb2F2?=
 =?utf-8?B?UW1QRHVibnVGRFA1S3BHdml5N0xRNWVGRC9odzNkTXBSejBWaER5UHBjYWFm?=
 =?utf-8?B?V2pUdVNzbE4zbjluYTQ3WUNzR3R2dTNLQUpwRGVMaTRzMU0rNVZGMXgyM21k?=
 =?utf-8?B?OThCQkdWQ3RJd3FBM0V3Y0JWckY0aTRxSW96WWRaT056M3lReWxJdERYbi9p?=
 =?utf-8?B?UVVDSUczQ0JsQ3MrSm5JRm9SOHd6K0dndFJ1YXJMNWVrQzZYemx6WHY3VlFj?=
 =?utf-8?B?K3krcWVvRW5XNGJvazFUdko5bTcrTW83cndNeHlWamc0NVIrdG96OGppaFF1?=
 =?utf-8?B?Z0ZSQlgyZkk1Z1JPVHRmNjhSUEZzS3NXM2RoNGk1UXJ3eFpjTFZFUklGZVNU?=
 =?utf-8?B?eU5NajdKdnl4NWxsZ0JESDV6QXRzV1htbjFMNzEwNW9aRGxKTE03OE5ncWYv?=
 =?utf-8?B?Y29HYk9ubjZXaWc0dTdKcXQrQ3duSzNPcTFrdFFudytWUzB5blpqVkhPZGZy?=
 =?utf-8?B?cENsSXVtQUVpWTREaEZVU25ERTlkNFpkb3g5ZStLWlIxVmxTbHBJOTRLeVlY?=
 =?utf-8?B?RklVUDl1ME5nbjhiSWsrbmNPY1ZXRlZZcmt3US82TTVWUXB6emZ5RmhBSWM4?=
 =?utf-8?B?ZTF6UXBVQU9XY2FNZEY2elVhQkNkM0pSREdvTFVnY0U1Wk4zREtoZ1NRNkhO?=
 =?utf-8?B?SWkyNzRYaEJhWmRNR2xSajRab2ptamViMW5GSVBKNzUzL0RtVlVuT1owUUw1?=
 =?utf-8?B?VFdvMmxyUVc2QW53cGZ0Y0szUWNuNHBEekdHbTRBd3dkYUJZOFNSSWRMalpY?=
 =?utf-8?B?WHZyVzA0QWpJSFUrRDRuakUyNEtrNzIzYzFHNUdjT1Q0MDNRbElIWDhyNnFF?=
 =?utf-8?B?ZTVhTm5zUHVRSUJJU2ZPQlArUDNvM2hEZnk2d2c5TmwvdFIxaUo5Vkp4d3hj?=
 =?utf-8?B?TTJ0RjJFQWVSQnVOempBKzYxTHY3YjhOcFUxSzAxUFlXSEVFbzBFaHJaS2ww?=
 =?utf-8?B?NXdjWmc3c0E4QkpoRHdPa1V5R1hPT1ZrM1Y0Qk1INjlzVDBxVlNsTmNpMUJi?=
 =?utf-8?B?bXZuY3RvR1lQWkRlTW9ldkJaVmJIYXB6ODI0UExoSHhGMmtuQTI1NFF0Yk16?=
 =?utf-8?B?ZzAvMVlnaWpUWXJmbWxmaWZxcU5FQ3FvaWh1WGZ0VGV5TzlkSDdZYTU2aGxp?=
 =?utf-8?B?N0dKNU8zNlJSMTBndjFQaXFQb2pGbXFWd1NlWlNIamU5bkwySjM2czBHVjZs?=
 =?utf-8?B?SS9IelpWYU1Lajg0dThwU0N2TFRQeXFyMkZJdUl0UFM2bmdxZnBjSk8vdE9O?=
 =?utf-8?B?Si9xUTNTWmNlSW1ucHBWMGFYVnF5VWRzMmtSdjFxd3lkTzFrbkdLUTVraHZn?=
 =?utf-8?B?YUUxTmQyN1VBcDZad3RCYnZtbm5JSWxUU05rVDMyb0R5NGREeFByUVJMRHV1?=
 =?utf-8?Q?OOp+oSb3u62dZwUBzCEWb4trq/TRL1vuyJJ9ZwXGOUEbi?=
X-MS-Exchange-AntiSpam-MessageData-1: j2UaGuTF4fCDug==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120735db-2680-4246-40dc-08de5ca750aa
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 06:51:22.1421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urMZ5Guzc+TrmtjqVaN2I3K2wD/GaH1ncxoWYGcosm2TGM071/bk+cckG+C6sJ7JZ1tJkXF4n+surK3LWce/cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9490

The code checking whether the specified memory timing enables DLL
in the EMRS register was reversed. DLL is enabled if bit A0 is low.
Fix the check.

Fixes: e34212c75a68 ("memory: tegra: Introduce Tegra30 EMC driver")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/memory/tegra/tegra30-emc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 914116d8ec16..2c32d28156e0 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -554,14 +554,14 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 	emc->emc_cfg = readl_relaxed(emc->regs + EMC_CFG);
 	emc_dbg = readl_relaxed(emc->regs + EMC_DBG);
 
-	if (emc->dll_on == !!(timing->emc_mode_1 & 0x1))
+	if (emc->dll_on == !(timing->emc_mode_1 & 0x1))
 		dll_change = DLL_CHANGE_NONE;
-	else if (timing->emc_mode_1 & 0x1)
+	else if (!(timing->emc_mode_1 & 0x1))
 		dll_change = DLL_CHANGE_ON;
 	else
 		dll_change = DLL_CHANGE_OFF;
 
-	emc->dll_on = !!(timing->emc_mode_1 & 0x1);
+	emc->dll_on = !(timing->emc_mode_1 & 0x1);
 
 	if (timing->data[80] && !readl_relaxed(emc->regs + EMC_ZCAL_INTERVAL))
 		emc->zcal_long = true;

-- 
2.52.0

