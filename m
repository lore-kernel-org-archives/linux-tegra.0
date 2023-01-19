Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8901EC004D4
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 12:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjASMIo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 07:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjASMIn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 07:08:43 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839F12A99B;
        Thu, 19 Jan 2023 04:08:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xv4b7b8z8TaT59jwuhPuXaggyAU63Tadu/m+vWv+264+TP57flKc97JwrUvOI4u7eesHKmm3Eb1QPWP2fs4/aGflXcP9twid4AH3C9w3HMNi5vCeuh18OB5jrCiQx79PyRjJfWjNWQ+t4knHz6LUi16cKX5Pl9nWCfwBBWqRXWG/8m1DgxQbZ3LjQ7iORNIjEjhl28jYibPsZXUuMEBuPgI9cS7UpEyUOHpsPSfd6dEps5rG403EtpuvFYFPXrq8oLz5A55OjPzulXw4xbE/PmcCTgq/u6a1x8oCeqJIgPYXIgM7ParzjxsunSkR8Ln1f0xMLKN4JJtkAyskZ4xKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0AubdtZDCTGaACKif6FvUNQaJmWRylN/+ItA0PtqvU=;
 b=PXYxfqDmUtKg0LAa8A6clCXusI5/wQtUrpNDut98l0B/YR4VnTUFuc13/JdivX7S/IxVx9KZIp54w5GpG4uEcLrPUHD58SUbUwK1bKqCVqAESrKzqSEzwkIL7HcszEsD/TWUFA234pN9XkYzyejsG4Dh7f07h70H4AdJdzCZkMU3zUXDeHRHx4a0gZmHYSkWnbVTOJOaxWwD+ZhWdz39z9oBLzT/THIRxRwBhYDPzoxECGPbuzYYKIbRmcnXVURBTCrQUCmkR91AVjyavaLK1eXdvSU3YRUA9CnlAVhSOu3BzxymxDPRQLUdC+MVk+Ie1DnLVPy3Rk5JaO+Wdrd9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0AubdtZDCTGaACKif6FvUNQaJmWRylN/+ItA0PtqvU=;
 b=L35EgPotvFDBWi7pRTEu2nDiPV46slz5G7B260/hexeHpi1UAHQOkc68L8IdNH/RKIx4bLS9QS2yCpFWMmeTXxZoBHoG+bAtJHVzwG5Pzgh/6NAzt2Lwv3GgBLCQyVq4U7neUPYn+V/pw5JPYL+XlOBxrDKcvu3+/64Ggkyqo4UH8HWiw1dVVgfW0uSLomYr5lqfbqVMmA/J0HUqZGonqkbHn3bEO8I7GEWEK6dvOKDYk8udyELUTx7oLSLQsclSFD6SNijAB6GCZO2j0DzhaVBNZeV4j6jGIHCl/vBeUrMIRii4ggoBTcQlUaoJKJmehKBICbnOmFJqLp67lOA20g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Thu, 19 Jan 2023 12:08:40 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%7]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 12:08:40 +0000
