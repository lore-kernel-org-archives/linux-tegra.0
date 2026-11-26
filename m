Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795679911;
	b=kNHy4OcAyARQ8jxrNktzZfNXUa/Rm0x4bzDUA8DgeN//jPIF7EXJhvAXyrBs1VgJNIzE
	 7zlT1LySe41Z+oVG009lxleS4fmlj4tMS+9AifDMN9uo6KxehA9TFNMV23KxGk+sZJzfg
	 qzyg1PbZ6rvv+Gx8XTMu0mlECZIojh/NW5MjGn8GsH0BzIeMEqfXmJVLtCdkfgnCWv+sR
	 3ahkzx8YtR7L2vT3CXQuTpBfop5+N2iWoeNdsP4iI4qO/KDwXtGyRlL67bX29ehFQcUh9
	 WL9FESRyogxrjdr1FLGZRerom9jEj1Cpb14tK+f5lSZrpTLh840f+mmy6/EsYtkeRVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679911;
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
	bh=W36kMWoIbIMRdRjcGVcNHOnlR+3hLxKf+bm8uT4nGB8=;
	b=duyc/gMw4nAGHpV6CklrLPfJw8DRIBrjsTgH4B64HRQizItg+UgatnaaPceUo87TkUvJ
	 7sgAZdM9yKOH/0NAyWL/gW+UZ/74NBIAtF961uDqabb9cb6diICyYaoghmh7ouyrtlCZo
	 RjOFUaJo8JIY/tJUAFxy8DtNJ91WetRsxP2x9ORWZ4dgVybhjqO7aNKg27A0mUYqSxU2O
	 joqz6IAu9h7fnn6mo2RjYpQ1ohEMXiKDBqASTebhheFlwHaeijADOwC0k3Qp4M4AAZbZd
	 XFOXDcMe7RQ6NJbF/KbUt04+SgrUQg8oDUdbryCbs3kzKWjInYORTRIF8WYXQv1n3jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JAhz8i0i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.6
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BDE606A31C;
	Thu, 26 Nov 2026 07:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94BDE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JAhz8i0i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2CnKEslv49qlJKTA2tH7fPT8+9v0k9lrcvjwEOJXqo/2diMFYmiegTPwhQcyh+dbbHgH8b28rtcBkXmarbYfALdv6pvd3e3sbHZ7eks96333tKKYaTDo6/X4El4NGDS4ZCOIpoAWbs0MI4bvMaDzXkxGZ4PLAfi42LHb2zJSj77juHellDTz32A4IkSpsaJAs57xy+CFgVdF/OmuNlBLwA4c3hpj5qTOBys/5jIKQU8bZSzKzldzRUlvjgyLny+ibp7bLeDMWLbjyy2ev4g/x/bEddjAB4SP0ai46SmrJzoJZDCb10dLYaCqpsMcy2YzPqCRPZ7a9HbVRpgja+6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W36kMWoIbIMRdRjcGVcNHOnlR+3hLxKf+bm8uT4nGB8=;
 b=wBzbjN3g0rqu1OtauDxb8DfuxidV3FGQKvrT2+TNQx0xke2oFFYCBulGcFmYM2HbCYUHGTFPfQOhx5RxBoP+wzKsUo58gxQEUTj8OPYh9mX6kg1YhaFo47r+TT9X8gEgTKefh/5kY+VvKi90BJ8YXXrOhyDdoyivxxDRsu+DdIuIs0QJuNJdsJgjyGLuttrlOOF70L3qvX3FLJs0wMjKeJGEZmLSDSqXND7Lp2fbIR52iWZ3WWtQ/ysPVlySAlU/VNxvoF+yRC1Dgl0VNQVeSKKfU3LgQvmspaCVVnnIERb2qzJBofVYVdWtEh0328Mh1zRN2KCVpU83DcXe5qIq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W36kMWoIbIMRdRjcGVcNHOnlR+3hLxKf+bm8uT4nGB8=;
 b=JAhz8i0ixmVAErmOuzRPYA0SplZWo44Bjq4bzE8a6AXoJOSqi+JbEj8B7B7lbMM0BlmzgxEPm651xHj4BgEVmuLvrvJWc2gkTr2tPSVyGsgfbQn1dYTciL8yeagnQq4vh96gCq4gRwe2bIdSLV8kQI/vtPjp0g5r/MMB+Oe0WAMTcXzheVfMNGrxJbtIOj9Fg7ObDRLKvaaT5G1Dizsv2fPhdKDOJWuHqV77xJVAcXGnUslAte150a/eIeEZt9cSgHGt6mdi9ZiTdfo17IGyxdYktrYNeha2jU7r1+DbNxKOSB2qpGku88yFDFDIQE+eRsCWkzKMjoS5kAiUcHNZmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 07:58:27 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0639.012; Thu, 26 Nov 2026
 07:58:26 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: [PATCH] clk: tegra: Fix Tegra210 IQC2 clock lookup
