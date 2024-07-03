Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160213666D
	for <linux-tegra@vger.kernel.org>; Wed,  3 Jul 2024 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719994955; cv=fail; b=NEEabN7x0EMTXODSaz9FShNSkJp/YezSd/VFqb24RqxK+Wdw63LvssZ90BPAUtBkCEI5fAFINKjohOcVKP03ZRswMLK8MhPH18xOXPKGyu81ap4c/bWnQ7FyS9iien0CHdnjyvpazfCsFsx52kK4GtL8lBRvIHxKGU28ca6lmWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719994955; c=relaxed/simple;
	bh=Oet0Fw6UZhL6r9RXiz2DBvDfDkSND7S1fHsCJf/hH+c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ii0qXYH5kcq+OeglTBY8JqL4h2Cuf+pXWbftJhcZ3wMVB8jfhfdoKHiHm1Oe5JuRdrR3pkg7OyAj9YZ55H0TwiocpGcp/XiFK/rbi5+49XZCLxsMrG/BxwrenZjYl1U7CyZa2sNv8astRNzVT8rdQhSKafDFHHhA2tdq1cMwriU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U3Vq33r5; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U3Vq33r5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0I1Ss7Z+lUAEtHrmOpIo2O9Qj1cCJno692+GnSZ0ICsKNRXXRJzdc7juh9M4P6rhCJnsiJkGDmGpGX5K75tirPk+dos1O+22VOPe73CH0FGg7pTanpuvS/Qv406b6MQ4/NdhtsQTy5tSahhniQN7MtwmmyRfltLgGxw2pvit8Cr8ClQ4vbn8O3aWlrvp/ymQmorCfMBM09KUu1evLmX1UbFIDPFZx29/NlVY0JAEwcGpx5EXsRbrQDmIKpEtIdb23kWZ5Sg6uc4jGkCQdTqUACxmb6Hp+hi5lCXfIIZ5mRXzIFrjVc68UrFdtun7hDH0d+ozl4Tw0epS3wjAy0JkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJofUk7T5CopKfLgKv0pevnO4UOUvMB64tcJvbppMxY=;
 b=N8JZ/qPqMRTRlaw7zLIPWPq6CsedmGk/PxVzhHoX/eoiEO/piNgAiH52shDsoPuBLoXnJi3Ll3LjkqSPpgy1ujl1XK7hsmlud6yBolgG8aBrtZymjzbSJrKagfn30zmaze/HHyzl+kVxcv+Z0WlwccEVoMg/WU+yz/4rEPP3ctax9Q9YaIdaiN5lAo1useioeoSOsa0cORl11uKHr0Ikz0OgEnDdbOUqnquhcNfTPtgyw1AoPRWmXsWAwaFR3hztuRcc7mukV0ZHGPPxMV+XKiVzrQK570RabgD9z2ZT1Ty73dM8rmzaPq89hmLLLxb+NX0WbWflFUDCOhKU+jJJGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJofUk7T5CopKfLgKv0pevnO4UOUvMB64tcJvbppMxY=;
 b=U3Vq33r5D0l6+pLIYmbcQPXDd0rdSJ1Bi6+khe+M0dZx9q6B8SKigJp5vP7YE1RbZJpadASP8MPH3i89UWbavaYBIuRe8JeXt/AY1wWAYOYz8KrVyenKQrejFCgccyngUyNF/3PueMKL9mM6xtf3oh/LQn99P3RQvglBPSBdeKTyn8wpBJU1T5ccTgGowibt3un1KuOOXzNDe1zX3V+Rj2rqDmJIHK4+FvHBSc3p1TWMmrF4Vac+mSQfY+hpQn/XBpNehCLuTtpPJuMtRkkHEsJkKIUsaj/vY+Mh2WRqxLPmfuFiMr9QBRq/veDlEa075jKUXqKPDRMyl0B/sX1m7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS7PR12MB6357.namprd12.prod.outlook.com (2603:10b6:8:96::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.33; Wed, 3 Jul 2024 08:22:20 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 08:22:20 +0000
Message-ID: <bdc112cc-c004-4137-88fe-fcfa81203ef7@nvidia.com>
Date: Wed, 3 Jul 2024 09:22:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Adrian Hunter <adrian.hunter@intel.com>, Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <23aa9894-f913-409d-a385-8813711e2898@nvidia.com>
 <20240627111941.GA4523@lst.de>
 <9cb2b062-1b37-4d1d-8731-da69c2fe7a74@nvidia.com>
 <20240627124420.GA11113@lst.de>
 <0df2f214-0d0d-445b-96a5-03fd70da0dde@nvidia.com>
 <1a913d79-6a34-4b19-8ed2-6a8d5ecdbfde@intel.com>
 <20240627144738.GA20202@lst.de>
 <6a5431e1-fdd2-4595-9cbd-95f8d589cd94@intel.com>
 <20240628123214.GB17080@lst.de>
 <48066c53-e421-46a5-a3dd-ecb7a024dff9@intel.com>
 <20240628125129.GA19835@lst.de>
 <617e143f-173b-4c74-a039-9a166efbf879@intel.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <617e143f-173b-4c74-a039-9a166efbf879@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::14) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS7PR12MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: 613c965e-c8c3-49f9-c368-08dc9b3941c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDRidHFTYnFlRDJ3RHc2TEl3MWhCQWorVXVtc0dnVzF6T0E0T3krOUdYZEVl?=
 =?utf-8?B?b1ZaQzkzNDN1aDVXRDVsajlPZHk2ZHVhTXN2b2tRY3phRjVTSFViWHRpMmdi?=
 =?utf-8?B?RWtERXhOVE56N0sxRzFSMEZPUnd6dUtsYTBMRzhJQThKa2x3WFBBNDNCWEov?=
 =?utf-8?B?ckRkeDRmbjZ4WUxaUFdqbXNUU2N4TmkwUVZQRGZ5OHJUaWM0QXNZN2pmTVR2?=
 =?utf-8?B?Ly9uTU51dUVSeERTM0NZODRWeEFJL0QzeXVpWE5HWXdCU0pORVpzVFVNSTJP?=
 =?utf-8?B?OGlacEFiNEk2MHZTM2ZlV3BjRU1YRnk0aUdpckx3NjZwRlFLU3h1Y3pLRTRm?=
 =?utf-8?B?d2ZsVE83Z3V1OTZWWnVzS0NNVWpabWFYeWsxcERYdWNNL2E3eDZwcnVFSGpw?=
 =?utf-8?B?aWpRLzkzd3hyejNXc2tjd2tGU2NiTTY2TnlEcUovd1NpK1FDRmNMZzdOMTJT?=
 =?utf-8?B?b2pnay9wbFc5SyszWTdSMDhFaHBKYlZjM1pHM0p3MFUxU1V0S3NCVkRIeWFj?=
 =?utf-8?B?MXIyZlp0eVYwczBaK0hOTXpZQVZBT3dmSHJUTzFjdGJvS2JEU0lYWEM1NjBL?=
 =?utf-8?B?UjI5eWdhOWNsNjdlS0JuUTNtWm5JcjAwaGtKOTNnMUNLdEF1bXpYQlFvRFg4?=
 =?utf-8?B?TmdZNUpGTG5kZVUwVVY0bGViRFBTVm5lU2k4Q3JEZFBaNWozS1R0dUdrQUkx?=
 =?utf-8?B?T2szeHAvTWVXNjc4bzZIVHpPSG1kS2hkN1BmTDAxMDByOFZXOUNiVzEyb3d4?=
 =?utf-8?B?YWJ6NG01bDFYMGxYV3U0QWp2VUNxaXhFRG5UYTE5WjJDT1JjQUNINHRET2ty?=
 =?utf-8?B?RGEyYkl3cW1oRFg2ZUtZZVl3NFhla2JveFdlYlpOL3crQWFaaDVjbFdPWjZi?=
 =?utf-8?B?MEcwMFNvREdrMHJ3YkFNblVsYTVZU2dNNTFCRXU1L3lmYXNTMUdhL1JBbmd1?=
 =?utf-8?B?aFNkUmppMEczOXZaYm13L3JFTkdvTzNTWjlpa2lCV1p5OU5hY0R0QXZLUmVk?=
 =?utf-8?B?K3JFVkRsUGU4TkRCSzFmZVRMcFEvclo4Ui9meTR0Q3c3d0xFZUtUOENpUDdL?=
 =?utf-8?B?Zko4K2JVYUpvTzZiellPemM5dUk2T3pSaElRTjNLSXREaUhXczBWY3pyVUdU?=
 =?utf-8?B?T2U3WGEzQitMMUNhZHZLQmRoSVc3eU9wTE9kK2JURXpySTVzNzBTR1B5OWZD?=
 =?utf-8?B?MlhmQWIvR1IwZkx4YWFqSnRTZWJJKzFwQUhLaVBiNlFmWG1HNm1TOHdaVTRQ?=
 =?utf-8?B?YVkzRmJSWjZsNlN4dGUxVFA3ZjdZcUFCNUljRkErOTdVOUN5RG5qbTRmcGQx?=
 =?utf-8?B?Ky9QbmZEa3pVbnJLeGlXeXI4eDBHQlVIYnhxT1JSdGd3bkU2eTVsNkVRVTRC?=
 =?utf-8?B?SXIwMDVHYjJOOTZ0dmJaYk4wRTdGM0s0K2lVaGdEUCt4R1ZvRmRnRy9rZzFu?=
 =?utf-8?B?VGluM0RnQ0dHTnZYMFkzYTN1N2hpT2M0RU4xdlFJVmQ2d1VOY0pkQmFlQjVT?=
 =?utf-8?B?UXR6aTZVS0hUeWxmTGRLckVXZTF1R1pyRkE1R1ZTV0RobVZJb1VEYnNER3lR?=
 =?utf-8?B?ZjNPMEhrTVgyVmZrQkpjOXpLUnJOY2lGNitGQklpUnJQMFhUL1lKb0JOM1Fq?=
 =?utf-8?B?Z1huUnc2bUc4Sld3NmFBVkNJTEFQN0duOFRvU2I4YlI0cUVFUldTOUNKNER5?=
 =?utf-8?B?RVcrWFZKb0h5Z2x6blY4d2xUZ3k4VTVkTEh3VXVic0FnNlJoYmU1SGtXdmdl?=
 =?utf-8?B?MkhCRWViRlJFZkhrL3RpVkhjc2ZyRlJxQlNrVnlsRzUraTNwNDBhNnlKWEFh?=
 =?utf-8?B?aVNTUXpZaG5vSENEY0VpUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjBVVjhUUzRWTElObFhURUhzdWFJQVdYc3BWSU8rTXlmSDUrckVsL1Y5WC9Q?=
 =?utf-8?B?aWVoN1U0TjBsTUd1NVdnaXNDYURDOFBKRXNsRVRpdTcvVWJFUW5GRGV3WDZj?=
 =?utf-8?B?M0ZwaDZZd25EUUxHQkNJVHNVM3IyZjJBU1Q3YmV5L1F2a1FFNVpkRHVTT1Yr?=
 =?utf-8?B?N2JOeUpEeWUzRDNqQzZ1dXJ0cEhHb1MvQmhQNXFKZXUwUkhldTkzZ0lkMVh5?=
 =?utf-8?B?V1c5czNpS3RDanRIME5EeUpHN0RjL2dPMFY1bWcvMXpoWkZKZmtEYys3OWwr?=
 =?utf-8?B?TlVaY1k3b3VaWWZ3NHB0Y1oyOEhqOUJ1WSsvaUlIUVZ1am1LbUlYSW5PV0lE?=
 =?utf-8?B?MlZUTGV4VzlFa2pFMDYrbFl6cTUzYVg3TWNkM1NnQTJWQ2crbGp2blRORDZl?=
 =?utf-8?B?bjJiVGlZUEtrQjNYVlNWWFFTRWtlMUpXSE1zVjFUQVR2MTNGMjc0di85TWhY?=
 =?utf-8?B?M1dPTzhCQ2lGOU03R0pUcXVSdnYybm9BMXRPRVpyakpGQkJYckVmcE02QWNq?=
 =?utf-8?B?bm1nWTh5bEpMaFdoQ1ozMUlweDhhMXhtVVVucXlHMVpTc1ZrbmMySE1jMnIv?=
 =?utf-8?B?cFN5dE9qN0FpSkdnTWEvY0ZxalNYVTZlWkNCRUpVOExDYkk3RnJ5UWVaYzYw?=
 =?utf-8?B?UGRpbTV6UDNHaU5YRVNJMUhKYXZ2WVJJa2RTb2hhcThYaVQzZ1NvdUdLSGUy?=
 =?utf-8?B?bGQ5UG83ZGZiU3ZCWlZORjU0dkF5OThQWTJVaUp2cWt5SEw3LzRxbFdlZ2xP?=
 =?utf-8?B?RWVwenhxUEdTTXVqdDFTamJScHIwWVUrTVo4NUE0T2k2V0FQY3h2R0dSa3hv?=
 =?utf-8?B?emhob20wZGtXUUorYWprTjhsWVBKSUhnUG1kanRjbHV0clFyd1NIZHZoNU9y?=
 =?utf-8?B?SEk4WndVTGlMQW9QTG5iekpNV0dMYlN6bkNVaklhY2JkaHpZMXB2TENwQ3kv?=
 =?utf-8?B?bHExeFNrek14bk01WEhwaFhlN0dMMHdUVndGWVhBK29kNE4wbTVGUlFzWGtN?=
 =?utf-8?B?QTYyV05aTEMvTUVWeGo5NENWNTJTMEI1ZDI0WGtiN0ZHUG8zbktBaitWS1Yz?=
 =?utf-8?B?aytZNk13T3g0cHJpZDhMMStkdm5OM29sWDROdXlXNU9IU25XWUlhQ2R3dHU3?=
 =?utf-8?B?ZlRYZFBmRzQ5TDQzempLbXdPd1Qyanc5bkI5bkhWc2h6MzV0alBWb29qODVN?=
 =?utf-8?B?cmZtNExSUGRmeEtFOFNlTW9kUUEwdCt6VnUzZHVETktFVWtTY0VSdmhQTXln?=
 =?utf-8?B?S3hqaDRncnh0WFQ0eDhVVjM2emdoN2NSTFVrL21SbFoyTlZFV1NGTXFGU2h2?=
 =?utf-8?B?VnhBREM2Q1NyMHkzMytiemxQTkFpU2x5eW5EZmtwd3g0TUNnaWZGa3NpNUE3?=
 =?utf-8?B?RlFPYzBJQ0FydHB2b2RhS3l1bXBtdWhEVEZWaFg4MnlvSHFHRmJOenJhbnBk?=
 =?utf-8?B?RkhsdG45ckxhdmFpQWJzWVFINThuTDhQTjhuWm83clJGUkFIOVdKTVAxQXNh?=
 =?utf-8?B?VWFEWHN3WldSTGFTTFRZbHc2TGlBL2VvQ0FVYzRoL29VMEVuVitxMk1IVi8z?=
 =?utf-8?B?VGd3Ylk5UEpRQnBUc2pTMjQydW5mZjcwUWNwM3lrQmZoSWtSZ2pldldZV204?=
 =?utf-8?B?Z0d3R1lNRkh6RzFXZU5WV3h2MXp5QzhJbG5GSkozaW1OQjB2c2pPV2lpaWFt?=
 =?utf-8?B?ZHJyRmRJT0YrbTBTY2w1djJVaEdUbENxRTF3TUZtQlNQSTA3eWtTM2NmbWJh?=
 =?utf-8?B?VDNVV3N1Q3AySDhPanVGamxScDl2MVcvZVI0RzJtVis1RXR1NHZLY1hicjAz?=
 =?utf-8?B?MXpMNzNQNkJFRlF4eEoyZ1Ruc3U4R0xEbE1hRlRiOTJXa08vbUMrTXNMWlVC?=
 =?utf-8?B?N3IyTG42S2FoWTVxdSt5cnlleXJkejZoVmVsc1FLY285dHZHallEQ2xiMTd2?=
 =?utf-8?B?TXRQK2oyYU1yeHRBRGpHeEpkb0JiTkNHNnRnamVsbmhDa2ZrRjBaRitZNTJW?=
 =?utf-8?B?Ly94d1BrMHFzUzZWMXVKOXJmTnZOQ0lVa0o0RWRCbm5ldGRQeWplWUJ6cXBv?=
 =?utf-8?B?RVVtNzl4c1daV3pjNy81Yy9xMWkzNHl4VnNQUnRXMUc4bFU4RmNTaGVmYWlO?=
 =?utf-8?B?THlFN0gyak55Y3ZiRW44RjUrYzFTc2pmQzJLQThhZ1VvZzJaUU9qZWtFQUJ6?=
 =?utf-8?B?ck5kSGhiNDAyOHRraUUvRDJPODNQQzE0NDg2REJPUTJiYjF1bUVjRkJyTEw2?=
 =?utf-8?B?TEx2cUhuejU2cVExR1JMa0FxYTB3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613c965e-c8c3-49f9-c368-08dc9b3941c8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 08:22:20.1313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcbGLsKiEtXT3ZFhcKdNuWPhf6gMpLMt/iX6RhbdtXDQNUehz4M9/0R4tEFNu4aSpmHG9xXp/9SBvZQEh3JVvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6357

Hi Adrian,

On 28/06/2024 14:45, Adrian Hunter wrote:
> On 28/06/24 15:51, Christoph Hellwig wrote:
>> On Fri, Jun 28, 2024 at 03:37:35PM +0300, Adrian Hunter wrote:
>>>> Hmm, I thought the conflusion was that it can be more, which is why
>>>> you proposed to increase it if the PAGE_SIZE is >= 64k.  And based on
>>>> Jon's report at least for his tegra setups it works with 64k.
>>>
>>> There is a workaround in that case to split to 32KiB chunks
>>
>> Which I guess is less optimal than just using the block layer
>> splitting?  Maybe add a big fat comment explaining this?
> 
> Improving it looks straight forward, but then there is testing and
> checking the code for anything that might be assuming an sg element
> is not more than 64KiB.
> 
> However it doesn't seem to offer any benefit, so it is difficult to
> justify doing.


Did we come to any agreement on how to fix this?

Thanks
Jon

-- 
nvpublic
