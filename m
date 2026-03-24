Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010025.outbound.protection.outlook.com [52.101.85.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE783FB7E7;
	Tue, 24 Mar 2026 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359211; cv=fail; b=B8JgQZrIFMTHGz9KDbl5X6yPZjArazveixd6vj1Y6DG+cr6TKqskjQwbV2luTGxSM0AuKHBmif+6M7V9mvXSvYFSnOf4of0esgRoWQbyZwXYZJLAU0zNovqDsSuUXIFDOXA1NWleBb4B+sjquaPxIXlQH5L1B3HTkKj5TjGy0Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359211; c=relaxed/simple;
	bh=sF8WBNxMYM5IfW6TJRRw8H3QdjCp9iIe5p807Xp0qgg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LmMpxZ0Z1ng9VRtMVlcvzoiokvKWcBbY9xWsxDVL6gGSlMKKzy4YnF3uJbFXTedr3JuP8pXMVPX+sbuyy+dqAxmUoCdgckQYwkRBe+3/yiD0NdZkZTVFhQJ7G4QWDcsqxNm3P4eEQEcaChIStlqdFqEMxQV2SFmYpnxOJTwmQUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YAVZfCrX; arc=fail smtp.client-ip=52.101.85.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YAVZfCrX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqZhJmOa/I6J1zddIMyLMPIFw15bikJXDf7InSe6+QYFlJo/0fbifB8obytZvwjszxGROdZV+/NPi+vj/4HHkhJhqsz6OombuxWEyvoWRnZIgEF7ztrkxRv1ICY0Z4ZBrlVKzlRSYzt7dqGr3O5KsuFEmdspeQnDhrGkSHZJRBOQsdL+JeRqlqde/qdwvTxhO7ktv80CHp9P1BzxMsjLxzmOqed9jdGleWPHJupuQ63imTh7tZciiXJ0Zlc25b8axRIBrlnWjGvIrUOV/S6BG37NMagfPrv0S51JL0AdPPAKDrYl3lwNApQAnVzeOh72iB9oNTT/x5dxovUZVeF1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZCIFpUENMXB5Rh8UX5aYxAw+tkASxgH6B6AnJbICJc=;
 b=j/7ClS+BnnM/dNl2twx+IEuRnC4KFuSRVNYgN0hmA2MsVShc8+dRkZrPs940AypgQUrA4It8CEwCHWSWkDtHbbHV7wvxbn7K5bMJVR52noXi2AxU6okT5WKUKYeOi0srygnK3SjMYkmb7BWhoLq/eXPkU1b0uvVvjjNWgNOKtpADCy2Y+9sdCbP+yG0EGyeQbDDA8E/M5q9skRm/8FgJT8zlmuTR62Xl5F3RREjuRWpxYoTzB8TsMNYTs5WzWdy91wyNQ6EGhIDExGZdzc5APfKfsemgoKPVrz+mW6XpFattnVLWwKHrd5dTwzq5BbAeCe2G8ExC/Cy9ydw+3lSUXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZCIFpUENMXB5Rh8UX5aYxAw+tkASxgH6B6AnJbICJc=;
 b=YAVZfCrXkk503tot27wiCkBf4ic3Dm7MKMHQimtt898P8jtFy+AnvAPefGKIU5gGWGEIFl9DEVJfFo2634tSP0fvGKh99GDhGkCVHSnGh9lqmVuR7+3yw31fkPQ5sE7PPg/+cg3V46AOVBtvgoCSCe5uMX5rTlUV/B1BvPngwqMQpC1T11UUcef11hO493anr5TkDJe8mwBREHutKzuP4NtGA5XGC6Oqv3mOGkqhlSKs6YIJ5PJvVNejdp4RFMDxfdUADlqs7f9X7lxly7aASWExxpwMa/u8nVquPBinCFRf4/vYtM4DUoh2nQs0Gzd/NciCXQOKKlROSACt9+x74w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by LV9PR12MB9805.namprd12.prod.outlook.com (2603:10b6:408:2ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 13:33:22 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 13:33:22 +0000
Message-ID: <7a6f8967-c635-4d84-bbab-9e019ff79134@nvidia.com>
Date: Tue, 24 Mar 2026 13:33:17 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] phy: tegra: xusb: Move T186 .set_mode() to common
 implementation
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260127-diogo-tegra_phy-v2-0-787b9eed3ed5@tecnico.ulisboa.pt>
 <20260127-diogo-tegra_phy-v2-6-787b9eed3ed5@tecnico.ulisboa.pt>
 <af04fc85-1ed4-4046-86ee-1ffcec8c44cd@nvidia.com>
 <5a5397c8-cc32-4d6b-86a4-76f924ae6d75@tecnico.ulisboa.pt>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <5a5397c8-cc32-4d6b-86a4-76f924ae6d75@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::6) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|LV9PR12MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4d7983-8a00-430e-0e91-08de89a9eb0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pYKf2Qt4wr7nR9qVe3JWMVAOmzovazcBvd1d45sk0rc5BmBNc5gUTqgMAoABnpV+qpOSVqF+pn6uuU/1iboJJTB7JDjSRaqY9XijQftfmq15skHFFUBV9x7R3vx5HBKUlhfWv5ciF9AdeRzzWeLMeGsPc9wKAQR49NyvQdfZX1C8e/zQcORsUM6OqoCDuKyXh3gVjQ8b1Bx24AWzJFOlC5ZTVrX+OAbUUNPMWkmc9Ok2XJFAU5Lr/q0UBieYrTEckmfmMcIKqrhFayDX2TxoL7sD2SF/2zvKuSf1f05XjkcFY5ELB1ib3gVg0Qoqnx09H/6cribjR97eLO+eyUu+tImOFVDHcLJfNcCl0Hlv9NfbSUeaTEJsB8DWvL8ILdaCLbI4tVCDQMuqpSFj0wn5a7fZLcG4PBQPOlztTHmdnFS5G6QBwjhHh/Kr30arDpqPmGZqbDq/AdWfcldyF0IQBVNcgDBLYcTlgD05GCtStERNrNbL2k1vOQS1wnQ5vuVoCaBrjuMaOWQToqW20VuzYB1UmQVYthS5bmJ3Qii0LTRAq2hirDJQHkUvtmX4GxuS20Tl70NpdQVfAIDHzT1OpUeRqYaXnQ4Ze7CFaqUBTCjHI0X81q3SaejwWFutDEe+6wNr9j+lN1it8QtgrwoexPjumJqm7S4QYD98e1TCjWtim3CEPm6I3H3m9thZD5q5S/DhGMMfHN/cjddL9STe+cLPKrfv9l+L22mcOBrcHoGjfYErKrjiy4sfoEO7dtCiC3rAkRTEpuv3I2l8lRQErg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGl1N1NsT3JlWXY0KzZNSHQvbWsrUEdQNjMvSTlxZUNJakZxemZKK1BTQVVJ?=
 =?utf-8?B?cTNFRzFGWS91c1NxZFB0bDFKVWFZa3psTUFMVHZ1cUxHSi9xU0VMemtOcEYr?=
 =?utf-8?B?bnk4bWxEOGh3ZER3aEVPYjlVUGVabFVIRDJqOUFaTlVreW01cUVDRDFqYktj?=
 =?utf-8?B?VURPVmZyY3BLTTFnVU9nTkpNY3dzWDBKMVhVQ0hwellyemtuMmUvMkNhdHdM?=
 =?utf-8?B?ZFZyVVZtRmc1bVFROGVsTjI1NThUUFMwNEYySmpLalIwRHI2NHk2R21hZHdm?=
 =?utf-8?B?Z3VObHE2YldiZ0NtYy9FSDRHWFF5MEhsQ0I0OVJPeVVpMThTcDJKZ1lHZDV3?=
 =?utf-8?B?d1NpT3dyR3NabXF0dmZLS2RKbkZKOGFzVmtjQkV2bVZPMzdGSmRPTTNtVzAy?=
 =?utf-8?B?TERxeEpQZVRkaHlaTUdKemJKK1RmWlBmOUpNN244TDg3cS9kYjhLVmxYbXNX?=
 =?utf-8?B?Rjg3aUErRnFBZ2xHNXJSTzhydC9kTHdyMkJFTEdWa3RyUVVSQ012bEc1Tm8y?=
 =?utf-8?B?Uzh1UnBuaExRV0RwaThVcWsrZ3AvRXhxZlVPUE9TRkhJTjVzRnlHd21ZS1hn?=
 =?utf-8?B?Y3JkY3RQNi9hZUJkWVJMVnd3ZldMVHhjUy9BeWhBVkdTSWtWYkRIbWdJWlJD?=
 =?utf-8?B?L0tLU3VabUFaMXFkUUVZWDlwTzl6ekFQNiszYVFjOEJiWnh2MkNPTGxuaHlN?=
 =?utf-8?B?Q2F4eXBwQ09WMEhUQmpjQVU0c0t4elZNUWpkN3B3aEIzb0pNcExMRTJHQ0p4?=
 =?utf-8?B?b0xLVk9LaXJDM2ZyV3dtTTBhaHg2QmRTczBRL0ZyMHhNVy9EZzd1UFFnTExV?=
 =?utf-8?B?WjFtSElJMmxwMlhHQUZ2VGNVMmpDNVU3Q3pBQWJwRWhjRnFnbHdCZ0pGRUZG?=
 =?utf-8?B?TTFSWS8vWXR1RHVrSmtMNUlIMmtLc1hHaEw4amhzbi9MOERLVkZaRHdFc0Qx?=
 =?utf-8?B?Ti9NUE0xdUREdS9sdUpXelZUeHdvTk1uWXQ2RlE1SHh4ZW5QOEJsTm9uMzVz?=
 =?utf-8?B?VWVVZEcyeFlGaXVINThYdjY4bGtHOUVFOFVoS0RoVlFXcFpWV0s2by8xbHdp?=
 =?utf-8?B?UTh1RE1YWndMa2dzV1BuZXBTWHY3R0tPeExSY0svdkFJc3dlTFZUVk5WOFJm?=
 =?utf-8?B?RjZUNFlHSCthNG5rcUVDUTltb3VaSzBhaVFYQ0xRY3R5TC9ibExYUUJjR0hS?=
 =?utf-8?B?SUUyalFydlJMNm51U0d5cUdtVzZQOG9NOWhVVDcvWW45ZG11ZHpTSkxlZndO?=
 =?utf-8?B?SU1PV0RRTitpMHdRY2IxTCt0UEZKWUJhVDArNStoUUg3TWtZZ1dxZU5jOE9O?=
 =?utf-8?B?aU9aWnJwMnZOTVlYZVlwR0ZURHlRUDlybCtsd0JwMU4vZmkzY1N3enBLN1Vr?=
 =?utf-8?B?Zk5WeXZpWEgvSkFoaWNpajF0MUtGWFFueG5MTHBoRWt1VWl3alRha1J4ZzRY?=
 =?utf-8?B?RkhBcHpqSUR5VnMvSkJ3dlkzV3poekZicjlFVDllMnkyUElicW03TU16WUZP?=
 =?utf-8?B?cTZSMnNCVnU5N0I2eTRmZ3c4UEYxTEJFdzg5SUNjeGhKSVpENFlZUWFXWFRB?=
 =?utf-8?B?aG1iUHhza1dkWG8wdFBCNVRPbWREOWEyS3ZDNWtQQ3I2cmxoeVZzakVac1BV?=
 =?utf-8?B?RG5Qa0c3UWo3TEp1K1kyZkFBL2J6b2twTEpFaThYejZaZ3h4UlFSOTNYQzc0?=
 =?utf-8?B?Q0ZMbnVjUk9kQVYza2V3RSt4ak5xVEJ1UVJseUc2YkVUenVORzByZlpHL1RP?=
 =?utf-8?B?K1h6K0VyaGEzTW9KTEM2bkV5RXFERjhSUzBQZ2lvOEZVamwyZkFHZVM2aXN5?=
 =?utf-8?B?WFE0RGowSWJsLys5RHQxT1lxT2dTRTY3eVpCb2MrQXRjZUVHK2tKeGNtaldC?=
 =?utf-8?B?bVcwQk85aGpvU1dYdnMvbHkxOXYwWDRZREtlbHltQ1p2YldLTGtpNUVUMjJ5?=
 =?utf-8?B?VkVtbDBndjVJZDlpR2dXUTNxTUhCaTNYWUJaWk5zRWozMDFXK2RnRGM4MVRN?=
 =?utf-8?B?R0VlRmE2VWw2OTVyOFdwcUp3dE10bUJDN0d4Y2lOUGVON1N2Q2ZhMW8xRVpB?=
 =?utf-8?B?UlVvSGFkN1d4YVFHOHN6TTlQZXNSci9JNjM3akJCUi9sckFTME9oYnpvcTRP?=
 =?utf-8?B?NDVIYjdIenZZSktKRG5aWkJnKzdZcHhTTkpqdHRjYkE4ZkluVG1tSDhGcmJX?=
 =?utf-8?B?M3grWHNIN0Q3dHAvQm5oNVFxZ1dzSjZXWEVNTW5sM0I4SS9TTkY4dmh6ZzJ3?=
 =?utf-8?B?RGM3V0pmQ2xWbjRvd2Z1ZmV1bzdhL3dxcFhLOXVBU0IrYnMzbHdKb2YzL25w?=
 =?utf-8?B?Y2ZTcndwVzV6d1pmNWE0N1hCenBxclh0bjI4VlYyM2Y1UUhCNXFOdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4d7983-8a00-430e-0e91-08de89a9eb0b
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:33:22.0048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvE73lhMOOQWOQobwyE6lo73mtTN+M6H1yEqcvCGR+jQ5eDbs8Id+Bb+QvwQu6h38U/cCGglbpRzWnuilfVw4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9805



