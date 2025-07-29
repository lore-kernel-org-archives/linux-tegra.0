Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F501624E1;
	Tue, 29 Jul 2025 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753777707; cv=fail; b=MctPXzKoVYxwhzHMO5UjWN0xM+GodMg4PRkI8Mz9UhAMnB73T8Rxc6/1RVeZmx6FDPdVotxv0FGImrHCt5Su4lKJBSQobHqdhjG5K/SOyX7hifMRPfxw0W40Odl/ueWEP94G7lvt2vQo7d+tpr3/bQC+NE2q+8dc+tE5RZ2FD5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753777707; c=relaxed/simple;
	bh=7b69JHuDxD7GXfU8uy5y31cGoGEAAPvxiJxhcMCOud4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RuDqGUWK/Y4hgSiyx22hars5Sr6KNSgHiNgIiBwwbv0sDQxNm5OT0Kcc23uWeQc8TGB/k4SNSkedku2M6U1ZmmYstyAsuxwarAPovvK8GHwVITBoWd9iCINIWYEYh5fQcviDon6/CutejtMobxNian7baIYeBComkuh0AqFwSNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E9O6+O6e; arc=fail smtp.client-ip=40.107.220.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E9O6+O6e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7zi2VQL1L/oAAYQuMdF53tAkbg8XOozxm0Tmve3kYvJ3urKb+3XdMGN+YtrAB5U4rJscTRx0nrD4x3xKvcWHFhPQb7KTLmHc6dYKvpM7tSoiA6DhHWpNDaed9Sbj1I7hxOoxolBgnVdjfW6vbAdDYSLuWn/1VTlKt2J+8TiLQjmJr4Olg40O79DZUQ7mn/QFiGEtziY2i6QA36QFqo4BKueUuuyYl9tjznnlcjzWfNB+bK5sZcG0Q9abZrgzUwnU/RIJOKHv5XQtolMXjKGrIPdu2/uV14B3eWRwhmNx3OPxYvfnX2mSFJtKK9Nn59mbf15L4NSeV3gCUE2vL+NVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHvjTmoG3cYVX0AWhxlVhQAcSvw/OUpKpeUWtEzrkIc=;
 b=i2aOoQyTg035gItUGhYyKugVcDArur2X40w+VNEq/Gd/FNoX1lyGFMGWQgAvkidQgB35ZS/cCeR0PMBK/cr0lIHEDIAZjQ4jr87+ytut1ML5G8yMDSyRM5AGC7vobwUzbmNQ0cmjgu++4E0ZZ8OdwdMfO3VZtvGHRq01YS/7uItcPAxCWrRBg6j7vqvAuNgPApzXUfdFdrbMmnYnjdTJV/iH5f4oyEoc/nKBsxP6LDO2rv5kiVKoXyX57T5huZwSmK0INgSYkzjS2Wb6hlHG8oH3o0LifGLB2rPiroNdBmDtyfQ6ojRRLrbR5upFmgv16sbGDEEcQMY47QoWIxF6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHvjTmoG3cYVX0AWhxlVhQAcSvw/OUpKpeUWtEzrkIc=;
 b=E9O6+O6eISJ4WFsNeVKJEiyiBf4VqbOV5Q6bdQ7kenfwWiG6hVf9XyA8hlXsYyoGCXfFrt+bxgp+eS95dZ1KVq9TC1vFLDqY6QcqeXYSBuAlGZnmbFmz9zpKux2y4hfNI2+2ULVwY9ntEffcQzs5Vq+fvFvLo5p4a9wAKenqEv2HcG5deiAzueIaNCqBjECwi12y1lPjBCfXKltJSrghN4OJ+3MShJS7a0cZwxdfMU8+XQsXgP7bhULjdbl8k3+RXFi85eFiuhA11fnBGVoZBGdRKgK7GAdIUVG6/xgcO8hygI0onaSYN3Is4j846BkAb5OqD4OIpmBsBA3LdKxUVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH1PPF5A8F51299.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Tue, 29 Jul
 2025 08:28:23 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 08:28:23 +0000
Message-ID: <e9100dbf-524e-4edd-aba3-71e28fbc07d0@nvidia.com>
Date: Tue, 29 Jul 2025 09:28:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] regulator: core: repeat voltage setting request for
 stepped regulators
