Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012009.outbound.protection.outlook.com [52.101.53.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753882882B7;
	Tue, 24 Mar 2026 10:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774347404; cv=fail; b=IKC9RRnn7m2JpUsT1ETMWMrJIUlJ3oxGkzpohOdt0M5J4WdxNciXipBbL9Uph33VOGY4mc8YlSkTXafk1slWdgHgV1hqNoXlsSZcxUkFlRfjyAw85+UaKpQmZzoFq/dLVthvPsU1r/Z9W+qQxgR2M/ZCRVqUmBpxMwRpOqsfnzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774347404; c=relaxed/simple;
	bh=t+1+bxQ77ZGYblvXas3+5JUGEOjCUf+F0Rn1KN4UGEU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H0D/oaLcvV0m26n790jAMCGtHa36UifILQyQIWqCFshNMEJlhuWk3qWGqAwoOxa3l905nqiLKrDps0I5CPEmsdHxGgP2uNe8jUNsKuuEv7MPo9iVms79t0EhSRIpJVVJPJ8bA8aLDJxqIEEJnSDLej0B1eHdDFLnuB47kznD9LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=elM8WIJF; arc=fail smtp.client-ip=52.101.53.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="elM8WIJF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcqRgFdoKnPJzpOvLhddRSyenrIbUFPFyjeLGOz3CedDJi2DGjiV1bm81ObuFFrbW6hEQksQeXzfuWB8AMW7C1/FXpY8ZDoqWSC2VFgXTDg83WlJxiPYy9BDGGBkpExqvJhhfSgC9mv8oj4dvMF8M2eMNXk+VEIwZqjlrYLhbWGfwZWev/VSLHJ7nh9f24kDk9AQl+rI4cFa28KnQ4iFmJCoadF+2nfXS9t6RSYc0S0wX+aHL6oEb91dR30ZONcb61zTBch1wjINm6/DuY3C1LdcsMeLU87yTif+P91LMZRbV9N2myy/l5HyKBXGHliNZZPBPHYPImL3bRLE2xRhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qgkp+9LkEc1CAB0SYE8jivWEuT0GFF8cAVqS/BLiuYY=;
 b=FABRa8sELo6xGsCVvORTp8VxEhtaEF0lLIX0b6oWAB++ClbH3muAkVI9dBDFs/731WTgPkSQFlUXiWqq1OXFjVWXsHgWFgOkXWXnM/74m9mUOtrJvQbANnYufdWmh/06C8XYugLGFlJMBQmW9pofs+7e+BSaMLB8xZbnw4d4Ocxn4BFReybuK+nnGX715Ve7Cejd01tzX3n9t9bagBr6pTO3/BL/X+9PVtmg921N/5E2p1NNbWlaNibKKrdDdzJ3uosdb2t5W2MV1LdPrOk1NLY4257eMyBg4S5Exba9TNXJ+cDysOlWSf8L6UaL6JgpNvP71XQom2xbE6kb1Hr9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgkp+9LkEc1CAB0SYE8jivWEuT0GFF8cAVqS/BLiuYY=;
 b=elM8WIJFUIp5W5pBYCmKC/lmep7FgwATBh+0X8cqypgL4ASKwTh6TRK0yiVTBVYKyV+/v32wQ10ruBS2Gdfl3N0/tWWqAM1sNm8JbSRCy7ROVR8NUbkR8c73hofO2lDK0BqMzXZu35W/gpq4CI4InB1k0IlI6Xcb4UCUYUP4hcAGGEmnIiFQqEaL7W8KvRTtOpofjH9xHZbMC1H2Z2HBxHnAhiHWvVblrIbZ/FMcvWSlhnX4GIA6VyHVKXc7JVZQU9Ge3nB6TrVBE7wAXigopPx4+olHyu+gyDxUo1X341c2LrBmsLg2DccddMb5VdFjixF1OlE5bnXDdL9hvsnWFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 10:16:38 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 10:16:38 +0000
Message-ID: <af04fc85-1ed4-4046-86ee-1ffcec8c44cd@nvidia.com>
Date: Tue, 24 Mar 2026 10:16:32 +0000
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
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260127-diogo-tegra_phy-v2-6-787b9eed3ed5@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0180.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:344::9) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SA1PR12MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b48ca3-791d-4e64-b1bc-08de898e6f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	WLeWUT7ncMzXOgWJvbXhFj3LHRBegf9wzoJEIj+/WrAcuv2YFd2PazwfZ+/Y/LgPNP372xwkCJI4HwVLERNToNEyw0vzo5lBdhpa0sJgfWUvGufB7vuIftV14bGBt5ALJAn+oSaHXEXLijkxC+9hB4NkYSg+FaCeKtNnKpWf92C2XHjHgwzIm6mQHMLjEs+xEevuSxgkX1NhKJpS68KFGh421L1vKweclfniYE3xVw07AmbRMS0jGfSquc8p4xdi5wmPJrpiD6lxBU3gL3yiNSO0OuxBpxLByNcGoMPJdNOY4cOk/5nU6wfTzXITj02MLa3d2YvBI258GNgHqWfcLsjPe8qIlpYqKBTIBVwW+DRuqRCAS54lzTg7jhr+heIEGDf3sGlugCklO4lpZpNPH5rsuI2OwkcxxNydHR4cK5u7zdqnqC4BLZSg72aZlSSHOPt0Hx8yALkOy1baPJzcqCKhPnppYNmeC0j+Lrq5hh3tFx9fLcl8fUOme567faltVdXv4pvyUUnTMqSJZAy0+cmQooKhGwhbbVcyCHOiCkofQEt7gG7iqvOqt+hjsqsdFFKkgmFmLKyX5EIM2kpCdTsOWbosT2gN/8pQoATPweAUbl22+bJHd6cQ2p55ylgEkX1XhAVdHBYyzyfXhfowIBGghjo5b6oeSjcQGXyp5u9ZZLNMpYVIUqMW7GtPKtddaVh0DadYZ3ouZUb0CLZIwWBFT2EJ4I/IThAWui1UQusqVgQ41libibCYkUoshEGMuuEEcAUR/RsBm/bKuMI4Pw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1N4MEhVY1JHV0N4TFRaVEcwanY5QjltS3gya0pNSmJpZzdFNFhvSDN4MDFH?=
 =?utf-8?B?NTBVb3R1dnYzR3JRVHFBYWlzc01aQWZEdU9ObFpKZTVQa1JXdHZrU1dEeG1K?=
 =?utf-8?B?VnY0TEdJUDQxUWtJaTEyNTJVOVRIM05VUjhVMmh1UjFja2ZIWmFza2dBRnFl?=
 =?utf-8?B?dUdvQkVZVFIrdzl1RTc2dGJCU092cSs4WUpUeVlRNEpuaG5sU1ZLMHNMcGRX?=
 =?utf-8?B?VGFJMFYwNzVqZ09YMmZ1UEl4Rk5BNlhNQk5xZmpreVdGR3lSSGVydjFwQWtL?=
 =?utf-8?B?WUdXbWNNQjUyaUFoNnRSUUw1czExWHdHdm1Sc0hXUmJVbTVWWEc0a3RKNWxk?=
 =?utf-8?B?cndCS3lhQXlQWXFBNHhGZndmVVRVOTNBc1MyaHJKZkwxSE9lQ2RiYlIxRXRX?=
 =?utf-8?B?SWZOUkhYWEh4cWg2RGNkTTZhYkZZVGlXQ0tpT1RmVEdaeGU5dU5iemdEdWdQ?=
 =?utf-8?B?NmZJNHJVUEM0VXIyOW5CTXNkZ3dFaUJoek80eU1qcFNMRUlKcmxTRFc5RmND?=
 =?utf-8?B?RlZ3K3hPeXdJUW41OXdNam9PdXRmOHZaZDVLbEFBaVc5YTRVRGpHdktTZEc1?=
 =?utf-8?B?YTdYWnNGMmk0a0hRWFlJbW1TU0lOWTEzRmE1bHNnY0Z4dFVIblRWZVhEQUhJ?=
 =?utf-8?B?cXFWazBkYk5UNWtGOGNzZE9uWnFHL21FRmNGTnJDOE9kVXlYSmFNTjBjV2ov?=
 =?utf-8?B?ZVgzbCtURm9JYkkyeEpobGVKQ0pkbjAzMXZCb3VFVnJqaGVlYzlyMWpteUMy?=
 =?utf-8?B?ZGdUWmtqVFVTZzZvL1dIT1F0Mmx5dlRROW5PemFDVjNyS09zNGd1YzhwWFVw?=
 =?utf-8?B?SkRrM2Nwazk5NmlHcE1ZKzBSSnorVDhjYW5kWTRMZUZGN1U0WTdObVp0dVU4?=
 =?utf-8?B?dnF6ZS9uL2Iwa2QycGY3SVZ3M3lMZ3M1WGNpS3hOOTQwUnVrYlFBVVhOU2pu?=
 =?utf-8?B?aFRWcmpaNFR1M2VWK2RXaS9TMzRtNi9vOWRTOVNnajhsUmRKbWtoVzB4bFZr?=
 =?utf-8?B?djJyczd3djhzOSsxMVZ3c1RMQjRzckhDU0xqMGYySngzaWFIdEpYSVhUS1Ni?=
 =?utf-8?B?N0h4cVRHZVJSOFAreG94Ry9iYlRNNm9aaHdWUXlGd1dleEQ3bStZZzJBZmls?=
 =?utf-8?B?cjA4RWxvMDJJTU8zVisxK2w2RzdVbGlVYU5MNVVmMGN1WkdId0xUcHhWRkRZ?=
 =?utf-8?B?UmpBWkNwRllONHJPOVUwNUI1dVZ3ODQzaEQrZWhKN3dIMkFFenY5S2VEakdT?=
 =?utf-8?B?T1NtWlZPRFdHc044ZS9UdExNVHg0OENqZ3VLSGxBdFlCZUNMQ3M2YzlTd2Jm?=
 =?utf-8?B?dFpBbkRjeFVLbFd1UStoRURBcGkwQkxDUkU4aHozLzRGL0p0RG15QmFWdjlK?=
 =?utf-8?B?NTA5dm5Ob0o0RG9KUWVKdHVZdXd5cWxzR0gzcU9aT0I0ekFQWmNZdUtLaFgv?=
 =?utf-8?B?K0thL29iT3A0aGt5SnVQOXQvbE5EVEVneG45U1ZtbWlwMFYwNFExT2NuVGls?=
 =?utf-8?B?OStmdjZDKzBLZ2VPOU12K3JNcXRPWmpnVnltNEVXQk8rS3B4ZHFaMkp0eE0r?=
 =?utf-8?B?Z3pqRFJBRW54NVNhZWIyQk94MlVtekhxUkhNbVFENnQ1TFU4S2toMnJoZU5I?=
 =?utf-8?B?Z1ZPMGJwZmpSeDNQY1pYM0liaG1DQlBrN052dTB2aXRVWDJlSVZMOWlBcnI3?=
 =?utf-8?B?S29FV1RKNUYxNHEveEN3VWQyZ2t4Z3grTVVMVnFZZVFFQVVGRVoyNVd5VXFD?=
 =?utf-8?B?VDE3YzNzTzlncittZXlpMU54K2dENUhxbFAzZ1BsMkthRjVMT2xGNnI0NU5E?=
 =?utf-8?B?LzU2Z054aWJaMytnbWQyMXZxS1FnNVVoeVMwUmp6QW5NTTBOMlZHRjJGOFNR?=
 =?utf-8?B?OUdIa2thWlFPbFk5QnhmSXNyTzRQOVpiYjZXejhLT0E4ZzlDQ3dvamRiTzZM?=
 =?utf-8?B?c1NTcEtlcHJONHRMZ3B1eVBPODVqZkpzSXkrcm5vTEpudTJRUWNkUkZzNTRk?=
 =?utf-8?B?YUdKUFVMSXdqeWRDT1FxOWRhb1U5c3QzK3kvZ09lTWF5aUR6TGYya2toNnhp?=
 =?utf-8?B?YVRqNDlqQ2M4TE9CVnlZT1pDTitJU1Rqc0k1YkZLL3RKU2RjYkhNQ3IrN3dq?=
 =?utf-8?B?VnpwQ2JqNHRxNG14Sis0cit5Mm4xTVZ5UjU1SmE0c0M5ZHNyK0kzbEZwV1F6?=
 =?utf-8?B?Wmo3eElJQzEyYjFMdDZwNHNvS2YxVGk4U1N4dFhieStQa1ZqVWtpbWh2K1hY?=
 =?utf-8?B?UWNJa1dmLzEwNTN1QkNMaUp4WnNjWmlTWmlESmh4TkljbWdqS1B1YkhmZG9E?=
 =?utf-8?B?V0YzZENnWDVaa3J1WVh6cDNNcXJGNFpGNmxLWkRHaGd1SDY3TWVsdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b48ca3-791d-4e64-b1bc-08de898e6f56
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 10:16:38.1608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrtoOnV7dkFzoTwHODAEdPXsW+vuuiFAgvLsILVmLNFFl+RlXMPtie+agU5YQ65hGaqpL4wvDD8HlPstCIny0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6701


On 27/01/2026 15:11, Diogo Ivo wrote:
> Move the Tegra186 PHY .set_mode() callback to a common implementation.
> In order to do this first revert cefc1caee9dd.

This commit message does not seem complete.

Furthermore, I am not sure why we want to revert cefc1caee9dd. We 
purposely moved the regulator_enable/disable into 
tegra186_xusb_padctl_id_override() because it is tied to setting the 
USB2_VBUS_ID. So I would prefer to keep it this way and move the 
Tegra210 implementation in the same direction (if possible).

Jon

-- 
nvpublic

