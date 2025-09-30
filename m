Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011018.outbound.protection.outlook.com [52.101.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F58155757;
	Tue, 30 Sep 2025 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238100; cv=fail; b=WIOzfewFqFq9wmguWFQg2Tafnj7kNA1II7RJ4zygTxkAwwvecVncZ1myGN2tPkAi0b/dSNvEdQKcNlu2DRXCLTjh9NIBGc2ztTtpVQvflcE6yGOI21tzqM+ajI8ut/+duivHUNOkwf/ETQK59+GtJvEf4AJzvQvjbZ88xn3MSTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238100; c=relaxed/simple;
	bh=BN5iCK4GtjVWhxX34OfDlyJUPJ4WiRdp0brY+WbW680=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I1ku5NxKFzWL9sh0CraN1tWLx7fe7GfVy/uRvn/atI7Q1/sIrH1odn1arBoOyA4tbPCwxV0RebgN4fhdiIa025aPQEcR5DT6FVnGFJTPsMu56QWdlk64NAv47DlDCAKL1xHxSDXyq4e4F3ZQioULA3PCbBf7T8Cgdq1s7O96UHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ohO7tM+r; arc=fail smtp.client-ip=52.101.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ohO7tM+r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJO4HWDpo5bxwM78oVE7r+xJq3jVcYIsP/quH7hrTP/JdXaYSLEaSL5cdKlS8anHpFcpLKNzzCUoeKJMUDfP6Aqxm1IG5jKJ8eL3149ioNEbJPD1T+DZglPwqJEYD7y2tt7gkiPMYKsF7mwRJMgBmjCrgMKYj5JwaXNDLE67e50cYXd7s6VeUx4GBXgHGQd3wXD0gqHj41oGQVIj8FHi+Zs1PhgFzAcw0hDjooGGIgjm3V1QpfJ4yB9Ac/8tG9+un8xIK+pjLyR3xmVq3TIQrKf9LosCHICcMT1THUK8RNDxqcFelAi4wVGMFEJTauV85F8V97N1tO7EXnKoBUi7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN5iCK4GtjVWhxX34OfDlyJUPJ4WiRdp0brY+WbW680=;
 b=sDAFWKLHbP8/Iac8agtbe8MVc7VYvbfCRITXk+WJMZlTCgOlsh7JzKZlOfV91iMQHXm61YGXD6m+mJKOWJs+54OEbWIdS7XrwSwYpJ8YLCODURdBuRjECRRkGs6ML3Z8EAno573FPCBfR/G2eV9Avboijrtkn4rhf1iETudS9KLMG49iKgGW4n1PoVMLy+bbCL8Ajo7O0NdXPwDHVLks9ICgIyASuiiW2XN/fE6RSsEnVseE3NFSA2KdwEn+ExLi4uoTCbbZ/eXHMwTn/KiN4v/qpXFiYPBd40qNFPHL8wx9bZu7rwUI0gTCq1nP7LcFcTmixSWFaLSK8uHgHGNn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN5iCK4GtjVWhxX34OfDlyJUPJ4WiRdp0brY+WbW680=;
 b=ohO7tM+rVh40n1/4x7E4yNEaiF9CAOaQLwB5F4z4+H1+FKGSRFS19I7sedKSEwaDDtJNjg77j+d9Sa2WYOcX4K82uRP/N+QH39Lyl8SfjZDFNqyX0Rcv2wWEXq9/OZLulPuD4MsshKt0ss2OGXrUjZEqfnAhU1FScn03ltLDvH/xrqzZcsHH4sXbHuTxH+lJOs2LDFxNnsxQCWcsMy6vLIvsYS+rhgBksCMByH55TbBQWSkk9JzOuedF0D54iZRr45fVEagQ/4kStTZDOAp+oLBIT1YlIV1IjtCWOF90mP05fUjLIQGbLEoGZYihUG4x3aBbt1EnNSZEiGtcUy1pYg==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 13:14:53 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:14:53 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, "will@kernel.org"
	<will@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>
Subject: RE: [PATCH v3 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Thread-Topic: [PATCH v3 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Thread-Index: AQHcMaDfz0niPMA6skWFIX1/0jP32rSrZ9KAgAA+UiCAAAxNAIAAAHzA
Date: Tue, 30 Sep 2025 13:14:53 +0000
Message-ID:
 <SJ0PR12MB56768E87FFAE8DCC5C6C789BA01AA@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
 <20250930002604.346306-2-bwicaksono@nvidia.com>
 <e21159ef-d438-4944-adb3-eb8e7c801d9e@arm.com>
 <SJ0PR12MB5676DD9C94CB7155D3897DEBA01AA@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <94832766-e408-4485-8397-e48bc23f615c@arm.com>
In-Reply-To: <94832766-e408-4485-8397-e48bc23f615c@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|DM6PR12MB4044:EE_
x-ms-office365-filtering-correlation-id: 9464a2dc-af41-42d7-9c4e-08de002357f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SG0zbjV1MVZQL0d1ZktKSGdFZjZ6T01UTk5lVys5U2cxbFdiL2dFWDlFMDFZ?=
 =?utf-8?B?ZGIvQXhDYUw1Q3Q3WHZDMmNDRFZ6MjBCM01wU1c4YVNUSDJpT1pBWWhWaFdH?=
 =?utf-8?B?QWd5Nnoxdk80TWJuYkxZV0tybzFOL3RQTFdMbnh6UUpzYzhHQURCcDd6STZY?=
 =?utf-8?B?NGtHcFVQdFQ3WVgwckZVSUpJaDQ5OXVtcndjR0I1dGN3OTl5WHBwMXJpMFk5?=
 =?utf-8?B?S3lsc0RZbUZqdmFOcmNUZGRpaWdGMGVyckJSOUcrQjhUZThjNUlpR2xtZ3o0?=
 =?utf-8?B?TTBvcWdldis4enVtSFJZazQyVWdYTU1CSlVTNGNFeTRGWndGTzJjeis4NFFm?=
 =?utf-8?B?dTkrelR5OE5RZmsybllXRVE1cmtFWWt4YTlqUjZaR0QwSExEQmlmamI2cVlX?=
 =?utf-8?B?SlBENi9EVG0xZFdMbDE1U3VLZlhmRFJXeFp2bmFOa2JScEJlR2paTTFFMith?=
 =?utf-8?B?OG9uR0J6THJrL2tMckkvU0dkaHJ2YXZwa2pJWmlqdVdxaUk4T3VFcVFpc2lI?=
 =?utf-8?B?U2ovZGw1ZVJaaWVQcEp2Qy94Z2lJRGdsVWhQRStOK1VSZ1NnRDBlOEdIbVp4?=
 =?utf-8?B?Vno5L1doSkF1bVRXaGh3bEhoZFRNVnpRU3dHRlJGbEw1YmU3clRwb2diRHk4?=
 =?utf-8?B?QnVIYTBYZDFXczh3bzZYSnY0Ym1RbERlVWs1MEVMWDJpWENJbXlsVWxoUDFX?=
 =?utf-8?B?VnNVSnlRYy8zRWplaWRSczdlUGVmdVg4RVpteDk0enkyQzMzZDFwUGRYeEpY?=
 =?utf-8?B?cVZueFNYR3ByLy83OFpjNzNQaVZSM1g1cWdENVc1VjI3emp2ZGJJcGZvaDVH?=
 =?utf-8?B?cGR3TlM0R2loR2ZJYm9pS05UZzJ5YU84d1BIckxuRExuRkRJVTdIQ1hSMjU1?=
 =?utf-8?B?QXQ5R2RYNzA0M1VOMkFWbExtVFVkbVJnQ0pEaDRDQitXRXhiNDkrMWtTdEpj?=
 =?utf-8?B?WXdPazhNZzQrTXVjb3BlZ1JYOVlHYnY4eFJuVGhId3lSRkVMUlc1VFczaXgy?=
 =?utf-8?B?bjFwYktMeG9TRkJlM3J0ZzFXV0Y0a2ZYYW91OTIyL1hndnI1N2ppS0hjNFA5?=
 =?utf-8?B?TGRKcjQwUVVqWUxDVmxSdStHK3p4b05ncjhGaE54VWhUQWY1cGZJZEg1eFBy?=
 =?utf-8?B?NEgycjBnT2tWUm5JYUFMWWFVeHJHbW5kUDlQKzBReXhuV3pFU1FZSkVzZU9T?=
 =?utf-8?B?SE1aMkF0d3NtckppVy94MzRScGw0QUJZa3NOQUhBaytqcUpUQ0xzY3puUFhG?=
 =?utf-8?B?ckY4aEZ4dVc5QnVsR254Vi9nWnYzN25RODhwbnBVRktWUTFveUIrb285NnA3?=
 =?utf-8?B?UHJFNFdiclNhWU1qcEdYaklDYVJOVndSd3Frc0xBYlZZU3ZtV2JMNVR5dW9U?=
 =?utf-8?B?NFlLVDRydU00cGluRHRiMG1kcUtNWldnN0VrbzB3K1RQV1dqV3VKSFM4ZkdX?=
 =?utf-8?B?QWpRZ1ltMEc2aW9VU0dnVGFjZk9oSCs2OXJxUnhjNmlqVUNUVjJsS2RBeXg3?=
 =?utf-8?B?OUJFVkpCRHVBVnhRT1h1TzVJbEs3Z0NkcjFJRFoxNGVNdmdFam8vNjFhMWdE?=
 =?utf-8?B?UjY3NnZ1NXAweHVybmQwbXFZTGRhaStjRGJYMmtRaXVBKzZUeWRUVkZNdFVQ?=
 =?utf-8?B?bzllalhRcDJqVHJib2JMa09hRnFhZzh5UzAzeXlVQ294MlRzYzhLdjNTQXJ5?=
 =?utf-8?B?blNydlM1ZThXdHJLWjk3T0dndUlHYlVTcnFmRlczV1FrMzRON01laUU1dDMx?=
 =?utf-8?B?MGlxSGxXT25xUmo1U0hPdVFNcW1SdERYWVdMTzBMQnp2cGtySVdFSmFsZUNm?=
 =?utf-8?B?cFo2OEtJd2trajM3S2xaRkJDdHFRbll2M2xzejBoQ2hIYW5uS2l2bUF1dkI5?=
 =?utf-8?B?VjZxdFREaVN0V0UzMHNoM2ZnTGxkOGRob1dNWFBHMTllbmszaFkzV241dnVZ?=
 =?utf-8?B?UDlRejRLM1ZpUjV2UTFGQlBUTGVQdjVCOGgrZHpteVdwcDY4MGl0M3RxUytD?=
 =?utf-8?B?L3dvTGE5SExZRWpueXh0TkFZRWRCbjNWcjZoSml6YnQ5N3ZicmRNYXlOcmRJ?=
 =?utf-8?Q?h7dA14?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?alZmSVpBQ3VrUGNuODlsS2FTM21rZTZwQVhyd2FnSGF0eTJVZXRFNWpTR1lr?=
 =?utf-8?B?T3VYWkRZNVcyQzY0bmp3eTVxTTF1dDZuVUczM1d0cTh2L2h3NUVQTFFXZnJ5?=
 =?utf-8?B?czFVS3JlV3JTQVkybmVBQVNycFRjdExEWStaNUwrd3IxSFJKd2F1K2hSdE1r?=
 =?utf-8?B?R01FWVZwVWNIeGN1c0MzSEJNNnNnNjBqT01LV0pFaHQxUUNYZStUTnliRlV6?=
 =?utf-8?B?c0ltUllLaWVJZVQ2ZDdKaVUzb2dKbHdlQ0dnaGdkeGkraFMxazJYdU9JNk8x?=
 =?utf-8?B?RVAyVmVlNDZVSW1JWDdSZkRvUms1NDhUWUZ5NE5rVWx5WjRxU2czRlE2bWRm?=
 =?utf-8?B?UUpPMTVwZlRCUy9GaDcxNURZRUI4aExBNEFKN2FhQUF5S2tab2tFbWlyeUtn?=
 =?utf-8?B?d2ZoZnM1d3V3cDhoY3QrbVgyTElKL1M2cjFYWHhTQlMyOXZDVjNQSlB6by9Z?=
 =?utf-8?B?cWlRRWkxYVRrRzRnbFR5OHA3UlhMWDNOR3VrdWlLV2dmM1BCNG90aERZK2t3?=
 =?utf-8?B?Z3hBQW9uTnpmeXB5TDAvM2NlUS91YnhCZDdFZTA0Sm5UTFF6WTQrUGpJYkhO?=
 =?utf-8?B?eXFCNTR2eGEvLy9kUDBYSGk1ZDY2Sm0wTkxlVHlTWlp5UEZ5cEV5NHdvdTJY?=
 =?utf-8?B?R0hkTVFHaTlqMmhRZ3htTml1bXdGc1QzWENTZ29SSHQvRWpLR3AwZ3Iwa2hv?=
 =?utf-8?B?UFFESXozVHFyZncvaHM3OXpsdDRZMDFPUFFEM2hPN0NtUnNzdnpkYkZuaVpq?=
 =?utf-8?B?Y3p5Vy91L2JwMTFSNitpNGQrMDY3alpBdS9GcXpzc3JCUjJXT0Z0U1BUdjVD?=
 =?utf-8?B?ZWkwMUdRTkxuYU9mK3NTUzFiV2hrbjZodGRySTQ2TTk2REhxb2JpaUNzOUhm?=
 =?utf-8?B?dTd2MmxjQUtCVlk2L3JjVzhSVHRLZVRJRGlQT05oWlJaMFg0dmNqUzd3anNw?=
 =?utf-8?B?cm9Cc1dsVU5mWjhvMzdJOGV4SWxkMzhQak0wbnE2TkJKL3g1VjhUekFaU210?=
 =?utf-8?B?QkZkYkFZTlZvTWJvMkJ5b1lXbU9kTTZMMldGRlFNSU9mS0RYZUNQUGUzRUN4?=
 =?utf-8?B?ZzluUFBUQ3NldlNVQVBFNk4xbENzeG5DUmJuUVlOZWdRK3BjWmRaVUhENzR5?=
 =?utf-8?B?L3BFdmJmclpLRG54OFNITmVjN3RkT2FOVVR2aHl0anBRajdkajg4eFhtREN3?=
 =?utf-8?B?MEwxOEtjbEJnSDNWR005QUUyTXVYbThEZ2Z1alJ1MjBhRThpZFRONlhNWi9W?=
 =?utf-8?B?R20yY1NyVnIvai9UZ0M2elYzdUFZUTcwV3VUSzBIbndxRndheWRCZnlGRG13?=
 =?utf-8?B?OUZBc2dPdmpZY0RmbHVRdTZMaXp1bDlPbkpxcldZcW1HYWdVUjhlQWpRb1lw?=
 =?utf-8?B?R1hUWmdnWHZNaElFWWU0N2N6NFljdHRxMUdvRW11cGdya1MxUTVVdE5EZzEy?=
 =?utf-8?B?UTUwWkhTcWo4Mm9QazdBajFJT1R6RzRNR2lvSThiWTBsSFJCbjFMT3dYa1pu?=
 =?utf-8?B?Y1JvY0ErT2pDLzVJczdjanRSU1B3WnlFY01EdlhKemJZSFdja0NPQTNjc3J6?=
 =?utf-8?B?bnVjNU85LzVSWjlGT0tWWGdLc1FvZmY0d3RObVZFZFV1aS9YWlN4VHRJQW0w?=
 =?utf-8?B?aGErLzhmSVRGSjJ3cjZBY1BrS0NnQ3Z0clA4UE1VdjdaY0xxUkZRSFZ4dmda?=
 =?utf-8?B?ak5JZXluMWhjaGhYSVMzdkNjcURWVU5YRG9Ec0tJTDZQN1ZubzVnWXJJcHFw?=
 =?utf-8?B?WkVVVlRHd1lsWlRpU0xQaXFxRkY2ajRrdFpJck9VUUNWaFNiWmZVVVMvQ01p?=
 =?utf-8?B?QXlSRExoNERCRHJ6bnBCbDNXQWw2NmYzUHAzRmRFSHVjdi9zWExiSTdLalds?=
 =?utf-8?B?NHIrcit0eWV0SWlSRHlRdlhKeGFFZmp1VngyRUFnY2dOZjA0Y2MyVmp4ZFAx?=
 =?utf-8?B?OEtucDFKQnllQ3NYNjB0a09aRENYN3VmSVBLV0Jvc1h2WTJXQ0VZZHJ1a242?=
 =?utf-8?B?aHY2bTNDTWJSWXNITC9MU01lR1l4STJaVExFTnNkb2VNOEY3Q2tQcnRuL2k0?=
 =?utf-8?B?cnhUcHJUQjRTVE1kakFoekFzWTlPdnpGam5XVnNYL2lQMDlDUE5ZdTE4VEF5?=
 =?utf-8?Q?TuhtqeZ4lCjpUOCrHpQkjgTN5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9464a2dc-af41-42d7-9c4e-08de002357f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 13:14:53.2386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcZNVIa0jMsq9HHtTHyzeKphM6mzqSVj2pYM3cKVSvRDCbUBLZagilaT+LRqqTi/R+l6YP1J11Z2keiyE5PU0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3V6dWtpIEsgUG91bG9z
ZSA8c3V6dWtpLnBvdWxvc2VAYXJtLmNvbT4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDMw
LCAyMDI1IDg6MDUgQU0NCj4gVG86IEJlc2FyIFdpY2Frc29ubyA8YndpY2Frc29ub0BudmlkaWEu
Y29tPjsgd2lsbEBrZXJuZWwub3JnOw0KPiByb2Jpbi5tdXJwaHlAYXJtLmNvbTsgaWxra2FAb3Mu
YW1wZXJlY29tcHV0aW5nLmNvbQ0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gdGVncmFAdmdl
ci5rZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgVGhpZXJyeSBSZWRpbmcNCj4gPHRy
ZWRpbmdAbnZpZGlhLmNvbT47IEpvbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPjsgVmlr
cmFtIFNldGhpDQo+IDx2c2V0aGlAbnZpZGlhLmNvbT47IFJpY2ggV2lsZXkgPHJ3aWxleUBudmlk
aWEuY29tPjsgU2hhbmtlciBEb250aGluZW5pDQo+IDxzZG9udGhpbmVuaUBudmlkaWEuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvNV0gcGVyZi9hcm1fY3NwbXU6IEFkZCBhcm1fY3Nw
bXVfYWNwaV9kZXZfZ2V0DQo+IA0KPiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3Blbmlu
ZyBsaW5rcyBvciBhdHRhY2htZW50cw0KPiANCj4gDQo+IE9uIDMwLzA5LzIwMjUgMTQ6MDAsIEJl
c2FyIFdpY2Frc29ubyB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+IEZyb206IFN1enVraSBLIFBvdWxvc2UgPHN1enVraS5wb3Vsb3NlQGFybS5j
b20+DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAzMCwgMjAyNSAzOjM4IEFNDQo+ID4+
IFRvOiBCZXNhciBXaWNha3Nvbm8gPGJ3aWNha3Nvbm9AbnZpZGlhLmNvbT47IHdpbGxAa2VybmVs
Lm9yZzsNCj4gPj4gcm9iaW4ubXVycGh5QGFybS5jb207IGlsa2thQG9zLmFtcGVyZWNvbXB1dGlu
Zy5jb20NCj4gPj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtDQo+ID4+IHRlZ3JhQHZnZXIua2Vy
bmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IFRoaWVycnkgUmVkaW5nDQo+ID4+IDx0cmVk
aW5nQG52aWRpYS5jb20+OyBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT47IFZpa3Jh
bSBTZXRoaQ0KPiA+PiA8dnNldGhpQG52aWRpYS5jb20+OyBSaWNoIFdpbGV5IDxyd2lsZXlAbnZp
ZGlhLmNvbT47IFNoYW5rZXINCj4gRG9udGhpbmVuaQ0KPiA+PiA8c2RvbnRoaW5lbmlAbnZpZGlh
LmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzVdIHBlcmYvYXJtX2NzcG11OiBB
ZGQNCj4gYXJtX2NzcG11X2FjcGlfZGV2X2dldA0KPiA+Pg0KPiA+PiBFeHRlcm5hbCBlbWFpbDog
VXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KPiA+Pg0KPiA+Pg0KPiA+
PiBPbiAzMC8wOS8yMDI1IDAxOjI2LCBCZXNhciBXaWNha3Nvbm8gd3JvdGU6DQo+ID4+ID4gQWRk
IGludGVyZmFjZSB0byBnZXQgQUNQSSBkZXZpY2UgYXNzb2NpYXRlZCB3aXRoIHRoZQ0KPiA+PiA+
IFBNVS4gVGhpcyBBQ1BJIGRldmljZSBtYXkgY29udGFpbiBhZGRpdGlvbmFsIHByb3BlcnRpZXMN
Cj4gPj4gPiBub3QgY292ZXJlZCBieSB0aGUgc3RhbmRhcmQgcHJvcGVydGllcy4NCj4gPj4gPg0K
PiA+PiA+IFNpZ25lZC1vZmYtYnk6IEJlc2FyIFdpY2Frc29ubyA8YndpY2Frc29ub0BudmlkaWEu
Y29tPg0KPiA+Pg0KPiA+PiBSZXBlYXQ6IFdoZXJlIGlzIHRoZSB1c2VyID8NCj4gPg0KPiA+IEkg
dGhvdWdodCB5b3Ugd2VyZSBva2F5IGlmIHRoZSB1c2UgY2FzZSBpcyBvbiBmdXR1cmUgKGRpZmZl
cmVudCkgc2VyaWVzLg0KPiA+DQo+ID4gU28sIHRoaXMgaXMgYSBoZWFkcyB1cCBvbiB3aGF0IEkg
d2lsbCBoYXZlIGluIG52aWRpYV9jc3BtdSB3aGVuIGFkZGluZyB0aGUNCj4gPiBuZXcgUE1VIHN1
cHBvcnQuIERvIHlvdSBwcmVmZXIgaXQgdG8gYmUgcGFydCBvZiB0aGlzIHNlcmllcz8NCj4gDQo+
IE5vLCBJIHJlY29tbWVuZGVkIHRoZSBvcHBvc2l0ZS4gQXBvbG9naWVzLCBpZiB0aGF0IHdhc24n
dCBjbGVhci4NCj4gQWRkIGEgaGVscGVyIG9ubHkgd2hlbiB0aGVyZSBpcyBhIHVzZXIuDQoNCk9r
LCBJIHdpbGwgZGVmZXIgaXQuDQpIb3cgZG8gSSBtYXJrIHRoaXMgcGF0Y2ggc28gV2lsbCBkb2Vz
buKAmXQgcGljayBpdCB1cD8gRG8gSSBuZWVkIHRvIHNlbmQgYSB2NA0KZm9yIHRoZSByZXN0IGlu
IHRoaXMgc2VyaWVzIGFuZCBleGNsdWRlIHRoaXMgb25lPw0KDQpUaGFua3MsDQpCZXNhcg0KDQoN
Cg==
