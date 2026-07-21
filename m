Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C0822157B;
	Tue, 21 Jul 2026 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627187; cv=fail; b=s66q4qQMedfHLSnw9Tkj/zkjbxfp2C+MmBlafoI+ubSmgmoTbg/nPdVGe5epxbd+l80drG+GimTM8H3UM1snehPS83SKqXKeKVIgfhB6cwBTfJiP3svbefdEjCzcUAJtFwuE7Pl6nQS4wzltFtiUijobtJd7PE6cOyLaDOBhAQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627187; c=relaxed/simple;
	bh=JQ0NM2oFjruz3+3GN7zD5ITXxlfbBfAwqNfRX0lcn8E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UopeQEfKY/1H1Jqmw2kyw3kMyPFNKzyElY6FwAml2eGA2VDDNq8er5nIOooTD24u/wlMpOgOqxgBec1KnloG/5sa+4ZSqgVPqpi3Jx+4tagwNEPMj+iprCCe3BsgwwmgYSEu32EUCcbv2um8u8HWtYlzzWr26mcm7AM74XrvOy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p02ifINX; arc=fail smtp.client-ip=52.101.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p02ifINX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDDyrt/xjQD3Cdes1z/fUzTe1rO3ZtFfRK9o7NrW3R3xYpUyt3T29yDHQaMbejkMh20ObD2dyP25FOLbyn29Ooy0JP3uN4hGpZ3TK2RHxKHYB7MpcvtH2S162RV9CnbvWfX4GRkInAgBIU53IKzDKIleOENsr2vCPb50VQlFLgB7L89zDQMrVsZZstf3wzs4U5R7Z0qMhsSur6nzx128w7/WHfB0zkCNjknKGWWBydRQlTiPZjkXn5GR9vOr5gRn4kk8GXPmY9lDVvp0iNEAvxY4h/qXESPJOcx++NN5kHu8okyJpH/hJYwFuEZ0tSzC2wdcul1udPd+iG2tv9vD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyH2ln62Bm6sVANFJJTKLn1N3wHeOG/4uv0s0QAga+Y=;
 b=WnEPsbWOIDVYEBtC/Ts2SiwoTaPxqoLXMdglDX4n3XOZrwEpwugI3s9FsjfCmkdxjaMypsD1cFOSZnRvbO6oFPtL9qY4zEoYrtvvlqnkBwbhnldVut4k3EvfdmfHn0rLUzfySyNe5qCCljySTudAQEmrh8eicFm37BeVchKOhD0pJ7Au6pULXR7/KKc44MywION78gb7EUoKKwc25uz5frAvOVAxwJnIT6KK5o8slBTi3ElZYL6PCJ7Ot8lchWhfa5f2HA9zu1O6Xaz7S63h5kGP0S/oLGPJbZO+nvWN+7LoVyJtnlWKX2B04QihMOe96YtJwMHdC5ZRiMiZB/hMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyH2ln62Bm6sVANFJJTKLn1N3wHeOG/4uv0s0QAga+Y=;
 b=p02ifINXMuQwmH7HF+E3R6dvEOBTjNFoZGPB+EuABG7yvEkFsxVesd+02ZPNELBMesxUhvftOAYeJYIlViXUL03GAhQVdNnz+BrN8mMOpelX4yBcwkbSlVm051FS1iOuQ8Q5zT8QqQkWvvShBwAQpiNcXC2i7AK+SDKkCX37bL7x+xiNfp7nLshRCOID26gj7+lIZhlqrkTpTMySxQZvojnCn7u5uvcmFqk9GoRZMAsPc+HEKu7PSjpRpjc9681AXvzHYXY+60WnrcYckS4HVvwpyjaxPMd8rFUQSFqxzNUlQsRu4dIJHN+Po9HO8MqYVPKOj3nqsRzuRNf2XCzNnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 09:46:21 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 09:46:21 +0000
Message-ID: <00e569b5-df74-4310-a33c-446005bbf11c@nvidia.com>
Date: Tue, 21 Jul 2026 10:46:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc/tegra: fuse: speedo-tegra210: Support revision
 B01
