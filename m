Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010048.outbound.protection.outlook.com [52.101.193.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35651E1DF0;
	Fri, 19 Dec 2025 05:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123009; cv=fail; b=IUxoFInt+H3V3cPePEqUzcxnD1Q8eXGhmuqHRLOLK/Paij4xRLJx/CeSDDcJNCmgcoVzb2QGMER+XEoHwIqh9H42Fw+xJOaklq7bf6KRH2hgd5dZmvM+N48hv+u/Sy44Nn5QiNO0op+rTiQhJIcsZuLaTHaGcuPhixoB72C7NK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123009; c=relaxed/simple;
	bh=0XCrMJpqkd9FVdbS6UnTh7whmaYChNVXHk2Ix/d8h1w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i//Hozhq3XQ3VKQUIP6DCQoaZd5S7esDtsay5Vbd6QScG4grdWFS/sawfaRdopruV6q9Gg3EZWCzmt/FawTm7AIUAon/S04R4tvs5Q1yuNiepvYcP2+NQJ02U+NUo7lvD6MZQUamD9HoAtEpivDpwva3+VgUukKOyhETBep/4Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HeHMGxau; arc=fail smtp.client-ip=52.101.193.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HeHMGxau"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plztdd7sbh5Jhj2nnZ7csC7hQLZ1rQ5qjPVGpWPMXM0jKQrDEvlL5d+MjaQzQ+tyNZsLINpKBOjF1O35OUdj3euvdXL1E9z2K9UWynDhTcnvu+33bjGl8sCPJn/vvYMQMHUzcsV5j5mQXIC0jWZS53T0tZXJWi+5iRQH6L+0gKC8xFJnI0mDU1l5GD0Hf63dGcFJlaNOq9zAL221GBZ3VCZ965d/D3Vpy9V5cT21YNvbfnOpbSiOuSZb6aRFQdvQg80qUgniPaMTGOyPuVKJK1vH0vfW2sxE5IcBZBDkC0Hx0RaFCN3JeX6NvdwfJX8Q3nMN5UlPVmgApEYxa7aUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x0F2D812u7cD03yHzGkT/N9WEHIxwMLkr8VJBv/+5w=;
 b=njPHSCiRabFzhiJMAJNOAPG+w8ppV7T1le1iusxXXfD00K2SeQ+sTcVzvDlea2IyM34jNthFRBbfeo8wc7DZOCam3l6Utx38aBbeMc0ro//A1TsqBp44UNmD9OhvozgPXN+bUV4/oxnb+TghwBBDZPgpzktrltWnNc6VRVieOd5gZWAx1r5YbSNuzQXXg3wOMT0ZOhCt73Hr0Ndp6/h3uVhjPXmmJDDUf6wNDl45a7iPM2S6Fh/XRNEr8RaUkp3fzAZ9WT5SrS5UBUZWWJ3Zouy/lY4lNxijC68q8HqoDplTDU7p/JHm6GeGXpbJflkZ5gIJP6IFLkPPaZSRcEHc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x0F2D812u7cD03yHzGkT/N9WEHIxwMLkr8VJBv/+5w=;
 b=HeHMGxauxVaOxmx8xbg613GWQQbvkqTbecTEmvl7MEFQ1vogU76AqvWyTJpHmGtpecNB3BEa3nHJyZ+rJw36QkHK34vmr9r3nX4/OKkbyGcyXEhwQWPHLL1ZscXrw8YoMwUTaTSCcifZvS47cqbJS4isyxaHhp3U9zBihiqhrLhkc5XZA7lGJEtUOIIIrd7jDk0kimssc3EcOz+LvlzkJu67zBwg5ZxFegFVXAXFZ43P0LV60eMONLDJB6xgNLjboHuLz+RrfmgIyDYhJvF9o98ldUTP2pDtldOFa6ZaaGMGXK2Ncv1YgmRjIz9zSUJhR7p/B1otV3IUbyO+egWAmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 05:43:24 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:43:24 +0000
Message-ID: <8727e681-a392-a31f-eb4c-5dfa4799ef43@nvidia.com>
Date: Fri, 19 Dec 2025 11:13:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/4] memory: tegra: Group mc-err related registers
To: Jon Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251124173510.2602663-1-ketanp@nvidia.com>
 <20251124173510.2602663-2-ketanp@nvidia.com>
 <c43abae8-c160-4798-9f24-d37af59351fa@kernel.org>
 <1244cf8e-d06c-473d-96a6-2b8e126a45de@nvidia.com>
