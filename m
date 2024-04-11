Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA31F5FA;
	Thu, 11 Apr 2024 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830171; cv=fail; b=WuHWou4hNlI4DzABIh+j7St9NHvtkqbBV1/w0TuQSRDGxn0ItrPgSDDFofhn6pQkfFKzA1ORWX8ctyVZJiGGE+CWqaHpz4kmCKRBHwefS2fJ8K8ZCRToeSiBYnEgwLqhT01rEL4QyDoy/DnvNbIDd5MwLCShdthp5JHZ8l5zz9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830171; c=relaxed/simple;
	bh=SaxFemJ/R1QkQXblNEGawNx+s/KiN4P/kVCpXtjdhEk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rz8FMJDm72AzKLVvjSm6VR//kphfDnoTsafUJgjyqS43EQkng9IlzvKFkYQ9gT7bWKSMOZqhTi8p88FOp0jseKjAXEBxZxzhRMfApWql2VkHhVNPd8v6u8SrSL4xX7sP6CKegu+RlyWWgptbuV/PZ9ds73g8IaI4F/+2tawzeHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a45IkfV/; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a45IkfV/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiAcg7tAnfrriUGG5QWweKdD4hgbpiW/7uLFezxwAWyaqmgSAEs8pBRibPb524F5O/UQXaB03anNzx58S0QjsemZCnKLFA1gvFIVb494nEZgx0Z5ouG/f1F0rKWSlZBCQsWrA8kNE3Dir2hdaeCC9dAwDvwjmQzgeEtcbARfSuvPZy3mrwp9LdAwitoPZYG6WX/peGNS3Ts3SnTh6wQ6Qhx7nNAW2shZc0krvM0Vm0n7HkoJA/d8y1OR5RkSH7qbbYYI1pk44UUxIoSiMudaLDUJtTuYM9PiQ4dFgBmDK+ry/b0HD9p6fOzwYNBLKKb81ZPYA6hJq3ad9EYL6OVJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LJUstzm/h1XfZk1ZDqRT1D2vlUCZPNROag5RQyTydI=;
 b=Isw2XdVOEKf6wuiY3ah71cN2jS5D4ZPXfJo3vAOA2O2wgLi5m2fjup+IpoURl+/kRgfxOtt43W+AqPehXoHVgNHL8ZUa5s+tKkyl9iZQf13lr0qblUObswmCJiTCej13C0tfPFqi8udwHIyZckRLYTKXPVGqo6EWxgXZHZ+zeY94+18HuaOO23Qfj8RvpZZsc9QsNOCcl+0vInzPn5exVptDY+19R8Az1AhIb9GhePPRFeP016e0OZP4gSafY3BE3b4AWZQWE/geISHdC6yNtOFbwLl4i7XQP0/x9Xee7FNbGopb6RqfUKOHkT0q0QHeU7dpxMZYiNV0u5UymQYWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LJUstzm/h1XfZk1ZDqRT1D2vlUCZPNROag5RQyTydI=;
 b=a45IkfV/NEe0KjBkg5viyt4gKzpqLGX6t+DV+qEKFhPcnDBDwAW4tgptrWRnY6Ym6ELc8ntEnv4Puf+30pLYT/9xeB6i3T6O130rqaWMl+xfqMvTzKfzrN6LqZn+q6iMq2+b4j0g3aNb9c3twJ1DjnVmRQtAlm01JX8ExyqLUKf4+RbW3knjSZZP6ondRJh1c9ZOazTbpF1Otob6DTRXe1vzxn/2522/dlLs9dKeyq3Vw0XTLRInlBGkk4V5wrv06GZHjkLk3DC+pnA2xgdBLajJRdO9Q9Z7jW5lNquS/yGBaCG2ZVz9ZiSdkjRs3scm29Uo4yA7mjguDBWZMP8UxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 10:09:26 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 10:09:26 +0000