Date: Thu, 26 Nov 2026 16:58:22 +0900
Message-ID: <C1R-z2jTSnCjUfGh68ynjA@nvidia.com>
In-Reply-To: <20261024110113.63341-1-kmehltretter@gmail.com>
References: <20261024110113.63341-1-kmehltretter@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: OSTPR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:604:220::16) To SJ2PR12MB9161.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH2PR12MB4152:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b490801-be22-461b-ba1e-08df4b930d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|261102123227099003|56012099006|261021121427099003|11063799006|10067099003|261021123027099003|261026140227099003|261022105027099003|261009223027099003|261022075727099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z6SIMuIS9XvwyxYjHiPs2MqDyYA2Md0HmT4TM6vwoKgpkKfLPqbFzAxyiPPz7Nivr2Ap3vBAC377OPb/Oe+bLci9fSIJPzFlrAjWBBkfVcUd11+sGhqiNBfTzY12AuEMqy1zwGmXl/YpEQ+83S5BWw64YqnfTLDfd78LD6/ZIJrq8UjGXIYgSLuJPNq1TkVIHlo1dfe/rXl+50qJAVJUVO8bDMExLMcjCC48ZhXPLachwU+fq2dRrrCcAMZxnrlh1IXTffTl6AE3ChGkmmVgp1EqKKzACUxu0hgBwtEJOyHJP+ntwwpasQNWy95JQhjUyv22Kus9TdUMlbyvNNH1Fy6lpZi8rjqQ2AVootzbZwNyfx1AuKOsvvNuYld8BWU8pLGJMn4x/ZlItS8Su5Tt4kMZOeHn8fL7Duu036jphQXPz1xHERuf5d8Poh4RHT4/dk4c7TAJSV55/y2oxRC2ZU/kVQE1GQAzVlRSj6agyv5WVklyBRtbokkvW+jH93jR4Xx3f7tcMSAZHVlKZHPgJH27krx7n3Zx1MVIPFL9QXaVuNnMmrT44YgzbAyKY/4gu0mmHSTGKd3fffuCOBIkXpiW+Cn+RU34UmkfL1QBV1aHNMVshbP+17uElUwGjF59x8ol/J6sMYTz/T6jgJVmOL8lwgZ35MrQx8rSmGzQm3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(261102123227099003)(56012099006)(261021121427099003)(11063799006)(10067099003)(261021123027099003)(261026140227099003)(261022105027099003)(261009223027099003)(261022075727099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUZEMDBXSHJQeG1BN0Fkc1RLNGVBWHBldGRSOVhoeTZ2emNUMzJlUDR2ekhE?=
 =?utf-8?B?Ylhud2dyUVJpWGdnaStpb1B5MFZaUCtoRHoxS2hmbGpFTTJrazUvdytCalZ1?=
 =?utf-8?B?bW00Y3JvT3ZqWGl6V20yOXVmUlRWazErUHBJTlA4QWJzSU1IQjM5VjJGV1A0?=
 =?utf-8?B?R3dnUUFyc2trVVpnL3c5QTYxVXhZUndPc0NSQ1BaYnlaOFpmb0hmUCtVMEN2?=
 =?utf-8?B?YjM5SHQvbHJwdTE4OFJHV25WN1BZNndiOHprZldKd0ZhdkZjUGFONHJUOHAz?=
 =?utf-8?B?ajRSeVFZK21zeGVocEVDdC90N2NIaDhMUktGd2VEb0hxREJRaWxlbFJXKzhL?=
 =?utf-8?B?ZkxqcTFhY05SLzJlZVg4VTZzM01zV1JOUVErQ2daeUpyWkliOTZmTmNiYVZE?=
 =?utf-8?B?Qnk1a3IzMy9tM2xNcUZJZDJCWVNoU21pNys1QTN1cXozRnYwQW5LOENKSHlB?=
 =?utf-8?B?cTFveGxlNmFpdWtwQjVFMHBtSlhnV1ZsT01HUEdBRGNmeDUxeFZ3V3VhUkdY?=
 =?utf-8?B?aEJ3N2hiNHBROTR4a0V2dlFMY2dtOGI4K3Fzb29hSXZqNUZabTJDWHQ1TDFp?=
 =?utf-8?B?aEw3R09tZjQwczU2RlRRZXJ4S1hOZzg0NFhLQmhNVU9yL0twQUFqN2tUcVJ2?=
 =?utf-8?B?aDhtb2FKQ2ZZWFQyNHFNeEpwZnNOSnJ5Z0dEbFNTL28xMnVvdFJYQ3VpTnA2?=
 =?utf-8?B?NkpJaWhlRDRhZC8zYXRjbE5vRHMwNll1eStCdTZ0S0tiSi8wSWlBdFZKNUor?=
 =?utf-8?B?RXQ5Vzdud2tkN1RPUjRTM2c5QTNZc0NUZlFKMUNBbFVNa213NUcrYTJwa2Iv?=
 =?utf-8?B?SW56UDRJTGdpOXl1WmRITlBZYVJjK3grSm5GQjFQU1VvY2NaQ1V3eDFuVGJC?=
 =?utf-8?B?TFUwa2lOaWgzRURhaXluZ25Gb0tteDZYbGJnQlYzOElJTmNKSytGb1dOY0NP?=
 =?utf-8?B?QldQdlY0MktLWXNESy9NN1ZTaVJuMXVCWkhsMVA5RmZVNUNiUEhTRTA3MTJq?=
 =?utf-8?B?eXk3ZVlFV3YwZ3VRSXVndnNqZnlaYjFzRUlhU3UzVFljZ2xHZVJuYW85ZkFU?=
 =?utf-8?B?bFJOVjB4SXUrd1RWdllWUXB4Vmh5Q28yeGdXZ0NteG5OM2NQU0lYMGY2dlNt?=
 =?utf-8?B?MFp6aGt2VHdrWW0zQ1ZCMDNDNUtzOWt0RFJuaUtpUHJESm5sOHN5OWJmZ290?=
 =?utf-8?B?QURielRaaWp2TGdhV0FLMG40SWErMjhDS2lmb3JIZzRBODc5eGVUeDQwblB4?=
 =?utf-8?B?TDN4Mm0yejdRaHg3bUxqcmxIZVZCR0NMSWtTcGlQYzNVUlNydGxRcmRTTXBI?=
 =?utf-8?B?QTVEb2lTNjFyUnYwKzFYS3BiTXhQbytHZGhXL2lQYXlsZzN6SmFtMDF1eW1s?=
 =?utf-8?B?QWVoeEN5YUFwMEtYSmdCZWxNSjFyNmdxTUpVc2VTRDl2OWJRY3NvV2pSZ2tl?=
 =?utf-8?B?dkhIMUxsVFVSajdJYkRyNVYrd1hreXgvSTUwM3I5NWttMUJIUEV3ODE4cmVL?=
 =?utf-8?B?YnhlMWRTWEtmZVNVekx1ZnRabmU5UXpTT2xHclJKdHNreHZyZ05kTWdsbUdx?=
 =?utf-8?B?aFZaRmc4bm9lbUNQaGJKUWFTK1lSbXBUUVJsaEg0cTNiR29mblV2V0RxaER5?=
 =?utf-8?B?NEdZT1pxemk2YmU2R2RsNlBpanYwV1BPUmVaSis4ZlpMd1UrYzF2UWQ4eUxF?=
 =?utf-8?B?cHZLcWRic0V5RUZSOEZ3SmRPQng0SDlqRTd3cEVRTU83czNTZlZqN1U1R0lK?=
 =?utf-8?B?aU1aMnVQMTlWYW5PTFpGaUhtNkJTalZMemlNeXc3azZhSkdpc2pkSFI0NEFV?=
 =?utf-8?B?T3FzbVFkNXl6U3dJU2xWTU9xWjIyMVZNVmFnelhtYUhuUEdjNGc2MTJlVEkr?=
 =?utf-8?B?cWQvR2Y2MnZKMm5IbXNVM3hXYWlrN3Z1WXVNR04rTkpWYmsrQVFhYWJxUjJl?=
 =?utf-8?B?Z3JXelVOclBMOW5HOUZ0RlZPeGNkc1V5TU5KK2pLaURNMENEeVQvbmxZM2ZV?=
 =?utf-8?B?L2FTY0RIVk5SL3BBTjUxT2dxMjRyTTM1UUNnMCsyR3FIaE5xaVpkNFJVWmpC?=
 =?utf-8?B?U0cvdXpsYXJSdVBBZUZTRDNNbElBb05JZmV1REF1RmI5T0Z0aGFBNkNwVkdS?=
 =?utf-8?B?a0R2eHZRckJqZHNnZHVBeXRDemJmMnZ4aWZNUEc1VHRhNXY2YlM5WDFaYUkr?=
 =?utf-8?B?OXpwUytRT1p0eUtCdmhvRjRkTGVqVFBtbDArT1hWd0RiUkJPazhjTWtFYi9G?=
 =?utf-8?B?a09jNEJEdkc5eHk1ekxFUDVsZlp1TVVHOGhnY1NzWDFHekFkMUtYWFB2ZHda?=
 =?utf-8?B?SzBEVTlkSXFWNzlyL0xqVXBhbUdnSUR5OGpoNkZKREFaWEFqVmxPUWg0SEU4?=
 =?utf-8?Q?UdkIFKBEuBrBx1+iWv5z9297GJtPpKErImEwjXZPTGQ2F?=
X-MS-Exchange-AntiSpam-MessageData-1: gr1Io+gHXWqXeg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b490801-be22-461b-ba1e-08df4b930d1a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 07:58:26.7141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIeiR4lHCohyqyrlE+fDlvrVR+dLPLIkizvY4whuEBjgmBImuD6Q10OLMOktqF+hKKgIM2tkktfORxG3Gm1Npw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152

On Saturday, October 24, 2026 8:01=E2=80=AFPM Karl Mehltretter wrote:
> gate_clks[] uses tegra_clk_iqc1 for both iqc1 and iqc2. On Tegra210,
> gate_clk_init() overwrites the TEGRA210_CLK_IQC1 provider entry with
> iqc2 and leaves TEGRA210_CLK_IQC2 unpopulated, so looking up
> TEGRA210_CLK_IQC2 fails with -EINVAL.
>=20
> Use tegra_clk_iqc2 for the iqc2 gate.
>=20
> Fixes: 88da44c5edb9 ("clk: tegra: Add missing Tegra210 clocks")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Tested on a Jetson Nano 4GB (Tegra210) with a small probe module that
> calls of_clk_get_from_provider() on the Tegra210 CAR node. Unpatched,
> TEGRA210_CLK_IQC2 (220) returns -EINVAL and TEGRA210_CLK_IQC1 (221)
> resolves to iqc2. With this patch on 5b0764a53235, ID 220 resolves to
> iqc2 and ID 221 resolves to iqc1.
>=20
>  drivers/clk/tegra/clk-tegra-periph.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk=
-tegra-periph.c
> index 4dcf7f7..47bb657 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
> @@ -813,7 +813,7 @@ static struct tegra_periph_init_data gate_clks[] =3D =
{
>  	GATE("apb2ape", "clk_m", 107, 0, tegra_clk_apb2ape, 0),
>  	GATE("cec", "pclk", 136, 0, tegra_clk_cec, 0),
>  	GATE("iqc1", "clk_m", 221, 0, tegra_clk_iqc1, 0),
> -	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc1, 0),
> +	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc2, 0),
>  	GATE("pll_a_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out_adsp, 0),
>  	GATE("pll_a_out0_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out0_out_a=
dsp, 0),
>  	GATE("adsp", "aclk", 199, 0, tegra_clk_adsp, 0),
>=20
> base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
> --=20
> 2.39.5 (Apple Git-154)
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



