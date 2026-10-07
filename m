Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40D47F3B2;
	Wed,  7 Oct 2026 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384430; cv=fail; b=Z/V1zBmaR/Hy4xFAHP4KNnXFN6/xX4Y2ydVFhEPjPa0srobirqeIYwvkVzSh0nDi/Fcz0uQB97nTxu9DhZWghmgE5o2AB9zj5/V2IkQbM7S9c2OJMBsAkI4l1RZezo0AaMkHymDvgfxmg6ETfEMXSkYEXBQDURGmChvjJ4xwCQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384430; c=relaxed/simple;
	bh=b7k4omn7Eb2qUv536xA+9dHW709YaYqtCoPNBHbEcnc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GU3qqTD1Os5Qvvb1NUUf+pHnVs597ronaaDFLvwUhFepaKbw1Qd0HWigrfp1Kqc9R0ALN0YAofPYcSmyUHk5s8R8QePssCCr2JF+ekxqFD40yKXbcN6Bm6JkF0CYTUZZo+Od/bjYP0ObqjKdMAxHXhVCLVMzkY4ie+JMXHT1YNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ezsM9GzT; arc=fail smtp.client-ip=52.101.53.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ezsM9GzT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7KPQAnE6id+McoC7sdiB7UZRFJrGZVPr2saklTidr6pFE3p1NCC+hiORv0DMFKyACdnfvOOXIEWqTLvp5JC8jr3Ddqkg8PMSvaOXVFFE2t0KpKwSUKJ5SUFOHUD2o0lApfi/SU1PZtQB+MiOXQZGENKF3hResiaoUJfN+TAOaV/uDpa8idzAc6B9dBJE0jTi0MS0cqLZKj8JAZwp44GB3kyFuUzymZ9kx9eC98Jb2BRnrEGbUsAHlsfRX9jtdiX1rFulBKzgnd0O3bC2FaVtXc7P+OBBNawXslODmsxfB/fnOHIYNBcOop5YJdzmx+mdVW17JfOld6wUHA7VOc4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmW4vQx0MyycxDW827EhWcvZOpl+4ASnTVEype+2qec=;
 b=ilM4dBVW2wIpkNaGoZuKWARvKDQCsMhoWQOiE2APy99XAalanC9oYEuO0hFfBX4rsfllAf70hxHh18NMEiBvVfY0H6mpUIGw7kqrOW3qdRTzVcajEmU2BYNv9NfjwcdduOix0vcI3rUPLx6qII/X4wXGqg1VOCzVf+3OhZYxv6PvnayJheFZtYKU1mpsMvN3b1S6eRDOyIb/fkz/t9mFFgpOs4fuxvuuhV6utqnLRKBriuLgBAee6q+tF7l/kwv4rowq0+9bpvuZOVQ86AvK0ItA1crrZ1xoYkmr2ybqAOXqgXBRBbFK1fVCdZ1P2AMadpJhewuSwBkNH0fzcQeOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmW4vQx0MyycxDW827EhWcvZOpl+4ASnTVEype+2qec=;
 b=ezsM9GzTbceT8FWVy0evRpjY7VBPqa7Vl47qF5eZnjawB7iNpUTvGU5Lnk3h1bx6NDPfFeTIDyOlqVtb1tJQQK/6Kj4gDwu4hoDojXwA6lsPa/Q6GkUemDXGBkF/rTYr4UpTNDeSGSOnSNiYjTVps5Msy2G6WTXeeCiU565RIzPZMejYDq4xaW7PlEYsPyPNXN1Dvuhgw/AtVVCcJNLL113ZfxIBxVs5Hmh6laEy8yXgm9MNbjeeBQniy0wT6hZd3w7Szv3nd8Bh9gYFFIrjXKMQjFLY5c2CRd7n9QLwEXY2h+sCPoTllSTg3q7dLwc2s7PZ/b4uJnrVrqIN5+KMoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by LV1PR12MB999305.namprd12.prod.outlook.com (2603:10b6:408:3f8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 14:47:01 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0451.014; Wed, 7 Oct 2026
 14:47:01 +0000
Message-ID: <d2ce164d-3481-41f0-97fe-9d6b21e59ade@nvidia.com>
Date: Wed, 7 Oct 2026 15:46:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] phy: tegra: xusb: Add Tegra238 support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>,
 JC Kuo <jckuo@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Wayne Chang <waynec@nvidia.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261001-tegra-phy-v2-0-3e453b1fb271@nvidia.com>
 <asERwJjj3eUMm8Kd@parshuram>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <asERwJjj3eUMm8Kd@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|LV1PR12MB999305:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e84a16e-6af2-4cee-e85e-08df2481d863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	C5FTLWLPIPi4p4xlL84mxw8FrX6DNe2DmmcZ+yBUZ863W39krHmkf6Xpwgx3+Jqoz/e6iEHs7iP01eD7xEv/w63miRDsFJcDEp7KDM3AlHVBUPwJVvgKUCP5nTwxBQh2DfG0oq9b8o2yVZE8+KQ/OJVeQBpwIhZgf91/5KVaJNuLNDZwiNSFjAXTcxw3G7ApdiSri0vCwPwqVBG3IVLkjS+60Po9RCXjeOfyjF3V4+iI4wzhOg3gu4q2TVZseGmG+b9dMCiltrm1Cb2z3gb0L0cFQSE0MQRIDdYyCuRTt3t0w1B9tRl1y6guIMOYfXpHm6AmORZm0cf524qKOURAUsDr3rVk7MlyurxkY68LReGnF5Di9porhjQBlqhouYOM29u1ThcMwJLp7kGPfMOFsJrLjL9PNocSbbqp0w8ta0sleq5rGuQnAmmKPyQuScF/gGwPXrCOdVoEr8s10btx04hgxrlGYJhP5mZw6pjDtdwYvzNXC09VUl1WA2HRttJbjvKEVUrUAksmOssrsWWcP1HqfYnGpFtKORjv4hpcDRcEoI4DhAakrGxgeooZFzjARD6BOpGQNXVvV8D3uAheOWNERdepRu1C9/wf4x/DeBrsdFSCgQ5XcnCP4Xa4Z6RoWLSM1oAo7atJxcvoSV9JDGxq+FirzcWq9z/XyvH9bGo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1plNUgzNG9BMkI3bzRPZnJ2V3FyMmljQkRMbVFISXRyRkd5NnBEOEZvYnUz?=
 =?utf-8?B?VW9lOG1MOXhWZ1ZqeG9yMnVtRzk1VlR1OHlyV3EyUGdCdUZMT3RHMEQ2WCs4?=
 =?utf-8?B?bXJmN3JkTmQ3UDhxQUxCOHNndHc0VHg4eUpXcHl4RzFnM0cyVmRiMmRxTWMx?=
 =?utf-8?B?djZlNk0rZ0xpeFp6MWhNR3R0ZG5sSWFwVE9WMlFGYnRDTFNidEErL0hNYkda?=
 =?utf-8?B?dCtyQmV0MmlXVmE5UlpjZ3Fhb2NtbnN6THdVcDUvbjZSbCtjUnFJVFNKazZv?=
 =?utf-8?B?RDdzTTFQT1ZTOFFQaEJWY1hjS1BPTnhiaEdUVzRYdmZEbmdGUE8wbU44SHAv?=
 =?utf-8?B?ODFqVE9hYXNGcVltaURtbXVKNUJoTDAxc0hHMnBhWVVyTHYxQ1JwM2V5OUtL?=
 =?utf-8?B?c2JGNDFINlYyekQxVThlQ0FWSkJhelBOa3FPd3Y0UE9aTXhWUDZWc1Zpc21W?=
 =?utf-8?B?NVJ6cFpJMXA5ZzRvN2ZCNXR5MU9hVGV0d05rcC9HQmJRY2toNXZXSEpJVXlD?=
 =?utf-8?B?bTEvam5PNUJGaGFZWncwRG9qVjRGczgyd2F2RTFsTVFHQi9JSm01cjlySE85?=
 =?utf-8?B?eEtkcjlmUEVWR0owTkEyU2dCQ0piRHg4V2ZUbm5MdndMTVhNd3JCRnRoT2h2?=
 =?utf-8?B?UkJzbWgwZjB4NDV5bWx6ak9VczMraTJFK28xYWUwWG14NVZjYXlBSzh0czhw?=
 =?utf-8?B?NzI2RHQ1TFNYZHVHVVhVVzVhNjNOaXFQbWtoRldRb1dNQ2tsZy9VMEI3V2Ri?=
 =?utf-8?B?cHl1TTRTOTlOdW4rd3RSZndzWmlZWmtWbnIrSTZFbGRxbzc2dW8rYU10L2hH?=
 =?utf-8?B?M3lHUS9pM29haTlRd2RsVC9Qczc5QnQ5bEFlbzFpd0dVcUVnOVBRWWx4R1hl?=
 =?utf-8?B?QXlyYXgvYjV0TlVEbGVLd1pkSHN5b0dsdVlPcmNRR3ZENXU2R0pscy9jNDlV?=
 =?utf-8?B?NUlmWlRwT2pPcGNucEYxMUR5dmYvV0RUVkdkWDh4TCsrMHZWVnRzbHhwelNP?=
 =?utf-8?B?c2RablFzOTJHSEpEai9VdWptaEtrUHlBMVFVMGhSSlltVXE5cXZsKzNSQzRE?=
 =?utf-8?B?NDM4U3dwdHlmaUpaOW9sUW1FaUtTbVJVTXNlR0hNazNkVnVFdmZHemkvbnp4?=
 =?utf-8?B?Rlo1Z2V3MlpqZkM3cUVnQWtLak52MWtFQWIvQklWMEcwN0lZcE9pMnpyMjNC?=
 =?utf-8?B?NU5WeFJiVit3S1J1MXk1U3RzWXpocDhUbVBXcGhMdzVNZ3N3Q3kzWk1EaEE4?=
 =?utf-8?B?STc4YjlzdDF2TzFDU0hwaVlpK254cmwyQjY3bUZpYnRXakxQRXNSd1VEZzcw?=
 =?utf-8?B?NCs4TDBqR2RiVEtERTdCeHRJMFdXZmE5blpLSFN6SW5HSlhuR3llbXE5MkVt?=
 =?utf-8?B?V29MZ0FtVFhJMWxpbFN0NnRQZE5uSGVUc1BrS21JUlNHRWRZcy9GL2laZWZI?=
 =?utf-8?B?cnorcFRSZDdlWHFlWXhzd1RDdlNnY0F2TlJ3SW1IVll3M3JsSld6cXNnZCt0?=
 =?utf-8?B?RzF4OUxqYWl0Tjk1cE5vRlE1ZFR4eUVGN1VxOGhKUWtxT1RwbEpRZ2FoZnR1?=
 =?utf-8?B?akVheFVLdTI3dGZCdTJTalJOdGVEMkZSRGRWS1dQdUY1aE5rR1J6YUhPYUc0?=
 =?utf-8?B?VWd3K21JY0crcDJvbVg4d1N3aHR4eWxXemoxNm9EWkxla1hXeEJMWEJ4ZGNx?=
 =?utf-8?B?NS9KTmx2NHI5dmN3cEZhSEhJODBKaWJtOFVWSnVVczc1NU5LUjArTkdObC9v?=
 =?utf-8?B?WTdZNzAwbnhOZ3dhOWtNaXN4ZUJTRzVWRTJuVTdZL05ha3RtdzVwYll3Sy9I?=
 =?utf-8?B?Q3YrbTU4R21GWkRsVk1PVkkzQmpSb3Bqc1pMVG02ZFNxRTVZZnA1aE1MYkR6?=
 =?utf-8?B?bjNGT0ppZm90M2VFYk8yOW9XWDdJRGwyQVY5ZHBDU3NSV1RhREhBdE1vNlRw?=
 =?utf-8?B?dktEcHJCcENDYlRmYkdSZk5ZUEQ1dVdCVmhuVWFNQlBuc1ZrR0xQYk1uUHY2?=
 =?utf-8?B?Z0dPcU01aG1PUkFZbStrYVZKcFU0UHVVVWJLNkFqN2VvRE0zYkNiNitmL0kr?=
 =?utf-8?B?eWJXanY5WHZqWng0TDRuYkU1bFlrRmMvdldZc2tYNnU4UzNkQTR6VUhBZDlo?=
 =?utf-8?B?T2UvNW1kRUgzNlY0S1BsMHhTWk1VVWp6ZlR3cGxWN2NYRjlZbTd0RXRxQytL?=
 =?utf-8?B?L01kV09WODYwSmloNzhvTFpOSU5jcEdvdFBPbjVDb0Z6aWt1dENWVkpQb2pU?=
 =?utf-8?B?V095ME1Ka284LzVFbk9IMHlPSXJSdVlob2hVd2pNTlJEYWRoc2xFUDJOVWtL?=
 =?utf-8?B?SitLR1NtekVLbjhTTUk5K2EwVTJVVCtKSm1JQ3hZVWFpRElUVmZJdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e84a16e-6af2-4cee-e85e-08df2481d863
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:47:01.1359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYFcxQaEG6er+2w15jrO51QNbxzJhLNl3+tHttuTqM0t2jOnxej/AhQp5J6oSU6Xr+0vBH/ZeMTNlxfvA0o53w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB999305