Message-ID: <5060370a-d335-72d9-59d7-306151fdf052@nvidia.com>
Date:   Thu, 19 Jan 2023 12:04:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V5 3/6] usb: typec: ucsi_ccg: Add OF support
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230119111741.33901-1-jonathanh@nvidia.com>
 <20230119111741.33901-4-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230119111741.33901-4-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0317.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::17) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN0PR12MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb5af82-7f87-4495-1614-08dafa15e6ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1B/P7K9x7TjOGVOyaxppfTLUqceFMFRrp3Z0bUhXziYWknn8oHTK9ZVl98BK4JT2/V2gml9uLep4REdSynTigGmVou73qj6C23nCDgqVCW3gaeeRHK5XRkplJZqqmeqLHrBsB3yjfz+6dMQf598HWeM3PfU7qXX5WkmjpIKKhNID3uzmfEv6o8Mv0sh+u9uUJ6dpCo68Xm71fgQTdbrOrXC7P5dK6OX+ysjI4/qF4ujD/XTUHWWpofS/hJJeRC9WQz5hZchdZHITSU4fqINIHKls6yt58+zZyOWkqEltDm9h88NwVRojVZ9w308kHwT97J9v3dVyp3HyNwkEQ5YvOZ1p/ppc7VD6emZYCZIoKdTTLXON41hmwP8fNjxTPszFRSwMzhxYmybbjZ9WebuB6uN4oi4fLKTfwKiUmmbDE8v4ym3YXHVt7zmBsckDE6h6BIoqrqCuFsKDGUaQ1mtzPrQoD9wJC4lg+cfE/85m/r44ogPV7SMS6bAe/nhByuOQb7fwRdBuBVmnZErkVQVOio18ggP0YOHE2L+7GRJ38czOaM4++a8FfwaYaq33nEqrMK1NhJnrjTB8YONCvmxP61vX8CFsMj0w2q/hPW5FGnZEg4HmBZB9TeMmD/xhQzZ4R+CxxtbUAK2Hj0m+rVeqhUOV193SaSvAURP8ikH671hnxadtM/G5VblXEXI+N2hJih7iIa97Pyot04GT2eAAGmDvV4beaWRAYbr/fewSUAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(36756003)(26005)(6512007)(66556008)(41300700001)(4326008)(6486002)(55236004)(66476007)(2616005)(6506007)(186003)(66946007)(8676002)(31696002)(86362001)(2906002)(478600001)(53546011)(83380400001)(31686004)(110136005)(316002)(8936002)(107886003)(6666004)(38100700002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmgyM3ZDbEF5SjRSck9mWldYOWtLU0hoUk5qT2tyekEvZ2cxYnBOUVlvZ2lu?=
 =?utf-8?B?RkIwdVEvaWFEbFJpWkw2Zm9OZXBrZ093SXN0ZDNNSEtna1Nybnp6dzRHa3Yz?=
 =?utf-8?B?NTlpNjM5bkJWYnNtbEFDL2lKWHF4Z25NZmFrK0ZXMHlZWHpoOWxYeE9sRC9s?=
 =?utf-8?B?QTNzWDQ3UzdxZUFTdE13dkcxVDNib1hiQ1o0SkE5QStpazl2ZmRoTDlQTmtQ?=
 =?utf-8?B?MEdySjNMdDFVUnJ5NnAzY0lvOWVWVTVZOUs3ZVRMVnZuUEcyY1cwWk85U0ZC?=
 =?utf-8?B?TEc0RTdna0taRHNXL2cyM2ROMHE4VVROL2g5S1I4TVpIR0pENG4yaWp3NGFC?=
 =?utf-8?B?dEZjSUl0d2IxYXIwWERZVjJZMTdCQ3dzQjU5NWQraWxYT3h6dTArUklLQWs1?=
 =?utf-8?B?YUE0Z3NBZm5FVUNuaE9TMEYvVmNwM1h0aWNkZDNJT2oxZU1JV2pwbzdoMHdB?=
 =?utf-8?B?ak1nYlhmckhwQlZJSjVxNnMvNzhYYjNnRHJCakM5UUdLSWNzWGZmMm5nZThW?=
 =?utf-8?B?d2ptMi9WeHZUcXUwNnFvYXZuNmVUWU5ZdnNFZ1h1UTdnS1pjMTZHcW5JUk1V?=
 =?utf-8?B?aTYwTVhJYWc0clpSSE9iZlI0bnFGTWpzeGhlNCtvSjM3cGRVbWxNZVFzRExl?=
 =?utf-8?B?RjRwOGJVaHBFK3dPVVpCWkxocE9jeStBZnE5TzM1TWI2WURJUGNuRWVxczJG?=
 =?utf-8?B?MCs2VVVLdldoemRkZCs3Vis4YkJiY2FaYTQrQmNWbGxzbTlrSURQZkhUMUdn?=
 =?utf-8?B?RUMvUmJFVGREUG5UTXFWc1B1MlVvenNLU0djWXpLWDdXeVYwRlQ2VzhlRkZI?=
 =?utf-8?B?eUJiT05JRnhwSG9nM2xuYXVhYU5GTnJlbTRiZGUybDJVSDFKVjZ1VWpaeXI3?=
 =?utf-8?B?cTlyV3RlbFV0WVdjWXUxRVo0MGhqeWJDa3Fxb0RmMUlMRFpUSUJZS2FrenBQ?=
 =?utf-8?B?YjByYkdIcXM3MHBxSGFTQmZyQnh0RjhvR3ROaVhEU2x6Q25VNzdxWmE1NzdD?=
 =?utf-8?B?YnNvb0lZS214S051Mko0a253WWRqZjRNUDZwN0ZYeEFGZ2JOa2FPTVlXd04v?=
 =?utf-8?B?emNHemExejVQdW5OY2FyQ21nNWlzbFZrVUpMRUkrYXV3bmdVUUJ2R2lxbXpM?=
 =?utf-8?B?UU5rdmNHZzloeFl4dVRqNm1yZWE0Z3p5R3R4blNrWXJIVVZkdzIxUW1BR3RE?=
 =?utf-8?B?cFRrV0JGN2Qzb2N3NEJIT1dTQ0swYm1teDBaOVBWQWl3TEc4Z3J0L2NFS0NI?=
 =?utf-8?B?YW10ZmV5cTk2Y1dOQTd3MFA5RXVJUzhrYTRDcUxtWG9jclBEa2U4eWl0dFNS?=
 =?utf-8?B?Wm9ZZE9CVzcxaVQrUVI5VFN3SG42QW9VWDkyM3hqYXVBZWx6KytpVGVmdzYy?=
 =?utf-8?B?dFo4eWhqYzk5OHB6cGJBMGhiZTZqdFFUVGR5N0ZCU1FSYkMyV0xneExaWnNt?=
 =?utf-8?B?Ump3NTJiaEFpTEZaZ2Z4T1VyY1JUdU1tUE0rZm5YRFhScG1vcVpZUm9uejZ0?=
 =?utf-8?B?c3JPakxOaHVEVTVVd0ZwZnZNUk5nYkVlci9NRXhWdm1lOEt3cCtZOVZzdlY2?=
 =?utf-8?B?OElTanBsSGhoVHhKcjUrWUlCQzZFd043dWVtTnpGa1BaZGNsRC9jb2JtK0o5?=
 =?utf-8?B?S2hKL0REOHFQQVJSTHNyT1FhOUN5SitTWStoOW5ONS91N2FnZmNrUUlQZjdl?=
 =?utf-8?B?UXlRUXVsaHNJSzhCY0draEMzTTR4eUVTV3FGVzFhWjhDNlphSjFsOHVYQmdO?=
 =?utf-8?B?MDhQdnpmYmU0ZHBDa1dCdVRhc1R6NnBEVzRIVGlPREY2dkJQN0plQXYvYVdi?=
 =?utf-8?B?U3BvRmVQejZIRGZCN0owSnhmcE8zcmNKTENJTVFkU3FDeWhXbTJsQXMyOWNI?=
 =?utf-8?B?bGpPZm1aL0N1b0ZUbndVczk5aWRMZmZmdW9lTHNraTZoT3BkNjd5QkJGUU91?=
 =?utf-8?B?YW9XUm1tZWUyaWY4cjJxZVZ2cmJCcnNST3prS3h2bkRoMUpYeUNTMXdLR05z?=
 =?utf-8?B?RG5YSTNPYi9MVzR5T2dxb0lXbmxKRUhOV3o3MkQ2anYyeERpK3pmV0Y0RGxz?=
 =?utf-8?B?dVMvYkdNcFFPNElBZ2tyK01qNlRuSitKSjlsZlNVbG1hZHg2TlA3R3ozLytl?=
 =?utf-8?B?WElGSzlaTnRnRVZRSXBIQ3g5YTRGUlc2V1R3TmRTT1htdlV0VzNJejViT2xN?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb5af82-7f87-4495-1614-08dafa15e6ec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:08:40.4469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUKr0hDvYB4NZUcmFB2mLQGOFLre2NfwwARX9BfYROV3Bzbtic5DRStk/ufS2YgNtuaplwh2f8LW2EECvtZH9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 19/01/2023 11:17, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add device-tree support for the Cypress CCG UCSI driver. The device-tree
> binding for the Cypress CCG device uses the standard device-tree
> 'firmware-name' string property to indicate the firmware build that is
> used. For ACPI a 16-bit property named 'ccgx,firmware-build' is used and
> if this is not found fall back to the 'firmware-name' property.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V4 -> V5: add support for 'firmware-name'
> V1 -> V4: nothing has changed
> 
>   drivers/usb/typec/ucsi/ucsi_ccg.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 46441f1477f2..889a831e251d 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -643,7 +643,7 @@ static int ccg_request_irq(struct ucsi_ccg *uc)
>   {
>   	unsigned long flags = IRQF_ONESHOT;
>   
> -	if (!has_acpi_companion(uc->dev))
> +	if (!dev_fwnode(uc->dev))
>   		flags |= IRQF_TRIGGER_HIGH;
>   
>   	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
> @@ -1342,6 +1342,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
>   	struct ucsi_ccg *uc;
> +	const char *fw_name;
>   	int status;
>   
>   	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
> @@ -1359,7 +1360,18 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>   	/* Only fail FW flashing when FW build information is not provided */
>   	status = device_property_read_u16(dev, "ccgx,firmware-build",
>   					  &uc->fw_build);
> -	if (status)
> +	if (status) {
> +		status = device_property_read_string(dev, "firmware-name",
> +						     &fw_name);
> +		if (!status) {
> +			if (!strcmp(fw_name, "nvidia,jetson-agx-xavier"))
> +				uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
> +			else if (!strcmp(fw_name, "nvidia,gpu"))
> +				uc->fw_build = CCG_FW_BUILD_NVIDIA;
> +		}
> +	}
> +
> +	if (!uc->fw_build)
>   		dev_err(uc->dev, "failed to get FW build information\n");
>   
>   	/* reset ccg device and initialize ucsi */
> @@ -1426,6 +1438,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
>   	free_irq(uc->irq, uc);
>   }
>   
> +static const struct of_device_id ucsi_ccg_of_match_table[] = {
> +		{ .compatible = "cypress,cypd4226", },
> +		{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
> +
>   static const struct i2c_device_id ucsi_ccg_device_id[] = {
>   	{"ccgx-ucsi", 0},
>   	{}
> @@ -1480,6 +1498,7 @@ static struct i2c_driver ucsi_ccg_driver = {
>   		.pm = &ucsi_ccg_pm,
>   		.dev_groups = ucsi_ccg_groups,
>   		.acpi_match_table = amd_i2c_ucsi_match,
> ++		.of_match_table = ucsi_ccg_of_match_table,


Not sure how this extra '+' crept in, but I will remove this.

Jon

-- 
nvpublic
