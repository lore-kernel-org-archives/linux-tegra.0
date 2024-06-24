Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1939913B2A5;
	Mon, 24 Jun 2024 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719233488; cv=fail; b=rfTVNPv4CcOlTWuL9RunfdaionaEDnfCARWFxO8g4QDuimYkHwND1ysyE2wV1JVN+ip+Fopq9u3kAG4N5A4b5SPYG4wv30uLqqZtXwSI1O3bocVwULfInIALL9jRKEPRIW/vaZtg14Gjkx2UDg+GqdvvH0xD/cnvx0PWKnPWq04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719233488; c=relaxed/simple;
	bh=fvDaJHctH6KA8tbh42GP0ntr5jur6pXoxQw2LhWL+vQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EC+XztgC7jGbLkXC0P60ClHUJeLSVO21X5oo1h0EwlmQcB/YfruPBwV6EAmhraIPINd/4jOADjFTpLT4aoUeSYS+gpEF5I1/CT9o7d8p1m8NmWMh295MHDs0umGbRHo/ryAx6/trkKl5bPAmt8ajNp89F6Ewe43pHzSudexB+Vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W4qEqNF/; arc=fail smtp.client-ip=40.107.94.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W4qEqNF/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdfQOrdUNQiYQpWKog83xQP2f4uvQ6TXcGkJzc8DygBdW4w2O+COhphuYN8UiAeVNTXY7M5Oq+LuIRxpkq9J7urAls2p5wgpDlKMVWf6WiwYYxzu6BpUBHi0N2wCRp6lXGJ4Ox9g3L2T083eAcRg2Zpfw+gDCOMNlFM9/+qSCJdR7CNG0ABNMIQV3kURe0zWcyRdmBVBLu4KPvYR2hGUMJqTc542PzS08SIqQsh+NUhXwbUPEOBmv1FjhZxIbBFl8jLsbET+TNk4HL1FzJ9j4Ht2IjXZsxszWM95fgx1yme/cWq9dnK5998O7ysFVW6tj1jO9l9iRI9/HtjVN4gjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Alv0/4fayj8inzsvTFjuvjMG0WHzNPhge+Mr7OjfvSg=;
 b=lh82rvO8fp8+HOIm6vrek8dL9azePVtUylwJVot/TkVxNAJVuGKoqe135trPq3Z1cYTsE/9Rna/nWraa/FeIMKNUUxkv49fPK6890QvquMpnRNI/pK1iqHsnQ0lvy8SXLx7nq8hpYUw/m5Ty2QNfvAc/2QfM6KlozRXnZPxPnyM1/9aYcaGp9CUK3o2274UzcbnNNtP46OSY4BgczKjrz4YzSoyQ5fxt3O8OswHMHIyZfOZoc0EYdjHUf3y33271al+haPAnMB7x168vYPSMWrcYPXCWugHxkDpg4IgTGo/Rv/S/ObhJ1B067EOOQGHJXVy2eoEt258kJk1s1vd1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Alv0/4fayj8inzsvTFjuvjMG0WHzNPhge+Mr7OjfvSg=;
 b=W4qEqNF//sm0X/reANbCk33mKb5zSKS268Rueb4iUjgao0z5OqStb4A/b/B/As+JW/ITtdIA3S1WVZ4UqyEYDyWbaAllgP8TQAXqe/kRQhEzJja8mFrDA7B9iI5xx/Uz+HVHG+Ra4OLUqP5K/gmbF2ONBWGIZyOb7lGkOw+r59/miV9Umu4ZJB+xrmX2pUhbtJ/9ODlDhlYJHFW7CYoZ5BpJNFmh/9WgY2ThskMLqW5q+XyJzUZTwMBnX737wc5sjbm4J7kv/NGuvAF0C3UFf62jXkVANGN/wjRyT3QbPq/ghv74Ijtte/WpqlezfJPmxWlcQ2/0Lw+GqOiiWrR4vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 12:51:23 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 12:51:22 +0000
Message-ID: <21d4a05a-3f64-447a-b8e3-772b60ef8423@nvidia.com>
Date: Mon, 24 Jun 2024 13:51:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] usb: typec: ucsi: Always set number of alternate
 modes
