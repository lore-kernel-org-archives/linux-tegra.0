Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B43C636D3
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 16:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbjBAQAc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 11:00:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbjBAQAa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 11:00:30 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D49A2111;
        Wed,  1 Feb 2023 08:00:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhEJ2Ge7vj9WeCJ/PXUYwkt9wjBVesl781j8dV+7xf/4yeUwRuk/rxXiSCkAgq8SBmF2VKz/DR2mMHMCOPMxWz9/9AL4h+HP7ZbS0jo8YVKveHJa+eeShpuyi2jKH44epKYqAXs+83mpvhlyJfRllshUV1LQHqkoB7VUIZGp4o1SRJmbj807TySDf0YLhNzU1AyHudO96hBoFlYxYu+2cWTir5dDKVWXI8Zq6/aJcalvJRL1FjGhqH9RnkBotTW3y5xhmrb8QIzdnLcEKOXni/bT9PeM45lugchjZ1y2qQpYHd2+7f/DMPcli6aYGj4zfoDNambsHMM4LXPKBk1wlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icq7bQNtCFHkEAZLD9mp2jt4wMhLWnCBHWxy0+OSLWg=;
 b=ga8RDVvWzo8dnMILHHU6gNfbV2SY4VJ1IgbDnKRVnozyn3pU2qjmNzy8SE4eallKmvilw8bpu+1rpgrKOiM41U1GaORay1swsxYouXdqduP5ZCTXi8m4KDbSQNN+Xo8wd411Filj9jttPB7pqNH0j0DlmXJgtuYYKQf+ca0eGnt2fnBWvc1hg0eVGu2pV1h9QB+cTAyhCFwi8hPn0G+gbvJSZuKP5sOX69NCcctaNv5O0Es68SCFds1BcVkcUeQNAH+pEewEh2KLkQRJLU1OFA1OBnsTezInmC+LnJBoh1+jstJYjNt1iMUfGP5xU/J+MeVuFSMzSDc5kO4g8PDFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icq7bQNtCFHkEAZLD9mp2jt4wMhLWnCBHWxy0+OSLWg=;
 b=WKORhbdrxoiuSG8WnikarrCunvYFFBF6Yf+Toafb2URZJqqLEP3Wb8dBVbc1c23wisYbdwGy139uEp+6HyJVuv4TAccyDi0Zf89BothRSlpAGqJskbENngERV7J6+LNjjlrzxW9T6rmTdJPohts5afrsutvwOXrZW1aHs2XfZvSJTrDFyN+3jIVS8um13oFCTYRzquh0g8VhOxCtsZAV7oyN15S6Xy2IjE1Wb6hufA2NjKJDL8rzVHIaY3VAoXFp7o+i7NjRUDXo4XiGg+BKrV8KM4PewtedLjELKhIKkFAHLPqNjAgNVzqhvUHvUq2o/USE9TqhPxZf4/Z1Xvo8ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH3PR12MB8356.namprd12.prod.outlook.com (2603:10b6:610:130::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.24; Wed, 1 Feb 2023 16:00:25 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 16:00:25 +0000
Message-ID: <db53d28c-119b-90c5-de47-bf7a3561552b@nvidia.com>
Date:   Wed, 1 Feb 2023 16:00:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V10 2/6] i2c: nvidia-gpu: Add ACPI property to align with
 device-tree
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-3-jonathanh@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230131175748.256423-3-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::24) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH3PR12MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: 16abd3e9-b0f0-4fd7-e94b-08db046d6df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HkUFpoSafhGZPbt3mRGjW+tZAUlugTjwNH6tQeR1zB/91qFgcjL7/aoq1ysYQILgtHeizOiYNG1jXAD3+yZk8DjiU43dP0HK7UsOJFzoTmsUtPRtGs05BgjJz9qnkNuFwp9pu/EKzMHpnFtZ0OPl9IeVWQwVo2uQun6418SMXs3UYYkdZFnyVt66dnRIAfhMrVkbe0fwCy4IOHWWN3jwYrSK9umlkZAIn9R/+0lyDhZUAxjCLCN8jdsKq9HbOsIz/2jXzDP5rSv+ZDwROUVpBAT4sVxzMVeW48O0gF6r69xlwQHYsfQdlb07jtH75Wx/Ty+BiUoCCL/9PmsUB5KrwjYAiuC8hyj9zvClAUJqRtjjj78p1jAqwhwiTFYaJ9W5F/3ir712eJO+fzGaumaHBoRVxfVzAGjMsjC+YrMjy48U4MaYcqPqmeiQ+hqWZjKkfR4WtMHuKi9BTufszM1FTnz0YHc0cY9KktvBH1+y/f0+1VsiQorpJxGLu8/ytu4XROeez0MiAfEdyXS0dKA0W34EcgkWhX4BPi4TngBHse0Icas2pfg37D/vgT72YQSe636xChVZRsmUrEkGPC6BmJBh8t2XB+6I25yCjM2lSZ8UPvvdJeuU2+Io6Rhvl/V7D1gpB7fXCc6h+qHtJmGfI1ZuBrMzq43MXyrIxgkGGwAm7AcJLSg6XD9AuiimpaHleJEyLBvinswcrTbt/GVyCGwGvL2/c8ZvxzPpE0j+SeA5EGtvlo7ZPTE5RqjyiZU88as9cW0NnZDyW0nBpEg+cVuo0oyPkMgBuCvEUZO6Hx6eZi/EUPr4QbeyqfpDbozt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199018)(6512007)(966005)(53546011)(186003)(107886003)(478600001)(6506007)(6486002)(2906002)(31696002)(86362001)(36756003)(316002)(5660300002)(8676002)(110136005)(41300700001)(8936002)(31686004)(2616005)(6666004)(4326008)(66946007)(38100700002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qyt2NENyM01aS244R01zL1RzY0g1aHgrTVpsMUNYOUFBYkxYaEFhcVZtVko5?=
 =?utf-8?B?RXZFUjdJYVJQMStkWWs0Mmt0c0JtOC9tRjdFNS9xSXE1b1FqUTN2OXZ4YUpN?=
 =?utf-8?B?SGl6OXcrNVNTa3htSDJOV1ViMlRSQTJYQngwRkwzRVY2VEcvNXB5YVNidHEx?=
 =?utf-8?B?cUxma2poUmpzQ2RucVQreGFXRTUzVDlJM1pXNjZWSzVheklrcC9OQktxYXFQ?=
 =?utf-8?B?OVVBcnNxSDB4NDl4cGJFd1dFNlFZeWJGa2lEb1pnWXpwTVNVVlFGZmo0ZXBO?=
 =?utf-8?B?VnM0KzRzUG84QnJQN2Jib2NUMWdiZURMcTlxa1J0dnFZRzBsRjVYQXRndVpi?=
 =?utf-8?B?ckNzU1dwMElEdWw0azNLR3E1SWNzYlBZSjRTcWE0bTJGNy94dHN0c2lMNGlu?=
 =?utf-8?B?S29KbG1Ua3J2NmFVNzMzdFA1R1pqZ2lGZnZBQW9IWUxKRWtTRjRPc3NTbjFN?=
 =?utf-8?B?WUZNeGtrUXFSUlMwait3N2pxWkhnbE80Zm5XY1A0cW1aMHlqeURIdzRRSWhX?=
 =?utf-8?B?ZW9FMnVPRVVDTjVObUdrVUVsckF5Ujg5OEgrME4yekxLQnIxckhjWWVQcnBm?=
 =?utf-8?B?bHE5Nis3Y2thcnhMWXRlek5CWmZOZEQ1WlIzM3c2SXVjMjdZekJtYnVpeDRy?=
 =?utf-8?B?Sll0cFI0WnR2dlNyb1NOVW5yb1lKMFc0bUZkRXB2dFJjQUJLWEZvTUZONDlW?=
 =?utf-8?B?WkhaQ29SQXczYUIvK1hpWW43UTVwRTBsM1Q3ZVVuc0pNa2p6WnBCb1NtZmRX?=
 =?utf-8?B?Q3kydk1XSkppL0NpUSt6M1NiSjZCYjRLRTdycnpxTVBTbWx2aGQvZlgvTjBx?=
 =?utf-8?B?S0RNa0k3ZDdFRXdHelJ3alYyL3dVbnAwYnVQRGszaHFTU0JXeHo0N3VNOE5P?=
 =?utf-8?B?K0M5WUFYR0ZyV29PS3Y2ZHIwUkNad3ZjVktVTWh6TGFDaEpFOW1VbEFuLzF4?=
 =?utf-8?B?eUM2M1NPNm91R2dvdU45RjFJMldTcUxSRWhUZDZoTVo0S3hNY3lCRVRiRzln?=
 =?utf-8?B?LzB5eVZLckVKRnFMYUgrdjlsblBGaGZXakJ4OWZhMHJRbVNjbG1sNFlHRU96?=
 =?utf-8?B?bzdCQXFVTzhLM1ltQUxYVC9PRFpBQlY2aEpHMTlYNXpLSWllRWJCNFJsVW91?=
 =?utf-8?B?d1pMVk54Tkh1V1BUemVUSDVhTTg2aVdnK0Zja0FmV1dIUUplcEtUU3NscHNT?=
 =?utf-8?B?ZythcHhCck0relBKUVRza3VlYW96cSswVUNTQXUwaHE1cnRjQTJHd3BSWnNp?=
 =?utf-8?B?cjFwRENDSW0yQnF2emlFN05IRUNydlE4M0ZKVGRybWZMazF5NnczZEdNRCt4?=
 =?utf-8?B?am5hL0RxTTg4dWJ2NVhKelVWLzljcjlCbUlsL2pheE1KM0Z1ZlZlN3hRaWtF?=
 =?utf-8?B?ekM3ZGlmbDFYZUUzVW9OZk43bDFrS2pvRzlHTGNsN0tYZ0huUTJjeVpDbVg5?=
 =?utf-8?B?OE83cXRYWTU0Y3pGYUZ4TUQ0SjdsMFpKTkp2T2pJMS9EQzNGMkhRRnlEbi9q?=
 =?utf-8?B?b09YVW84NEtJLzlDQ24xZllyWWI2S2dVZ21PT0tURXlhM3k3NjJ2WXZyeG12?=
 =?utf-8?B?YWg1NHEvVUROZTgvZzN4bWw4a3RNUU96LzV1RC9DT2w1a3p5Q0JYdDBjRzB3?=
 =?utf-8?B?eUwyZTN2dzVWZ0NnSU9Ja3oya3d1aWFjRFRjWnM2cm56WGhLempYWGY4VnNX?=
 =?utf-8?B?OXBCLzBSMnJOeiswZzR1T3JtcjNLcVB3OXpWSUFEdW5NYzJ2bjQ0a2pUbG1L?=
 =?utf-8?B?aVJZSjhIaHpBNUNITGRWT0xhR3NJYUFMM1kwMVFwbkZTSDJtOHpZQkwzNTFK?=
 =?utf-8?B?ZFdCcGE2RlhLV1ZidnFXRFpUN0RtREhFSkRqQjBrV0VCcmpKNmxCZUkvYys0?=
 =?utf-8?B?L05Va3dHNnNZc3dlZWh6Y29RdDdsODZ2U3pkNGNCZ04wZzVveXIwSE50RW4z?=
 =?utf-8?B?MUw2Nys1ZjR0M3lQQ0hyeGkxc3hFMlFRT0plRmRpNmJsTWRtcmlxQ0gyaWNy?=
 =?utf-8?B?NHRiTGVPaEtuVnM5V1g2UkhrbXh6eUdPMXlCNytJcTh6SzRtcDVKTVJEMUhw?=
 =?utf-8?B?MlhUSDJHV2tiOVhwTVllLzVLWnpOVG9jQ05DMzl5ME1OQzBCSnlRYk9mRko0?=
 =?utf-8?B?ZTR4VXYreXpRSDFTYlNWN3ZQVnl2Q2VIU2QrTXNyYUJQTzNjU1BFK2p3bE9l?=
 =?utf-8?B?bW9Cdk1CcnJuVWIxNUFVSGNuaG0reHl2bGt2ei9YZEdJNTB2eGN1cDhYWVNX?=
 =?utf-8?B?OC80MHF5TjJTNWtXVWJNeDJraldnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16abd3e9-b0f0-4fd7-e94b-08db046d6df7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 16:00:24.9560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSLmHk/mcTilPkvDur0saKRvCwjwhf/2YGVuBOLJuB0udbiItm2Vh0iEiEUkLmGytXkPpNhHitcq6Pg/wY3MBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8356
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

H Wolfram,

On 31/01/2023 17:57, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Device-tree uses the 'firmware-name' string property to pass a name of
> the firmware build to the Cypress CCGx driver. Add a new ACPI string
> property to the NVIDIA GPU I2C driver to align with device-tree so that
> we can migrate to using a common property name for both ACPI and
> device-tree.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> V8 -> V10: no changes
> V7: Added Heikki's reviewed-by
> V6: no changes
> V5: Added this patch from V3
> 
>   drivers/i2c/busses/i2c-nvidia-gpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index 12e330cd7635..6d81ea530a83 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -261,6 +261,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>   static const struct property_entry ccgx_props[] = {
>   	/* Use FW built for NVIDIA (nv) only */
>   	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
> +	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
>   	{ }
>   };
>   

Apologies, but we appear to be missing you on this series [0]. Please 
take a look at patches, 2, 3 and 4. If you are OK with the changes, I am 
not sure if it is easiest for Heikki or Greg to merge?

Thanks
Jon

[0] 
https://lore.kernel.org/linux-tegra/20230131175748.256423-1-jonathanh@nvidia.com/

-- 
nvpublic
