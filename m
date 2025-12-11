Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241F226ED53;
	Thu, 11 Dec 2025 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765439252; cv=fail; b=H+abT54GwVar7iUXJDqtyJLCZrrajqvqzSJICcNI/u8H+UVaqT79IbTBrgBDlqIKycWr3dufpRkbEUIOnAEebEPMBc/+Y6kQdGJXjKAWM9FeaxKC9uaTnvc2mqDpRT/b7UfVpQolsQEsynnv89bfmNWhSwcAKTFi2MykB4CGWUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765439252; c=relaxed/simple;
	bh=kyhvCZtacjOOsE0FeoKap7DpajZKBbZgpw6/3t1NOds=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZVLHvbSn+boepmil4MsNLRVJaALRpdCUnV3aoZlFYF22ikoHyQgkoCcp0uebvQlTHVbiw7kTQjE5wFynQ2iOWJCH1XrKpfQIox/yIppsrpSHello6HZY/cs3hRZLzYRuo9Awt25gZXVXgfS7xoAz9lG80BLbAAqUCwR1K3tiDGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m5DWLqLN; arc=fail smtp.client-ip=40.107.200.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m5DWLqLN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7zuaXfDhdu0LxCxZyWvegANZ2M1Dqb9L/IWCy3s/rTt6qxeC1BIYkFOGfV+rkyazhPcHYohzfKvPiugGbc2KB08FCjUcR8ntnkgvFONDHwVCGryTZCOSQNsimNVPDaL5PWSZS4j6pyIMBzlvXPa0f6L1EcyX1fuA/UT/QIYx3hPoVGsXM7n9WVVXcPSD1AXfWD++o0jm4M3VokiM5qhHotBcxnbKr2+yiynQ5Xm0EThMarRH/mksIGDDf36wAYkizEmrKtVTKo/Xmx1CHd2/bbuRXpcMgkbiWelWMFPkSBT6Vqgu2EZ2Noxr3TNCOY5kT2Xb+LzU2xIRWxBU9PtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHZmG2NvpmTkpxw7m9qynNTIqsdm3hXhCZevqOkKaXk=;
 b=P6SxszZGeW21wDzdi9DNJaPpNXGtJn1ghYSW/B91fCQ2+YfIxliN+dSjvPJbsyJ1qCqaP8FnPQt29UUIEGwftKFYjW8j3VgeVhnConsJLUjD+Eaq7G4jnx+zXqYUCOsJoWe+xyY5zKVoSYIqHer0oNOvfBIvf62jaB+g3Wb+CzmqEegPzlfVx8NxvPZmeS1LYcRhKBnq1/HbOOv3A2K9d3lW7aALQ/kWIEJVnx51Th5fJsBteaTo0foX6aBdbhluhLV1o/RtZ185DPLalvbzLNSqS2mXLrfNNi3OsRubyffC/LwjzBMUTwRIbsH52gfj8BAlqAqOqTT7sfazaW60lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHZmG2NvpmTkpxw7m9qynNTIqsdm3hXhCZevqOkKaXk=;
 b=m5DWLqLNVRza3BVLZA/8zeucPj0iuBPHm8OxMYeN22ESvYqpMDR0EojeS8Uex7rkdiF6dCYJxuVn21uxAUkEw1cEZJ7vRB0SauF0rrvHbZWgwxCsjCJAyO2xEnYUdZvSi+9R9Pxy0rDxFHmbGa2ekOQYe98hfhLpBxMfqqgq48Cf7OMWTJ2Q6Dd0bxRUpRqxw3+g3i0aiuA/EQ0BSiU88b2PWpuRnscpVmU8AwGX+PPCbdFJKDNOoDvV+AXCcLBSiT5MZ8C/s4CsI+CTI6ugy3dgW7sTpa2YjJk0cYeANXsE08w56p9mVBOCxTT/6uixVlQFa0664fSDGBqetDVnbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CYYPR12MB8922.namprd12.prod.outlook.com (2603:10b6:930:b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 07:47:28 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 07:47:28 +0000
Message-ID: <adc7ca5c-69d8-4164-bd89-3381b101576a@nvidia.com>
Date: Thu, 11 Dec 2025 07:46:09 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com>
 <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
 <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com>
 <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com>
 <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com>
 <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com>
 <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
 <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com>
 <CALHNRZ_GGAg_VP8gSdtw_1CA2A0netrOeA2+guZfxyG7POhHoA@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ_GGAg_VP8gSdtw_1CA2A0netrOeA2+guZfxyG7POhHoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0146.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::26) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CYYPR12MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: 07bdd50c-fcf8-41db-30f1-08de38895e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXZFNDhCS0ZUM0JSTHVCVDBvb3BJRmRremh6VmVFM0ZRdE1CL1JKeTIrTjR6?=
 =?utf-8?B?bUpQVElqcE1TdFZCdjhLaWY2YktQeDl6WGt6NkV5NC94TjZoRGREaUF2ckZW?=
 =?utf-8?B?VWlGdnRoUzVjTWdDRlpDOUZVUUhhQTAyMHV6WVI5ZHVWb1hZbWpmZmZEOWJK?=
 =?utf-8?B?QzJtT0ZYUU9Gd3BsRE5mOFBKa3hCZ1ZzNFl6SmF0MjVxWDI4QTVVVHIvL1NV?=
 =?utf-8?B?Zk9hUmJyajZ6RWVPdEJVMEhuNjJNVWZ0OEtBMjRsWW95U1BkU1BEMXhKeU4r?=
 =?utf-8?B?dnNGOFVvazdzQ0lCNFByYzVvcTNtckw3OXlKMk8rcFBMZDYreVFDc0J0YXEy?=
 =?utf-8?B?bDZjQlRvWDR0dzhzUXpIWVJhNXMrZ3U3SkhEbUtwVTNMVHl4eTZCcmFTeVBM?=
 =?utf-8?B?Z25STGRnL1R2dzAwM3JTeXJaaDduZDZBTlgxMStnK2p0SDdmdjZqSER5TmR3?=
 =?utf-8?B?MlpsdDlkWEhqNExMa3U3STVYSlp2ZmtIZWhJZ1hrVHUwaE1ZRnVLQXdEZFpu?=
 =?utf-8?B?dGxBdTJQTk8wNWZHRVAvaFU0eUxLWmp3ZVEvbVBUUUZMNCt5TytGbUwxUVFI?=
 =?utf-8?B?dTVqSC9BOFNEK2tocnVxTzRYT0Q1YmI3d3Y0T1hyRi93UTZWK0RHNEd1VjQx?=
 =?utf-8?B?a1VudFBXdnhoMnFJYjVnMGlhcmxOM1F4RXZPeGVGRHNuRFZEWk1ObTUrVEVn?=
 =?utf-8?B?OHE5ZkFmZ2tVM1cyUCsxRmZ0ZllMbnB2b1NFMVZnVUswQVJUeTNETFBnVmxo?=
 =?utf-8?B?S281SEV2UzEyWUcyYWRhUkNoeVRwcVByWkVId2pYekpvSlFXUHlWd212WUd2?=
 =?utf-8?B?dC9RRFRVUzlDYm02R2hNR0RVRGxQZytsM2FWMVZhdm5MZVUzc3BpZ2lSb20r?=
 =?utf-8?B?aHZPcG1Kc1ZRb3A1MkpxVFhMWWNqa1JIYWZjY1hKYlJqSjkzOEhHQUticUhy?=
 =?utf-8?B?M0xOTHIrSkZkbFdpVWZ1NnJTeElLdHM0S2oraDVGNnpBOExYUERlZ2RSK1BG?=
 =?utf-8?B?RkNFTHEwc1hBSmFNYzQ4NVdiL0YrdHZsRGpwK0w5VnJlRnE3SU9FMFo0c29m?=
 =?utf-8?B?bE5md0NNOUQ4bDJ0bTFJQ1RFaVMvcmJZdHpmTkRQTDlpOTByTkZKMHVFNkZS?=
 =?utf-8?B?ZzUrNEZZc3dFUjFUVytSMGRCVytLNVJ4aFhMRjRqOVhPZTB6c05OYVpvZzFx?=
 =?utf-8?B?UU5EaGNIdHIzOWtzN2tVY1pybTA3dEVMRnpJOGU0Ukt4OHhWSFJBak9BSzZB?=
 =?utf-8?B?TzBwQ0tSdnBqRXlvSjJaMXRGbi9XM0s0alI4a0pxMmo2WGdkYzhWT0p5TFlX?=
 =?utf-8?B?aDdmT204c0pyMm0rUHRaS0NUUFVuemhvOFRkeC9rWXpTd2ZjSFhvdTFzZnk3?=
 =?utf-8?B?NlNCZnlGSDhYaXpHZDI1amFhY0NGc091K3ZsTUxLeVZRRG1IQ2wyUitzUDdv?=
 =?utf-8?B?bEgzcmd4MDlTYStoMUxxRTlNdXlnNEtiN1JkbUd2c0VhUFNoSitpbDNNQ0xX?=
 =?utf-8?B?YmppZkI4NzBsejI1dUFKY2s4TUpqSktyaFZsRXFvSVhSL3RBWTFvSDFtNi9Y?=
 =?utf-8?B?eWdXK0RjT0R6NWU0R0lONGlJSzVKYkhYTVlSVHp0dnFQWVMzMm5ET2J2NXVm?=
 =?utf-8?B?cnFMcERwcFo4OFo0c05aSjhTcjB6M1JHaVcxb20vUkRlYWczOVF0UWErT3Q5?=
 =?utf-8?B?RVprbUlGSUlaUEJPVG5XazdISEtDS2s5YnZWVjZ5MHgrTWRXWTF2M2xVeXBx?=
 =?utf-8?B?Vy9aVTBXQVowckk0S0c2VCs0Tk0rdi9SamwvVVh3ZnlFMWxFemhSS1Ird2Vw?=
 =?utf-8?B?SG01eDhuQ2F3dzBKdGJNSmxVL1laUzhVTUVEeEtvQ0plbnVkUk05WW1ydDZX?=
 =?utf-8?B?V2tERHRSSXNiR2I2N2NtcGMyVXo3cXBnQjBMaTFsTnFoNXBYdzZEZW9TbFN2?=
 =?utf-8?Q?aw8AHmG4cBmo7aX1aztRLdezlPwe8AHJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3ltUzllcHRtSGJveHhjMGxiaU9icEdWb0NCbzlzMzZLeFBOWUZPdDBKQzI0?=
 =?utf-8?B?bnhPK1BGUVVoSlp5WVdTTDVENUdIZytqQVhiaG1kV3ZNY21rR0NTamJ2TCtw?=
 =?utf-8?B?b3UvWTBuWGN5aE52K3Q5TVNtSjkrM1dHY012VVMwZ0tqaG5qeVhkZEo5U0gw?=
 =?utf-8?B?SS9BQ1lBdEYwS0pyWncvSm1Cbnl5K01BSkpubzc0VUhtSGFVczdOa2lEaTdv?=
 =?utf-8?B?cXNIblFuNlAvS0xyMDVWNU5vSm9xbHhKYTFVWTY5aFgwTk8xemllZStvLytq?=
 =?utf-8?B?ODBTbzNqQVZVbGtGczRSaGlja3R6NmYvQWxZeEVYb0JscGZtYWUwZFdEUjVn?=
 =?utf-8?B?ZWQvWk5jWXdocTA3WEx5STBPdDZvdGhNc0Rla09VMWF5Q3U5cTdCcVMySHh6?=
 =?utf-8?B?K2c0ZlFKeGZGelBKeCtYb2VDTERzcXJDazZUM3hzb1NxazlSK1FDT212SnBG?=
 =?utf-8?B?OHU3U3lXanlwY1Q5SXBBbUp2QXI0SE9YbnpzOWNMalJqSGlGa3pnNlUvZFU0?=
 =?utf-8?B?QlRXSnlaVEVhcy94dFdRRm45eTVNSVhDTmRtbmZpaHk1WG4xZmVoWGFwM1ZQ?=
 =?utf-8?B?VkREVU9Fcm4rdXpCSDZnVFhINjZZZmRRVVdxQndHbFFxcExOaVcvZzhkcmw5?=
 =?utf-8?B?b1hmbDBUaWxNOGhFcktSYmM3TVJBcmlCV1NoOTBXcVRNSDl6aXVqdGlVWkx6?=
 =?utf-8?B?NTZkNlJFcmtRTFh1eVFsNGVob1BhMTI3ODkveW5vNllyM2lOWC84NVhuRDdQ?=
 =?utf-8?B?NG8xTkJvUGNpeDh6MGlUZE5FcDVXYk55MWRERWJCQU5NdmIzTTBPKzdsK2No?=
 =?utf-8?B?Y1BIYnZabHk1L3VxUjUxcGV0TVRWNEVQbitsQlNmZ2Y1U2M2bTZQNjB5ZVpI?=
 =?utf-8?B?KzVETXhEYXllMFgxUkpLTG9XRjJldHZPRTB3Q21XeUVobWxsc1ZhRXRHZ0wv?=
 =?utf-8?B?R2RPV0RDcXpHam94Z3VKWDd2SjB6ZklFY0JVQXVzaFhZMGZaMHl1N1hybE1E?=
 =?utf-8?B?SnAzZTQ2cXFWNEN3bVhiYWwxQ3UvcmlZeHgvWUpkN2hvOE9tZVZZWDJPVmJI?=
 =?utf-8?B?a1paR2RrYkxSNzVmNGRNM20yWm9OQnBualB6ZzhaRDEzZXJaZVRCWThSQjJ6?=
 =?utf-8?B?QWNqZHJEbXIycVlpRElpc1VyM0hXS3c1V2dwd0kzemljVm9VTXVqZzBiNmd4?=
 =?utf-8?B?V2VkY3RkV3pTcXFmby9oV0k3SUtuSFdxbW91UlhzL1ZieTF5Q2JaRmI2ZXFn?=
 =?utf-8?B?MWd3VUJCMGR3bVpmcnZ3MnRzZTN4ZmQrRkMydTllYmJmbGU1RkJnaFZIQjJZ?=
 =?utf-8?B?WVRKTVdUNG9FMnNxZjFXeENjM1A4dG0zSVdFVjI4cmVmOHU4RTZzekx4WFhv?=
 =?utf-8?B?enVHSmFMMFE0MjVQUVBmZlJtWFh6c2ZNaFdieloya0ZrYzBlcTdlWEtIMDFp?=
 =?utf-8?B?a1d1ZmtuZWhvbVYzUnNzYzJ0V0dEVWZxYXNxYmJCYzBQNU9rcE16b3VIT2xC?=
 =?utf-8?B?aUd1b3UwWnNqN2hWaVZpQjRiRFBJSG1COTAvMjFYWmxEUWJScFZ0Tm5maWtt?=
 =?utf-8?B?VUZwN3hGejJDWTR3VkZDSngzcXpDR3dKSWdDWE5OK2hIL0I3dGVvbFh1dytC?=
 =?utf-8?B?WWZ3WDRLbVJkY2Y0WFJhSFEzWlloZXN2ckhpT2tjL3RLelN2NXBFRldpSllN?=
 =?utf-8?B?bVFwSjF1ZDhkSnpYWmdaQkNkZWxJWlJlRWo2UnUwc1F0bkIvZ0dLWDVlNlRI?=
 =?utf-8?B?eFJHMVZKaFNqTURad0ZSZTlIU3BXNGZqK3Y1UmdKZ25GS1dOR3pHcFI2TUZ6?=
 =?utf-8?B?Slo3N3lLSTdLcTVPbjA3YkZoUmI3UHFncURaS2RRbFoyZ2V3NmsvZWhETEtU?=
 =?utf-8?B?YjNTWHp0dUN5K2JPeFBnUmFIbmFYWGtpT0E4cEE0TmZpMmdISEp3SFpoTWtQ?=
 =?utf-8?B?NGt6VlVaVTB5ZXRmMEduL0lHYkxSdXgwa3dEUHNxMFJuTDdwdnlqZ0oyR3VR?=
 =?utf-8?B?STEwd0JON1hReXhwN2JTd1o5UUVMNEhDemFHOFNxUko5aFVTVkxESWdQNlZW?=
 =?utf-8?B?RjF6RkdlNUNnS1NMcURoVy9ldnJsMjhzdnJBaU1EanhRVWxBenZEUmxMOGZJ?=
 =?utf-8?Q?Va//UbMWwfFlZATJhWFMFJy/l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07bdd50c-fcf8-41db-30f1-08de38895e6d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 07:47:28.0416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujlaiT58QYKlwMAW6lXIx8BO1dhvgu9ttyopaB6ZxKB/sJmPAC1uBtrvV5+O5MAkh2AyZdi2y/4V6hoXiZqjTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8922


