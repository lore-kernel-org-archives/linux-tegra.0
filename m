Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665961CC179
	for <linux-tegra@vger.kernel.org>; Fri,  6 Sep 2024 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623280; cv=fail; b=lSHLDJ3J1gdiRGt2rMHkayc10JlhnBKtgsbel5Ud+i6RORQqEPHp37VcngOUj1gVNsAmbYxU8bINnpOsrvr8QOi6tW9A5z7tQfdQB/f7alwYBXvYQeLBewwuL/WJakzNHdy8bZ7Exc0O6BtfHbjyLsgyMwozKhVqG90TwUmTfg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623280; c=relaxed/simple;
	bh=zJHdwpo304wji0F0JFT+R9Y7Mmb41uTs1n75RnT/5xQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LspHWSsUfoO6kv1vPMzVSgo9wBXrWShfGxdgbCdc9EoG7jm7XAYmdRd5PLwn1yhh+0cbJYUgihL+ttWFUoB/20qZ9KVARaUtiVGMaqHYuBGnYKh0zdbWv2FScaXLRUV33FMBC9K3TwxOICc+/G3XBzgDkmy/t4+AK2ff8//JW14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RhZQM0to; arc=fail smtp.client-ip=40.107.243.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RhZQM0to"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+9rhFjHhlowOfpejbI5mxSnj3+5aExYcNCQpTzoTjxGOd0H0oX9x1wZ/jeaZubvhGlLT2W9vkk1k9TTpKJbMwhNCX1fNK8LG7vH+WpLb8HjhNmtAHcfU3rPJ/auVRK9xxka6E7/k2ZAfrOk380WAqAaf19K12S6/etvneCt4p1Y5qwjhcEe0ohFz5mBcrSC9yKC8KJwOm7CsesGP+DddJSAmMbzxVDELIy0sNhlh+vBKi+yDp7KYEiWOSiopBk/hKT6jGI/1ahBS1fA3M7pdsZqylOTwDRpVjuDDgTo1m8cViRruvls5TTMFxhOfTMx35memTPHx1me1zK4mx8ddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Now+7pOTzvvXD7SEogfiMrDiQz8zbK8GaKxqGj/7++M=;
 b=txK+MJEfz8uLjRpmMCGZ3Fb5/9bNB8dTN9S79vjy2wypqNSESTDuOBzzCyxaHZ8uu4jU/tZCnjXtoLoHeA5YyZTwCUijeXLz5JNsT0DdAOD9dEfdOV2U0NdER74Khp/SIq3bkRDX9KiuDVJpyTgVTD78DZoDIVPZlSwcCOjpviJ52KHOa+ritrXgaAI2hhcma5wI4QoOL/HiUDFj3+EUMvd6THD4oXEiLBAdWV5bYfmME6As/c2+nJBNSZ0vrpBWQLJzHYhvtlk22nuwCPaxlaT6dLqd6pd709AzJ1arpUQ5YYkU8zI5wBxkPgktNDik0744ghI7BsjPFKFzoOJRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Now+7pOTzvvXD7SEogfiMrDiQz8zbK8GaKxqGj/7++M=;
 b=RhZQM0tojI2iiXGmjcVvPx3pe47T6NGwBb36uUrqviXqLf+gPBeD65zRooS3nXVzURTk/svtrkF1SsNA9Y2mFwTl9Nk27xEsAQZDw/lMfuQNmf4LQSLwkZl+wcpxtX7tA0rsY5BprtIf93tmbVFZIJZ5VSjeegNWfdLkarf8xwijH9s15ZSfEPIJ65P/m+j64zaRN+5deiDxI7JFK/1GKFCim4cjAEtprd2bj+Ej05UL7HJg/NPcmtiJwuz6p+83GlFqw2W5YNpBT/jacsdyFQY1lHCSv95WKwI+8EnB1uzLOcIylOS//vPUVykHVwJNRtieAGJRf15RB1l+lA5sAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.27; Fri, 6 Sep 2024 11:47:52 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 11:47:52 +0000