To: webgeek1234@gmail.com, Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260717-t210b01-speedo-v1-0-f04a8bd4d997@gmail.com>
 <20260717-t210b01-speedo-v1-2-f04a8bd4d997@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260717-t210b01-speedo-v1-2-f04a8bd4d997@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0340.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::19) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|SJ1PR12MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 1648a088-22ca-48c7-e3c3-08dee70ceba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v5Jlk5IohJDv8iesXCwyWtc6q8+5pUxXc3wUn7/2zXc9uIwqHPi3eyNEyQeXZL2stXw5txalf8If4FwlaEANBzPQBshKs7JjG59u4nFkcBMQTgkcM3A0itl7GOIU+aW3aKtr3V5DjQeAIdujbCDjmqie6XsHCM/1sYmSbkMGB4uOhN/QTKtjxuI29moyzt8cUJy6TV8gJtstOv0gSEkfAEbf4YEaq3/jzu271w1cpWOGEJda2hqjrxkJHF38iF7QGa2d2LbDfpxix+Rih5PEN8jAHT+0NPy7sZsJs45WshGRaUQZR2tLyHu0MtegZknyhMCJB1ZaU6ZIUSAT5vddXRqzEfWjHysdhElrZrG8HF5PFDpfkNf55JgXhFUNOWDCoNjKkNMRGh19++j+9l6oIChiLh7kXBvjOjfsSz2RVUOP5oYIJZKgr7by+A60/eUKfXuTnagwnWc2EfdSxZ8wL4YcirKi3krcRjQuLrKKZS0ADQj0OCrHPooocsAPDbmB2P4dfIz1ll75qS8txn+wLqDFxzcf6nhVuQMQGt15EawjkureuV47j1zXBr32IEeuZ5/oyBQCy/aLx94PlRnjjjXXB5mPQGaSp3gFGoRPlb79o1IIe9WgPeZXpfMqMB3vMBshSOBOL06S4bVFyZrO8873KGMoUB66EDY+vMfja+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2NZVnlCTE5peGowbFphUi81K1R2Zll0ZVhoYzdoVFBNMko3U05JUFpoU0dM?=
 =?utf-8?B?ZkJIWFQ4TXJiWGsxeGszdWhseWE2aGR3RjlhR2Exd3RFclF5NVBwMUZ6YXZh?=
 =?utf-8?B?cng1SWhGTGZHamMwRUZBVHMyYUh4VGhjaEJ0U2plU3ZxRG9RcElXcmNGWjdY?=
 =?utf-8?B?b1JlVHgxeGNmclJPRkpOTHN4aWVyZlNZZ0w1UEVBUFJYRitoM2NTVjBZeWxt?=
 =?utf-8?B?NlNMaG9Jc2JjV3JBbjRDdTlmd0FaZVdjVjdvUWwzS0YvbmJ1NkExMWFtZDJ0?=
 =?utf-8?B?M010MjU4QUw5SThYVU5ncnlleVEzZEVraTlBSlhVN2h3cGVvTW9yenJjS25k?=
 =?utf-8?B?dm80REhYU0JaRFpMUDlYZ09QL3IyQjZDUWV1RyttTEt1NGU2K2ZlTlgwQkJ5?=
 =?utf-8?B?WlZCNDRPVE1NRWdMMm9oZk53VGp6TU9MTmF2VklsMXRXUjQxNGw2ekFSempl?=
 =?utf-8?B?QmIwc2ZnOWdsc1NWT0pIRVl5dXF6aDY0Um9ON3VSNy9uMmt3SFpqR3I0N1ZG?=
 =?utf-8?B?U21pZlFyNUNQeGJZT2lKYVVyb21JOVpBb05JWWZlQjBVU3FlWGFvNUU0NUEr?=
 =?utf-8?B?OERtR1NiZmwvbTRna1k5ZjRyK0lmck85WS9pMktJL1JmTGd5VnBvZTdJdUhj?=
 =?utf-8?B?a29RbTRoZGlnc0ZCV2F2NDBhSzhEZVRjb0dNK1krV3dkNVhLNVdYN2p2SXZs?=
 =?utf-8?B?aEpZS2NEU3BXTmVocWRvc0lkbEp6MTJIN3o3Zm14SVhjYnY3Vk9xYVg1TDk4?=
 =?utf-8?B?UzFTRG5laGRyWXN2amVFb25yVTZpMmUzbG8xUVh0WVVVUmNIa2ZBMFZqd2xJ?=
 =?utf-8?B?TkMvNmZYRFI3VzlpUWZPR3hsbHRCOGp5SVhOa3JtSXhOVFhOaUc2cVpVUUt3?=
 =?utf-8?B?ZWtJaXJiTE5sTGR4blk5S1pkQThhUWFlL1hsZFdtZnlFc2NXUStIN2VNTDdK?=
 =?utf-8?B?VFlyYnpoN3BiaVhkem1OckpMNWx4QndkVXBDSVR0Vkt3RjYzMFEreHV3NmRJ?=
 =?utf-8?B?QmF4K3d2b0xrZnRyZTY0MElQUWprbHQ5eEI1eC9oNGZBOFMwK05GUkVON1BF?=
 =?utf-8?B?MDdoUDFydGxYeWVwNENKZUJ2cWFDWTE3R2hlNVlnWmVWYVdkUmJEdjdQVHM0?=
 =?utf-8?B?OGNpaTVITitGNVIrNXlOd3VtRUY2SmRNeDR0WUd1R1VUVUlxYkxUL3NRejYw?=
 =?utf-8?B?cWo4TDdFcVhjbmp3QlNsU0pSOEx4SzRBaExiZ25sRkszU2twT3NXZkc0THdU?=
 =?utf-8?B?RENGOTViVkZ6RnBDdERreFNlSlFTajBjaDZpNHNWM2VHc01ZRWpZMGNKd0R0?=
 =?utf-8?B?aDQ2VDVyaUJpeUxnZmVpMzBFZWFYVU90NC9VUHFFTEJOaEJveFdlZk9uTTVy?=
 =?utf-8?B?Zk9DckRTQllCMXNZZTFtWGQ2ZjhlR2FkTDB2WVpRSHlwcHlFb044emFZZWlP?=
 =?utf-8?B?ZGxLbkpXVUtKWDcrYnZqK0ZXVTdUSUpIVjJRbS9WNGNLZEpOeFUrZjBEZmt2?=
 =?utf-8?B?b2NIM2pWMlZZYlhSYkZWOUhEaUUzVTUvNmorUCtDRUY3cUdXNTYyMG14WFls?=
 =?utf-8?B?VGM4amFtUmpMWEhPU1dqTjU3eGgraW5LdEpkV1FORGNPbzQ3Y2N5WWpaYUJy?=
 =?utf-8?B?UVk1T1dYbHFhZUdhTlAzUXVRR0JBRWdmSEVtVDhEQTV6aU5QYk43b1JJUFhw?=
 =?utf-8?B?KzMwczdNU2JoekVrV3BYOHV3UUd0aGZuVkVwMDRuM1V5c2lLK1ZraWF5MjBQ?=
 =?utf-8?B?UnQwWTVHM2RWYlFDK3oxZVRHcTRUSHhDZkxsK09hV2p3djNsemVTWDhTcWNj?=
 =?utf-8?B?UnQzYk1TSXRsQ0dVS3c2dEdVOTdDdTd5TTFUNDFidkZPV1NTR2x3U01nVlRi?=
 =?utf-8?B?MHFoaUF5aWcvTXFvUDl4OWNQazRidE9OVzg3RkFST3h5QzhKNG1TVHBNTDgy?=
 =?utf-8?B?endYSkkyRXd1ZWpRbE4zNUdzRlFPU3VnYWFmRXpYM0tNMGtLdXdNb2dPRnhl?=
 =?utf-8?B?U3p4L0M4MENmeUk2NWN6RHVlN1VqVVc3Rm9KTUNxaDFXTWFBZXFFNVNZN004?=
 =?utf-8?B?M0w2amFrcTZiTmxFWGxCZDRDN3k2TERDbWJ0V3NkUEdOenBXR0tXWjBvWnpi?=
 =?utf-8?B?MDJLdGIrcFJtdXdqNGJ0M2lXcVo4TWRpOXdjRXFCcDBPOFRxK0dlVmwycDJq?=
 =?utf-8?B?aWV2Z0VOM1h1NjYxTWd4TlFNSGVtODNHdyt0ajRST0E2VXBlRVhQbGdsNkRu?=
 =?utf-8?B?WDAwb3I5WmVqMGRzamFXKzcvV3ZiV1RjUDZqQXNlU1NxVnBoNDRSRHlPcnd3?=
 =?utf-8?B?ZWVRZ0krZHNLbTdqTzRUU2xuWTU0NEpQT2FCQXgveE8rVHpUQm1Jdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1648a088-22ca-48c7-e3c3-08dee70ceba9
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 09:46:21.5527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdZjcMLpnpys2wX97Orlbnvc/tjylspsZOxCjxoXDivLrDYOCP3Mk2Nu4dXsN7jUm0Wd/NUHEhCgMTs3z+Z3fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052