Message-ID: <b726b5a0-45f4-457c-afad-6235c1adb640@nvidia.com>
Date: Thu, 11 Apr 2024 11:09:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: host1x: Add missing 'dma-coherent'
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20240409082324.9928-1-jonathanh@nvidia.com>
 <ea3be8f7-0ee6-4940-828d-2fc15b9239dc@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <ea3be8f7-0ee6-4940-828d-2fc15b9239dc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0169.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::12) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 1feae24f-0066-4b68-2088-08dc5a0f779a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rIlAfly5ED/keka+teOoD7LW3vmXvduPkP4KyRXkA6rvimwiB5brtt8M0HHZ9Nr77GokyPFNkUM87uvdPicPzln/GZrnFkCqldggnKsXwJJV+S49xTS8aIWzvQt0Nb9xG4HdOJpLPcbdJGLSm7NIgO5101Ry9LPkCkzCuYVML6qqAMAjmDJ7rFv+CVu+uW8IdP1AWU7WA3Q32WV5ejI0nUKY7bwsjuxDysRyZb+boud2CfdHT7/TnmPbln6u7Se0K9Myb4m0S/UAKlJdpGsmhJFev6n8ODUc5T/Qg8VTOpVx8QwSlmhTLG5SVzPvEwU3WD1diLlK/t331HCq1NTQ/MfJm5uVYIYgO38F1bZWLjCEN48vTq8j6vZsBxvYzlOq4aE4Zi5CJrbWqVj6he9igLIrz9SNkWD/IEFIMJBY+SR0om9NjySWaMAEndNuoDyE2ezmafAh+q9Bg+TPJfMSx1PPf2pK8duCCnPXLI9KSoWE+mlm/1lOl2tnTUG7DoO2YYBvoRO35jIv3W1pxOsfWzsZ2CeZG8N8KZ3S/rEqWfKYHY52PNUiR9uRun9fYL51M8rAhvZD+hXDMs4AiMl0IZl5IG+6tf4pkedDn0Ko4pB6PoKb9rsHeCqD/VC8Tm0WjkY5CPcDufYGACs+6+SJ4R65eSPfBQHKhlN4rMZV0oA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDRaQ2lxK1hVVkE0MitVYWE2Ykd0VkMzaWxjek5jYzR6bGFucTFyVy9xTHh4?=
 =?utf-8?B?Z1h2NDFYU2dsRFM3bUkxVGVtcFdGcGpBUXJkbHpNaXJFTk83YlkyU25qZFNX?=
 =?utf-8?B?WE1oaWQwTGlUaDNKbTdYUkpZYlYvcmZyM1NUTEVpTHI3enJEMHF2Z3FQelJW?=
 =?utf-8?B?WG1QYmtOK1QyZ1JnSS9MZFU1SGdycFlCL0JlbmM5M0dIUFU0R3Z5NTg5djBo?=
 =?utf-8?B?RFMyUkd5WmhidVJEN0R1MlA5K1l5T2NuVUg0U3JNVTBLYVFlSDNVelVURDJC?=
 =?utf-8?B?TFM5Y1l6RGNYQWpTeW80QVQrVjc3dGl0QU1jSnY3VjhicXhucTVQOUREclNI?=
 =?utf-8?B?SU1UaEcrU2RIOVcrM0tVYXdzcDJETlF4QVkyd3NsY1NzRG9ZQjEramtLbnBu?=
 =?utf-8?B?V1pud1NMNnZzZzlwN0Y5YUw3b1VjczJIc2lrZFRYZjdMT25YZGllN0ZJRTBu?=
 =?utf-8?B?MkFsYjFJbjJFOENrczM1RDBYRGxnaWwyOG9QNXhHUEpWdWo2UGZwZTZtaTZX?=
 =?utf-8?B?ckR1SGQwQ0luOFppcEJ1b2drUHNkQS91Q0tWbE5XOXZEU0IxSmFFSUxEQWM0?=
 =?utf-8?B?SVVHWUZFNW9CcTBHdm9xSXVOcklXK0RFQUhqTUxyY0Z2Vzlkd3FzdHh5bzdz?=
 =?utf-8?B?Z0JpaFNzbUJUaTZHQmlLQlFMRnFNUVdOKzF4cXQyczg4eGtiWHphU0ZaSG1i?=
 =?utf-8?B?cCsxUXNCc2RtRmJDVTd2M0hFRk1GNVlXVVBYcStkVENiUk9sUHJxR3M4Y1Mz?=
 =?utf-8?B?V2pXVHhPRTJ3UXZCYThOV3Z5VndZa0RLT0MxaU1CdjdyZ0tEWWE1Rlk2RkYw?=
 =?utf-8?B?NEJEbHhVcjVpeVQ0dUpudmxTMnIxdWlXYlB6dStDV2NzMW1JZEhKdVV4OEVD?=
 =?utf-8?B?RDA3WExNWXp6WTdtVHRnL1d6UUhjeFZxam90bW5KZmI5aE9McXcwZUpGMTd2?=
 =?utf-8?B?QUhvUHltdHFCSmIxZzc5RG9FZXVCTkZXWXNWYmlYbml4dHB4Vkl6engvL3ha?=
 =?utf-8?B?Rmg2MzBBeEpOYW0wNkovS0VmZDBydzc3T3VlUGtzLzhsMkFRcXVsNFI4c0Vs?=
 =?utf-8?B?d3JHYlZMcjlDSTJTU3F4Q0dscHhVdW5PNDFsb1FqQWNXcFVWZnFlOUlTQU95?=
 =?utf-8?B?VXhLQ1p4OUU3TVNyOFZSR3N5d3N6TzdSd3FBTjZ2WTh0S1o1alpIc0s4K1R4?=
 =?utf-8?B?NWJ4NEF2THk5WUxXT1JaV3VaVVlGOXE5bjVPbkVKNkdHOFJkY09MMmVHQVdm?=
 =?utf-8?B?dStxZWNnc3NsMFZ2OHJaQndGZUlYMnRVeUhYSURnRHJtQ1ZqcnRycTVwejZz?=
 =?utf-8?B?eE5xM1hxRTZWZHlZdEozakdTd0lNOHJnY0tnZWgyUzVwN3pwQmNZYmI0RitR?=
 =?utf-8?B?QWNteXBabk1ud1lzVEE2K1pmTkhlbUZMNVZ4ZGIweDBvWXV5RlV2SVRDU0lI?=
 =?utf-8?B?Mkp0L0YwNXpNTTIyTUZGclpORW9CdXRqcytYbSt5cjBZTlhTeXpzZkNza2p2?=
 =?utf-8?B?d2djUVlSTWE3RUpqd1h5cHl6UGxZYjZnM1VtdmRCV2tTM1dFTnJaSUVmN1VK?=
 =?utf-8?B?YzQ0WmMzMExYeUhxWDA4bi9lNjNwcWFLdCtWKzlHSnMvNkdCS2pwbHN1NkNV?=
 =?utf-8?B?ZlZGaEcvMUJJekthaDZRbElXTXloSWYvZ3hwMnhSbmhXUjZRT2dUaWlIU0hr?=
 =?utf-8?B?RXBKUExTVWFhd3EyMUdwSFUxMUZDU21kaWR2WjFLWUwvSkxtK2NiNVFKendl?=
 =?utf-8?B?ZitTYjllcThYNDFBU1ZhNXVQNjI4Nnl3Z1plMTdJbXlTd0N0anl1NTFDVkVQ?=
 =?utf-8?B?VjUzanRQcU9kd2UwY0xPOHZjZjlpNFFNZVFTR0xpRUF3dk5sUk1mRHhrWVlI?=
 =?utf-8?B?cGxaRnloa3Yvc0V0SHUzTEhpT0dWbW1zQzRENTNwK0h1ZFAydDBKaExDQ1Z6?=
 =?utf-8?B?Z0RlMUNJeG5rTGJIUzVQLzZuYVkxdGRhZnMzNEdJZ1Uxd1ZxZ2hnTElDS0R0?=
 =?utf-8?B?djEyNXNGUUcrNXdqQ1gwWWFqNElrUGttWnJBelN6VmdBNnB6OFk3OEpZUGFi?=
 =?utf-8?B?Z1p2OWdmazA3WkVPaUlCOWptY0lWMnhCUHlhUXF2WVhYSVlzditTVXRmOXNo?=
 =?utf-8?Q?G6Pig0oO89dPTwiTOFMPVeqG0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1feae24f-0066-4b68-2088-08dc5a0f779a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 10:09:26.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDp2TDm58I9MbFEvqaBh9FvwdI8PjgySP4l2NAsYBEEdV2FnEHqZvYHAlWFHBMH0KThSYUDszsgpwL0IAEdGGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604


