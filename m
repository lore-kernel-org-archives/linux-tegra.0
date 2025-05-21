Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346C1459EA;
	Wed, 21 May 2025 05:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747805130; cv=fail; b=dTII/fWOsFqSBFXziegmk0okIsJQxgtZRHov7AaThem9d0/K9h+JZbMXKvnNlBSR9JtrpNYCMRuF4IbytLzcvxJJGpO/Y/zBEwczNPcC5fkov9fWmLQtu3Fm7uubc+vieKni7Q3yEaOvI4HHTEhUBHnygv3gPomt1ftpDQWrTjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747805130; c=relaxed/simple;
	bh=c/45To8vvvC8eiBdMMlLsqT/fhn6x6o7UxmaoKIFPdA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X8+ef2i6DPEy8vWAeEKr2hyHdaDQRDZcmNVw2oNcHlRSpUjKMOzwavWLwADX4f+y/rsbsTnwmnGKCm/RYysjW7IoUGk48rv1Cxjy1EEmXVJDODpsbYKa/l7nChBTplXpbkmhZuZxMIBtJXXQtvK9j3gWT+XBVAPMJbmWhSI/wCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XnFvW6No; arc=fail smtp.client-ip=40.107.244.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XnFvW6No"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKp7QpUR4oQV71A9/ltA6rsjv6INUyKtEIp02+9MVMlKIUsB1o0SeWNPHz6Isv99kLLybtjRL9936vcyHGIIK9/GPhgFNQpjuB0O5hsfPzR2FAPTJKgDZiGeTCwZc8LKrkuDyiu2JANYSC1G0fUN/LYuFvWb80Vrq9Z7utB1VlQhNeCo5UwM/gwNQOHZIkgc0u61i6PbMTiK/GiLqo0ILTzLOMyJqXCNHl8kyOqYWj9X0xB2IggGeaYeshXHWGX2ijMuKf7pv228wIgtkQm//Ko+KcE4UHh9lzKFlTihvQoxgnvOYMScj1ep6jRGZKEdo5qHQIAfDX/jLiQTB8tUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITIxVvtEzE/eMw/W8sfGSNWLhwC0M//VZREgUWnKVgE=;
 b=h6fD0/mzWt6sNpJEHdK3gX3IWzeG4kkZSeBvitR+Zr7D/SycS1AZoPIrBtdg6dXVdn+LFhWAAHG6k6ir7mdj5LT4TDBaO4czWCDXcQr9jGTAhjxAcy37XtzIN1G5TMZRqU8v1sWtoO1MG+zH++MHkHuYdNcz1cFhfr5fBgAYsbl3thYQxJe40F3x9oxayn594Q8UDmUOc27qm7zs4ih3PhNiCXDwMgxjONTdITK82Dp2Vv4DbCQJw9ZIXDKRNVmpj8ctyN64y1bT8YmsdzxzKzOWd8YVV8QlSCNIz9v51++4OPTiBFDlAQd5FKWNiwYCsnj/t6KGhUf/l1aWpPSNFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITIxVvtEzE/eMw/W8sfGSNWLhwC0M//VZREgUWnKVgE=;
 b=XnFvW6NoRrX41Ydkxi8ZWdjJQd7R9sPdMSZqFar1wiU+fiGeimaFV1eJt9Y1/vbVaIhpmufjgoLpLSVTtM3FY1cbtDMLrAjtM6KfKdzo1vKRE4YGSCdn0cr4AZ+EyS+irImE7einK+fXgEvyS7ZDnG6Mbky2+jg67YdiaRvk/42fitAPCZKL+o9j9JJq1NHI2ULr2/ufr91/Q9P7d5pAuZoLwtnat8urBxebxE5Now+IoM81GgeOLeBvReoOs726xoX8MEvcZ/w7eYGEDLyQIon7HoYJSEq5viEMAWnhisjL0nTyGysEEpFoTJSpBIRfuooNYcLj71IHg2/gSEY8lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 by BL1PR12MB5898.namprd12.prod.outlook.com (2603:10b6:208:396::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 21 May
 2025 05:25:26 +0000
Received: from BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923]) by BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923%2]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 05:25:26 +0000
Message-ID: <b9884fbe-bdc7-489b-b4e6-981121333707@nvidia.com>
Date: Wed, 21 May 2025 10:55:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com
References: <20250408083022.3671283-1-sheetal@nvidia.com>
 <9694bc9c-4ad0-46c2-8626-e569734f2e47@nvidia.com>
 <ed48f3cf-077d-4b42-ba0a-ba35d849d4dd@linux.intel.com>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <ed48f3cf-077d-4b42-ba0a-ba35d849d4dd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::6) To BL3PR12MB6473.namprd12.prod.outlook.com
 (2603:10b6:208:3b9::16)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6473:EE_|BL1PR12MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fbb1fd-6134-45bf-da77-08dd9827e468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1J2elpOZFAyTmgrc2xmT3lWcElLMjBTRW9rNGQwcFRvWU5zQ1FqdTRxNmdx?=
 =?utf-8?B?bmxVSWFoZkxsdHoyZXcvelNrZHF4aXBaNUJIRHl2WVVselN4VGlhVjR2MGVi?=
 =?utf-8?B?eGJyTlBIT0ZwVFJucUY0aW5WTFNMWDRSSjloMXR4TlJKajdjVnVHb0tqUUFn?=
 =?utf-8?B?SUpqUHBZa2hpV1M0R1dzUWNWZHUydTg0TmtmQ0NDa1U0b0xZVjBic0srWDF3?=
 =?utf-8?B?djg1eDU1alpWV2pRenFGMlB6M0NlVE5uRytqZGpkVWFtTHM0UW80NlRoaERJ?=
 =?utf-8?B?RG9jbVQ0ZWtQYndOTW1GMytmSG9UVmdOb04wQ09wTFo5cnhqbHZ0bTBja1Nv?=
 =?utf-8?B?YWl0dytZcEYrZmdrUEwyblB2MWx3SHRqd2xtelNqOWpJaEROb3hIT2dqNWRo?=
 =?utf-8?B?SS91Rk8yaTBGcFpyMDdoM3dHbElVc2cxVW96aER0WVc4ZEl3SmtBVmZaN2ZG?=
 =?utf-8?B?MEt4OXYvOVJ1TWNXVlRVRVFNRmIyTkpmT3Q0TTNhZnB6Zk1CNmxKMXEyR2Ry?=
 =?utf-8?B?Unlac0pyVDF5VEc0K3RUR2d1dEsxcmI1bHhpM3ByNXBiWEtWeUFHQWVZSlJz?=
 =?utf-8?B?WFdoa29EeEN3L2ZZRVpycTl0dFhqaUlTTEpMdWZ1WWtMMjZ2MjNaUXh4dktO?=
 =?utf-8?B?SHVuUkEzOUZHKysrdmtuT2J6Z3UvT0JrK1NHNWtwclNTNjFYUTUvaitaZlRS?=
 =?utf-8?B?ZnU5LzNmR3pLZGtONEJnd3JUWHhjL2VZbkJabUU2Wmo4Z05BeHVEV3VveHZB?=
 =?utf-8?B?ajZJUHFLWGhvcTk2ZHJzMTI5Qmh5RnZnaS9ucWlSdWNTL1FkYzJtalFKelo1?=
 =?utf-8?B?Y0FIaWRJNDNzczBkRUFpN1hWMjZxV1hoK2oxU1FBdW5odEFOUldwaTJldC9R?=
 =?utf-8?B?aHM5azBaSEVpNUlac1haTHlRa0tvbVdRRWpCZWVaUlZqNGFQWjhiRkphSE42?=
 =?utf-8?B?bGZ1eisrZmR4OHNTK3RtVWh1ZTEwVGJ4VGFiUFROVzBHM080YlMvS2ZkNHVJ?=
 =?utf-8?B?U2VOazZMYUVES3J4dlF4U2I1YjBtNy94YVBPbkNKbWVDVGhhS05FVzV1ZUp5?=
 =?utf-8?B?VG5XNndyeEZLbGZGSUExbUt6RlFUWFk5b1U1M09oeHhpUGUzK1hGWWViRUI3?=
 =?utf-8?B?emdxQ0k1YUdTK3ZSVlRJQUJBOFJLWW9zMDlKVzBUQmRwZ01UeUZSU3lCcnVS?=
 =?utf-8?B?SWxsREc0aWc2T05meWtJT1hXbUJrZng5WFpWUHd4VHcrbDJNZDVEWVNCdVVm?=
 =?utf-8?B?UUdvS3Jzek95MFErRDlkY0lqYSt2cU9XTSswS0Z1Q2VGWlNFVllsaHJJRDRD?=
 =?utf-8?B?bVJueThxZ3h1T3N0eUUxOGx3VllORVhmeXpYNVVIUkNBRHFBZ0syRmNWWEda?=
 =?utf-8?B?VEZFNXBrdllzYitMSUVPYW5Ed0NlMXJsYUVGWlVJMW1Hc1VxaGQ2aWhsaDNQ?=
 =?utf-8?B?MkdCYmFKR05LUUZLSmxHZmtQRE1Tb1BsRG4waFhmK3lZMllsRVA5NGl1RjQv?=
 =?utf-8?B?am1sb2dJd0o1aWdvZWc2clNiZkRPRnFDaGlEMXNLVUVsTWVBZyt2a1dnN1FY?=
 =?utf-8?B?Y3RMeTFKQVR5T0lHZ1lyeXVoSkJ3SFBuM2FSdGZvckV2NS9KdkJ6d3J5ekx1?=
 =?utf-8?B?WnBCMTdkRWp3d0lOK2ZtWmdDMitMNlFQdVVFSlRYM1N2bWNVMnpuVlRXT0dI?=
 =?utf-8?B?SHZINVh0RHI5ZHFNNW1HdUVOUFFCUjAzRDN1K3NscFhzM1ZoSWFGNzhSUUFh?=
 =?utf-8?B?elZUNHE4WGR2TERuZkMrMlBPUUw4RUxyOUIyRHh3QURuOU5LRnVxU1JYL3Yw?=
 =?utf-8?B?N3VxSDV1RGY0OXJRajNLbnV1Q1V3VmlFdjhkdU1EMEhEMlAyYTkxVnl6NG5z?=
 =?utf-8?B?a1RraDhsRXVaYkVtSFRrQTdvVXMzY3hKeFBSL0Zzdmt2QVRSR3JPaUdQVUtZ?=
 =?utf-8?Q?zjKf87vAUFk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHNYdUdvK2tpRUM2dEFoY1FJSW1VbnMrdkprcVpHVzJXMUR2V250blQ2Y0Ro?=
 =?utf-8?B?aGpUNzZSVmdCQUVjajFyNnFQaGd6TXZQVitmc2hNSVBTbzFpTEhVeG1lUFZz?=
 =?utf-8?B?SExxYmREY1Y0ZHRSSlhFWGZMemhVdDVXcUxMSW5FZ2pod1Zadm5Xc2ZtUDRv?=
 =?utf-8?B?dFhLWTBwNmpuMm5taFhnSkRkWXJRZkkzUFBlOE9RbU5BNk9SZ0xGSHlBMzNP?=
 =?utf-8?B?V1paa0FESkZlRzFpeUVzYUgxS1VMUUw3OGxaQW1ZWE9YMTBpSzJQT2g3cTRj?=
 =?utf-8?B?eTdkSndEV2NFVW5pZTJITGZoWkxsTm1qWmMydWxEVWpLV3YwdmdvMTRpUzRy?=
 =?utf-8?B?dGsvK3lodlNWUjRGMnlQN085RkVZV1dKZHBueGxIUkR3V3Z2K3ZSWXhxc1dF?=
 =?utf-8?B?eHVaSk5SU0lJYmxWaUVnS0xrMmVET0RnRFpjUEdmQ1d0VU4reGJjY0NjcTlo?=
 =?utf-8?B?VVhMQ2wxWWJJY25TdTRoOWtXcWJoY3pRR3JKMEhweWtoTmRCYnNmc0hhN1Fm?=
 =?utf-8?B?K3JkZXZvajJpdEE3NDAyV2FYSkQ3UFYzR3RCRjY5RkYyV3JWTTJlY0xRS2RL?=
 =?utf-8?B?amlvOUllT3hSd0dtK05ZczhPWDFJUTY3NkQwQ1BuOWNLQ1M3OVMvQUNlYzRW?=
 =?utf-8?B?ck4vQ3NvUmhHclJRSXN2bEJBTzZ3NmJ3eTE1UHB0WTZ0VHU0dFFoQTNScG1C?=
 =?utf-8?B?cktkYWxVUDZ2WFlEMWJuc1ltMDRCcUlobFdac0VKVjZxdFBOVmZMSEdFRUJn?=
 =?utf-8?B?aDNCRGtRKzh2QVdCWWpmYThsODh4bG0yWWw4ZWdtVDdoU1h4VVVlR2dOTGlL?=
 =?utf-8?B?Qlh5Q3VJS3ZyVmdkMVl6cHE0bVhsRndpSzFPWTRpd1BtanpQK3hkWDJPZGF5?=
 =?utf-8?B?SGhnVFhXSGJjOUhUUlNvSllUTU9XbDF5YU1vVzFKUXlaWjZjMEFtRHQxVGp3?=
 =?utf-8?B?eng5bUlBMlNUekYwR3VPS1FING9zNHJSSFFRdmY3aEtOdWZWRTNIQTFkc3lP?=
 =?utf-8?B?MHZzMWdsVkZtT1pMTG81TjNhYkhqS1NiOHlwNzdhTHlrVnZxZVNYTjJYZ1Js?=
 =?utf-8?B?aFFNdzF5a2hzVTAwZzRJK1BITFd4djNSVFNuOTJNRW50SG5Kd1JiNnhQd0Fh?=
 =?utf-8?B?cnk3aHlMY3MrVXdRZnFVT2l0cVB1TGN3TFV1RFExLzZLK2RVRHZzSHVFUEov?=
 =?utf-8?B?czYzQzZOZEl2bnlHZDZ2V1RSV242TFA1TVVnbGpFYXBKTnBSdjByUi84aWRQ?=
 =?utf-8?B?dTQvWERpUU1HMll0cDMrZFZTcUVpZkMzTHQxOHcxSGJMZzcwUHlsVW1LV1Ur?=
 =?utf-8?B?a3RzcC8rWFFqTmt4enc0Znh6MEVqK0U4TFkrUVpIYlJzdThCSWpRTnE5SHBw?=
 =?utf-8?B?NVJCUVBGMGlUOGxZZlNxUVFzMWpPaEhqcVJlOG9xd1VIVFlMK1BvcjZhbmlK?=
 =?utf-8?B?c00xWVBMMGlqSDFyQ2xaRXBFNkYxL3QrTFZVL1Z0dzJTclJDRGFMeVlEd3Bj?=
 =?utf-8?B?dHQ5MDZkUXhpN3F6ZFpNOXRZaWp3MDdRUmNydHg1MGVDTXNybHVYOE9KaXBB?=
 =?utf-8?B?NzJOWGs0cU91QmEvVXNaR0x4Y1psbkFSTUNJU2RTTFlPZXRyL3U3UzNUUG9p?=
 =?utf-8?B?YmdMeGkxcTVCUkhFTEJOcGRzdElDbWNtVERyRXUvZnNMLzZlYTZBMDlOc0dK?=
 =?utf-8?B?bEEyMTMvVlkzVFFsWmVWRkNtVFhlNkpuZFZwdExFV0hSM2F0b28wckxZbUZi?=
 =?utf-8?B?N1JUWjczNXFhTGpuN3dLNVM5dHpVbXRkUWN1aDhqNCt1VHlSQU5ZcjVUeW1X?=
 =?utf-8?B?Qkowa3ZWZlY0VDcrSDAzNlFDMkZKc1ZJZmRxcm9OcmRBbXc5eW40VCs2Sk1U?=
 =?utf-8?B?Sm5sa3RzSmJXZGIwS0YrcU11cmhESDhOZE5rVHVZY3VKWlI3R2tFa3MvMncx?=
 =?utf-8?B?RlhEajBpVXZENlh1Y3NaSVhaL2JMSmJDSDkvRnNCRHQ5T0lLUE5oQkZ4elR4?=
 =?utf-8?B?bmErUks3RVZ1b1ZhU0l4SkZqTCtpSFJJeDc1NDZSR0REY1JGKzNoY0pvSVJz?=
 =?utf-8?B?ZnAwMHFkQjBoMjJTMG92ZFJ4NmZrWTRheUpGdXNBYXVoSmhhK2lLeGNaMFJu?=
 =?utf-8?Q?Ws38k4RV1g2xB2LUavp7yH/JZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fbb1fd-6134-45bf-da77-08dd9827e468
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 05:25:26.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlxGl1b1QNWruqFDhxj/lSVI7eTliWl3YvdIp30vJcAY+nyOYg1P7DP+t7tol8OaIgEN+DAc6SgGu0B6GiVC4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5898



