Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A42D6410;
	Thu, 28 Aug 2025 07:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756367425; cv=fail; b=DI6BSUjLnwx9CWlXJWXhXTAG5LvZCh35q0V5teNVlRNGSm3Si8vP0Czd+s19TNHhPu6EhEpNiKMfuiwM//CsiQG7gwqInBjnNTWgD04V4eLuHVzzmqAxk9vQ4MrnRI5T+q6FyVRIlfTfqL6uIUTurleVyhkaVHXB3PjepEDyG/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756367425; c=relaxed/simple;
	bh=JSfjI14bMqEmMwEYHv0QvqMwBQo3Z03WHBfkCMbNuTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hcpnFiOjyPmiTsRvx/ofIfZAaJh046U1Km7d3j852lE6GHz/t9oSneOThxn6s5qVR03tc8raUIFNGjbpqZO82UoFfBZ12YkqTBSacHFnWZ1ooyweAp9DEjIsXi+Mp7Xlj7AYIWC7jwFV57rRDR+uEp+RDT+DNf3EFFMZqQYS3iU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CnSDtaLU; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CnSDtaLU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8X7AlBR4PgwSF1tu+RLiMHFK2rxEG5h74E27DUiP7gVlZ2j2o7fGfmjzICMwV3BPY8NUZCdoga4UsEb76OL69sUaGgGhWD0CotMwf98h9bqX2OeY8Ja6pOsSCwcLq8Ax/goO18OQKWflsaz/cJ6HK8wWZdBY2lFlr2s6x5K3HyE/P6/QD5ZWO50kcgDySSn6Ukpd0xOs9QTuySa4ckgimg6u6rm9SOQzJ6XFr7EHbhyszaBtTU434SBozFbbXxeRBf6OVP0AUq5+LTsiokAGwI45vz5jFpTzKV3e2uNle94HwQaFjRFepOf4muw7vwVa4mfSO1XYL+CE2JvrRQuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gm61o8ZrY8BDXC6SxmAe7FPNhX90qZPO7kJo5cttH9E=;
 b=tE7yN2CP3/rzTSvjpw8415xmxT7UUBH+ZTd6PItbz/Ruvoyfm2TQCtsAhso+XFRnO5w9flZcOyQq5vDyUq1FexDyAdqrM+E0RrIrjw6SvoI/OYXDQEilpEBMIxRwJv1AVJatdwN/tqJDFs4O3HzqS+sTmm8ATKI8aZ+xfxxhDvkzdysvaGLARjacl2wyL7oG6tU9YWNn5jdeujGut85bzbHlKQ9eQSpNS24qLIi946Vu79oo131Dohgy2Ecfngjvv3Z90GaOvMq7AxzVPr/K0jmpqzj62QJVbkXcuI+S2VHsFliCbeoIfCgISEgEw7FeH50H8yC9ny82MIZkEM9v0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gm61o8ZrY8BDXC6SxmAe7FPNhX90qZPO7kJo5cttH9E=;
 b=CnSDtaLUbxuARF7gM/3z9Wd9Qg4Vyo7X6hh/f1Ig5S5+AnK5piL7CLV4irQxO5SRzn8Yu38fbRXZF1FpsYkvLbrjWsmZI1kAvw2L02LNDI8NFrMHFiLo/yp/AL9p6i3EDgI6cq4rpTvBViIJfsr2xjPdORXKRWdUaHb0KkCTnlsuTd8zT/qZ9kZKjYaGlatf27z2gUVe9QUXi3nBWjfjNr4P0z55jzMsHdnK/SF7vboVpm+bdpMhX5JvMO7SrrO73BbMU7mzCEoRyvP7NDEMbZRP9gtzOJFJJLKf5q2lho3vKZsrukY1PrY69C0bdeZ4j8KLcj4Pn3/X77SSM+0z6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Thu, 28 Aug
 2025 07:50:17 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 07:50:17 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: reset: add Tegra114 car header