On 18/07/2026 00:19, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Tegra210B01 has a separate set of skus and speedo tables
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
> index 06c2bcbee5734..699751f4bd0c0 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
> @@ -65,7 +65,25 @@ static void __init rev_sku_to_speedo_ids(struct tegra_sku_info *sku_info,
>   	sku_info->gpu_speedo_id = 0;
>   	*threshold = THRESHOLD_INDEX_0;
>   
> -	if (sku_info->revision >= TEGRA_REVISION_A02) {
> +	if (sku_info->revision >= TEGRA_REVISION_B01) {
> +		sku_info->gpu_speedo_id = 1;
> +
> +		switch (sku) {
> +		case 0x00: /* Engineering SKU */
> +		case 0x01: /* Engineering SKU */
> +		case 0x83:
> +			break;
> +
> +		case 0x87:
> +			sku_info->cpu_speedo_id = 3;
> +			break;
> +
> +		default:
> +			pr_err("Tegra210B01: unknown SKU %#04x\n", sku);
> +			/* Using the default for the error case */
> +			break;
> +		}
> +	} else if (sku_info->revision >= TEGRA_REVISION_A02) {
>   		switch (sku) {
>   		case 0x00: /* Engineering SKU */
>   		case 0x01: /* Engineering SKU */
> @@ -154,7 +172,7 @@ void __init tegra210_init_speedo_data(struct tegra_sku_info *sku_info)
>   	speedo_revision = get_speedo_revision();
>   	pr_info("Speedo Revision %u\n", speedo_revision);
>   
> -	if (speedo_revision >= 3) {
> +	if (sku_info->revision == TEGRA_REVISION_B01 || speedo_revision >= 3) {
>   		sku_info->cpu_speedo_value = cpu_speedo[0];
>   		sku_info->gpu_speedo_value = cpu_speedo[2];
>   		sku_info->soc_speedo_value = soc_speedo[0];
> 

I am guessing that this is derived/ported from some kernel that NVIDIA 
has released in the past. It would be nice to include a reference to 
whatever change was used to create this.

Jon

-- 
nvpublic

