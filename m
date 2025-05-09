Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E6F21CC5F
	for <linux-tegra@vger.kernel.org>; Fri,  9 May 2025 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825972; cv=fail; b=Gcr0NilFl1NQsmUjng7H+9x8dOaGufkCu3rreMfRSgXohlG7azi/6LtGGdc9xYrAHx9k+7jEJqczRubrSRf05ypIaxi9hDVctRi+Wh6QlPUEo+Q1lxXs7N5YaCetJphSlctgzN23zOnOMmu2yseK9qINIJRhfaMYlBwHMWztdEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825972; c=relaxed/simple;
	bh=1w0dab0ORvJSQ/Rku5oqozkSQwnMTwkBzascnG+Lrtk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GlBGNnU6pO2M35IdNVvT/DRCzc4OX/w8o65kLc3rg9Q7IbuaPr2qSdNqVD7R+rr5lrf4GMPp+dcW/e/1RTPMV8Vi8i6Oa/zj/Pb6wihvreYbd3+hqU++D7F10U0TYzr/CMxtfLf6/RJa31rIaTM+MkM/MsUCBwXeFqFdiF4IToE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hhkm3eHH; arc=fail smtp.client-ip=40.107.93.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hhkm3eHH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=El26nQGgxauXGkLD49aoYeanNP7TQTiMKTdLJ5bzrGvLt16Zi9DJN7Xv7LbJMcH3+IWHlJLsNzERKi7R2ZO2HnB981eQ1IzlM/v+bQqZH58L4YCxTfRMGL69EQx7iAl99fM77j0LmSEQLO5F+5G6sxh/mVUFdJCCvzECNPV7qVnYo3h+dNNnrk6BKa72fZIjLf6Q3HFG8SOtb+/2Bu5HtmVImB0YAnPqeHLvVV+sDajwUOF+IDDkZtruMyNCDu4tOB/mqvUmT5wyZ3rq1Tgr6aSOMrpmCCUmUwkFERtFBS1kw+RJ/MUaT9d2qHM+FUqIxCvUJD299/N0Fjm97e/U7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfbnN941euvj1gw4NlCDTXZp16dN883gduoTTMftANk=;
 b=tVOS0hlWfC90yn1dW8sM7W2XPfAka/u1EzPySb/kQzh0oXPE+VYwAIsggs8Ve9yHRo0gwMECSsBByRbuXwJm3oNwVudG31zglWOwHgK5lqxCKKcQ9oMhhx9cjkt7zPEet5ZEVPXY8HPfq95bcu3q2jGHK+WKnuvWHBXAKe3I+YDNkjfhtEXdYlIWBI5THNolc2ocY2FdCm7I6enZaxDyKZFyhylIcCbT40eT3THTSs1ueP12afXyNTrd2eQAKp86qmZJ59DqQaMT4k9hy0hSXglSpPHIajuvpQgB/GsGMBhiqs9VgSpKP/deW07etH5uNgl4aH9SvuLaf6NG+SHcNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfbnN941euvj1gw4NlCDTXZp16dN883gduoTTMftANk=;
 b=Hhkm3eHH0oMgyT0d1NHTkilYFVVa32E8gbmM3JwODuVIeUlUQkFbJBe1Uvww5YbTyTipC1sm04bBfHK1A63gnfUJkX5yySjz6K21aLrkkS5W12tNB4IVqghMd/yVdSZKqiUIWv5LkTwBFjrBFH8PPa93msuZedj/ou6+BfVYLDjjSxwkzrZHlt13EQyakTB2GI8fsSlRdkzx40oGgV/3Bx1nK6SsiMzU19WdN1P8ny1RH+ljQIV0+GGnm3A6enU/q99jiRy7evqhrDyr9gLFcVEBP32Z8LBjSATFvW26fFvZnOiqsTeON7v0exLajO4lbG1pksNjLEn3ZscBGwziiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) by
 SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 21:26:07 +0000
Received: from DS0PR12MB8317.namprd12.prod.outlook.com
 ([fe80::8ca4:5dd7:f617:f15c]) by DS0PR12MB8317.namprd12.prod.outlook.com
 ([fe80::8ca4:5dd7:f617:f15c%4]) with mapi id 15.20.8722.018; Fri, 9 May 2025
 21:26:07 +0000
