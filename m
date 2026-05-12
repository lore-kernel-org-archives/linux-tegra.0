Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012066.outbound.protection.outlook.com [52.101.48.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B40D38AC78;
	Tue, 12 May 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576128; cv=fail; b=HkuEJ5zsX2ZcSsQ2wZI55S4Uiebgkwbw5J6OX5Iu1mWcOfU9pQ2JXg2D9jv7OfB5HT58QMjBrvEF+DEDevzAuFd7GkVGryuLrZZNP0xkKIRBvwNpsTd3CRJvelsRuXSA8NdsSE26YCaJPtlQRuDkTEIUH4xNhn/5mV9jTHEK5Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576128; c=relaxed/simple;
	bh=OtpNJ9Ly8k1ljbaeESa6Pnafu+zfEyQnQD/9fs3u62Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ul/ep0rgLJYW9+IB89KOJwVoePES8/+mfBRSQSV1PVRhbgYSgEfcHLr+hPqiNSaW2iTUW5BR7faWLgBEsoJnKKSLIuD/sNQoCLFVeyt3T1b/6sobkOlpKLiLk08hHnJCZkR1qYiKMETftdK0fr5xHqeUuWA+GU+MP7spmFrlQfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eRBaFOP4; arc=fail smtp.client-ip=52.101.48.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eRBaFOP4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEbzGBs1cnIxZsHzY/k9jXqwuUKHdpsSWhOu59ssQiYtWfQ/d6wJ1PtD0kykKwyAhQ+XZ9j25iG7U2nRU+tmkuo1mILxKA4bi/M5YRQyx6SBuvIRE+g/SRgf68NnS/tyj11/EaDYHLGqUxSnwMDUQ6pGPslr585G55lwFC6lEHoWikb4wZmeTMtsqjpmFe/PvMhq1h/ICkSZQAJXhYkAgMn17ZvebJUfthFVC9QRltTsheOu4VZGDWEv2uNdlwKny/eryXawrvZbzvSjmq0x3zzfcPKEQuB2IPeWNJ/CRbUTCWGNbgcSeTEYLGVnPrxYpTloThcFkLQSOMDiB+2VUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fj3Vuo9GMfeHPQDMhxuRQydEpui0Y6zehvhn1dWs0OY=;
 b=pQ+6OwhyTccd+TtiqzwRF7gjw3gvhjXfO9G/vhqmA8JdXHVcTuNND+C4vJALu0IAgde2LS1s+ov2saKVnT8TeBMNtOrMNGUU44IdD8mjF48V6PKAM6ctmErzlEYz2DhBnvvBF7jw9h5RQuNREpwnGwE2LLs2I5VMpkC//Rb4GOeZPmozwN27ry7IeankOlP2y5ZYlhJiyb46o+zLN9/3PiBKeYWmNnP9st6FSaVRmu1HWawTDhE/+5lTRO1Z4F5DlMFFP4tAFfjZ3rsMFgop2rK+xmCykh0RiVzFxhMBP/PhYm7nikcWpJjYazkfbvtxE+DYWlus9Jr+b1AONbuJeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fj3Vuo9GMfeHPQDMhxuRQydEpui0Y6zehvhn1dWs0OY=;
 b=eRBaFOP4wTpPKYs2885V4zet9hOnlvzN1xuihuyNHToF9RsuOfax2BSImRYn2LPgqryUIfoMomzICtDV+7KCIbONGf302KfDeMeufyqh0SF2B9GP4vRah170AnYg+zat1TQ4c/yoWf6VyvrXOfyhHTuo1XKU+AcJPNAcAtCwB4JxI5xWyG2EPM0iz7IMk91aO6sgvws90kZdDsaYs2T8RFLdv0GjL8ITavUDKJQyXa2X+x5Afx3vSy+Hx34CTWdxGUMxYKVlKWF7OD9yvu5+oY1VUwLDoiLzkqRGxdjle3zrwzZNiguUx2IQyxVoqkwGtXicTGoz4CpgKrSglrMktg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH7PR12MB8595.namprd12.prod.outlook.com (2603:10b6:510:1b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:55:11 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 08:55:10 +0000
Message-ID: <40c3aab2-b5cf-4297-9b14-3ccfea377c83@nvidia.com>
Date: Tue, 12 May 2026 09:55:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] kernel: param: initialize module_kset before
 do_initcalls()
To: Shashank Balaji <shashank.mahadasyam@sony.com>,
 Thierry Reding <thierry.reding@kernel.org>, Sumit Gupta <sumitg@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Richard Cochran <richardcochran@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, Rahul Bukte <rahul.bukte@sony.com>,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>,
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com>
 <DI3Z28IZZOT9.349TTWNN9VDMB@garyguo.net> <afABOMT_s9DvF6NY@JPC00244420>
 <DI4QQA6EGIA1.N8WRFWVKG91S@garyguo.net> <afCxHUrjr3Z22U6V@JPC00244420>
 <agKMcA7a_UqMua5V@JPC00244420>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <agKMcA7a_UqMua5V@JPC00244420>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0143.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::19) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH7PR12MB8595:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3f25da-ae05-42fa-bb1c-08deb0042c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AfCcAJEsxlYiZZkf333KJueJnPzpOcWMCvdtTNl/ZiJG7SHvBEvx5ezJHXvtxwyE6J4U89dPqfzLqUBkyAxBN1HjOm75my6XqOOdyPCAG7hc3ytdz4GUrzx+mWoj7+3nqLcAilIrFXueqBFkiZCo1LG4B4/lhLJPzAFVMwTeWaF6/mB6JzKurGMah0tXCh48KvBa8ZTobOTUVEb0CJC553HHVAr7dvleDkTOtoioLNH+VJqWv3U643DHKgWk4nwIPW1znu++NE0GS7oaLKTpXpjYY8ufYf4oljvyv1A3MUg17KTEbEjJLGX5DJkV+WJa/gNwnBt9M7Nlia25RX29ZGpudTgFje7CvMQ1u0Gby8nZ/ZtP/imYrEQ7Sbv6IEDgRE9sM4c+qyVT0o3ARE2hC9wl4aCtvH31n8ASG2RPoVsto6BLD4mgIsXnUOOOHgZC2JkMR4YjA5/OaRQQvqS+i9VzpaSV7ieoXafuWbDHjWf3K6itrZ9HQ8HymsbFq7nxISE+3fc+E7yIsa396hZKXGu+EOaDDjunEsKX5rd4w1AVmkrplza/nZUDcOeGreGSs+vlIl5pUKd6IPxeJt5leGmP8Vgij6qNTBClNvVN6j/6DsNfsDpFjFfd9+GmL4618nXUcTorLREuVdLtg0DfbP4UuzrVnp0JXoIQ9sF8X/0GtwWlWspFQhlXZCbvDuRdJxdLxwYl9iht0HJ33oknGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGhORWVPSEp0KzVrbmc1ZzJLNlNlTDB5S1ZIbzVPY2MweUpOQkt4cmxwZDg4?=
 =?utf-8?B?eDc0ZmsxV282cG9EQVRkUGJJOVFiN3RscGRkUUlPRlRMN0t1QWdyV3NjUjd4?=
 =?utf-8?B?UU9qSkVqMzlXdXhpQS93RWhwS09lY0FwSGpzVWdwZjd2ZlhYczRmWmRZd2kw?=
 =?utf-8?B?b3FrazNhMytGczEwdVhuSXllSXZDMExDUVE2WHVzRVFxekU4VjRINGg2VmpX?=
 =?utf-8?B?dzFoK0Y5ejRDTGNUNWI2NnA4eXo5cG1ZWWE0MjZNNTNFcHBJZjBEZ2hQcGtJ?=
 =?utf-8?B?QVk2WGFkVjNWemxwejhMakZNR0lyaWExZWlYQWY4K28xa09uYlpIaElOZVZI?=
 =?utf-8?B?MzRNRGJLbWxTYkd6SGRDdVlmR1pUTzBCcHlYeGIzclBORnhndXcxUnRSQXV3?=
 =?utf-8?B?S2RjU2JIWTZtUjIxblBZMmVaSVlmY1JISld1NEdlZjYwU2xyRWFrcThvMWF0?=
 =?utf-8?B?U0FKYWxnc2lsT1pYdWY0S2Rsa2h5MnltNzRwYVExa3lrakkvaWdHTDhiZVFq?=
 =?utf-8?B?aHlBTXptZS9DTk94d3Rqb3Jpa0t0a0U4REN2YUNlcTlEM3NRTzdXd25uN0c3?=
 =?utf-8?B?MjhvTktvUnpNbk5Qa2FYWU9TeGlOVUowVjAwY2lrTU1Najg0S0xTaWVMZHkr?=
 =?utf-8?B?UnM0RW11aGxwVDNlbFlNbnNGNlhhSWxwU2F6L3pBb3NYaUxMRmxFZW9xUSsr?=
 =?utf-8?B?Ri9ERCtsMDVwUVpPbE1ZVWU3bnU3V01rSU5TRnhVUUQ3MFdmdVQyWmwxVHdB?=
 =?utf-8?B?Sk44RWplUjNrZFIyZm5sVlBIdjdVdDJrajNqWmNYUGptOWhHc2tRU1NZUzZ1?=
 =?utf-8?B?akE5cG9BYlo5dXBnd3k2YU1QVW1DQ2VzMjdjVEVKZzJIMlV4dVIwOUcyV1Nz?=
 =?utf-8?B?aGhPVjdrUWVJV3c0ZW82TC9qdFpRRTd3WFNKSmUxeHlKZ2VuejZMT0g3ZzFq?=
 =?utf-8?B?SHVsQXdwKzRrL1pORXVNZnhzUlhOQlpUUFBOWGkwbTNsZ00rQ1UwcUhzZHFF?=
 =?utf-8?B?MHVQamNTZE1UbDNqeFB2dm03TjBtaFFBQ3pCY1hIbHNHTWtURHVTSFdwVzNO?=
 =?utf-8?B?VFQ0V1M0aGMwWThlcGx4OThDSFJ4N01YaWxHUkVaODArMHhtYW4rcnhlNUts?=
 =?utf-8?B?SXB1NFQycFNvRVFQaVB5YTY5bm9tRHJLWjc1TWJXcWdaYkx4TWpUbVRqMGRC?=
 =?utf-8?B?WVhDUlJKWEI5bGY0SHFQUis5V1gwTVlOMWpBYXhsdHFnZWhCL0tCNk9OaFZW?=
 =?utf-8?B?aVVGQWxSeTRnbDN3QVYrMitvdU4yVUJlcEpPcFBWQVp5Y2Fwa2pyeHhzSm1S?=
 =?utf-8?B?NFZSZStaRHYvbjViMFJnRzFSRTVwWkxsS05RR3lXeUJTYSszR2RuUG5UNEdC?=
 =?utf-8?B?czZxQmthRFJjeDV2UWJIc0hrYUZCUEtpb1BFUEsyZ2cxMUw2bzY0UWNIb1FC?=
 =?utf-8?B?Ky9wcVYxa2hyR09JUC91bVIwMmFHUlI0T0lud2tuR3UwLzFIWDg0ck0wRDE5?=
 =?utf-8?B?d254QWtWbWlTdFpTVHNQYUc4QXgxR0ljWFlzaUw2R1VZMGtuV0JYMGpxTlUy?=
 =?utf-8?B?NDROTkVLMHozKy9lZ0FmTGtYOE9PRVQ4eE9rSUVlODE3enoxQ2MrazNLRHVU?=
 =?utf-8?B?dlpRb1J3Q0NRdWZ6S2ppYmRnQUwwR1hTQUpNdENwMUxKdkNDM2hqNnZpbXdt?=
 =?utf-8?B?Nno3OVpNZWczcXJOditkYTlaL0RvSUR2SGhEWnNPUm15SHpNN1VlSmVaSFhT?=
 =?utf-8?B?WTlXV2VVQkVOV0pmRUtodFFhYmVGUEtkZTkxdjkwR01SNVh1WmJoaHc2bDdn?=
 =?utf-8?B?RFpUMytwMmVTMUhzNUR3Q3VabGdhZ3gyVGI3RXJVVm1NdnA4SStHSTJuR2Ri?=
 =?utf-8?B?Q2hzOXhDajNYcXpDbDNuT0pubXVFbGxqN2N5NG0xN0tESDFaMDhhNHp2ZTFx?=
 =?utf-8?B?Y0VjdVlOM3gvRXFZOFk5VGY3RUw1VTQ0elUwSExhZ2Q4czZSWmJ2b01BUUY5?=
 =?utf-8?B?eUV1Tkxkb01rRmk4VDIybW5SSnBKVnNBenNVQ1lySFFNdUJlVUZLbC9LMWxL?=
 =?utf-8?B?TXJYY2YvNUdSRUFFMWhJQVFKT1BTRWRDNUM0ZG1sRUNUemx2cTlyb3hmb2d2?=
 =?utf-8?B?UzdJQU03dXRIMEYrYTJ3TUdkS0tBWC9LSW5yVXJRUTRveU05cXI3Y1lWVFRr?=
 =?utf-8?B?SFcrbk03b0l6UVJ6Qm5IcGtaSGE1VmZvY2w4RUZhNmIreEM0QnVtMG85VEt3?=
 =?utf-8?B?cVdyNVVSVHRsdnplQ1JOcDVkQXhXRkgrQ0NzQ20yMEo2RGtxQUhqMG9yQWhz?=
 =?utf-8?B?RFVDZ0w1TzZiWDVtaUI3NXRFZDdRNzIwbXR2S0dVdXdNTXRLblE3UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3f25da-ae05-42fa-bb1c-08deb0042c93
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:55:10.8172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSYoLgtK5Nfy2BY+do1cxPfFg64oyWDLByGsit3sqo05ajl2HI7z0NOi+t5vqEZoJsbJZVOfpl85m9hqcIZRVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8595

