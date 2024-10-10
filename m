Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57B38DE1;
	Thu, 10 Oct 2024 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728571521; cv=fail; b=uQJSy93p+PJROOr4UdSMwDs62gydgBdQCYrJMKfAusxTxE/2VbNXQSlKwFmy7hciroxk7ON9w7L34f1yL4/bsrzWjIaR1jPDnNyZpQwu5NeLWRdrgqt2w2TKEf41EBuqIzT8M5AV6JGDnvcyBDcUp86vJnFLRFuHQMll9BZVQQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728571521; c=relaxed/simple;
	bh=gBoILY7mDu4h+0PSedFLCguJh81ZqxELpzQTvX1kK3w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cDqWHUAX9dotolW4cK22cBYlPB99rmfb5R6T7EiSNycHg4JygogkDLHQOQP91LI/xKYet8Q8GSs5lnnwRNOqzDaePkkkLLIjfWGDDl+XYwNk7clGlbxtgzG4c/fwp787+Xkgrq+iWX0pllhLMzNfJ4TZZGghzQ9anU8ST5+g9mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JWkr02sN; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JWkr02sN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLi9UU5lfUZH4EntI+WhAI6h/aa49OljlhYj2PbsfRSGyz7CcjM/sjGNon6n5CHXqn9iMwm/3AcQcbmjQDLK7/BsVPDcKiHrRreVtNm9eWHxOzNS2Gi1q5ZKM1BQMGo5F4xZMyBUf8Ur1RV2hYhegygtVHQ61/a8zG5uwAQmw5lR4V+ZVKCKvsbBYWy3IBx7nLSUlxa0gekyyWjqx9op0HJ4sM1bEhZ1iYHAUafj3hSGeCmkL5N8AMwX/rYFdg5yXHTZCy3YxyoVLuJore6RpEtLTY3afHIJ1XYUJlyTRtDh7JaATcQOzsSgbFy7o+8GSf130cnXwJAm5SGN1I1iGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjcX62rl1b4ObC03QIGg2DEVCXw0D0hmuBMU0oEyKno=;
 b=xPZV2piBunjbRZXQ65qpPkoNJsM2qHV1Gloy61+tZb6ew6w/xJ/MlLZhLW6b/+0cwWp7nfrABJEFzlEwnN1MkuTEWVOw2sAC6+VQ6zI2a3ujTOQ/+tN0aA67xXU6nY2VEDzKzhgTjQKycFC+yiSrRALiTOxAXSP2V5EcxihYwHCkmxQAm7xOZWzqPmV5S97lHfkQueh8gXGvOauLgF8XHD65VRCWXh2YD46WndIYvERVgvqL1siQlCH4y2qFN0+dTgqK5NBkTQSDSfuDQd98R3YoHBcStfiYj6EgHfA9/WzxaHxTOsOlx/tCeeLLP/EYVgZZhNvv46s2SrKOR/VW7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjcX62rl1b4ObC03QIGg2DEVCXw0D0hmuBMU0oEyKno=;
 b=JWkr02sNHnw0JsOhOgyA+BiO7S0II/HG8wQXmxMO+4pKYBuekPuYbZ6toNqRjGPUraWIDJ4MRWOyGuaieUySoq6nv5A8oPfXyFfMV4b/SQUyX/mF+0GDBkX3Gt8uGKqEQszi2bbO3T4N/jTgKIs6YJPlKZTfxLhDMJteepk46TOxD0kVmW5MxnpbDUtcoKf2Xog59JOiK2iuDDP7vCiQBucuMq0de3aUZIiKbZfgaxaH0z59fhh4oODF4bLsNtLUOzN8RbJK5U469I/nrAgQ7KLBwMfxPdMoFH+Vzzlcm3UyeofE4v1sjFrdz+lIHwOWKY05Y0Kp8sVVSndZslnaAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB8332.namprd12.prod.outlook.com (2603:10b6:610:131::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 14:45:15 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 14:45:15 +0000
Message-ID: <d5e79487-0f99-4ff2-8f49-0c403f1190af@nvidia.com>
Date: Thu, 10 Oct 2024 15:45:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: Disable USB3 LPM at shutdown
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu, mathias.nyman@linux.intel.com,
 oneukum@suse.com, Roy Luo <royluo@google.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240305065140.66801-1-kai.heng.feng@canonical.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240305065140.66801-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f9e4e5-0f8f-491f-5a9d-08dce93a26d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z09xQUZWK3dkNmVMVnlxK05FV3NISnlGMVE2L09LTi9zU0xmRnIxWC9qdDBh?=
 =?utf-8?B?V05CNjdieXEwdHZFSVRFdEl4T0wvRmJwaFUwcmV1MEVLZmtEYnd6NmhFYU9z?=
 =?utf-8?B?Yi9YU2ZGaXZud3lUYWtTdDJXWXFHUTRKWVRGc25YVGZWcS9HTXVHOWVtT2xu?=
 =?utf-8?B?Z1U4U1hCRkpHalZEYUNCek5WaittMEpWZEpSZXc5b25GSHNVeFR2L2VHY2Y1?=
 =?utf-8?B?czVyZmtBOUNhNE44ek95MWlmZnprc2lFNkFSRXdxMmJ1MFBZYm1EaGtmM3lB?=
 =?utf-8?B?VVMwTi9nT2hFc0hiOUJJVTlXQldISnpDTEVqV0xWT0dlbEpvUWVoaGIvdmhE?=
 =?utf-8?B?QXh0UjM2TUpMU29KVnl2UGtCNFJkQ1lRU01lQys4N1hNamhwemVDUGdBQVBG?=
 =?utf-8?B?NnZxSWVkSE5GQWNHNzZ0ZmJ5VTdlQXNXYlJWTHBDQkJkRUZlWk1kemsxSjh3?=
 =?utf-8?B?dDk3c3N2alUzdkptWWZDZFhNcGVJenFNUEhzUVZiL1Y0QldzV2ZmR1lwNkZp?=
 =?utf-8?B?QUpFUVFGUCtHcFlrOU5wSldUb0d4c3dnVmp4QlUwS1VRRkR4VkJSaFBiSTE0?=
 =?utf-8?B?OGdQb3NIZHNWZTVoNVpYaUs0MFY4UmVPN1pBNno4Y2cwMDE3RjZSdElPa0Zo?=
 =?utf-8?B?dmUxNXdKK3VEeERTaGRQamVGRU11SG00ODd4OG5VREF4NnJKWXJ2bWNPYmVo?=
 =?utf-8?B?eW9wWnJDL3pmYy9ldWRnNXBHK2FJREVvRUdtL1lvQ1hINXFHZUtWYjFPdmNt?=
 =?utf-8?B?cTdsa2ZBWEtmQTZmdG9iOGZMcG91MG1UYktvdUtjR20rMm56Q3VKZm1RSy9i?=
 =?utf-8?B?bWptTDJjbkVMZmJYZWVKZEFDb3BuSWdQMUtRb1g2RStldVJvZGtwSHAxdXUx?=
 =?utf-8?B?MHIwOEE1VjNKcFNxYlU2SjVnVXFwaGYrNVhRUkZCV0Y3eUg0UG5ab0NRcnNl?=
 =?utf-8?B?S29saGIwcHlJQUZZN2dDb0ZBUStBOU15TkV0c3hLcE1jdGlxQnl1M1QxY3JB?=
 =?utf-8?B?Rnd2VmhURURnYjNxUXVMR3k0RTlML3Y1RFc2TXYzbVpyTjZPTmtXTVh0SmEv?=
 =?utf-8?B?RVRpdUw5cm8wMFluS1BTb2Z3RGx4blJGamdwUGdRaUtjbDZ0a3V5amV6KzZz?=
 =?utf-8?B?OWYwTktSS285d1dkTHF1K0FhTURrVjAzeWhxdk8zRlk0ZHZlLzFvQTRVSDhX?=
 =?utf-8?B?VVZBaldIRTlIZ3Q5ZGlMZCtGeEdLUjlJb2V2cUk2MmpZbFhMaEhQQkx1bVkx?=
 =?utf-8?B?UlBNUkV6ejJNcjZhTFF2QnNnck5BbEZCdlFYM1FVdE1QeWRmYkgyTGxEUlFt?=
 =?utf-8?B?UEM3N2JFRC8vSXdQQ3RQczNVTEtlU25meEZSSDFyUWZjTEZLcEE4RlNSS08x?=
 =?utf-8?B?bFhiakdTZmYrWjV2emVxUEwxTjNxWFFIZzNMdUtPR0pWVGhOYS9kS250OHJL?=
 =?utf-8?B?RHR3aHBSZzB2YTNISGV3em9TOXNGZ1dCb0ROclBFTFZmUEQ1NnlyLzIybWN0?=
 =?utf-8?B?S0RYalo2UmNrekdpNEtVell0S3J2dnZCcUR6VlRTaUJqNW85bmRLaVV3alVk?=
 =?utf-8?B?a2I5Wit4SHlnRGFVYnBlMHFndmMrQWRxc2V4V0s1b2VBTkNKWkVFdkxEN1hH?=
 =?utf-8?B?Vk96UmRsREVLYVhpVlNzRlVqM1BoTklxNHZZWW1jcWtMNUZ3QVZYY3hzOUJs?=
 =?utf-8?B?Y3lyM21Ua3VVSmhEQVYwRjhyVXdxazVaYVFBTFVjVk1YZnFQaUJEa09BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXBVK3ZXUFJEQmdYK1V0VTVNbTAzM0FxUFBXNDdiMkJoUWthc3MrSFVVVHZR?=
 =?utf-8?B?QnduMEJ5WEZHOXRPTDlwU2RnUm5ITW1UT2ZWWEE4bmRpeElNSCs1TUNSTS8v?=
 =?utf-8?B?R01MRkRYQTRBY2FEVlNxajh5Q0haYm12cWcxTDhkTjdPbEpscUMxbVhLaXVM?=
 =?utf-8?B?OEJ1Mk9DQ1RwaGZiTFlzVFI4S3pJSVFkUk5yRmorcTYxK0hmMUt3YXViWEtt?=
 =?utf-8?B?L3ZTRmNaN1duQlJlYUYycUtBRHJBUjZ0OTcrZkFRZ0dydHRvMmV2aXVDRERy?=
 =?utf-8?B?UE4vV3J1RDJBeVFOOHBBNHVRaWhxNHhtaHFvR0FvaThWYnV3SHZtaFBLRmlk?=
 =?utf-8?B?SmNib0VCRkhaamU5V05DdDJza0lzNXZqK2ozeGd3eTBvaHRiVUY3WTl3RGg2?=
 =?utf-8?B?eEM0QVdEZEFsVHZURjRjV2htbHh2dHZPV1FUaXl4c3dTdEJwQ1hWczhnRFQw?=
 =?utf-8?B?NmxIRzA4NXVSRi9PV1o1aGI4TmJ3MXlLUjIzZlJ5ZkE3d3ZDZk0ydFdERmhz?=
 =?utf-8?B?QkcrUjQvUDh0UDdWMmtaZ1hwQXFibVhWUlhDdXY2TTVMRG5VU3VVMmNuQ3BO?=
 =?utf-8?B?d1QyZHBuT2RTcjFxV2dGUGMrVnUrODB2NGZPZndyRXRqeE5FRXNQMWU4SEx2?=
 =?utf-8?B?T0VwVUtZcmlNNmlJQWNEUjBUSHNsZEZTVmpSMUt4emVmYVlEL285T3VHTGxF?=
 =?utf-8?B?aUdsa2taV0daSm1mUjY2bVA5QVNDR1ZHdGwrZ1cyd0RQY21BeW5SMjY5Szls?=
 =?utf-8?B?K2tIdURaUkh6NHlRTEZKN3BSRHFyMGw5ZUpuUmZkSjVWdkJNQ3cwNFZrU29U?=
 =?utf-8?B?VWpPdW5yS0o1TmdWTldyMkM5WDJCVnVlVXhIZWk4TlozQnA4Ry9yTng3QjFI?=
 =?utf-8?B?ZFVocmw3OU5ndDVnVHFWYkxTUk0xOW8xVlcycEJhNHA2SG9EMytVb2tYK0o2?=
 =?utf-8?B?bFg5OHUweXZZVkZueVF1eUxKMHA2cS9WT3Y1Ti9JMFhnRnVlaW15bmlaT3hK?=
 =?utf-8?B?WS9yMVVkNUF1YjRLTVdVeHlqZFQ0Q3NOMkpnWXk2dGd1bHkvaFhPSk9MMGw5?=
 =?utf-8?B?bTc0Nkpab3pnc1Ria0lRMWtrNWtaa25uWjJEamRadGF0czdtbnVwZDZJL3B3?=
 =?utf-8?B?NkdGUVB5SEpLMFl5amh6blh6b0h3bmJxcWo0SUpxdk1LV0E3NlpWOUpOREJY?=
 =?utf-8?B?Um5iNk9FZnlPbDVEdG1YZ3NjdjhERUovR3MzeDNNdkFxNmcyL0xSYUltaE40?=
 =?utf-8?B?d3VGakM5R010TGNJc0JHQ1lsRkYxbEJmZWU1SXlkV3RkY0liU25aTis3TCsx?=
 =?utf-8?B?a3prRktJQUI5R3lUVGlOQTk0bmdqSzJ1NGZaaERJMVVqbEpmN1prRWRZRDJB?=
 =?utf-8?B?V2tQNFc2cGRnWWFMV1RzTHVKMHFJSlhHTnR0Z2kxZ1M5OGNoWVV6Z3pabHND?=
 =?utf-8?B?ODFwN1o4dXN4bkpPanpzdlNKL0RKdkFldUZmOVFBTkFNeGhhUUticitLVUpP?=
 =?utf-8?B?cGN0bjNwbzlRZkFuTVZlaE0vczlPU0tEcDh3a3VXOHNOa3RTdlQzRXlYeFR2?=
 =?utf-8?B?Zlhvc2lEMzdrc3NLdjRCaEdFYkVmTmdEV1psNWpFL0gyOTFzcDV3SFlGdTZG?=
 =?utf-8?B?bUU4ZlpTTjM2ejVpajZvMlJ6OTBybkdBUHRPaERQUmtPakhnbk9PYlBBbmd2?=
 =?utf-8?B?VGNocmVzTFZFRWVLNDFEK3R6NkUyekp2N05ZSkRpR3hBcExEeHhxM2xRUzFv?=
 =?utf-8?B?UWc1dUJieWo3TnNHRUpDV1lGZE1zQjVkWG9yVWZmKzZEOUlRRUpiNncyUzRy?=
 =?utf-8?B?bVJ3Y3IrMGdSam5Ib2l5bDJrT3dOWUZHbjZuOHl4SzNQc2U1WWJ5SHhQWFJE?=
 =?utf-8?B?QysrUFRiZWtUTlR6cURzb1VPblVFa0p6eFpnck1aTklSVFNXVzRFcVZRVGNz?=
 =?utf-8?B?Mi9JUTBtSlpNMXJiNXMrdmd1dWFFdHE5R2N4NVpwUWI5djhRa1ZvOGhlYTRJ?=
 =?utf-8?B?cXVSRk05dklTMVIxTGFqWURWbHZOUzZ4dTE1MmpjVzJFcGRHeXZvaDIyYlND?=
 =?utf-8?B?UCs1R0dhaWJOSnR2ZXp4Y2U3UTR0MlBIQldTQ3BHT3NpOWhNVU9haTNhQno3?=
 =?utf-8?Q?xBDw2eP54+uyRY+q7pw1zO2IQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f9e4e5-0f8f-491f-5a9d-08dce93a26d1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 14:45:15.0827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNBBnkr642GpnTI7LesZWPpbWbvFysdc5T89v4LF3ST+fX9M1CWqhiBBDImwGexXvStBXe1KXxVqWSAu61612Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8332

Hi Kai-Heng,

On 05/03/2024 06:51, Kai-Heng Feng wrote:
> SanDisks USB3 storage may disapper after system reboot:
> 
> usb usb2-port3: link state change
> xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x2c0
> usb usb2-port3: do warm reset, port only
> xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb2 port polling
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2b0, return 0x2b0
> usb usb2-port3: not warm reset yet, waiting 50ms
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2f0, return 0x2f0
> usb usb2-port3: not warm reset yet, waiting 200ms
> ...
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x6802c0, return 0x7002c0
> usb usb2-port3: not warm reset yet, waiting 200ms
> xhci_hcd 0000:00:14.0: clear port3 reset change, portsc: 0x4802c0
> xhci_hcd 0000:00:14.0: clear port3 warm(BH) reset change, portsc: 0x4002c0
> xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x2c0
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x2c0, return 0x2c0
> usb usb2-port3: not enabled, trying warm reset again...
> 
> This is due to the USB device still cause port change event after xHCI is
> shuted down:
> 
> xhci_hcd 0000:38:00.0: // Setting command ring address to 0xffffe001
> xhci_hcd 0000:38:00.0: xhci_resume: starting usb3 port polling.
> xhci_hcd 0000:38:00.0: xhci_hub_status_data: stopping usb4 port polling
> xhci_hcd 0000:38:00.0: xhci_hub_status_data: stopping usb3 port polling
> xhci_hcd 0000:38:00.0: hcd_pci_runtime_resume: 0
> xhci_hcd 0000:38:00.0: xhci_shutdown: stopping usb3 port polling.
> xhci_hcd 0000:38:00.0: // Halt the HC
> xhci_hcd 0000:38:00.0: xhci_shutdown completed - status = 1
> xhci_hcd 0000:00:14.0: xhci_shutdown: stopping usb1 port polling.
> xhci_hcd 0000:00:14.0: // Halt the HC
> xhci_hcd 0000:00:14.0: xhci_shutdown completed - status = 1
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1203, return 0x203
> xhci_hcd 0000:00:14.0: set port reset, actual port 2-3 status  = 0x1311
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x201203, return 0x100203
> xhci_hcd 0000:00:14.0: clear port3 reset change, portsc: 0x1203
> xhci_hcd 0000:00:14.0: clear port3 warm(BH) reset change, portsc: 0x1203
> xhci_hcd 0000:00:14.0: clear port3 link state change, portsc: 0x1203
> xhci_hcd 0000:00:14.0: clear port3 connect change, portsc: 0x1203
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1203, return 0x203
> usb 2-3: device not accepting address 2, error -108
> xhci_hcd 0000:00:14.0: xHCI dying or halted, can't queue_command
> xhci_hcd 0000:00:14.0: Set port 2-3 link state, portsc: 0x1203, write 0x11261
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x1263, return 0x263
> xhci_hcd 0000:00:14.0: set port reset, actual port 2-3 status  = 0x1271
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x12b1, return 0x2b1
> usb usb2-port3: not reset yet, waiting 60ms
> ACPI: PM: Preparing to enter system sleep state S5
> xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x12f1, return 0x2f1
> usb usb2-port3: not reset yet, waiting 200ms
> reboot: Restarting system
> 
> The port change event is caused by LPM transition, so disabling LPM at shutdown
> to make sure the device is in U0 for warmboot.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>   drivers/usb/core/port.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index c628c1abc907..c50266d7ce9d 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -418,8 +418,10 @@ static void usb_port_shutdown(struct device *dev)
>   {
>   	struct usb_port *port_dev = to_usb_port(dev);
>   
> -	if (port_dev->child)
> +	if (port_dev->child) {
>   		usb_disable_usb2_hardware_lpm(port_dev->child);
> +		usb_unlocked_disable_lpm(port_dev->child);
> +	}
>   }
>   
>   static const struct dev_pm_ops usb_port_pm_ops = {


Since this commit landed we have noticed that when rebooting our Jetson 
AGX Orin platform we see the following error messages if there are no 
USB devices connected ...

[   59.503154] usb 2-3: Failed to set U1 timeout to 0x0,error code -113 
 
 

[   59.509768] usb 2-3: Failed to set U1 timeout to 0xa,error code -113 
 
 

[   59.516381] usb 2-3: Failed to set U2 timeout to 0x4,error code -113

Now if there is no USB device we do not see the above. If I revert this 
change then I don't see any errors.

The board has a realtek hub ...

$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 13d3:3549 IMC Networks Bluetooth Radio
Bus 001 Device 003: ID 0bda:5420 Realtek Semiconductor Corp. 4-Port USB 
2.0 Hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 002: ID 0bda:0420 Realtek Semiconductor Corp. 4-Port USB 
3.0 Hub

This uses the generic USB hub driver. AFAICT the host is not shutdown 
before the hub, but the hub is failing to set this timeout. If you have 
any thoughts, let me know.

Jon

-- 
nvpublic