To: Romain Gantois <romain.gantois@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250718-regulator-stepping-v2-1-e28c9ac5d54a@bootlin.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250718-regulator-stepping-v2-1-e28c9ac5d54a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH1PPF5A8F51299:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fede145-02c1-490d-1021-08ddce79e1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3BrKzNNVGQ0VXFWSmZRaDRGWUE4Y2R5OE5tQjBYcndQTURLOGcxbTZHRUJh?=
 =?utf-8?B?MTlGa3Zaa3gvOUhWY2tOcTAyMEl5ZW5ld2l2aThSTUE2MUV4eGNLSElEcVRY?=
 =?utf-8?B?cDVySTRIK3NheVlDa1FIM3lkNlBsa3lUY3RLSFBoa29aRzgzbVJwUE1LR2xt?=
 =?utf-8?B?K01VVG5DRXhJS0ZieTMyTmhKV2gwcEgzeExRemd0NUIwK1Y2VjBCZjVYS2hp?=
 =?utf-8?B?R1JnRmk1QkNaVU1ha3JSa2E2djR4ejFMYmhoaWppcVdPSHA5VDI4QlE3VUJo?=
 =?utf-8?B?VElhbDNUMFl4LzBJbzNHR0hvQktlUTlLbk40L1I4MnI4eFVDTnNqUmtWUGNu?=
 =?utf-8?B?dGhZUlRKVkU2dmVqQndLRmFKMUxpUENyc2xEbG9jRXlZMC9SNjF3ZU56blRY?=
 =?utf-8?B?c3dhQVZFQWZBL2dyVEFvcmw1eFFCOUU2dGlvN2dWNTBPSVZ6U0RCUjRDdjY3?=
 =?utf-8?B?ZTg4YkNRMWxBN2JRT3did2oyVFBmMVczcmJEaDBPUk4relN3V3V6dVFrOWxk?=
 =?utf-8?B?VHJhTTZiRkJtUFhNcC9XRmd0ajg1TUxtNENETTVTYlNNNlRmRXYyRlgra1JX?=
 =?utf-8?B?Vzh5WVp5M0N3dnJ2RW1JZXJaajBMSE1TS1h3NEJ1djg2SE1OVkh1MFRrakVN?=
 =?utf-8?B?Zmh5M0c2OGhyNUd6NlhkbHczZ1RYQTkrTFZjUXk1QjdWWUt5cnFXMVRndXhW?=
 =?utf-8?B?aWJyejdaczVEZStLM3ZBV05lUldCZW5Sb1MySlN0QWVLZkovaXZCYVJ2eFJq?=
 =?utf-8?B?VUVIREY0N0F1SWJGemhGaU9qOW5jTjF0alU5d0VScUVtL2xwemVnay8wR1da?=
 =?utf-8?B?SUdPRVQrVXZZV2YraEQyRkR6dCs0cjZab1lSTi9SMGwvbWFzWjNDZUk4bm9Q?=
 =?utf-8?B?NjZPelhJWi9ielhFQWYwY242elgzMUhLalpORjdjV3lqcTg1RHpiQ3U0dzY3?=
 =?utf-8?B?ejU4VEpGWFdBL3lwSHhSMXl0OHNpbFRNc2ZRSXU0WkFhQzRiaFFVSktZbUxR?=
 =?utf-8?B?aDlFYzZZUkIzRkRwN3l5VFY5eWNzcG9uMkhLZUh4c0Q0c2JxeExoMWpYYXly?=
 =?utf-8?B?bktOazYvMGVhL1I0U1FMTlJJbzBaQmkzNTlVT2I1V0hqY1JlTHI1QmcwcWEz?=
 =?utf-8?B?Y2h4MnpjclpwZWVITEY1YlNuVkczaCt3UmQ5Y0h3SzNleVRyNGFWTUlNaGUy?=
 =?utf-8?B?R1pEb3A4TUhiTVQ1ZmQyVTNrTTYvOGs2aklIb0E1Y25JNVI2Wi9rc0VPM2xF?=
 =?utf-8?B?SHdmM1NXSGtQQ1RLMzJGSFBQUFIvTm5zUURqMUJIMS92Rmg2RjNHazRLMWpz?=
 =?utf-8?B?THFWVFptTmk3NHl4bkQ4eTlITWNiazJsVjRFSFh4QTFWc1lZeU5lSnZDZFBD?=
 =?utf-8?B?N1pLRkRyMkM2T3JrUkQwWFBYeitteGdDTnFSVlhuaFZNRnBWMDg1Yld6ZkJu?=
 =?utf-8?B?Rk1sMFhVUGJ3eUd3WkFVRXV3eDVlcjRGRjdad2VjeGpoU0NvN0xjMGpnRTlN?=
 =?utf-8?B?dHB4OGEwQ3h6bzhlTkNVZEh3VzhhVWR6RGJtK1FKSm9taG9QQmVoYzJ1OGVJ?=
 =?utf-8?B?Y3hadDV6eVE4dUVTZkZmSGxjV0tZTzRzODl0MzhXZjh3MFJIc2k2eGNWTy92?=
 =?utf-8?B?QkZ4NlpCR1g5ZTVaM2o1OXF0TlhLL1lRZXk4OHBxNHBaNmgvK0FGMWZGVlhU?=
 =?utf-8?B?UExFUHI1eElnWW9GYk91Zno5UFU3SVlEcHlVVzAvQllFWWQxT3dYWE5TUDdX?=
 =?utf-8?B?RERQZEdKMUhoY1k4Z01XbEQvYTM2a3pLWE5nYjJ6TXhJbkVIMEVNdU1qcHNO?=
 =?utf-8?B?U1JSbVcrbnY2T3VkZWdqK3VxWC9tMWRXWjQzclV1N21iK3RZdDEyK2pPY1pB?=
 =?utf-8?B?cVZwbHZkY2Y3bU9IS2lmQm5ZV2NqV0VveHNzOHFBVStnWXA3YUI4WjVaVmhE?=
 =?utf-8?Q?EstQ7hK66g0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEYrdVJIZUV1b0V3bjlHenBiTnlNclpJdEtIelo2SW1wVzkvTFhnTmhvWDdu?=
 =?utf-8?B?KzZueHNQWlBwNFh2Q1dsZE1MM1lGWnF5T1grRXRMTk5XZjhoVlpORjNleXM5?=
 =?utf-8?B?UmlITU04WUdwa3kwNnUwUC9VSTdqN0ZXV1d1UDl2dndqOHNUdEE1T1lNN25x?=
 =?utf-8?B?TitrSkYreGtxd0FzTlo3V2F5ZmU3RVNZa2VnUFlYQ2szSlozUS9zL01WcjIr?=
 =?utf-8?B?QkFtNWdsNEVoaEIza0ZIV3VCcnA4ckQxZ2ZLWUNyY0Z6bWdHNEZ5Mkd5UzIv?=
 =?utf-8?B?OC9YSDhvOXNuQlorc1hhYWpCSjhUODVqdXNYd0hPaXQwMXlRN3dBRTZtUVZ2?=
 =?utf-8?B?NUdxUStGRWxYcmdyVEJTc25LemVrTllSUXlPay9maEx1bGY4QW5ObGM2OTlp?=
 =?utf-8?B?L0dtK3RicVRvcTVxVy9NdVIwcUFhRXlnWlJvbHNIL1FIOFdyZWxXSkEvSUNL?=
 =?utf-8?B?bk5nQlM2Tlk0TGdJSzI5NThYb210blNQdWw2TW1GOFNJSFZaYlNFaEZhd3NC?=
 =?utf-8?B?OUNMeHRUQUZXWFdsVjBjUVpCWDNwTXYvNWYxWHkwUTFzSXVtSmcvZ2NNZG9u?=
 =?utf-8?B?Q0U2SzJvMllZZDd1QWxqaXorL3hKUzkvMmxvUXU1dmJqYlVSTEZCdnBxOEdB?=
 =?utf-8?B?eDA5TmNvdFdHeTIwK0hZemZPQzhXNkFJcTIwcGVMdUtybHV1S0pXWmlxNGxo?=
 =?utf-8?B?elhZSXFNQnNZRmJFSmF2TnBIeTJiOWdtd3NIME1pV1cvNkUwMnQxbWk5WmtM?=
 =?utf-8?B?QlNaaWZrNGsrdjMzRjFubkhCaitPb0xORGRYSUFtVGw5ckxHZXVrN1RxWmlk?=
 =?utf-8?B?aXBCYzRYdXlkc0RsV1RCTTRtMy9oR3BCQ1NOL2hENTY3WjlVOXFSZkNmVEEz?=
 =?utf-8?B?enhhWUhnWmZJb3YwK2NNeDZkeDI2NEl0eS81NmpmY3l3ZStoYWZyZDJsYmlH?=
 =?utf-8?B?WndtV0VuZXAvMVVwdjNOMEhabUFWUXRUMG5FakVic2N5YlgrNXBRWDRTbVJa?=
 =?utf-8?B?UTBBenRqdzQzcjc0NGV4aDhWK2VTRUM0SEVMVndUbUFUZk1XTXZkc2EyVytB?=
 =?utf-8?B?OEgreFdhV1pIQThyN3c1Qk1oa1ZQN1Rrc1pOMlJVMThaNTZLcHNmYlNRTlFY?=
 =?utf-8?B?OXQ1TlBwMElIVnEyRjZLak0wR2VJVjUrSk5YYjUrQ1FBb0VrUHJzczBPQmRW?=
 =?utf-8?B?cm9kbWZVQkNLSHJHa05MOGs5QVVVV0VnbTVuQnRUSjZPUVJaS3FvMTVROHhi?=
 =?utf-8?B?TEZ1enRiVktxNkFTRUNDNFh4MlJGVWV0SmlMZ0hua0EvYldnYTRCMG14cG0z?=
 =?utf-8?B?U0hsTWRoVjNDSzBJUlZvWlByTVNUZkxKRWFlUHFRNVkrUDBqVUd5bmNQTVFt?=
 =?utf-8?B?ZWZ6QjRkM3pLQVoyQUJJaDFyb3BnMlJDTFFhcFNIS0ttV0Z3UWJpQUdXak9r?=
 =?utf-8?B?RFhoUkFqOWd4S2tWbGhmV2hEeFlRTE14TEo2TWZIYlBYeVo5RG9hWnlGNmZo?=
 =?utf-8?B?TXBMQjVLVTM1Z216bHdhTnhVdytTdnBwYmFjMlNicmFJTDUwMGcyUnV6c3Ju?=
 =?utf-8?B?L3VCUWZGNy9TUHZMNlJJbHgvUStNMSs4MXgwY0RNMzk3WmtraHNTQ2ZsWE1w?=
 =?utf-8?B?NElMWWtrMU1GZVBkL1JlNFowL0lzM0tYRTI5bGNmcEdSaXcraFdRQk1RZkUx?=
 =?utf-8?B?NW1wdk5FSVdOeXJFR1RhTlNLempjemF0blFDSlNnUDZsd0gyOHdPbDc2bDRo?=
 =?utf-8?B?R214K1VXRCtnWlYwMEhEU0JHTjZTMUl0cW9SblFTYnRreHpHYTlnTE9nclFG?=
 =?utf-8?B?Z2Z3Z21HdEdjNiswTkRDbnR3QjlLWTNpdjNoQ1dGSUorT0NNR1dHNG9MRUFD?=
 =?utf-8?B?MEV6OUNveDdQZkQ3Z09XeXJ5YnN2UE9WTHljRE9yalU1cGtua3JIMzFaK0tj?=
 =?utf-8?B?TE5XVFlVY0VkSzZFUGNDRXBBUzFVbDMzTDc2RzJGUk1HbmliTStNdHZmYUNq?=
 =?utf-8?B?Z0FwMnN3ZlpqSncrT0pNSzNjcWJWN2V6cDRWVE1XYjlJWU1Yb2ZTS1lFdUdi?=
 =?utf-8?B?RnNFQWIwVEFNLzZWY2k4eGZmQldLYUNqSzBjeEJ2QXhpYXdKMkp6dkdmOXBG?=
 =?utf-8?Q?8TJKTbnUVr1gaSfGkqtfCtbgj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fede145-02c1-490d-1021-08ddce79e1b2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 08:28:23.0824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCCBusaHmwPladHbeamMBCifteoacOL5CCR16mgoqv3dkiC9KYVtI+vodW60A+oVz4bD3YT9dNhHNpxvyARucQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF5A8F51299

