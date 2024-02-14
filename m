Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2DB84FC8
	for <linux-tegra@vger.kernel.org>; Wed, 14 Feb 2024 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933744; cv=fail; b=Fer8mUOJtXOcqzlAamHVuxKC/Ja77ixbXbOvXHzwjdDgbqe2gJybmx0BJ6XBHs43QFEHYaN0J5Gq79u1xfy/Jup4GiazbfK+k9726HQKXQKnjyq/4w1dpp0dFOLPjZV+1pZgzZv9DoqHyw7CNP8TaO8WzJhL2msOURX/3gDcxE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933744; c=relaxed/simple;
	bh=jOlcX+4V6lDy+Z66KVBHU8jsagaJJxyA9xhEUydeGj4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lz/GGjY3Z+69j/ZojfBRgbTjzXIpDs5sk2nKYl1VqMp8E9zPLo6YRFfUg+MzWtd55Mz3TSoXVph8h1G4L8lugB8HngI77p+YAWlHJy/G7NdZfO4Qs5BN2gZuJhxzB3FzjfzRgXHvq28xDMCLffCwbQcXAU8ttmWE5wfHjSEXWuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EquL0U3/; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EquL0U3/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzb7CTKEzkuNuSA35wfD098zA4aO15o5bP58Vxz4o/fG/IvbKvR8v5wv+RZEELQRqGHnqhGNjg4y1sfjP9/TX84TW0GzEp+U7jAZW6gx+9ph75SpC/GQjsvXXlpyJJkSxXAxndn13qDztWS57xYVNYMX3xrJUVBLKZGJBbfpx+zxYK8EQ6sOyytbyuIOfm+0RlneVuIbHYurhXfq5w0xwRCDE1PEhtomguDzz2Q65ah/8yFIbnUzk2K9r4zKpEUpnIMBuUgtp36CNVNI6R37OVP9GsZQFJ+TS6zxcqy6SkvL6kU4Grb86cIw68cHg+Og5haXAt7fhF5xXqPMokIfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cK8cg5FvPI8kaH8YFOlRUGi6n1F3/D9oFKy/dPeaIaA=;
 b=fRiX1CUx/+k/eVU2OFDecCLF1HrhPg4L6zhPwjfSnWLLNIz7D3uK2COWJeLBp1D2CIAN68GuCdkTSFmLSn/6A9Jr3UmgXDMbMf6Fj140/dr3wQq89YtgoGgTV8P9DuD09Rp6yn2X5d0H2JeVaUPiqCCkcIchb1Ufb4vGvU1Nk2V9F35VbBL+JCnWkrufWkdMvtP1k5Ub5f/4nGwnHPv4v6jniEdUXtaLIZlTS52+QGDSAmv/5szlONoE4Id2DDVHJcX8T7xCyb3oyc1SRHMxwSgAlzD6vJAbdbR6lwU5fVq8+6R+V3j0U4T2gd8Fv1R1s1Ug+3hMdHvwcHREo0rjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cK8cg5FvPI8kaH8YFOlRUGi6n1F3/D9oFKy/dPeaIaA=;
 b=EquL0U3/A31i/nNwM9oHMN6nI8NfBGyfC73hMCwh9VK7YYHyCOYD0uDbo+k5Aw/uyK76YpSK1TF5FKy+OthQO6YUhUNcFcPyF+ZQBTzVqctMtYd7vG0dtb9US4n0EMi2IsCkZrDPDNJrBCnoZPA04tN+uMzhSrw5+heynDZWJI+0Rk5yPVditaDGBd6jm6QfyUYcwyAQZSzuqX1jhnPk/cdwVxBRZ1+IsSCnVKu9Bz18qDNkGsqmnvvKE8VB+ZK+3yTFqWayQDI3mZ3Iv2oTV2zce93g4o8uxh8YhQsUQHBOKI/gbZeLFaa8HTDFOjeqRx4AqxGQtxJC2aVwFq3Mog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS0PR12MB7583.namprd12.prod.outlook.com (2603:10b6:8:13f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.26; Wed, 14 Feb 2024 18:02:20 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f462:16b8:4857:38b7]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f462:16b8:4857:38b7%5]) with mapi id 15.20.7316.012; Wed, 14 Feb 2024
 18:02:20 +0000
