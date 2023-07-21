Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214DFEB64DD
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 13:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbjGUN1Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjGUN1P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 09:27:15 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447E81FE1;
        Fri, 21 Jul 2023 06:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGprJ3mmcgN3UQ3zhlD1oy8zJ4t4FFpsfqN/OFq1x5MONBj7b3YPtZZ4XeHycQjf+uYI/yf4oSHzrvMsVBv74VTfmQiW5CTpfN0SH6EslCMA9890W4pOBKh0vMGSJI3ezyKxrAcCezCBFxlZBLKtBrG4rimXH5L5qP50u8xYIB/WEqJqalncfnl95VuZ6u1LTJW/k7+pMEXIjhAG25pnDeOlRD413ZDbdTRRu8v1v7g/mNNhnaUIEwBvytAZkkrkUs2w0xX2ruOIsjeBkGFSI5+C2ijebQInUjDU1ZnZl53FfJVOCY8m7s9l+n1FNEhKq1wNdKdghskvNYRs7/omyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpZA3yVH0ETeoSfWWLuyca4oxClMJdwK41cQNF0ZY+w=;
 b=JmFV5CvfIDogqDiMuDJ9nDj/Hh7okcKkNpd1OX2m7OeA0HBGraroGugwqh1PbWxM9xIg8PnrJx1REnbF5/OnKMwZy6FZjDzUwwOUYk/iNYT4BUQ2vOdhJ0Ewbl0bHgYqvLmRCMx8Qahxn7b3i2YBn3nesYRBwFLaAUIeypT91FAKFWu2TSdGiAjveSaqWgnLhmYup0X3jAlERBnuJzhtkQ/yS0CxjI6mOhbMD8sjye83FnaD9ljrEs9EtgR0Yy6N1mSgLTg3Cijn6zd22wEfr7uSW4yYzq+CXLmQ/6unUEK3AZV+dr3CWbh1ADNAEev+n20aHn5dc8WycQIAD0WafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpZA3yVH0ETeoSfWWLuyca4oxClMJdwK41cQNF0ZY+w=;
 b=PYys914GjbsTeRIPbrgWlK5n+460F9dNJTuFO8RqosWkCZzXmkdTJXDdAh5gxSMh0EQH6HO9fQgA6yJF1dthOQO78Ve8C07IcFCpjEg11behFbUdqspIq8Z4Xi4IhVb+HrNg1YZietSz/VUb1Cf95pE/qgDCKM/Cwluj5u7mSnm5BvlD+5yaQGjMtucoDYSEec6P39sLXE8oIY41K8xoufyXDT+/B3d2fC8VEDWreBsGL7GKkIGFMuqE295rGpv6L80I+fwrM3hKi4L8lN/MQnzZzn1fI0zEMLJPOe3Cb2MSefbfdtIeW8ddp9fERYE9U/jGGft0jwioEyT13BofMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Fri, 21 Jul
 2023 13:26:29 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ab4c:b09f:b445:be6e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ab4c:b09f:b445:be6e%6]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 13:26:29 +0000