Hi Romain,

On 18/07/2025 15:11, Romain Gantois wrote:
> The regulator_set_voltage() function may exhibit unexpected behavior if the
> target regulator has a maximum voltage step constraint. With such a
> constraint, the regulator core may clamp the requested voltage to a lesser
> value, to ensure that the voltage delta stays under the specified limit.
> 
> This means that the resulting regulator voltage depends on the current
> voltage, as well as the requested range, which invalidates the assumption
> that a repeated request for a specific voltage range will amount to a noop.
> 
> Considering the case of a regulator with a maximum voltage step constraint
> of 1V:
> 
> initial voltage: 2.5V
> 
> consumer requests 4V
> expected result: 3.5V
> resulting voltage: 3.5V
> 
> consumer requests 4V again
> expected result: 4V
> actual result: 3.5V
> 
> Correct this by repeating attempts to balance the regulator voltage until
> the result converges.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>   drivers/regulator/core.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index cbd6d53ebfb5ef21b5dfc8b0f1f1f033772a886c..8ed9b96518cf5186c0db147a6895a92bc59fae4e 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -3797,6 +3797,16 @@ static int _regulator_do_set_suspend_voltage(struct regulator_dev *rdev,
>   	return 0;
>   }
>   
> +static int regulator_get_voltage_delta(struct regulator_dev *rdev, int uV)
> +{
> +	int current_uV = regulator_get_voltage_rdev(rdev);
> +
> +	if (current_uV < 0)
> +		return current_uV;
> +
> +	return abs(current_uV - uV);
> +}
> +
>   static int regulator_set_voltage_unlocked(struct regulator *regulator,
>   					  int min_uV, int max_uV,
>   					  suspend_state_t state)
> @@ -3804,8 +3814,8 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
>   	struct regulator_dev *rdev = regulator->rdev;
>   	struct regulator_voltage *voltage = &regulator->voltage[state];
>   	int ret = 0;
> +	int current_uV, delta, new_delta;
>   	int old_min_uV, old_max_uV;
> -	int current_uV;
>   
>   	/* If we're setting the same range as last time the change
>   	 * should be a noop (some cpufreq implementations use the same
> @@ -3852,6 +3862,37 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
>   		voltage->max_uV = old_max_uV;
>   	}
>   
> +	if (rdev->constraints->max_uV_step > 0) {
> +		/* For regulators with a maximum voltage step, reaching the desired
> +		 * voltage might take a few retries.
> +		 */
> +		ret = regulator_get_voltage_delta(rdev, min_uV);
> +		if (ret < 0)
> +			goto out;
> +
> +		delta = ret;
> +
> +		while (delta > 0) {
> +			ret = regulator_balance_voltage(rdev, state);
> +			if (ret < 0)
> +				goto out;
> +
> +			ret = regulator_get_voltage_delta(rdev, min_uV);
> +			if (ret < 0)
> +				goto out;
> +
> +			new_delta = ret;
> +
> +			/* check that voltage is converging quickly enough */
> +			if (new_delta - delta > rdev->constraints->max_uV_step) {
> +				ret = -EWOULDBLOCK;
> +				goto out;
> +			}
> +
> +			delta = new_delta;
> +		}
> +	}