On 13-05-2025 11:45, Péter Ujfalusi wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 12/05/2025 15:01, Sameer Pujar wrote:
>>
>>
>>
>> On 08-04-2025 14:00, Sheetal . wrote:
>>> From: Sheetal <sheetal@nvidia.com>
>>>
>>> The hw_params() function for BE DAI was being called multiple times due
>>> to an unnecessary SND_SOC_DPCM_STATE_HW_PARAMS state check.
>>>
>>> Remove the redundant state check to ensure hw_params() is called only
>>> once
>>> per BE DAI configuration.
>>>
>>> Signed-off-by: Sheetal <sheetal@nvidia.com>
>>> ---
>>> Changes in v2:
>>> - Update commit message as its not a fix.
>>> - Marked as RFC patch as it requires feedback from other users
>>>     perspective as well.
>>> - The patch is being sent separately as other patch is not RFC.
>>>
>>>    sound/soc/soc-pcm.c | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>>> index d7f6d3a6d312..c73be27c4ecb 100644
>>> --- a/sound/soc/soc-pcm.c
>>> +++ b/sound/soc/soc-pcm.c
>>> @@ -2123,7 +2123,6 @@ int dpcm_be_dai_hw_params(struct
>>> snd_soc_pcm_runtime *fe, int stream)
>>>                continue;
>>>              if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
>>> -            (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
>>>                (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE))
>>>                continue;
>>>
>>
>> Reviewed-by: Sameer Pujar <spujar@nvidia.com>
>>
>>
>> Earlier Intel systems needed multiple hw_params() call and I am not sure
>> if that still holds good. Given https://lkml.org/lkml/2021/9/28/1267, it
>> would be good to get feedback from Intel and I have added few people
>> based on the earlier discussion.
> 
> Picked the patch to run it through our CI:
> https://github.com/thesofproject/linux/pull/5414

Please share feedback or comments if any.

> 
> --
> Péter
> 

