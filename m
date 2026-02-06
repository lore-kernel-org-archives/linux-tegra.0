Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ADC1F5842;
	Fri,  6 Feb 2026 03:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770349094; cv=fail; b=YZPMwvhQmfY4WFuORhalv8JKFOq/CW4AQ1bPbL8n5bbXhxFtEMT5pZKgJGE22r7oZTH2RGQ86IHyZNvsjowRLbc7m06D9VDuAdwoZgo7I5YLdko5xLp1Ft5q+3bRks9gWOv6tJeurp6fASZDUAIRbcvlUNQR/dq5kM72yOL+LB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770349094; c=relaxed/simple;
	bh=CbL3iAbzGh5Mi9k7G7z6wQFIBLp0Xoiu4wEM9QpWohw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V42mYvD6aUFUrNIeDS3xpGdkAFsJqkIVqmFhrE5doOkhWt5p9l3PxvgX0JJD38TU/wfJqWaD8SJWDkYwEixaqalPwvdPiYWotM4scH47cCSCwoJ8eXlFxfnAmlpe8ztPtZFc3YFCWi5aSAApp856yuyg+KokHL0X3CNkG/elFhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P7i/jKX+; arc=fail smtp.client-ip=40.93.196.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P7i/jKX+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKPRNFz1XWibKoYBXQoB0SVQkUNz7yAbcWTa75K/utBVHSLirpYajBpqUoxL7m5OsV9v0JfU8SIRMB25Q0WmU/BXGbt+VXKpsAO2mfV1Yvevo1VMnG/fT9I+gcc24oB56+YatG3L5XWkM9zoYg6a9EEJSiyLKLoSeR52gxb0JOqjI/Txy+CXVjertOwtBd8o4s9NSDLqi89uieNwQmTn5hRoGbvTuoI6pMjqyAygp5Do7WN3ioL3HZLqTIq/p2fCZUuAt2uXdVjXIsLMmDoLmBVTXejESaVkn1MJNjurlW89WP3oBRH+fx7/A7lMbYG1cqbhg2QfhavR9R2fgWJPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRxPI1aauGXkP4m7snSCHJv3ofEFsMaumRUrgw6mfoA=;
 b=YeAxHhYcwgxiHixOWkuLsP7bhBQS8+wtJNvQAuKqDXmtagzfAHsc2UOEf3J+N+ShYL08jxVlgDyIEMTmDGBOGaLoi9hyadVkMz2VnffOhwBtN/5SB8V7xWUJrLe6IA3qXKljZ/PWaS72mB70WdlUmDWua6cc3bMbNP9oO5tDgv8FsSV26dRTItR0OCTPKGJNJUuBx9UIzcT+5kRT6jDDMKQ6E1N2Ei+F09ECLDKYJiwNRvHia08wBUmA9Ej5WO1+38UJGJgTfIni2EHsRikaNKdjyDyDqWJm7YfAVaiJCrpB0A228MG7P50FlTI7ZDkO5uOQlz8wN/GxxkvYgoGcNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRxPI1aauGXkP4m7snSCHJv3ofEFsMaumRUrgw6mfoA=;
 b=P7i/jKX+8hsjeZ0GAsfb3jpl5Shc/F/aCA8z+ttSGA82p34M7rvJXIw7BE8gKAuPLYLHorNOjm7U8U10Wte9nuWs1vAxwRPcN92nlLfxA84TcjVet61JqW3KdL3Lcr/SUbeRdsjqtM+AeggMhLVkTCQrpCcnC+l/HiZ5U73Yrord0Gq3z6kZ8HDxCuCnMPk0SCCaOkNxb5H9AkMd+FkaB1uYq1PfVYcKZiIy9C6nVtHp7Ty20BiQms1+DrDyXukev0FCbllhYFkq1sIQ2qBk/5Isf2oRi9wkF3dNYgbz7rzEtUaBwVzAA57likmK071IvbHw3qVkuWynBKHOwXw/Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 03:38:11 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 03:38:11 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Don't mark devices with pins as IRQ safe