Message-ID: <98b992b7-503f-48d3-86ce-4db7d76205f9@nvidia.com>
Date: Wed, 14 Feb 2024 18:02:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Set the correct PHY mode for MGBE
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240202100812.866143-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240202100812.866143-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::13) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS0PR12MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: e04e586a-240c-45ef-20d9-08dc2d871686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1+GbOb/Quv8+QMQiCSeiawFuQXclo9jv2dz4yt8Sdy0VEJtQ+f3zYlo5yV8I+iytmpO3mK1WFl82uEDyZlycIRNaluwAr2GxVF65HiA3mwuo/s5jt2OGmqJ3vM7EA5A8/fUs8uxgbqN98Y8er6VxCDJQ4nBMarIJ7q2CQ03mVvBbftMlb3T5JlWw5lqtmGOyoYhSOMtwYjbMZWhu3VKKTWPrAD1aAvPdTfg0n0/czXpYlIHBspOwbOPWFNC1PAkvrOfgF19Hlz8y7K7nR3AGmO1N+YucI4ipw8CIqruQZUPSE2mu1KewQfR40LVxx152klrFELcn2AMCKgRTqJvGnmvu2GSYHQ+smFIqclZLmbTZ3DQ3l72ERKE6a/qeHnj5UcaYfuKEjdosmIwb4iR4lxHuUtnNe7odjlO73RMYemqo5J/rsLu/6AcD75aiuHbNYNQHoZmC0T/v6K1ku/PMDY/XtIlRVu0eu5SXMdWGwZTSW8snL9OB12SEfNBsK3Y8C0ee3k7yB14jkl0+0grFeH2064MR3NPmC7fOWvsR/PXJdtLqFfFKNcV4VCBOi2Rk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(86362001)(31696002)(38100700002)(6486002)(478600001)(2616005)(6666004)(6506007)(316002)(6916009)(53546011)(6512007)(55236004)(26005)(36756003)(2906002)(66946007)(41300700001)(66476007)(66556008)(8936002)(31686004)(5660300002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJQbGIxeFN6WXkrVnRiZUpTUFBlQXMybW5yNENOa2NXcUhWbHpiZmI2citZ?=
 =?utf-8?B?aVpsNnh2RnNrSzVoQUNlRTdwMTZlUk5nYVhTN09hSG95bUpHLytmUUp0L1Fn?=
 =?utf-8?B?RWNLcEFnN0QzemxJSmVWWndJbXFtR2pDTzFicks0OVNVd08yTUtaYklCanVk?=
 =?utf-8?B?V2RaMzc2V0dTbW93RHlucDZTenJNZHJ5ZGU3Skt0UW5hQ1prNmFWcVhQZ1RI?=
 =?utf-8?B?Rk1hZmNETnIyc29rTGJ3c3JtVFErZnA1dndNQmFHSHpYbTBQMXN5OWZvbStC?=
 =?utf-8?B?N1ZSV0ltaEFKV1lyLzV2SXZrSDk3N29iUkdCSlo3MXltdWQ1N2R1Wk1pemo4?=
 =?utf-8?B?VkJHQXk5cUtCZVEyell2N0h5b2JnbDJxdTl2TUpFQWJTZEIxd1lyNG9aTStn?=
 =?utf-8?B?SUw4dWNSaG04ck5PeDl3enZCZDE2bEYwY2tneHNnUnhRTytiNm1DVFhjWWxG?=
 =?utf-8?B?UHZrMEQ5WjN4U21iU20rdHRFaUFIQzVwYktOY3d1ODdPckpXcm4rbXFCSFpE?=
 =?utf-8?B?UlFQbTJBMDhreWFkSVVJbmNJUjNrQkF1UWpBVmZzN0FiamFCd2FkdGRRZDJM?=
 =?utf-8?B?YzNYL2NoUUg2elJQS3BlRi9sUGJWZnNNdzV5enRJS1d6KzJjM2hwdThRTlFF?=
 =?utf-8?B?bDNxQ0hkSHpDZWRNM1FaR3J6bjM2czJWQzZIWjdyVnlwRUhWWUJ6VlZFZXdU?=
 =?utf-8?B?UERTRXRGelQxQkRRd0NLZy9UQkI3Wk53YzJOdjNpRTljQ09wTXVXZlhhYzNq?=
 =?utf-8?B?bTJXSU1peGFLclBRei9KK1hJUXE2NE1CaVRYd3VyYVB1Y2JmUTF3bFNBcG1M?=
 =?utf-8?B?ZjVZQUQvV1dPc1dvanllNGhtb3ZRTyswNkdRSG0zYkpuNHlTeGQyVnhEMHdm?=
 =?utf-8?B?TFBBMVA0c0VIZ1d1TzhwVjVNc2VUUHBMazdKQmo3Q0srTkVhTnpsdW81Ym9Y?=
 =?utf-8?B?WlRveUFzaGNIOWw2a2U3YTBGSXJpVVdNenNSZnoxTFR2Wm10UmxMb2pTU2Qr?=
 =?utf-8?B?bG5WckkyVEkwaWNlQWpqWlF2bEg0Mk1DSlQ0QUxscmRab2FSVWszWlhVRy9B?=
 =?utf-8?B?R0VpWWZEMEMxRzAxTTJmVzc4L3RqQTdFRzhlMDJTS1lubURhUjZuWmQvOWI1?=
 =?utf-8?B?WlRiMEttbFBTOXY0Rk1CV3NCcGY5ZVllVDl1Ymcrb3FFY3FjSm9YYUdMU2pQ?=
 =?utf-8?B?ZTMrUUhDTi9RYlljenY5VElySnVsK3JvcGcvZ0RYMmNXbUxrNUxuSmJRb3R3?=
 =?utf-8?B?U0pBcEhQdlg3dnJqV1BPNnZhMUJZeHZib2grN2RjUnhScFArTU5lR0dvdkhr?=
 =?utf-8?B?OVVMSzJ2MElYa0RnTDVIc2NJejQ0VUZCZExQQ0NOQ2NoYnNNNElrYm1maHhn?=
 =?utf-8?B?K2czS3ZXdjZSc253RkFHbW56MVpTT1V5a0pYV2thTW9FWHRiV2NoK1NCYjhO?=
 =?utf-8?B?eE5LTkp1Z2FmelZEd1JoK0Z5WERSKzdMWkduejR3M2NZL1VUOERTQVFseUJy?=
 =?utf-8?B?YkZSL3ViL2Y4Qi9ENnFzREVmeTFYZnhJdGwveUNUbW00dWU0dmVWUm93UC9K?=
 =?utf-8?B?bExTN1FEamJpeUhJMnNvWlY5eU5yTk9KSjBIQjBQanU2OVpETjV6dDVoaTh0?=
 =?utf-8?B?aUo2NGdrMm9jaGlYTU8vSFpVdEQ3RDl5Z3U3TGcxSmdXSmFrVjY2YjlxMlRR?=
 =?utf-8?B?L0JsRWFrRCtEdlBJTUhXZkkvWGJLVDh1UEFEb2s2VFBKT2lXaUl0Rk5LcVdn?=
 =?utf-8?B?SThka2wyZlVrR054MzZxcnN0U1ZqVlV0VDlGaUVqczhSUEo5TGljcWs2aERx?=
 =?utf-8?B?QW14bVI0cWRBcllJM1ZjMGJ6MlJXT0x1dUZQeTQxNkpJemFOVlhUVDI0TXNV?=
 =?utf-8?B?V3dSbnI2bHZlck95S2dlbVFyM294VXZJL1dwWEVRS2JqdENyTWNwaEcxSFB1?=
 =?utf-8?B?S0FyQ1NLNU5iTmtSdmUxTlFVMDE1WGgzenNHS0UvVTc4c3lwRzBrUXkzTUVO?=
 =?utf-8?B?QUkwYU81YkF4STFhbExUbnMxQ3MvSVNHL1YvMGM1R1FERllEbGxKWFJMdW1o?=
 =?utf-8?B?NlVXcVEyRmdtTWtQKzZ1eks0Y29kRGpINXplRERWMTN2N2hQSms2TVFoWWVm?=
 =?utf-8?B?VGVQdC9IeFZSUDlyQi9jOTZSUmtjRzFMRnZZTjNtQUJkbjZmV0x3aVUvNStn?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e04e586a-240c-45ef-20d9-08dc2d871686
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 18:02:20.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJgMFoqFXViwF9BPCFjAbE+9xXGITqOfXthVe+N/AzhZlBnFERVpC56jFhQqW6EtPu4flBwPVhLo7ccHRXJQyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7583


On 02/02/2024 10:08, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The PHY is configured in 10GBASE-R, so make sure to reflect that in DT.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> index ea13c4a7027c..81a82933e350 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> @@ -175,7 +175,7 @@ ethernet@6800000 {
>   			status = "okay";
>   
>   			phy-handle = <&mgbe0_phy>;
> -			phy-mode = "usxgmii";
> +			phy-mode = "10gbase-r";
>   
>   			mdio {
>   				#address-cells = <1>;

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

I just realised that v6.8-rc4 is still broken without the above for 
Jetson AGX Orin. Can we get this into v6.8 as a fix?

Thanks!
Jon

-- 
nvpublic
