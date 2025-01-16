Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1C19539F;
	Thu, 16 Jan 2025 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737033106; cv=fail; b=uQRV0fS8ULEZ+XaZ4cplBQ8Q5lIr9gZP3vS05DEtNMoKOA+TD7obmei1KSkwW8mKtN198dc1pKhF/mKSqjf5xu1QanxmP8iF+E5HvW1EwTNttNf5ui49VxqLQLvgzb4r/ZVMwk5HiOqlW8XA2Dydm09fUIZct8rhhlyBtUnyVsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737033106; c=relaxed/simple;
	bh=GX7N6VvFt4stjaZqe1O420Gy/Zl06aoJWzZjM20pw4I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EIkWqnpyrl9Z5arAJaRlq0IhlQnqHavqQMVMXnWx7BAQ3IZAV+CT0IPqXmmUEIjw/R8xPqqVsZ1guacZnAfTkAZDNzkR+CgDnn1OZVdkvbbSKS2bvNytW7naimlaQ30XiKulUbHNkP4SoBX1+9TqL5pVBhJy208LK/FAwrQ24hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BV4OdCeO; arc=fail smtp.client-ip=40.107.244.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BV4OdCeO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQINT6ipy8ixBXjrixq8aaNg7XTdYJDxpFcderaPQkc3+wQXq3DyCd8pvQyMXWMpHWZErXKyFBQ7591IpyYAet5i2uKCDO5zhDvze1ZxgoVvivK3SFPzqEww5Fq/ggxYcGX4Gr3UxkqXP3dpjiofMFxeHvPOwtgJJr4yb7PfTK0G5jnU0SFmUMvUgsiOXN0l+jWvmfylbBsp36tgP61UOy+JOlo6eEy8Htukww8i91z/LpzhQzrT82e+ZAgYSVvukfEyIQqPjXeIXHPHROvA+olrrC0FhKWe8rTppqxQEVzAtvdtr8EeSx6Ewt9IhF5rmFgPgau8jdfrdjhROnWi5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6z042l/6Dlb6Y0JwAYP2Sfp8d/5g3kD/L+Ux7OdnoA=;
 b=dmtwn3W4lupIQZp6kX/K7LaFE0AuVDsuvGCenjsNmdyEIB09ty2zsJ2WnCAyQ/rU60gglvoprZhKcviCuBpiSObfY3hl3kQGTdmYJTMXoGqsF8Cc9rZ1g/8u+thk/Kz7KrevrX1P/KuYV+VNyRPtL+EMbq+sxldxZbi11VcS9CknzwlFmQmBsdKiinKY0mnEA/rQOEEWh+VaXGCRofp7VZzEpxacr6bWZhbdHRnye9t8GGv7OlX2+E/7kKI3YtwhEqhWKKMMAPkKgJ+CDUtQIZiDfQeLVAzA42ipTu6ECukylTWe+Pj9Xh+6jHdlBXMZRXOsCfg7ovqe8zIpKmXgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6z042l/6Dlb6Y0JwAYP2Sfp8d/5g3kD/L+Ux7OdnoA=;
 b=BV4OdCeO0gLABRMXvGPDjBJuYHDwu4vVlK4UxWo/j7Bk3FF3YswYoiMP5zJfnM5OWDWfGK4zQxQSYqE0XpZHc4Grh1ijPOqQNom6rayq1FZlgtU5XsjS/zBtwp5Fylbx4y6SoL96RFumg0SviVgMqN+E6Bt9A36Yd9+1+2RUebwESZXZtuxbqkMQRDRhU4ukzgChvfL8HGvq1AExtj8gWz5Muve/ybhhY+WdnKtDooKpLm10gf9n2wQx6ScVcJmSdQoTz1J04IorMZkqSmN99n4Me9gvkyfGlxsARubbVnNv0keln4aAnUsfjzkOy/J5H1ImLkvny1KxGvx97r9U8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS0PR12MB8294.namprd12.prod.outlook.com (2603:10b6:8:f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 13:11:42 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:11:42 +0000
Message-ID: <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
Date: Thu, 16 Jan 2025 13:11:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: gadget: u_serial: Disable ep before setting port
 to null to fix the crash caused by port being null
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Prashanth K <quic_prashk@quicinc.com>, "mwalle@kernel.org"
 <mwalle@kernel.org>, "quic_jjohnson@quicinc.com"
 <quic_jjohnson@quicinc.com>, David Brownell <dbrownell@users.sourceforge.net>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource.kernel" <opensource.kernel@vivo.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Brad Griffis <bgriffis@nvidia.com>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0122.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS0PR12MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: c1371a90-9c7c-4654-950a-08dd362f51df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azZPNEpETlhTTUVSV3pqQkdCeDlEbjNWK0RaK1FNamtHeWh6Y2xCRlNyQ3Vn?=
 =?utf-8?B?M3pvTjh2M1RqOGN1aGVNUGxCMjdyd3BMK3h2OXJJNE9PL3BCdzEzWmFOUnMv?=
 =?utf-8?B?YmJ2U2UxM0tMdHNmQ1NmOTZ4eGlUVVNINm5TWGY5QW5ZamtMVlZHazlkeEdk?=
 =?utf-8?B?bjV4MTFCWnBxRStpUXlybFFEK05Xekt1ZFVBZVZVWFUxaWVHWEVLdUNIQ2pM?=
 =?utf-8?B?RkkweFJvUWtDbkxZNHg3ZDd2WTlIeEx1RFZabTBISWxPaG1FMXlwdEYzb1d1?=
 =?utf-8?B?SzRlMkM1d25ielNNNXgyR3hsdzZMM2srbnV6Z1Nya3hzVlFrOGNEdnVlcngr?=
 =?utf-8?B?SmUvYzhtWXc0ZDhaQklQQ3daRW12WDV3MHZkUzZiVTlkeGlka2ZSYkJWdUJO?=
 =?utf-8?B?eGFOb1ZGektoU0ZneFRoQTJ0cmwvK29oMHhTcVJHNUF1SXJ1bFlOTWZYRjdr?=
 =?utf-8?B?UUVMcGF1T2JpMGxWQUNuckcrazJkUk81TURRK3hPZlliWUxja1NxY0h6Tm5D?=
 =?utf-8?B?SmhPVUZoOW1iRXk0TldNMDFpaVNQMktzQjl5L1piRXh5UkRPcnNZNmJiQVF0?=
 =?utf-8?B?RTFTdG9pSHRFeE1oNmtiQnRCU1JaODA1Y2hOMVQvTmZ6QU41dWtPSFZLNkYv?=
 =?utf-8?B?MlBOT3NXb2xtYjRqT2hWNURGd3g4dVByMjZ6bU44UDg1VzluTkxQRnJzQmhH?=
 =?utf-8?B?WVR2MkhmY1BaK1hGTm5kQW5QZjZTWmVjK0JEMmFOODhvUndlQU1FUnNWZjBL?=
 =?utf-8?B?T3IrR3d1ak81a2tCTkNWUWp1cytJQ1YvUkZHMTNqb2ZaOXdOSWZieExmdmpz?=
 =?utf-8?B?bWhSYkVBWWU3Q0FidnUrYWhLa2NvTXBuQ1lHSE0wTjBreGs4WGZHaktRdmt4?=
 =?utf-8?B?ZC9JU2lOVSttUlMyaEN1S0c4bTVRdlo1dUV2dStyUDErcFNqZ3B6NWs3aUp4?=
 =?utf-8?B?Y2k1RHNyR1JtdmVhdmpzR1RVeDM2VVl5UkNyUGlvWE5pYjUzR3Y5ZXVrL1NX?=
 =?utf-8?B?QTUrMUZsQTl4bFg4ZWluNGNHMkN5SmlaakhRN2pJVHBsOHlQSThMcWRuYSt3?=
 =?utf-8?B?SmtqNk1Cbi95aGZSem8yeTNneU1TTTRhRGkrZmpTSi9wdzcyd2RYWmdaMU0x?=
 =?utf-8?B?d2R3QVZqUEtPNG5KcXJoK3lZcWN1cnk0NVNDYWFHZi9VcldITG5vNWNqZit4?=
 =?utf-8?B?ZDRGcXNDUzY0Myt6ZFp4RHBmNTh3TkVLYnNmdGIwMGlJT3JPUCtWS05jbURC?=
 =?utf-8?B?a0NRcmw5SUU5RXQrU3N5ckhPY3VUWHl4VmpwQ2VBTWp5NUhuMXhGOE9udGlH?=
 =?utf-8?B?VGpPMGpvYWVjWGZIU3VFVHZoa0lYWiswYzlnOXRWVmdhMWRrNEp0UG8zS3N4?=
 =?utf-8?B?SWY0cVJWQTdDKzhmZXV5Mjc4WHovVU1GZEYwUmJRSE5PN1FxUjNRM1hvZzJV?=
 =?utf-8?B?aDVlYXFOYndXVWhSUjVpR2FpQUdYZUg0Tmg4WWEvWm4vUWZqRVlTMXZjMXRp?=
 =?utf-8?B?MjZiVFdiUFN1UFkvei9HNXA5VjdTODdLN1JvM2p1TXpIaWtna1h4cGRrUS84?=
 =?utf-8?B?dnVNNU5NU25aa2RxOXl1N3JNQkRqaWcvVU9vRnE4VFQ3NmlDSU8xSVJ5OW8r?=
 =?utf-8?B?SC9NZzI0bkhFN3NvVFpTaEg2QTJUdTZFYmdDaW5yT2hrSGZmRDdkdEZvL2FL?=
 =?utf-8?B?RklXZkpUbjNnMjArTmZ2WTFKMmFHSHIzYUFSZzRsN2VpRi9rVXY1UmVpQmYr?=
 =?utf-8?B?b05QU0xLTUUzM1c3ajJwU2xESG5TSnh0akNIditIOWlBaGZaYmRqNzlVN0F2?=
 =?utf-8?B?RkZKT0pRUk1BVE1XNVp1N2JFM1QySURMVGpRNTBZeXlGYm10dmhyYVkzWTR1?=
 =?utf-8?Q?h1qwK3yuiSay4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHowTlFKMWwxd1RlSFVMUUIya2NBVnRKRVJrSCtlbU5tSjdQUjFEL0FpN3pW?=
 =?utf-8?B?dzBnOFpyVVVkc0VPbkYvYldIZGdoMURuUitGd3hNU0xQQXdNV1ZwRUxsMXoz?=
 =?utf-8?B?Z0k0elBJektySDR2bFJaei9GbUpMdENMbksxa1BJK0FOK0NoTDhranUxZ3FB?=
 =?utf-8?B?OUtJNUlZdEVESU5KeGRJbnkySVJEOFF2dVdyL095NlN0ZXR5eGlQeGNNeEhI?=
 =?utf-8?B?L2dOUmh4SGNIMkJBUC9OK1lQY1dRVEhhZ2kzNklLcGFZUncxTVRyVzRMZzBC?=
 =?utf-8?B?bGRSV01lalE3QndaWk10bExYTlcrZWh4TDMxbWgrbjBuOURkdnpmUFdTaHBB?=
 =?utf-8?B?V3FydGhRVmpsOU53RG9QeW9XNmhZTG0xaW1KMDl5MnRLb3haMzdLeWZmWlR3?=
 =?utf-8?B?UnV5UHY3MjhTcGhvTW1YRm5XMUkvcDgyNTNkbzlzUkRGbW9hd0hwWnhjOVRr?=
 =?utf-8?B?OWh1SU5PYkVQcjJSVHZnUUlpeFRVYzVKeWRSL2JDY2s0aWxXUlE1bFBZaDdH?=
 =?utf-8?B?Ymhxc2pYQW9SNytYY0c1MFZKczhZVERIQnB2KzhmdU9yajZ2ZnQwNWFCSi94?=
 =?utf-8?B?ZUhkVU05Y2hUeFJsejhyWHJxWlFLbm1KUUs4Zk9SeTUwREZ1ZzI3RXVHMURO?=
 =?utf-8?B?VjV1Tkh3b0FzRENkS3poWFZKeFlEc1dqM0ozT0owNk01VEhRc3pwYjhWMFZk?=
 =?utf-8?B?c2JGTkdJcytrQ0U0QzljN2RVM3ZBNjlMMFlZOHNGQ0lZTTV4dGNRYTFHYlRJ?=
 =?utf-8?B?b0ovdzcwTTdTYVVHcDhIaTJxb3Z2bG41QlJmdUZWZVI5Tzc0cUNBYkR2dXFZ?=
 =?utf-8?B?akViaCtOcnNHQmlGcDh3WEZsT0x3eU5haFN5SjhHNGp1L0NiV2J3dTVRcWpM?=
 =?utf-8?B?VERXckQ0dUs5M0tuRWJuVzk4M05mR2pCbWRsekl6WS9Dc0lYakNwZ3dUWlYy?=
 =?utf-8?B?UlQyK3RFUkZQNlMxL3RvZXh1cDltMVhrSCtOdWsxK1NTUVBwUTNHc2lVbkta?=
 =?utf-8?B?aU5nT1psTWZPUlU1cmltKzRsUWJlck90Y2xrU2VvTm5ZTXRuVldYN2pWZjZ4?=
 =?utf-8?B?UDZ2U0pwSVZUQjBNZXg5TmFFZHVka0VlbTd2a3hyMGdFZkR5V0ZDbXNRVXB5?=
 =?utf-8?B?Ry9FY3c4SkxzZWZ0aC94eWVBM0twekVhU3RXOGtnWWFMRjRUQkszUzd3dHp1?=
 =?utf-8?B?dUlBMkdtZmg1dDRqTGNCcjNJWVpPV3l0cmRzK3hSTmsvYnFHZE0rZFVsOFlE?=
 =?utf-8?B?U3VBa05qL0h4aC80bHZtNzQxYXJHQ1VyTmlBM1NyZC9nSjBpYnkvMjFUdWlx?=
 =?utf-8?B?YWdNWVdSNEFFQUdaR0Z5VTJ1S0Y4d2hEeDNnUjBpZG15SjVRbS9aZEh2TjBh?=
 =?utf-8?B?Y2xoR3ZqcGNqeGtLNWd1VjlOeHcwNXk0dlA0dlhsbGdEQ3dhQ2hvd3ppNTFD?=
 =?utf-8?B?ekozbW0wWHA4SXdNODh1ZU41dE1UWGRQQWw1UEdhMCtLU011bENRRUZJUm42?=
 =?utf-8?B?UHVNeWpmaUgvRWlOQUhNN0E3MGZ5QjJJdEExenNvZWM1VUhiY2FMZ3QzRENV?=
 =?utf-8?B?a2pzcmwwSHFjeWFjS1ozeXlVV21pSGpsR2w3dzVMU2JCdnJLNzNaczNnL3o3?=
 =?utf-8?B?NFkwbnkxaDNBZHpmVlBKWjIrV3p2bGlrZ3R5b3JhOHpMSUR4WDlrSHVyVFlN?=
 =?utf-8?B?TzNiUGJjbE1peG9JWFJoR3pidmxWSzBVMUcwY1kzazZpSnVZRUMwelhwTmNW?=
 =?utf-8?B?NVhnQzNta2t5dFlUV0tqMEFyOG5TMFlhS2E0OEVWWHJ2NUhibWtWeURMbUx5?=
 =?utf-8?B?ZjB5bmpsRHpyVnBVQis0U3RYS0l6ZnVDb1RCazc0L0g0SnlNam8rNmpNSnlV?=
 =?utf-8?B?bEpiVHNrNmoralIvYkEzN1ZvaEpvK0RTWCtYV2tUaWpjTlJmekI4NTNzSVZ6?=
 =?utf-8?B?UWZLWGlSM21LbkVIMFUwd0xSU21sazlySlJDRW1lQ0p1cnN5SlVrQTl2bVpL?=
 =?utf-8?B?WHVLTFppWjRnbzFna1V5R0k0S1BvRmtMaW5kZ1Y3ckJiMTVRamZFUWxZWFR4?=
 =?utf-8?B?RHpJeWFCeFZsWUYwUndEcFBaM29teVQ1am8xLzc4NkY4S0VxS3J6Q3g3WCs1?=
 =?utf-8?B?ZERJWVNiYnNmeXBqZkNKLzFMWHVzYjlSU0p3OVlJeWE0UG1WMWVPWUp0YjJt?=
 =?utf-8?B?VzhLUEp0a2dDK3BOdU5zTThwY0dDUnZZRGc1U1hOR1VEeHpRcW9vTkFFeU5N?=
 =?utf-8?B?SFh3NDdSUWw3OFZQK2RIZ3VGOTRRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1371a90-9c7c-4654-950a-08dd362f51df
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:11:42.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP7nroB8a9BHeXe6L8ZrJueA2GyjD77Wn53TjOIkTkFH5nCKcZxs6ULA0J/2zMI5+c3ACtMVFDkt2/NhEC2Mdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8294

Hi Greg, Lianqin,

On 17/12/2024 07:58, 胡连勤 wrote:
> From: Lianqin Hu <hulianqin@vivo.com>
> 
> Considering that in some extreme cases, when performing the
> unbinding operation, gserial_disconnect has cleared gser->ioport,
> which triggers gadget reconfiguration, and then calls gs_read_complete,
> resulting in access to a null pointer. Therefore, ep is disabled before
> gserial_disconnect sets port to null to prevent this from happening.
> 
> Call trace:
>   gs_read_complete+0x58/0x240
>   usb_gadget_giveback_request+0x40/0x160
>   dwc3_remove_requests+0x170/0x484
>   dwc3_ep0_out_start+0xb0/0x1d4
>   __dwc3_gadget_start+0x25c/0x720
>   kretprobe_trampoline.cfi_jt+0x0/0x8
>   kretprobe_trampoline.cfi_jt+0x0/0x8
>   udc_bind_to_driver+0x1d8/0x300
>   usb_gadget_probe_driver+0xa8/0x1dc
>   gadget_dev_desc_UDC_store+0x13c/0x188
>   configfs_write_iter+0x160/0x1f4
>   vfs_write+0x2d0/0x40c
>   ksys_write+0x7c/0xf0
>   __arm64_sys_write+0x20/0x30
>   invoke_syscall+0x60/0x150
>   el0_svc_common+0x8c/0xf8
>   do_el0_svc+0x28/0xa0
>   el0_svc+0x24/0x84
> 
> Fixes: c1dca562be8a ("usb gadget: split out serial core")
> Cc: stable@vger.kernel.org
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> ---
> 
> Changes in v3:
>   - Add --- line above the version tag information
>   - Remove extra blank lines in commit messages
>   - Version tag information from v2 to changes in v2
>   - Link to v2: https://lore.kernel.org/all/TYUPR06MB6217DAA095A9863D4B58D57CD23B2@TYUPR06MB6217.apcprd06.prod.outlook.com/
> 
> Changes in v2:
>   - Remove some address information from patch descriptions
>   - Link to v1: https://lore.kernel.org/all/TYUPR06MB621763AB815989161F4033AFD2762@TYUPR06MB6217.apcprd06.prod.outlook.com/
>   - Link to suggestions: https://lore.kernel.org/all/TYUPR06MB6217DE28012FFEC5E808DD64D2962@TYUPR06MB6217.apcprd06.prod.outlook.com/
> 
>   drivers/usb/gadget/function/u_serial.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index 53d9fc41acc5..bc143a86c2dd 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -1420,6 +1420,10 @@ void gserial_disconnect(struct gserial *gser)
>   	/* REVISIT as above: how best to track this? */
>   	port->port_line_coding = gser->port_line_coding;
>   
> +	/* disable endpoints, aborting down any active I/O */
> +	usb_ep_disable(gser->out);
> +	usb_ep_disable(gser->in);
> +
>   	port->port_usb = NULL;
>   	gser->ioport = NULL;
>   	if (port->port.count > 0) {
> @@ -1431,10 +1435,6 @@ void gserial_disconnect(struct gserial *gser)
>   	spin_unlock(&port->port_lock);
>   	spin_unlock_irqrestore(&serial_port_lock, flags);
>   
> -	/* disable endpoints, aborting down any active I/O */
> -	usb_ep_disable(gser->out);
> -	usb_ep_disable(gser->in);
> -
>   	/* finally, free any unused/unusable I/O buffers */
>   	spin_lock_irqsave(&port->port_lock, flags);
>   	if (port->port.count == 0)


We have observed a reboot regression on Tegra234 (I have not tried other
boards) and bisect is pointing to this commit. Reverting this on top of
mainline is fixing the problem.

With this change, when the board reboots we see ...

[   59.918177] tegra-xudc 3550000.usb: ep 3 disabled
[   59.923097] tegra-xudc 3550000.usb: ep 2 disabled
[   59.927955] tegra-xudc 3550000.usb: ep 5 disabled
[   80.911432] rcu: INFO: rcu_preempt self-detected stall on CPU
[   80.917354] rcu:     6-....: (5248 ticks this GP) idle=ec24/1/0x4000000000000000 softirq=1213/1213 fqs=2623
[   80.927146] rcu:     (t=5253 jiffies g=3781 q=1490 ncpus=12)
[   80.932704] Sending NMI from CPU 6 to CPUs 2:
[   90.981555] CPU: 6 UID: 0 PID: 18 Comm: rcu_exp_gp_kthr Not tainted 6.13.0-rc7-00043-g619f0b6fad52 #1
[   90.981558] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS 00.0.0-dev-main_92e5ae_88fd1_296de 12/16/2024
[   90.981559] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   90.981562] pc : smp_call_function_single+0xdc/0x1a0
[   90.981574] lr : __sync_rcu_exp_select_node_cpus+0x228/0x3c0
[   90.981578] sp : ffff800082eb3cd0
[   90.981579] x29: ffff800082eb3cd0 x28: 0000000000000010 x27: ffff0000802933c0
[   90.981582] x26: ffff0007a8a1d700 x25: ffff800082895500 x24: ffff800080132018
[   90.981584] x23: 0000000000000014 x22: ffff800081fb7700 x21: ffff80008280d970
[   90.981586] x20: 0000000000000feb x19: ffff800082eb3d00 x18: 0000000000000000
[   90.981588] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   90.981590] x14: ffff000080293440 x13: 0000000000000001 x12: 0000000000000000
[   90.981591] x11: ffff800081fb2388 x10: ffff0000802933c0 x9 : 0000000000000001
[   90.981593] x8 : 0000000000000040 x7 : 0000000000017068 x6 : ffff800080132018
[   90.981595] x5 : 0000000000000000 x4 : ffff0007a8a4f9c8 x3 : 0000000000000001
[   90.981597] x2 : 0000000000000000 x1 : ffff0007a8a4f9c0 x0 : 0000000000000004
[   90.981599] Call trace:
[   90.981601]  smp_call_function_single+0xdc/0x1a0 (P)
[   90.981605]  __sync_rcu_exp_select_node_cpus+0x228/0x3c0
[   90.981607]  sync_rcu_exp_select_cpus+0x13c/0x2a0
[   90.981609]  wait_rcu_exp_gp+0x18/0x30
[   90.981611]  kthread_worker_fn+0xd0/0x188
[   90.981614]  kthread+0x118/0x11c
[   90.981619]  ret_from_fork+0x10/0x20
[  101.416347] sched: DL replenish lagged too much


Thanks
Jon

-- 
nvpublic

