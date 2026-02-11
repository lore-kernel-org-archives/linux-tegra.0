Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4188353ED6;
	Wed, 11 Feb 2026 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806855; cv=fail; b=lbj56XWS9OP/SCjU2l+wJFkdp/GJrVjfhA76Ond/GF3JZGdmOAvRWX78U7YWidN60iqQ3sqL8OFsiIufTyCNb9zexB7z9eAhSRcKN+w1Z2IirU3IR/t6r5eJY2nRpuSsWzFaJPw1x1AaOmDyDNMW/Zhgh/iPqmh9QzOsBzjolOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806855; c=relaxed/simple;
	bh=3ZoC66RgecGO0Z4eqS25kWGEosDQfaV/erBweAFbrAY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sk3zg3qX4t7OyPdsr1BuJA2p5pR2RozCW1ax3FNxZAV9s+8Uc/H9ruS+nwwU/I4gqKGVIpNs/07/TphyexZ6j7JqC2tz4lOiiC8sKv+y7AAyoLQp59DHXB5ZhRWHeegXQmm3ajjXbXSdMrxNHz/HzE8h9WCN/m5W9/08ox1F2QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kdSSZ2G+; arc=fail smtp.client-ip=52.101.62.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kdSSZ2G+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmMbRlvzTN5h5ElLrpYQ2CxlXFp2PCIPJiC+GOhiqPqaEIgN1V/iPudY2U2b8cUrEl96o+GMo3+NyUGrf7q4JDyJLIl9anMH3DiCuA/nQIQwPa5I61XSQP4Zd2QpBa8JliYFDxhiJyZ2eT1nQ7aWOPIV42jELVrcaHz9IhvxOUee3xk9YapaLASVm9PjfPUPtH1Arya0Lz6ueyiO9zKs7sE2PUM0n4w2fjo0kGEe3MAfss4J8Gpz6O1VSvORNXN2sSXIAEzyneB/4nfDSpNtwwLXJc69fl5La0nuvi6N6CC5EG7f5rue43Beg4H/MvKkw+cCbUAh9PA/HKhsqMWRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIIoZmsbWxwPDN8uE11bDhalnUGKLeH2haDFZ9USlGM=;
 b=x+DP5Mg8ZiSRWlUKUKPAR23xPUmhmCNS9E2daoqA8NBr7pSWK40vNfjKBIkoCXrZdLJwgyD8g+trp/EJ6lANpdIv0zc9mN7p/ANTpTVMstwykQgg8BdjBGBORipijcMZXytrlF6zmhF8u/ITEvGdMRCV78LacTWVO60Qt7MouYkTPd6Yy/9yMlY+qDl42WjW3cqtkW8GAUeECzdsKLNWbalxE5QBk06CrRokh6htd4NkprEalefyhzmzXYaYpWmhpZSVh8Na8eydBrZ/pM7Q8VJndxR7mMDPxURLCnuolg9Z3wOHd97++VxAx6ahWobspMoC322jw26i7HbAEnrWyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIIoZmsbWxwPDN8uE11bDhalnUGKLeH2haDFZ9USlGM=;
 b=kdSSZ2G+UJP1kOCSka7TrgmVxBW/R3gfpSV+7srTJq0Gjt1LF118FYmeYCcvt5ICL5c9fZSfQqz4pNIx9ExpburA930RvSd0Ct2sPYJxYhHCF3Sj/LeIGHa07vvwh8khr0JD3ZFMAXWToTgOUgPwQIoC+k4hyIrPnqQgrZaHPqNrD5K8gNGpNejGbmiwj1LhgNSfVNrknzEAfPaZP6unA2zFdjXRaWLAvPkdEQwYi3NRTcsauwzJaP5SrTUWKLWRc0lDy3j4yY5c88i6GZkZVuUhsxcAodXNL1dBeXBvdi4PWTw1JhFn4Ie5BlMWtyKa+Y0mXXUcSpqI3PFbgDntnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CYYPR12MB8964.namprd12.prod.outlook.com (2603:10b6:930:bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:47:27 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 10:47:27 +0000
Message-ID: <5546962c-6de0-4b92-9329-7e9b298ce2e1@nvidia.com>
Date: Wed, 11 Feb 2026 10:47:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Besar Wicaksono <bwicaksono@nvidia.com>, "will@kernel.org"
 <will@kernel.org>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Thierry Reding <treding@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
 Rich Wiley <rwiley@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Sean Kelley <skelley@nvidia.com>, Yifei Wan <YWan@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Nirmoy Das <nirmoyd@nvidia.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com>
 <20260126181155.2776097-9-bwicaksono@nvidia.com>
 <a3249d0f-17f2-496d-ad53-95ad5da26f5a@kernel.org>
 <SJ0PR12MB56762714BF94D1E67511C43DA062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <bd69c94c-51d0-4166-a059-e46b30cb83e0@kernel.org>
 <SJ0PR12MB56763B5860CE8E93BEB4FF49A062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <a04e5648-86c0-4930-ac2f-a824acb35941@kernel.org>
 <085ad06e-61fa-4f18-a7d4-d88554344553@nvidia.com>
 <05317721-54f6-422f-a6da-b332ea0423a7@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <05317721-54f6-422f-a6da-b332ea0423a7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0685.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::8) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CYYPR12MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: c7221669-bbdc-488f-5d33-08de695af2b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUNRN3hDRmtXdjhzMkVOeVB1WkRqcDFuOHVYaGNrL3dzQzd0NkE5bXJ6VSth?=
 =?utf-8?B?TWRlU3lpcTUzcFFDNUtySFVNMWNEQThLRVZEUWhTVnpjSkxEOGZiZm41andI?=
 =?utf-8?B?QW9QNE01WFlGbmQwMjVMSnp1dEhPRk5tQmVCSkVpaFBoVEVKSTJJcVgyUEFr?=
 =?utf-8?B?aG9rY3c1ZzZsYW9FcENLbFZCbGo0NUJEdXZTS2dIU0JyNE1ZWkkxV1o4ZlBu?=
 =?utf-8?B?R2JJa05RTjZqTjl4ZnE3dGppYnBlS0d5T2xYMkFQbmdmNmI2TU4yd0ZHYW90?=
 =?utf-8?B?TFZIVHpNamFBTTl1azFjTC9PNk4zVlB4T2w4M0pLVEJNeE1QYy9DMXM5UXMr?=
 =?utf-8?B?YWRLd053YytwLzZRdFlRQy83aWJZYlI0YnhBUVlsRDMxNjZmVGVCc0VlQk1k?=
 =?utf-8?B?YjhBa1d6aSt1eUVmdlN1S3o4aVBWaXhZS3ZEQUI3Y0VWL3kvZFJNaWE3YitR?=
 =?utf-8?B?ZUM0blFYM2l4S2Znd2crZ0FTc0xXM1k0T2tvZFk3TzdYOGF4cVRMSEpveVdv?=
 =?utf-8?B?RE90RWx3NHVRVDQ1OWRiZUFxbUh3VEdNd0wvQ0Nvd2RrREQ4a1pVZVc3NGU2?=
 =?utf-8?B?K3FDRTFvV2xFZWNkUjJKQTBROUkvZWRtbnUvbzRZY3I5b1JHUVo5VWdWeEZa?=
 =?utf-8?B?WUNBa0JQRGt0UWZRV2pXWFRtS1RFeEt6UUZIeGhqaWZra1BUeTZudlo5U0JF?=
 =?utf-8?B?T1NyUkpjTHFvaXk1SGxtY3luZDgxdHptTm9CbmRKb09sT042ajdmbWFDKzdU?=
 =?utf-8?B?MzNQc2poenU1NTJwMVo4YzVpelhpZ2tqT2hKM1pTa1lmdWtiL0lZcXRTajBL?=
 =?utf-8?B?Slp2T3B5ZU0zQTZLczB1a3N2QVFNU042dVBmRkVncCtQczhlV1owaGtLKzdU?=
 =?utf-8?B?YzJZN1c3VHBBaVB0SFZPSlJPUXRMSjJVQW5EZ0VDcTU5SjJSZzhlNmdPT0hH?=
 =?utf-8?B?WTMzZmFGS3RtaVV1Y2JMaEF3SE5sWldselRUVnF5R1VjSGthQ3ZPR2sxcFZq?=
 =?utf-8?B?Zk9tV0dMRmRsOEIrOEtmUWtHMnQ4ZlBFUjZoWDdTNTFRQTZRWGN4RHVYVWdk?=
 =?utf-8?B?T1ViT2F6bFZyNTRPcGwvNnZ5cW8zSVY5VGdmRjBYRDBsQll4N2RSU2ZqL0hh?=
 =?utf-8?B?QVRkNkRaRWpQTCtvekh6cFI3cHFVT3pDYXJYSmthMGxMOHdSek13bElESDIz?=
 =?utf-8?B?YlYxM01GUUdmUFpndmJ2N1pRQ3QwSmpuN3g1WWNmR2RrYWJNcWR4RERSVTQz?=
 =?utf-8?B?d0h2R0JMSjJrZ2N0NmVlVThEMUROQ2xEaGprN0o1NnRpZkROZDFUTlUzc2xu?=
 =?utf-8?B?Z2lodlZhWi83Y0JLQmhLcG5iYXBiN21Wd2lrdHBEZkplYUFvQXZtNkRrTjRm?=
 =?utf-8?B?cFFqN3ZzLzFPNE0yckZDZ3NFR01xMzhkcExCRWxHRUZOdFJVSUc2djZtejdn?=
 =?utf-8?B?RU1IQ2krTlhuVStYcFBjYlJFNC9mckF3bUNqMVAwU1lXbndyMFBuQ09NaTlT?=
 =?utf-8?B?clJvOTJVeUI2TGpyZFpVMGFONWRyd3Q4SmRUZUJqYTBsT3BEUlNuSVJDWW53?=
 =?utf-8?B?RkM3QWdhUVNGU01KSG9PUS9saTAwTGJDanMySVdNZUlaUDJtMGoxbU13ZDV4?=
 =?utf-8?B?THI4R1RnbGdOcCtPTFpuYU1qaUJ2WWd0N2JLYkJaaGVrZUtPOWpLSnhXb3h2?=
 =?utf-8?B?OW8xUm1ZVXBiZ3N5M3hhVzhJYzhqNUZpdHdsbXM1SncyaUh1UTROUittTk4y?=
 =?utf-8?B?UmhocUpqZXVqUExDejc0VEJrWUhLdkVqU1BxL3pCOTcyMGJ5OUkyOHhpWloz?=
 =?utf-8?B?MHFrL2k5TnVoQ3JJYUxvYUsxK3o0NWtMTGZwd2RCSmNQY3M4b0hLTEtZZXpt?=
 =?utf-8?B?MjNremR6SFk5a0I2dDVIa0dtNzJpTVpMRmYrODhtb0FyWDZTbThxdkhVcmcv?=
 =?utf-8?B?cWNvWVRSQVo0SXkvK3RSZWJ0bytUWlJvaHNTTzdOc2gzWFZzMzlQQzlWT0tt?=
 =?utf-8?B?cmptcjRMYlVzWWNoREQ2aGltN0RQSjlsTldRSGRWOWNSNlc2NFRnaFo3ZnVG?=
 =?utf-8?B?NkFGbS81Z0VtY3FHSDhsanc2MlFuTHRhN0dleEdLNDdLdkEyWnpXOStiT3lX?=
 =?utf-8?Q?c/Xo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVkyWjBSTWVjNzloYUZmZFdBVGpEQ0NPYUtRc2pOMTVCTGFSNFRSWkZsOXZJ?=
 =?utf-8?B?ZzltWXBoMVRMOFE2V0ZlR3BvTkY5Uk50RXg3QmxSYXV6T0ZmaXhMZVZtN2Q5?=
 =?utf-8?B?aTZHTzVBa0tieElzOVAwc2U5elBzcWxEaS9ucC9ISmY4SWc1TGsrZzA1RHFU?=
 =?utf-8?B?WXBmWmdBREVRWTkzQmd6TjVKckhlZFZKRkJ3RnlsTjNLaXlrL01BMGJRNEVF?=
 =?utf-8?B?a2RDYXdJZlpwdk90SnJMTG1mNGIyR0RMdis0OTltNEVPN3JLUWw2VzdsYzFV?=
 =?utf-8?B?NWNGdzRqRmxVQW1CUlA3aHl6VXBQVWE0MDdOMnA1bGpCa0ZpRUJaaG1yTUwz?=
 =?utf-8?B?aXF4RnpZdUU0NFd1bDRvOHI3SzZUR1BPaUthaHdJRWsyR0dHeHMwZEErSU1V?=
 =?utf-8?B?bXUwVXpPM0lFb3ZMMFVCMW5MNVozOWJhVjZKRFU4TzFhSml1MjlPTWZEaTgx?=
 =?utf-8?B?Zk96bU5ZWkxXMVpScWNMVjJpM1RoK3NjaEZLZ3VIQ0E0YmxGUHdCTmdxcEVr?=
 =?utf-8?B?VWVlVVRVeGxDanZFTDFJQTZJZnQrSDd6cU4zZFU5TXlSNU9JOHQrTnQ5bko0?=
 =?utf-8?B?SElTMk1SRS9FcTZqbm5lUTNWWlgvT2RtMklKY2N6ZGx5SzhzNEhtN3JpWGdr?=
 =?utf-8?B?ZHpTSEtpMGJLZEwwSE1DRk5zMjdtcURQZmZVY3VQUHQxMWhnbmJRQXpUeS9J?=
 =?utf-8?B?TktMMlBDbE9yQUxQbTdoSlRiWDB4S2hJN2ZJdWp2bTZHRWNldnhSQk8xdnJ5?=
 =?utf-8?B?cnRxNExNSWhqTXBjeldpRnN6Z3FSRmNOTkVpT0lGQUtmUEZWalkxcDRyN2Fk?=
 =?utf-8?B?NXEyTFFFSm1VdFk2ZTRONnhMcU1mamRacGM1ZW45OU03cENxZlNOajB4S29w?=
 =?utf-8?B?Q2p2bXFLRE9sZjNYcWtZcmdDUENHV3lCcG1iMllHUnFXQ2E4RHh6dzJLUGdP?=
 =?utf-8?B?bmlGSGVrR1Q5OWJad2dXTjk4dGpNNkkzKytTNC91ZWNsanlRdlpyWmFRLzdT?=
 =?utf-8?B?dlhYTXU5cmJvRlJub3hRQnZrOFYyY0I2ckZROTY2YktDNzFZYlB3RFUrVHdu?=
 =?utf-8?B?U0hOZkRUY1JGUUhlOG5OSHV2V3RkcnUvL3YwYyt3NC9rL0tsZUMyVkU5aHdw?=
 =?utf-8?B?VVN5MFBGcDEySGp3c1UrMGZQTFYxdlJuZ0NLeXlHS1hmeGxxbmtqUVRYQmh3?=
 =?utf-8?B?UjZmQlh1TVlvQkFGTC9qWFh4Yzl5VGdrRmVwTEVhcm0waHE4KzBKL3ZPcGEy?=
 =?utf-8?B?VXFwWTA1NmdPWGQrd0t4ZysrdzIvblBNNFpzV0draTFVMlpsS1p3QzdDQ2xX?=
 =?utf-8?B?ZG1pUEdqNmRmTTZXczcwWlFIcmE2eEVqN0pid2hYdmpyWUlNdkpXYVR0cnNI?=
 =?utf-8?B?NXdxTGdKaFBKdFpWM1ZXK0JPR3Y3UElqL3h6Yk1zdlhyR29mdHdBNW1QNGN5?=
 =?utf-8?B?ZGhMZ0lTdFlkMFpIQnR2TitZTzdUSjZsVm41RTVpZGlEWjh3WWJwakNEdElX?=
 =?utf-8?B?RDRGMWw1M3lXVEFrb1R6c2MwOFhiZkplQWVCb1FHQkZ6YmNuaEs5T1MzQ1F6?=
 =?utf-8?B?bTZKL25QMVQzVVdoZ3BMamt6WVdDb0pkR1lBTFN3YlFybW9ycjIzRzE5aHlz?=
 =?utf-8?B?aGcrcEVlYXRMWEdnSzhkcUFKKzlNMEZjL1FwbDdqTE0xSERxQ0I3ZUNlOFJm?=
 =?utf-8?B?VldxZWdQRUYyUWVhRU14YjV5OXRKQ2hXYXVJbDcybkRmMzMrNWQrTUwvTzBW?=
 =?utf-8?B?WXZOKzVVaXVRTWlxdlVPVFR6L0U4TnY2OTZ4WDdFODQxN053b0lsT0hxRVNP?=
 =?utf-8?B?WFNzcnV6NWdIOWZOckp4a3VYWThSSVlXb0huKzRsdUluYTFhNzE3bDdDeXBm?=
 =?utf-8?B?dlEvbWZWaC9HeW5UMnRxQ0JtSjRFcDU0N3g5TkNoL2RZTVJNY2oyanZqb0Zp?=
 =?utf-8?B?ak9mN1BaV0ZNWDFjOEI3NDFJZ0NnU3kySWhNN0xqNUplcVU2Q0N0L3lUU1JU?=
 =?utf-8?B?ME05ZmI3eGw2TTc5WFdvVm1FODE0RVo1cVB0dXJPaUpvMmlrK2pSS3NoRkxT?=
 =?utf-8?B?OU11K2dDd3JaaGhoNGxIUEo0aENRN3ZyazVxY0g5STloVTY1aUg5NVVmZjBD?=
 =?utf-8?B?QmNVaWVIK0pEMU5mQnZWYkJ0SFEzbEJXK3NabFpRRmxMZ0lkZERMcU9LMTYx?=
 =?utf-8?B?eldZWThNU3NxcVdTTWNjTEpya2hZRlI2b1ZHWUNmNmtqUGM2N3c1cEhTME53?=
 =?utf-8?B?VnBqOWxvbHZRSyszcjVsK1huWGlOTmcxVGNaM0JTZThTeUhYSEZBV2hyS2c5?=
 =?utf-8?B?OG44TGRkSm5Ra3Y4ZjN5dHEvSHRiL0NYS1JZbDUyVUZFNUhRL2U5anJveXRj?=
 =?utf-8?Q?cgIvJus1SUJPkJC72ex3jnXZezrPqsVc3DiYyuoP6ODzb?=