To: Jameson Thies <jthies@google.com>, heikki.krogerus@linux.intel.com,
 linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org,
 andersson@kernel.org, dmitry.baryshkov@linaro.org,
 fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com,
 saranya.gopal@intel.com, linux-kernel@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240510201244.2968152-1-jthies@google.com>
 <20240510201244.2968152-5-jthies@google.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240510201244.2968152-5-jthies@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::27) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e92292f-1180-4261-495c-08dc944c59cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|7416011|376011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnRscVoxekRmYnhqazFmR2d6OVpxK3lGUDV2Qys0U21EaTJRZnptR0NnRTdN?=
 =?utf-8?B?ejdQRUVOZHBHODFPZmpOYStiU29Qc2pIR0ZqK3pyaDVLeG5XY0dJV0hvSmRC?=
 =?utf-8?B?OTNiaHVubW1BQ252TVE2bDVKQU54aDBZMXdvWnUyalJRNHRSSWU0WWxBUE9U?=
 =?utf-8?B?YUM0KzJjWThqa1gzSGVyRU1kN01QWHdnWFBCVFFpN0IwZlpmSk9sMjZhS0Jk?=
 =?utf-8?B?R0dsUHlYdlB5MzJHZFozSEVJNkxPaHVDckNhckpaNEs1bmxWMyszQm00YWZ2?=
 =?utf-8?B?UnVRVnBORGdzTVRjNzJMRG0zUVU2WDJhTWdkTGFJekFGQmhsNXFTcHp0NXhx?=
 =?utf-8?B?cXdsWVlrZDdLMHUzOW1JT0xHZ3h1dS9UUmZieXUrY3BKL2E3VmwrUG5nUFgw?=
 =?utf-8?B?a1VGeUxKdGNidW9ITHdLRWI4NW8vL1ljTUtoM2pYNzE2RWlWSlkrNC81THpT?=
 =?utf-8?B?QmE2aFNoOXRGb0kycE8wWXVUWUh6OWViVW9WT3o4V1NTajl2SW1rTndhU3Z6?=
 =?utf-8?B?dEVvbFpYb1ROYWZ3ZmtNeUc2eWFMMk14WG9WMWEvN3Jqb2s1enE4a0ZKM0cz?=
 =?utf-8?B?d3ZRRWhMS00vdko2eEk0Q05ReHBRVXRINVV2TkNjSWh4RU83Qkh5VCtGYXVw?=
 =?utf-8?B?bm5ZSTJCVGt0bmlNS1VHMm14azJUYkprZFVORWNUa2pNVldUUzFvcHBYS0hn?=
 =?utf-8?B?STJacmhaT3VZVTlnZDBCNjRudlJJK2ErbzV1TW1vY1V2WmIrejhLejhWeE1N?=
 =?utf-8?B?SWlOY1VudVEreTFZa0RVUlZpazNLY0oxWjdNZDA4NExlWTNlSzhBOW9qV29a?=
 =?utf-8?B?SmE5bVVmTWVFaGhsNlAvTFM2S2hkNUdzWWxoU0xDbW5Ya0oyc3dnbG9sc2RE?=
 =?utf-8?B?YnM0bkxqNkVuQXV6czRjZkhpbERqMGZ1RDdXQ1VVbmpMVjczNFo0UTZzTURU?=
 =?utf-8?B?RGg3Y2pnYjQxeUpZWEtmUzdoMGcyanNQMlBhTktIaEdoMWVzUEo2cTN2MXJX?=
 =?utf-8?B?bGdTNXV0UTd5ZE4zV3BGYTUwZzNIVGZjSklIbU05RHE1UzlZYmEvYnpmR3Vl?=
 =?utf-8?B?R1J5SjNNRW5lbENrR3NINTVnSGhZSTFmYWQyMWJRU0lMdWZiVGlaMWdXSEp2?=
 =?utf-8?B?UkdTY09MTncvend1N1hkUmdvak1BQXBuLzFpZzAyL1NDa3FsNFlQY3h2dklR?=
 =?utf-8?B?NHltbTZmM0Q1NEpaRS9YT01uQTRvR0pwS3FaclFBYXNVTE5ZRUxnV2FCVXVY?=
 =?utf-8?B?T2ZETWtxZ3pZRk0xNlVGc0UxWlJ4eHYvYktHc3BWWUY2emF0ajBtTWd0WitQ?=
 =?utf-8?B?bE1KSThqcUVhclRLakgvcFN0UWhKRDI2Z2dqVU9oaFlneXVtTkNxb3oxQjRz?=
 =?utf-8?B?OTJtekdaeDZnZ1ZYa2NXUEcxdlNNeUNwb1FkZFhBT25zcmxNSmJmcmJMZkda?=
 =?utf-8?B?R093a0hlVmdlWlBPQ1lFMEJZbUd3REI0RTJiQy9QQmhqWWpqQkl6ZXp4MEp6?=
 =?utf-8?B?bFFVbEU4d0xDN3BQaFZsSHFsSjNaNDdiS211Ykt6ZjN1NElXeFB5N1NCRG4x?=
 =?utf-8?B?cHJ4ZDlkYUdTT09tT2V0cFhxckhiWEFOckJGdkRRZ3NEdDNZcVVudFY2YzNq?=
 =?utf-8?B?UitKS0U4NkJ4SUxlaUVFcStzRURzL3RlOVRRK21JN21sTFdncXpjbjJBSkdL?=
 =?utf-8?B?azdsVUZ4UkQzNEIrWUxJU2p1NzdGQmQ3dXFhdkx5TDBHcTBLZkRNWmZ3bC9k?=
 =?utf-8?Q?y71/mkBrF4f3Lt6Y2hk9mbimMdumfmdA9vT+zAA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkNzc1Nlb282YmhzME82RTR1TWF5b1ArMitMTnNxY2U5aWtISXRXeURIN2c2?=
 =?utf-8?B?TEVLOStqdHRKeUZKbzlDeUZNUysyMzlEWlZRc3p1TnF0a2Z2bG9WZ1NYQzhy?=
 =?utf-8?B?QWVIYXZQMGJlNGJ4MXhwbXN4Q3gwdkhNcVZ5MkNEaExaVGlJclRpelg0b29r?=
 =?utf-8?B?RjRVd2JQdGY0MEtLaHIvUDNPNmdJd2s3TmhQUThwQ3VOeU5BMGp1ak9iSkU0?=
 =?utf-8?B?RkhTUEM0TFdFQ0VVVmVoSTUwMC9oQWt6TEQwSDBGUk9QNDBneFN5bUM0aG5T?=
 =?utf-8?B?Ymd3WmtwZTNBVURnQkxqWEU4UXZLTGxIaDVVR2JXZWQ4dXNqMmFOcEZHbUpi?=
 =?utf-8?B?bG9uTEVacDk4YUE2TjJrNXFXdUhFOTZveDhNd1c3ZlZERGRnaW04NHZiVDFD?=
 =?utf-8?B?ZWZ5N0J4SFdNcDNkOTB3cXJJaFJhYlBJWXRKcHBNYlN0Q3MxYnNkZko4eFd6?=
 =?utf-8?B?Zk1qWGpKa1RyQmtsYU5qbncvbXI0QlpEYjRjNkZ3cUdheXFLQldQN1NwVTFJ?=
 =?utf-8?B?M1RvVGloYkNpUmxEN1IwL0wrSCtPZnV0RWJ2RWE0RHJvSTBqQVpjY3lSV0tI?=
 =?utf-8?B?WC8wSHU3dXVnOHZNdEJnOFMyNzQ4ZWVZeE1GTk0zQXlHZUhieHJLVnJFNjBJ?=
 =?utf-8?B?dUNpSEdrc011WHBjVGs2NG0yZUo2Ymc0SUJGdjhLZDB3STlydlFuaUlKQVNz?=
 =?utf-8?B?V2NBNEN2VjlDMFdrRGhmaGpONU9EdTZYR0xQNmF3UzZ4ZnFzUVhrMnFadG5s?=
 =?utf-8?B?N2ZPUFpLdmRtRlIrWVlvKzNxM205Unc5Y3VoUDF2blFUVkhmSk9OanZGRVZj?=
 =?utf-8?B?a2xyWG1wSk5ENjVNUmtVWmR6SUgxcTFXTU9wbC9xWmFkbllrMWdVS1pXSmZO?=
 =?utf-8?B?aFBGS0dZQ3dsaVVlUm9ka2IrMjlQekE2MWU3VTFOcDg1VUhEY0JPQzdDOG1Y?=
 =?utf-8?B?SHNldXp0VXIzTjBTMHhHT01Hc1Ivdnp5L2ZUdXdZUTVSWlJ4eHpKWDZCak12?=
 =?utf-8?B?K0YrWTE5SGhVSC84dG1JOHpUYjBpYmZwZmIvaTVISUFtcytscTRVVG53Nis2?=
 =?utf-8?B?TjVGRHFBQzRwZXpOSThmeDRjdWwyQmhBRDE0YWdRczloTmhMUzhJUExSSHJt?=
 =?utf-8?B?MTBLVDZkMGh6Rnc1aU5Yem1Hd0pvdkNRWW9DY0VSZzJOVFFOakovK1hnOUZQ?=
 =?utf-8?B?UW0xZmNhNm1nMUxPRlhhZlYxQjVHUklxSGJyV2UyQUlHeXI5WDRXVEgrYlFs?=
 =?utf-8?B?TlA2S3d3RkpWZFB1UXdxS00vcytjV2l3eURTbldzdjVEZDF6OGNRbFNJNjNW?=
 =?utf-8?B?c3dvRGxoTjlBTkhjV0ZuRzRDS2x3STQyYnZVLzVLU1JsTVNxWGsvM1ViRVRa?=
 =?utf-8?B?ZUtmWWNzY0FjY3pKWWxIazc1elVTWE02UGp2RkJiUG83eWxWRTJsMWJUaHRn?=
 =?utf-8?B?UTd1MXZ1MWd5KzRtaGxVdVBqTDNPV1dOMzlpUDVzRSsvbnpoRjBSZ1liVGVM?=
 =?utf-8?B?dUpyeTh1MVZQek5KckhCMjRUMUlNRzZxWFcwcFVPa0FIbUMwanNFR0dWMkN3?=
 =?utf-8?B?L3F5YUhrbjk3SnVxcmg5R05KS0k3Z1h0d1NXS1dnNWhaTFlvKzh2S2NaOVBr?=
 =?utf-8?B?L1FnZUllcC9wY1pmZi96M2F6ZHlsU1pnc2R2SGxKZFJaMHU5ekJXUWNHeVA1?=
 =?utf-8?B?VUhMMXpBSmxqcnpHakRGVy83UDdWektEeERYdnk2M01ITGx0UDg3Q3oxL2pD?=
 =?utf-8?B?QXl4Q0FuWWc4OElHYUwzM2YwRjJodDF0cHpOanVvRnFOZndwQk1BeHFsdXRF?=
 =?utf-8?B?SXczTUdKQWlWaFk0VDhpQWhKRE1vL2lsMmwwSHBSSkhSN1VCOGdUeVRmTmp0?=
 =?utf-8?B?Z2lWWG9IYkluSHhiajFRRVFBbW5JM3NocHNTUnVHYlIvNHpKTXE3bSs2YmpZ?=
 =?utf-8?B?OE1iK013QWdycms0eVdURWh6bkhaQWhHRndJekVGS3NSejRVQWZMVUF3eXEw?=
 =?utf-8?B?UkVEQW5vSnR4dFZBRlpXZytmMWgzdksvdkc1K3I1MUkrTGNKdWhnWVVaR2c3?=
 =?utf-8?B?RHd3OHpEV0VQeFRvRmJwWHN2WFpTOFptVEg5VjZUMEpMR2xaem9ldmRENGFR?=
 =?utf-8?B?R1ZUTy9jcXB5MS9wcnJoVXdPcUNNRnZFNzYzN3FsSnNTL29OcFZDQW9pYTFQ?=
 =?utf-8?Q?RoZ4ny2GEegsOTASqdzF2LK24k5zraCNg4um11lR9LP2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e92292f-1180-4261-495c-08dc944c59cd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 12:51:22.8295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTs+ddIccj4BHENOa1lKkADhNOA/zsTVobYWkr5i2/fWmtNJnR31av/VSZneY//BlWvGcgaAYAJYxFpH6cFhpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980

Hi Jameson,

On 10/05/2024 21:12, Jameson Thies wrote:
> Providing the number of known alternate modes allows user space to
> determine when device registration has completed. Always register a
> number of known alternate modes for the partner and cable plug, even
> when the number of supported alternate modes is 0.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
> Changes in V5:
> - None.
> 
> Changes in V4:
> - None.
> 
> Changes in V3:
> - None.
> 
> Changes in V2:
> - None.
> 
>   drivers/usb/typec/ucsi/ucsi.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index bb6e57064513d..52a14bfe4107e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -812,10 +812,11 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
>   	/* Ignoring the errors in this case. */
>   	if (con->partner_altmode[0]) {
>   		num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
> -		if (num_partner_am > 0)
> -			typec_partner_set_num_altmodes(con->partner, num_partner_am);
> +		typec_partner_set_num_altmodes(con->partner, num_partner_am);
>   		ucsi_altmode_update_active(con);
>   		return 0;
> +	} else {
> +		typec_partner_set_num_altmodes(con->partner, 0);
>   	}
>   
>   	return ret;
> @@ -1138,7 +1139,7 @@ static int ucsi_check_connection(struct ucsi_connector *con)
>   static int ucsi_check_cable(struct ucsi_connector *con)
>   {
>   	u64 command;
> -	int ret;
> +	int ret, num_plug_am;
>   
>   	if (con->cable)
>   		return 0;
> @@ -1172,6 +1173,13 @@ static int ucsi_check_cable(struct ucsi_connector *con)
>   			return ret;
>   	}
>   
> +	if (con->plug_altmode[0]) {
> +		num_plug_am = ucsi_get_num_altmode(con->plug_altmode);
> +		typec_plug_set_num_altmodes(con->plug, num_plug_am);
> +	} else {
> +		typec_plug_set_num_altmodes(con->plug, 0);
> +	}
> +
>   	return 0;
>   }
>   