Hi Shashank,

On 12/05/2026 03:12, Shashank Balaji wrote:

...

>> Hi Thierry and Jonathan,
>>
>> You can find the context for this email in this patch:
>> https://lore.kernel.org/all/20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com/
>>
>> TL;DR: tegra194_cbb_driver and tegra234_cbb_driver are the only drivers
>> registering themselves as early as in a pure_initcall. This is a problem
>> on two fronts:
>> 1. Philosophical: As Gary pointed out, pure_initcalls are intended to purely
>> initialize variables that couldn't be statically initialized. But these
>> are doing driver registrations.
>> 2. module_kset not initialized at pure_initcall stage: This is needed to
>> set the module sysfs symlink. Since module_kset is not alive yet during
>> pure_initcalls, registering these drivers panics the kernel.

Where exactly is this panic seen? Ie. why are we not seeing this?

>> We would like to do the tegra cbb driver registration in a core_initcall
>> (or some later initcall works too), and move module_kset initialization
>> to a pure_initcall. Like this:
>>
>> diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
>> index ab75d50cc85c..2f69e104c838 100644
>> --- a/drivers/soc/tegra/cbb/tegra194-cbb.c
>> +++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
>> @@ -2342,7 +2342,7 @@ static int __init tegra194_cbb_init(void)
>>   {
>>          return platform_driver_register(&tegra194_cbb_driver);
>>   }
>> -pure_initcall(tegra194_cbb_init);
>> +core_initcall(tegra194_cbb_init);
>>
>>   static void __exit tegra194_cbb_exit(void)
>>   {
>> diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
>> index fb26f085f691..785072fa4e85 100644
>> --- a/drivers/soc/tegra/cbb/tegra234-cbb.c
>> +++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
>> @@ -1774,7 +1774,7 @@ static int __init tegra234_cbb_init(void)
>>   {
>>          return platform_driver_register(&tegra234_cbb_driver);
>>   }
>> -pure_initcall(tegra234_cbb_init);
>> +core_initcall(tegra234_cbb_init);
>>
>>   static void __exit tegra234_cbb_exit(void)
>>   {
>>
>> Would this work?


I am adding Sumit who has been doing a lot of the Tegra CBB driver work.

Sumit, any concerns here? We could run this change through our internal 
testing to confirm.

Jon

-- 
nvpublic