Date: Fri, 06 Feb 2026 12:38:08 +0900
Message-ID: <13293829.O9o76ZdvQC@senjougahara>
In-Reply-To: <aYRzq2n1VU-fTXaO@zenone.zhora.eu>
References:
 <20260202-i2c-dpaux-irqsafe-v1-1-5b1847e8bc97@nvidia.com>
 <aYRzq2n1VU-fTXaO@zenone.zhora.eu>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:405:370::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: de0d7f34-f608-4cd9-3d88-08de65312711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjdZZ1dyV3UvQVFISitNcDVEaW9iU05sUGJzNDZFWnNjWTVsckRuR3d2bjhW?=
 =?utf-8?B?dlp3V1BLenUzQXJ5Mjh3SHFjZVdBVmx1SHRySmYxejlzTHBhVkFIdjE2c0FL?=
 =?utf-8?B?a0NvQU9FQWFYVjQwczBOaS82UWx6SXZlQkZYVGJhUnYrVHluM0FFaVlsaUxB?=
 =?utf-8?B?Z3JybDNNbnJnUFlCKzl2M0tnbmlUS2ZpaWpPSWc3OE4yTUE0WHRtM2pjUE9M?=
 =?utf-8?B?d0NGK0FrVFZZNlIrbTlVbnlEU2w0R2ZGY0t0K3YvUEZHNFhOVU12bitDSndz?=
 =?utf-8?B?NGFhcEV5aC9HY0JSNm1kbDBkTXkyaDBMTE1aWTB4NGxvNVVGV1FXM0E1N2Jn?=
 =?utf-8?B?c28xY0JVTnNIUkg0UzM3YU1vWnNUcmhlV0VLZ3hkaXhtM2tVVlh1ZmVYWUdM?=
 =?utf-8?B?M3J3anB5RUtUcExReHVnVENFS3NpcTB0UEFGRTNWVkpuVmJLWnlPRng4YXd3?=
 =?utf-8?B?OXlZQW1MSUQ4dzVsVDZHTnczZXlwRG1pTXUyUGl2K3NWZ3dhTGROT3NBejF2?=
 =?utf-8?B?Z1BWaDYyWjdXNUhiQlN3dnQzYzFrbFZBYS80Sng1c3JKN0JlZVBZUENZaXMw?=
 =?utf-8?B?UmorMHE1UkNXUFdOd1hrb3d1YjlpVFlieWp0eUlCbHh0UTd1MWlHL0pBOEdF?=
 =?utf-8?B?T1lvT3ZOZmNPUEZKZUhlanRmVHVlZlFrRExsN3pVQlB2OUZLeUF0Zy9iNlZP?=
 =?utf-8?B?Q0d4OVphRU4xY1JuTThhQXVFV2JXdVRGLzh4MjVmWGJZd09mbE9kREFnV0ZF?=
 =?utf-8?B?Qm04TnAzOVhRcTJLY3RYNE5lVlJ0N2JwUXBPRVFaaEkxVjVTRDBsREVQMTAv?=
 =?utf-8?B?VnNzVXJGM3ZuMkc5V0xvVkpXcXExcTBoenNpNFFZWVhDSkt1eWtIeXBlUnBa?=
 =?utf-8?B?REdjMUZRM3ZpRythMysvaDNoSTZSYjZlM01qN0JTM0lrc05GQnBTdUN1Q3ZG?=
 =?utf-8?B?NElpbFRQUnpiWDB3SEJoeEN1eXpNSm45YzBFbUlwRnF1RlhwTFpkZGF5cFBq?=
 =?utf-8?B?ZHJxVXNZak9oWmxaNE8xd1JKS0Fid0UvZVVxbFNDOHlZdUFrRktIenlseWVs?=
 =?utf-8?B?UmN1MUVvcHdUbnA3Yk1wdGl3cWlRaGdCekhRMHpjcWU0MTIyb01xd0JRTmxQ?=
 =?utf-8?B?cGN6NFlDWDZrc1cydHJmMGhMdjdKK3VacUtZK0t6UW9ZUjZKaDA0SEhPV3N3?=
 =?utf-8?B?dkFSc3lwT1lxMVVCaVJOVjlkaGZheGF2N3BOTTROTWQ5aWlJMkJZVzdzMzU0?=
 =?utf-8?B?dlBjc1RQU0lPREhnWHZwbVorRVYrS1U1UHUwa1NnOFBJR05pQ3lkQWZmTEI4?=
 =?utf-8?B?OEZDcFFhWU5ZUWRVWnVIRXJQZnVpTEMvMEJ0Mm5CY2IwVzhFU290L1Nrcmhi?=
 =?utf-8?B?b3hCY0RtT1B5eDJVQnNCUFV4T280eUYvZEMrWEZQZGwyaW95MUhJZWM5RXJ0?=
 =?utf-8?B?dXBhS0dCTXpKZ3NPVEtMQ0tRcEpHV2lneGJjMVJZZ1FLNTFjaDhqQlBHTlhh?=
 =?utf-8?B?czhaaGZlTEs5VlBvbmRpVU1TOUNLdUxWTmVqcnhtc1JrVXlydDFVVTBiNFh6?=
 =?utf-8?B?RTBjNUl3VWk5b090a0psMkJ2eHpEOUh3bzZFQmRNVlZFOFMyUDlUQlhSZ00y?=
 =?utf-8?B?cTRtTUphSXhuQmx4N3cwR2lGa2FTeHh1aUNNU21uVTZXeXQwOEtVaHE1dnI1?=
 =?utf-8?B?bnNHZ2YxSzVQS0lNVFRpaHNwLzZPK1Z1blVRSXFrTnZKZmd3T2J5UTJtVnRl?=
 =?utf-8?B?NHM5M3JBZTg4VmE4Q2tZdjhrUnY4bUUwdjBrTVNQclExWGY2dTdDQ1B5QzZI?=
 =?utf-8?B?RXArZmpwZmF1VHd4ejU5Sm80Ui9qazNEc3p2VkhoaDREV3RndCsrWmkyYVdi?=
 =?utf-8?B?QVlQMTFGTUxocTJUOVBBZ1JhVmdYYlV4S1pYb3RWbTNWbm81T2U4Q3duUHVw?=
 =?utf-8?B?Q1JlMWRwMWlCNXB2YjRhRzFwd2R3NDB2MFl6N0VkWktkOEY1OWVNMXRBN1A2?=
 =?utf-8?B?dlFPSWUxUDlUMkRxNWQ4bkRicW1MQVYxZkh2cVozMkJZdG5XM1JVNjdRQjFs?=
 =?utf-8?B?SmxRZG9ucEhNUXRyNDk0NkttMWQ4eVJudUJRaUZsK2V2Zlh3bWF1Nmp3ZVB1?=
 =?utf-8?Q?TX6I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWRRYUtKSHJyN2RxYzZqbXZYamRaN2lEU1FmZ0RFWWNzWUM5K29HdWJNUjJt?=
 =?utf-8?B?RWJQdWx2R0hWWlZPOStoVE9KMjV0MlhqZWNvb3JLSjNzZDRzNzdMNVZySGti?=
 =?utf-8?B?MW5XTm9oZG81ckNNL2d4WDRQOENoWUNINjdLdk5MaVQzUzFNQitEckk0RitT?=
 =?utf-8?B?ME1qQnlJWjFib0lKV2U2dFVpeEN3TmRsZWdUY1VDTkRpSElrdWsxMEJCR2VO?=
 =?utf-8?B?NzRqM3B3ZHJMaTlUYjNaR3J6akxzcEkzK3dKTWpndFZrNW5rMkpqVGUwblEw?=
 =?utf-8?B?V1drU1ZuWjFGaW9LVFdUUHZ1bHJLVUtpNVpiMElGaU93bEJxVlNRMTE3cThr?=
 =?utf-8?B?RWV4bkFCLzViMDBIMFB4VklrQVFUSGR6ckZkUk9XeHB1NHhWdmdwbmdNSStR?=
 =?utf-8?B?Z01HcmhBVHVzdXdjWXZIN3pBd3ZITktnOXFYeDUwamdtYjM4WDFSTk1MTTRz?=
 =?utf-8?B?bHJwY1IzWDJYTWZZYlR3U2hHc0daWkZ5eHVGYzFtV2tiemZhZ3pFcWhCU1pF?=
 =?utf-8?B?djkxT2wyWXEyc3hVbzF0djk4T0w4Z2RISnVvbHhGTEtGN0NBQUx5dVNib0FM?=
 =?utf-8?B?d1VEWFUxdjl3VWJzN2VKUzVMUGo2cS9KY3p2RWVPRys5K05sdGJRYWlhdjBM?=
 =?utf-8?B?bXhwN0RWTEpBTVB2dDB1Y0NKZ1VPamZGWnkxbFR0Y1Z6dTVHOEFsSkF2NkRJ?=
 =?utf-8?B?NTVjYnYyOVFKNUVuam9tWkQvWDlkVTcvc3BPN1ZpTEFqNm1VSmk2L09uazE5?=
 =?utf-8?B?MUFIWFB6OXJoL2lXME92MFNrdUNFZitpcVoxaHBhUGJQcGlmdklhRW1tNmdW?=
 =?utf-8?B?YnJ2YnkvYXVLTVRUZ0wrcUJIbTl0VHFpcnczWDFMWXR2c0tqYjEwYTMrVml5?=
 =?utf-8?B?YVZjOE9IUDhScXdnSDJJM0o3OWFxR05rd1pVWlJlK3hpdWhUVXhGL2RBVTkv?=
 =?utf-8?B?VW5VVnhxd2tvV3lCcldlcGl1bUF6dmRnbmdaZEdxbG5GQTExWlBSNExwN0Vr?=
 =?utf-8?B?enJnQ2xsdklDN2FjLytqL2twN2N2T2k0OTJkVzIvL3RpNGh2UExrdEcwdlBP?=
 =?utf-8?B?MC9WRlVIcFRacXZqYXdzeGxGcTl2RmZPNkwrY2Q4Y3A0VUpkSzhhQ252YTFa?=
 =?utf-8?B?V2RXUkRGdSs5S2ZjVENwM21Ka056VW9BUUN6QUY0UWdZWU5HR2M4Wlh5Wk1t?=
 =?utf-8?B?RUhwcWRiUS9wbElBNVN0bUtjUGprU0FzTXRxbWlBME4wc1VYK2szRTk4c3dh?=
 =?utf-8?B?dng3VFJRMzhqK2RyOWQ2UjFXQ0dDSUxOSUNKKzY1TnZUZzJhT09WZThLMkhF?=
 =?utf-8?B?eTF5TU9IdGQ0dUFLclFCMmtEYVYrcDFIbVVVcFJHU2FlRENkNXhGSnNhOGJ2?=
 =?utf-8?B?SDhGQWxYMWgwaWpDY09zcGYzeTFWU2d0c3I1Vis0bHhSYlFxNHJaejM3NVlV?=
 =?utf-8?B?T0hxMmZZUElVRUJMZHdsUmJmbkhsb0JDMHBlcWtjUGZZL0ZvSzlXRWw2U2xX?=
 =?utf-8?B?ZXhyKzhDWGZUenFZbDAzVjlqMGp4WEVUMXNjdHg5cXE3Nkp4Z3p4NUtpZTBu?=
 =?utf-8?B?azg1eGZJb3hxUGJ5WGZWWXZQUVZKWWlQMHJJSTRyZDVTSWtnOUM0N2hvelJw?=
 =?utf-8?B?ZElwUnJpU3VYalQrTk5qMUFJV2JzNDZ4L3Z3Q0tWNytGcCs0U01ISWxrT0Iw?=
 =?utf-8?B?UmRyb09MVmV6RWh4NXRFL2xYcFkzL3Fmc0ZnWjRMaERhTUdkbTMrdFJhNWxt?=
 =?utf-8?B?eVA5bVlrQjJiUHJJSXhuOWQ3eHNPWFJFSE1xYmd3eEoxY3dvcVg1WjhDdUhi?=
 =?utf-8?B?Z3JSUzhDU25YMFE0SFVRZTFIVGtiVEhobHFTT29RQm5LTnJPbXkwcWlhUDVa?=
 =?utf-8?B?K3dHc2N6Sm5EWFlEVXkvSXU1bkxpQUFWMUpZdWplUCtCKzVsT1Z3NDJoeEN2?=
 =?utf-8?B?RXdkYmJYaFpXTjlFL1FKZm83Y3hWSzZoaFQ2RXVCVElETEprTVIvR1RGRkNN?=
 =?utf-8?B?eHZwN01hMGZobkJjSURZSVF0Vks3VzFIcEY5ZmNRMkpwL2tDOFcvbDd0MWhJ?=
 =?utf-8?B?UGs4VGhWR2lxOEhtWDVIZy93K2hQb3ZRNGlob3NmTXluT2ZTZWRvaTBUOXBp?=
 =?utf-8?B?VFg1MlNabG1WNVBpME5UbWJwRnZDSEJNVlMrMFY1V0trRmoram1YN1ViQzkv?=
 =?utf-8?B?L3UrOTZCU0pYaTl5ZVFqdDdNWGtDSVhNNDdEU2lZa25OY0daQTBQcHRSVzZU?=
 =?utf-8?B?NGxUNG14V2RLSHNkendHaCtzekpWZFdESDJZbEpHcXBTL2ZaL0Y5MFY3UHJs?=
 =?utf-8?B?ODRQZ0VraFBqOHMzQ3QxMytBRHBDUjExcDY1d2Y2TlBYN2RRMHFvVFVaZldS?=
 =?utf-8?Q?e2mjhVkuc4qm5VEdPV5q5D44UIioqoKhLs2E90CxfyiMT?=
