Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1C0C7EE29
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 14:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240969AbjFIOgM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 10:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239211AbjFIOgL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 10:36:11 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9B73580
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 07:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+NLCEfu/x/0JYCcbq6bBUEf4Cw44DQaK9IZF6W3w39IlER9yLGrtU9Tnnsre9AmQRPY8rRgv6XV0QNSaWAWzsv0UeGyyqlhBPlj15nxywSg1/zR6Z4YR3cBE32cN4XJ6GMvWjgTHFAmHw9t/GCreB185ntN2zs2VQ5ngFG5ZqrgnfwfOQzXVlx7DfwQOZV0/e6w6ZGmVtvXEOhEJEiKuxS9z0+m0ERj4jm56FPIY0mOtnNMtQIuZxcEpQ1dUv7FE8mSxKQ6GDQVcSJZSSxhyA9jAavJTsUdyMUdPrKP2FuAJqk9Lk/uZdN5FvfhJQaOWG+pF4Ik82WqZkoAlqTEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qnIVG0XaAC6cvDsr8/OlIxzmAqu890cwZVB5FPufWo=;
 b=SPnvxUF3FQL512Zlc3LIT8Wu5LK+NXOrZ48UOQ6vm37dkPM0aW/0soHB5Wk8Sjo461QFSCkuYOKYlsCZ5jTeCUEd+TS1DdzbyJNXE8NrLO8EKpLbDMyJ6pcLU6LpgyrAQNpY5khzWrCGXVkt0eJoa59oAhSnrXTFetMPSCR8uTcXQ6mxPJM0yZzcjOsqa0OzTWnjY6kqe5bxzgpt7o99EUM8rD7VbbojfMRll/LkDR0rswD+0YgweICvjyokOkQwwIsU5WsnGcSmVIwFCgdMpPQgiy6JpMKijqZgZWKFLzDJPLmXpwFTKpIEDE5n9Vb6xPuyGmOXwNfcKFVXWgtx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qnIVG0XaAC6cvDsr8/OlIxzmAqu890cwZVB5FPufWo=;
 b=pVJcjNO70svfKdTBnUMD+PG+YtDVHw+M9AUK3p/bl/6KZ88SKXdQ6Lwzc1PvTNgigrrfQQxUXHFlOgq8xGXMn5YFg3FuFGcP111SEBNCQGp2Ci6RcCzdnvA5POLRst1A7ax6kfiPZRKhme1+apzq7+xseECjreQcayR463ZX1Y07lPD1MZ4RuoVMBxfYoY//kAzMiShbDCAnNiC+cQfcXNDmGf4QSckPDNLu6MkIn7r/CsCczEMbsXnSb2CuKEw5d87y25CO4B5xQG1yTwPaFHqR4yg3QzzD3etwefD+x1mwSCLK9AwI+UXiKwhK1Y2QvRndeKqvk5KKRbgQIMDeRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB9150.namprd12.prod.outlook.com (2603:10b6:510:2eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 14:36:07 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 14:36:06 +0000