X-MS-Exchange-AntiSpam-MessageData-1: 92L+9kF5wWxHng==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7221669-bbdc-488f-5d33-08de695af2b5
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:47:27.5125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFwgJQmZz3UD7McOs5N83LC7eTphgwxdX84AeF9FHAfOcE/39lKQDyLGgCAfSQklmzx0a4R5Fl8FCcCBTKAe8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8964


On 11/02/2026 10:41, Krzysztof Kozlowski wrote:
> On 11/02/2026 11:36, Jon Hunter wrote:
>>
>> On 11/02/2026 06:19, Krzysztof Kozlowski wrote:
>>
>> ...
>>
>>>>>>>> Enable driver for NVIDIA TEGRA410 CMEM Latency and C2C PMU device.
>>>>>>>
>>>>>>> Why? Why do we want it? Which *upstream board* uses it?
>>>>>>>
>>>>>>
>>>>>> These are for NVIDIA Vera platform (Tegra410 SoC).
>>>>>
>>>>> There is no such board (git grep), but anyway, don't explain it to me.
>>>>> Your commit should explain such stuff.
>>>>>
>>>>
>>>> This is a server platform. There is no upstream board using this device currently.
>>>
>>> I don't understand why server or not server matters.
>>
>> We should probably say this is an ACPI based platform.
> 
> Yeah, this would be fine so you have entire commit msg to explain why we
> want this patch.

Ha! A good commit message always helps indeed!

Jon

-- 
nvpublic

