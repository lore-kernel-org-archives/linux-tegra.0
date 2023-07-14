Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4253CEB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 10:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236094AbjGNKVM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 06:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236103AbjGNKVL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 06:21:11 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACB22D7B;
        Fri, 14 Jul 2023 03:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5+IAT/qL9kK27HtqYnwt280gDfiLyEZblFSsSFEe9qt2SmeKQn4KGrk9DLoHAhGcD/M+MaTL5s8YWruQjF3Qto/oxzXYZ7yz+Ya/oDB3eAlwQwC6B4qM/4RsM3R6ZPlA/H5U+8Wzc3tWaxX031cCO5a80fxWlsAsRDMGA/uQYT4TvfacQbVqreVQqDbauLuDLtU3vVcKBIiDWQEGv353PNjfENZhHBrjigfqaMJmklGFahjLsFt1/xTB7dJiTBH+G4Dfu6zKFvzcqjwad3V50XKQxa553P/mKW05QdLOOlbzHKX7dSi9VluyZ1IFW0q4FBm4ZKjRcoMrlkLJ/4m4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=um8M9MbLWPuWcgSdk3l6lnbU+mo4phE9WclXUSoHVRg=;
 b=eA7cLrt+M6vXE9WLL2Nsznsz7eNQ0+zSdts26vj1Xpgktc8U/3ob8gnnFvagjJMQqzbHP0fb3gpCB8uMWoQTaKqSjDzQTLGtnaWRw+zI6Ww5zauS8mjdeE+zK+BppIskgYph7rgUKBab8FMRn0gmYUa24KlwRraAKyeloLxytml0pa3Jc/ocv1DoNaUtYQPjbazlXsHoBKChtXLLJlq+hfKCaDkbHZxipE9qj37GeGNsn4gaAQ08rw/S/BEHxdXNrgv1bWLLLbNB+KSral/uyRR15S+XLvZbn1JOZgnrinljoa0OOBSCbV1dUKL1ysFPd8uSEpXZBQJ2ygD422rpHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=um8M9MbLWPuWcgSdk3l6lnbU+mo4phE9WclXUSoHVRg=;
 b=MtXuIfqfPrkAPGDfM9pn35S/dYomGOCG6P0zfbVjMeQAkmwadawjfYibGUEayojuAjotN5a4E9RvmjG2uy55lcBWjK1G/MO1IeBS1u0WNzyC1zZcVm08xkGYFEvT6vrTmaQYjNnReqVPxrBjd5iB090nk/aKBOPy/zwcIIrMxeovQYmnyOd93MHR/rkwPlCInBOqQC2ykX9NDwMVHgUbfKeUVHW3HOv8QO6sJyQuI0mAQlDcGP8kE7cafavBbyyuiSK560lToackm5pK2hLS78HoSGC7lUkuOWjlhrbsyWUxbCWBAHi44UfbdsN8uvQsot72HccKw6shL1r3O6DdeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW6PR12MB8899.namprd12.prod.outlook.com (2603:10b6:303:248::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.31; Fri, 14 Jul 2023 10:21:06 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::cda5:9fa2:725b:8878]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::cda5:9fa2:725b:8878%5]) with mapi id 15.20.6565.034; Fri, 14 Jul 2023
 10:21:06 +0000