On 10/12/2025 22:41, Aaron Kling wrote:
> On Wed, Dec 10, 2025 at 3:24 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 10/12/2025 18:32, Aaron Kling wrote:
>>> On Wed, Dec 10, 2025 at 9:04 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>>>
>>>>
>>>> On 10/12/2025 05:06, Aaron Kling wrote:
>>>>
>>>> ...
>>>>
>>>>> Let me try to iterate the potential issues I've seen stated here. If
>>>>> I'm missing anything, please fill in the blanks.
>>>>>
>>>>> 1) If this change is applied without the related dt change and the
>>>>> pcie drvier is loaded, the emc clock can become stuck at the lowest
>>>>> rate. This is caused by the pcie driver providing icc data, but
>>>>> nothing else is. So the very low requested bandwidth results in the
>>>>> emc clock being set very low. I'm not sure there is a 'fix' for this,
>>>>> beyond making sure the dt change is merged to ensure that the cpufreq
>>>>> driver provides bandwidth info, causing the emc driver to select a
>>>>> more reasonable emc clock rate. This is a similar situation to what's
>>>>> currently blocking the tegra210 actmon series. I don't think there is
>>>>> a way for the drivers to know if icc data is missing/wrong. The
>>>>> scaling is doing exactly what it's told based on the icc routing given
>>>>> in the dt.
>>>>
>>>> So this is the fundamental issue with this that must be fixed. We can't
>>>> allow the PCIe driver to slow the system down. I think that Krzysztof
>>>> suggested we need some way to determine if the necessary ICC clients are
>>>> present/registered for ICC to work. Admittedly, I have no idea if there
>>>> is a simple way to do this, but we need something like that.
>>>
>>> I'm not sure I understand how checking clients would work. Is there a
>>> mechanism for the emc driver to know if cpufreq is registered to icc
>>> in a way that works with probe deferrals, but also allows for it to be
>>> optional?
>>
>> I am not sure if such a mechanism exists either, but it seems that we
>> need something like this.
>>
>>> Alternatively if there is not, can we just accept the abi break and
>>> have this and the dt change depend on each other? I know it's not
>>> desirable or the first choice, but if the other option is to rewrite
>>> part of the icc system, then perhaps it should be an option.
>>
>> I am not sure it is an ABI break, but the default performance might be
>> worse. I am not sure if you are proposing a way to enforce the
>> dependency or just saying that there is a dependency. We can't do the
>> latter, but if there is a way for the kernel to check the dependency and
>> make the right choice, then that should work.
> 
> So we can't accept that older dt's will run slower on a newer kernel
> and say that a newer dt is needed for full performance?
> 
> If that's not an option, then I have no idea how to resolve this. I'm
> not greatly knowledgeable about the icc subsystem. I can try to look
> into options, but I'm not greatly optimistic about me finding one. If
> someone could suggest a concept on how to make it work, I could
> implement it. But I'm not even seeing the concept right now.
> 
>>>>> 2) Jon, you report that even with both this change and the related dt
>>>>> change, that the issue is still not fixed. But then posted a log
>>>>> showing that the emc rate is set to max. If the issue is that emc rate
>>>>> is too low, then how can debugfs report that the rate is max? For
>>>>> reference, everything scales as expected for me given this change plus
>>>>> the dt change on both p2771 and p3636+p3509.
>>>>
>>>> To clarify, this broke the boot test on Tegra194 because the boot was
>>>> too slow. However, this also broke the EMC test on Tegra186 because
>>>> setting the frequency from the debugfs failed. So two different failures
>>>> on two different devices. I am guessing the EMC test would also fail on
>>>> Tegra194, but given that it does not boot, we did not get that far.
>>>
>>> So you're saying that even with the dt changes, this change on
>>> tegra194 still does not boot before the regression test framework
>>> times out? If so, I need some more details about this. I have not seen
>>> issues on p2972 or p3518. For example, if I boot to android recovery
>>> where I set the cpufreq governor to performance, I see emc clock rate
>>> set to 2133 MHz and 1600 MHz respectively. And boot time from kernel
>>> start to pixels on display is 15 seconds, give or take a couple
>>> seconds. This is using the boot stack from l4t r32.7.6.
>>
>> Yes. The boot failure here is not a hard boot failure, but the device
>> takes too long to boot and the boot test times out. And no we will not
>> increase the timeout as it is there for a reason. It could well be
>> because the default governor is not set to performance. If you boot with
>> just using the stock 'defconfig' for ARM64 without setting the governor
>> does it take longer?
> 
> So, I checked out next-20251210, then b4 shazam'ed this series and the
> matching dt series,
> 20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com. Then built with
> LLVM=1 ARCH=arm64 make defconfig
> LLVM=1 ARCH=arm64 make -j33 Image nvidia/tegra194-p2972-0000.dtb
> 
> I packaged them into an android boot image using a lightly modified
> copy of Gnurou's bbinitramfs which just drops to a busybox shell. Note
> that this includes no modules, and since the pcie driver is =m in
> defconfig, it is not included. Then I flashed that with the l4t
> r32.7.6 boot stack to p2972. I got the shell on uart after 4.275
> seconds in the kernel. Per sysfs, the cpufreq governor is schedutil
> and all policies are idling at min freq, 115200. And per debugfs, the
> emc clock is 800000000. All this looks to be as expected.
> 
> I have no idea why the regression test setup is timing out. I have not
> seen the issue through any of my testing. On pure mainline as per the
> above paragraph, or with the patches on the android common kernel, as
> per my target use case. I don't know what to do if I can't replicate
> the issue. I don't suppose the flash package for the regression test
> setup is something that could be released?

I thought we already concluded that you did not see this because you did 
not have the PCIe module present in your testing? From the above its 
sounds like you still don't have that driver present and so you don't 
see the issue. I guess I am not surprised by that but I am not sure why 
you are now saying you have no idea why this is timing out? I thought 
this was understood.

-- 
nvpublic

