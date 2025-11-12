Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5874A35;
	Wed, 12 Nov 2025 06:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762928301; cv=fail; b=TA//76rzOwanTNQk+74PYW9r19De7K5yAduR0lSH82jpbVewDz5ZYwQn6oJgU78af/MNKShZdjKVtGftsfI32r074OS/FAmHyFHR492QNmEY7glSyciS29DMXDDQ+DI0xb3J8v3mrBYDn0D6hTQJkyD+E7jIL4XTnVMR4MMsIdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762928301; c=relaxed/simple;
	bh=vogN1Ku59iqvVA9rQcUJWPfAd8JQ4Xo1gJu5IS0EzAk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lj4+r0eofZ166FWqqojB+9QerfoNm92xPWXVy7YPIs3StmFonhcfVDn8cF98JPv4ivhhZQp2R+wShy6OmcOKQizdr9X4yk8bqeQd8aXtzF5zkGiSOMzPHrokSP82MbNX/VHsqy4cDNcFQSqR+RNEw0piLxLp/HkECp6A58iLCq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oa9dFKKc; arc=fail smtp.client-ip=40.93.198.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oa9dFKKc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmVkq0gSWZHRTtK/Wega5rsZftNtns6D7ElQ9hLpTTAidUHX/YZokMtL6YNWlpaQUzn27ETAOW83vjNitiGvxWC8zfuSnpFPj10OhxGi6ffeJOpfbkLc12WLmBm/oul7Y2pltqtYWt/Ph1O9VLZ6eRLDU5WikPG8sM2vmpC/G18s2Qd48cHYAoaKdpkkowAGZqPWcGwAGsJJ3az/Kb39hFKWqyd+Ms8KtHiWiG/g7KUVeavflevZMH/OfMw9618c1qwsVyYwG/ezTcTjZRAVoORXwOOjZB4FrD+0GkPkiCYQ8XDna5SnsXDT7Q8cdyMJE5l2oZBY+BK9Rjd4kaKsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMft4+ZfJOT2Fe0/4nxXT8eqgc58tARbw8gYkH2ePeg=;
 b=H4341AXyqu43x9H24z6zJ+ht3MhDXYbQ3NGTfzlKhKuux2pa+gyWVfIM3WZDjObPypYsD0ndzBT2DVj1Jyo75h1t4PvMYEj+ePmnXBXvK1edATEQayzgKT8gyrVshzXrQvOCVEAyuHlUGR8fNkYwRmxdivX6mJVyWUkaUdCylo9J2P72IpS6i1Pd8Rml1omkyif7G97dHD+T5XC/uKIJEubQSkEmVOInk+WkyrK8idvDv/thmhZEbiS4z8tvH2o9ds9dzIkcGnfheONrgtOayU7olLnxQEfh9zjPxMxj//1YdmlOCAcwk+TRAspbKrEumOzLzY1Rr3a18PjeoagLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMft4+ZfJOT2Fe0/4nxXT8eqgc58tARbw8gYkH2ePeg=;
 b=oa9dFKKcMY/CNcsTKtHapaC4fcejfblkoGtVJdXGqA7vv3sr2Jyw3nj7UnHtOsJ7JgPx40HeDbFO2bc+oXaNTDDMMpC1ijy2IK06+V3Qj6rosWnpg86seJ35Td23A26gf4wGOepT3NyShfffU7mn15+FR1wbuFf23dKmLVq2Mk/Bd/Z/mD148HNa/M8MwBvEe0pCgTabzE6ya85geMi3QSLlSf/MW1A/dvAHO/2U37OiP+Ypoj9c5lSopKQMjRtGB8zXYx96EWsJMo5KYx6pOI9l1SwcRWTcpBYaSuhMqZe4VAKY4o9yI8H6sy8mYNEVg6etrXWUQQxk7STUzDBljA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 06:18:15 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 06:18:15 +0000
