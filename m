Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793688909;
	b=h9RjQwQQ8El+OzRPc/6uUYrr6hNRZIBsFABkHgxsA4Stawb+ji4zYmtxOHCJ7f1+mZkr
	 Q3BNPEuk7b8Ml2YiwELhR0SgjUuFYzzauKJJewLMiTZzECfQFa018gDy6PtEvP7X52xGd
	 c6JQupTZKLIidLeSflmGfmwW5pOV1gftKu7yReBncoHjgedLKbt0geVATgW62WtBBMfKp
	 mOZr+vnWQ+OQ5ISDVosGmqJsJSgtxJNpTWTxMlLjGX1MPyasA+2prmLCeOH8zRJ7troIL
	 IVgzFL0C3WdoFz/YHXfvCmiSXBEMCHm0tjnic16viEKbcWNzm3wUQEKMRdxC6hF2/PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688909;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Pr93mp+82LWF/v0eXGsgnrotsjXf0udIMS1fYK4OmWI=;
	b=0GjGsYai6snKb1hBdTrKAaGbO7J3ncQxWWo26Tmz84X13yj4bRg2h51eisFShLX7P1y+
	 +H2Y3WN4DREJB2F2Znqd4NSSxd32vDWRkvsHdhCf1mFMShn4wRXBI51d6XK4G4l2rheZS
	 xTsgLm8fRf0lryRbdcEruTQ/fnlL8Hjk9d9qZpNfJSOYmWUOVUdALA1RO7irrBe8517kP
	 6Dl9lgdR07TfXhwpgvqRVX0gYtpV84pWG+XEP7GPe614VqiZWi5GZL6lrzCr6RA133WOw
	 rACmjJ2jMBWCL7xn93n98f2zHtAReO2H49vYTMCSj3pbLx/ZJi6wu7IuM1Blv+qDjJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gpFkYJEx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.39
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011039.outbound.protection.outlook.com [52.101.62.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3DE606A324;
	Tue,  3 Nov 2026 06:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3DE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gpFkYJEx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVjKefoJdAv+qfsghSQC6df2h89mj561xPxn0RTLuBAA/Me0k6A8S+OSldFeZ46OjXvmc40NJSh/B7lnHwHAPBAND8Kd/Cz5m/5l1gG4ST/bgmxe1wo6Hg+5bP6AOQrXvxhIxom5UpVjqsgWQ+wpXtY5giaw/iToeBen0JBxp15OpGjqUUyt6jxXORgaQO5NcviLpG0QKbae83/TO3OusYi1JAPjPMlg8ScI9SlzWyP6gnaIi7KNXK1Dn7iDDjiWJMVLRk6AfeXdrZYIlYJb+9ElSvsUMAx6fDJhjQlgUHrYJBa5j34GwjCH394yKd7yQXkr8lNohJtYd1i+tV4KUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr93mp+82LWF/v0eXGsgnrotsjXf0udIMS1fYK4OmWI=;
 b=nHN7Y2O/g4aXFSk9de6mnMuQ70TBnVvbACrSFNn2LUaPN5pCn7ofe9b01V3yh6DCgFXsCNyYRPawgA0Z2FvFvwX9r+rtOu+bPYwSvuiYFrqw9S7rK9Pt+7CMrOAk+x1WrXVyQH9fQaWTSpLwH2TS1j6yD3bW1UuJSNoFpx7n5jcOtLUBFrKuuif79QXJKMd5lrWtcNVXnvORa1ZRZ/QnZwJOm03zIgkdBSfDnfLxWKbKqVW0HMGeHA/Mu7IAfX9rrSZVckpIXTzYV1BSvC3fEktHlAXzTl26PuDD8i+F6xbqjBeJfeEPLkbTsnkZvR7PhM4G27m4ghabLVWV3OXiVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pr93mp+82LWF/v0eXGsgnrotsjXf0udIMS1fYK4OmWI=;
 b=gpFkYJExr4KGj4gijpMidVr/iKwmSTpAtFNRs86dv2wPNqPrZ8LDserDns+Yr8IqH8/370Pkx3QYKA5iie1mDYowiu1wRRpCDBcPjYm+jtHJ+Qd28moFY8p37Td0dw1E/VmfUm1twDckRi5b05tOgHZSUlAPPABW8Jn1Q9sBf+Zgd8pZUW5Od5dAvJNQl6Rs4XF4/1u/nx/uVYF9tyZrvsv3Im+et5MHhHEFBfl/zbj8OlXE9puRtbMnN5gjkRhNh1pbykZlQEN/5MLXWLOM3bd0omN0innBgSSwvRKn9IDKyI3iVEqhuxKNy9d7R6s3aHSBry8a3Tj/d3LYByN41A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Tue, 3 Nov
 2026 06:54:37 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:54:36 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Aniruddha Rao <anrao@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Johnny Liu <johnliu@nvidia.com>, Johnny Liu <johnliu@nvidia.com>
Subject:
 Re: [PATCH v3 0/4] Add Tegra238 BPMP support and fix stale EMC clock rate
Date: Tue, 03 Nov 2026 15:25:51 +0900
Message-ID: <8Vvs2CcoQRmp5w8swuUfpw@nvidia.com>
In-Reply-To: <20261102121202.2431928-1-johnliu@nvidia.com>
References: <20261102121202.2431928-1-johnliu@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0044.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a11418-a4a8-4f2f-e7e7-08df397752f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|23010399003|1800799024|18002099003|10067099003|261102123227099003|22082099003|921020|11063799006|261022105027099003|261026121527099003|261021121427099003|261026140227099003|261009223027099003|261028144727099003|56012099006|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	tWSa+2FQnRAJeceug5OIJ/GLvoPTOahwHmskYRwr8ZbKy1VVPZq1aLTvCVRJbM+f1c4XCUNf0jfQYC5/i5MKNDXGd0aFYBLF716vH6lzqklrtzk+WykuawAjJqEYooiCiMB7lfvQRpUWCp3+TCXSxRPjHFolbolUnaUFVl8rYwRd5Ior1tZcLOjHwSn6quWdgbcd1prF+mspSovG72c9pf1lXFKBK/nSc+2OaUYd6wDuHNhDMkWfkeyn7kkp2ZJZmSlMIhNh4YYc9D1t+GlbLRQsWGMV/GBxvY55xBNDM1KwFWjaEkv/u7WW0lW80nuSZVWCW5k6fV3HV4lfkoegrtzOpZsQmqxzkwciCFGLvel40jbOYgPQTnkcoA37Y+JJfNaqZ7OjhR7VFP4y4vGJi1mZ0xhUHv3utpMyMZ1Juszr8Zg3JbL+0Vrg4yTmUop/Er2FAENF4ECDRUFKxTfJNDDm+DZ1VKhRWRd9Ihb2wD3tdoDqU5ete4sWzZsOQzh4ZuPdY/D7Zg8AHzu/Q2ljVkZh7QlvXYgyanjuLHZEB0bFFUnX7rSS0MeY0RQNbCziwm0wBw4m+X6+lc7bDGitCXRTLHhH8oLt4g0TfYQa5D0f6iOogaPBeASUqI8yk3jD+gIX1+jq2f4lGZc+Ja7T3GK02P8kiJWEVCAEYtM2/43V7Bx97c37/qZf3dH5SgOnnBHhYHkJD9wTnOihlogS9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(23010399003)(1800799024)(18002099003)(10067099003)(261102123227099003)(22082099003)(921020)(11063799006)(261022105027099003)(261026121527099003)(261021121427099003)(261026140227099003)(261009223027099003)(261028144727099003)(56012099006)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukszek5iLy96L0FyZFlWSHhVdzdIbHlXUjBlcUpuSndLUGhMYWRwRWdjbHhy?=
 =?utf-8?B?YjBKQ1BQQ2NyZUw4SUl3amJQLzZUVERUZmZZazJweWRYUDU2cjVlaEtLb0NS?=
 =?utf-8?B?cGZwV2VUdTVOZHhsQ0tpU0pWT2QrS0UwUmJPLzNBdUZNVytCdkxFN0xvZEhN?=
 =?utf-8?B?NGlyMi9UVVBVZWhtb0JYV29IdE1pL1hOcEIyKzFJcW9QYzFpQ1FRV05ZeWN0?=
 =?utf-8?B?bGd1cStlRDdyT3RGRGFzTVZLTkhIUFZtbFd6TngyeG1Xd3dmS0dtemRNRFdl?=
 =?utf-8?B?eERSaThFYmszdGZKZDMvaGFrZGVkRXJpaHhjT09ScHFoWS8zcmxGV0lMdndV?=
 =?utf-8?B?VmJaMC9ZTW5nVk1JLys4VkhlNHpWaml2NmY5M0JVMnVmSmtPcnZDY1Rnb0hr?=
 =?utf-8?B?dDB0S2dvY2RWTUJhYndHQnNCMnVpNEQ1TWx4L3BZd3VhRnRNZ2wzSjljY1Ru?=
 =?utf-8?B?VFd3TjZXTEZtdk4vNnVkL3g2Z2RqVkI4aGlUUzl6bEVUTXZOM2lKaUN6R1lR?=
 =?utf-8?B?KzhzMmZTUjBldG9yWitZVy9jSHZuYWphVXpyQnlRWE9HUldocDBZTVMyUFpp?=
 =?utf-8?B?WEV6d1Z6WkxrL1dmcHU5TWJyaVlmWm5HMWEwSUZidDl4THNqUXdHalQ2NGZP?=
 =?utf-8?B?WDhoZW5lcHcwYUdhL3pqQWt0aVZ5QmJXemNCblJmd3hiVy9JTnUveEtkMGti?=
 =?utf-8?B?OUNUYUR0bW56YUJuWjJNbWp1YTRGeUpLRlFqaElCcDNoOCtOOTFJZy9VV1Z6?=
 =?utf-8?B?RUNxZlBnZTRwTGNqU2kyNm5VeDNPdkk2cTlkaHRucmptTTRKMWcrM1BIclFX?=
 =?utf-8?B?eTVpRWVYZFY2Uit2TldvWlNTcW1VZjZBQndDTzF2NkNUSUlyakNDVnQ4TEFD?=
 =?utf-8?B?czZkUSttcmtQdVNwVGFOK1FhZVl6ZVRUaGEydHNRR3pCaUxwUFRGZm5iWjEy?=
 =?utf-8?B?NG1aRWlaci81TDhPSmFJU0ZTVDRSWlUwc0FjMWdKYi9EVFBsM0h5Skc5WGRO?=
 =?utf-8?B?cGxjZjNpZnZoM1p2cHEyNGVyRm1FMVRkYUQ0NVhjN2FIeXA2R0hjYWxyZkR0?=
 =?utf-8?B?bHVod3JMMXJjMWpERDdLaUlWSEFTeWRnWlczZU4wNE5BM3RnY3pxRU5BS1lO?=
 =?utf-8?B?WGtJNlVkekJzMU5HdERjakRjQTRnc1ozSGpabUlJUDN6T1R3SXd3QjRVTXRP?=
 =?utf-8?B?ZG00WUU3ZlQ5dXYxZXhNay8wTXpxLzZvaTFDK2JFRGtFN3MvbWE3ZHEvTWpz?=
 =?utf-8?B?SWd3aWNQREVCaUFSbjNSdTREci9XajdINUtjNjZQTHV1cTd0bUhNZUxVMG1l?=
 =?utf-8?B?YUNVUUYyYVBoRjBBVzQ5THp0dUFVYlAwaVd4VEhTV1grM1hjVjFES3BSQTNY?=
 =?utf-8?B?c09FNjFScVRxQXY0OURKYXpRVzlBMzFHRjRyUUNPWUE3R1hYQlczYzI3TDZm?=
 =?utf-8?B?Ykk4MTlaWU94M09NVERNWllRZnBxN0tVS1FGdGV0Zm1yVVdzSmJpZDNMeWIy?=
 =?utf-8?B?RHd5MEJoQTZHRVZML3hSUzVzOUVOM3B5V1JCdHRNUHN1eGJBTitPQUtLRVEy?=
 =?utf-8?B?UTRsOHhxVWFGUDZrT05jTlRZbVE2YnBIeXlMaXhHRVMwT09JUEJ0V0ZhaWJP?=
 =?utf-8?B?VWxZWXR4cytNb3ZwWDBGdzJ1YzZuQ0JUZktyeXRHRndsVlhCVFp3ZzVJWUF6?=
 =?utf-8?B?SmYvTWhoZkI3aEcwdktEa3NMOUVSN2psTnFqQlV4Q3N6dzhmTk9kS29Za00x?=
 =?utf-8?B?NUZJbWdRdFpFKzQ2Q0xiU2xkTnpFT2duamgydlF3RWFKVDluSjhKdlV3dkdK?=
 =?utf-8?B?OUlZWk5YcUM1VEhUTnh0a01kVGFkT2xvMWhjeTBpdzQ2Q0NSd2NERFZia2Vy?=
 =?utf-8?B?ZGZMbCttYWR6R1lxVVlZOGpKS1BlYW95QTM3bnJqaVRnWmt2dmVaaGxIeENI?=
 =?utf-8?B?cTZ6QTYycVozU0pIdVdFdE90S3c4eDUwNXU5dXdyRS9YODBaamNYL2xrWkQw?=
 =?utf-8?B?OEZhK1NXU0F0MGFWb2ZPZE4xK0ZDS3plR2pHNGEzaUpVK1hLZnpqdE1FdEdG?=
 =?utf-8?B?bHl5YVpDL0hkZGRaeDRhbkdQM005MmhHTGRnODFOWm8wN1VnWGpjWkhYZVR3?=
 =?utf-8?B?VmdCTnI0OFNpYVVmbTlGSVpVa1pmVG9ZMENiMlVIN1JZR09yb3ViaTN2MEV4?=
 =?utf-8?B?WDVwdGFLZXVUR1NXU1lzQ1pPbVJKc0ozNjdvYnJ3bEZVSTNEWk9td1lId3pE?=
 =?utf-8?B?c2FPWmsvVGJDalR3ME9RNEhZNzhSSmZscG9NSXZXSWQ1bVB4dVZjeXQrQ3d2?=
 =?utf-8?B?NnNWMGEwb29SczZFV1pCb0NWaWJLblp3bDhSRzNqdTNxcnVWRUZYMWxTV2Zl?=
 =?utf-8?Q?Xy4iQX8tnu/pg8VaYNIHSlxKL910rYySGL2JIT50zddWO?=
X-MS-Exchange-AntiSpam-MessageData-1: jt3iOf7hc1VQgw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a11418-a4a8-4f2f-e7e7-08df397752f6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:54:36.7650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZ8UpgAkmCW2c9nt2CeIlYdER+vRIKRaP1l+xxi8DHsYc4jaVoNfYnq5tWOyyO4WQjIH23HERc1jiKHl4Qnb4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743

On Monday, November 2, 2026 9:11=E2=80=AFPM Johnny Liu wrote:
> EMC clock scaling is handled by the BPMP firmware without kernel
> involvement, so clk_get_rate() on the EMC clock can return a stale value
> cached by the common clock framework. This series makes the EMC clock
> rate uncached on Tegra234, Tegra238 and Tegra264, and adds the pieces
> needed to identify the EMC clock on each of these chips.
>=20
> The EMC clock ID differs per chip (TEGRA234_CLK_EMC=3D31,
> TEGRA238_CLK_EMC=3D43, TEGRA264_CLK_EMC=3D290), while the
> "nvidia,tegra186-bpmp" fallback compatible and the tegra186_soc data are
> shared across several chips. To avoid detecting the chip at runtime, the
> EMC clock ID is carried in per-SoC BPMP data selected by the device tree
> compatible.
>=20
> Patch 1 adds the "nvidia,tegra238-bpmp" compatible to the binding,
> together with the Tegra238 clock ID header. Patch 2 adds an emc_clk_id
> field to struct tegra_bpmp_soc, together with dedicated SoC data for
> Tegra234 and Tegra264 built on a common TEGRA186_BPMP_SOC_COMMON
> initializer. Patch 3 adds Tegra238 support to the BPMP driver, including
> its own SoC data and EMC clock ID. Patch 4 then sets
> CLK_GET_RATE_NOCACHE on the clock matching that ID, so that the common
> clock framework forwards rate queries to the BPMP instead of returning a
> stale cached rate.
>=20
> The series touches both the clock and the firmware code. Patch 4 depends
> on patch 2, and patch 3 depends on patches 1 and 2, so I would suggest
> taking the whole series through the Tegra tree with an Acked-by from the
> clock maintainers.
>=20
> Changes in v3:
> - Move the TEGRA186_BPMP_SOC_COMMON refactoring out of the Tegra238
>   support patch and into the "Add per-SoC EMC clock ID" patch, as the
>   refactoring only makes sense together with the per-SoC emc_clk_id.
> - Keep all Tegra238 specific changes (Makefile, CONFIG_ARCH_TEGRA_238_SOC
>   guards, clock ID header include, tegra238_soc data and compatible match=
)
>   in a single "Add Tegra238 support" patch, and reorder it after the
>   per-SoC EMC clock ID patch.
> - Reword the "Add per-SoC EMC clock ID" commit message to describe the
>   intended use of emc_clk_id: the BPMP clock provider sets
>   CLK_GET_RATE_NOCACHE on that clock, as it is completely managed by the
>   firmware and the common clock framework must pass rate queries through
>   to get the latest rate.
> - No changes to patches 1 and 4 apart from the patch numbering.
>=20
> Changes in v2:
> - Squash "dt-bindings: clock: Add Tegra238 BPMP clock IDs" into
>   "dt-bindings: firmware: tegra186-bpmp: Add Tegra238 compatible".
> - Reword the binding commit message to state that the Tegra238 SoC is
>   fully compatible with the Tegra186 BPMP.
>=20
> v2: https://lore.kernel.org/all/20261028155000.1205739-1-johnliu@nvidia.c=
om/
> v1: https://lore.kernel.org/all/20261028084900.1047287-1-johnliu@nvidia.c=
om/
>=20
> Johnny Liu (4):
>   dt-bindings: firmware: tegra186-bpmp: Add Tegra238 BPMP
>   firmware: tegra: bpmp: Add per-SoC EMC clock ID
>   firmware: tegra: bpmp: Add Tegra238 support
>   clk: tegra: bpmp: Do not cache the EMC clock rate
>=20
>  .../firmware/nvidia,tegra186-bpmp.yaml        |   1 +
>  drivers/clk/tegra/clk-bpmp.c                  |   3 +
>  drivers/firmware/tegra/Makefile               |   1 +
>  drivers/firmware/tegra/bpmp.c                 |  61 ++--
>  include/dt-bindings/clock/nvidia,tegra238.h   | 279 ++++++++++++++++++
>  include/soc/tegra/bpmp.h                      |   1 +
>  6 files changed, 329 insertions(+), 17 deletions(-)
>  create mode 100644 include/dt-bindings/clock/nvidia,tegra238.h
>=20
> --=20
> 2.43.0
>=20
>=20

Thank you!

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