Message-ID: <66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com>
Date: Fri, 6 Sep 2024 12:47:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for S28HS256T
To: Michael Walle <mwalle@kernel.org>, tkuw584924@gmail.com,
 linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240830030841.24500-1-Takahiro.Kuwano@infineon.com>
 <D3T1W2VQFGNG.14DUML0OSKRH@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <D3T1W2VQFGNG.14DUML0OSKRH@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0393.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::20) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|DM4PR12MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: a2aefd6a-ffc4-45d9-f21f-08dcce69bd04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0pXbnhBcmRNMG9tRllVWXhqNHpRbWhOcTQ0K1dTL2Q0OCtKcWJidUZkQ2dB?=
 =?utf-8?B?RldTV1lsc2ZEa21aZlVWSC9IZE5qTlQ4a2F2SjdSMmJCWnI0OHh0eUxidFlX?=
 =?utf-8?B?bVpLZkQ5RU10RjdqRFh5ZTBER3FYamJMOVlBWm5Cb1MwRzVpVUV4MlUrN2Zi?=
 =?utf-8?B?b2NRRGhNd3FsUjlEeWhoem9QZEVrYTl4bkE1c2F0WUZGa09SNW41aTdCNS93?=
 =?utf-8?B?VFdCSlg4TkZKSHRRWnFReWtQTGYzSTk0QVJSem9pckN3MklkT2NiZzJEWHlU?=
 =?utf-8?B?K3NXb0FwWlRKeHNBY3VEa1FabW5LWWRTclNnb2UrN2pDRmlqOVVrQmI1Sy9S?=
 =?utf-8?B?MTVCWTRFaUdQZitiUW9mRnVLSEZuNW5jK0d4K0t1eWsyb05kMUtxVlkwTTRm?=
 =?utf-8?B?TkRwdzBybjhBVVV6cWt4bVM2b2RpekREa3JIS2l5MEt0TnlwKzl5dzg0akFT?=
 =?utf-8?B?MFZNbDlIeGR6THNVbXV3QXMvS0RrQjNOd1FwWVVhbkZKRENQYjNzTEZzc090?=
 =?utf-8?B?bjZZdVM5TkJJcHdHQnRxN1F5RzJnQVdjaWRTUFRMQS9XTDUvQTdRdFNwMkg3?=
 =?utf-8?B?TjVJbnZLd2FmZ2pnNHdiRmhQeHJLYkg1Yko0eVFjWG8zTkpjMm1LM0Z3SldL?=
 =?utf-8?B?VCtFcG1SaStnODVjTUJWQmdkQTUvczZTT0VrYUhHQmxaOUd5UytZN2dQdEFF?=
 =?utf-8?B?U25hRm14Uzdlb0pCbEY0ZzAxV1pMQmVUVldyUnl4bHVqMTBFeVZXMm45MkNM?=
 =?utf-8?B?c2t5L0xwYSs3YTA5WE1Ta0daVnplbHdlN0o5TXlOdko4UVl3Vnd1ei9oUEI1?=
 =?utf-8?B?SDdyYTJUMGZXb0pXMFVqOFBxa2ROSkxOZFNHQ0FFLzJNanc4TEgwb2lnSktQ?=
 =?utf-8?B?WkdxNmlQczIycFhPWlNVRWFPS1JneURFVDhJWmJ4NjE3SVhEOXlZT3V3T3R6?=
 =?utf-8?B?aDJmejZIbFRCMXR4UDdNblFpRFBuRmdSWWc1bkJyeHNDVkJiNnArWXMxSG1M?=
 =?utf-8?B?a2lCVW9YOEJIanNiKzQ0RUpWZ2o2cFd2UEZlaDk0ZVRCV25sRkV0M0RWTHpu?=
 =?utf-8?B?Y2lVUVhxWFYvV2tBOTkxN1JvZUY5NXJyMW0wMTFuNnJJOGVOQmF4c056MUQ3?=
 =?utf-8?B?OWFmWEd5VGZJTDF5UFAyRXhHRnZFcmlqa21xRkYxSWV6VlNySlMrUGowWmt5?=
 =?utf-8?B?VGxtSnZyanlSMXNIUU85U0M5ODFoRjhJYkZidVIvY0VpejBpczA4ek1jZlFI?=
 =?utf-8?B?MGk0VDZQeUZFQzNnb3hCRzJ5SFZKMkxxWjJwc3pVMlhJbklwZmpkQnVxVnR2?=
 =?utf-8?B?VlBhNFh4NUgrM2d1MmpDeTVpSXpQb1BNTjZSYUNuRk1jai8vSUNVM1V6ZDRL?=
 =?utf-8?B?UXdsOUNROThNUHVIL0RWclJlbWNmL1VnVzRsamJlMHkrY0I2SlBrS0ZHdUZI?=
 =?utf-8?B?MlpWR2lmaDFKelQ1RDFFVjg5cVhCeStSTFZwUDRWSjFuZ1puTFpON3ZSdzYz?=
 =?utf-8?B?VE5henE3azB3OUd6VlhaY2gweEN4bVNtYytsVGx6MzlUKzNJbXpZRzRhbExi?=
 =?utf-8?B?VVJLUlpvbk9LS0szdW1KQzB6THpIS280NHp5R1pUUFFDRHlidFdDTDZtYThp?=
 =?utf-8?B?WDZLNC9EQkgxZ1ZjaVRSSVJEZGg2VUEycnVOeXg2NzNHR09PUTc4K0w1UFdP?=
 =?utf-8?B?Nzd0YmVURUlFTVNzNFlKbkJ4RGhxUzRHZnJjZmh6SWRVVm9vdkJLaTF5WThh?=
 =?utf-8?B?VHZEQnhjTm45UWE3c1d2bEZ2NWptT2locDUvOFF4ZzhZaDZ4OW52Ym9PT3ZU?=
 =?utf-8?Q?fu5GBzLrMMAbmbjvLWpC62Nb0LC5xN2bfki/U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5447.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW9mWER1emZxKzhSV3JxTmhCMTZuWGhsR0IzUU1FdlhEdkM0VXZtdWN0M3Fl?=
 =?utf-8?B?RGRFU2twUmRmcWhzckszY2F0SXB2T2pwY2w0N2MzczhyWENvcVdFaVpSWkJS?=
 =?utf-8?B?VENoMGJudVBQRkxHeU9rT0FJZVU0ZEhFdjlhUFhHVEJ4OElSTGVyRjI4RkNZ?=
 =?utf-8?B?c3JUSUhid1dkSnZoMEhaZWY5UitUTHZuck9lSWQ3L2xmbVAvL3dxSkQzTGpS?=
 =?utf-8?B?aDl1UWlycHpLYlg4dWdXdXJ1ajV0YVoyU0F3dUpHbXpKdSs2cnhCeUpoeW51?=
 =?utf-8?B?bHZ1SHVqZmVmZHNDSktXR2FjaWhMVk1FancyaFpVWWFsMFVIMXNrK3hUSVpI?=
 =?utf-8?B?UDRiL1Q1VitRUlp4U3Z1aHkvT1RvdHBHKzBRbkpQaHZVRlVxbE0wUXphQURE?=
 =?utf-8?B?dUVnT3JjajRtSzEvZDFYWFZxTWNiTGQ5WTlmdEhaSDcrRHpZdlZNRkVzSW44?=
 =?utf-8?B?dXJ6RW9nb05SQWZXbFJKdzhseXc3N3FheHQ3WkZoN0p0NmZEVlhQOHNrTUNW?=
 =?utf-8?B?dmEwaEZscjdSTUpPRjUvNEdsWWd0bllQbHFLYURtdmI0VWwyRjhUcWlaMlBM?=
 =?utf-8?B?b0FOTkFIREZ3aHcyKzJVbFJIOHF3eUNZdDRYWTE4ZDVpVVd2QktpYjZUV09I?=
 =?utf-8?B?clJaWmxpa1Y4aXNHVm01dzlCcjFwWE1VTGZJdWFlb2lJajRJUHVVZUJkQkR3?=
 =?utf-8?B?dHdlQmRzZTRvdUlmaEFIRU5RT2cwSlVOaktJdXBWSFllb29vanhVdUkzN0Ur?=
 =?utf-8?B?OFYxSmJDR25xaWVxMGVnY1YyODBSTkMvVkZqVFhoZmNTV3VuK1NBQm1JeDU2?=
 =?utf-8?B?NnFkR1cxcDBWY0tSaU8xaGMwSjVmcE9mR1JTKzNjV1BFbXV2QVk4YjdvVVBV?=
 =?utf-8?B?bFZ2YkZYODRhMXh4QXljb3ptVDk0ZjVaaW5RNWloQjZJVVI3Mm5rZ0V6MFlU?=
 =?utf-8?B?ajZxUVlQRzVWUWRGcW1oWSt2RDFUV2c3TXY5ZUl6RVRQK3FHVXYxR1Q0REJw?=
 =?utf-8?B?MTNRNHYrcW9rTmZjOTFYUkFrK2dhT2tNNDdPZmNaVDIxQ0paZ1hacnl5Z0oz?=
 =?utf-8?B?MytJczk1eW9kVy8wSy9nK0o1UWlPRDQwcVlHaWgwNFVFbHE5aWRsOGQ1clJJ?=
 =?utf-8?B?VmlIbFNBMVlsbDdacURyZ1pSMHpoY2RFcjhtWnd3YnhBNkdNREljdStJcHh0?=
 =?utf-8?B?TmhmMlkzN21WOVVVZENHNkRCZmVDU2RCZTJVUW9hRkozMjdVWWgwNFhQOVpw?=
 =?utf-8?B?L2pFMnkxTGwzUGQ3c0ZuS244NW1nbHB6d3JwQ2orOFFNZy9heEZpa2dkWk9D?=
 =?utf-8?B?eCtrR0xCSVF0VExwNzlsVm9HWTZ2dzB3ZXA2RCs5UzlhZEU0U0drRDhMME00?=
 =?utf-8?B?VFBoWTd4Tk1seEx6ZzBROTZ6dGlDV2JUajZUYXgvbi9MZTR2M0ltaVFNWVB3?=
 =?utf-8?B?NTF4T0htYjhCZHlqMVpYWUxwaXllcUl5WENvU1JDSkFwU2c5UUc3NC9LSDRn?=
 =?utf-8?B?VmMxWnBhdVpCcFdhb2duNmpGNHpkL1laZUZaY3g3U3lLdzVLNkJweVZMQ1c0?=
 =?utf-8?B?Y1JoOTI0ckt5VkdnS01ab2Z2WHZpcUdMdmoyM2hIMnJvU0U5VXhUL1A1UmhE?=
 =?utf-8?B?eFZxNFF1RFBnRHZMVzd6RkduY0RJR0dwUTlPNGxONDYzdndjUXYyK205Tm8z?=
 =?utf-8?B?dGhtSlJpLzZpb3NoVXU0dUcxV1d5amgrRVFBVlY1dWVnN0dlbTVwZFI0YWlh?=
 =?utf-8?B?MFBpTGNmVXZ5dmM2NlY3SThLTjB6d0srLy9hRGl4eW5wZU5SdzhuWHBhNHB0?=
 =?utf-8?B?V3NKd3NoQ0paTWtXQSt4MVpBdWI5eEtHV1VjZzVPb21RcnJMakxsdnNxUmwv?=
 =?utf-8?B?WE9RZXBXOXVzdHFiWi84S1B4MlRmQkJJWTdQY0JkZS9aaUZ1TllVS3haSmxG?=
 =?utf-8?B?TDBIZWwyeWkrWjVNNk9UNDRzSHgxSlBTd1E4U05JNkdNVXRPTE12bmJSR005?=
 =?utf-8?B?T0I2K0diL0paditlNFNub2k3WlBRWFJRTzJZL05NRXY5T1lNVnlVRHlPQXRF?=
 =?utf-8?B?dENOM2F2OWFPM3pKaUJndXI0RFNmVy8yb3JNd20yZWV6ZE54VkRkTXlXOUI4?=
 =?utf-8?B?TUVjNFJCWmYwY3ZFVXJvUjRMTTB5S3NQVktvQTFHRDhuOWZCa2pvZ0VHQzhI?=
 =?utf-8?B?Vmxoc2dWekhpYWMzT01ORko2RW9Oa3ZGTWdTdDErTTFueGRKYko3NHQ3U2h5?=
 =?utf-8?B?YXVSM0t2STNtVmVtVFBFMTE1and3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2aefd6a-ffc4-45d9-f21f-08dcce69bd04
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 11:47:52.0281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StCebhwic1Kyq3W7bsooSklLtOHv/PKH13DZ/0k3SmeTxw+AZVdYdGn7jX2cmHHTJS3cos5K+fkl9xA7A4IU5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7694