Message-ID: <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
Date: Wed, 12 Nov 2025 06:18:08 +0000
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
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0284.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: b146d06c-dbc9-4273-37f6-08de21b343d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cytja3JuckI4Wmp2YmZKbGlwNXNxeHFkRUtoUlJSTm14cnl3UWYyaDFxSFNN?=
 =?utf-8?B?NEY5a1FkSUs5enpKSWFaZVYvOU9hUkU4Vkh0YU8xbitpQm8zQUs0QkhsTzJG?=
 =?utf-8?B?VUx3ZHBENnMvVlRMaXViRks3cklzaENJK0o0dmM5T3V5dVJCTkZ1T1ZvZ0Yy?=
 =?utf-8?B?R1JFTnNyV0ZDbm9RN2hZeVFJTEVYazF1cVdnUStKSUpYanhhQ2xJMFdDUnFi?=
 =?utf-8?B?c3dRdXo0UjdLbFM3YUVFbE5LTnJUT1VZVlRCMzljc09qZXkwV1hMTCtEWEo5?=
 =?utf-8?B?T3I1VVp3d3RXY1MvNEI0Zk5nTGlydFozRHRtWlhTeXEzckttR2RzV0ZIOWZr?=
 =?utf-8?B?NzN0NGswTzU3cEM2dmVEZWRUL1gwRlVwRDhMVVhEeVArRWNWeUkxbCtEcFhU?=
 =?utf-8?B?TlEwbnVzYlFqb2lMbURYYVRwdmVWS0hUenNtU3NDNUgwSFlHWFI3aElKNy9r?=
 =?utf-8?B?bVlWZVQ1N1BMamxPZ2FxTEo5ZVVtMElkaHBPU0xYZGk3SzNrTHJhNG1qVmNO?=
 =?utf-8?B?enVBRzVacGR0OW9ZRzFWZ1h6WHUrSE14MUxobjN6VitYc0lqYmg0aVdNaFdn?=
 =?utf-8?B?WHlOQjZmM0pablNYSFRVSFdNb0ttVWJOdHpLdXprcnh3eU9rYTZGdGxiUTJV?=
 =?utf-8?B?NHRrc2ZRdVRXNVE0NXh2aG1od2dkclF5bm00cW1vQStaNEI1c1N2eFBLRzVy?=
 =?utf-8?B?K0UxL0trTnlXRWgwWVBPS2tkUm91UTFJeG11bWhFUHV5Q0p6NHl0Y1M3ek0y?=
 =?utf-8?B?TVpsNnlVZzNuZmJFdlRrd0dUV3RDOXF6N1FJdC9FYmNUcFJtbXlwdWpydmth?=
 =?utf-8?B?UXlXc3JtUjNNK0hRUjlJTWM1cmNhQWdCOGRPMnlaYzhXa0d6RFNiVGZvN1dv?=
 =?utf-8?B?YXpHdWZEdE5ZKzlEeExPQlNha1lKM3V3UmNzcXY0ZUYvdloyR2taK0VBcG1Q?=
 =?utf-8?B?ZzZscTR2VDdSSUhhenJranFSNmVha1ZTczFhWUtJODM0Q01TVXZENlczUktC?=
 =?utf-8?B?TXFXQzN4a0cxanRVTHhUYWxMVU4xRFloekd0bTFRVzdoSytTRkVtaXdibmtX?=
 =?utf-8?B?UzNYaC9BT09qWmNNdG9WWXczTVd0emxSeHljV2VGSnJWM1dRdjdFUGFDV1Ry?=
 =?utf-8?B?bFlHRWg0b0ZrdmlWdXZsUTRURjQvaU80SGFVbFg3UnBZZ2J6dVlKNTl6MDEz?=
 =?utf-8?B?UEVsQkwwTFpzcCtzTHdSZkN2THROTlhqcGFLcUFRSFd6Y0hDSlhmQ09jdFI4?=
 =?utf-8?B?R1k3dlc4QTVad0hBd1J0a2JhNDJyazhMUTJFeElIVURJTjNSNE02U091cW1q?=
 =?utf-8?B?V0R1ZzZ4SDJ1QVQvLzhvejlyRTNjT2VWVHJqdk9pTmdtOWlDODUvdHZnMWcy?=
 =?utf-8?B?aG9SZURFZ25ScVJUbVY0WTZYQWZ2UU9KSTZJbEhXLzJCN0RpcW50QkxaSmtl?=
 =?utf-8?B?WEZyZk9sSmhUYnptQ2JrUHN4a21YMStwZmY5Wkt1eGVmMDVjV0tqVDFRWklF?=
 =?utf-8?B?NUZ4S2xJMVRmcTlpYTg0VVg3NFNWekZVYk1iZE4vREY4MjBmWUZ1K1kwMDRq?=
 =?utf-8?B?dEM2M0NZWlFFYkVJaFRGL0Qrb2RBNmh4N241YVF2aUQ4ZHQ3R0VoazJ4SkEx?=
 =?utf-8?B?bkNhMSszNmU1UVVPQ1VOOVhxTGhYMHdoVy8rdmt6Q1pBOWp4RjBjUEJBOE9l?=
 =?utf-8?B?dnJzQ0s4Sy93cWNHVUIyRm1yOFVhWlMrRVpkbkVPVHJJeWUwNUxGeHZmWDNP?=
 =?utf-8?B?TjJ5ekFWcUZ0MnprSzJNbG1wTDk4b0VpTUE3U2ttdVhtdnRJSVc1NWwyZG5w?=
 =?utf-8?B?YlEraTRlZzZWMysxYUpCd0p0bkxUaEFEalVmdmlBL0hieGVFbUc0VmYydmZS?=
 =?utf-8?B?eTNrRnFEWXBKdStLcFBJYnB2UmNWaEZFZHhGcnZvK1RZZ3pRcVJjWmpSNVFo?=
 =?utf-8?Q?L+PTTus85FCK0t7PvR5MmquY6+mhXePq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXJORW00eUhYb1FwbTVWcU5xUE5UR0RhZks5bUNrYkdQd1IydHJtMkJHWmNW?=
 =?utf-8?B?Skc4cHJLc2UyVExUY29zS1hCZExNZ2tXREUyRklmSVdzSGlwSUhmQ28wUEZ2?=
 =?utf-8?B?K0pJT1NZcHRmMmhtNm9lZjVQajNBZHFYZ3M2c2pnZ0FDRVR4OEpTUG14QTdu?=
 =?utf-8?B?ZlZMenNDQzZvSlcyRE5Ua0wyYTNSSHo2WmNQN1p2N2IwOS9pQXc0Yzh1NHdD?=
 =?utf-8?B?dW0zRXJpTkdGYW9QZEUrbTduVks0WW8wa1RVd1dQdkVQNWFwSWhrRnplRWZR?=
 =?utf-8?B?UU1qU25maml5V1ZvdFNabWRvMDFHZE5QbkVYV2VVWHBINGtRdGMyYXdMYU9j?=
 =?utf-8?B?TFp4V3hhc2pFWFh5NUFZbDkvS0diYjljaFI5TnRVNzhkZm1SUWVWdmpEa2VV?=
 =?utf-8?B?cVpqeEhTRERJZWRCQ2x0Qm0xem1GaFc5ZDJBZmdtVGNWcG1pVnpLMDNJRlRI?=
 =?utf-8?B?U3FsVGdqUmVrNDVDM2Q2UWZtY1ZoRjBDaC9vNTRGNjB4akQxbkhjNkp2WUpQ?=
 =?utf-8?B?YTlGOWhyaGtNaEo3Y1ZtZGdxMlVDQTlvczRrUUIxMzFGREF3SFNodVBEMEc2?=
 =?utf-8?B?YW1jVXFMM0pUbXg3WHNnUVVtSWUrbVNyNHVBUENPYXh5cVd5dHc1bHVkbjNT?=
 =?utf-8?B?RUVkeFAvU003K0NmV09UYTFMbE9ENGlBOGFGQTU5TVhtVDB3WWwrWlA0RUor?=
 =?utf-8?B?azhFZHVBanp6WG1NaFlhSXFVOU1lWVovb1NVWk9jTkdWOVlERHl4ZHZjcWFF?=
 =?utf-8?B?Wk9Mb2JtMjFTSmhuWGMvcm9JZnlmUkhzemgxcVoyVkUwekZWY1BOTSs2OVpl?=
 =?utf-8?B?dk51dUEraVo0bkVacDdoU3V4aHlwQzhPa2lscmM3TXJrVkwyQjF4SHZyV3Vp?=
 =?utf-8?B?YkhaMWk2K1o5RVRCRzZ6OGlFS0FERWVTVFBVZzJGdHl6WmdtektGMEpjOS93?=
 =?utf-8?B?SnNBNkt2eHg0U3AyZEVpM29LOGV4NzhjTXdHSVVzSlFhWE90ZmowQjVMMGRO?=
 =?utf-8?B?bGdKdHZFak9jbkhVQU5XcjBhWkFHQkZYWXB3MGdYSkYwSDVLRFhnTHJOcFJP?=
 =?utf-8?B?d0I5dmlhK3lBQkVlSXBVNFg1TEZUdVBZUVVIQy9pVkljdkpMRU10RDYxYU5W?=
 =?utf-8?B?Q0oxdDhySEliRCtOc3dROXRBVUROaVpvNFo5U2p3MDROU0NJN2F5T1FlU3hR?=
 =?utf-8?B?aWk3bFNWaGpLc1l4WTA5RHlLYW9ZWjlxdWFNYjR2bjh5aWhxSHdxTGFYbzd6?=
 =?utf-8?B?dktwcGtwaElmdy9wV2R4UzNKS0dKaE9iNG9Ja0RoUGNCVTNSV2d3ODdGOHhK?=
 =?utf-8?B?Yjh5dnBVNEJMYlM4d1NiOTBGSUdNZU1HR09yNTF4TFlUQXVRcER0YW9FVmR5?=
 =?utf-8?B?S2U4UGgySjJUbytBRnZaOFpUMWJUbDdCTnRIRzBDSktaK0huSDFVOEd2Uldz?=
 =?utf-8?B?TDJHMmhlZm9YTXZ5RTZqQzQ4REJNSUp2V1NjK09HY1BvRjU2MmM1WkxyWE9r?=
 =?utf-8?B?WTkrRTJST21hZUpvZ2JwaExDMG9mbjZSaVg3QmdUWjUzVEpuZ1JuaDhFUEZC?=
 =?utf-8?B?TGtTblFLRWd1VDBOVkpVdmNWU1V4eWZvT3VjSGFtQmlTaHoyeGRnTDZXam1q?=
 =?utf-8?B?TUJUUlJEdTVDS0kvNHBrWVFMdnRsLzI4a045b2xQZXdJOTZOOTlXb3JzekZG?=
 =?utf-8?B?NHZhQWQwQTZzczNoelpYYk1PWXlQNmNBektaOEpyVklMdk5VSi9BMWhtSzZZ?=
 =?utf-8?B?SlJSRWJ0bHFHak54emNZQ1YwekxveGN0UU9MTkwvdWg3RTVrdVovQlhkcjA5?=
 =?utf-8?B?dTRsdXI5NHZyaTM1c3NkUGRnRitxMkNyci93MHFUUWMzK0YvQzJmL3ZldHBj?=
 =?utf-8?B?ZnhtNmhZK0J6RVkrWXRyZi9vNGRQV1RYQzVLcXkrNTRGSW1GQnNtUzRXNTVw?=
 =?utf-8?B?Q0djT0FPbm43R0NCUGMwQXIvc3V3WHFuaHBiV3FTeHhBS2xycEdvdmVVZGdZ?=
 =?utf-8?B?WEttQnBEbE5WMUpNUmdtNHFSdjE5SVkxUmVRWC9PbHVNNzdJeXNZcGxHZ1JK?=
 =?utf-8?B?S09vYmNodnRRREJZYWNRK3Q3ZUllTnFhQnF1YnZiVDlLQ2c4V2lLd1QxbFZX?=
 =?utf-8?B?ZlNpOVhybkYweHd2SWl2WWhOdEFrM003ZjQ5eXZGRXhKbDY4NXF6eERSSHJK?=
 =?utf-8?Q?9xsDHm1x8li+hCKptv2g9YibkNCAN73GBxDX3ewACkfH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b146d06c-dbc9-4273-37f6-08de21b343d0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 06:18:15.6406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fz/tGHlauKzjnB3aTCY2QiRb0975/8WjLgtsUutBV1qevmfDtdDJ0IN3K0V0c0+iaRDWM8KYQ0KeEwoMrisP0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144


On 11/11/2025 23:17, Aaron Kling wrote:

...

> Alright, I think I've got the picture of what's going on now. The
> standard arm64 defconfig enables the t194 pcie driver as a module. And
> my simple busybox ramdisk that I use for mainline regression testing
> isn't loading any modules. If I set the pcie driver to built-in, I
> replicate the issue. And I don't see the issue on my normal use case,
> because I have the dt changes as well.
> 
> So it appears that the pcie driver submits icc bandwidth. And without
> cpufreq submitting bandwidth as well, the emc driver gets a very low
> number and thus sets a very low emc freq. The question becomes... what
> to do about it? If the related dt changes were submitted to
> linux-next, everything should fall into place. And I'm not sure where
> this falls on the severity scale since it doesn't full out break boot
> or prevent operation.

Where are the related DT changes? If we can get these into -next and 
lined up to be merged for v6.19, then that is fine. However, we should 
not merge this for v6.19 without the DT changes.

I will also talk with Thierry to see if he has any concerns about users 
seeing slow performance if they don't have an up-to-date DTB.

Is there any easy way to detect if the DTB has he necessary properties 
to enable ICC scaling?

Jon

-- 
nvpublic

