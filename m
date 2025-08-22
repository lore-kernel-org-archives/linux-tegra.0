Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6165B22127A
	for <linux-tegra@vger.kernel.org>; Fri, 22 Aug 2025 03:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755832066; cv=fail; b=P8T4gGII76QrI/9LH8SO4BI2TjGHjoxCgZXTIDO/mAvxvRJH48aTjXF1AtJUWPxW/xvnDjGcBn7Zxe44/O1iKRTOavLWsOgs5VXtVIKAAkV51qI6c8PGpA3SrPiGGef0oQSWLxOURUQh9PA+D2jtsD6Wa5iO+2QYDxGhWEU/wQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755832066; c=relaxed/simple;
	bh=Brs3U1ZcAlxNikNLomZKH8kwE/CleTPvY233enaw9uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=co2YKBlEC63pSYM3boTuj9OBzKZFnmDxqRQtw83pr/UmpWyQuInrM3sAQ73wnPHFq74DwZSbGCbSS07JWMA2r1GL3q3uRBVy5ADReqOoD5TbF+oK3aFU/L7s8J/z+rSUkKURET1CXl+fOzTlRpy4U67Kd/dzqEsbecJfAfgPJMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r0leRct2; arc=fail smtp.client-ip=40.107.93.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r0leRct2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJqyJFXkkN1Z95JUDwkHnzeasAnlLmP9cT40UyciuXCIfw4YXxuumddwFmNdcl0Ey83PJqbNk81ZRtQx7Jg62o2Wy7Rkj59kPQwRdeNgzL3DIe0RvEciMmRRwnK+lnncgYFV8T+w+YTv6ikmS4OFiGq4p8RGn2mUc2eEcAJrJi+oa/srlRDA7MXv9ISjANtoHFKlL6CO/UKpTeQgneEkVwWcxxHI0RBV+6u8QY51fxy/e3QYtWIOwqiIMEFLB7DXCcgd5KU2AjUJH+9oxZS4SiBk3aW9koWg4+CNS4ZDX82oB5h4Q3sWYwUOnAuKTZL4X9i22epszT8Gl0N2etUqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tx9kYZsMWmh1kuR4aDa3+2A0Ca01eMbq5DhNpVjoORs=;
 b=BlrBh1UsyX17HHrjiwfZlImL4y1SVIXlBQ0RI8bmsgCeHDf0Wnj/giGxXrYm2nCRbQcpIoaubaci0X9k9ejxY3z9ttQ6Na+4VXzhwO9/CztEGuSGKvDNPJRnzSROGFcbGY8KBWIaDzIK+JR1w6ELPE33/2CswL72ZA6EBtIPgPhVKFVMsP7oMjtF7LcuVq4XSJjh/0/+shN3vxyKTFN/A661MH8/jKoUG3gxbyGpQeB/DMRwzc3awsGKPs387GkQ/9jceFGyNlNukJYAVGmfcskZucX6e/9IbwFMKqdrwMmVzIqQs9k5RZQr3KEIJll+/sSVjwqUm8O3vxOMv67zaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tx9kYZsMWmh1kuR4aDa3+2A0Ca01eMbq5DhNpVjoORs=;
 b=r0leRct2sSwSTDsUVAis2P+WB8j9KrFaQ/8TC/f3NMNVRbQgKJF5e3EBh3FFBLiEee4X45EMBRA4LoqNQ7YsDTrCcd5+kAZuJ14Qii3Qc86c4ndjt3xTuLTOqYIPsBzbhKbZwxo5TYUyjd739xyxbSlSe2qr2I2WlmDET4FVrCeqqR5kJpBglpBiugVeCVrGgqp6W28qONpN6j2X8KxuNfQ7Esu9eelclzj9mrmf8Fdx0i7myyVqFf5AEQ4XDC7wgHTTBrHKtWwCa7k/LFdk2Q/pcGyLEdgGsgF/WmtdrTSxDlvAh3QaVUNTBQ1zhF0L9tV4lTwGdh3SF4q9Vj25Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) by
 SJ2PR12MB8012.namprd12.prod.outlook.com (2603:10b6:a03:4c7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.16; Fri, 22 Aug 2025 03:07:41 +0000
Received: from DM4PR12MB6496.namprd12.prod.outlook.com
 ([fe80::bede:bc2a:5e14:e393]) by DM4PR12MB6496.namprd12.prod.outlook.com
 ([fe80::bede:bc2a:5e14:e393%7]) with mapi id 15.20.9009.013; Fri, 22 Aug 2025
 03:07:41 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [bug report] drm/tegra: Implement job submission part of new UAPI
Date: Fri, 22 Aug 2025 12:07:37 +0900
Message-ID: <2955608.mvXUDI8C0e@senjougahara>
In-Reply-To: <aJM_te551jUwnRv7@stanley.mountain>
References: <aJM_te551jUwnRv7@stanley.mountain>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:404:f6::20) To IA1PR12MB6484.namprd12.prod.outlook.com
 (2603:10b6:208:3a7::13)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6496:EE_|SJ2PR12MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: b19867ea-b40e-49ba-e5d3-08dde1290e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3RLZlRSZkdsamNMUGFneUFmT1A3VytzU3ExRmlMZDZFYmJBZXhSNlE3ODQx?=
 =?utf-8?B?KzBoVDJEQ3ZXd1k5alA4Q2pZVDNGWTkzZTYzdmpGK1owVjJxVXdza1NQZk9s?=
 =?utf-8?B?WVdFdDhNR2JHeDU2VHdZZ3prY2thYzhnOGZwQ1d3TUUzQUpzeHJGVVdxS3cy?=
 =?utf-8?B?ZlN0T2hIRnBnSWZTOTl5OGttY2RhYnZDenFWY2kyQjA5eDlKU1NBSG9zdlMx?=
 =?utf-8?B?dnlCK0lhQXhGV2kwZER6YXpiWUg1Vi9hSGdwMHNvczFlVTZrbXVMUC9EOXF3?=
 =?utf-8?B?VmtabVNIOEhmT2dDTFZRQjZBQldYbU5FZ2NKbkx0dXlRVnNXSVE3aGIwcHdK?=
 =?utf-8?B?TDZQb1ZWcEJ0OUJVbjdRSmtvVjNuS1pDN1RndE5SR01NSUgzL1ZhR3BTZ2Fx?=
 =?utf-8?B?LzVhRU9jNklpaVYyYkNENlhPZkc1cXFRMG9hSkJ4bnJ5NFpxMm9zWDhYdTBN?=
 =?utf-8?B?ZzFWNXRtT2h3VEh1c2VLVXl4aFBWZlFMKy9nQkZMaXhQaWZZOFRGRFA2cE16?=
 =?utf-8?B?YmhLUmFLeGVSVVkxMitoVllkZzNjMFBMamJuVDF2OTZERVNNK0s4bjFFVCtw?=
 =?utf-8?B?blArS3I0K0htdXArTE9kQkxGL3VqV3Uyb3g0eGxIMVF4c0ova2JzQVVOMHRF?=
 =?utf-8?B?ZmxTWWUyVTduR3hqWS9VWEg5dVpJbU5vaFJhc3RZa25ENDRXN3VNYWFhREI1?=
 =?utf-8?B?Q3ZySDhkcXpIRHBxT05yNE9XTXhlMzFEemoxZkFiNFhMZHNUZVNTSDVqUkN4?=
 =?utf-8?B?NGpyVHZJeHNha3c0MUVZOUVsOUd5M3NGR1RaZ1duVkx0aGQ1ZWlvYm51VUJa?=
 =?utf-8?B?YkFzdHJKS3Vmb01yQXpDZTNQVEJ6eDQyTFFuWFMzeWJuZFdoQ1F6SUMrQUt1?=
 =?utf-8?B?d051Y3JiM3J0c0h0Wk5sYjIxU241eXVMVEFnYm9wUWhnNldPc2lZN2NYWmpt?=
 =?utf-8?B?QlpaTHovTG9ZSks3UGZ2dUtvK0tnV0lpd1lPMlhUZkcrc09yL05TTlVCQUMv?=
 =?utf-8?B?L0RTb2FlSGRkZU55enZEVlU3amVvYmg3ZGMxOWRHUEVqcW50QnZ0MnF5cnVM?=
 =?utf-8?B?UXg2N1ZCd0w5Q0xMUnJwMVQvUmtoSGdpWVRFZGluaU85WmxuWDJvdVlKa1F3?=
 =?utf-8?B?YkptemlRMm5CVjNTNEIwcjE0QmVPUnRrTnBabUJKRHZ5R1hSRVlJQWJlWmJz?=
 =?utf-8?B?ekNXSGwxNHJKc3ZlYTBhSzNEVnNrTWR1enQzQXo3VzE1d0xWSkNhVWZ2a3BT?=
 =?utf-8?B?cWhhdmJKQi9iR3NjZGFLTDhtRHV6dzkzZUlrcG1ZK0RSeEtDZjJjOTZzUVFE?=
 =?utf-8?B?aXZsSGNyNDlHWS9IRk9XS1NoWDFjRkNOdUZiZEdINnl3dWVsdFhRbFpBTml4?=
 =?utf-8?B?RGg5YkZmbWVuSE5sTEFWdFBaQjYrM2t6ZHRMK2VPUG5icjBjVTdFOGpFUVZ6?=
 =?utf-8?B?UUs5dXBTcC9Qbk1FNEZTN3hHWjNZNDIyZ2NQUGc1UXhkOWF0VTdlRHpORDcx?=
 =?utf-8?B?dWlKeDNXbWNjQkJlbXFxa3lVSnExSnRHWFcwYUZqdUtRU05mc0MydFF3bVJw?=
 =?utf-8?B?TytoTmhVUkNsNCtRWjZ5dWlWU3hUYW1nV1lBTFNnTGh0Vk5ZRkw4aHloeTUv?=
 =?utf-8?B?TnVqSHpxdWw3S2tZT1RyRTkvcDZRT3UzMzVndkN3YTl6ZkI1MkFFemtiTjFQ?=
 =?utf-8?B?TzAyS3BsMG1SQXdOM25hNURLQkYxQ1FtOEpwYmxTUHVNS29ZRFVLYWxmVjhh?=
 =?utf-8?B?bDc5MjRsUDNnZDhPS2N2NUZWbU5VemE2S01JZVJFZElyUzNvQkpLUHkyUURR?=
 =?utf-8?B?UFh2ZXZSNmZkS1d5SDhhMnE2M2JRT2Z2dHhaT1QvRGc1QWxkeGQxVG9UU2Fs?=
 =?utf-8?B?cDltK0tqTkdlT2F5L3dzdzIra3RMTng5QjI0SkNBZlBmSlZ2YllMY1M1cnpa?=
 =?utf-8?Q?/jjhgCiLnvA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6496.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGRuWXEveHlMSTZzbXB0b29PV2V2OTM1VlAxYzlDODdvcVh0ZitLWHNXSHFS?=
 =?utf-8?B?ZTg3Mit4NDY2WG5vNEJKUjBmUndtL1V1VCt3dWNnWG92VEk0ZG5VZUZjdHNz?=
 =?utf-8?B?R29SeGlVdnVSS1ZIMzRLMVhLOG82QnlHYk1VNm1OZDZscnZ1STVtU1p2UnhV?=
 =?utf-8?B?ZTY2eFVSTjNxeFhsQ2RJR3ZRdHZLTFprOFc4ZXRaS3ZVM0x2N3JnZ1lWRVZS?=
 =?utf-8?B?RmdLcjl0bmxvcnMxL3grc3d3ZkpDWmRwZ1ZKOTR5U3gwM2lnM2doV0FVN0wv?=
 =?utf-8?B?aHlMSDNWUVpWMGlzNHhqY05YTWFDYUJnd3l5cUtCSzVYU2NiK2RZQWpMYUM4?=
 =?utf-8?B?b1NPdFZqWlBEa3U2RkMyTytocDlyQWFlYzVicSs3WEFCMlBJeUhVYVhsbGVS?=
 =?utf-8?B?ZGE1Y0lqU255bFJ6MCtEN0Y0dVBaSzk2NHVkU2hWWC93RjdodE42cThuR1FW?=
 =?utf-8?B?eEEvZWViQmdIb1JsRGtwS2N1MUZkNm5MdklMdStnYUFoL0l3cFMvUHkvNVhK?=
 =?utf-8?B?VUc3NXh1V25UVk9WWTVSVUN1ZTRML3ZnK1luL2dKbml1d3VxTVZOL2dvdXBy?=
 =?utf-8?B?UlJ4d2dTU0YweHZaeGRTSUxDc0lUZWduRlI4TEtPbHp2R1VUaDRhWDRaaFRD?=
 =?utf-8?B?WGErTnQ3eGxsSE40cE0zWFI0RVhyblVoTnoraEZabnZNZktkZXVpc2FmaGxB?=
 =?utf-8?B?ckgzMGpNRWhYc0FYU21vTExuTGovb00yczBrQ2lXMVhtaWJoMjdxL1JWdXUz?=
 =?utf-8?B?OFpUOERFeitFSHI5ZUtXdWNvZUdpVmdUUXl4VnFFczJSdElpR0FObThhTHVW?=
 =?utf-8?B?RnBmMlBoNXg3a3BzcmZ1M0NuZGNLOHI0Y1EzOGdRRDFPK1BZc1FoUFJ3K3FU?=
 =?utf-8?B?NU9ZZ0toYzQzT0xSNmtFZ3Viay96MFRobERyVjg2dnBnL0F2L0Zaa2h0Zm9K?=
 =?utf-8?B?eEZNZXVzYWJDcFVkVXFVM1QvRzd1WFJxb3htc1hla2xyNUQ0U09HcXRuSWFD?=
 =?utf-8?B?UUVqNUpRMkxuUmhPbERrWjdhemNNV0szWlZnbWdYMi9tc1BMNVZGUVQ5Rm50?=
 =?utf-8?B?Z3dIUXdmL3orZkFWRTBlTnd5dllJZGNmbU5sV0JYMFZSNTlsNDBCZWU2a0E4?=
 =?utf-8?B?SEdmNmo1N1JkckJnbFNMd0Q5ZTdwaHBxYUFHakcvYmtrVGhFTHlJV0ZJVGZm?=
 =?utf-8?B?NS9kVU9nZk1WaG5mMVFwTTdBU2g0UmhwbjQ4Tm9ZRUU5SDIwb213d0xrSkVF?=
 =?utf-8?B?K2pHa3NORjQ1YlpDTGRyeEV2WWRtYjNqR2JQTGF4dW9GckpkOHJHU3p6SlFY?=
 =?utf-8?B?QkV2K3JudzZudGFUTjhYNU1tZU5QTkc2b1ZJY3VndVFkaFhoUFVLbzVSUmR0?=
 =?utf-8?B?ZGphcWZsQ0g4ZVcrUWdlWGxoMlp2dXpUcHpFdjBHYkRQbWdac3lOUVFQOWt3?=
 =?utf-8?B?d2hjOGlwYnlSTGhKNmZSNldWdlhVRnZsTnhCM1g0VWUvcnpNSm5meEg0blAy?=
 =?utf-8?B?a2R3Nkp6VVNRdTlFSStWQmI1a3YwUjNVVDRpK05rY0FNendXM1dvandBc2Ev?=
 =?utf-8?B?WndSeW95bWRVbVE3SDQvckFPdEMwSlJIZkNoMkNMVVVlaUhqSnc0bWlSYUc5?=
 =?utf-8?B?Rmw4SGZYVnlpRHVKRjdJZUNOaW1BUWdObXN0SWNEbER3Q2txS0V1ODlNUHZB?=
 =?utf-8?B?V2VQb2pDcXpkN0ppc1hEZnlpRGZKSU0yMW1IM3RSNFJseFBpTE42Ykx2YmdP?=
 =?utf-8?B?Nm93NWhPZ2ZMWG1ZOXpkeEVXbkRHR2EvTW9XeWFDNFI0cmJySVVCWElVbk1i?=
 =?utf-8?B?Rk4wdHVIclhHdDFnUmFpVGVVbkNObjZud1NCY0RKUFRndXV2Sk1ZZWZiME5h?=
 =?utf-8?B?NWN2VW83ZU5iVDVUSEhnL0ltYThVTlVjT3NjbFpWcEZpaUg5U3pBTGZ0eWpN?=
 =?utf-8?B?NXdoRENib3F5RGZCRzJJbnB4VDVBczRhSXEzRVU4NEhYRGRTTFJKaytCeEhi?=
 =?utf-8?B?NHdES2pnK1FKdkVEQUY2MUdnRm5ZUjVNejNXc3lkelBNS2YxMHZ4ZkhXYzlU?=
 =?utf-8?B?ZDd3QlFSNGlja2JvWmxLWFlYRmhSMGRLRjhJRVBDYm5HblV5a1RROTFXemRr?=
 =?utf-8?B?clpURklrV1lZcWlheFgrVXhTUWg5Y2NtK3F6bldmR3VNdDRPY1NnNGpwZTdF?=
 =?utf-8?B?K3Bqc3lsdS9OMEZ2SzVoeFcrRjdtcUI3TVVaaHY2dlMxZGxNb05Vdm9uS2JL?=
 =?utf-8?B?Yk5YZlhiNlp4MmlZQ0M0TnVGVHpnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19867ea-b40e-49ba-e5d3-08dde1290e71
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6484.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 03:07:41.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiCbeLkO9A3XmX/N0aHntebhUouQ36U5O4WGHwnQokCH7uHWUlLo6NDaQhN0uvuBkcwWoRQJSvl++6EQD3P7Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8012