Content-Language: en-US
From: Ketan Patil <ketanp@nvidia.com>
In-Reply-To: <1244cf8e-d06c-473d-96a6-2b8e126a45de@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0081.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::15) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d0e137-6fc9-4e04-2943-08de3ec18686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTNaSzlVTlRhT0VMRXZEUURkcFF4ZFdKdjdiNVg0ZFFYTEYwMFRtdXljcSs3?=
 =?utf-8?B?ZnlqZUR3RFJvOXVVVzRPeEpEZGhhMFFrOUlqTDRJMnh2TVROd3lNaFNxTDhZ?=
 =?utf-8?B?Z3RieU1JdkxWNzQyQ3I0TlN6bXgxeGd4MTRFUVpqVXgxdXNNL3BFUlo2a2JM?=
 =?utf-8?B?QzJRaFdJcCtXd0Z1NXlwK3hTWDZYZlJFTy9VZ05VRjJLV1J4ZnNkOTZDdTZY?=
 =?utf-8?B?dWVSRThIeEhUa2syYnJEQm5pd2cvUEhjTVBMMk1PUmZpUkN5dG9hUGZ3aWlL?=
 =?utf-8?B?c1RrRkdoYmtHSTRNTTY4M3RFTy8vN0J4K2dlU0h2b1A3RUwrT08vWjh1U0xT?=
 =?utf-8?B?SlFpSDFKNTBPTzZibjc5TlpjVlNoREJKVmlZSU5pWE5UR2c4aW5QeU5LWUh1?=
 =?utf-8?B?MWhHemtVNm1Pd0VpckhLRFhMeVEyZ1U4Q0FkdDZGTjNIVE44SHBtYlZ1TVFr?=
 =?utf-8?B?SnhHMC9zOWFJa1VBR3VlcVQ2WGQ1SFBwUElyY1AzQlJzN2grS05rbDY1ZnJI?=
 =?utf-8?B?c1lUVjhIeHhhMnVmenN1WlNLNmhRZ3ExY2JGQ2ZlY0ZmZEZ4dzdkcVB2ZGxN?=
 =?utf-8?B?bEwvdnNCRGl5TUowQTA5SEI1MXFjT3lpSXRQYjhmMzdwK3lwanlJK2NsRFdZ?=
 =?utf-8?B?NzFnRmJWQkl4bUYwNGVwclp0NGNwNjZTdkFHZzlocng0TXBBeDVFUi81cGEy?=
 =?utf-8?B?WmZNc0tNVGdTTmFuRWRZOXlDUWxVb1hzRDlQWjF0YkxlMWUyRGhWQmZKTW9h?=
 =?utf-8?B?Yk5OUE1Xb3NmMXFJKy9SbmpXM2VxeENnN1l3TUphUGYzWnRQWURsQkdicFhv?=
 =?utf-8?B?Qmo1ZktrV09VWlZrOHdjOTJZMkc1Sm5pTVpaQnN3OVl3WUR1bVNBaWNQUngx?=
 =?utf-8?B?bzZ1dnh3K0tXTUZJTHVMbHpoK1dLOFplZFFIYzlDTEhRYTNpdFk3WUhXWnY0?=
 =?utf-8?B?VVpwbTRsb0lTSUFmUEpuS3FXVWMxRWIzUWswVEdjeHVFYVRWRmVQU1l5eGdH?=
 =?utf-8?B?RitONHZuNm9McXhoSi8wRFE4S3FyUE9oNWFqWFNQWFNOZFlHQ21YVnllSURU?=
 =?utf-8?B?NlRybWxBaS9sVEIvTUdqNC9CRUlXeXVPdlI4M3lpUS8ydEZmTml4Y0RtSTlZ?=
 =?utf-8?B?MkpvWnF6NWdUMlRoYm9FOEpiNkxjS09uak1HTmR5NWdzZ3dBYzRwOW84M1ls?=
 =?utf-8?B?QmNIVXhUNHZ0dmlxWmN1OW5YRkZrZE9OVGlNNmJkUHVjUWYzTHpJUXlRRDFz?=
 =?utf-8?B?MmFmNjNhSHRteHpCSXMyK092SmszMzRGbnBjcXZVYm9LNWZQK2F5ZUd1WGlk?=
 =?utf-8?B?UGRKREJTeTd6MGxaRTc4WU81MmtEckVQSWoycS9oQkJGcTVSVnFQc05UdXRv?=
 =?utf-8?B?VVB4OHA0Tkw0dXVZYmJJRmZPUVoxUWlZMmlwME03dXVkbUhBUUZ1c2pEQWI4?=
 =?utf-8?B?RThrWEFYSmhyeHk2TjROOXFSZkZIYzRvaUVFWUJBNDlCQjM1ck5JNjFVSGpn?=
 =?utf-8?B?TU9md200YnpoVUhiNGlzTGQvTzdlRUFzbk91WmJjc0M2Y3U4UW12dzYzcXZS?=
 =?utf-8?B?dWdqb1VHYXgydW1uMU5GQ3A0MHVudjNzZ3JjZHZTSmVBU1JkRGlTUnJHM1BY?=
 =?utf-8?B?czNWcVFoVVhhY0ZDanM3MVdMRVhUdnZDd1JvZk0rVHJnQWlINlErSi9PSkFj?=
 =?utf-8?B?MGd4bjlsSmNGMnJlWk94cW40b0YwYmxDZU12K1UzdHVRNHFJZHM2TXg5NGVC?=
 =?utf-8?B?Z3hMM1M1RE5rUDRlUkgwZ2VtRTJidUtweEtiVERhSENqMEZuazhNcXFjNnly?=
 =?utf-8?B?bW1PWVNNZ0JtakZscmJYTTVwQkdQTjZ3dDl3NmZSd1hLZ1J6NUtkNzZYS2pl?=
 =?utf-8?B?VFZLRWJJU3EvUFNqWDkwZk0zS1FucDZkQ2w3Yk1MWWdwZ0xzeFE1Z0RYVjhu?=
 =?utf-8?Q?lf+FZoPotxtUwy+1WJnKlEMrgDIJ2tm8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTEzbTFNOXBqY2U2UTV4eG1wVFJ3SWQ4VktrMmJNeURrbDdxUHhlZ3RTUC95?=
 =?utf-8?B?ejNLOWlPWC9zZkY4RG9rcnhIekxneWJaWXZVSm1ON29NR1VZL3VMSUt4RDJ6?=
 =?utf-8?B?Qmk4UXdqMzBlbTBjalpTUmNmVVU3RCtVNWt5NExHNEZHYXNEanlCdHpvRStG?=
 =?utf-8?B?Yms1eG5JWVZoWEcrZG1vb0JWVUVBK0tuYjhpR0diUlh0VkpueEZZOGtDSS9Z?=
 =?utf-8?B?ZXJ1eVNyMk9Lb0U5SDN4cWx6Yk43KzJud1hIN2pPMjJXSHo1WElJcWxHYXFn?=
 =?utf-8?B?Q09BSy9lMlVna0xSRjE5bU1VNkhuN1M0UUpvdWFFNC8yTzhGMWhXRndpaEx0?=
 =?utf-8?B?bXVyQkZPSysxblRVT3hXaUxzQmJacmJkaTlyWExDR3JRc2QwVmU1bTR5NkRt?=
 =?utf-8?B?RU9ZVVVHWlJSd2R3T0NsQ2wydjhlUVB1OXdiL2JtWnFidGlQS0l2NGJuTE42?=
 =?utf-8?B?TWRaNW1jWHhWSzhCZEFWREhDbmEybENyVlFiYjJqMmpIRmNzb3ZaMWc1RUky?=
 =?utf-8?B?djBuYUlIckQxa3dhQWxUdlZFMm1hemp0Qmc0WE4wM0JlNk5KWlNmbk40emFs?=
 =?utf-8?B?UytYMmRSUStRUWJWWWsrRW9PSkh2bFJ4UnFkQTFGdldBMFMzaXhDSzIxdXhG?=
 =?utf-8?B?ME43TnVyZDVVMG1ZSG5nZjRnVTZhL0VZQTJnSWFpMzk4dnlFZVU0M3hjVnRD?=
 =?utf-8?B?Q1dDUjF2a09ZZmpZOURuKzg5Q0hYOWhRM1lmeFdmV3ZJQ05wUUhKMHFlN0Zo?=
 =?utf-8?B?UjBoTDF6R3JKbFdZWUxvaVBXN3llcFRJTE5NbnUyRVpzbHd3NkpzamdKalZP?=
 =?utf-8?B?dFRycXc5T1VpVnRvWThzT0h4UFpKQTk5TjdDdG5xUXdKa21UMTB5NjJ4QytK?=
 =?utf-8?B?azAxbEFkK2RYYTV4bW4zUFVoQUtYU3FOc3JCNk9xZERLQ1liaVc2MTFLZFVM?=
 =?utf-8?B?NXRqeFJzZ20ycitqNTlnTDM1MEw3Tkg0RDFPd2s3ZHI4aDFCam9HWFJDRHZS?=
 =?utf-8?B?LytpUW5PZ09xM3Q1a1F6Y2hhMU5EU3pETVMrYTZ5NmlEUXd1ckpmcmRHOXNL?=
 =?utf-8?B?K1NWVHY5ckV1SlV6TVA5aXZxektHSVpHbDNadThDRU82NFhTM3hYNXZUa0Vn?=
 =?utf-8?B?eS9UZEtDdjhaTGE3VDMyNWc0RjFldlZmdjBONERzWWhSbXdDRm5XYkluQ0t4?=
 =?utf-8?B?YURCUWZMa3BsSlB2aEQyeVY1c2VnSm5BOXFZcmpmcmlUYi9ZV3ltT2x5SHdt?=
 =?utf-8?B?eVhxOFdFaWdCUVdvRC9RSHZoNFB0cHhXZjFuTzF0ODVVdG05bDd2aW91WnhW?=
 =?utf-8?B?QmI5RHZVblRDdFV3QzdMQk9PTGtWRXVKa2w1V1krT3BwbDByR3V2WGcxMXl5?=
 =?utf-8?B?NDdjTzZpMEFKT0I4Q3FBdFJldDNXSnhWZ1AvdnNYRHBDdXp0SkJLYUZVVVVV?=
 =?utf-8?B?RjVDYlVCV214TkFZUGRUaXVXRkxqTEh0SDMyekdFZFBvMUpsUTJGYmhKazNj?=
 =?utf-8?B?R3hQMEVtN1U0dWpXRjJEL3BzNkREZFdzOGNyZVlsYlZZZUgwak1KampqZzBu?=
 =?utf-8?B?SGtLNEZkOU5KN0RDdzY1dU4yOUJZeit5VHdSQnJVSUpPa2JYQXB4c1ptV3Qv?=
 =?utf-8?B?WkZ0Ynl5TUUwMGVibE1WVlBVL0JHYzFmUlRqSnVtK3RPRUVTdnB2SFFCS2Vk?=
 =?utf-8?B?RFJwK2RrV0FlaEd4RFpueGlndExoamVzSVo1ajVEdzhqdkcyWXN6ZlNyck5x?=
 =?utf-8?B?RXBhMmF3dlB6V1hnellUWmFnanZPNFU5TXRwWjdCSnA2SXZaK1NDb3dscTdm?=
 =?utf-8?B?WlNQZW1UVjhNZDNmM3lYejNPWmk3OFkvcmVwa0VWNk9vTTAyTDRWMHpFVkkz?=
 =?utf-8?B?M2Nxb2xkUTRoLy9mUUhUNHRiYUF5Yk9XcWxkSWhFeTg3OFpBYWJGaXhGaWd4?=
 =?utf-8?B?dUlYUmlQU01yeEM4dS9XT3BheU0rcWlaRnloby9YZ2RMZTlBT1kwbHZKTjIy?=
 =?utf-8?B?VFR2RGdNVU53SnNCM2t0RVd6NzhQQjlSMWR5N09VdVVnaWh2eVJ2cXo1bnNR?=
 =?utf-8?B?b3RzdzhuVWxuTjI4VXlHK1BaZ3pielp1UG9hYVhtcExQNVhKMzVvMWdFN0Rt?=
 =?utf-8?Q?a1LOCpPiVe6vHOYcQvIqqGRGi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d0e137-6fc9-4e04-2943-08de3ec18686
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 05:43:24.2229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aweyib69xMK0KYyEHqaWgeA79mA6xuf8wAKepXM4hIEbX1zu6+Edgp0U0ttq/QlCJu8tKykuggnxm8QMEv/PTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012


On 18/12/25 22:21, Jon Hunter wrote:
>
> On 18/12/2025 16:17, Krzysztof Kozlowski wrote:
>> On 24/11/2025 18:35, Ketan Patil wrote:
>>> Group MC error related registers into a struct as they could have soc
>>> specific values.
>>
>> I do not understand the goal. The values already have "soc specific
>> values". Your commit msg should explain why you are doing this and based
>> on that explanation that's a no. There is no point in doing this.
> Krzysztof is correct. We need to state here that Tegra264 has 
> different register offsets that the existing devices and so in order 
> to add support for Tegra264 we need to first make this change.
>
> Although in patch 4/4 you add Tegra264, looking at this patch alone 
> the reviewer has no idea why we are doing this and it just looks like 
> churn.
Sure. I am updating the commit message in v5. These patches first create 
the base for Tegra264 and then 4th patch add actual changes for Tegra264.