Message-ID: <4db6c552-4443-2d4c-a26a-b4da6d463419@nvidia.com>
Date:   Fri, 9 Jun 2023 15:36:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] arm64: tegra: Add Tegra234 thermal support
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Yi-Wei Wang <yiweiw@nvidia.com>, linux-tegra@vger.kernel.org
References: <20230609131711.3826912-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230609131711.3826912-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::9) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b143cba-0d49-47b5-0e2c-08db68f6dc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mBmTnFOEiSMTrhBroWgGPz6TIS2vdwrf80mJfz8P6tKdO+1r2IV/0wy0ELlrZYfsXB3NJSa0rh8CoT/I81uC+ipTYZE9Mj5CBh7X5StRtNaNWPy8BkQQvuhBlGanXswMbh4+ro35HGn7h2GVzAhpCRr4zRzVj0SJL0S+MdEalVJB5NmIzvwokQr2IOOz+7vH8T6LD8FuqGvLtucrxXDJ2182LcsSDHs15hfAaf6m5Juy3kLeJxXRBet/1DBMC3PnvLXd9U8bxGusYPcmuPUkKukgIRDywCthZ6UnmeMuxOPgqU4iztwNOUTplRlYQ6htA0vGP2Dz0CziyWT2LfxHWWrRx71RxucOaQZr+Q9pDm9IRJ9mpaUNJ6ZmG/trbCIcPaHVuX365/jcvdCZZJOJTNuQUNNAUIW6F8JgbwHpCHmh3G6ZSB1h6H6yGzud8s4RyRkX9S35mf5X0UC+jTP93xHXngD9eMycfRktlfizsy70uzquIcJjhqsfMgesq8hCpCBBKAruluN0OzLr+piwR4fo/BgPxK611aEJwMUDuyaC6saNVtCvpa8Y1PltWl9bvlAurL4mOb0GR0t3ct+R3rmRYtPR7YiHflKfVK3J/KdF4oyKk29UMjuuRDYgog9McJ9gmwuatfgGfR+E/jcwZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(66476007)(66946007)(66556008)(38100700002)(2906002)(6916009)(36756003)(41300700001)(4326008)(86362001)(31696002)(5660300002)(316002)(8936002)(6486002)(8676002)(6666004)(6512007)(53546011)(6506007)(186003)(83380400001)(31686004)(2616005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDA4YnRuMXRFNXN1cFFYYmczRnBOUXBUbmwydm5Xd2dOaGVhVE9SNk9OdjlR?=
 =?utf-8?B?TWF1bGduQzYvTTRmRk00c1l5NjdxeTkyRzdFTDZvN0loNXBoaDhwK0lkS1hV?=
 =?utf-8?B?ZzJwczU4aTZ0VTZyb0NwcW1nWU9KaDMxTGp0cTF0YVEyMk91SU5FK0lva3Rs?=
 =?utf-8?B?aGYySlRDVFZDbHZjQ2o0YjN4RzVmanQxQ1E1ZjdqQWRsN1lweDh6ZVJ0aEhS?=
 =?utf-8?B?N0ozYk94Q1kvZkxkQjZXNkkrTW1haW9maUYzc0ErMGZ4cmVVSzZQZG5tTWdK?=
 =?utf-8?B?STZ1cDhLRmlZKy90ZVR3Z0grcGllZ09uZFBsQ1g4K3AxMVJxc3NpdzVMMjcz?=
 =?utf-8?B?bkR6bU9KOFhJQitaK1YwTlJHSUJ1a3JpcVBLVzhMaVNrU3V1SG9hOHJGVGJo?=
 =?utf-8?B?NFR6RmlFMW9ZVm5FSDkza3ZBUTNsemRPalo1RG5teUM5cytIeXI1bXVsZG9L?=
 =?utf-8?B?MzhjbDdSUnh5N0FJZms4VDg5UjNLZVN4U1cvdU9BRm1OV29FcDFac0hmNHda?=
 =?utf-8?B?c2tubG9wS3gwbWE5cHVPVGN6Qy8yeU1mR3Z1YWEwRnZwSUkrdXBHallSSldR?=
 =?utf-8?B?S3RBSTJSWTlzSXdWYTVYNGd5ZGRPR3ZodFNzQnNUakwrZW0zZDNlaWZlUU1G?=
 =?utf-8?B?T2dURVorbUFoenczZGFIN3VaSHh0NHZMN3BEVGdSZGtYM1NFZ0ZNWERUTFNL?=
 =?utf-8?B?a2tsYkp3YWtIaDdSbG93dExVZU1UdXBUbnRTSWtjbkV0cmI0dVhaTmQ1eGZF?=
 =?utf-8?B?ZXFucStzYmhpTE0vOVZlNCtlZDc2VjhaeTBPUS9RaHNUa0crV2dFWHhYcmpj?=
 =?utf-8?B?OHdTWnNkdGdqYzdGRjI5V1VzeFN3RWczQWY3VUg3T0d4cUFwV0dUdmlvVGhY?=
 =?utf-8?B?NDhCeTZIVmFYOUhJaDAxOUtGeW5aWHBsVEViTlV6UnFoSGVhYmV4emVCRWdD?=
 =?utf-8?B?ZVh1QVB6ejN2WWoyNDNocEh6dHl6YmxNZ1poOStQelcvY0Z2cXFWaTM1VTVH?=
 =?utf-8?B?dFJJL3JKOTNUUW1oNHlIcmxJZmx5dmJ1Y1Y1RWZFNWhqekFWT08zbFlhQ3JI?=
 =?utf-8?B?dFpSUCtOczV6NjBUdVJhNjdiOXRSUVJ0RlQ0TEhjY0RtNFZ5aFVGQUIzeWtw?=
 =?utf-8?B?TnBCclIwYXMxdVhDTithaFM3RHgxTXZQYjhleHVrYjVIUS9KWG11cE1uSkpL?=
 =?utf-8?B?QW5VREJnWE9JMzgyTlRnZzNrUm14Z1dwQzI2QTBBUVlnL0RZUGdvNDA3K3hk?=
 =?utf-8?B?ckdXdmFZeUZBQVBpV3pqbVNwTTN1WjQ3dDdhSm85eHFzbW50VFpIOGNveStN?=
 =?utf-8?B?dzEzcHFNWU1wM1A5Tlpid2I1Zk95c0hwNm9JeVIzQnR6RVp5K0RuOHhwT0pP?=
 =?utf-8?B?c2dWM01QS0o3Uy9sam1yS1FOdjJFcW42cVJIWlBFMmpEeldHRGZlRXRPR2h0?=
 =?utf-8?B?dVRFSXJ5WElzVE5iN0NDdGQxc1ljTDdNSWxXMEVlTVozc2lWdkxoRlhvN215?=
 =?utf-8?B?MW9lR3h6QVA2UzhmeU5ZVWEwQ3liN3l4TDQ4Tk1SZU9yajZnLzliVHUrWU9O?=
 =?utf-8?B?TDlFdllQRnV3UjhDWjk4bDFkS0RtYno1clVtb2I1ZHowNVFkT1dJajNUSFM1?=
 =?utf-8?B?TWpBUnNJUmF5MkkyenhpampSUTAzNWovU2JFSnFIZG5iRlJoTk5UMyszOGRj?=
 =?utf-8?B?RTI1S3JWS2xxTFRZeHRUTE1GOW5uQm82K01uN1lZR0lHNThYRURKSCsxU1dK?=
 =?utf-8?B?Z2lUUHV6NldiU1hJTXh6Q292QjhuWWFlMDgrUU1JV2g3M0ozQzhRNEFEcWs0?=
 =?utf-8?B?Um40M1BPS3ZoZStZWmNGVk9WSjZZanp1RU93YkFmM3BFTkV1bHN6OVBlMllq?=
 =?utf-8?B?anRaV1Y1Y2FKWlcvMVdjdFFRaU9aMFliYkEzWmxsV21Wdmt1MUlZbVJENnYz?=
 =?utf-8?B?bDBkT3h3Q0MyS1hwKzVGS2JOZnE5ckNvOU9HdHlldVRjdDVRSmVETU1RbUxV?=
 =?utf-8?B?NGxoYmtGc21SZTlwaVhIYVhHRk51UzN5TXpPZU1wcUlGME1haW5Kc29hdEJq?=
 =?utf-8?B?bGhqQTFJR2RPaFd1UFMvTEFqejFNdlludlBIV0swOG81Sy9RUnBlQXNPTW5j?=
 =?utf-8?B?b2JlZHZBUHR1WU0vMUVIaThLb0lxWnVZYU9SL25LcUlLL2ptcnV4UU8yZWRv?=
 =?utf-8?B?anc0b0MzOFBMdytLRU9VRk51dFBkdVdFdGhqcDJvV3pNMWY4N29tT1kzZUla?=
 =?utf-8?B?T2JLRFZZTUhYTUZrRUxGTFYwOXlBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b143cba-0d49-47b5-0e2c-08db68f6dc21
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 14:36:06.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYIAlxNBuHl5tL8l9hrYR4qSFQir3WV7h7rMrUfassiwzXk8WFE6f9sbdUwiaqv9jLxfkCcPqu+6EWa6MeXRNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9150
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 09/06/2023 14:17, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add device tree node for the BPMP thermal node on Tegra234 and add
> thermal zone definitions.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 53 +++++++++++++++++++
>   .../thermal/tegra234-bpmp-thermal.h           | 19 +++++++
>   2 files changed, 72 insertions(+)
>   create mode 100644 include/dt-bindings/thermal/tegra234-bpmp-thermal.h
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 6e66f41695c0..c17abe054dab 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -8,6 +8,7 @@
>   #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>   #include <dt-bindings/power/tegra234-powergate.h>
>   #include <dt-bindings/reset/tegra234-reset.h>
> +#include <dt-bindings/thermal/tegra234-bpmp-thermal.h>
>   
>   / {
>   	compatible = "nvidia,tegra234";
> @@ -3163,6 +3164,11 @@ bpmp_i2c: i2c {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   		};
> +
> +		bpmp_thermal: thermal {
> +			compatible = "nvidia,tegra186-bpmp-thermal";
> +			#thermal-sensor-cells = <1>;
> +		};
>   	};
>   
>   	cpus {
> @@ -3653,6 +3659,53 @@ sound {
>   					 <&bpmp TEGRA234_CLK_PLLA_OUT0>;
>   	};
>   
> +	thermal-zones {
> +		cpu-thermal {
> +			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_CPU>;
> +			status = "disabled";
> +		};
> +
> +		gpu-thermal {
> +			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_GPU>;
> +			status = "disabled";
> +		};
> +
> +		cv0-thermal {
> +			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_CV0>;
> +			status = "disabled";
> +		};
> +
> +		cv1-thermal {
> +			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_CV1>;
> +			status = "disabled";
> +		};
> +
> +		cv2-thermal {
> +			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_CV2>;
> +			status = "disabled";
> +		};
> +
> +		soc0-thermal {
> +			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_SOC0>;
> +			status = "disabled";
> +		};
> +
> +		soc1-thermal {
> +			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_SOC1>;
> +			status = "disabled";
> +		};
> +
> +		soc2-thermal {
> +			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_SOC2>;
> +			status = "disabled";
> +		};
> +
> +		tj-thermal {
> +			thermal-sensors = <&{/bpmp/thermal} TEGRA234_BPMP_THERMAL_ZONE_TJ_MAX>;
> +			status = "disabled";
> +		};
> +	};
> +
>   	timer {
>   		compatible = "arm,armv8-timer";
>   		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> diff --git a/include/dt-bindings/thermal/tegra234-bpmp-thermal.h b/include/dt-bindings/thermal/tegra234-bpmp-thermal.h
> new file mode 100644
> index 000000000000..934787950932
> --- /dev/null
> +++ b/include/dt-bindings/thermal/tegra234-bpmp-thermal.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This header provides constants for binding nvidia,tegra234-bpmp-thermal.
> + */
> +
> +#ifndef _DT_BINDINGS_THERMAL_TEGRA234_BPMP_THERMAL_H
> +#define _DT_BINDINGS_THERMAL_TEGRA234_BPMP_THERMAL_H
> +
> +#define TEGRA234_BPMP_THERMAL_ZONE_CPU		0
> +#define TEGRA234_BPMP_THERMAL_ZONE_GPU		1
> +#define TEGRA234_BPMP_THERMAL_ZONE_CV0		2
> +#define TEGRA234_BPMP_THERMAL_ZONE_CV1		3
> +#define TEGRA234_BPMP_THERMAL_ZONE_CV2		4
> +#define TEGRA234_BPMP_THERMAL_ZONE_SOC0		5
> +#define TEGRA234_BPMP_THERMAL_ZONE_SOC1		6
> +#define TEGRA234_BPMP_THERMAL_ZONE_SOC2		7
> +#define TEGRA234_BPMP_THERMAL_ZONE_TJ_MAX	8
> +
> +#endif


Looks good to me. For this series ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic
