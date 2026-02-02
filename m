Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012048.outbound.protection.outlook.com [40.107.200.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524611B4F1F;
	Mon,  2 Feb 2026 03:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770002226; cv=fail; b=aYoZURf/tj56hlznsZKLxXvfAGDfQNpGw+8jkSHO6k/EVKCBLrJjIgsJwocrpX5WmU6wQC1Qt4rbBObDEySXr0JClSyo7ZJJAoanFJHe7puTwWNOiAStMrcRnmVciM+ZuhG7Cyt3Qvws5EXtdmg/nsB57v8t9r1KhES9zJZqjTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770002226; c=relaxed/simple;
	bh=lK79oEGA7+GagvkqJQeLQ2v32nC5XlUCACKwZOFtxkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cFQOeFYteFlj2ubjvM96l38xCP0mY7FSZUH5VDMOjAe/YAh0BardqQSdnmIzUxCplrXBrCkzo/5N1y7OMjV2H2qh7t8pTraL2gufmLOsQfAJAIiUy/FzIZwK/XCcH9yGSt4cefFoh607fk5Hs8jBO/BY3+9rzVCnak01nG59YbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nTDQy2Og; arc=fail smtp.client-ip=40.107.200.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nTDQy2Og"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nswwUkg9pvQ6kMGaQQyQ42Cshw4qiRtODMbCsvY928u5A5M4DnDt/zhswvawdkNuC2txfp5cyLy7/gWHD4eaIgWLXvia3O1vtIA4hs8LaLoLJmjim9p0heXkjJ92u1hfIvXPFFKS+n/j3+9xNehaoq2gHzNPrxZfrBj8nv2S+gwGJncY16bZkuiiZSJXmT1HJfePWLGMjSTXqi6JMyl5gtIpiyFLYOiIFcoB3Jq3q+BLcftRunWk3MGbOt1A4OS8GUHSFJDi+zOOjSFwGPwD4hw0EpwiSA0Dge1so17sWd6o080dnygGfJzgD1fGwR9hW1TjFX8nZCwrAuhYVJ9eVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZ83zADYNO1vRIXsBgnWmeV+vK68ibWqdwJfnvHYbDE=;
 b=JRgwAT4ulc32vkybIRdoGzFj8f1K3vfc6/C4UGYpBr43dxuFEbAvoxK8QCnL+E9C8Tlar8ercjCpiEXC4pggjNoN1E8Qwc0bx6a9WNGrGps6gXYAO8HMwN9K4dvkqxIRo0YbUVNTUtSIzr0HPhAFxLzsaidqIGS/zfFb9liSXIb1oLFW/VXUvVvgilFbP5z6+3oMXUouHKE0ARc/5OxWwe0zpC5HphqE8IPQbKhkR5DDlfY9f27pvxJ7gXwDGVraQBs8BQ2DtePJLk6e35C2sy0sm3RR7SXxuL0jFhL8My7eKt6iQqTyq6xBwIeEPmaEmOJncAsfplLgLojlWPqzOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZ83zADYNO1vRIXsBgnWmeV+vK68ibWqdwJfnvHYbDE=;
 b=nTDQy2Og+KWNsyOFj0HfdjpemKq58dtFEURe9fGPoG0puGgAfw/2xwzCdjh06Am812ZrTEqwTxxqeERL8YRmpOUqEsFEwXqeO24HXIu9C3je+EcNveplbAjA+0ON8dNTyoytcQosj5cNk1e6oHT7jiUmrP2O7zfWM9reWP/3oCsQgnuuyXCGVrrgjhukIpwu6sWm8NaJjQmXJTQuIdc3Fr5hVRL8eTOdQjbsjuxU8c97UQ6mu5IyGGKtKha3qMvI016q5PozzUMKKUSsJmZ1kzVpycyNYsY0+XII2vX1LX5/mFLUKvnQK2BqgTPb4fMXETtzWU5fHKFoGrCuKP3BpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ2PR12MB7918.namprd12.prod.outlook.com (2603:10b6:a03:4cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Mon, 2 Feb
 2026 03:17:01 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9564.007; Mon, 2 Feb 2026
 03:17:01 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] usb: phy: tegra: use phy type directly
Date: Mon, 02 Feb 2026 12:16:58 +0900
Message-ID: <2400213.ElGaqSPkdT@senjougahara>
In-Reply-To: <20260122151125.7367-2-clamor95@gmail.com>
References:
 <20260122151125.7367-1-clamor95@gmail.com>
 <20260122151125.7367-2-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ2PR12MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: b156b0d1-2ab6-4462-ccd1-08de6209884c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0pLbUxwWWQ3TEp6WFg4YmdCOEJtS0dCcms0Q1ZnUmVRNC80aE9DTm9TWkFj?=
 =?utf-8?B?QUZsKzdVY1d2cFd2MUtsQkpnTHhYbEV6enFtMS9zSW9WSGFRdkJ3UUdUd3Mx?=
 =?utf-8?B?NENiclVwL3ZGcjF6ZTVocllZREVRRkZGY0RBNWd4TlJJbExBY0EwODNDZUNm?=
 =?utf-8?B?L214VlVXMUJYa2JzSzZmRlExckVJZzhPMXRiUEg3eWJGc1M5b3VDVUgvejNT?=
 =?utf-8?B?REhOdllYQXNtZnJYeSswV2JEdEVhRVArRm9MS2Y5aW5ydERoT2wzREZJelJv?=
 =?utf-8?B?QmN5U0JxcFFaVE9NUEN4eDdtRFdpVjVDYitJb1UvRHMrQlBuL3ZBK21xalFX?=
 =?utf-8?B?TmZJNStyeW9vNS9meXpZNnRCMGJpTDRKdVE0Q0FtZmZGZHovbUFWaUxmZ0dW?=
 =?utf-8?B?RTUrcmZ3Z2J5ZC9hdXoycVdBcjByOWwzcEZvYzFGSnVLK0lsK3NsSEpWRVgw?=
 =?utf-8?B?OGxYQ2oxOGI3dm02cTJ2cTFZNU9YZG9YQWpYU0cybTFNaE0wTE5iQmV3V05E?=
 =?utf-8?B?QXM2V3pkbk1yeDRvaFFidnk0d0ErWko4Q3RSKzcrbUhwc3RnRStWT3BzMjNK?=
 =?utf-8?B?UU1XWFV5cDRGbXBYUXpjM2VjRHhNRy9pbHNWb1pJUkVVMjkzb2hHdzZjRTln?=
 =?utf-8?B?S2d2bWRiVUhGc3VVTitPcEJNSzFYVTNQanZwb1pnRUJFYzhWUmRzdWovRmJI?=
 =?utf-8?B?M3BlMHJXeUFmUmsybFBoVmVEQm9xUCtFUUg5OHk3UEQ2VlZyR0tJTTExV3BH?=
 =?utf-8?B?cG5LMFRXblJRVTJKaHZzZk9xUHpJZFcvcFRzM0kzNmF3MCs0RWE0Zi8yVGpv?=
 =?utf-8?B?RDErM1Y2bXBCRnM5TnBNUFNWT2l3UVVKYVhUc1d1NVJzbWxvOTJuMzArVDlw?=
 =?utf-8?B?S2NsRHJ3NTVrN2lBejduN09sZTA3YU1wNUtQYWFJd05GRHIwM0ZQa1czcm1l?=
 =?utf-8?B?WXZOUjNsWUdseFRlbWZsN1VNOXdBSVdQRnVab1F2Tkw3SGJiSldSaHpVMDIx?=
 =?utf-8?B?OFVtSlJNSVM3RmJPVlpIRlR6OGRNaDFJMXZIS3VWNnN1UFNuTytGSDhMRmZm?=
 =?utf-8?B?THQ1T1BUdmlHMGxpWldsdjFqME1kUytjeVBRLzhvQlV1MXhaWGloSzNWbFQr?=
 =?utf-8?B?WU4wcHk3dDlmSWxod1FhR3VKNWJrbkc3Z1dFdzJjaUptdEZ2TVFQR0ZDcEdP?=
 =?utf-8?B?RldYbnRTU1lQcy85TnNxVEo1SXBIdGVQSVRXS0FENjNJT2d4bTd0c1VYYVlM?=
 =?utf-8?B?R3dXdlBrL3l2OUV0dm90ZDJlZjhCZGFianVjWk11Yzdpc0tBem1rTUVsdGJk?=
 =?utf-8?B?V1NremtwakJITFhaVG1qZlNsTkFBT2UxL2d6b3o3V040YkRqOEFRY2N5bVd1?=
 =?utf-8?B?TDZHQ0d0N2lodUdabkdDaHh3YVNVdTIzVk1GbE5lN2lWcTlROWRGSzNoMjI2?=
 =?utf-8?B?V2NRS2UyOXBEeWUrS3VoekNkdkcwZ010bW8xb0JySi9ydWlBYWNPM0pmYzhE?=
 =?utf-8?B?YUdyWEtvRDBES0ZkdDduaFROdlI3L2xMdDBoeXBkUGkzUkRNNkFBelRubmJW?=
 =?utf-8?B?K3prQlQ2TEdJanJ1MUZQbStVN2daZS9KZ1NBTkxGOUJGS3IwaTlJRzRVdWIv?=
 =?utf-8?B?R1RtVys4eEI1RXhWU3JyVURkN29nYVVmNnNLMUR4eklyS2c2TkFjVS9neWhU?=
 =?utf-8?B?cEdUSUJRR1lGZnBxckNyb1JRbXA2T1Z0TTlHUDJhR1lpd24vRVR4ajV0VDIx?=
 =?utf-8?B?czlDYm5OUjJWTStuS1ZoQmo1UHh3dFZGQUdUcVg1NDFpV0dSN1JWY21sMnFW?=
 =?utf-8?B?bXhDY1JZQXBSNG4wR2RKQWorUWtVcmFsZzBNTUduOEt2QVU4M3VvRDdqZStV?=
 =?utf-8?B?WUR6cFRkWUJoekpaTWp0Rmc5VVV2b1c5YXRTWTdSQldlTnZxU3lZcWxERTNz?=
 =?utf-8?B?dlJBOXNtcXd6L0xvcWxBeHZCc1Fqczh2QWk0b1ZTUGRIdUJDUGdEbE8wVmx4?=
 =?utf-8?B?Z2dxT2dTajd3QkFVaitTcjB5THUyVVFFOUtITU85U2E5bk5SMDRxbkp6dHJs?=
 =?utf-8?B?MVhBU1J0c0lqQVBJTWQvREpPbStzWm1rZFhyTEkzMysrTGlaM1JyNitnS3Ex?=
 =?utf-8?Q?rbVQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkx2K3NIRHBSTUFMV2tqWkJkTFN3cy83RVJxeDR6djQ4cHh5anNleVh5aUc4?=
 =?utf-8?B?Sys4UWxIb2Zpc2g5N0tkd1ZLWXZPRHIyWUllZmxsTDI1TWhvN1BBak1WeFJU?=
 =?utf-8?B?eTkrYXRmaStNRGNoOHVmRnFiWGRJckYyWm1qc2hLZ0NsUlNGVUVUemZuTEhy?=
 =?utf-8?B?bGd6eFRpVm9abFVMSnFVS0dtYS92ZnFhcFdZdmRuYkd1YjNCTFdVTEc1em01?=
 =?utf-8?B?WHFQVlErQm5wWmhlSytBVHdRb2tDZEhSaVlYbWswWDF3N2VyZ1VEb3NOZVI4?=
 =?utf-8?B?aHI5bllhM1NCbW51QW03b0hsQ3A0TEI2NUJXZ25hdFhBeTNwMHZ4dVhaTjZm?=
 =?utf-8?B?S0NST1NhMFFsMzhPbEluZHV1TkdHL0F6RStoczhTRnZnNWtLS1E4cEczeVdE?=
 =?utf-8?B?OWVsV214RTlDZGZ3MGluNlJjS1hBc1BxSmM2SEJ3ZUd2b0N0TUduNVZSV0VK?=
 =?utf-8?B?LzRWVEVWTm5ySXRLWG5yNEtLWk1OeGJTZlg4UThhTDh6ejJCa3hQd1orcmwz?=
 =?utf-8?B?WCtza1NieFh4MmdqMkZ0T2ppRVRkN2c0K1FyT3czc1Q2Z3FDaTg2MjZkRGww?=
 =?utf-8?B?ZjMxR0pUYTN2dHZlcnpSQlVzV21uQWk3bzVEeEE5c2wxSWV2U3Y5SGNkYjFK?=
 =?utf-8?B?d2NxbWZNZkJuZzVXdG5jRkt0VkdCTFVGRThUdnZvWlFBc01XelhHRy80MWtq?=
 =?utf-8?B?YngyNTRnSmxPdWptR0RXTWc2enhldHVZMlA4bytVWjBmV2ZKaHY4ckZ0dWF6?=
 =?utf-8?B?aVNmaGg2Q0VVWHdVU0UxWi9SanVBMUN6d0c5cFY2aEx0S2svZ0hzS2VJNFBT?=
 =?utf-8?B?bkdzWjYrV3I5dFlMbGJpLzlJN3NPWmhLS0lmUm16a05xbW44SnNlRHR6MGJm?=
 =?utf-8?B?OWtwa05oNXpWYlpvUEVuRmxpem50RCszN0tOdUd2UVlMTXZFSk04Z3FIRmVx?=
 =?utf-8?B?bHVTSGNCb3h4MjlOcXc4MW14NXVYSFh4ditLdjlwZlZSZEZveVEvZ3BTTmhQ?=
 =?utf-8?B?UlRsbHJOSnZBenpUSWpiakwxbjNzcXdnc2V4QWc5dEdjejg4cnhSS1AwQXNh?=
 =?utf-8?B?cFBBbURQLzRlYVRzdURJSmplUCs0M2Y2Ui9UYUhIV3lTQ05LRWE4bXBhRjNK?=
 =?utf-8?B?UVJrU3U2bjhQZXJGOXcvc2Z6UVoxeFlyK1ZtZmRobkoyeDhYZlc4QUZHK3p4?=
 =?utf-8?B?dTNYVkY1bjhWWUwxclhyVzNXaDJnaUtaVjBTUEtxdU1VcXAyNXlqeGZXQ3F2?=
 =?utf-8?B?V1BKR3picFFyaTR2RTJEeGZrQmVHbzdkMnlBMEJFNkU4ZHZJK2wxWFBsSzJU?=
 =?utf-8?B?MEx1Q2NOYnBPc0xIRWQ2WU94THc0anFaWXE4emRwZ2VSZk5FMGVYUlBiYzZx?=
 =?utf-8?B?YUl2enNoVG1ZNmJvTFBjMDA0ZWtMcWxNWFVBMWsxVEp6ZUw3bUNzQy9XUkpv?=
 =?utf-8?B?OVRmMkhrQjUxUzhWZEhtV2ozZnE1MEQ1dkNibVhERXhKY0lIZDk3bDNhUzA5?=
 =?utf-8?B?WGV5bUxaWmJIdXFNOEVDTW1VV2g4dHprclY0dW1WWWVNOU1NWXVCWnd3V2tP?=
 =?utf-8?B?YzZCMmZLK04zOTBFZlRnR0xQQ0MzZXNhUzlQbUhwUVZWTThmaWlmQ0JhU3hM?=
 =?utf-8?B?WHFJeHNFOUNISkVhUURONEYxeDJUeGdsMDNBaVo3S3IydTBHVHFkbjd6ZE5x?=
 =?utf-8?B?cTd5ZWdTYUcwWThuQjBHM1Uxa0M2R29tbGJySnhKSGxBOHlqemRmZTdZVm90?=
 =?utf-8?B?QUd4OHc1Smc2UTB4ZkV0emJFVUpudkVNbXJLdVp0SGRHSDJkcFZJdWlnTmJ1?=
 =?utf-8?B?aXdidVpMdHJqTWdRZHlzQVdSdzc1RUl4dUl5LytRSEhHb01oZHBFRXgzNk9V?=
 =?utf-8?B?aVQ3NmxvRlRTN0d1dU5KRkVISlFuK2JqZzBESGhSTitXbkNKcXV6TjdDYis4?=
 =?utf-8?B?ZDk0bmNHdWFqTmVRNGVxM3JOa3IybzUwTm5RQ3JhNkVEcDYyU0c1bVpUb2xu?=
 =?utf-8?B?akgxeEFMTjdXN1V2Qmg5d3ZPWTBTalArbWpIR2paNm9VR1VCbVFJMFBINzlC?=
 =?utf-8?B?aVZ6MTkvRUFBTXg5QUlsZ2R0RkZjMlVUNmhHS0ROSnV0TDZQRkNRalI4WXZs?=
 =?utf-8?B?Vituc2RpWjJicEtta3IrMFFIZHpXWkd2d3plSE5VWWlDMWRZWE42NEJ5K0RI?=
 =?utf-8?B?a1ZNSHJhWWQ1TEJndzhoSVA1SVhPTDVhUFZ3enNrWkZpKzNnZGtmbzVBOFkw?=
 =?utf-8?B?bTEzVjJoVEgrTndvZ1FLVHNmdDE2R2pkVjNiTW1tQkY0RmJpWnRnSmpxVnor?=
 =?utf-8?B?ZXVzTjJKUTNFMm5hRStwOWJxZTF4NEkwSkZTWEJrUVl3L2VBSHlWYTdlTSsr?=
 =?utf-8?Q?m0XAcUQblAuNWWbfTZFoB9tRg1sQl/xpqOb/rFxChfAZU?=
X-MS-Exchange-AntiSpam-MessageData-1: jgMUBS5fc+A0+Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b156b0d1-2ab6-4462-ccd1-08de6209884c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 03:17:01.6668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R41O45YZqaPQwf0SbdGvdJ/78UREyb+kZuKNatyRhcqzHjwuQN49zb05iyL7EIveOTfrGgc8O5KKEcvC7pMLmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7918

On Friday, January 23, 2026 12:11=E2=80=AFAM Svyatoslav Ryhel wrote:
> Refactor to directly use enum usb_phy_interface to determine the PHY mode=
.
> This change is in preparation for adding support for HSIC mode.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c   | 51 +++++++++++++++++++------------
>  include/linux/usb/tegra_usb_phy.h |  2 +-
>  2 files changed, 33 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-=
usb.c
> index 1f527fcb42f6..afa5b5535f92 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -814,15 +814,24 @@ static int ulpi_phy_power_off(struct tegra_usb_phy =
*phy)
> =20
>  static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
>  {
> -	int err;
> +	int err =3D 0;
> =20
>  	if (phy->powered_on)
>  		return 0;
> =20
> -	if (phy->is_ulpi_phy)
> -		err =3D ulpi_phy_power_on(phy);
> -	else
> +	switch (phy->phy_type) {
> +	case USBPHY_INTERFACE_MODE_UTMI:
>  		err =3D utmi_phy_power_on(phy);
> +		break;
> +
> +	case USBPHY_INTERFACE_MODE_ULPI:
> +		err =3D ulpi_phy_power_on(phy);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
>  	if (err)
>  		return err;
> =20
> @@ -836,15 +845,24 @@ static int tegra_usb_phy_power_on(struct tegra_usb_=
phy *phy)
> =20
>  static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
>  {
> -	int err;
> +	int err =3D 0;
> =20
>  	if (!phy->powered_on)
>  		return 0;
> =20
> -	if (phy->is_ulpi_phy)
> -		err =3D ulpi_phy_power_off(phy);
> -	else
> +	switch (phy->phy_type) {
> +	case USBPHY_INTERFACE_MODE_UTMI:
>  		err =3D utmi_phy_power_off(phy);
> +		break;
> +
> +	case USBPHY_INTERFACE_MODE_ULPI:
> +		err =3D ulpi_phy_power_off(phy);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
>  	if (err)
>  		return err;
> =20
> @@ -863,7 +881,7 @@ static void tegra_usb_phy_shutdown(struct usb_phy *u_=
phy)
>  	usb_phy_set_wakeup(u_phy, false);
>  	tegra_usb_phy_power_off(phy);
> =20
> -	if (!phy->is_ulpi_phy)
> +	if (phy->phy_type =3D=3D USBPHY_INTERFACE_MODE_UTMI)
>  		utmip_pad_close(phy);
> =20
>  	regulator_disable(phy->vbus);
> @@ -1049,7 +1067,7 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy=
)
>  		goto disable_clk;
>  	}
> =20
> -	if (!phy->is_ulpi_phy) {
> +	if (phy->phy_type =3D=3D USBPHY_INTERFACE_MODE_UTMI) {
>  		err =3D utmip_pad_open(phy);
>  		if (err)
>  			goto disable_vbus;
> @@ -1066,7 +1084,7 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy=
)
>  	return 0;
> =20
>  close_phy:
> -	if (!phy->is_ulpi_phy)
> +	if (phy->phy_type =3D=3D USBPHY_INTERFACE_MODE_UTMI)
>  		utmip_pad_close(phy);
> =20
>  disable_vbus:
> @@ -1104,8 +1122,6 @@ static int utmi_phy_probe(struct tegra_usb_phy *teg=
ra_phy,
>  	struct resource *res;
>  	int err;
> =20
> -	tegra_phy->is_ulpi_phy =3D false;
> -
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	if (!res) {
>  		dev_err(&pdev->dev, "Failed to get UTMI pad regs\n");
> @@ -1280,7 +1296,6 @@ static int tegra_usb_phy_probe(struct platform_devi=
ce *pdev)
>  {
>  	struct device_node *np =3D pdev->dev.of_node;
>  	struct tegra_usb_phy *tegra_phy;
> -	enum usb_phy_interface phy_type;
>  	struct reset_control *reset;
>  	struct gpio_desc *gpiod;
>  	struct resource *res;
> @@ -1342,8 +1357,8 @@ static int tegra_usb_phy_probe(struct platform_devi=
ce *pdev)
>  		return err;
>  	}
> =20
> -	phy_type =3D of_usb_get_phy_mode(np);
> -	switch (phy_type) {
> +	tegra_phy->phy_type =3D of_usb_get_phy_mode(np);
> +	switch (tegra_phy->phy_type) {
>  	case USBPHY_INTERFACE_MODE_UTMI:
>  		err =3D utmi_phy_probe(tegra_phy, pdev);
>  		if (err)
> @@ -1369,8 +1384,6 @@ static int tegra_usb_phy_probe(struct platform_devi=
ce *pdev)
>  		break;
> =20
>  	case USBPHY_INTERFACE_MODE_ULPI:
> -		tegra_phy->is_ulpi_phy =3D true;
> -
>  		tegra_phy->clk =3D devm_clk_get(&pdev->dev, "ulpi-link");
>  		err =3D PTR_ERR_OR_ZERO(tegra_phy->clk);
>  		if (err) {
> @@ -1410,7 +1423,7 @@ static int tegra_usb_phy_probe(struct platform_devi=
ce *pdev)
> =20
>  	default:
>  		dev_err(&pdev->dev, "phy_type %u is invalid or unsupported\n",
> -			phy_type);
> +			tegra_phy->phy_type);
>  		return -EINVAL;
>  	}
> =20
> diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_=
usb_phy.h
> index c314fad5e375..e394f4880b7e 100644
> --- a/include/linux/usb/tegra_usb_phy.h
> +++ b/include/linux/usb/tegra_usb_phy.h
> @@ -73,7 +73,7 @@ struct tegra_usb_phy {
>  	struct usb_phy *ulpi;
>  	struct usb_phy u_phy;
>  	bool is_legacy_phy;
> -	bool is_ulpi_phy;
> +	enum usb_phy_interface phy_type;
>  	struct gpio_desc *reset_gpio;
>  	struct reset_control *pad_rst;
>  	bool wakeup_enabled;
>=20

I would consider putting a WARN() inside the default: cases which should ne=
ver run -- primarily just as an indicator to the reader that those code pat=
hs should never be taken. In any case,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>