Message-ID: <28041fb7-c49c-dab6-b62d-83778f7b7f5f@nvidia.com>
Date:   Fri, 21 Jul 2023 14:26:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: tegra: Add PCIe and DP 3.3V supplies
Content-Language: en-US
To:     Shubhi Garg <shgarg@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230531085052.3082394-1-shgarg@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230531085052.3082394-1-shgarg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::21) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH3PR12MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d97db2-8e65-41a9-29ce-08db89ee179c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: io/LQZftnhDhtfYtkfqb9eKr6T+dGO3h0gZoJjGchV8YcIESTe16q7UKIYF1dMMSDNkAB7yjP7lafuJD1Gd0+oPW7cctP6xMvv/5Nz04EfriQNM7w3U6an/nEeLnEOTdd099NI4wZxm9fnn6U5BLgpAt+EQ/KigC1jeoZvhWzH+mgwGvr8KVwEYBNz4yZIDdFoIB/IlWkfbBNN2kQLjaJ59C3A1WSq3gJtwEmeZVAfb+QgQtwSbKb5jyDozWfk359YHxJi2mLs2CERvQVrcAKsfDvTzNVxCsSs2hWw0o3Zi1vRCEy9ElOw7YYtNz9zLSqOPn3I+2oCiFplDvK/8FGhLzZbeOh47S6isnDhUYtIepH96hhjtEQds5MZWNgV4Q65qaKQmQud4tpvIocwANUoZWctY6MI5qgOF7Hq/dufsbBRKq21OzvmiQv2xyWMkNCUcdPKqVrYmbADp06t0G7CcwTfdr8p7lzfihtj5SsTkXPtKHdLVY0PO4qd/tMlquUwnsoFlWdq3mY6e4hvkmODL8dkIE7GWkYGbNbObqFX793KKTAYoAGkR/3MxkDjxZiGJgZKGm6KacJWOYQBk3X8h8YabNIVGjauhoBigVUduwXTvu1CzykeMJvXjsh78GKZGurkRpzENwboGvapOYGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(8936002)(31686004)(31696002)(36756003)(86362001)(2906002)(6512007)(186003)(53546011)(6506007)(6666004)(6486002)(38100700002)(66946007)(66556008)(2616005)(8676002)(316002)(478600001)(41300700001)(5660300002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXViSXJYaW1adXpwU1V2TlJ6ZmF2MXlxTXZtU20yT2VJWFFiQUZ5T3krNXpw?=
 =?utf-8?B?MkZaUndTYUNVSHNReFdSZktWOUh3dzlLd3o5cysxazdHTjNXUldqdGRaMzVr?=
 =?utf-8?B?ZXlkREdGSjloNVVSeGFIVkxCYW1DaXZON1E0K3p4R3V6cFpQQ1BGTTVVUmg4?=
 =?utf-8?B?cVVlVXc5WkNPVUZCWFRtZGxlSTZhU1Y0c2Q2K280aXlnMkVuOTU1ei9RVXZ5?=
 =?utf-8?B?YmFlb1B5UDd5dzkyb2YzY0ZkZlU0T29hSXRJRUNTNnVySEVXZkpZZisvRWEy?=
 =?utf-8?B?cnNRYmJRN3NBck10a3hBU1Q5QzZrNDhPb1FacEtJaSt0ajdQQ2JGTGN1MXZt?=
 =?utf-8?B?NDVZS3lCTXdlaTZ0aHRXZk94MCs2K0V2SzR5dTJ3ZnpPRGNUek1TNDFWRXNa?=
 =?utf-8?B?VUlEYkVMeGtwVElSTitVYXFuUCtZcEJHbk9iTnFyZ09GdmkzVnR6TlZ2aGs3?=
 =?utf-8?B?ZlMrcUEvempMa0xtaFVwMS9iMFRYMnJDV1hDWjcxaGYwdkgzSUJVM1FJQlVV?=
 =?utf-8?B?aDlLbmRwS3NzM1BtRktWQkJnSDFFenJsMmJyY1JWUXZzaTlyQTU2ZVBETmxY?=
 =?utf-8?B?Uzd4OWpZeWxYenRLbXJ1U1crSGcrOTQ2dVFSZENHdWgrVUFKcHZLWXBFYlJm?=
 =?utf-8?B?R1RTVkZramRYNEQyWFBvd2hkRUlkSmY3NGhpcUloTWNnaXErUVVCVko2Mm1v?=
 =?utf-8?B?akRlYkw5VGRLQURjODlaeVIyNXFyWDk5M0N5V1pqR1ZBWitFdkNUbEFQNXF3?=
 =?utf-8?B?OFM2Wm0vT3hHRGVnUXY4bGtkOXRRUzhiTk9pNjVFYmN4T3VQdjJCQmQrd0sz?=
 =?utf-8?B?b1Nkc1h1RjVOYTNneWc1L2x6Zk9JTjVFM2ZYSGE3aUlaa1pEcUJla2lrMVdp?=
 =?utf-8?B?cVRBVWMyOHQvTzRITkE5ZmdXM0VZNEhDZ2w0Zjd4RkY5eGVZQXVTL3ZhdTdI?=
 =?utf-8?B?Q0JXUnZQQUovZ01mU2FyOFh0SkdmV3JYSWdJK2QrMFRwQ2l3aWV0S0Q3QXNp?=
 =?utf-8?B?YjBEMFNRRUk1RjRqcWI0U0FWOFNVNlc3emFvL3hwSmFqWmgvb2gxS0JoLy9V?=
 =?utf-8?B?MUpoWmtIZnBsVE1Cb0RlOWZQbXBkRkJiUWRmblFFckI2S2REdCtlT3duU242?=
 =?utf-8?B?RjJMaWVYbS9wczNCNjNVODhGd1EyMWU0eTdVWmd4UFZsU1FicnhUeG9iRlVx?=
 =?utf-8?B?VVcyb1diT1RpK2RodEsxTEhVM2NRR1ZlRERKbDc2aXlLbk9Lem1rTWFBSVdK?=
 =?utf-8?B?eDBXWEZtR2RKdlhRYnVqUWJ6eUt6V3RrVUg3N2Y2MC9RMld4ZUVvcVNLRFRq?=
 =?utf-8?B?R2ZtYmt6YnpNNHFsOFJKT0pQa2FxQWdnTUY4bTlzcldwOVp3WnZGdk9CU2lR?=
 =?utf-8?B?UUhicFJ2OVRCQzlGeURBUXRhVU9TTEgwMXl6M0ZEb2ErN21EOWJUUEhOT1lT?=
 =?utf-8?B?VlY3U1V0UTdIR2FQbFplRmVRc1JnUSszZ0RlT1MrYlcvYkxKczdocXpsTDRi?=
 =?utf-8?B?ay91em1PVUxkUzBVeEFOODJPbGc3ZllBc2FqcGFydG5nUnM1bS9nbmdEb2NG?=
 =?utf-8?B?T3ZIYVcwM21SQkwxNkRNa1JEbU52dGRNY3NhcExNUG5WWFRwZjRXQzZ2NUtq?=
 =?utf-8?B?Z1NyVzNzYVI4RGNUYlRCRFdzYXQvRjNkRkdybXYxRXRYRmRESVM4NWxtbEJ0?=
 =?utf-8?B?RjFPbnBtU01iY3h2ak1pcUhBM3V5YTBDU1QybjFlYUlZNTBYZUJpcW5GTFVY?=
 =?utf-8?B?K3paZFBnaEovMnFmaWw0MFVMM3MycE5yVlNUUDFESW52bDNmQlh2dUllQ3JI?=
 =?utf-8?B?STdocWlOdEJpRWJnVUhUdHlNZE13Uldqc3dlblJLN0wvZ3RyL20yYzRuRVRR?=
 =?utf-8?B?N1hWdkptOXQ3NVNhL3BhMks4WXVWd3JtTVdWOUZRTkFZSXZjUzZWL2RDQUJU?=
 =?utf-8?B?WGZXa0JnNC9KRTFKUE95UzROWkZRNC9FWEMvRlJoQTNlUFp2bnBNMG5pUzhG?=
 =?utf-8?B?NlhRbHZsdjJoY1VCeE4xaVZwalN3d2lKZFhFYzlvQlpURWxkc1ZFYWdDU3VD?=
 =?utf-8?B?b0VEM1BBbXF2bEZrU25zY2U2UWJkc1NycTVkVjRjWXM5L2wrWmtUb2xUT3ds?=
 =?utf-8?B?QWoxT1I4Q2VNM0doL2ZHdUFPcTR6TFhHN3pRUDZ1V1ZVd3ZKWnBPbjlNa0Jk?=
 =?utf-8?B?OWZDMndndHhURFpPa1g3Wndzdk9BdmZLTUN0MGw5WGxoQmNJTWsrU1Z3ZzIw?=
 =?utf-8?B?aHcwVi9ZZFZldER4WklTc0REMTl3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d97db2-8e65-41a9-29ce-08db89ee179c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 13:26:29.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++LPz2O7tCIX19NjR5ioUMJzAEJinp0H7EHc3dU/qdcs0K+pnrkEWQ0Tmb9uRgw8hUviV+Xxmqiz1oPKl9HP9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 31/05/2023 09:50, Shubhi Garg wrote:
> Add the 3.3V supplies for PCIe C1 controller and Display Port controller
> for the NVIDIA IGX Orin platform.
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
>   .../nvidia/tegra234-p3740-0002+p3701-0008.dts |  1 +
>   .../boot/dts/nvidia/tegra234-p3740-0002.dtsi  | 28 +++++++++++++++++++
>   2 files changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
> index 43d797e5544f..c0ba69c16382 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
> @@ -35,6 +35,7 @@
>   		pcie@14100000 {
>   			status = "okay";
>   			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
> +			vpcie3v3-supply = <&vdd_3v3_wifi>;
>   			phys = <&p2u_hsio_3>;
>   			phy-names = "p2u-0";
>   		};
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
> index c95063b19321..7f6c34b79491 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
> @@ -134,4 +134,32 @@
>   				"usb3-0", "usb3-1", "usb3-2";
>   		};
>   	};
> +
> +	vdd_3v3_dp: regulator-vdd-3v3-dp {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vdd-3v3-dp";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				vin-supply = <&vdd_3v3_sys>;
> +				gpio = <&gpio TEGRA234_MAIN_GPIO(H, 6) 0>;
> +				enable-active-high;
> +				regulator-always-on;
> +	};
> +
> +	vdd_3v3_sys: regulator-vdd-3v3-sys {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vdd-3v3-sys";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +	};
> +
> +	vdd_3v3_wifi: regulator-vdd-3v3-wifi {
> +				compatible = "regulator-fixed";
> +				regulator-name = "vdd-3v3-wifi";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				gpio = <&gpio TEGRA234_MAIN_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
> +				regulator-boot-on;
> +				enable-active-high;
> +	};
>   };


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thierry, OK to pick this up?

Jon

-- 
nvpublic