Message-ID: <19814316-4f22-ae9d-8b76-f0581c99cfb0@nvidia.com>
Date:   Fri, 14 Jul 2023 11:21:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: tegra: Fix HSUART for Smaug
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230714101018.10617-1-diogo.ivo@tecnico.ulisboa.pt>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230714101018.10617-1-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::20) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW6PR12MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf73cdc-4d55-4a5d-348a-08db845408ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RI/sK3Gw0OMMWg7ww725i07H6L9CRWN1e3ymvK37Z3LNLVNcenbgHyJBBLkVpaWB7ptu3zH5GnWhpzCidzgjZ53V6TEVGWz91NlT5KaliKyh7tBaVRoqsiny5zWx0dQGRatKxks4OmfQLH7+E5/iazttGHkk3SAsRFQyZkwKOiPYQgp+QDl4RNmXoegwc2uo90lX+iEfyMB7OfMtqeq2OQcU18uiFR53UiSnY/gGfGS5Ep32KJb2tj10gvIJSw0F/HdL8Nd3jcTH12ar22kSUP9DycGlQoG1VIMTxo6cwVWPms1sZ+V6LxPuHnnSVpFl65FIShdLSKttZB06gm3/3l6AzvbIDugFf78DHf//uYUgm5D+L6OyFs9wNi8t3BN0cf1517de9RbVDNoX3WE4bR9+4sI4G4JTwmz+77TlCSey5B47rpVxeGLsLQ5147yH53wAGWXNgz9WIQvfibxSKTEJlOckHq9gNJ3lYOCBn+bW80IQv1okqrdnYzdmFXyB/mVh2N3h5iGL68Z7UArF5z1+a9sYp62EFKrGGPMBP/mm9t577FXNKRMxWwSIAUUf8yMTpDZrK9xGUBjHmkfTZ13AdnUik94wYq3uV7A6WqBkRRN2KeLnkGHlO9NkazTGRkOXI4CA7oLvhb5B2G37sA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(31686004)(2906002)(6486002)(478600001)(6666004)(36756003)(66476007)(66556008)(41300700001)(6512007)(6506007)(86362001)(31696002)(66946007)(316002)(53546011)(186003)(83380400001)(38100700002)(2616005)(5660300002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0s0UW05c1l2OTBKQmwvandUOFVnbjZudGxQS3c0MmFMdGtGN3NyYzNFYTRO?=
 =?utf-8?B?N1VNZm9BUzdEVEtPVlIxUS94OEpOdGw4TGV5cVB2Qkk2NGhoMnFEaUxpSGw2?=
 =?utf-8?B?aWxRdWZabVp6S2ozWGs4TEdSTXpGRm9zOG5rUDFaV0ZzSmRGNVpCMmxBaWlZ?=
 =?utf-8?B?OFhUdFVMd3ZWV1YvQUZUUXdjQytuTDdrNDNWZFcvSmRaL3lGZVI3ekwvK2JE?=
 =?utf-8?B?UEVncDI3NG8wVW9FRWRBdFRVWFAvdW0vMlc1b0M5dy96bVB4ZFZoZENYRjUr?=
 =?utf-8?B?Q0kzbjVIblRIdWdubmJVbGhLbERJQUpWcW53SXluRHl1c21KL2pRZTUrSHd1?=
 =?utf-8?B?MnR6M2Z2Q3NiVWhBNDNHdDZBbjZpWGJkR1I5WkFWbXRQR2pFZ2h3Q2pyWXVq?=
 =?utf-8?B?Y2VWVU9mRENNRDByRmdwcEJBQWd0RGNKTlliT0cyWkJ1YkZja3RGMExHcTRj?=
 =?utf-8?B?V29JY0UyNnhVdlJkemtodnptWlEwaFJGaEVkV0ErU21lQmpOTUtDOGhUeFNS?=
 =?utf-8?B?VWRaU2d1TXZVNXhBR3dSai9IaDdURXl1T2lZZmRGdzM3QzNiT1dReEdKUkZo?=
 =?utf-8?B?cExXaW5CSDhTOTA5VHNtd01LZUJvcjF4VUxjbTNidkNLelRxbTRweDAyTXA4?=
 =?utf-8?B?T3UyMXJZVVZaSExncFduK0xTM1l3NlJ5NklIUmNTKzZHOGU1RHZjQU92eFVV?=
 =?utf-8?B?d1FwbWFQRk5QcWhWWXZXQWxRbEhoc3ZNSkJKaTZXTldrUEFhZVArcU9zb2dE?=
 =?utf-8?B?SkNWbk9EZVFXeVBia0VjOW1nUjRrdFlaL1I3WE1IRE1NVmVIdlRvY01pQ3gx?=
 =?utf-8?B?VkZIMmcxcEZaVDRIalhmdCtxVDdJVVBBRlMrWSttTDVMTHVJM21ad1NyNEFm?=
 =?utf-8?B?aWhZQk1QS0ZXODk1eG9uOS92VEVXSmU3OHhKeEJJMHlrdG9SaWQyb1RSRlFx?=
 =?utf-8?B?QisvemlTQ3g4emZDRjlEZW1XU0g1TW92blJVVXlIZjFodWdLbXYwVGN2RXVN?=
 =?utf-8?B?Ri9kSkhPK2pYNHVHS3ptc2R4NUlzMnBUM25aVDAwUXZYWkdiOURwam9yY3Q5?=
 =?utf-8?B?QzJmMWFHUFRqbDRZMG9tMXJPUW14NjYya3VWU2ljaUNsL0R3VlRHMGNNdE1q?=
 =?utf-8?B?RStrMVZPRlFUQk1HSEtTNHBYbkRlZGhnTzhNMVc4bitpMnFCaGtVSkJnL2pa?=
 =?utf-8?B?L2lRU3JOT2dxWFFOdnJjbkRINEFra1EyWHlURlViWXpYWHdOQjh6ZndxNy9p?=
 =?utf-8?B?N29EdlVzRUNKVWV5dW1WTitHeW5IL09tRkhUU3FPRHh4cWZ1ejd3eXJYUDlQ?=
 =?utf-8?B?blJiNk1EUEhYdW15aWNqU3pCN0lTQUo2ZHBvT1VodXVadUtTcWM5TEcwR0Nl?=
 =?utf-8?B?S01FSnJiQ1R3Q01SNTBSNG5oaDYrby9CaW9XSjVUVlNveWJ6bmsrZzB6VEpB?=
 =?utf-8?B?cUlxTWVyS3JObmIwb3lINktDNUNVVXNqN3BJQXo2ZzlsS0ZCRm1DTiswTFEz?=
 =?utf-8?B?TlJiNVFtVnViZUZkckZWUlRhbG5tVVRQSThvbk5CLzhsamZNQldFUkhZNCtr?=
 =?utf-8?B?dldhVDFSd2hid2k0bXFmZjlxVy9jQXlRQjhuZjUxbHN4cmtjQXA3czZvYVpZ?=
 =?utf-8?B?aEtzMFNtYWZ0WUZaWnBORUFjMTBCZVFVUGJ5cnhBNXA2bkZNYUI0cHZpSkNG?=
 =?utf-8?B?RVFWTXhVSmNHN0lkRk9HWUkyWG9jZzVuc3pnbGM4Q1N3Rk91MEhyOGtzL1Vn?=
 =?utf-8?B?cEdZZXJQY0R5dUFva0JuMlFCNEc3bVdIbUxUMlhTS3ZWVS9mckxiWE5HSUtn?=
 =?utf-8?B?S2hodnpWdWtPT2pmR2kyeFdzTG55NytDNHdrU3VZNnp4THNsMWl0R2NIci9N?=
 =?utf-8?B?b1B5cGxlQzF4bVdBa1FQSjBzS2ExU0VGK0NUMlZ5cllTcFZiMUpxdm0yS2t6?=
 =?utf-8?B?THk2ZXpCOG9WVFdnM0d5bERBS3pVelVsem10c3MzZ2dEc2xzZU56T2Fjbm9w?=
 =?utf-8?B?alc5M0V2ZzdQWE5pSmlUSHRNZW1pV1BkMzBJanRhbEE5Sy9tdlZPRkJSdS80?=
 =?utf-8?B?N1JsMkN4aktjMTBEUlkyNlNId3VZUWdrYW5LSzJJWVQyQ3lZc0ZWV1NGVTZk?=
 =?utf-8?B?eWRtSzV2MEtpZ2wzY1dENzAxeGhGeFhKb0tqanpzUzBUQmJ1SDVScFh3RU1X?=
 =?utf-8?B?WGVJcEpNclBUT0d6aVV1c0RwSzVEenpFS2pZaHltK0pvOG5ubHNqN0p3VGV6?=
 =?utf-8?B?Z2Y3WVByVVluVGp0bTJFbzk1OEN3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf73cdc-4d55-4a5d-348a-08db845408ad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 10:21:06.2979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qj51GFNA4jRQ4ouaFuZGXsTAWMSqpq53ZoK0IGxEuAvtZM/88EZxJBDdZSJm2KWazWVVKehL6f/2VdHt28wf+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8899
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 14/07/2023 11:10, Diogo Ivo wrote:
> After commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
> reset-names") was applied, the HSUART failed to probe and the following
> error is seen:
> 
>   serial-tegra 70006300.serial: Couldn't get the reset
>   serial-tegra: probe of 70006300.serial failed with error -2
> 
> Commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
> reset-names") is correct because the "reset-names" property is not
> needed for 8250 UARTs. However, the "reset-names" is required for the
> HSUART and should have been populated as part of commit a63c0cd83720c
> ("arm64: dts: tegra: smaug: Add Bluetooth node") that enabled the HSUART
> for the Pixel C. Fix this by populating the "reset-names" property for
> the HSUART on the Pixel C.
> 
> Fixes: a63c0cd83720 ("arm64: dts: tegra: smaug: Add Bluetooth node")
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index 2c608d645642..bcb533cc002c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1364,6 +1364,7 @@ serial@70006000 {
>   
>   	uartd: serial@70006300 {
>   		compatible = "nvidia,tegra30-hsuart";
> +		reset-names = "serial";
>   		status = "okay";
>   
>   		bluetooth {


Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic
