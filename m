Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4C2417EF;
	Wed, 16 Apr 2025 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744798821; cv=fail; b=d+IuuLneLaTWpJvZ8AebTlOeOBkNzw6E/m0+nMDx5DhJWcL6cYGhpR0wcVrS9l9Z+9Zdw3xNsqxOFWge2dbD/H1KnxncIL3ZIPSSJoZAqFBuaub5xSpHywyu56PUQqGwW1HTh15XuZEwRa9XEgajpy29iFdlUoVty0b54cifZtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744798821; c=relaxed/simple;
	bh=cqAkv+SJo+vYxo3om0z9KAUg1MnAEV/4095xF65i5hY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IDgvk1+7vuEHCyTvhtuIeqIofxAH0EHKY58Vf/RWr4e/tv6nGoyxF7CJZVyMEK+QME9nN9nW+yNo7N+fGtS7R2dh6AZ8Oy7soQ+5y6OfpkKU8XQERi39DYCYDPvTiZVzFs+g00rc3GSqolfnfrCobYgUinqMB+Tk7HYOQxCZEWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VD+UPesT; arc=fail smtp.client-ip=40.107.93.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VD+UPesT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iY5ZaSbZ5K07eUnuaxXMVY44Z9xHv0tQiRyNXix28UGKyfeNW1lvIgPINJfiFURqeGGt48tOGhYAHzv/EyIjqPONiNOKK2yYk6MRD5O31uqJvMIBLroURcqPGZt1XJKM+A1imBrEvwyh97Xloq+Oc9VCTi6QFtdc394S67JVJy4FknrVO7we2pczSQgNYxIiGRZnk8B0naq24VeGsIT6sGVVilGzUsXBKBtQ6KLNLZxX59v7R0/cVITsOs6fbhJ+94oe5gwH3W1zyn/xEvboHNfXeI/AtImAo1tn/C+svmSt5HGhwl/X2lr2Sfi/5lj5oCxkTCHjoxzKHtTNi5WWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iPeuT8oVJSNyxYPpqQ84njFVxC2KteUUiBvXByEmC8=;
 b=GFGzuR7bgMjGlyVPPFBER4lPUKn2qFy28ii1DgGmomIKMCXbqNF66IZ/bH0bi61GaaUhTj70bJqVuyw5ER4xhwp21oG+9ufGVVuu/OindjjaDq2pmlhRZKRnaeFBYPhA+j2WX68jzdYNrtYGUCyRu079HDESObSRfGfRSx/NnX4QXKGtIBJOUTGXYYBMv4mLpQSuGOWfcvAlmLkj8TzhTOx1LyZmTbAw5GSnWmV+TGvzjsXqFlZsK6bugghIl/XtlujdxIMboMvPvSiS/spWsjVLyYhZYanxBz9MI9xQZq87N5ULGSi4IvEl6b3ma5OZolM3wlg9hrROI4YeVRTnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iPeuT8oVJSNyxYPpqQ84njFVxC2KteUUiBvXByEmC8=;
 b=VD+UPesTmLwKQWcd1SjQNjyT7ogzNK3CZsPnxSuXztUFa8cBwnyxIGqBzCFl+gCDTxxrp/MnKiNuOSL2kCdOt5JF6kp48BSj2f28w6iXBHMKHNDNnM8AlzutABVUG2clOneAxHt9v6tmFjXqNFfrERvO/v0qyCYvaRWemKnza0xLd3PaE79f5JSXLZ6NZ/czB+D1Tw9HIr2smmAYkc9lhAN5CZivq2YzPOkNWGQdCHnKhkEUaRSOeonjYbY7sonZSvL/b6yLKcA9K/eBAODaCzWLFAUQxe5iAFqC0C3TqOyJPKoIOOTVw4nw7K0Yj27aiGYEEUYVDXoMxVUCtfcqsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 10:20:14 +0000
