Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012006.outbound.protection.outlook.com [40.107.209.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26E18C03F;
	Thu, 18 Sep 2025 01:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758159671; cv=fail; b=s0pz5Ggg8nw7o2i1075rGJsjDuV3kP148U0ThRnA8i2V4+AV6YyJGc1RCrwG8PXc1nzkwCVlK56j+YGItwFh+lbxLSBEXQbIoFBsX+reSgp0yq+9fdRd8PZqRtQxSChcxmo+Yc7jMi56E5noFxkKMs0VGoqV8z7p54FKcQCxoI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758159671; c=relaxed/simple;
	bh=sbFjzGMFPStYkMrwVOi/Edam+JhrvswvztFag129u/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YLBZ9F8lqtTCoILBPss0l1bDhaPYRi3l7Enn+H629ckkqLbNFB/OCJqcGNXFislFnSo/v8ztax45MOJahDxv5UQr+Ac1ZtQYEmu3EvUOnnUeLUmIeb3R0DdjBR+J+cCGNRiAhnQS6ud8DFkbeERc8qXzYc006TgZStwWBiEbjcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k8YjZW+g; arc=fail smtp.client-ip=40.107.209.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k8YjZW+g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHuZds8lsMmNdYpl5Gs3xNVZV4j3X4G9eaG2dgtwIgfk0qNrYc3u3SiCTs2umhdFb6+mIbxeBqGQCfpS4Iu923KvAVqd9Yp/arfZMl/ZNE5IlQhPBDPuoqBwjAuxDHOgKH/rPn2UbVbjDD6BqpQJ1Ysx2h3bEZh8io2jd/fFI9C+69CssPhS6hKliZupnGmt3QtUGILT9G1yjfS7AxBRNl6yJFPx18WbcYfdEiRhMbW85OFSZ+O2hPXe8675AmSk+0vzc5uRzB/Wl/WAXmR75gkmp9gTAAgECnCM4hZc3ISLK7pDlqmgHRNk9P4A5ywVy9Z7HJUv7J8zwLqNpcu1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgcPN/Z3SDFe6wZMGvX4u1wmieBQwJFakBGa2kuBYkY=;
 b=nM4nS4pm+PoTpgePUXIT4wtqzvRBlEWLimTxPuagC9RVJzkA+Uckv/KB1vi5fcLR/ECLEX5B528RN92NENCsB0X5+wCpGEHMBakuHdJjByMlvKEFFMV4iI2bDGIkl2zXLI2wcThGo7y9DO74x0YvPZ/xPV4ck3Jk7cOoDN3pTXv58UklthjruSsh2J46NZFxloBS0Xb/vNPq6qICU53X8BOQZJkl7N5kPwwSIhZYv4c67YvyRIHjwxfKXmDKeKPfk2dDMxkkyzX7mFfGYESbMT7mEamTJCF2NDIgBdLONDjj0GAD3xP6Spcwqds8B93hrKZafqQWX+aQl2kG73bMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgcPN/Z3SDFe6wZMGvX4u1wmieBQwJFakBGa2kuBYkY=;
 b=k8YjZW+gBEO+FgAoessd2qHbRKyPeukpFM+D80VkuLJSi+UEddyR7YYUmmucbOW+7yy2CTio7cskd1x5rLQIhv4c0bSEN9H8vSE9o3xzzfPVSBFfIqPRKsZRRKqHa8Bw+ehye0rKY/df0BLwgQ7XarPdptymAxGedb9yN9O0bRgCy4/8TvMzabGkMEUtm7mxaEnKT7zWGFsBsX3F6a3n5BrRjilIHWPrsQeYTZL9vBzNmaaisM8vepScotDJsfb7cCSFD1NSbAIGNo7MFRTaAGnX9zXm5r66XKyclW3ult4Ds/OZDSl3+th803t5OLFE/7tnE7TBCYJcvzRy5IJ7rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SJ2PR12MB7894.namprd12.prod.outlook.com (2603:10b6:a03:4c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 01:41:04 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Thu, 18 Sep 2025
 01:41:04 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v5 0/4] ARM: tegra: complete Tegra 4 and Tegra K1 device trees
Date: Thu, 18 Sep 2025 10:41:01 +0900
Message-ID: <2402855.tdWV9SEqCh@senjougahara>
In-Reply-To: <20250827113734.52162-1-clamor95@gmail.com>
References: <20250827113734.52162-1-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:3::13) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SJ2PR12MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb5b31d-c875-461f-c747-08ddf6546e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEhNc3lKM1BEbUQvcitGYUg3MmZPcGpFNlFNVmQ0Mi9aOG53SkRtVkxOWkNk?=
 =?utf-8?B?Tk56eU4rcDA1T3k5Y2RrZTB4M2YvWGhmSDJuallqSlRETFB5Q1BneGZsblhU?=
 =?utf-8?B?UHRaWmNYc0o4OXRGbFRMRmxUbzlFUEMrNVA0K2hnNkpMbTEzbml6RnhzWWQ4?=
 =?utf-8?B?eDRMcERpVXdWTXRVRDlrbllzcTRzaWwxaUdyRUkzSWVFZXYzSzljYVJMUTJN?=
 =?utf-8?B?SW1EREZ6NUx6eXlsMlhyRnQrbHBldGxVeHYyblN3cm1vRmRJWE9tOWpvNEUr?=
 =?utf-8?B?eVhpMEJhb05ubGxjZkV5UFkvRTdsZ0c1UDZ2WjMxaHFJL1NDOWtzWVV6dWNn?=
 =?utf-8?B?YUFPbkdYK2FYVWRMeGRyY2NtQTliRHREcHRDdnFkWW1GcnhCOEJHUzdNRjFu?=
 =?utf-8?B?ZFdla003UVZNci8wMysxTzhsMlJuOEsrYzdFVFBHVjhwL2xjeTFMZ2dsN3VK?=
 =?utf-8?B?Qk5Ma2JFNCt5eDFBSHp4K1pUVVZXaFZNbTdoOEZ5QmxUalRtOUIwdEc1UHcw?=
 =?utf-8?B?UUx3WWlVSUhzdEF3Q0Nsblh2VFhZSi9EalpIR0pqTCtqN3RsZlR2eU1GL0sr?=
 =?utf-8?B?dUFzSFFJQ0cyRUhmMm9qRUEvb0ZvYjBaZGdDWUhVejhIN2YrS2t1TU1JaXpi?=
 =?utf-8?B?OXh2K3NCMXNpMStEVzg0UVg3bGZUSUhjRFhQb09BcVVQVUZoZHNqSFZoeWFp?=
 =?utf-8?B?MXMraWlaRVVpaUpkTlZpdFo3MmtVeWo5aHR4Ukk0WmZEc3A0SktnTnMyMWNK?=
 =?utf-8?B?M29KV2lwRWE5RjZZb0c3TExUYkRDV1FyVUZhTnNIclNPOFVmajB3b29LdnFR?=
 =?utf-8?B?Y2xxOUJHODR5a1duUjIzMXU5ZUhRUkZCVVQxdG5DbmdsVENDazVwRGtHSTVp?=
 =?utf-8?B?dEhSQjJ6Z05GMlhBc3hJVGpCc3IxSFhXRTVHMmNIRXVFa0dVdUxzZmVsY3dm?=
 =?utf-8?B?b3NJOG5YRHpYdjRFVlFvQmVVbzZKQmZJYWltZmZpbTB3aW1GTmNzNUlwSTdH?=
 =?utf-8?B?aWlzVTErMGxDQ1ZIWDFMOFB5bnBONWhxQm9TUlYzZkZJSWtONVZNOUUyd092?=
 =?utf-8?B?d3lTbUlEeXVYcVpyeEVicjBXSmNBcFNvbTNPa1g0ckxORWVXWDFvRTJOUHJO?=
 =?utf-8?B?c2pBQWl2Sk5scHU3S0VwQ3VpazRrdFRHdkp3d285NjBteFhqVHNDRmNPVTc2?=
 =?utf-8?B?OU5oaUdWbWRkT09CYmFQSTNaQU9MejlFYjl4RXM2bml1VEZYa1dMYUVvZG9T?=
 =?utf-8?B?clNEL3JLUGxiMCtLQ2RvWDlkMnBJbERjSFlobHBTVStDNlQyZitPYW95cVBn?=
 =?utf-8?B?RmJadWM2LysxS2laZzhmaXNIRUNJUVppNUJYeDZPbHZ0NHJuUVhtNjZ5cFIy?=
 =?utf-8?B?eVdlN2paUVdudlRsaWRRL0daUjFGYURNZjRqNGI0VTVQNlZZRFczUGgxSmFy?=
 =?utf-8?B?ZkdQWGIxVjB0ZzI1SEd3YWZwS0ZMTlVlajE2a3pJKzQ0eVZ6aGh5d045V1dv?=
 =?utf-8?B?RmJsRnNZWmltR0tTamRwZ0pyM3lvT3ZtdENpcUxkbGNMcmVvcjB5QktCV1Ew?=
 =?utf-8?B?dytJRm9wTFR4Vmh6bVNjZkNvaTJiT0pTOUhNSnZPVDZNQTFURTBJcVJCWVhT?=
 =?utf-8?B?MjFOdW9xMjY4ZWVHb2Fuc01Nc1VISm5ZUG5UR2ZCZWZISlRRV3pxTW1mSjhX?=
 =?utf-8?B?N1FZZTdoK1BEODE0ZTVpL01TM2tmWWVCWk9rMjcxcVlPZkZlSHBHK3V3Rm9p?=
 =?utf-8?B?QmlvQTFxVi9sZ3llQnF1N1J0STNFdGZqM0VFRVpSWVo2RkZTQmN3cXk3YlZO?=
 =?utf-8?B?YlVsZEg3U2xPdjRNKzFUYlhJOENVNzhKQ0FmMmxwbEpIR1cwTHgvdHB2VytJ?=
 =?utf-8?B?UGg3QWN6S0tiY0FlZm9rVUxTWXlCNEpMeGVFMDg2ajlRTjNsYjBNbkJ1aWIz?=
 =?utf-8?Q?VyuQNI3XISc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2QvcnlVaDdsbVlnU1lGZjVlenRuUjR3a1IwdGZ5cWlHOGo0SGxlL25ZR3BK?=
 =?utf-8?B?OUszREJwSEtDUXR0RDFxcUJvRmZBQUpBOUphdE13K1NoWk1qVElRZG1JeW1O?=
 =?utf-8?B?OWtEWVY4WkpCV3ZHdEwzKzFlb0VPeHdMZ3BjQTU0S3RzME1nMW5hckRQYlNT?=
 =?utf-8?B?WjI4WXg2OXFWKzcrS0lLNHFnTWNnQW5OaDRWR2NzNFhJVjI3aS9hNER3cW5O?=
 =?utf-8?B?b28rUFJ5RGw2aVpZZ216TkFpT2lVTXh4Q25vTnIzNkx0dTJFLzVwdVhyV1pM?=
 =?utf-8?B?ZnRzamN6NytrbWwrNW5JV0FoWllFQmVFOFhBWUo5cXhQZUVDYU5zdTl6R1hU?=
 =?utf-8?B?YUt4b3VreUlrQnRQMkluNHlYbW9JNXBycEl2bG44MXhnNW1FV0tRbkFNYW5N?=
 =?utf-8?B?QXU2SXZhKzN2NUlPblRoc2l4NEVLMjFjcVpuYW41RlNJTUErZEViSTQwREFz?=
 =?utf-8?B?cVdUaVZtTDc0OHNBK2ZiSXNsMXdteTN2SEl4dnNIY3J5THRzR2s5TUJDSXR3?=
 =?utf-8?B?clM1SUlOaHVKTUE2VDFtQUs5YWRGNW5SZUkzSW5XVkFwSGxCR3hkZGxlZVVD?=
 =?utf-8?B?NUhNNnhnM0I2VTRJYmRUb2U2TVRLcGVmbVJDdWRnR0lhRjBBTkJ3VEwvQ25W?=
 =?utf-8?B?OXZPNDB6NGhiNEZBZEdhSU1vNjcwa2g5eDRId3d2Q1ZCSEtyeSt3TEhrbGhG?=
 =?utf-8?B?QklQL1ZXd2l5Rmg5SFBEajVSUGdkSTAvbnRxc0t2a1Rqc2sySlc2TmhIQjlR?=
 =?utf-8?B?WkltOVlFOHFhdjVKVmRZRkxiQkxzRzB5Z21zQXU5SjlKOGhVN1ZGK1AyVXYz?=
 =?utf-8?B?K0pqWnJlMGRsVGk1YUxDSGZWNjU0Nk5JdVozNDliaWU4VHJZSUNqSm9iTEI5?=
 =?utf-8?B?bzBic1M3MVltQ1hwdlNSVkVNRjdMR250Rk5DT0FHSkNmZGRwUTVLVGtSbFV2?=
 =?utf-8?B?WEUzQUhnWGxTdkxxaW9LRDhGamhDU0U1ckhUZ0s3MFQvNE5kT3BkT1ZqdTBl?=
 =?utf-8?B?QXFiRVJVVEExbXRkSHplUjhpY2xPRzd0QnkvWlpOMjh2OGNueHJRM08rN082?=
 =?utf-8?B?MUl0VytsaW9UbjVHSzZHcmJmN3gwYm1VZVRpWVNkazcvOGljc0lxb0hwQ1pU?=
 =?utf-8?B?akR0QW9OTFcySzJFdExvazdpNmpBNDJCVTdXZ2hOT3hnTDJtV3BFM0pJanFW?=
 =?utf-8?B?d1I1c3ovWSs3YmtESUlwTWgrZmp3cmFQMVZoQm1vTGVDYktmdml6dzBiSG1s?=
 =?utf-8?B?V3lPM0k5WG9ZbFRjd2hWN2QyUGRYckZQRWRVRStVeGpIZDBHb0g0WWVoZndY?=
 =?utf-8?B?a2kwTExJckE0Qzh5S2NwWDhtRnZNQlE4amhST1AxcDdQQnVETlpxTm9LWFFq?=
 =?utf-8?B?emhUMjc3T2JLc1VwbmhwZ3c1eThxbHpxY013cW9Kbzhxdk12YXpnaUJHVHBh?=
 =?utf-8?B?K1NRS2xHcEk4SWU5NklsWEduY0FibklFaTlyRUxzRkV0dXQ1dU52NTB1STg0?=
 =?utf-8?B?YXVPNGFtQzM0MUYxOHFtWjhuUG82WE8veXI3WnQ3TGJSNDVycndLcUJKVmpR?=
 =?utf-8?B?OEVjS0JnZllobnA3cjZtSHpMYVdFZExUbktZQU1aMDdEa29SZmZZY1M3MHRS?=
 =?utf-8?B?VjcrTHZ3RFM0UjdGNUUxQTNhYy9Ub1hDM0FoemtHMVoxNVZNSWEwZ2thL1I1?=
 =?utf-8?B?U3IvTVovdWJvRCtHbmZnMHhFVW53dUh5Y0hKV2tBdnZPOGlJRzdBVW9rUzRh?=
 =?utf-8?B?QnNVQklrVnA0VUFVSHljZGZaeDd4cGtnUVhubVoxdUFYdGcrNUJZSVFvdmNC?=
 =?utf-8?B?QVA0cWpqVjdtNTBhZnF5YmR2M1U2ZEp3WFQ5bHhnbEFHTXJqTDV2MUZ5eXAz?=
 =?utf-8?B?M0RXOHdPMnpwcE1zTm9kNkZ4OWFvak1ZNk5yTVZPSVZtZVBlc1BOS3BjQnh1?=
 =?utf-8?B?dTl6M1dYbWw3UHVzVkZyYjdwMUFWb2IrYVQxYjM1NGcvVndweFpCajE3cG8v?=
 =?utf-8?B?VFNXazhYVFpQbi9SR1lqYWxWWUZyWHVTU0YzaWRxbE42dW1ySFNsZzA3R0tq?=
 =?utf-8?B?RG82TnBmOS9ic0FpK3RIdVhZUGRYcDJNVG5KU2VoTllGa20yYzRBMmFzNldX?=
 =?utf-8?B?emMyN2xKRTNzUWFxaUEwOWpTTC9pL2RGUCtadDdUYjFsTW9Zb1dMTTV2VDc4?=
 =?utf-8?B?S3BnMGZzWjJrbk5wdjF5Z1ZwenZRYnVLbnVoc3Q0amVCajVZMnhWejdTR1JE?=
 =?utf-8?B?U2J3OEpiOEQ4Wm5kNE1FZXRWMWZnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb5b31d-c875-461f-c747-08ddf6546e46
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 01:41:04.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LBa7Tpik9WFuWhHB5UF44k1tk2JmfbHj5g90eoXWgtY7iONBUlrgB1KqRknMhz8mMlZGqgLt1l4XveYrgA+6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7894

