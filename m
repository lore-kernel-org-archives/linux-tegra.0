Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010034.outbound.protection.outlook.com [52.101.193.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2051DF755;
	Tue, 10 Feb 2026 17:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770745347; cv=fail; b=fv5bvhUoSNl9lyZbuIBEJDArfumH9UK9fvG8Vv7NBkAucDGr/caq5ibr1oHpRi84t4noQFHoGi/CiHyS5UXkSgWOcaNXuNKtQ/TLVZVKN0X+bee+Dp976eCxEi+RZ+WxpZqePnfWSalAEwGS7rrDTyDVfQ/R1Z1DUC3B+mx1Xfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770745347; c=relaxed/simple;
	bh=ViAa6KRIGdb/hULsna+5+M8gftGtuhNm2YO5hPhBIpg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D7scB14AFaDTkgie4jpHvoDZd2dN7cw6G//V8/aJjzq75G3RU5JSi7zfW+l0j1651ddM9K62QJbXOmBYILOsaX5hfRdSnUgP164d4/f1lKHEXzuW9FWVeCTd4PPYrlb18Jq/xwoShEuTFWXEZGyFrLccsmD6CA4dup3mhegYA3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tbmfdkyV; arc=fail smtp.client-ip=52.101.193.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tbmfdkyV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TU1rrePBOLOet78ic2ox+5ua4/e8E4SiyAVUazzanlq+B6CKyUUjyov9DjI1m5Vgv2oIzRv4hFkJPk6YHMUKFTHWGTq4SdVcZlN8zWBz+sG6o74yWaNX9dY55qowE/3rax6zeYaLjvUVmnZShm0mV+ant7p2D/yUOAzXFs7DccPbHgGNo3xBa08SmmdbtyVOactbugAIRGhvuBucZ/tJyKjndf9WD0TO/mYc+HzdImAlR5OHBsxS3eF58mclXr4Vp3HhqYhmZRJwJXAVpiAwB25xZ4u9ZBEvLFUycIr44P02jqjoExZCtnP62Pc7H1PysQUPziNSHgG9D83HxNvCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViAa6KRIGdb/hULsna+5+M8gftGtuhNm2YO5hPhBIpg=;
 b=TOd4P2Brmmv8pCAWi1FHuTE2xNVBFto2rN7Fn5KzP6CjHDQDkcyo32em8IGN73YydQVHSlByjjR35ioorFESgWQ9WcD02HKks4Y2uGWuFShm5+PFuWzLNtTr4F0WjgzzY1zcSHRVhAEMtwKT1ScLZjouuebEp/Fd2X93+Ji7wn16v+vSEzmr9pY8ZUHHqUYnjN1pFiEI/WuXQqmlaJMVuoUS17s8YiEpjRcYdtqsBCTr4X5GJDcxCGA8k69vO3gLJMEGWULFkny7QSGRP7+qlVONU4+5egjE1zUhW5XDxraMrt0TkPrAwjW4XsCGQ3y0u/ZnWnaCTi5zoWRgH+81ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViAa6KRIGdb/hULsna+5+M8gftGtuhNm2YO5hPhBIpg=;
 b=tbmfdkyVxaR/ryR8y/l6GETpKKstei0TgWN1Rb7fYbU5rZCzNaMk99egNAM4wNxxigRAnrwbrKXVo9xCXi+g/5bn4UYt4tQfRcwU9PHdaUMtnN7J7MOgdVjIufNU6ebA581ba3Cv9Tb46YqMHhuozxIIzsGQWzEpAUuH3xOJsr4JQ4a92ntnGtJb0FoT2aR17ueM89uYYDbs2QECEMT0QqfuGbcvpGasg1nH2ls+EJhe+Tq1rSxigJ+SOgitvWG6GqHGhMqyXKZj9hn6gu9YxTui5/CCmdTO+YqfWf48CMdgyWFZafZKBQJ9nGC7AIGphq9ZVPOzjReCwCa9fz4Oqw==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by DS7PR12MB6047.namprd12.prod.outlook.com (2603:10b6:8:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 17:42:12 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::a3fc:754b:9159:b13c]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::a3fc:754b:9159:b13c%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 17:42:11 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "will@kernel.org"
	<will@kernel.org>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, Sean Kelley <skelley@nvidia.com>, Yifei
 Wan <YWan@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Nirmoy Das
	<nirmoyd@nvidia.com>
Subject: RE: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
Thread-Topic: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
Thread-Index: AQHcju93VIQS/+1NU0G/as/VUXiQ2LV4u1GAgANz/3CAAAOwgIAAFkog
Date: Tue, 10 Feb 2026 17:42:11 +0000
Message-ID:
 <SJ0PR12MB56763B5860CE8E93BEB4FF49A062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com>
 <20260126181155.2776097-9-bwicaksono@nvidia.com>
 <a3249d0f-17f2-496d-ad53-95ad5da26f5a@kernel.org>
 <SJ0PR12MB56762714BF94D1E67511C43DA062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <bd69c94c-51d0-4166-a059-e46b30cb83e0@kernel.org>
In-Reply-To: <bd69c94c-51d0-4166-a059-e46b30cb83e0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|DS7PR12MB6047:EE_
x-ms-office365-filtering-correlation-id: bfecb627-4f70-418f-9d6a-08de68cbb89d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?L3VSdkRXanZabmZoVjk4Y2pyekdGakRhVzBHYTFYejNtWEdMZHY5b3FQZ0N1?=
 =?utf-8?B?WEcvVVJ3cExIUFVVTW1KUUV1QVhWT1ZxOUhsYWczR0JrRFJWVlI3TUhuL21L?=
 =?utf-8?B?Q0U3ZlpoanNMOHB3cTEyalM3RmVTdk94Z3k4VGUxQTFBRmtWMUJZUjdBZEVL?=
 =?utf-8?B?eFJkV2JMaXVDVWhrdXZLazREQSt6MFNQT3NBODFhbXo5T2premFqY1hacGpj?=
 =?utf-8?B?eXlFRzBWTDcydU5TUlpzeC9WN2l5VjdGMHIwd0NMSlJQZEowYzNNMzlycVRz?=
 =?utf-8?B?YXNSc2pxdHZOc3pYdXlWUFJqQ3V1aW9MWjNJN2daQUMwaDNIMHBQTktiYVU1?=
 =?utf-8?B?eU02bldVVU8xOC9Idk5odlBvYmhjVTA0TERESFNEOWdSMTdOaGZjQjZNUjR0?=
 =?utf-8?B?RU5qay83WXlwZXJ3bGpkZjRGbngrYmZzNHU2cVJoS1NRYVQyRWtVcThZU0VH?=
 =?utf-8?B?QlcwRklIckIrRjlyeEc3bmVjSytiZS91Qm5kY3luY2x1eTRBTS9pMWxoWkZ3?=
 =?utf-8?B?TnNVaUpueWJlZWdUVEJheDdpdXorS1VkdllFV3cxVi9SS3paa1ZoNWZsbW82?=
 =?utf-8?B?SjRLWXFJeFJxVW5aS2dHa2JEN1V1UVhNekQ1N004MTdQQXlHVGlkZjRXRzlL?=
 =?utf-8?B?dm9aMHFVWk5DaFM2TlJJNTlla3lWRmY5WUt2M08wSi94VVQ4VW5wM25NTHdO?=
 =?utf-8?B?VER1TTRMdWJCWDA3NGcyVkl1VnhMa1lPdjNlZnF6cXBybGluTzIxZVUrdktu?=
 =?utf-8?B?Y29RWlpMaXEzMFl2N21rSS9Nc0JRWlp1K0p2M0lxRmFMVEgyekRNdEw1SWh5?=
 =?utf-8?B?RkZOVVlVODJQa3ZWUXlrRVNmSHJOWG9velZDbWZSRjlwZWIzeVRieVZEd3V4?=
 =?utf-8?B?TG5oSXh3dmY4U2VXOGhycURnN1pGRGt3cDgzZURMMVNKUnFIY25iSkkwOTZN?=
 =?utf-8?B?NUM1YmIzbU5NbU5maTU0S0dHa2NDSmd3YUlndkhuRzUyc0NSVzF6UFZWV21s?=
 =?utf-8?B?bTRKS1d1aUl6RUZaaTdzVTRKSVN1NjI1VGlnanppeHVubHB2SC9lc2FCaW5E?=
 =?utf-8?B?eEJWSXJ3L2VvNFAvUTVGOGwzRk5FOXZNYnQ4ZW5pVFZTWUVZS3RYWDRmNlZm?=
 =?utf-8?B?REpwY2JIRXVsYnpKeGsvN0ZyaGxCQlEzcVNnRFN0Y1d6elVkZk0vSDNhbW9v?=
 =?utf-8?B?YVdKT21aVUlhZi96dU1meFhxZ0ZWdlhpMzVZV3dEM1BrUWhrQmVUREJFSHZw?=
 =?utf-8?B?a1hjUnZOSGdIYXNpRjVxSFpmUXJnMDZMR01MZng3ajFUUjJSeDBFTHQ0TnRm?=
 =?utf-8?B?a01ZenlwYWs3VEdRMW16R1JRSTI4U1VEb1lWeGpuSkowSDltMW55azBYenh5?=
 =?utf-8?B?UXlvTlpXVzMvaksyVUt2cEhRTmJURnVHRmJuMXpIUGVVWG5YcTU1MStlSVUw?=
 =?utf-8?B?WTB1cHQ2WXliNkFUQ2NBNHQ0SGhRbDd2TkdFaHpRblplTEsxNnB1NFU0T2hG?=
 =?utf-8?B?NmRGcVJod1ljUlRTZ1VVVktRNXlBSE5EcUJvR2QvNFZGeWIwaTc1cWlWd0dL?=
 =?utf-8?B?UEwxSldPczhXZ0k4aXJMVm1EbW96dDZhRDU1ajFDVnZZTkYwZHJ6TTlSa3lO?=
 =?utf-8?B?MjVUWXFYejhkSWI5V3pOSDRYckN6SDlHNGNnTmJrdWtQM1RoU3NobzY2dTNy?=
 =?utf-8?B?akpwKzN1Vm84Ym05ZEVjeFdoVWU4YnpyRk01RUUxczcvN3ZlSGYzTnE2V2w0?=
 =?utf-8?B?c0dzd3YxZjVqSzZ0bGJiaTVuVEFKRmNMSVI2a0FhT090UnNNQ2NLTGlxbTB5?=
 =?utf-8?B?YkQySkw2RGZWUXZzZythVlNCU29PaTFOQ0xDL3hNd3ROT1k2TU5YcVhHMnEy?=
 =?utf-8?B?RldXbTgraGNBbWRDODlQS1cxWGhWU2RBdEdYK2ZiZWZ5c241NHJCeUJodTB5?=
 =?utf-8?B?dThVN2I3VmJaQlRnNjFsOVFtRFRDdHRkWnhmVFErakczMDc2TEtZckVaQWJj?=
 =?utf-8?B?NWJLV21SdFpGUlpLamtyZ2lyVS9FeVJHVU5qaVVQM0h0cDAveG8vY2E4c0xH?=
 =?utf-8?B?Skpxa0QzVkQ0KzNqWjZMYVJjWkR6RVVtbkgwNmRRRGFwL3JKUEE3NGxMNFBo?=
 =?utf-8?B?aHFWR1dqVWl6ODY2Y2xCSFJvSkRCSzVPSGFlUlRoVzBTcjQrUi9FZjdGOG44?=
 =?utf-8?Q?R4J2UaBfHXbb9OrvOTU0s+E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnZnSVhzbkpNV01TbGdZa3Yxb3U2dXpsRXN0WlI2dDh5UVdBdXIrd1FkQnFT?=
 =?utf-8?B?eUIxYVdKcWVmbVkyOVRkUjJkN2o4SjlUQlE1eExxQVJwZ216TFhzK1ZHbHlZ?=
 =?utf-8?B?R3VFa1RxUlhXOC91SjVQd0JUZ0o3VFJmd202WjF0dkc1b1ZBTy92NEtRM3Ra?=
 =?utf-8?B?anBLUS91b2p1eHRrbjhsZ0w4ZkVhNkVGT1o0SDV4aTIzNmhsM3pPVFFSUTUx?=
 =?utf-8?B?eWFJWlh0cE8wU29oWE5HaHJSMHFyeEFhQVVSYng2NmVybFNRYmVNdkpOdjFK?=
 =?utf-8?B?SmtTZFhPemZHSmdHbjgvaVJydTVCTXhVTGs1VVdDU2Y0TmU0SkF4em5XSG1F?=
 =?utf-8?B?aGl0K0lTQTlQNmtSUUxuWXlhdlRvc1BoZFVDekY3RjBGc1pZT3hsZ1huNFdt?=
 =?utf-8?B?STRKUDVJWHliTlRhU2JMNXduZDFUK0d0RjIxa1lPUi92NjVRL0RMSnVSN213?=
 =?utf-8?B?Q0tXN3ZGZ2pwN2gxekdFYzZtMi8yQmh0ZTdpU2M5N1JKSU1jbDA3VUE1VnJE?=
 =?utf-8?B?anN4em53UWpyVGNJWWxoUEQ4Ty9VV1daaGtXc0k4UytCeVBZanFZcGRJUkV3?=
 =?utf-8?B?ekExU3pJR082NmdCNUxHNjVGdkdTajJIRkRLZXdLcGYvSk1Gb0tkaUt4cS9z?=
 =?utf-8?B?Ykd4Y2t4TXI0TCtGNWpVZWZ4WlNHeGZNUm5Tb1lyclQzR2J5bFZFL0daaTZM?=
 =?utf-8?B?dHhZZHF5VUR5bGtPUTZ6a3VLc3pUV3N1YS9hZHlhTkZGQWxvYTkwQUFXZlR4?=
 =?utf-8?B?NGptc3E0aVNCR1lwYXQyMzJlWFJhb3g5Ym1TeHFvWkttYUpGNWdoUWdZU2JQ?=
 =?utf-8?B?VHJ0L1Jwd0ZNWW9RdTVnckN2K2JTbjAvMk5tMHo4N1NyUXJEcDBmZm1NQ0N5?=
 =?utf-8?B?VXVUZjEyMGNoWDg5WCtPT0VhTGdrOWZmSmRvZ1VUQ1llaVIwK3RwaFB3ZGZL?=
 =?utf-8?B?MGtCVFFIWS9uZEJOa05KeFFmV3BqNkJZZGhuUmpVK0YxS3UwdXEyYWVwUzZ3?=
 =?utf-8?B?L1p1N0EwVnZTQjJQb3BneHZrY3pkOWs0bXhZeCtEMmtQcVVsK091Z1d5L3ZV?=
 =?utf-8?B?QUFKMncvY1JOVWdkeE5kaEI1YkwvVFE0TFZHN252WG1VdjkrN3RNK0xzY2Nq?=
 =?utf-8?B?aS9WdXE0Q1NWbDlTV0hEOTEzUG0rWm5JdC80Y255Q0Y0SGpUQWM5cTQ5eVd4?=
 =?utf-8?B?YW9wMzNCVGsvaEhvQWszVTlQSVppZDBIT2t4RkxFemRpRFMrcWJaZnVXWnRt?=
 =?utf-8?B?QnhqYVIyNGZjTzNFT0hncUxCSGQ5WGVibDNUeStDWTBWcFhCSDZiU0dwekE3?=
 =?utf-8?B?WndJSVY5aHFrME9KbWxQWmtZTEE1S0pUbnUyRUhxdnkybVRiTW5BVlA5WWFI?=
 =?utf-8?B?a2IvTHlPbEFCMnQ1ZXBMbWcrQjNFSWluY3RkQWRQOEN1RXZUV2JXdkJkR2Qz?=
 =?utf-8?B?Q3pvVnZleU9LbVA2VU1oaWtqZFZIZE9UOFNtVUtNUGVnVDVCcW12bFpmUEwr?=
 =?utf-8?B?SEpScDJENXpmcEw5MTFNU05wcUJmeWx6RkNNZ1QwT1NwVlBlbUZ3bVdycVUx?=
 =?utf-8?B?QjJXMlc3ZEo0bit6UEl0WUdHQ3pJRkJuZ05JZnVlTUxNdm9ncEpVMnYyZ1FU?=
 =?utf-8?B?QWhkWDAzTnlrVm1xSWd1TnBNbDJuam11OUZ5SkxsQUhNM1JuYjVISmdqYXg0?=
 =?utf-8?B?WXY5SzcrWnAwTkNXbU9Fa0doSkxZVEhOY1R6cjBIUEdOV3BXWjlkVjBGdHJT?=
 =?utf-8?B?MTNXa3dFTEY5VVg3ZnplZndWTVFKSGN0bkdhL2FKQVlYTTF1NDd2OVFGeWxn?=
 =?utf-8?B?ZWUxbU1XSjkvR3BNTURKN1Rzb3lzQm84ZDg2VFcrSXJwdlU2cHp3TThwem5L?=
 =?utf-8?B?TUtnc2xzcXRVRXlqaDVkNHY4cXJQbWZBZStwb1dYeXVMMC92ZTVmbW5vM3U1?=
 =?utf-8?B?S3p0V3BvS2ZpMnQzS1FtTXZZY1Y4Zy9jRmxVSVBYT0hXaEtFZEhNUzlyeTJL?=
 =?utf-8?B?Y1dDcHlFenROeFI0OWhjeHZaSTdlcUJQZW9zY0pWRTRDWG8vVm5tOWF0UVFM?=
 =?utf-8?B?dkhqK00vbXQ3d09TS0NVaW5haUt4UURQWmlzUEMzaVV5d21KVkVhOXR5UmN3?=
 =?utf-8?B?SFViNWZLS1lLSmRkUFhGOHp5K2JRRUNRUDhaNmx2L0FUcWFHTlExa2VlRzN1?=
 =?utf-8?B?aktoSkRhcDlDYXlpTExNU1FqZnp3UWdSdkZFUW10L2Z4OTl5SWhML0laOCtR?=
 =?utf-8?B?VTJhN0NodnFTTld3U2J6WXBIbVlqNCtsQkNsNmpmWnFJaGpTaGszZThLbUZS?=
 =?utf-8?B?anp1dHZvcUJyV2hSTnJiRnVOcSt5MFluUmsrUVpWbXhlOVE2ZXovUT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5676.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfecb627-4f70-418f-9d6a-08de68cbb89d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 17:42:11.7183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s3i/tVhafnnWJ8CuO9IWIQ5oPgPCru9SGYoW4ufxquywEB0CzBVw2TqgZ5DkjgWBjfPCaKIkCYbTRp4RP4u4SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6047

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMCwgMjAy
NiAxMDoxNSBBTQ0KPiBUbzogQmVzYXIgV2ljYWtzb25vIDxid2ljYWtzb25vQG52aWRpYS5jb20+
OyB3aWxsQGtlcm5lbC5vcmc7DQo+IHN1enVraS5wb3Vsb3NlQGFybS5jb207IHJvYmluLm11cnBo
eUBhcm0uY29tOw0KPiBpbGtrYUBvcy5hbXBlcmVjb21wdXRpbmcuY29tDQo+IENjOiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LQ0KPiB0ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29t
OyBUaGllcnJ5IFJlZGluZw0KPiA8dHJlZGluZ0BudmlkaWEuY29tPjsgSm9uIEh1bnRlciA8am9u
YXRoYW5oQG52aWRpYS5jb20+OyBWaWtyYW0gU2V0aGkNCj4gPHZzZXRoaUBudmlkaWEuY29tPjsg
UmljaCBXaWxleSA8cndpbGV5QG52aWRpYS5jb20+OyBTaGFua2VyIERvbnRoaW5lbmkNCj4gPHNk
b250aGluZW5pQG52aWRpYS5jb20+OyBTZWFuIEtlbGxleSA8c2tlbGxleUBudmlkaWEuY29tPjsg
WWlmZWkgV2FuDQo+IDxZV2FuQG52aWRpYS5jb20+OyBNYXR0IE9jaHMgPG1vY2hzQG52aWRpYS5j
b20+OyBOaXJtb3kgRGFzDQo+IDxuaXJtb3lkQG52aWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggOC84XSBhcm02NDogZGVmY29uZmlnOiBFbmFibGUgTlZJRElBIFRFR1JBNDEwIFBNVQ0K
PiANCj4gRXh0ZXJuYWwgZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNo
bWVudHMNCj4gDQo+IA0KPiBPbiAxMC8wMi8yMDI2IDE3OjA1LCBCZXNhciBXaWNha3Nvbm8gd3Jv
dGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9t
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+ID4+IFNlbnQ6IFN1bmRh
eSwgRmVicnVhcnkgOCwgMjAyNiA1OjE4IEFNDQo+ID4+IFRvOiBCZXNhciBXaWNha3Nvbm8gPGJ3
aWNha3Nvbm9AbnZpZGlhLmNvbT47IHdpbGxAa2VybmVsLm9yZzsNCj4gPj4gc3V6dWtpLnBvdWxv
c2VAYXJtLmNvbTsgcm9iaW4ubXVycGh5QGFybS5jb207DQo+ID4+IGlsa2thQG9zLmFtcGVyZWNv
bXB1dGluZy5jb20NCj4gPj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtDQo+ID4+IHRlZ3JhQHZn
ZXIua2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IFRoaWVycnkgUmVkaW5nDQo+ID4+
IDx0cmVkaW5nQG52aWRpYS5jb20+OyBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT47
IFZpa3JhbSBTZXRoaQ0KPiA+PiA8dnNldGhpQG52aWRpYS5jb20+OyBSaWNoIFdpbGV5IDxyd2ls
ZXlAbnZpZGlhLmNvbT47IFNoYW5rZXINCj4gRG9udGhpbmVuaQ0KPiA+PiA8c2RvbnRoaW5lbmlA
bnZpZGlhLmNvbT47IFNlYW4gS2VsbGV5IDxza2VsbGV5QG52aWRpYS5jb20+OyBZaWZlaSBXYW4N
Cj4gPj4gPHl3YW5AbnZpZGlhLmNvbT47IE1hdHQgT2NocyA8bW9jaHNAbnZpZGlhLmNvbT47IE5p
cm1veSBEYXMNCj4gPj4gPG5pcm1veWRAbnZpZGlhLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQ
QVRDSCA4LzhdIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBOVklESUEgVEVHUkE0MTAgUE1VDQo+
ID4+DQo+ID4+IEV4dGVybmFsIGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0
dGFjaG1lbnRzDQo+ID4+DQo+ID4+DQo+ID4+IE9uIDI2LzAxLzIwMjYgMTk6MTEsIEJlc2FyIFdp
Y2Frc29ubyB3cm90ZToNCj4gPj4+IEVuYWJsZSBkcml2ZXIgZm9yIE5WSURJQSBURUdSQTQxMCBD
TUVNIExhdGVuY3kgYW5kIEMyQyBQTVUgZGV2aWNlLg0KPiA+Pg0KPiA+PiBXaHk/IFdoeSBkbyB3
ZSB3YW50IGl0PyBXaGljaCAqdXBzdHJlYW0gYm9hcmQqIHVzZXMgaXQ/DQo+ID4+DQo+ID4NCj4g
PiBUaGVzZSBhcmUgZm9yIE5WSURJQSBWZXJhIHBsYXRmb3JtIChUZWdyYTQxMCBTb0MpLg0KPiAN
Cj4gVGhlcmUgaXMgbm8gc3VjaCBib2FyZCAoZ2l0IGdyZXApLCBidXQgYW55d2F5LCBkb24ndCBl
eHBsYWluIGl0IHRvIG1lLg0KPiBZb3VyIGNvbW1pdCBzaG91bGQgZXhwbGFpbiBzdWNoIHN0dWZm
Lg0KPiANCg0KVGhpcyBpcyBhIHNlcnZlciBwbGF0Zm9ybS4gVGhlcmUgaXMgbm8gdXBzdHJlYW0g
Ym9hcmQgdXNpbmcgdGhpcyBkZXZpY2UgY3VycmVudGx5Lg0KUGxlYXNlIGxldCBtZSBrbm93IGlm
IHRoZSBwYXRjaCBpcyBhY2NlcHRhYmxlIGFuZCBJIHdpbGwgdXBkYXRlIHRoZSBjb21taXQgbWVz
c2FnZQ0Kd2l0aCBtb3JlIGNsYXJpdHkuIE90aGVyd2lzZSwgSSB3aWxsIGRyb3AgdGhlIHBhdGNo
Lg0KDQpUaGFua3MsDQpCZXNhciANCg==