Received: from SA3PR12MB8761.namprd12.prod.outlook.com
 ([fe80::f72e:615c:e83f:b78d]) by SA3PR12MB8761.namprd12.prod.outlook.com
 ([fe80::f72e:615c:e83f:b78d%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 10:20:14 +0000
Message-ID: <6e0b8bb7-c9c4-4625-bad0-552dcad89ea0@nvidia.com>
Date: Wed, 16 Apr 2025 11:20:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usb: tegra-xudc: check ep and ep->desc before deref
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe Kleine-Knig <u.kleine-koenig@baylibre.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
 linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
References: <20250415174204.GB6814@altlinux.org>
 <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>
 <20250416095555.GB27292@altlinux.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250416095555.GB27292@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0531.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::15) To SA3PR12MB8761.namprd12.prod.outlook.com
 (2603:10b6:806:312::15)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8761:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c35645e-7483-4d80-eb92-08dd7cd046ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akhyUjRkMWxLeW0wSkhveTlUUHl1a2JHVzZIWnJwYUtDRWRtQWdIRXJXK0VT?=
 =?utf-8?B?ekJjOGRSRDJuQlpPV1pUVG9tQTFPb0lFaitCVUI3WWpKOG5HVmJVVkllSXYw?=
 =?utf-8?B?S0xTZFJMa0FNbG1USFdkVGhzOE9MTER2dEttV3pkYjFoOTQ5YnhlMkxsaWNl?=
 =?utf-8?B?VmdrRmREM0RSSEdoRUY2OUV1bmtZb3pNV1NiZ2FOeVhTczhsU2pLaDNjN1l2?=
 =?utf-8?B?NjhCYVFzSmxvNG1qbjY0WUUwMmlRVW1mc0hKaHhtUDhEenFZSE1nY0VzdElu?=
 =?utf-8?B?dlZkSTZERWwyMDJrWkF2SjVJTysxam4zSjhRUFp4QU1nTXE1NWV5YlMwcnZ0?=
 =?utf-8?B?SXVUd095VG1tdlNlMnZERXdOc0JPeWZ2TjZhRi9aNGJ1QTFtWDFleGtNUlRW?=
 =?utf-8?B?TVl3NVB3VXVWWGRXeC9yQVk4N1BjOEZGV0U4OU5ieG5SYlRyalJzNmg2Qnkx?=
 =?utf-8?B?cTAyZDY0REluVm00OUlUKzhiaGxzcnBuYWUwbm1RNE45bWx0MTdqUzhWbG5p?=
 =?utf-8?B?UzdxcC9GTkZVcXFJS2JPT3lDcktmS0JvKzlvU0VPNmtwd2FiSk83UC95NVVI?=
 =?utf-8?B?b3lsdWorZnBaK1JGc0tJTG9CeThoNjRQbFh5djhVUzVQRkYySWFDWDdJMEda?=
 =?utf-8?B?dDNibmYxQ3hNem8wUy9QdFpsN0dlNi91dWwxQUtQNk8zN1ZDaW5QT0FNN3Rt?=
 =?utf-8?B?N1pBc2hUNWw1OGpZOGpRUUREejNxdTRxN1UrSytBcGpCb1hzZG5xbG9UQWVM?=
 =?utf-8?B?WEpObHpoRld3N1Q4dnpGc1NmUFJnMWRVSWxPUlp6d1RzeUtMZk8rTzRiN2ww?=
 =?utf-8?B?RG03WURRNVZCZDdWbDh1ZllTaHAwdFBqLzhveVlaSng4LzJHZ0hpZEdJSktU?=
 =?utf-8?B?WFdLTmRWaEZBMWZ4eTIrMHBVNmNvY014TDJ4MTlLRnlKZUV3LzdnM25UbUhk?=
 =?utf-8?B?enBhbFpKZjRVaVNMblM3QUdmYjVITDl3U1BYYTRpSDFIVlNpVEs3SHlYcmpW?=
 =?utf-8?B?M04zZ0czWVFVaEwvaE0zSUlpN3plVlo5ZExlQkE2TkYvbDlxSFRzTmgxc0pX?=
 =?utf-8?B?NkwyNFpVdHBrWHExRVBTT0d6dlpsNEEra1Nib2hYUmkzR2JobUhEUUhzdk1R?=
 =?utf-8?B?UTlYaVZ2eFlXRWswQ2piL2I0dWlCN2J5R2FwRnNIejgxWVVNVmpJNFFsSlMr?=
 =?utf-8?B?R0NLWm8xck5LUDlsWmdTeGI2S0RyQmtva3FGbEpYZTQ1dDBkNlFHOXZmQ1ZM?=
 =?utf-8?B?WXdzcENMUUpheTM2RGI2OWVUSHd4ajRLQlpyZFNGbVF3ZEsvVmNmT3JwRENj?=
 =?utf-8?B?bCtCWXpXcG9JdUVyQURLd2xuR2lFaEh4UGY1Y0tvVXFZbEhmS1FjVDNLcUxp?=
 =?utf-8?B?blRSWXVWdlFpdTZtU3RIYno2anRVYTlpNWc1VzlzY3VScTdJN1BCbk9sZ2la?=
 =?utf-8?B?S3VhUFlBYjhjaUxrd05WcjNWeGkrYnZpZFlaM1RGaXdoNGRBWHFpNEV2MHUv?=
 =?utf-8?B?OXpCUStRYVhPNSs2a0FIREtvdUY3UFRIenBveXFaVmZ4T3BFaktrL0x2dHZJ?=
 =?utf-8?B?dk5YMWZCVWx5S3Q1UHU4ZURWVmIxT1h3R1lUVHJJQ3hxblVJdG5HMjdIZzFR?=
 =?utf-8?B?d2FtWnZVbFR1M3BrQjRxZnJBNG1NRmdrMlhrcnpKOW52USt1eG5yRkNKSTE3?=
 =?utf-8?B?ZVYyYWp0aGlYVFN3UGVla2lLRFBKZlpMSVowaUlwRzArUk4zNDUvck1mNFI4?=
 =?utf-8?B?Vm5FUjIxZHJpaXhYQWs4Y0FsN3ZpVEt5SVBhcWlDWE4vMXF4RXYrd1dVK1Jw?=
 =?utf-8?B?RkZwVURVQkJJSzhBSVN0bGl2S2dnZjJxQndlWTVCV0VZeElNRGcrMHdxY2x0?=
 =?utf-8?B?enpmcC9ReitHR3BUYWtGV3Zha05QZGFjaTY2alE3RGlCTVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB8761.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjFvcDA1V1N5OHlQT21QVlpKWVpDU21vZUF3UGJBUWV2OGNIUWdLKytzYVFL?=
 =?utf-8?B?VTV3amZ6bTBpaVVMYmE4NjlrbFRRNjg3NUNQUGNNM3Z6YlB4WW93emJnMlEy?=
 =?utf-8?B?ZlRvdWlLeSs2c2wwbE5XSUF0cjEzTjB2MG9RQ2t4REdMblp3dS9CdThmbVhG?=
 =?utf-8?B?blJTeHNrMGE0VXR3bEVZNzBCK01yTEtySG1RSWZKdi83clFXZUJ6WUs2Tk5u?=
 =?utf-8?B?YXBNSXRYYVNaTENxbFNCOEVNUytsbWtkTXF4c3NlbjZjbXNhTmlGNktPb2pX?=
 =?utf-8?B?WUtVUTVjVEx0T1NydDVaM0hjNXkxdkttQVhTZDZVaDRRNTU2aWRiRFNhMTQ3?=
 =?utf-8?B?YU85dHF6MmtXRmlaQWdiYzB3UkRtSGhROHhJd3N4OHMrTXhzbHVrS1BlLzZi?=
 =?utf-8?B?elM0a2VzQzM4YXFLTDhTa2hUaHp0eWFlZFFGVW41NHppaFVpUUppeHdqRWRm?=
 =?utf-8?B?NUhjRTFZay9pSjBEZk1adGJTUGs3KysxUUVHaWRpVDQ2MTZZV1JScDFtNGJq?=
 =?utf-8?B?eVc2KzVDTWpFaGhURWV4aVd5ZldnOWEyc2hVcjFKeUtJZzdOR3VyU3ppRm5m?=
 =?utf-8?B?bWlDdUlNaE81Y0lYd1YyQXVIYU8ydDRrRjdOMEtQK2FveWlUUml1cnR2a3Ra?=
 =?utf-8?B?UmxEWWJ4Z0huUHFCRXEyd3JCZXpPcURxZCtZN2haZkRVOG05OXdmdVdicDJK?=
 =?utf-8?B?Q3dHUkxnZGlRbVMzbXdWdG0yZXp4ZGM1eG92dXMwV2VueDE5SVFrc2VWclRL?=
 =?utf-8?B?RE9selQyaTAvVTBOZkZtc0hjTzgxRDQ4aUxvekdEN2ViaEJmeStwL1RjRkM4?=
 =?utf-8?B?N3Y2ejRLWXpJT1Bmc3VRYUVKeTFSN1hoby9NYlFhSDBLL0dGbklUeGVjeEFp?=
 =?utf-8?B?Y0FsditqaWdlWTc3K3hqNnQ1bmM1dnBYaldrVDArMFJyV2xPa0RkTVFpV1Ft?=
 =?utf-8?B?aHg2RUtUbjdCdHdlSHlyS2dpaFhTemJGYmlVRWJLNE8wYTQ0aHQ1bCsxRHgw?=
 =?utf-8?B?Q0lONVIrZ1IxMnp3ckJLNWdrV0ZGaE1KdTdmdHIyMDI4MW1DRFJSOUhCU2JE?=
 =?utf-8?B?ZU5uQmN3dnRyemVnK2owdmwvMEpkVFp4ZTBBcVdHaWJ3MFVwakc2UmNISlBy?=
 =?utf-8?B?SU43VUhubzFQLytTMjJTdHVCU0dyOEh0eUx6ZjUzTHB5c1hKZHBodjFNcmhT?=
 =?utf-8?B?ZHUwOWNOZERidHdXYjZabkxTS1FSaSsybHJZamU2MlY5UzI1Nm5WTk0yWjRa?=
 =?utf-8?B?L2R1NksvdDN0TFBFQXNURjB4T1RKZ2o4QWtlVitCRS9QL0FRMW0vckpSNmMy?=
 =?utf-8?B?cnFZUDk0am56eE5MajFHc3RpUkF6bGxGdnZXTVFpTHNsUnNIWCtIeGUvNGhj?=
 =?utf-8?B?OEZHbFVac24wR3MxRlFDTVJUVVEwVDd4V0lsVkZodGdYeU9Qamx6c09rRUZF?=
 =?utf-8?B?OXp2MEhvV3BDc1ZieVBNejF2SUYvUE1kYVZ4TkVnZWJMa3RlejBSK2pVNWxE?=
 =?utf-8?B?aDUzdS95T2ZkZEtIdTZMeWJ0OGJmK09yT3AxOE80alIzTXJQa0NXekdtSlhv?=
 =?utf-8?B?OTBwcHlFN3hiYUFtZmxNSHJqbDJZZ3Q0VXFndmpDSUUzejNkMXFQZFYzN1lN?=
 =?utf-8?B?MTI1b2ZPN3BXRUVvdDY3ZTZta0ljUmNGSGRtL1ZWcTU3VnRaMS9zV1RsU3lM?=
 =?utf-8?B?TnVHdWRSeGZBeHk4cHRlV1h1U1kwbjFOL2ZTUCtlaUZCZncvdEg1V1VSVU5s?=
 =?utf-8?B?N3l5N01lMHdJMGtsNWZKZEFUdjQ0NlZpN044VFpHREJNNytRU2hLKzNsdjFz?=
 =?utf-8?B?Z1VuNTNGaFMyeUxkUmlyNHV5MGhYay9tenhKeUFiNGJCOUh2NUw1MWYxQVlJ?=
 =?utf-8?B?dVBnRnNSNVdSVkc2UkVlZlR2RG5tT053NlFVNUU5c1liOGRreTBvYnlKVmQ3?=
 =?utf-8?B?NjRLYTNNQXN3UjJLZ3hWNGRtVEtqRUQ3bWF2OTduYjYybHFHU2VNaWhuMGZZ?=
 =?utf-8?B?R0IxaGljZFBtWUVJV2V0ZU5adlI5MjBaL2NMNGlFMkkrWnlMN2ZtTjJremM3?=
 =?utf-8?B?ZWgySlM2Z0laY3RUU2RyNWgxNHc0dGJUcVJLMzBxd3lEZldhaEtTNGV3RkhR?=
 =?utf-8?B?S2tTWDRCS1gvcm1zc1dRNHkzRTV2TWY2S1RrOC9oc1oxVVJHMGhxMWlONXZJ?=
 =?utf-8?Q?pr+2Y4/QuqHTxPdAEBm2VcgbtZsoVdMKV82QlmZFUaWo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c35645e-7483-4d80-eb92-08dd7cd046ee
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8761.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:20:14.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpQFS0F2/PF1Fsbem2HuT9Vajla0QVdX/Mx246TYm82anYt5Ub3GMaLoiZeUwatf6B6Jy6AeGAqoxmuZLzzR3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642


On 16/04/2025 10:55, Alexey V. Vissarionov wrote:
> Check ep before dereferencing it in trb_phys_to_virt() and ep->desc
> before dereferencing it in tegra_xudc_req_done()
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org)
> 
> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
> ---
>   drivers/usb/gadget/udc/tegra-xudc.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index c7fdbc55fb0b97ed..cae99ebe9f85868d 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -2658,9 +2658,23 @@ static void tegra_xudc_handle_transfer_completion(struct tegra_xudc *xudc,
>   	short_packet = (trb_read_cmpl_code(event) ==
>   			TRB_CMPL_CODE_SHORT_PACKET);
>   
> +	/* trb_phys_to_virt() dereferences ep; check it here */
> +	if (!ep)
> +	{

Please make sure you run 'checkpatch.pl' as I am sure if will flag that 
the above should be ...

     if (!ep) {

> +		dev_err(xudc->dev, "Unbelievable: ep is NULL\n");

I quite like the 'Unbelievable' but 'unexpected NULL pointer for ep' is 
also fine.

> +		return;
> +	}
> +
>   	trb = trb_phys_to_virt(ep, trb_read_data_ptr(event));
>   	req = trb_to_request(ep, trb);
>   
> +	/* tegra_xudc_req_done() dereferences ep->desc; check it here */
> +	if (!ep->desc)
> +	{
> +		dev_err(xudc->dev, "Unbelievable: ep->desc is NULL\n");
> +		return;
> +	}

I am not sure about the error message here, because the existing code 
just skips this. So it is not clear if this can happen and could be 
expected.

Jon

-- 
nvpublic