On Wednesday, August 6, 2025 8:42=E2=80=AFPM Dan Carpenter wrote:
> Hello Mikko Perttunen,
>=20
> Commit 13abe0bb15ce ("drm/tegra: Implement job submission part of new
> UAPI") from Jun 10, 2021 (linux-next), leads to the following Smatch
> static checker warning:
>=20
> 	drivers/gpu/drm/tegra/submit.c:541 tegra_drm_ioctl_channel_submit()
> 	warn: save dma_fence_wait_timeout() returns to signed long
>=20
> drivers/gpu/drm/tegra/submit.c
>     509 int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void
> *data, 510                                    struct drm_file *file)
>     511 {
>     512         struct tegra_drm_file *fpriv =3D file->driver_priv;
>     513         struct drm_tegra_channel_submit *args =3D data;
>     514         struct tegra_drm_submit_data *job_data;
>     515         struct drm_syncobj *syncobj =3D NULL;
>     516         struct tegra_drm_context *context;
>     517         struct host1x_job *job;
>     518         struct gather_bo *bo;
>     519         u32 i;
>     520         int err;
>     521
>     522         mutex_lock(&fpriv->lock);
>     523
>     524         context =3D xa_load(&fpriv->contexts, args->context);
>     525         if (!context) {
>     526                 mutex_unlock(&fpriv->lock);
>     527                 pr_err_ratelimited("%s: %s: invalid channel conte=
xt
> '%#x'", __func__, 528                                    current->comm,
> args->context); 529                 return -EINVAL;
>     530         }
>     531
>     532         if (args->syncobj_in) {
>     533                 struct dma_fence *fence;
>     534
>     535                 err =3D drm_syncobj_find_fence(file, args->syncob=
j_in,
> 0, 0, &fence); 536                 if (err) {
>     537                         SUBMIT_ERR(context, "invalid syncobj_in
> '%#x'", args->syncobj_in); 538                         goto unlock;
>     539                 }
>     540
> --> 541                 err =3D dma_fence_wait_timeout(fence, true,
> msecs_to_jiffies(10000)); 542                 dma_fence_put(fence);
>     543                 if (err) {
>=20
> This checking is wrong.  dma_fence_wait_timeout() returns a non-zero
> positive value on success so tt should be something like:
>=20
> 	if (err <=3D 0) {
> 		err =3D err ?: -ETIMEDOUT;
>=20
> Except dma_fence_wait_timeout() can also return custom error codes so may=
be
> something more complicated is needed.  This bug seems pretty severe, so i=
t's
> strange that it hasn't been detected in testing.

Yeah.. This has probably never been tested except when initially written, o=
r=20
maybe not even then. Considering this is still in staging, the best course =
is=20
probably to just remove the syncobj stuff for now.

Thanks for the report --
Mikko

>=20
>=20
>     544                         SUBMIT_ERR(context, "wait for syncobj_in
> timed out"); 545                         goto unlock;
>     546                 }
>     547         }
>     548
>=20
> [ snip ]
>=20
>     674
>     675         kfree(job_data);
>     676 put_bo:
>     677         gather_bo_put(&bo->base);
>     678 unlock:
>     679         if (syncobj)
>     680                 drm_syncobj_put(syncobj);
>     681
>     682         mutex_unlock(&fpriv->lock);
>     683         return err;
>     684 }
>=20
> regards,
> dan carpenter