X-MS-Exchange-AntiSpam-MessageData-1: NtnLn/FabNOfbA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0d7f34-f608-4cd9-3d88-08de65312711
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 03:38:11.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zl9aZeUCAtJ/de2mRQiXn/Wotc+OdqYqtXXppubzab5HEUyLaGRYzWopQOsaG7lErwRBrBnbAY32fXD+mQ+fSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771

On Thursday, February 5, 2026 7:47=E2=80=AFPM Andi Shyti wrote:
> Hi Mikko,
>=20
> On Mon, Feb 02, 2026 at 01:42:34PM +0900, Mikko Perttunen wrote:
> > I2C devices with associated pinctrl states (DPAUX I2C controllers)
> > will change pinctrl state during runtime PM. This requires taking
> > a mutex, so these devices cannot be marked as IRQ safe.
> >=20
> > Discovered through lockdep.
>=20
> I removed this sentence...

Sorry about that.

>=20
> > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> ... and merged the patch in i2c/i2c-host-2.
>=20
> Thanks,
> Andi
>=20

Thank you!

Looks like there's a COMPILE_TEST failure so we'll need to do something lik=
e ..

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e11d50750e63..09152088b79f 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1211,7 +1211,7 @@ config I2C_SYNQUACER
=20
 config I2C_TEGRA
 	tristate "NVIDIA Tegra internal I2C controller"
-	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K ||=
 RISCV || SUPERH || SPARC))
+	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K ||=
 RISCV || SUPERH || SPARC) && PINCTRL)
 	# COMPILE_TEST needs architectures with readsX()/writesX() primitives
 	help
 	  If you say yes to this option, support will be included for the
--=20
2.52.0

Please let me know how you'd like to go about it.

Mikko


