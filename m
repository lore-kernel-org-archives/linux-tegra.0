Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C0431716D;
	Fri,  2 Oct 2026 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954513; cv=fail; b=WldlpVKpvbR1+vJtvRGKUSKoXo5Jg5Wq9xThHQh8NicVf1A83jGvPc6Ppe5UrW2k1vNRCPPqlpHJuliZlnnPmk0jHzvuqry4zofmloIJqwOg8ifw6851fYNyW3UQWUzsCGTu5Kx8LRkemTMWa2MJWrolvuhpJo1K+oUbmnbGMJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954513; c=relaxed/simple;
	bh=abqx4/xNWaJDXTV2dRrt9lrakCLxD8RwTNMQBlA1a3k=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WnHyzaMt359eSn5+ckHAMzVA0tDDcrviXyrU8A7Lqxuv6r+orP/1035etPlgm4XuHs+HWd0oPndGrmt2+sGdGXdWRnX5byGQFIs3G29Lj/mxMj8C8yjdw0671DZJfhYg89Bw3g0JjAHQupmMZaXii7uPRdMYUuQNv90NSOTa7ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KaoxtlHQ; arc=fail smtp.client-ip=52.101.61.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KaoxtlHQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bigjxFOxqkoOVkQXdqr+jOo6mLYbvsM7Qi8uFOqREee9ZgMaLmrcB1WF4bVG/ykUKFH3oXEsd/4qogsOSwHCC2KqCXwIZsRcS0GEEgXWaJoJXsz/xhk6t2zduvdL0NOlth1mIQKIpVuirOHGAhp28XNcK7QkDwR8fRqlfNTUGh9LcC1SXRYazW68Ojtp5rtnF5MR5PswaoZCgHL/wZwd8bOaUx4KLuYTPydy6Oxtvwl3hGqqobBotlzoSkPiRA6Twtwn4sRenudiQn3zgwg14ml7FfRWkkGyGqQ89k/i3F7FIeWndSLft1mGF1GBLLFyjh7BbZAv4ngc2JzjDaS3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ7Ha98jLi2qwbVZR27c5wP+8yHPxQbXJyDgBVuQ2lU=;
 b=kfbF/u2CmuUJ4n0S19ymCEmZ6sGJSwf8tKvXg0CRcM5OXmxfgIyIpZbi0CVNDlr0iI85X1MzKtmLPnXVA3s7STs5RjT7j7hkZ1WdaNMmrCIdBuGcs1woUlxN/95KRqGI+SfFae4nCVqQd/Nr/ovsFYfMfGv4zFCozM7s8O9vZ3fADDhmEj7qLhGB0H30i6m4yQ1Jx565WFMm/G6ARvNjGOJjU4J51hkpnraqLVmHagyE0gkeZbNcPlcwV2pQKq/HKdsy5tDtgfyTotpCufPdk6dmDqrCqs4b+Rai5udmIzcfcYfu18P3tyPpQLUoQPTuNCU3kdLkpjwnE8ebOb1lDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ7Ha98jLi2qwbVZR27c5wP+8yHPxQbXJyDgBVuQ2lU=;
 b=KaoxtlHQ8p/K8uzJqSoJSLQfh3I4mAjA4MolwpJTrL90WsQaQqIiLOzadmn1XRPgyrrcERSZC4+8rMLncsJ2np6F2ekHixDq68vIO3Ey21csWc47NerxpjzF1hd9rZB/VqXZp/sAKFkWBngNDk4f+O7KPkEmicD95s2tZMn2CMzdukTrEqT1hhR/rgNZ96bf/H/QZi8uMCk0HnOtPOARCkZFBEpiWu+nolRuobmUb0VBfxoRsqM2mQkkEFyfT898W+2olKZRmv86D8wcnt6HcQ8O6bNSjRXPWuMyeHfWx9YmExIfKjYS5TErdDrnue5+tEDFyHhFCtWfI7v+fJ54Gw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by PH0PR12MB8007.namprd12.prod.outlook.com (2603:10b6:510:28e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Fri, 2 Oct
 2026 15:21:18 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0451.014; Fri, 2 Oct 2026
 15:21:18 +0000
Message-ID: <aebcec98-d7c7-4cb6-8d6d-1ae5a420b5ec@nvidia.com>
Date: Fri, 2 Oct 2026 16:21:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: usb: Add Tegra238 XUSB host controller
 support
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
 <20260921-tegra-usb-v1-1-74a925a35d82@nvidia.com>
 <20260925-alligator-of-authentic-economy-f631fd@quoll>
 <0c5b19f3-9ac8-452e-97be-0256aa0ccb0e@nvidia.com>
Content-Language: en-US
In-Reply-To: <0c5b19f3-9ac8-452e-97be-0256aa0ccb0e@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV2PEPF0001A336.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::69b) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|PH0PR12MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: ee65e15d-4489-4687-65a1-08df2098ce36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|7416014|376014|366016|10067099003|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	VZDa7gDwTE6NX5eBzUmWCvtLxKgRqAixpnbK6fUwwX2J0GRufJN6xEPeVksR4oTwz02HgVWf30rPzHedDEpCxHpaob2dXrb66pjdPs7RZF0sC9/V1iKTrJrCPZihmvvCCYF7yzVfT8aXqFmfR5CMNpnTubkp0BpAv0UWXxWEl17cuzs3MSOfyLy7UfH+n5Jy/u8z0dVnx4JpdPsMuLWYLrW/v71f+P17QhN8Ny/+xygZaOGn0kfz+DLjjfxzBVKZtIY7966SMsnBw74SccayFaDho7d/2diSdzB9zbSM0zOeqbXYFN8z9lldfbyIWu+fBgJmzPrpYNu7BzA/pc9q6IaLy5gucsN5xlFEiHd4RlblgpvJvA5BfhFQmOOzmBHLr/nc0Z7rAZjdlrTrtFuEe1ay656T+IXtyHV/8eDOG62xCl2DJBOkguVvCxhLwtBPS5WBd6U3xzmAL7nt/A32yd1w7s9H/Tx7t9rJpHo8rnNg+Nl90wq/fWqjHEj2EvfpjtIPKgGDUoY4esA5DSHto6fav0gk9yCML58I2a32nEaEMbiB/BrMEEJn5ums5cA/xYSVMV4Mb+occYeXBjIWQwV9g7xFZql1cp5NBDR1MPGZ5bsjoAssfj/h4mr5hfKSBvb2xB5WouiNONy5C7a3EoedRa8vJaRLPZ3Ny94+cow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2gydjNWa3dOTlVBSEdSL2J6ZzhSZWQ4U1k3MVBnb2lFWEpENCsyQ2thRnJD?=
 =?utf-8?B?VzYwVThXQjhSUDBrUnBmOVlWNFpIdW9idDM2N3dGVzNOT2pmbUoxNC9jTCt3?=
 =?utf-8?B?UmN1KzRpZWI4UkVGMEFiZm5lVUQzRC8yS0YrSFN2MXlOUDVlUmpQKzBaUnov?=
 =?utf-8?B?TXE2dlIvdElBcUJtVW1GdnpvOGp6UHk0R1ZVb0g1SW5wZWM5MzJuQXNsRGt3?=
 =?utf-8?B?RHdpUUpuRHF0RXlrQ0s4dUxaTWxwSURtb3UxR3VVMWJ5eitYYWFsOWRDTnZC?=
 =?utf-8?B?Z3hjMDdRZC9tZjJ5aWtjYWNwRi9FaUIwSTA5bXYveENXWmh0L00zNDBuZ2NP?=
 =?utf-8?B?eU1jUEhzM3phSm5pczhlSmZ3MThhenorTWNrZTA0TitldFlVZHV2S2p0K3dZ?=
 =?utf-8?B?RHBKanJLbnVsSEorOVdmVjdIRWVhVVovcHdQR1pJWTRQNEowYWtIWlU2eitE?=
 =?utf-8?B?Z1V5N0tXV3pLK3RpZ0UvenRkbUx2ZDkzNVZTTFUxYVdGeVk5U1dlVkNHNmFE?=
 =?utf-8?B?WGx5RTZUR2xCSlhjWkQwaTI2alRBV1hVTFduSkpRcmFyUmdCM1pqeERuS0pJ?=
 =?utf-8?B?MktDY1BSUGhLSjZrendDTHhzL2w4YWdTZ2pOb1JRYlQ1YnExdHNpTW5vUHNO?=
 =?utf-8?B?TkNkOFdOZ05hWW1uQk90NGhZWGdIYmEvUjE1N2Y1TmhQUVJxbWhPVWtSY0J3?=
 =?utf-8?B?ZE9HckdKU0dWNUVxU2RFZktPbHVIR2VaR0JEdXFaS1Q4WTgva3lXSllXM3pa?=
 =?utf-8?B?TE5MdHJJcFBucUI1TksxUmdYUStOOFM5QWN5elVqd2RZbjQrZWMxaHNYQThI?=
 =?utf-8?B?MVZkNmhCVDdPK0cvTXVTMkFabWpoRWVrWHRSY0JwTnRDRSs3QmttOEJkKzdh?=
 =?utf-8?B?YWRoMmxpZEwvcXA3YjR6Mm5PV0hzb21YRXk2R3JHSzl6NGJZOFBYN2lNM29C?=
 =?utf-8?B?WXJmbzZ6K3g1TTV5V0FkUEp3dWlZRjVnTTErSDJCcTFOQ2xCTytidDF0bkw3?=
 =?utf-8?B?cWZrUWhqWHQrbUlvTnNMTkhyU1RqQlozaTlQS1FXbnZ3M29hQS9zY2dNblNt?=
 =?utf-8?B?c2hSc0pVZkFqS3pKQit3ZnV2STZVajkwcUZwQXEzM0doRExFYStkS0kzSFNu?=
 =?utf-8?B?bHFUVU92L2hXM2tXdEx0TXRkV3Mxb2hReUQ4Z25ZbVBhRFNXOEFCSzZNdTZT?=
 =?utf-8?B?SnJSa0hubnRvaHVEN1lWaTNEVjA0MnRDTERteTZ2djVXYTNjeEpZNFFYZVRQ?=
 =?utf-8?B?aCt5Tk8vS1AyMVlOZEFESjV5eXcwN3RITnFybmpXZ2cyQmdya0xxNFNMUDg2?=
 =?utf-8?B?UVpOcmU5N1REYzI1b3FOZTdZNWFVYVhDSW1zVEU1ZGkyd0k2RHRDNi9BSlVh?=
 =?utf-8?B?Q2dhNVcrV2lEVHRSTjZiSHBUaERWa0JkSDNUYkMvZzJWdkhmNHNrN1VERUY4?=
 =?utf-8?B?VWF6YmRXZlN4ZVpPcGVYcEVjZG9rWVVGQlZHaHk5dlM1YTg2NlprbUcwVmZL?=
 =?utf-8?B?WGxHYnNDTUk2bnRzVzMySFRXUFVsdndDcmRmcmZySXZnY2U0R3JOQ1B2c3dF?=
 =?utf-8?B?eEE0SzJUa0NQSUhBVDljenQ0Yk5EUDhxVklRN3ZDK3lWdkpJK0IrZE9tVTBV?=
 =?utf-8?B?b04zSTJLemprN2VpUVd4WFRmZS9mbUl5SDBnS2lNZjJoVHRxakNuQ0xvekZt?=
 =?utf-8?B?cU1GTEFWeTBpbUI4YkpLMC84Y0FkQkpMeks4N1BUWlcxMHZFME8ydzU3aTVB?=
 =?utf-8?B?NTRwWFM1RlB3MWxHU2VaWkVBRnNpWWRUcUdBS3JtWlpzUDBOOEs3dW5zRzJw?=
 =?utf-8?B?bVJtd3MrYjQxNllEVC9WWHgwbVhvUm5LRCtNb0JDUTNKQWJ0RmFJalFlRTBt?=
 =?utf-8?B?Rjg1NVFUMDRtcDloSTZ4a2FUNzhuUkQrRXNFbHBlRVlNRzRURTBXV2xIRWRq?=
 =?utf-8?B?VGJ1K3dIMHNsTy91UEpvTk9qSGFEeitKVjc2NnBvVW1GSmFVdGVkTTA1RDBK?=
 =?utf-8?B?dW5VbmJNSnFOZ3BsZ2xIMEw2eC9ZaXVXUFd0OFJZYnA2R0QwODJGbktMa3pL?=
 =?utf-8?B?bGpmQWkydGQyRXJKZzRPT0N1Ym9UM1lrYVNlcU1wZjFDV092dHVERlpTQnAw?=
 =?utf-8?B?UmRCNzRMa1F0Y3hKK2YvelduS0RlYTFMY21sU1VhTkNhUHdyZWVsZi9JbFZV?=
 =?utf-8?B?SUMvNDBRTkV6RUlaWldBZkcyNVVMdWRVdFhsSCtHTXp5SkhmbmpVSFdaL0ZU?=
 =?utf-8?B?ejJOTVNLSXF1RTRvL1lEZHZySTBGT1I2bFJXdVd0eXpkcE4wSFA4NmovWWdn?=
 =?utf-8?B?T3BSenBMRXZCZHpFbkRETU95OHRVazRVZmtvdFRDV3kxN2FKY2Q3QXR5TENS?=
 =?utf-8?Q?3t0iJzwdVuj9oBB6J9DsRrmOp4SlM+OVOgKsPuswgHVpF?=
