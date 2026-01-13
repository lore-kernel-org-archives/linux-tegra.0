Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013001.outbound.protection.outlook.com [40.107.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25894283FCD;
	Tue, 13 Jan 2026 11:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304129; cv=fail; b=RD56tsks2UcAvU0ALO9wwRHfSErZ2Y+AGP7Ox76ZFt8DrPr9LUj2A+6hEaPU1cQ9PpTDUbYexmIcpnsnURN23T/dhJdWryp9u2nGHYJEUverNwPX9mrv1+fMGEiYFEBjfik59JYyhN6jet6X0Tmi2e9LXm/Gonn4oCXzNyBIhc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304129; c=relaxed/simple;
	bh=GKLNsLK3Aykzk7eA6+pr5yp/i8g/UgL5kjpshzQgMjA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QYgg7lqkQaXMg4GIdLzVHRLmN9FTImobDCWz5YgA4XkQrmOUzb0XNaC5tMW+sbFvEcVh5Alaom3npVfHYnJIHDcIiMvdBxWGSn3jvB2nb5AD4Phs/hZdbnusVMyLw39OMbZlZgTly5VN+J574BU1lblBvIPvEAsUWbPzF2z683w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aC+m14m5; arc=fail smtp.client-ip=40.107.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aC+m14m5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8DLe3B+ms73hRDnMtarX5eJPA80lgB/bbPjM3YgdWvh/jzZ/G38uhmupHJ5SAL0g7Ohu29R9CEmMo/1daXSKM8mqFXqDG0Rc2GjG6fWeBtzvK6sRYOwc9CrFOiS8IZZfxyhaiYgUyDroITtO27lc9B2yUp6LR6KuxVTiJbg1hQqzPrHwTWazgAQxr0LA9w9RAj7kV2XsuNrrVram9X0Ycc0HuZ5j/J4B+In/BFqzJ+Pn9LoVFRjtswkctQp94eyvitZ+kiAMQ9wGw4B4X9jTl7w12AplVE71aEopLBKdf5MejXdXrOkxsiCAFjdH6wb5xz2HDAOTprMYzJEoqEmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMDWD852+dF9qs/kMu3jAhQuwXlCR4/6K35U724fD2g=;
 b=aIIjjOw0a2iUZrAAlLnvWDkpAHyO0Nbqwh19zuCdX/Jpr5kePDPZmXWiHjf8HLGbKDxu+3g+H1D6ivdzdh/nCocoEu/CSv0znJNVGZjljghg3FX9Q+Gtc9RZSKARxitvAGXAw29DV9G0C0KqXgQhHFkjHn7LJUF2Ay5P/An+83bUoZSHuyKEA9GF6J/NhmgdVguGuHa6cEhnCP4bq5yX4U8Geymg7TLtl95oKtSmPYoHtoznYTuh+wAOquS9rJohSf3qVlMTn4GO5mpVHkO0xQbqIdrYel3TSV86eofLySZ8LG2QTCSnGtv/rmI7E29elOh10uxn05hu8f+YkIJZpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMDWD852+dF9qs/kMu3jAhQuwXlCR4/6K35U724fD2g=;
 b=aC+m14m5qvnKzERIcowSH6kRihjCM4xPYK1pw+fiMfNaDfC5zWHpdmPJaalGkFH3y4iZHMz67KGjIAfQc6RY87h4xqWWc5BWx8Xe90KjUEJsatVuZBuQ2P1i1YJMt8MNh4v8f+bcuH9V3Ja2MI3AbA+9MsAE1Dwr4fVtLggTTLrw0I30vlgd3ODwWv1NduLeOJ2nn+D2gAF/13Ym382mdZ38BFjsA3cwXPpcu8nyXl9JTKeIM75XDxJawneZGMZQ+4elKyIUHjFG0+7tn7wvqPIFSt1Rev9UuL+7rlmUBAFaFOOW632ekcJkj/euGhYkHRHcj98+RgXY3oRVbPjCjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SA1PR12MB7224.namprd12.prod.outlook.com (2603:10b6:806:2bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:35:22 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:35:22 +0000
Message-ID: <e9f18b0d-6462-43e7-955f-45337914b321@nvidia.com>
Date: Tue, 13 Jan 2026 11:35:18 +0000
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
X-ClientProxiedBy: CH0PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:610:32::32) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SA1PR12MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: ca79e03b-e4d9-4b1d-2c04-08de5297d693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFNQLzJITVRacWlkbDVCcFcyZUdQU0ZBdllzUUFxdlMyM2xCZDBaenpxSGxr?=
 =?utf-8?B?S0lBUHJjZm5pOVk5OEZrZWw4M04rUCtvWUs3eGRFd2cvd09hcXVmdmIySXlo?=
 =?utf-8?B?MnZ5NHJpOVprRS9xOXJTdlJ4T0Z4c3hhK1V2NS84dlRvUk9iNU13RXdGbVVj?=
 =?utf-8?B?Uk1UN00rS3Z4UFZLVkdERFVHRlJNbmlMRXQwM09aM01OZisydGJrMnpDeEF6?=
 =?utf-8?B?UXN5N0hNNW1Rc0NvTHR4NVoyM0tHMlN6OUVlSFVwSVJaNWVtWHJxV0tQMHV5?=
 =?utf-8?B?b3ZBd1VFWDN2UEJyK0orc1pMY3ZneDB6TWZueC95MEM2SlFmckE2SVczZkZC?=
 =?utf-8?B?Yi9DbGREVFl5ZEVjUFYvVEFtb04rNlFuellTeG1qd3pXSCtuaFRLeGtvaXdP?=
 =?utf-8?B?SlVuUFVyclE2UWlqT25QSFc3cmZCRVRCZW04dmJnNU1mT2t1MkNrSU8vYXdI?=
 =?utf-8?B?NW5QWm93L2hKcWZHakhIbGxaNDhKaDVKdVRhbmU4WHZkd29jR00rN0ZoUklT?=
 =?utf-8?B?TWxRUGdFUjBmdy9zY05vaTdsdmdIRWo2K3c1NUhYVm1IaThMVU1Yd0tWSFo0?=
 =?utf-8?B?cm03QzgyOENjek1GR0N0Qk96MXlvcXY0QUJGcUEwK1d1N2M3ZWdnYTMreUd6?=
 =?utf-8?B?Q1J4d1YwMHZZQlVla2dLaVVTK2VlSTFHYzVaN011a0IyNCtMOHpHUS93a3Rh?=
 =?utf-8?B?VTY5SC9uQWQ1SzZCdXhDNHRJbGt6TEJweFhqZ2kwOHpQUXBlWHQzYWxwcnNX?=
 =?utf-8?B?dDU0RTB3bldZanVSYnk3TEhEakNYSWIxT3IxbVRNMXpIRUhLc09hUk1oejg1?=
 =?utf-8?B?TW1sL2Eya2dRUkp0SW9XeGJjbFVPTXZyd1ZjSFMydHkyOXVsTXdtclBkb0ZY?=
 =?utf-8?B?UElOaStmSUhibEhNQmhmMU5tMStNM3Riend5Z3dhNDlUd3R0RFd1V0Y1azNJ?=
 =?utf-8?B?eXcxOExnbHBvazBDbmtveUFFMGYzWUU2Y3d0MUVRMWJvbzcvbnBwYXpGZ3Rr?=
 =?utf-8?B?elE4RnhQb1BjQ1dZMEl6U0pITVJQVlByNitHdDlhcmkyL0wzMWs5bXAycnI3?=
 =?utf-8?B?T044VDhLcDkxSVc4R2RNZFZoOGxSUGJWSThpMUM1TG0yVkowcW1XbWpHQnc2?=
 =?utf-8?B?RXNMbXpiMU1CcXJRSnk2N3kvTCtmS3NudXEvWnpMbHNaUFYvblNZRTJ6Wmlh?=
 =?utf-8?B?VVRMNE40NFpEZG5MVmhkZTh4NmVKQ1R6ZFBCYWFVUlQvcWJoOEN2dDNMaTRo?=
 =?utf-8?B?eVNzUXpNT1dWZFRGTjJ5ZWoyaTJnV3cvdHNTdjJRaStXemVlR2haem5kVW9m?=
 =?utf-8?B?L1RodzNIQmlMQUh1amRDK2FKMS8wck0rM21YWVB1MldXQkpEeXF6Y0xZQ2JG?=
 =?utf-8?B?SS82VnBkeHQxNnE2TGt3aWgveFYwaC9YYXVOdFoxZWFoZW4ydGFZcnV6RWVE?=
 =?utf-8?B?REdyczByb09QQ00yNUdxMjdNa0txWi9UT0R6a3cwSGJOMlFUOGtUUmFwc1N4?=
 =?utf-8?B?WnN2UlMvdDZiY0g3aHM4NzAwRnllRzNWL2kybEpYYlB1UkVqeDUwVHdnem5s?=
 =?utf-8?B?cExsbmk1eWl6cmViT01TemNaT3NvRGNVUXV3SzQ1VUE0UExSQ1lOem1wME5x?=
 =?utf-8?B?YUs0aDRBUlFzT0U1QXBHT1B0L0NPZWhwNWhjcjJ5a2plaXVQVGUrZ1hBV0JQ?=
 =?utf-8?B?OFZVOWNIZFowa2tXRzJtOUZob0dzSnJJYkozYVp2TnN2ekhFVnNReU1XK3NG?=
 =?utf-8?B?RWdPUUk0VWhIWjVlemhZdVZkaXVnS2pPRys3bzJNeTF2aGxlbFFIWE9UMXdN?=
 =?utf-8?B?T243eXV3T2lOVGZRNnJRK2l6ZWRZTHR5VW94eE9uOFY3VkFiazFqODRvOG94?=
 =?utf-8?B?Z1RTbmZ3ciswcFdZOVJsS3pkT2VtOFVtV2VHdS9XU0dBOEdXOGtpSkpOMDAy?=
 =?utf-8?B?QUs1eVB3WnVYOXRiOXJpWDlNWTlsRy9JVmxwN2FYNHZXZS9BM3NyUHNOL3c2?=
 =?utf-8?Q?FQpKOF9J+8Icta4mRntrXUBpfv8zHc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R095Z2c2NW5GL0JMYStmclByS3FPVi80bThVVlZydDJhdjZaNUpsaWFQTC9t?=
 =?utf-8?B?OFpwamIvVks1U3FMTVpmRlhydkN3YXN3bnBNb3pTc2VxVmVxeU95d2hlcEtX?=
 =?utf-8?B?OURZZVNualFVRXdHaUZabEh0dTZ5MFBUOHE4TEVrMEl5ejFXWi9xY0hHV3NC?=
 =?utf-8?B?aytIM0VwOVlPK3dFK05VdFd5N2szeS9yRUdNRTVSbnR3cWtvVzJ1Tk43MXJx?=
 =?utf-8?B?TzFaS0FLM3NjNVgzZTk2ZGtiRllXYnpodnRJdmdMa2JsM09HbmdwalE0S1ZN?=
 =?utf-8?B?WXliVm9PWnZ5endTZk5SWUZXdjZqc1ZQdWhUbVRpdDZlczZRdGZPb0tiRTRi?=
 =?utf-8?B?cEtFbENmZGVwSU5xWi9MWFFHdjFVL0tOcE5RUllHcFo5MWUyOWdWREhIcFll?=
 =?utf-8?B?SGRrZitIVG9FLyt2MENKckpvelNmRnpFdTVqdk9xZHVkV3hjRlhuVDZBb0dP?=
 =?utf-8?B?eVh2emg5YXlVWFlHQkYzTFcyWFNjWjlUNGg2bHRycDMydVRpUzJDZTd1VXBD?=
 =?utf-8?B?eXlkS0ROYm1uV3YrUFVSRlM3d3pTcEYrWjZnYmEzT2ZxNE5FQng3aUl0Si9U?=
 =?utf-8?B?aVA3Z1JkQm5iSnIyVzZwOUZtR29pRU05MlJmWHpFZDhBWms0MG4vQ25zK1dP?=
 =?utf-8?B?NFlkVEt6UW54Sm9hT1NVRFArMEtkbU5YcWF6WFJTeXhEbkU5ZnBYVHUxTVFk?=
 =?utf-8?B?QS9raUd5cDdLRVF4NVZqaWJibHZzQUU0ZGJnaHVXTFFrYmN2cERZSnVZWFA3?=
 =?utf-8?B?TjlJUTZKMFMwNkZKK1ZWekNwRlZTaUlsNDh6SDR1OFJPYWZ6c3hBb1VPaVhW?=
 =?utf-8?B?Nzh5V2xvbGlLMjhNSzRzc20yUkY4Ym00VlJtRjdWeXF4S3cwZ2IwNmxKVkow?=
 =?utf-8?B?akFLTU5uUitDUkdFczNxQzkxSFlTZDlKSWNWZ2FHanBPbGtlb0hWUmxzZ2hp?=
 =?utf-8?B?VmNTUEFHQ0gvVytmaFo1Q3dhRVcyUncyUmFHeG43TktkRVFDZzJwTVo1bGIx?=
 =?utf-8?B?bTlHL1dCU3diY1hRckVhMTRaWkUxdFkvM2l1Y0RTdnM4N2lZcXN3ZkIzSkJ3?=
 =?utf-8?B?NE90cnZ1WWtUTXRGalJjcC95VDREYlp2NFh2K0pMbUtVa1pOM1hDMVBLYVBh?=
 =?utf-8?B?dmNEVDVzWmJ1Q0g3TVRvU2ROWEhNK3l2MnNFWjVIWUo2cHU0a3V0WVRCTEZj?=
 =?utf-8?B?NTAwZlg2WDdtUGFaK08wcHByNHRqcFBEcEpJMlcwTnBmM1A0dWttZkI5NTQy?=
 =?utf-8?B?V3FZbVBQTmVzSWhhRUwybmVFbjRHVWF1ejlySXdMMHBzR1VPcWZQeW9QVmVl?=
 =?utf-8?B?L0ZDUGIzY3lsU0dIREJVZGM2NzZvWGt2cmtGeEV4TFVtMk50UHIzeUxjUlRs?=
 =?utf-8?B?QmMzVUJRYnVBNkdYbUV6a1dvZ2M5RnIvUkhMTStOd1BEeUhnWnBMTjQ0dldq?=
 =?utf-8?B?OElFM08yb1JwNHdKWDVrQnlucFhhQWtQUUYyZlFyZy9oakdRbFNseDh3NDZW?=
 =?utf-8?B?aFBGUW1NcG81ME8ydHNad2JkaFZrQ2E2S0lmNkNKUnBuNlliR0pZU2EySmNH?=
 =?utf-8?B?cEZZdFdEOGhwM0ZNNVQ1VVZhWHNTRGdDbnVwMlR2NURRZzVhMlNYanVGTHFC?=
 =?utf-8?B?MjBHeFNSQ1YwUmRzb1M2VmJsZlVyY2VBaXdvblVVR3N5MDVBNjJob2xGWEpQ?=
 =?utf-8?B?TlNhM2Z0anpZR3JtKzV1RlloekpLaXdLOU0rYmVWcFlyRitQR1NJYkp6WWFx?=
 =?utf-8?B?VWZFRnJPaGgwK2czVktJVW5FMTJ5VEZ3eVFJOGl1TllHTUx6Sjk0M2R3VFhT?=
 =?utf-8?B?V3dscmZpbmdXeG1qWkFDOUFVZnZPeUFWcE1rWTgxTGJlVlU1WWl0UjRIeUxi?=
 =?utf-8?B?SWwxdVFkT29pVjJqSmE0cnZhbzVlMldrYUVCS0NhcDVxMkhhTHcvbzdlcUdV?=
 =?utf-8?B?R0Vwa0VMMm9YaG9rZGNrcXZMTEZUTzV1Mjlia1VJWEM2RTZUL2IrQkc4dXRF?=
 =?utf-8?B?d2lKNWNTbmpwTklsTHZPU2RBczZvanZ5R213TVVaMnJyZ1g0TW1Vamc0cUtX?=
 =?utf-8?B?RVA5anMxcjNwc1RjNHpDODRnWk5KUW5FMzhWSmRCSWg3YUliemZTbEYvazVS?=
 =?utf-8?B?NlRhZ2ZJNk53bDhObldKcGZiS0hFWTJRbmk0Zzh5REVvd2tBNGJzWjZwcmx1?=
 =?utf-8?B?bldBRGtkaGxodTRVaG1MK2xWbllYZlpPU1YxTXcvWG9rNGtreW9Gb0l4ZzJU?=
 =?utf-8?B?YSs2Z3VQQTQ2c3R0K28raGFhQW9SNnNHc0Mvdk1BTnRwbUJMN1h4RDdGelZr?=
 =?utf-8?B?ZGxuMmNOOVhLVUMyNnZmTEhzbXd5Vk1DS254My9zU0F0VlZnNWd5Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca79e03b-e4d9-4b1d-2c04-08de5297d693
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:35:22.7757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgU1Ag1WYX8xWSaxUpGsJP8TGUhavVSsEAXoWKJXDSKEpQjw9uA7Sm4i+Pd/r8naK4vjlK315fftifr5vVDsLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7224


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
> 
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


This patch is causing the following build error today with -next ...

   MODPOST Module.symvers
ERROR: modpost: "tegra_xusb_usb2_port_wait_role_none" 
[drivers/usb/host/xhci-tegra.ko] undefined!

The above function symbol needs to be exported.

Jon

-- 
nvpublic