On 10/04/2024 07:18, Krzysztof Kozlowski wrote:
> On 09/04/2024 10:23, Jon Hunter wrote:
>> The dtbs_check reports that the 'dma-coherent' property is "unevaluated
>> and invalid" for the host1x@13e00000 device on Tegra194 and Tegra234
>> platforms. Fix this by updating the dt-binding document for host1x to
>> add the 'dma-coherent' property for these devices.
> 
> That's not really proper reason. What if DTS is wrong? The reason could
> be if device is actually DMA coherent...

In this case the DTS is correct. I guess I should have been more 
explicit about that.

>> Fixes: 361238cdc525 ("arm64: tegra: Mark host1x as dma-coherent on Tegra194/234")
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   .../bindings/display/tegra/nvidia,tegra20-host1x.yaml | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>> index 94c5242c03b2..3563378a01af 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>> @@ -177,6 +177,15 @@ allOf:
>>   
>>         required:
>>           - reg-names
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - nvidia,tegra194-host1x
>> +    then:
>> +      properties:
>> +        dma-coherent: true
> 
> Do not define properties in allOf. Put it in top-level. If not all
> devices are DMA coherent, you can disallow it for certain variants (:false).


So for host1x we currently have the following devices supported ...

properties:
   compatible:
     oneOf:
       - enum:
           - nvidia,tegra20-host1x
           - nvidia,tegra30-host1x
           - nvidia,tegra114-host1x
           - nvidia,tegra124-host1x
           - nvidia,tegra210-host1x
           - nvidia,tegra186-host1x
           - nvidia,tegra194-host1x
           - nvidia,tegra234-host1x

       - items:
           - const: nvidia,tegra132-host1x
           - const: nvidia,tegra124-host1x


Now only the Tegra194 and Tegra234 are coherent (which are the latest 
devices). So rather than add this to the top and then filter out all 
those that are not supported, I opted for the above because there is 
only 2 devices that need this. Admittedly, as much as I like the yaml 
bindings, for things like this, it is not really clear which is the best 
way to handle, so appreciate the guidance.

Jon

-- 
nvpublic