Hi Michael,

On 30/08/2024 07:59, Michael Walle wrote:
> Hi,
> 
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> Infineon S28HS256T is 256Mb Octal SPI device which has same
>> functionalities with 512Mb and 1Gb parts.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>> Datasheet can be found:
>> https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HL256T_256Mb_SEMPER_Flash_Octal_interface_1_8V_3-DataSheet-v02_00-EN.pdf?fileId=8ac78c8c8fc2dd9c018fc66787aa0657
> 
> As Link: tag above your SoB please.
> 
> ..
> 
> 
>> ---
>>   drivers/mtd/spi-nor/spansion.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 6cc237c24e07..1390fe6f811d 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -966,6 +966,11 @@ static const struct flash_info spansion_nor_parts[] = {
>>   		.name = "s28hl01gt",
>>   		.mfr_flags = USE_CLPEF,
>>   		.fixups = &s28hx_t_fixups,
>> +	}, {
>> +		.id = SNOR_ID(0x34, 0x5b, 0x19),
>> +		.name = "s28hs256t",
> 
> Skip the name, we don't use names for new flashes anymore.


I have been observing the following boot crash on Tegra30 ...

[    2.515317] 8<--- cut here ---
[    2.518384] Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
[    2.527357] [00000000] *pgd=00000000
[    2.530942] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    2.536252] Modules linked in:
[    2.539309] CPU: 2 UID: 0 PID: 38 Comm: kworker/u20:0 Not tainted 6.11.0-rc6-next-20240905-gad40aff1edff #1
[    2.549045] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    2.555307] Workqueue: events_unbound deferred_probe_work_func
[    2.561148] PC is at strcmp+0x4/0x34
[    2.564727] LR is at spi_nor_scan+0x13c/0xf64
[    2.569085] pc : [<c0d05178>]    lr : [<c0734240>]    psr: 80000113
[    2.575345] sp : f08b5ae0  ip : 60000113  fp : 00000558
[    2.580563] r10: c0ea35b0  r9 : f08b5b64  r8 : c0ea35d0
[    2.585782] r7 : 0000002e  r6 : c1972900  r5 : 00000026  r4 : c2341e04
[    2.592302] r3 : 00000077  r2 : 00000073  r1 : 00000000  r0 : c2341e05
[    2.598823] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    2.605953] Control: 10c5387d  Table: 8000404a  DAC: 00000051
[    2.611692] Register r0 information: slab kmalloc-1k start c2341c00 pointer offset 517 size 1024
[    2.620486] Register r1 information: NULL pointer
[    2.625189] Register r2 information: non-paged memory
[    2.630238] Register r3 information: non-paged memory
[    2.635286] Register r4 information: slab kmalloc-1k start c2341c00 pointer offset 516 size 1024
[    2.644077] Register r5 information: non-paged memory
[    2.649125] Register r6 information: slab task_struct start c1972900 pointer offset 0 size 2624
[    2.657830] Register r7 information: non-paged memory
[    2.662879] Register r8 information: non-slab/vmalloc memory
[    2.668536] Register r9 information: 2-page vmalloc region starting at 0xf08b4000 allocated at kernel_clone+0xb4/0x3d8
[    2.679243] Register r10 information: non-slab/vmalloc memory
[    2.684985] Register r11 information: non-paged memory
[    2.690121] Register r12 information: non-paged memory
[    2.695255] Process kworker/u20:0 (pid: 38, stack limit = 0x(ptrval))
[    2.701692] Stack: (0xf08b5ae0 to 0xf08b6000)
[    2.706048] 5ae0: a0000113 c08fac4c c0ea1030 00000004 c1a11840 00000000 ffffffff c02b9f94
[    2.714220] 5b00: c15dce68 ef7e420c 20000113 c08fac4c 00000000 c1a12000 c2341dac c2341c00
[    2.722392] 5b20: c15dce68 ef7e420c 60000113 edb7cb1f c1a11840 c1a11840 c2341c00 c2341e04
[    2.730564] 5b40: 00000000 00000000 c1972900 c1505994 c2341c01 c07350fc ffffffff c02b9f94
[    2.738735] 5b60: c2341c00 00ffffff c1513794 00000000 c1adc700 c19f1b80 c2341dac c2341c00
[    2.746907] 5b80: 00000113 c06b04dc c19f1b00 c19f1b40 0000000c 00000040 c2341c00 c06b05c4
[    2.755079] 5ba0: c2341c00 00000000 c1a11000 edb7cb1f c1adc700 c2341c00 00000000 c1513794
[    2.763250] 5bc0: 00000000 c1adc700 00000000 c073aa74 c2341c00 00000000 c15137a4 c06ac3f8
[    2.771422] 5be0: c2341c00 c15137a4 c2341c00 0000001c c1adc700 c06ac63c c1adc700 00000000
[    2.779594] 5c00: c1505994 c15da864 c15137a4 c2341c00 0000001c c1adc700 00000000 c1505994
[    2.787765] 5c20: c2341c01 c06ac7c8 00000001 c15137a4 f08b5c84 c2341c00 c1adc700 c06ac8fc
[    2.795937] 5c40: 00000000 f08b5c84 c06ac868 c1972900 c1adc700 c06aa7d8 00000000 c1adc770
[    2.804108] 5c60: c1bd98b8 edb7cb1f c2341c00 c1972900 c2341c44 c1adc700 00000001 c06ac284
[    2.812280] 5c80: ef7e4224 c2341c00 00000001 edb7cb1f c2341c00 c1a11000 c2341c00 c1adc700
[    2.820452] 5ca0: 00000000 c06ab3ec c2341c00 c1a11000 ef7e4218 c1972900 00000000 c06a87f8
[    2.828623] 5cc0: 00000000 c2341c00 c1a11000 00000000 c2341c00 edb7cb1f c2341def c2341ddf
[    2.836795] 5ce0: c2341c00 c1a11000 00000000 c2341df0 000001df c073f590 c1972900 c1994010
[    2.844967] 5d00: c2341c00 c1a11220 c2341c00 c2341c00 c2341de0 c2341de0 00000001 ef7e4270
[    2.853139] 5d20: 000001e2 c073f658 c1a11000 ef7e420c c2341c00 c073ff64 00000000 c01917e8
[    2.861310] 5d40: 00000070 c10d6ce0 c10d6cec 00000000 c1972900 c10d6ed4 01312d00 00000001
[    2.869484] 5d60: 00000070 00000000 c19e73d4 c018a6a8 00000070 c1af4e40 00000000 c19f2280
[    2.877654] 5d80: 00000000 c0744514 c1a11380 00000070 c0745688 c19e7300 c19e7318 edb7cb1f
[    2.885826] 5da0: 00002000 c1a11000 c1a11380 00020000 c1994010 c1994000 c1972900 00000070
[    2.893998] 5dc0: 00000000 c0744ee0 c1af4e40 c1a11380 00000000 01b7cb1f c1af4d80 edb7cb1f
[    2.902171] 5de0: c1994010 00000000 c1514938 00000000 c189e800 c1505c74 c18d180d c06ae9c8
[    2.910344] 5e00: c1994010 00000000 c1514938 c06ac3f8 c1994010 c1514938 c1994010 0000001c
[    2.918515] 5e20: c189e800 c06ac63c c189e800 c1505c74 c18d180d c15da864 c1514938 c1994010
[    2.926687] 5e40: 0000001c c189e800 c1505c74 c18d180d 00000000 c06ac7c8 00000001 c1514938
[    2.934859] 5e60: f08b5eb4 c1994010 c189e800 c06ac8fc 00000000 f08b5eb4 c06ac868 c1972900
[    2.943031] 5e80: c189e800 c06aa7d8 c1505c74 c189e870 c1bd9a38 edb7cb1f c1994010 c1972900
[    2.951201] 5ea0: c1994054 c189e800 00000001 c06ac284 00000000 c1994010 00000001 edb7cb1f
[    2.959374] 5ec0: c1994010 c1505c3c c1994010 c189e800 00000000 c06ab3ec c1994010 c1505c3c
[    2.967545] 5ee0: c1505c3c c1505c54 00000000 c06ab8ec c18e7400 c18d1800 c190a400 c1505c70
[    2.975717] 5f00: 00000000 c013c900 00000402 c1972900 00000000 c01b9440 c0e0105c 00000000
[    2.983889] 5f20: c157efac c18e7450 61c88647 c18e742c c157e2ee c190a420 c190a420 c190a400
[    2.992061] 5f40: c18e7400 c190a420 c190a420 c190a45c c1403d40 c157e2ee c190a400 c013d2e4
[    3.000233] 5f60: c1056338 00000000 f08b5f7c c18e8280 c1972900 c013d1ac c18e7400 c18e8380
[    3.008405] 5f80: f0815e5c 00000000 00000000 c0146038 c18e8280 c0145f24 00000000 00000000
[    3.016577] 5fa0: 00000000 00000000 00000000 c01001ac 00000000 00000000 00000000 00000000
[    3.024748] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.032921] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    3.041090] Call trace:
[    3.041101]  strcmp from spi_nor_scan+0x13c/0xf64
[    3.048336]  spi_nor_scan from spi_nor_probe+0x94/0x2c4
[    3.053564]  spi_nor_probe from spi_probe+0x88/0xac
[    3.058452]  spi_probe from really_probe+0xc8/0x284
[    3.063337]  really_probe from __driver_probe_device+0x88/0x194
[    3.069256]  __driver_probe_device from driver_probe_device+0x30/0xd0
[    3.075696]  driver_probe_device from __device_attach_driver+0x94/0xc4
[    3.082224]  __device_attach_driver from bus_for_each_drv+0x58/0xc0
[    3.088491]  bus_for_each_drv from __device_attach+0xf0/0x194
[    3.094234]  __device_attach from bus_probe_device+0x88/0x8c
[    3.099894]  bus_probe_device from device_add+0x57c/0x754
[    3.105303]  device_add from __spi_add_device+0x15c/0x200
[    3.110713]  __spi_add_device from spi_add_device+0x24/0x38
[    3.116286]  spi_add_device from spi_register_controller+0x798/0xaa8
[    3.122642]  spi_register_controller from tegra_slink_probe+0x2e8/0x428
[    3.129261]  tegra_slink_probe from platform_probe+0x5c/0xb8
[    3.134928]  platform_probe from really_probe+0xc8/0x284
[    3.140241]  really_probe from __driver_probe_device+0x88/0x194
[    3.146159]  __driver_probe_device from driver_probe_device+0x30/0xd0
[    3.152599]  driver_probe_device from __device_attach_driver+0x94/0xc4
[    3.159125]  __device_attach_driver from bus_for_each_drv+0x58/0xc0
[    3.165390]  bus_for_each_drv from __device_attach+0xf0/0x194
[    3.171133]  __device_attach from bus_probe_device+0x88/0x8c
[    3.176791]  bus_probe_device from deferred_probe_work_func+0x7c/0xa8
[    3.183230]  deferred_probe_work_func from process_scheduled_works+0xe8/0x498
[    3.190371]  process_scheduled_works from worker_thread+0x138/0x2bc
[    3.196637]  worker_thread from kthread+0x114/0x130
[    3.201519]  kthread from ret_from_fork+0x14/0x28
[    3.206223] Exception stack(0xf08b5fb0 to 0xf08b5ff8)
[    3.211270] 5fa0:                                     00000000 00000000 00000000 00000000
[    3.219441] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    3.227612] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.234224] Code: e5e32001 1afffffb e12fff1e e4d03001 (e4d12001)
[    3.240384] ---[ end trace 0000000000000000 ]---


Bisect is pointing to this commit and adding the 'name' field does fix
it. So it would appear the SPI NOR code still wants the name field.

Jon

-- 
nvpublic
