Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B11876;
	Tue, 29 Apr 2025 03:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898643; cv=fail; b=cTcaRWkAL5hh4bOH3jLzHiYFgFmICv0+Xbn/5UagpDOz438kIluRj1+yI/Njpe8Y3xspfyXgywoy8KbIy6lT/mKsfgX3zvW8GlPxkgF/6iEAB+4uK7ax0gSeK42pfU9auMaw+pD3lthWl3l5Tg8THNd60GndAMEzMHe+2pOsAPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898643; c=relaxed/simple;
	bh=+e2JyXFga66Mo/7amPgLYSACAajKVKRDu45oQu/vHcI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UFDMgu3wJ1owTMxNEVcvFEy387U/hSuyUxqEqkV4NcPS4b4gQffwJwyT0FonBryNXw+qJFvmlkWZtqqmi8GeZSN6HYkFWIM+zJDVayYuwtIMQpGkDU32qg4G+Xzj+Jg6FzBOXM4Dkq0/3CAN+wZyD9YU6wpgeujBLsdg80lnF84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l1gzilU6; arc=fail smtp.client-ip=40.107.243.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l1gzilU6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmPbTxKY79BRId5iUQkuJUe0I1lCm2kWIV/EHSOzoskvR1UZoPRSPA5wtH9sGGM2lH7syzWlhB5bKPpxbnTUFh5TwuuhUmCOUM2m0LmD/0hQ5Ps6dxoyBB6E7DH0erfwSu5n7WgeYdpyG7D7LZ+0eC/llkACmdLfs5oQnRTgGAaex8yFULWWUE3geIUTUNP7iloO8OLyY9ZjCBUzrwuFayHY7XM3KwABSI7NvhpvCOYZg+DZW4GqTQUrB7sAxW9sfONW1hQk4TuiklrkD2Crd4ROaAlJ/Ke67wt3bn7V3V0PN/tcFglY2XwwSv3Yb/xBdKCUMsBcnyAQzLwCX6qi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+e2JyXFga66Mo/7amPgLYSACAajKVKRDu45oQu/vHcI=;
 b=Eu5h6D9kCjSXd3KGhWZJPrwJ84rAkWA4AfYMvckPq2x63uUGdh51aGaDwBIp/Njvdm4tKx0KuDL+lkPs/ypVqGXuaEDu8xr4Wgwf+9npCr8Y1KujJQHivJwoc9hjBoIV3YRSLW+vm/pj1aGfxvCBzRsUzO7oT/Zp1qMy+RZzzcT9ICK29fEzxETUa5eHSpwyr4iR8ls/1/XgwZ6mKZdhp5jet+dnvx7eYSXE2/nI2eRierr1BVGeFIzVS9Jk7aVOyCrjsz3wg6eUEG/4x4DRKHWsZV9kO8FMzeNIQHCWIRL8qSUaSD08flSMRXRLO8RZhYnuNOlMK+w7kQm9tUFrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+e2JyXFga66Mo/7amPgLYSACAajKVKRDu45oQu/vHcI=;
 b=l1gzilU6AM2LwGkuhadcVMitKx6/T89Rfy30HfEG7gD0fPwrEQZJJRyPKDvZme3N6Ke20FRRRJAShrrVKKFa7vqYVKWFBdMHPJTQQ3gKzWIqht2s+cQ4GyNCvYFDsGpthbjfgFXovLgunDTbhL1nEUtWzZpP2zZvgcqRbJgrNpeuayrj4Us1bZ3zZ2Og74+ACLg219sjKqJw0/T8VUxCnRtUBnBfKlFPO/6kB9FhXZ9RMZBF8GF+RWlevveL7fesT4GljGkqmZMnW3BMwuYLO0NO5X7QqdAmXU6uYzRKL71zIjOD8VF5qvRkB3vPC/Gz4xA4AHor0U6gAQfX+Z5+1Q==