On 03/10/2026 15:31, Vinod Koul wrote:
> On 01-10-26, 14:28, Jon Hunter wrote:
>> Add support for the Tegra238 device to the Tegra XUSB PHY driver and
>> add the necessary device-tree binding documentation for this device.
>>
>> This series also includes a trivial clean-up patch to use the
>> dev_err_probe() function in the Tegra XUSB PHY driver instead of open
>> coding this function.
>>
>> This series is based on top of the series that adds support for the
>> Tegra264 device to the Tegra XUSB PHY driver [0].
>>
>> [0] https://lore.kernel.org/linux-tegra/20260903071937.533646-1-waynec@nvidia.com/
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> Changes in v2:
>> - Dropped extra 'err' variable from patch that migrates to dev_err_probe
>> - Added Krzysztof's Reviewed-by for device-tree binding.
>> - Link to v1: https://patch.msgid.link/20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com
>>
>> ---
>> Jon Hunter (3):
>>        dt-bindings: phy: tegra194: Add compatible for Tegra238
> 
> Somehow this fails to apply on the current code, can you please rebase
> and also check the sashiko issues reported


It should apply fine if using b4. I heard that sashiko was recently updated
to fix this. I have fixed the issue reported by sashiko and sent a V3. This
should now apply fine because you have already queued the dependent series
and that is now in -next.

Jon

-- 
nvpublic

