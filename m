Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012005.outbound.protection.outlook.com [40.107.200.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8BC4D2EF4;
	Mon, 28 Sep 2026 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603479; cv=fail; b=jbIeo3+QvsF/GyaZ+nXz+pSvH3IqG8qYoWk2mOjUUiMA8hFh5tcFonH+z5gtde+VMCyNXm9fqvbyzYC8YMaHFp7wwX4JsuxGuWNvpGYy9I43wkn1B5mhx/fkJn+QNr7GuHKV5aX4EkQzKN+p0QPCNRGR69Q53lN2soDK10wUFME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603479; c=relaxed/simple;
	bh=O5ajjKlDOd1DaO7YanS4zg7Esn2nuLmIraPNTEBdWXo=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q8MwZjf+s9KgADXS3jPdzCESW2g4DIgWdPEZ0aFS5FAMr2BPo1rg875nJB5znbpApTmq3DituIAxIwf8PsAlEXpWAUHh6vHCj2ZUHsukT5OrPfi3s88toYkyoQyOdmcMZZTSsxGMItdnhIVrPqkmA7URUY3bIdNkmfhxG7cll1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IHzRKkRO; arc=fail smtp.client-ip=40.107.200.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IHzRKkRO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZNjNc8l+rqq7GJdf6MeNR5tFY8Ez/r9XihfLkxjSlCzj7pt/2K97fY1foNh3m5CQ+4g0w99Kt5q7KDXu9B61DJ8pE6eQ8DH0qJmVJLRvyUHFkfEQ7tb+YrnaO6Rtx1iOQf4EcRyCmSibbMRhqIkxLSEwrOi3meznGSCymHmlq3hl5mnJnrDxI6z9Ll6EbaHVMYpyhqEimZ35b40Tiruz8j/RTByrdT9/6WZEAKseYHtHPz7Liy3Nuueb0zOaDHUyRYic+GqWjFdx/pCJQGXpDTTCuxqKocfH8QUlyKyRPlw3/joaGCUnBGcufDyZT1fAdK0JecMVH+PI7wIDZcR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U/hKKZRrRw4rOo6Z6BeiXo33OorVON/Zk9rQWV7flk=;
 b=t6HR0qnktnZgivb+8NC3BZet2Yw80USKAO99wCGAAaIaP0HH6mtpkQ6k4oKP08lTBcaKTaRtKl5yNEG/zTQNOBTU6VA7PTGUijSE6OtDL+RhvRC8VmJqGJ2K0xzbUKwiS0UgWsjq0WAwZz4t/AcO3gxnCbDQKeeYo1ejILqF7k0gRytYZqjbig01ju3rSbg9FYLTjQHSkpbTQd1bEsIqE63MBZcwYKdkKA4wP1ZL/ht44l0tl7YcldDTD8xlhj/Wd3gmyR4Mmb13RfMK5aLKbSt24fyIEhpv/OQHq1qTxHs2mmuEBfI28nDW+L/xHyeD7t3TAhoiHvlvDUuMnhJaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6U/hKKZRrRw4rOo6Z6BeiXo33OorVON/Zk9rQWV7flk=;
 b=IHzRKkRO5OrWKWX0Cx2uQd428YeniF3/7XyQdPge41Rk+uapDes8w5l861DC85PkaOufYbBGL5tkSnes9LHzzKjURk70P9XWv6tnZm6NzBRBlvaKlSlm6JtCzLnwT4nQ4eK34xjJF+tn+AE/JS6Vie3siDWVWd8J9mBIQf92eKxNGYR9H/kv5m0znSJgv25Nxs23w1v118mXrx9loILTKNtP8bZhXlRnMB6U9kEmLN2JtlHIh2oS47WTRoWG0oOcGrfY8eUlnv7beiNkQChfTab61U7C8fObkfjd3snI0ShzKzXLAnvd0JSeqjPHCT1d8b+TilK5wbOMt737TGIVxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 13:51:11 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0451.014; Mon, 28 Sep 2026
 13:51:11 +0000
Message-ID: <b93e29fd-fc1b-46db-b8f6-f24a5e3d39ae@nvidia.com>
Date: Mon, 28 Sep 2026 14:51:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/4] phy: tegra: xusb: Add Tegra264 support
From: Jon Hunter <jonathanh@nvidia.com>
To: Wayne Chang <waynec@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
 JC Kuo <jckuo@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903071937.533646-1-waynec@nvidia.com>
 <f74e21be-c66a-4a26-8b32-389c2d118c02@nvidia.com>