On Wednesday, August 27, 2025 8:37=E2=80=AFPM Svyatoslav Ryhel wrote:
> Complete T114 and T124 device trees.
>=20
> ---
> Changes in v5:
> - dropped clock and reset names from TSEC schema
> - removed clock and reset names from device nodes
>=20
> Changes in v4:
> - configured tsec schema to cover Tegra210 TSEC as well
> - added required to tsec schema
> - reset-names preserved for consistency with other host1x devices and ali=
gn with T210
> - added clock-names to align with T210
> - operating-points-v2 check https://lore.kernel.org/lkml/20230119131033.1=
17324-1-krzysztof.kozlowski@linaro.org/
>=20
> Changes in v3:
> - added tsec description
> - swapped compatible back to use enum
> - clock and reset description dropped, added maxItems: 1
> - reset-names preserved for consistency with other host1x devices
> - dropped interconnects and interconnect-names
> - dropped isp nodename
> - dropped multiple rest names for mpe/msenc
> - dropped tegra114 msenc example
> - fixed reset name in second isp in t124 dtsi
>=20
> Changes in v2:
> - dropped accepted commits
> - added EPP, MPE and ISP compatibility for T114 and T124
> - added TSEC schema
> ---
>=20
> Svyatoslav Ryhel (4):
>   dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for
>     Tegra114+
>   ARM: tegra114: add missing HOST1X device nodes
>   ARM: tegra124: add missing HOST1X device nodes
>   arm64: tegra210: drop redundant clock and reset names from TSEC node
>=20
>  .../display/tegra/nvidia,tegra114-tsec.yaml   | 68 +++++++++++++++++++
>  .../display/tegra/nvidia,tegra20-epp.yaml     | 14 ++--
>  .../display/tegra/nvidia,tegra20-isp.yaml     | 15 ++--
>  .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
>  arch/arm/boot/dts/nvidia/tegra114.dtsi        | 64 +++++++++++++++++
>  arch/arm/boot/dts/nvidia/tegra124.dtsi        | 64 +++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  2 -
>  7 files changed, 230 insertions(+), 15 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra114-tsec.yaml
>=20
>=20

Series,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