Since this patch was added to -next, I have observed a boot regression
on our Tegra30 cardhu-a04 board. Bisect pointed to this commit and
reverting this does resolve the problem.

Looking at better closer at the issue, I noticed that it is the
'tps62361-vout' regulator that change is causing problem for. On boot
I see regulator_set_voltage_unlocked() called for this regulator and
min/max voltage requested is ...

  regulator regulator.5: min_uV 1000000 max_uV 1350000

The min delta is 300000, but in this case the delta never reaches 0
and in fact never converges at all and so remains at 300000.

Looking at the above, if the delta never changes, then we get stuck
in the above loop forever because 'new_delta - delta' is always 0
and this is never greater than 'rdev->constraints->max_uV_step'.

There are two things that is not clear to me in the above change ...

1. Why do we 'new_delta - delta' instead of 'delta - new_delta'?
    Assuming that we should converge, then I would expect that
    'new_delta' should be getting smaller as we converge.
2. If difference in the delta is greater than then 'max_uV_step'
    doesn't this imply that we are converging quickly?

I am wondering if we need something like ...

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 8ed9b96518cf..554d83c4af0c 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3884,7 +3884,7 @@ static int regulator_set_voltage_unlocked(struct regulator *regulator,
                         new_delta = ret;
  
                         /* check that voltage is converging quickly enough */
-                       if (new_delta - delta > rdev->constraints->max_uV_step) {
+                       if (delta - new_delta < rdev->constraints->max_uV_step) {
                                 ret = -EWOULDBLOCK;
                                 goto out;
                         }

Jon

-- 
nvpublic