Date: Thu, 28 Aug 2025 16:50:03 +0900
Message-ID: <1865189.3VsfAaAtOV@senjougahara>
In-Reply-To: <53b596e5-42da-418c-addf-d53fd12c528c@kernel.org>
References:
 <20250828054403.7112-1-clamor95@gmail.com>
 <20250828054403.7112-2-clamor95@gmail.com>
 <53b596e5-42da-418c-addf-d53fd12c528c@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH7PR12MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: e2154916-82e9-4b36-d372-08dde607877a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnFYQzF0eG5OaUxlbENTSy9VMTlYRTJwT3BWOEdjZXczMHdZU05vb0xnUGxW?=
 =?utf-8?B?eUVqTXZTVWgydDl6cVFRWXdEZ0ptdEJyczVNNzIzajgrTzFMNE1xQkpMakZr?=
 =?utf-8?B?TlAzRGpQWjhUZS9aRE1kVHl3eGVibzk4NFFYMEs1U0N4MW0yTzlUOUMrcmlW?=
 =?utf-8?B?aDlOMkxKbm5MV1pCVXN1cU83MVZhSis5MzJsL0ZtK0R0SjVFdlQwZDltMEFr?=
 =?utf-8?B?TWNkdVMyV2piWmhzV2drQVhSUmlueGlDRHc5eXZ6ZENaUVdFVkdsamtrU1Vt?=
 =?utf-8?B?QTBVaWo5eFFiS3Y1OURuWVdENHVSRFBhU285aGtpNi9WOFlvT09HR0RJL2dU?=
 =?utf-8?B?T2pyMWYza2JDSzFsT3l2SjJkSEZoWVJUR2lZTWk5NlN3cWRMRGlOTVo2dGZN?=
 =?utf-8?B?VlBNc3AzV245UHJXUWNnbXFaMUxIcGMyaFB4QnBSV2I3YXZoS1ZHVmNTZzVD?=
 =?utf-8?B?MldVYVZVODJ4VkRpd0tGUVVoeG5XS2wrS3RLM3VIeFZTZ0RPSTk5dFdlYlFJ?=
 =?utf-8?B?TytHbUhZZjZ0cjNMOXAyNVZ4eGVrc2dQWU1RYm8vQ0hpcnJBVWdEN3JTcjZw?=
 =?utf-8?B?ZXlvQXExMUNOSDJHdDVkZGlFTDF4NzFDckJQWkhQK2Uxb1hGenlSVVJlZTFB?=
 =?utf-8?B?NXFTOTlZQXlvYldicU5CajQ2UU5RUUIwRmN3bEgzQTNKc25aeHFtbTNuZ1RJ?=
 =?utf-8?B?ZGFna2xGS1M5bnVydXRjV2dPRnU3eEExWGlJQUN3N1RxNGVvVEpUVjg5dkty?=
 =?utf-8?B?TkgvQktKV3dkaTlWMXVCL0tSb3UvaUVBbE1rSlBZYkNxNU05TTFIa24wcUpP?=
 =?utf-8?B?akhJZ1l6TXc1ZXA2c3lCdXBicnVuWDFvQTJGWFlRNjhXOEFmeFRpQTRKOHpz?=
 =?utf-8?B?MFhnMUdQK3RidWozN21JNStCWWNLWGpjeVJCTi80b1lncnZUMElBVkUwMEtt?=
 =?utf-8?B?N01DTDRrWW1odEJiU1NHOUt2NUZ5OGZ6MEpKVUZLVmZodDg0REpRTWZSTXN3?=
 =?utf-8?B?SS9ZNXd4Q21KaDFKSzRWbU5sb2V5MmxPU1hkZGpsWTlMbDJmL1ZRQXJPZDlt?=
 =?utf-8?B?cjdOVHYvNTdMc3RyWUdHbXlEM0pUemsrR0FRb3NMMlNUY0paZlYxOEErZWZM?=
 =?utf-8?B?bEJjMzBwUkROUWtjeHhpSXN4Y2pYR2JQZ080NEZrWklFVHhrS3JOZVJOTXFk?=
 =?utf-8?B?dFIxc293TGxWNis5M0ZpM1BEdVhkUGc2QzZITXJYakxNbG51U0k4aHFyVzR2?=
 =?utf-8?B?eXF2aDlhUlRzMVU5Mjh1NzFBOG1qT2xVK0dXRUdvcnhsZ2FWdlorQ0tWek1G?=
 =?utf-8?B?N3Q2WmV1RmlVRFJCQWhYdisvRlJOS1YvN3N3Ynlpb25hWUVwMC9zcjVDbUhG?=
 =?utf-8?B?eko3R01vQnNrZldBUzllTzd3d1JXSHRxWUhtMStQVjFDZTNwZUpvTUF2N1Zn?=
 =?utf-8?B?V2JwUldNcjNkVFBBQTRhaWFrVlBTLytoS2lGL1A4azVDYlU0U0FiNEF5N282?=
 =?utf-8?B?WXFPUUNmam10RERuZlZyYUZWdkVyankvd2VpNndXS1JxNU1qMldDQU5TY0FC?=
 =?utf-8?B?UldNemlwaUhyZEQ1SGsrNmwrY2JQU3JmV0VTUndYWndsb01oenNzdW9oUjVj?=
 =?utf-8?B?bVFpOXBVVmVCN21PM2Q4cFp5QjA0L0ZQU2xvU0Fzc1ZCL3E2eERzeGEzSXNL?=
 =?utf-8?B?RU0zSjhNcDZBUXE0SllBWG14UG5NMFllSkVpWU1YT1FmazZ4cklJWWpRSHc5?=
 =?utf-8?B?d1hZUFhrWVd3WG1oeEVBOURvRnMzZ0xlNGx1clJDUms0WlIzUGozeGtoREFq?=
 =?utf-8?B?UzMzVVQzSTFUajBXaWM4MkhaOUViVkhhcklyN21jMEVCWUN4cTl4Um5HNTU1?=
 =?utf-8?B?dWw2bmdqWGQrTndNaXBDZVdRMHV3Mzg5ZnJITWZSSkFxTnpheTFOdGE1d2xr?=
 =?utf-8?B?Sjd4SnhRUEZuWWQrUy9nQTlyU0hrcWloTHo4SVhIcTVENlI3MG16MCtPa2FL?=
 =?utf-8?B?ZXJ3djB4aWJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnFtQ05uMVJUQmJXSkp3NWZKQnYyRVdWRUN3S2gzR0ZEdVd0cms0MnJlQzNr?=
 =?utf-8?B?N3FIUG82UDF3ZFBzaVVNY2F4SVNMa1ZsUUJDdDhZYWM0N3BQMUZsTHY1cCs5?=
 =?utf-8?B?b0x2S0N2UGEySVhYMXVTOVFHYkI3RHM3Y05wMEl5Y2hZamVINjJEcnZuNW1j?=
 =?utf-8?B?WERWbDBrczJEbEZFL0RwbXo5c2JRSk5jZXBsVi9tcTB3T3hRaklxdmVmbHNP?=
 =?utf-8?B?Z2ZRQ2hGN0JBQ2RFSmFxNVl4SzF5cXZzRW1CZ1JCMzR0cHBIbW01MzdESmtG?=
 =?utf-8?B?S2RybzdmMVVyRzhHdWVkQ2ZnTUFVMFZLdURGTzJxSEpZUmhlRmt1WDc1eGg2?=
 =?utf-8?B?TzJLNldHSzNqUXBhVG8zdlBpTTVLemNxVnk1UkFHT2FaYnVEVlVUbnd2ZCtE?=
 =?utf-8?B?cXhCZnlIYWkwWFBWSloyMlBDdG1tRHIzVElHTTFMcHJ0T0o3SHJoSWJoU0Y5?=
 =?utf-8?B?ZGV2TFA1VEYwMUN5OXFNdnhXdHZSTDY3SzY3Q1N1azNENGYrdnNDdGQ3djJ3?=
 =?utf-8?B?RGRVTGt2K1lQVi9saDFhSjNXYURPdngzdUxkbzhNcGRDaW5ZNWNxakRSQ3BR?=
 =?utf-8?B?VXU2bThaK212MUhjK2Q2aWptWFpMTnlsN0pzZkVpWitnQ3QyQWx5TnZLSHBa?=
 =?utf-8?B?M09RZHh4WTNtLzRER3Fyd0NLdFJyTW04MEQrbzdKNGtEMUtqbndNTFEzSkNW?=
 =?utf-8?B?bzd0TUppU1JRWXQza1BHbVJIUi9YVDBCYmtaTXNoNzJNSkp0MEs0TUdKZkg1?=
 =?utf-8?B?VXVhZG91amZxMW9iYU4xNXc5STFpa2c2RDh5dEFiTVdrY0QvamJ5d1RTcmsz?=
 =?utf-8?B?R2xKVEV6QWVwMjRWYXluYkgyUVMzQ21mYzcxYzFNN1YvUHVCR1FPbkZoQUpY?=
 =?utf-8?B?OEwzZWFuVUNkODg2MUE1QmVycGJCSENCMHZoQXpTTTI1WHBsYk85WnFsTFll?=
 =?utf-8?B?cXNLM01OT3h6VHgyeDZkMHQrM1UrajAvc3B4aFdlZ1VSZnhOa1JwWVJ6d1Qv?=
 =?utf-8?B?RHZWYzRFRzUyeXIwRnJZMyttRjU3ZWk4ZWI2U2RLckJiZlJoUDQyUVZwNjNq?=
 =?utf-8?B?cVY3RWQ2TFBhWDVBM3R5NUwrdUFKb1VvSGJMRm9lK3lBWDJOSmhNQmlFVjBR?=
 =?utf-8?B?eTdjZlpJVE4vNCtHMGN0NzA1VFl4WUhPTjNBR2ZESHcvQkFZNTN2dzMycUJS?=
 =?utf-8?B?ZlZReGdNTGgzODdQT0JwcU03aDNVblNES29GZ2RpTzFxczRTSFIyMmJtVHJ2?=
 =?utf-8?B?NnRVTUU3cTVlNzNkQjNRalg2dERsd3VRQzlsUlFBUnlCYkIxYWxsKzV5WDJ2?=
 =?utf-8?B?ZnFBT2pkcTRKSnpVVlEzUThEdTh4T0IvYk5aVGFjMDg2NFF5OHIvdGx3SDZx?=
 =?utf-8?B?bkdGYkl2Q25xRTIzdzZZZXJMdzgxNDZIdi9od0h4YUltVGZ4UU11RmU4SnUx?=
 =?utf-8?B?QmFwOFIzVEp5Y0tNUVU4RWdYR0xxWG9uZ25qYlFHYVc4VnhPdm50NUo0dnNM?=
 =?utf-8?B?YnlvRVorKzZFNlFFa0dKcndlbm9BS0djTXFnbUNmYng3ZDhsTTVXSW1kTnZY?=
 =?utf-8?B?bGYveDhaTk04ZDZreHFZY2YxdjJCelVwQ04yeU1zQzIyZm9SaytScFpEK1c1?=
 =?utf-8?B?TjlKZnlkU1cvcW51UTdwUEJpOUJ2WEkxbHlWOGp6U3R1VkdFUVh3SUdSSEZT?=
 =?utf-8?B?Z0plL1VRWUJNSVdhRmNPUmRRN3R6RXFYWmovNkZ0QVdXSU96ekNDTzhoNUdp?=
 =?utf-8?B?WFVrbjR6WitHSGRuQnMwRHhKL0FSb0ludTArMWFWaEJ4OWhrZ3MrRk1nR2lu?=
 =?utf-8?B?aWJjb0RVZTdxVlZJdFBTVGR4Zi9LWm85VXNPSmhBSUV6dWRzTnQ0OUtKQW1s?=
 =?utf-8?B?V1pKQ0c1b0pGdmdndlJ6Zm9kY3NweEhPVW9xZW1TdWpqekUva29RaUVDb2JP?=
 =?utf-8?B?bnVhZkpXSTB3MXRpQXdVWE9XQlkyVjBZbmEwa1ZQRW9XR0p0eUtxZ28xSi9D?=
 =?utf-8?B?Q0VhdXBIU0EzSlRCWmx2c0FXUlJMalNVSENRUjJPcWFMVUY0ckxSVlNuSVlH?=
 =?utf-8?B?MExIMTd0NzVEemNydDdpc3BRcWJnVU5nL3U2M3ZkVzU2RzJCZWYvdFBrYjJ6?=
 =?utf-8?B?OGFITnMwVUZ6U3pzVysyeXBQYmYzSGtZbnVFTWtZdWRlcUFpM1pISVdjNzVW?=
 =?utf-8?B?eWhFMGVwN0Jxb0JHd0RrZDF1U1hVLzhFa0ducExrNUJTanFqSEhwbmREejha?=
 =?utf-8?B?NUswUVJGYXFpcmJ3dFBpMk1kLzB3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2154916-82e9-4b36-d372-08dde607877a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:50:16.9895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wv1G2EhJtLw7vVbdSqzzX0PU1FumKrUYyiZKOrUnOSrIi28Np2D9/nU1x8bm+/CEn4ektssEEt3pPEEUaDPpLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9076