I am seeing the following panic on linux-next and bisect is pointing to
this commit.

[   16.411135] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000310
[   16.411716] Mem abort info:
[   16.411806]   ESR = 0x0000000096000044
[   16.412147]   EC = 0x25: DABT (current EL), IL = 32 bits
[   16.412465]   SET = 0, FnV = 0
[   16.412530]   EA = 0, S1PTW = 0
[   16.412778]   FSC = 0x04: level 0 translation fault
[   16.413084] Data abort info:
[   16.413149]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
[   16.413534]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[   16.414163]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   16.414649] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101b2b000
[   16.414784] [0000000000000310] pgd=0000000000000000, p4d=0000000000000000
[   16.414940] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
[   16.414946] Modules linked in: tegra210_adma(+) snd_soc_tegra210_ahub(+) drm backlight snd_soc_tegra_audio_graph_card snd_soc_audio_graph_card ucsi_ccg typec_ucsi crct10dif_ce snd_soc_simple_card_utils typec pwm_fan snd_soc_rt5659(+) snd_soc_rl6231 ina3221 pwm_tegra tegra_aconnect phy_tegra194_p2u snd_hda_codec_hdmi at24 snd_hda_tegra snd_hda_codec snd_hda_core lm90 tegra_xudc host1x pcie_tegra194 tegra_bpmp_thermal ip_tables x_tables ipv6
[   16.415056] CPU: 0 PID: 290 Comm: kworker/0:4 Not tainted 6.10.0-rc4-next-20240617-g76db4c64526c #1
[   16.415063] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
[   16.415067] Workqueue: events_long ucsi_init_work [typec_ucsi]
[   16.415082] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   16.415091] pc : typec_plug_set_num_altmodes+0x18/0x6c [typec]
[   16.415112] lr : ucsi_check_cable.part.0+0x228/0x280 [typec_ucsi]
[   16.415120] sp : ffff8000848bbca0
[   16.415123] x29: ffff8000848bbca0 x28: ffff000080e66000 x27: ffff80007adc96e8
[   16.415140] x26: ffff80007adc96f8 x25: ffff0000834510c0 x24: ffff000080e66010
[   16.415150] x23: ffff000080e6638c x22: ffff000080e664c0 x21: ffff000089c95800
[   16.415160] x20: 0000000000000000 x19: 0000000000000000 x18: ffffffffffffffff
[   16.415170] x17: 1e00000001000000 x16: c203000000000000 x15: 00656c6261632d30
[   16.415180] x14: ffff800082c922d8 x13: 0000000000000040 x12: 0000000000000228
[   16.415191] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[   16.415201] x8 : 3d45505954564544 x7 : 0063657079743d4d x6 : 0000000000000000
[   16.415212] x5 : ffff0000835ee780 x4 : ffff000080e66288 x3 : 0000000000000000
[   16.415223] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
[   16.415233] Call trace:
[   16.415236]  typec_plug_set_num_altmodes+0x18/0x6c [typec]
[   16.415255]  ucsi_check_cable.part.0+0x228/0x280 [typec_ucsi]
[   16.415264]  ucsi_init_work+0x8b4/0x9b8 [typec_ucsi]
[   16.415271]  process_one_work+0x150/0x294
[   16.415282]  worker_thread+0x2f4/0x3fc
[   16.415289]  kthread+0x118/0x11c
[   16.415296]  ret_from_fork+0x10/0x20
[   16.415310] Code: a9be7bfd 910003fd f9000bf3 aa0003f3 (b9031001)
[   16.521018] ata1: SATA link down (SStatus 0 SControl 300)
[   16.524401] ---[ end trace 0000000000000000 ]---


I have not looked any further yet, but wanted to report this. If you have
any thoughts let me know.

Thanks
Jon

-- 
nvpublic