From: Thierry Reding <treding@nvidia.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] Device tree bindings updates for v6.16-rc1
Date: Fri,  9 May 2025 23:26:00 +0200
Message-ID: <20250509212604.2849901-1-treding@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DS0PR12MB8317.namprd12.prod.outlook.com
 (2603:10b6:8:f4::10)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8317:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: f22e99b0-1fbd-43a5-8054-08dd8f401c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ME5IeXBtNDZudFQrbUNvV1RBMHM5ZTBMOUdYRUtkTzZ1OVR3bWFCUWdrNjZR?=
 =?utf-8?B?ZkxnVWlVbTB2ZjRQaGpLcEd3TkZzNUdFazJRb2d2YlAzRTM2b1RqNlVBdWdU?=
 =?utf-8?B?RExUNWFJQ2s1bndlMzZYN1ZXZTNVem9FTjZDdnFtT05hUFlhcVlhalVYcXJX?=
 =?utf-8?B?VnJDdURhdHdlMUtLcWFIdGYrUSsvaGczWS9aUVhHQU9zVG5mellUdWhqQ2cz?=
 =?utf-8?B?Y0ZrZC80NlNiL3lsNno3ZXRFcklnejB0SFQvWEdLTy9VOEN6OTlZTlpZVW1S?=
 =?utf-8?B?cS83UUhTdmhHTGVvM0hKWktYUktjSFdaUVI5eG92N3A0OTVJVlVrdkdMdzQ5?=
 =?utf-8?B?MHZqWDJtWHdlKzYxV1EvUmRZcHJ0dnVpVFN2ME51bkMvbFEvN09VRmc2TG5o?=
 =?utf-8?B?Q2tadkxYYXQ0aWxvVTBKSzdOcEVIbUxXS3lBVTZSbmo5NE0wTmpWN3RKOGVp?=
 =?utf-8?B?VnhjcTh3ZWh0QWVQK09zYXE2QWcvc1BvY3pSenNJZ2lWZDZJa1h4cnBncTMr?=
 =?utf-8?B?YmdFb1A5LzNwbGlEVkRxTTVBMlJ4VDVCY0JMR1JZZjB2dGNYK0Zqd0JOTlBE?=
 =?utf-8?B?Qjl6dzNQeE55MnQ0STFKUHhxOEpvNC9UM2pXMWo1eFdBM3F6UGxHZ1IrWnFj?=
 =?utf-8?B?UDRyd2FCWWVRYjVvaDY2Rmcxbk9HdkhqclFERDU3Z0F0aXRQMUc2cXlQTzhD?=
 =?utf-8?B?QjB0VXNKdTB4NWdJQ28vUGszWDBiWS9iQm9ZNm1EZnhKK20wMENSRDYxdVdu?=
 =?utf-8?B?VWt6bkN3RXhvck9EN3QzQkhobkpTa2pmbGZCTmJjcmpaVVYxemlXL3RPbzlF?=
 =?utf-8?B?czlZVGpvbklZcVNuNmpyWnRmS05zVGx3RUl1WUJEK1ZEWm5vdnAvL0syT1NI?=
 =?utf-8?B?aTBPMFpMSmlBbnNoWXBPSnVXWkVGMWw1YS9KWGlLUm5rNmZIK0NiUFloZGho?=
 =?utf-8?B?Y252bEN1M2djVk5KaktZWEd6OHdiMjA3UjdsWFF2aFB5Mzd6QUF6OGlXRGtV?=
 =?utf-8?B?WlNXV0VmVWpBWnJvVzVRTFV1TFpoQUpCcThqNTdBTXNQUVpSMUdVbzQxb3VF?=
 =?utf-8?B?bjJoRmNjZ3piRFZPdlVQTERtZkovdTBQRklsR2J6eE5aSUlaMFJkRFRxQklZ?=
 =?utf-8?B?U1M4SGZabnJkN0tHTjN0dmF6WWtIRkk1RXFmN3lvazVnVDh4TU16ZERqKzJ0?=
 =?utf-8?B?TXR1b0JGMlVPdEU5MzZMQWZGUWo0UEdhUVp6d2dsQjNRTFQzV3ZLQkZNckFw?=
 =?utf-8?B?aFpPc3hVSlZqRHQvYkdxZlNRdm9BRlJXRDdCWEswTkJKVGt4NkdCemZSc3Zh?=
 =?utf-8?B?OS9TV2JYeGxoMnIxR2loV2FsZ01WVGw4OGg2UHVNYjZBKzBWMzBxaFRTR2ht?=
 =?utf-8?B?YllVbDBLdkVvbXg0UWhjNnhSdGo5RlZGdFhVbE5rWHBOTGZQRktQSEFESXBX?=
 =?utf-8?B?TmRZeHlMZEdyKzNVcTBqZTFYeDZvdXRvRzRLQ0UzcDlqTjIrZzBJZmJiM0k5?=
 =?utf-8?B?b3pXU3ZDSkdRYThEU0twbjhPNFE5Ukt5dFFLSVdPL1I3b0EyakVpSmJIZlVW?=
 =?utf-8?B?aU5XcGlSNUdrU01Oam1TLzBTdHFlQUhkT3crQXE4N0JPZ1NxbGRQU3RIVERB?=
 =?utf-8?B?Tm01aGp4a1F3M2JMUjcyVVJyVHJCZ2l3eHYyZXpNYlBZcWhPNzJyNy9rNjgx?=
 =?utf-8?B?d0w5aGNPSURUT0dvaTJXeVdyY0w0OFQvNmZ3b3RLZWlMUXUxaGhFZzlOMTNW?=
 =?utf-8?B?M1J2ZXZFRktiZW9id0RVcEtDbXl2T2l3Vm1PVnJOcHV0ejNiUitYL0NpZ3FK?=
 =?utf-8?B?SC80cXBJemVEK3J5ekJvTk1iS3lKV2ZnTnVGRmdtVVVCTFJlVHBDd1MwUXhX?=
 =?utf-8?B?Rkc5NDFnWm1hUnpVMEFJd3BtTFhTY3o0V2dXT1YyS0k5NUxsQ04zY2VkNUQw?=
 =?utf-8?Q?fBWZ9wWrqhk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8317.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2hBcUN4N0dtVzRFZksvY1ltT3ZyY00ycEZVT2RUR3ZuOG5vS1dSeDk2WXhs?=
 =?utf-8?B?a1JUcjVIYmVlb1VKWG4xUkFLOEowbHZIYkRhSStibkpvS3NyMGdFRWNNYm80?=
 =?utf-8?B?UHJvbVpnU3JhQzgvZ3puZXZ5Ym83eVR6SXlidXIrYXBySlU2dFgyUzMwQStp?=
 =?utf-8?B?K2VWYklVcVRFbTF5YVBQNTRFZUc3T3JUaDUxYTExTE1oT3QzZXNTU3pvdXkw?=
 =?utf-8?B?T2ZXRzVIWFc3SUltc1UrRVdWN25ldWNVaC9KM3U0YzhncTdZMHNKbHpodW9L?=
 =?utf-8?B?UGNucGgvMVdtSUNBUkVyTmFsZ0pVTzB1K2RFYXZ4RmIybUw3YVQvRndtc0NX?=
 =?utf-8?B?MjVNdnY1Z2FsN3F2UTE4SXErMVlheEI2blJYVkVKdjlOZWtyckw5dzZUSXQ1?=
 =?utf-8?B?TkZIOEpSZCs4MkFUckR1UVZCZFd0RWc1NUhaVTRwR1dJVTZWb3FsYzBtMis1?=
 =?utf-8?B?ZCtCamhVUjk5OGtnSXRhTEQrUkNSWHg2Z1Nha3FPdmhGc056YjJpNTZUcjhu?=
 =?utf-8?B?OVJUL2ZEN3l2dEhuTlA4WXhRWTZQeENOazVySWM5Z1hQNExSUi96aVlFK1RG?=
 =?utf-8?B?YVZ4L0V3NHZwQkNJZnV2MFVYbmtjN1B0OVRmUlQyTDk1eWdnME56R0lrcjZz?=
 =?utf-8?B?QUhSNWp2Unh6cGxTcUtPdThYdGViZjhxaTRSSmN2Z3YwTDU4WlJiSjdLVnFD?=
 =?utf-8?B?YUJlRGxqcW11U2hWU1ZmMXFwVUlkVEJRZXkyS1dYQlM1d1B1dE8yaFRJenBB?=
 =?utf-8?B?OEVCWUJLT21JbndUaGU2LytHN0czT0hyZThHVzUxMEdYdjZ3dEhuWDhrcFlj?=
 =?utf-8?B?N3o0d1JXZ0JKeTUxNzBrS3E2dHU2cFhaclJZRTI2VTlacndjU2MrcnREYUFL?=
 =?utf-8?B?c2dxbjZSTFl2T3pmYjhxNU1aMHE1Q3B6WXV0VHRtSmRaS1NVcmJzRmhHU1hk?=
 =?utf-8?B?UFE5RnlZc2g3YVVuZVQvcXFsZlk3YkpFTUFmUGU3bmVTdmFzSFEvRUZYMWU3?=
 =?utf-8?B?L0VuOWV0YmhNMkI3ZWRCdUZyOEh3em1tNVQ2SWplTjlJdTRXam5UcGJaTEpZ?=
 =?utf-8?B?TGwrak14ZitObUl6Z3ZSQnBCbmNhZTR0MWdDcjh4UHNvUUtoOW5sVHg0R2VH?=
 =?utf-8?B?eElWMGNpbmRTWHZnemkvcFJqd2M2SmVpMlFaZU1JNGUzdis4WUV6WVN4MVY5?=
 =?utf-8?B?K0F4TGJrVmVYY0hxMnlueUhlMDErSk5IQzA1ZTVwS3gzazU4UFdXc0hHUUg5?=
 =?utf-8?B?U2NkN3JHTklyRFhVbitONzUwRDRrMCtuMEhOek5VTVFpUDFjdzF2RXRJaS8r?=
 =?utf-8?B?QXZ4NTVuSzR5OTVpUCtrUzMrSGc5TWJWWGdKNWl0WjVnUFRhaTZuRHRHYzZp?=
 =?utf-8?B?MFlnNWFrVUpCL3g5QWZiTDltQWFkdG1TRUw0K3E0ZUhJSDh4M0NYTC84S1pl?=
 =?utf-8?B?Qm9ZOTVrN3BMMUY1bWJvdS9QQXZWTUwrM0xEV3VKTURYczkxT0lqWlFiL3lz?=
 =?utf-8?B?bEN1RXhveUNQdHY0SzFDdXd1Ukgyc09nNWNEMTVvaHpKV2M0RlIrSFdzUGZw?=
 =?utf-8?B?ZUd4TmhkTW9RVUF0SW5WYllleWw5MnFudnRxejNuUEhTWGdlSFF3WVQ3SS9I?=
 =?utf-8?B?S2NZNDR6N1Vyb1dmZkd4YXRpb0JEQVM0dFdsVU9Vc0ExeVZJcGsxVGttYnJn?=
 =?utf-8?B?TnU5TitLdUdCYjc3eEJWMVFOQWdTSHlud2pHSHY1U252T1YvN3h4Ky9CYlg2?=
 =?utf-8?B?MXFZMEZqMjliMGM3NlV2UkU2L1FIVUJpQi9oQUE5QXpJdUJxUE9NdGIwYkJR?=
 =?utf-8?B?MjhPVGtjVXdFQWpQTGJpOTFuR1pzV3dGRENCYU5ZSjRmTXpGZDVRaDVNVmpp?=
 =?utf-8?B?dXpiRGhWVTJXSVNPVEdSenNmQlg5NzIvWlBnczZvVG0rWi81RFkycHRJUlRq?=
 =?utf-8?B?ak1OeHhVZGxxSnUrU2pvVU9HVjhTZjIvZkd5ZVA2Z1pXSmhWOXVQQzFCdk1w?=
 =?utf-8?B?WEN2ejBQSzZ4UDNVVDJCSTRndG5vb3hnY1JpNGpxanBEaVdOSTJLYUh5V0kv?=
 =?utf-8?B?Q0N0ME12MzVyTWFjM3k0dHJFQWlMcm5vcUZqY1dMdXFRa1FDSGlERWpxM1d3?=
 =?utf-8?B?RExvcmFZOFlkaGE5MENCdEpqYVZRVEF0SjJuNlMxQ1JUNXNpbWFNSnVBeEhR?=
 =?utf-8?Q?cB/Etn4VVgsHWWEYlCFaeWdaTuWl/uik9/UNn/UmVeNm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22e99b0-1fbd-43a5-8054-08dd8f401c95
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8317.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 21:26:07.7860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvmI9CVsbNKO7yUNbOr+WXjfLVDRyB1D898S7UlRmHvQAmHP+SR2f5ibQOi380cNoqk9Dk/ytuUxrG7YCqWPTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.16-dt-bindings