On Thursday, August 28, 2025 4:19=E2=80=AFPM Krzysztof Kozlowski wrote:
> On 28/08/2025 07:44, Svyatoslav Ryhel wrote:
> > The way that resets are handled on these Tegra devices is that there is=
 a
> > set of peripheral clocks & resets which are paired up. This is because
> > they
> > are laid out in banks within the CAR (clock and reset) controller. In m=
ost
> > cases we're referring to those resets, so you'll often see a clock ID u=
sed
> > in conjection with the same reset ID for a given IP block.
> >=20
> > In addition to those peripheral resets, there are a number of extra res=
ets
> > that don't have a corresponding clock and which are exposed in register=
s
> > outside of the peripheral banks, but still part of the CAR. To support
> > those "special" registers, the TEGRA*_RESET() is used to denote resets
> > outside of the regular peripheral resets. Essentially it defines the
> > offset
> > within the CAR at which special resets start. In the above case, Tegra1=
14
> > has 5 banks with 32 peripheral resets each. The first special reset,
> > TEGRA114_RESET(0), therefore gets ID 5 * 32 + 0 =3D 160.
> >=20
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> > ---
> >=20
> >  include/dt-bindings/reset/tegra114-car.h | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 include/dt-bindings/reset/tegra114-car.h
> >=20
> > diff --git a/include/dt-bindings/reset/tegra114-car.h
> > b/include/dt-bindings/reset/tegra114-car.h new file mode 100644
> > index 000000000000..d7908d810ddf
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/tegra114-car.h
>=20
> Still incorrectly named. Use full compatible, just like the other file
> where we already switched to recommended format (see also writing binding=
s).
>=20
> I asked for this at v1 and then reminded about unresolved comments at v3.
>=20

Ah, I guess you mean using 'nvidia,tegra114-car.h'? At least I hadn't reali=
zed=20
practice had changed to include the vendor prefix.

It can be said that 'tegra114-car.h' is also based on the compatible, so I=
=20
hadn't quite understood the original comment.

Mikko

>=20
> Best regards,
> Krzysztof