Content-Language: en-US
In-Reply-To: <f74e21be-c66a-4a26-8b32-389c2d118c02@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::14) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbf3311-56e1-4841-5b54-08df1d678de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|7416014|1800799024|366016|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	z/6jOyXdIWTEfRhS6o9pYn7UvR7Weu9RBSyCN4DeGK4HELwovJ1LlZRR8MJHc0zr9JbqlTMccnncwIjDcvVkqec3erYsjPN1VfgKqOPowYDsImK/uniVsWwZpI2t5TMXXquh3/yAvQWYxH9xQg4XoAn7dGg6XgUkhPiv5ZGoHmmYQcwWMNQWyrBE1xoil8Bak7ML+m9WPRFTw/cef7oxBFVlC9rdcVUWf/ltqfNDG1eZtqwlwczpHcbM/4us4wX9OFSRJVhjtTL56pKj7ybOMZyEroxXho57FOuTFto+63dLmjF9rGYvowSEIbpXPm5y9v57VinBdeP2sG36jKhHvXlLkt1x7O3pBnRkM/IZqFrIvqh2/ulrydzZUUB0hvVDTx6HbJKD/8zyoogsPZaBnT0QK7B2sFaRp2JWRE0ekFLquXpV+zDmUULQ58TkIx6No2JnBIVutD1GWEe+MsiNDNzV+WvQGlmn89SQBQbWv0BJSnyAE5IFVzwQsOydnJZZRfTFDp3nktXOWZTtMTRv1Bm1DKGm1hWqGeSOybJuw/gslfZA5xyyJo+C1Lit1n64aqEb3eta/MUHT4dziunVBGyJjUaZk8tO0lyIwfGEQzFZ/rvJY2yCE1onuCbvbUtDnoz1+c4LQomrA0JVa0hilzYXbWTuSqs7JczLRH3GhAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(7416014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWNKak5VZDA0WGg0UGVaOUZSQXloZWh4QjJzL1pxbXpZbXorNU40ZFhYK3Ni?=
 =?utf-8?B?WU1tQVQrQ0pGTU0wdkVJbWRudTdscFNsTkY3bkJYeTdvQS9RTC9DY3dKRW9P?=
 =?utf-8?B?SmdhcFVQTVVvQWpVd0JZekdsY2swUlRHeDk3VzRJTmxGTDdLaXBJMUthU0FL?=
 =?utf-8?B?UEUxU3Y1NC9GKzFsc2lzR1JJajRxUCs3eDJZd0FsZkZkcDdHODRpcGZWWW1i?=
 =?utf-8?B?cU9uTUtDeDJlTERZMHBiMXY0SG40aVJOOW1nWVhXQjZhTUZoY3B3cG8wMHBj?=
 =?utf-8?B?YllzQndoQmUzd1ZqN0JnVnFxZ0l0cFo5eEcwbk1tWmFOekVFT05PZFVXQ0FZ?=
 =?utf-8?B?bWdKMWQxTFlXTnlYWmdMT1hYMW9WSmEwaHJNTS81cnRjT0RycnBpbTJaN3Mw?=
 =?utf-8?B?c01KSCtDdlBXOXV3dkFTK3FtcEovZ0VCYTM2SGVHT0NJSzhJK1NWTStHMCs0?=
 =?utf-8?B?WWYyaGJ2NmV0NjVMNU1HaUFYS3FOR05QaE9TdzFPNGxnVTZwVFZwcEtWYjVH?=
 =?utf-8?B?TVlLRmJ3SFhuYUFycFRNc2Z3ZmE2MHVvRlNSNS8zRXAzdGplZGYwcCtIeHd6?=
 =?utf-8?B?US93cWM4clVZU0VkL2dzZDlRR0o3eEtDRURBQy9BWitzUGJYcHJ2VFYwVm45?=
 =?utf-8?B?cEp5Ulh2bkRtRXFrOFdVTnM5NnVMZ3FqU1dzQnRWaDFxaEVXdWRnb1VweW1L?=
 =?utf-8?B?SjV1aDBoRER6UzBVRXRxTXEzNU9RRU13VkZQTGJzbHlnaXpOZmxmaHN2UmtX?=
 =?utf-8?B?RHF2WEtqUUFLWHQwZzZnd0RpVlFLbW5ibVE0b1JxSVR5ZnZGWXloU0VIK0FM?=
 =?utf-8?B?WERLYXZqeFF4bDF5SGpWVWxXRzVpSEpRaTlWVitWNWc4ZlRyTVVrdE1IMXp4?=
 =?utf-8?B?STJIYkV6ZEVLV3E1bXBnT3hiZ2c4cndNREJDWGsrQ2lNNW9uQXoyTEV1alVo?=
 =?utf-8?B?bXBuQjZxSkdVZXJZYWZNdTYycVpxeG9oUlluRHY0VzBqbWI2LzBPK0dOV3JZ?=
 =?utf-8?B?MVd2QlQyT0xkOGFia0VSakRob2RXRWFiZ3F5bFA5OXV1NHJpWjNpcmt2YWN1?=
 =?utf-8?B?eGdaamxwZ25vWEdWNklHekxtV1dTai8ySWJmVHM2WHJ2b3N0RDU4QmJ3a0tO?=
 =?utf-8?B?WGhPa29yRW5NZ3BhUmdqdjhteEhlbzZjcTg0eTVvcWE2N2hIQTZxTGNQWEp3?=
 =?utf-8?B?OWhTWXpyUkRXUE5YZm0wOFIrQlV6ZEI0SGh5RDJubjJSRDlXNXQ2V1U3YWdU?=
 =?utf-8?B?UnZQdjlVY0VKLzFlLzlEY1lJSXNad093Mk1vY3NjL1FoY3hFQ3k2dXpDbkIx?=
 =?utf-8?B?Sk9QYUlMMDBtUVo2V3Q0bERCODUxSHMwT1ZtNFR2c0FwU0xrNlB6YnhMWldq?=
 =?utf-8?B?RW1OZDdMMDlMMkpqU1lVV2tmeW8vcWVZdFZFRFk0d0pXdHl2OXNpa3ZrZFpG?=
 =?utf-8?B?dnVPTTRyVkVwVVlwSHlBelI4RDNqVHA1TVJVdlFjcFlnZkcxcVQzRndEbUxw?=
 =?utf-8?B?bXdXZUt2dFZIUU9EcG5TaHdvdFlLbGNOM3B6aGlJUUlHR0FFUXRuaXFScm44?=
 =?utf-8?B?SElBbW9BYitETW1QSXFQVkY5ZGYxaDcrR2c3RWJXZU9aM24wZkh3dENBYjhq?=
 =?utf-8?B?WlZRVXgvbnUxNlNhdmp0dThSVURFWDNiUUdGd2tHTmFEcis2eDB5dE1scWlR?=
 =?utf-8?B?TVd6RVJGNlI1aUdkNlp5aDBFbGFIQnBrZ1JJMzdjQzBnOHk2YjR4T3ZKb3k3?=
 =?utf-8?B?RmIrVUwrc1U5eG1HUlM2Mk93cXVTNXorVWFMOTdCeFVZRUdpS1N2cFBzb09B?=
 =?utf-8?B?MTdhcldsaXVxTHIyWEUycEZEaUswVnRHMHJQZlM4V20ydFczUWE4WXhyWGFN?=
 =?utf-8?B?N2RLR2ZldGRBVVhTclduZVlFdk92MkYzdDFFNjdZOGhrZVZna0l2OVljYjdF?=
 =?utf-8?B?K2hIMldtU3pnM25PcnJ5ZnRtNGxOR0U1NlFCM3dycXRkVjRaQlU0Sm1KZU9N?=
 =?utf-8?B?UGtGMlNLZm1EYzVVb3VGaTM3YWprSE1LM0F4L2tHWmRxb2RsNnBBVzVIdTVB?=
 =?utf-8?B?WStZZ3FUeTdMY2tJeDI4aDl5cWRlaXdyWVNoeWtaUFh3TWJQa0ltVXAyc3A3?=
 =?utf-8?B?TWtYeXM4VHZmWmZlcE9pWjUvS2RUcWJFUnNoRjNNZ1h6alBwSm0rcmE0a2Vz?=
 =?utf-8?B?anN3MDN1QllGOWdHZStqNVkxamp1NXBGKzNVdEVoWkhZMmRnYmxVMFBxNm4z?=
 =?utf-8?B?MUtPazJDdU10OTJQNlZ1L1NJNnVoTExWTkNaVU9NOW80eHcvMldNS2tZQXY1?=
 =?utf-8?B?NmNnSTlTTURPdVd6WUJXVHYzN0YvTmJLTEJuVWxzbXZJdVpaUEtscGw2Z1ph?=
 =?utf-8?Q?ucdT7D4seOobzlxfO7WSUCrBOK5GNlQz4VTWbsJECL1Fl?=
X-MS-Exchange-AntiSpam-MessageData-1: evMwCfPcDFLA1g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbf3311-56e1-4841-5b54-08df1d678de3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:51:11.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJcwY6NHroLE2ruouMcETSJhpZm1ZugAKTx1qlnBqbkyeyFgEj9t9UsF5k4PXZ7kW+kyiM7E/6qUKl/xv6vaTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485

Hi Vinod,

On 08/09/2026 18:01, Jon Hunter wrote:
> 
> On 03/09/2026 08:19, Wayne Chang wrote:
>> Add Tegra264 support to the Tegra XUSB PHY driver and its binding, as
>> part of enabling USB host functions on the Tegra264 Jetson AGX Thor
>> platform.
>>
>> This series was previously posted as part of a single 8-patch series
>> covering phy, USB host and arm64 DTS changes together [1]. Per review
>> feedback, it has been split by subsystem so each maintainer can pick
>> up only what belongs to their tree:
>>
>> - phy: tegra: xusb: this series (dt-bindings/phy + drivers/phy/tegra)
>> - usb: host: xhci-tegra + its dt-bindings/usb: separate series, to
>>    follow shortly (will reference this series once posted)
>> - arm64: tegra DTS enablement: separate series, to be sent once both
>>    of the above have landed, since it depends on both
>>
>> Patch 1/4 (dt-bindings: phy) now spells out in the commit message why
>> Tegra264 needs its own compatible string instead of falling back to
>> nvidia,tegra234-xusb-padctl, per Conor's and Krzysztof's repeated
>> question on v1/v2.
>>
>> [1] https://lore.kernel.org/linux-tegra/20260831185835.3732707-1-waynec@nvidia.com/
>>
>> Sing-Han Chen (1):
>>    phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking
>>      clock
>>
>> Wayne Chang (3):
>>    dt-bindings: phy: tegra-xusb: Add support for Tegra264
>>    phy: tegra: xusb: Increase timeout for USB2_TRK_COMPLETED polling
>>    phy: tegra: xusb: Add Tegra264 support
>>
>>   .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml |  1 +
>>   drivers/phy/tegra/Makefile                        |  1 +
>>   drivers/phy/tegra/xusb-tegra186.c                 | 31 +++++++++++++++++++---
>>   drivers/phy/tegra/xusb.c                          |  6 +++++
>>   drivers/phy/tegra/xusb.h                          |  3 +++
>>   5 files changed, 39 insertions(+), 3 deletions(-)
> 
> For the series ...
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
Any feedback on this?

Thanks!
Jon

-- 
nvpublic