On 24/03/2026 11:31, Diogo Ivo wrote:
> 
> 
> On 3/24/26 10:16, Jon Hunter wrote:
>>
>> On 27/01/2026 15:11, Diogo Ivo wrote:
>>> Move the Tegra186 PHY .set_mode() callback to a common implementation.
>>> In order to do this first revert cefc1caee9dd.
>>
>> This commit message does not seem complete.
> 
> How so? It is succint but it states exactly what the commit does. It
> reverts cefc1caee9dd and changes T186 to the common implementation
> prepared in the previous patch.

It does not read clearly to me. The 2nd sentence sounds like that's all 
this is doing but we are not, we are reverting and doing the move.
>> Furthermore, I am not sure why we want to revert cefc1caee9dd. We 
>> purposely moved the regulator_enable/disable into 
>> tegra186_xusb_padctl_id_override() because it is tied to setting the 
>> USB2_VBUS_ID. So I would prefer to keep it this way and move the 
>> Tegra210 implementation in the same direction (if possible).
> 
> I don't agree that this is the best solution.
> 
> We really benefit from a common implementation for the two platforms, not
> only because of duplicate code but more importantly because without it
> whenever a bug is found and fixed on either platform it most likely will
> not be fixed on the other one. Case in point, cefc1caee9dd fixed a bug
> on T186 but not the same bug on T210 (which then led to this series) since
> the implementation was not shared among them. Were it the case that they
> shared the implementation the fix would have come "free" for T210.
> 
> This will keep happening for as long as we have duplicate implementations,
> which becomes more relevant since there is a severe lack of testing in
> older Tegra platforms. I also thought about making the id_override()
> implementation shared between T186 and T210 but that would be take more
> changes since register definitions would need to be moved somewhere
> else too.

I am all for a common implementation. I believe that in the 
tegra186_xusb_padctl_id_override() function the only thing that is 
different is the offset for the USB2_VBUS_ID register, which should be 
easy to handle.

Jon

-- 
nvpublic