Received: from PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 by DM4PR12MB6375.namprd12.prod.outlook.com (2603:10b6:8:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 03:50:35 +0000
Received: from PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09]) by PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 03:50:35 +0000
From: Robert Lin <robelin@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	Pohsun Su <pohsuns@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sumit Gupta
	<sumitg@nvidia.com>
Subject: RE: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Topic: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Index: AQHbsqVkfRv7lb88+Uiqh29bAMgel7O5J3aAgADk4pA=
Date: Tue, 29 Apr 2025 03:50:35 +0000
Message-ID:
 <PH7PR12MB6418840127C215779DB63CE3D9802@PH7PR12MB6418.namprd12.prod.outlook.com>
References: <20250421100821.2907217-1-robelin@nvidia.com>
 <20250421100821.2907217-2-robelin@nvidia.com>
 <e5e8b5be-7434-4693-8696-5e0e68f07c75@nvidia.com>
In-Reply-To: <e5e8b5be-7434-4693-8696-5e0e68f07c75@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6418:EE_|DM4PR12MB6375:EE_
x-ms-office365-filtering-correlation-id: acc3500c-3213-4200-417f-08dd86d0ff95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SkE5bWFyaVQ0bHVSZlRNRER2enI4T2dGZ0lrZFFWbDRJT2Y5NU9DaTlPQUZo?=
 =?utf-8?B?YldIR1ZLWm5aazFpNkhFNVByM1lQRG5JdFRpNUZiOEIxQVF1QlNySUVYd3RF?=
 =?utf-8?B?QVJERGlSL2JMQWUvT2diZDJoRkFDdmpoNURNaEJPWVptUDkwdTBvbTZyYkZT?=
 =?utf-8?B?U1NPL1Z2VFpkZ2Z5V2l6eFk4RHE4Yzl2NnhESG5PV0ZsYVVWVUV4MzMwWTZ5?=
 =?utf-8?B?b280Qyt3cUdndWtKV2pDdFhRY1QzQVBmakJIeExLemFoMWM4eTk3TitORFZJ?=
 =?utf-8?B?U0FiN1FUSmRmTU5IV05HRnlRU1RQZjk1YjBTU2FMeTBtdy9xWG1BWDVNSkFS?=
 =?utf-8?B?TGZnMUJ2RHMwVjhkSWQvelU5WWhtdU5HcitveVZxRmVlWUVqQm00eXdjVStB?=
 =?utf-8?B?ZnJFbUNIZFg5S3NvMlY0Z1V5Ly9SVjhxNFJqZXcvTUVoSkc2OGFWdnZtMVNL?=
 =?utf-8?B?aGwyN3ZXbS9Ia3cxTWRBVlFnbUhFN1B3ZGRHTC9aUEkybTQ0WWFRQ09WQUxZ?=
 =?utf-8?B?MWZaUWEzU1N0aE43R2t0bVBDSk5yakM1RVNOMmtLTTdMTU5WZ2grMkx1eEdw?=
 =?utf-8?B?ME4rcHpQVU5Ucjh5dFRxMzhVTE94RnhWWDhDTWRrZ2VUUEVHdHFhbTFwSi9B?=
 =?utf-8?B?ank4dXI5eFE3Wm53L08yWjdCRjN0S0R2LzdBVnZCemMwTnZEWWU2UEViMy96?=
 =?utf-8?B?enBnMmNjeE9vUDh3ZkR4d3ozWk40Y0ZGUW5KV3RZczdmaWdRMHZrSC9lcnBh?=
 =?utf-8?B?UHRMMVpQY1V4RStTSTFxcGpra3RMRFhhYXE5Mi9TZjZuTHVpOXdNem82QUhr?=
 =?utf-8?B?cXp5Z0VMaDM5eDZNQndBR0FMeUZPb3EwSXdSZnI5ZCs3V2ViTWtHS1Rnbmxk?=
 =?utf-8?B?elY0WFYxV0tuL1RnK2VKa2FEQ25ybTNJRm1GcnVabmRHbU4zODlJT01IM3lX?=
 =?utf-8?B?ZWFoOWhjakZwSnNTNzF5c2FHY2JBeStsMmZxQ2R0bW5ZRElKZzNhVTlHSyta?=
 =?utf-8?B?aDJKR3lCSWhDcXJoOWtTQVRGSGQ4MVRlWVcrVi8wdHFJYVR1WTlZMUN2NWpH?=
 =?utf-8?B?Wm5ZcG9QNGRaYjl4UzBKd3NQUUR0dUpGdEpJK1lMaXl3aStoZkRwaEdnc3Rv?=
 =?utf-8?B?N3BXZUVjT3NOYXpueXFlVlBYY3BBWVM2L3RMbVYwQTQ2NkdzNHB6OUU0SWlt?=
 =?utf-8?B?SWU3ZU1oTlpJa1NGVTlzTzlFRGFUTlIzZlcvZkV3WVlWRXk5c2lrdHJpTXhR?=
 =?utf-8?B?ODdaT2Q3MFowc3BxWVVuUFRzL2xFTW9iQTdGVTNQZ045UGRsUDd2N0MvOGJ5?=
 =?utf-8?B?blJaRG0wUDEvT1VjczVzNTRJYytlVFZaZEdYdTFqcFIrVFZkZWZLcitIQ2V6?=
 =?utf-8?B?RHFOVFk4dCt5ZFozNFJ4eXpXK1RHVlQ4QzUvS21rNTF4ZHluVSt2bWYrVUNY?=
 =?utf-8?B?dmE3L0xMWG5tZDFlbEJvcXRVQTFxVVdFUE9RMHRwWDJJcEYzcjVDSS81Rmt1?=
 =?utf-8?B?V0tUN3A2aWVuV3N6VUlIM28xWjl5RXpINEdYTkZKdVlhUFVpd25kZ1I0S3JB?=
 =?utf-8?B?cjk0aWFpbUFDQk80Vm1vbTRKc0RkOGt4a1F6Q0tsMmUreUJZZm90SU1uMTJJ?=
 =?utf-8?B?d01oVWhhbDhzNDdXZ0N3THphRk9BQlNhNDE0Q3p4a3ovQnJTL1VPTHNWbmc2?=
 =?utf-8?B?MzFCODI1ekU5UGE5Smt6ejZHSHBzaTNCamZvNCtaTUxOMjNZbHF4RlZQdXdv?=
 =?utf-8?B?NjMwYi94ek5Pb2xHMkFyMXZZbDl5UHNqMEpORDRDcStOY0hqaXNRKzJZaUFv?=
 =?utf-8?B?aTdoRjVqM1pSOW9yZnJIM2RzTVU4Q1l1Tm5qQ1hZMjVjZk5FSnJibUJGeHZ6?=
 =?utf-8?B?SXRhMHREdWoxQmY0S3ZtZWt4bkxNWnVFWVBTN3BFUnl6S3dlRFBpZStZWk5y?=
 =?utf-8?B?QkJYamxwdmRvN1o3dG1KOGlkOHdWN0NPZ1phbmNzeUFVaUZEdktRb21CWXYv?=
 =?utf-8?Q?hyWSeDnqtOg87poTzCaSJTOV4N+yv0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6418.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFVFMkNuSHoyNkFqSFlIUm1JYXFDZXlSRE9Fd0lxOGhwMDl2bnRWTFh5WE0y?=
 =?utf-8?B?WitjQ29VRENvNkVaUFBRVk9hYk51WW1LOGtxak51T2VZekpvdHE0MWIzNzRa?=
 =?utf-8?B?K3R5Y1k0Uks4TGlKQmtSS0tBcWJWSEpnZ3AwOEw3dUdNWHhNN3VHb3dMQ3ZM?=
 =?utf-8?B?MkwzejZOMmx5czFmZ3ZnWWRIQnM4VW9Rb3ZTeE95akkwWEZyeTlCV0xSQ214?=
 =?utf-8?B?VlZxMUF6dytvcnJ3ay9RWlBjNmo4ZHJBVWZnUGMvK0N3b0w1QnFoUnhHaEtk?=
 =?utf-8?B?VlJ0Yll4QVd6d2djeHErUUI4ekxkdUx1N0puV0Q5aGJDZS9GYlVOZE5CVU92?=
 =?utf-8?B?N3NFTHNNZmlKbG4zY0RZbUJmQTFCakZGSVNqNDdLa0NhMTExQXVlbnZaNU9P?=
 =?utf-8?B?d0pYSXZ3SGhydGVDLzg2QUYyWmU1RERKelhnZ1VaTEROV2d6RHhXRjVwdWdC?=
 =?utf-8?B?VHUzcElraHY3ZlhDSzJpdEtLQ09MRUQxTWs4Z2xIdmNXdkVRV2RTeUQ0SzZs?=
 =?utf-8?B?SG02MGpPRDBya05wY3BPdUpjQ29aZTlUZyt3NTdMZUh4NjRjWkx4UmJhUWU5?=
 =?utf-8?B?VWZYVEJvZktjTU5NdUVlS3hMcDkxSlNlT3hFcjZMYi90d3BTLy9pWUczVWs0?=
 =?utf-8?B?NEUrdklScmlDdmNuNUNMVjkrVTRqZFlsQWdhQmYzV3JJMlUxRDlvSmpXd0N4?=
 =?utf-8?B?bE44WnBmRVZiVDdUV3B5YWdTNENGR0tVczJIRC9pN2hpY1hBc1BYc2d3VS9a?=
 =?utf-8?B?Y04zNEs5TjJMVWc0RytUbUhCME5mcmNiT1diaVBoMlg1b1FBMFhJREpoemFi?=
 =?utf-8?B?d0duMzVlaEU2R29pa0JHNVFaazZqbFhuUjZ6d1htMUlLdDNzUkNjRHlzZVdV?=
 =?utf-8?B?RE5KNklzN2ZnaFRiQUFjZEVTL01XRmRFOXBja2RLaHR4dHJTeExEenZiQmJp?=
 =?utf-8?B?ODFJQ3crRFVCeXZBU2ozSTdmbCs5T3lOeUhNdFhNUGdxZGZQZlNZVWhSQzRz?=
 =?utf-8?B?cVJtZjFUQTQxY29WaHlBV0pvKytnT2w0eTIwelFWSjVvczJscHZxeCtENTdn?=
 =?utf-8?B?bGFXQmcrbk5vT2NQYjhBYVh0Y2RrS0NqbmZTR3VKeTMvbVpFOTdDOVFDN3ow?=
 =?utf-8?B?dHRmZDRabTM1RnVwQm1OMUYwUGNPVk95MEIzbUoxeS8wbWtINjV5WVJER2Jr?=
 =?utf-8?B?ME9RVHpyUFdvTzJuRElIdElqc3Y4dFp0YytQbW1hck1PbHltOWdiYytKb09t?=
 =?utf-8?B?SW5TWjZxRW9STGE1NitwSmZMajFORGFuMHJWcU9RR3dpN05xbVIyRlg2WVU1?=
 =?utf-8?B?TENFMUt4MFU4RTdWZnRDZ2IvU0U3bGlpaUY1SHIyNUl2eDEyMGhFbS9FZ1B0?=
 =?utf-8?B?d2hzaXlVVEd6YjJjSjlYMmdMaytGK3Z6NDlqZnVweGsrU29RQlFVdEhsYmpG?=
 =?utf-8?B?aTZiK0g0V2xkMTFQcDN4MWNBcjBPNFZXYzJra3RVc2NoK3QzTGFFdDlPRnhq?=
 =?utf-8?B?V0FiRFErT0toYS9ONmxGWU13OGk0WWFjMFJ5blY5WVYwdUx2eTNEMzg1MFpS?=
 =?utf-8?B?bTFhYVBDTVVXNHkyTHRQV0xKWEt6TEVmU2xDaXVsOG9VL24ydmtseFFDTUxE?=
 =?utf-8?B?ZzZobnRMOGNOczltZ1BjdTNqdkRxYVVabHBRSmdhOUNGTFBSYWIyWkgwOVZ5?=
 =?utf-8?B?Y1h3NXhxU3Q0YitVeE5UZU5NdXcyWXM3MFRyZjRsbGFVbEYwMm55Ym1EQUtU?=
 =?utf-8?B?ZkJLbFhReGxlYkR3K3R1VU5tajBKdkp6MVRMOWdaMjlNQ01sZ3RhczVNSU5L?=
 =?utf-8?B?SjBnNGNrR0ZvZ3duMjhsNW1yTWpYNFRvc004TG8wQmxoWGRqNkl3dEh2ZUxV?=
 =?utf-8?B?SU52L1AycWRXeTg5NG9aL3R0NllzNUwySE1zNE1PcXF2Z2VEQ2FZRHFFM0lv?=
 =?utf-8?B?ci8rdUlGdVVXWkcxWGk4bVZGdWx5amxPZzNPUU9pL1F1bTVpamVEaVg3UTdV?=
 =?utf-8?B?bkFYVnJYMVNtUzRBa0NLVU1CSjc2SWZSSzVrKzdCSXpWbjkyNEdNenBPdUdP?=
 =?utf-8?B?RUc1cS8xdWFiTlBJOW9YdzVleHJPMnY4VWc5US9zaldWL203YUxkbWhPT2xC?=
 =?utf-8?Q?+dfQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6418.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc3500c-3213-4200-417f-08dd86d0ff95
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 03:50:35.5279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V6M71+jnqsQ2g8UndQIO/pUD44kCAvmFbRsPLfeW/rWjvwwX9glEWDW1Y6hzHhF5wj/GX+9FcV9e7vU81cx1TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6375

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb24gSHVudGVyIDxqb25hdGhh
bmhAbnZpZGlhLmNvbT4NCj4gU2VudDogTW9uZGF5LCBBcHJpbCAyOCwgMjAyNSAxMDowNCBQTQ0K
PiBUbzogUm9iZXJ0IExpbiA8cm9iZWxpbkBudmlkaWEuY29tPjsgdGhpZXJyeS5yZWRpbmdAZ21h
aWwuY29tOw0KPiBkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnOyB0Z2x4QGxpbnV0cm9uaXguZGU7
IFBvaHN1biBTdQ0KPiA8cG9oc3Vuc0BudmlkaWEuY29tPg0KPiBDYzogbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtdGVncmFAdmdlci5rZXJuZWwub3JnOyBTdW1pdCBHdXB0YQ0K
PiA8c3VtaXRnQG52aWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMS8zXSBjbG9j
a3NvdXJjZS9kcml2ZXJzL3RpbWVyLXRlZ3JhMTg2OiBhZGQNCj4gV0RJT0NfR0VUVElNRUxFRlQg
c3VwcG9ydA0KPiANCj4gSGkgUm9iZXJ0LA0KPiANCj4gT24gMjEvMDQvMjAyNSAxMTowOCwgUm9i
ZXJ0IExpbiB3cm90ZToNCj4gPiBGcm9tOiBQb2hzdW4gU3UgPHBvaHN1bnNAbnZpZGlhLmNvbT4N
Cj4gPg0KPiA+IFRoaXMgY2hhbmdlIGFkZHMgc3VwcG9ydCBmb3IgV0RJT0NfR0VUVElNRUxFRlQg
c28gdXNlcnNwYWNlIHByb2dyYW1zDQo+ID4gY2FuIGdldCB0aGUgbnVtYmVyIG9mIHNlY29uZHMg
YmVmb3JlIHN5c3RlbSByZXNldCBieSB0aGUgd2F0Y2hkb2cNCj4gPiB0aW1lciB2aWEgaW9jdGwu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQb2hzdW4gU3UgPHBvaHN1bnNAbnZpZGlhLmNvbT4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgTGluIDxyb2JlbGluQG52aWRpYS5jb20+DQo+ID4g
LS0tDQo+ID4gICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXRlZ3JhMTg2LmMgfCA1OA0KPiAr
KysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNTcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xvY2tzb3VyY2UvdGltZXItdGVncmExODYuYw0KPiA+IGIvZHJpdmVycy9jbG9ja3NvdXJjZS90
aW1lci10ZWdyYTE4Ni5jDQo+ID4gaW5kZXggZWE3NDI4ODllZTA2Li41NmQwOGJmMWI2YjAgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci10ZWdyYTE4Ni5jDQo+ID4g
KysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci10ZWdyYTE4Ni5jDQo+ID4gQEAgLTEsOCAr
MSw5IEBADQo+ID4gICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+
ID4gICAvKg0KPiA+IC0gKiBDb3B5cmlnaHQgKGMpIDIwMTktMjAyMCBOVklESUEgQ29ycG9yYXRp
b24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuDQo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAxOS0yMDI1
IE5WSURJQSBDb3Jwb3JhdGlvbi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4gPiAgICAqLw0KPiA+
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4
L2Nsb2Nrc291cmNlLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gICAj
aW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+ID4gQEAgLTMwLDYgKzMxLDcgQEANCj4gPg0K
PiA+ICAgI2RlZmluZSBUTVJTUiAweDAwNA0KPiA+ICAgI2RlZmluZSAgVE1SU1JfSU5UUl9DTFIg
QklUKDMwKQ0KPiA+ICsjZGVmaW5lICBUTVJTUl9QQ1YgR0VOTUFTSygyOCwgMCkNCj4gPg0KPiA+
ICAgI2RlZmluZSBUTVJDU1NSIDB4MDA4DQo+ID4gICAjZGVmaW5lICBUTVJDU1NSX1NSQ19VU0VD
ICgwIDw8IDApDQo+ID4gQEAgLTQ2LDYgKzQ4LDkgQEANCj4gPiAgICNkZWZpbmUgIFdEVENSX1RJ
TUVSX1NPVVJDRV9NQVNLIDB4Zg0KPiA+ICAgI2RlZmluZSAgV0RUQ1JfVElNRVJfU09VUkNFKHgp
ICgoeCkgJiAweGYpDQo+ID4NCj4gPiArI2RlZmluZSBXRFRTUiAweDAwNA0KPiA+ICsjZGVmaW5l
ICBXRFRTUl9DVVJSRU5UX0VYUElSQVRJT05fQ09VTlQgR0VOTUFTSygxNCwgMTIpDQo+ID4gKw0K
PiA+ICAgI2RlZmluZSBXRFRDTURSIDB4MDA4DQo+ID4gICAjZGVmaW5lICBXRFRDTURSX0RJU0FC
TEVfQ09VTlRFUiBCSVQoMSkNCj4gPiAgICNkZWZpbmUgIFdEVENNRFJfU1RBUlRfQ09VTlRFUiBC
SVQoMCkgQEAgLTIzNSwxMiArMjQwLDYzIEBADQo+IHN0YXRpYw0KPiA+IGludCB0ZWdyYTE4Nl93
ZHRfc2V0X3RpbWVvdXQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RkLA0KPiA+ICAgCXJldHVy
biAwOw0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgdGVncmExODZfd2R0
X2dldF90aW1lbGVmdChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlDQo+ID4gKyp3ZGQpIHsNCj4gPiAr
CXN0cnVjdCB0ZWdyYTE4Nl93ZHQgKndkdCA9IHRvX3RlZ3JhMTg2X3dkdCh3ZGQpOw0KPiA+ICsJ
dTMyIHRpbWVsZWZ0LCBleHBpcmF0aW9uLCB2YWw7DQo+ID4gKw0KPiA+ICsJaWYgKCF3YXRjaGRv
Z19hY3RpdmUoJndkdC0+YmFzZSkpIHsNCj4gPiArCQkvKiByZXR1cm4gemVybyBpZiB0aGUgd2F0
Y2hkb2cgdGltZXIgaXMgbm90IGFjdGl2YXRlZC4gKi8NCj4gPiArCQlyZXR1cm4gMDsNCj4gPiAr
CX0NCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJICogUmVzZXQgb2NjdXJzIG9uIHRoZSBmaWZ0aCBl
eHBpcmF0aW9uIG9mIHRoZQ0KPiA+ICsJICogd2F0Y2hkb2cgdGltZXIgYW5kIHNvIHdoZW4gdGhl
IHdhdGNoZG9nIHRpbWVyIGlzIGNvbmZpZ3VyZWQsDQo+ID4gKwkgKiB0aGUgYWN0dWFsIHZhbHVl
IHByb2dyYW1tZWQgaW50byB0aGUgY291bnRlciBpcyAxLzUgb2YgdGhlDQo+ID4gKwkgKiB0aW1l
b3V0IHZhbHVlLiBPbmNlIHRoZSBjb3VudGVyIHJlYWNoZXMgMCwgZXhwaXJhdGlvbiBjb3VudA0K
PiA+ICsJICogd2lsbCBiZSBpbmNyZWFzZWQgYnkgMSBhbmQgdGhlIGRvd24gY291bnRlciByZXN0
YXJ0cy4NCj4gPiArCSAqIEhlbmNlIHRvIGdldCB0aGUgdGltZSBsZWZ0IGJlZm9yZSBzeXN0ZW0g
cmVzZXQgd2UgbXVzdA0KPiA+ICsJICogY29tYmluZSAyIHBhcnRzOg0KPiA+ICsJICogMS4gdmFs
dWUgb2YgdGhlIGN1cnJlbnQgZG93biBjb3VudGVyDQo+ID4gKwkgKiAyLiAobnVtYmVyIG9mIGNv
dW50ZXIgZXhwaXJhdGlvbnMgcmVtYWluaW5nKSAqICh0aW1lb3V0LzUpDQo+ID4gKwkgKi8NCj4g
PiArDQo+ID4gKwkvKiBHZXQgdGhlIGN1cnJlbnQgbnVtYmVyIG9mIGNvdW50ZXIgZXhwaXJhdGlv
bnMuIFNob3VsZCBiZSBhDQo+ID4gKwkgKiB2YWx1ZSBiZXR3ZWVuIDAgYW5kIDQNCj4gPiArCSAq
Lw0KPiA+ICsJdmFsID0gcmVhZGxfcmVsYXhlZCh3ZHQtPnJlZ3MgKyBXRFRTUik7DQo+ID4gKwll
eHBpcmF0aW9uID0gRklFTERfR0VUKFdEVFNSX0NVUlJFTlRfRVhQSVJBVElPTl9DT1VOVCwgdmFs
KTsNCj4gPiArCWlmIChXQVJOX09OKGV4cGlyYXRpb24gPiA0KSkNCj4gPiArICAgICAgICAgICAg
IHJldHVybiAwOw0KPiA+ICsNCj4gPiArCS8qIEdldCB0aGUgY3VycmVudCBjb3VudGVyIHZhbHVl
IGluIG1pY3Jvc2Vjb25kLg0KPiA+ICsJICovDQo+ID4gKwl2YWwgPSByZWFkbF9yZWxheGVkKHdk
dC0+dG1yLT5yZWdzICsgVE1SU1IpOw0KPiA+ICsJdGltZWxlZnQgPSBGSUVMRF9HRVQoVE1SU1Jf
UENWLCB2YWwpOw0KPiANCj4gU28gdGhpcyB2YWx1ZSBpcyBpbiBtaWNyb3NlY29uZHMuDQo+IA0K
PiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBDYWxjdWxhdGUgdGhlIHRpbWUgcmVtYWluaW5nIGJ5
IGFkZGluZyB0aGUgdGltZSBmb3IgdGhlDQo+ID4gKwkgKiBjb3VudGVyIHZhbHVlIHRvIHRoZSB0
aW1lIG9mIHRoZSBjb3VudGVyIGV4cGlyYXRpb25zIHRoYXQNCj4gPiArCSAqIHJlbWFpbi4gRG8g
dGhlIG11bHRpcGxpY2F0aW9uIGZpcnN0IG9uIHB1cnBvc2UganVzdCB0byBrZWVwDQo+ID4gKwkg
KiB0aGUgcHJlY2lzaW9uIGR1ZSB0byB0aGUgaW50ZWdlciBkaXZpc2lvbi4NCj4gPiArCSAqLw0K
PiA+ICsJdGltZWxlZnQgKz0gd2R0LT5iYXNlLnRpbWVvdXQgKiAoNCAtIGV4cGlyYXRpb24pIC8g
NTsNCj4gDQo+IEhvd2V2ZXIsIHdkdC0+YmFzZS50aW1lb3V0IGlzIGluIHNlY29uZHMuIFNvIEkg
ZG9uJ3QgdGhpbmsgd2UgY2FuIHNpbXBseSBhZGQNCj4gdGhpcy4gRG9uJ3Qgd2UgbmVlZCB0byAu
Li4NCj4gDQo+IHRpbWVsZWZ0ICs9ICh3ZHQtPmJhc2UudGltZW91dCAqIFVTRUNfUEVSX1NFQyAq
ICg0IC0gZXhwaXJhdGlvbikpIC8gNTsNCj4gDQoNCllvdSBhcmUgcmlnaHQuIEFzIHdhdGNoZG9n
IHRpbWVyIGNhbiBzdGlsbCBiZSB0cmlnZ2VyZWQgYXQgdGhlIHJpZ2h0IHRpbWUsIGV2ZW4gaWYg
Z2V0X3RpbWVsZWZ0IGNhbGxiYWNrIHJldHVybiB0aGUgaW5hY2N1cmF0ZSB2YWx1ZSwgSSB0aG91
Z2h0IG15IGNoYW5nZSBpcyBmaW5lLiBCdXQgaXQgdHVybnMgb3V0IGdldF90aW1lbGVmdCBpcyBp
bmRlcGVuZGVudCB0byB0aGlzLg0KDQpJJ2xsIGZpeCBhbmQgdmFsaWRhdGUgdGhpcyBjYXJlZnVs
bHkuDQoNCj4gR2l2ZW4gdGhhdCB0aGlzIGNvdWxkIGJlIHF1aXRlIGEgYmlnIG51bWJlciwgd2Ug
cHJvYmFibHkgd2FudCB0byBtYWtlDQo+IHRpbWVsZWZ0IGEgNjQtYml0IHR5cGUgdG9vLiBTbyB3
ZSBtYXkgd2FudCB0byBkZWZpbmUgYSAndTY0IHRpbWVsZWZ0X3VzZWNzJw0KPiBhbmQgJ3UzMiB0
aW1lbGVmdF9zZWNzJyB0aGF0IHdlIHJldHVybi4NCj4gDQoNCldlIGNhbiBkbyB0aGlzLg0KDQo+
IEpvbg0KPiANCj4gLS0NCj4gbnZwdWJsaWMNCg0K