for you to fetch changes up to 0d4d6e699a4acff8d15f83185d269ab59c02107a:

  media: dt-bindings: Document Tegra186 and Tegra194 cec (2025-05-08 23:57:54 +0200)

Thanks,
Thierry

----------------------------------------------------------------
Device tree bindings updates for v6.16-rc1

Convert the legacy interrupt controller (LIC) and APBDMA controller
device tree bindings from freeform text to dt-schema.

Document the ASUS Transformer Pad TF300TL compatible string and add
missing compatible strings for newer generations of the Tegra CEC.

----------------------------------------------------------------
Aaron Kling (1):
      media: dt-bindings: Document Tegra186 and Tegra194 cec

Charan Pedumuru (1):
      dt-bindings: dma: nvidia,tegra20-apbdma: convert text based binding to json schema

Rob Herring (Arm) (1):
      dt-bindings: interrupt-controller: Convert nvidia,tegra20-ictlr to DT schema

Svyatoslav Ryhel (2):
      dt-bindings: arm: tegra: Group Tegra30 based ASUS Transformers
      dt-bindings: arm: tegra: Add Asus Transformer Pad TF300TL

 Documentation/devicetree/bindings/arm/tegra.yaml   | 19 ++---
 .../bindings/dma/nvidia,tegra20-apbdma.txt         | 44 -----------
 .../bindings/dma/nvidia,tegra20-apbdma.yaml        | 90 ++++++++++++++++++++++
 .../interrupt-controller/nvidia,tegra20-ictlr.txt  | 41 ----------
 .../interrupt-controller/nvidia,tegra20-ictlr.yaml | 82 ++++++++++++++++++++
 .../bindings/media/cec/nvidia,tegra114-cec.yaml    | 14 +++-
 6 files changed, 190 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.yaml