X-MS-Exchange-AntiSpam-MessageData-1: 46ofdctLoFLXJg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee65e15d-4489-4687-65a1-08df2098ce36
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 15:21:17.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNYdGAdy0TVZXfxw/2BRm1DvvehGW6r66MiiaLZL5w5ZmYujn5HraH9urcOE5XP/tNxsMq7z4Wqsl91yiDgKKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8007


On 28/09/2026 14:57, Jon Hunter wrote:
> 
> On 25/09/2026 14:27, Krzysztof Kozlowski wrote:
>> On Mon, Sep 21, 2026 at 01:19:01PM +0100, Jon Hunter wrote:
>>> Add a compatible string for the Tegra238 XUSB host controller. The
>>> Tegra238 XUSB host controller is similar to that found on the Tegra234
>>> device but only supports 3 PHYs compared to the 4 PHYs on the Tegra234.
>>> Hence, the binding is also updated to limit the number of PHYs that can
>>> be specified for the Tegra238 device.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>   .../bindings/usb/nvidia,tegra234-xusb.yaml           | 20 ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
>>> index 3f56110be915..9d605db7e77f 100644
>>> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
>>> @@ -19,6 +19,7 @@ properties:
>>>     compatible:
>>>       enum:
>>>         - nvidia,tegra234-xusb
>>> +      - nvidia,tegra238-xusb
>>>         - nvidia,tegra264-xusb
>>>     reg:
>>> @@ -154,6 +155,25 @@ properties:
>>>   allOf:
>>>     - $ref: usb-xhci.yaml
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: nvidia,tegra238-xusb
>>> +    then:
>>> +      properties:
>>> +        phys:
>>
>> minItems: to be explicit. I would expect minItems: 6, but your phy-names
>> is flexible, so probably wording in your commit msg should be "*up to* 3
>> PHYs compared to the...."
> ACK. I will update the commit message to make this clear that this is
> 'up to 3 PHYs'.

I have noticed that this binding does not have a 'required' section and it
should because for Tegra238 there are no power domains for USB and we only
need to control the resets. I will update the binding to add the required
section and then ensure the correct required properties are specified for
all devices. And of course I will add this detail to the commit message.

Jon

-- 
nvpublic

