Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B972E3F2
	for <linux-tegra@vger.kernel.org>; Sat, 16 Dec 2023 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pTCfIm6z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHOy0pmwWANwXE1mYNR8yDGGNXJ4s2vpBHvwNG8pwuX+F8zo4otCme78ApV4/T7j2MQbxzP9kJa4h4C3OXIcFs8Sx1nd4yxOr45Gzu/c2eWtuvEJcHclPwjDrQG3jR2IR3Itc5YhJ7KbMRl+O9KFT1b5VngXW5KffB2BLXRZlAuoWXOIQvsikjFRb91Ho4LJTembSby+Er/ZgtfEdq4pSWbnNAI051u3RBeP8A9Lp7jKOsMeT3TW/wmB76rEXR9ZwEwUaYQTHZVg9K+6vGk1htKSKdnASfD5/p1ggBlPgLyW27Z1IWV/7jjo+3+1MjTFVjVjvGap5lbMheuZ10XANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td8yFiQdOQrQOTWq3hlFx3/Spq2PV4plZFKccyh53dY=;
 b=Eprp+RpH6m7p0lkm/fEuTK8S11PnN2H4qCYJkurcfolePtfW614N0UmvTYoevvxgxxHbxMcx2iOrbyziOKBuq6X5hwBhTLycJUGDrs++Szs3xf0UqfKM4y28f2TypgXyXGSQp6klb5Pz6DPXU7XCAAcEsl2v0zVT0VXXyLPusXBkItil8o61EkRID0mKxiOziN7J6hZ9PiY8d3RF6Yj00q85zqkmMf7Em7wqlmkp5aGC+Qk3ajaIgIh0UbSLUq4iEcBs9mDGjzwoNt/ml8+S/oI8fKh0Zc3mXwgCgKJPJJbO8PHTnNhqoJLVTMNPUzLf6fKohzvQEcR/h99y+QZjlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td8yFiQdOQrQOTWq3hlFx3/Spq2PV4plZFKccyh53dY=;
 b=pTCfIm6z0+JXHVu2cx1j/iZOCHB2pHUl5DELWiJ1sC+rOlvep1TgkHWvXaRw6F6i0hKLb2JY7c6TLaEK1FML284gfAGAEF82RmsaLejkFcvcYiFji0uFp1kFPAPdbgeFsh/DGxIwSqDSZwOtZlNpf25vH4BaL4ZW3RrHByigRL7BsPSb6m/DDkMW8nl0+Snw4NlByZuQLH9GabUIZ7x7JQ998zql0xjYCjuqS1EZxWjgy/IIiKW5lr/ZgAnQ0nKlDYwwckivjz/SDo8RCeFbjOiV/dsF0g1sF1//EUPx9kFPzIIpQEj2PRKdNJJqkbDU8sGBa/LvdkSnQ7iPaeDqtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23)
 by DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Sat, 16 Dec
 2023 17:27:38 +0000
Received: from DM6PR12MB4435.namprd12.prod.outlook.com
 ([fe80::6f0b:532d:ebe9:2529]) by DM6PR12MB4435.namprd12.prod.outlook.com
 ([fe80::6f0b:532d:ebe9:2529%4]) with mapi id 15.20.7091.034; Sat, 16 Dec 2023
 17:27:38 +0000
Message-ID: <86289fc6-c447-4fe5-9ed3-4d24e90c9953@nvidia.com>
Date: Sat, 16 Dec 2023 22:57:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] dmaengine: tegra210-adma: Support dma-channel-mask
 property
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-tegra@vger.kernel.org
References: <9aeefd2b-2ba7-40be-9b0e-564cfd4ece6f@moroto.mountain>
Content-Language: en-US
From: Mohan Kumar D <mkumard@nvidia.com>
In-Reply-To: <9aeefd2b-2ba7-40be-9b0e-564cfd4ece6f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::23) To DM6PR12MB4435.namprd12.prod.outlook.com
 (2603:10b6:5:2a6::23)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4435:EE_|DM6PR12MB4107:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cf0602-3723-4444-ab7e-08dbfe5c4c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K3ioAf/9NZTRyn7tCzs0j2K5N6Vz39zCk543HRQKN/80hjkSpo/UKRWx3/M2yT2i0Iko9+FOBEpxnK2z8HqJB4goHNRwFjcVD/OkUcGuoqqF7+aR/l6rWiRWOjH9SQGVjzRK222AGuVfwYIxWI81MHixs2fMv66I9S2Mm6+za/kP3Gu4kTFsQEN09Qfr05LRnDQFIxAS/eTTuBy/lZF8L0KM7KPV1+SNEuvUYZM6Wq7PN7OPE+axIhg7qxkMNiiY9ivdnB/gBACecbxYjySKxoynscPtdeQxrETqZ9ZnduxL7njURfcnun3Zqs5cRZNsiyB1T316/IjXUz/5d6BuWWONZhRAIYy19/FtMMwZp+We9lr7xUuw9HbiGlcgmMN3qeTw71aIRtR2HijQn26lpdl7RFOIoxznVM/Fmyori9udapT34HS+V4wMC0lLwq+QRRIjHm8VAXSpdDAY8j6vr9o+A86kvNVG1bu6ev5FEhOaLueJOa9gSvhRMAqrLKcl2QfXtl2o3z1QHaMk1z2svoK81EuizxGtu7+Vyq1LDxfLTV1xUPnbcBa/f1doW7pAKBqmk7MXjKSJU0bOiHmDEPkMJ+N45aNO1r3SAo1dGxZrXoA7UbSdwK54x7/hbE9N4XCerQrp4cpnQRPTuGuPViVXLm3kfU5RCrLssZol8T4qRLRqXSPKsvGu8AMXF8Kb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4435.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(366004)(346002)(136003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(66556008)(31686004)(41300700001)(66476007)(8676002)(6666004)(83380400001)(2906002)(8936002)(4326008)(38100700002)(6916009)(66946007)(5660300002)(316002)(86362001)(31696002)(6486002)(478600001)(53546011)(36756003)(2616005)(6506007)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlZlUTlIeFcxRFNWZElSVTdKNXdydWN2bjVhaWdrUTlXSXVDekJnWFRBZXNC?=
 =?utf-8?B?U3lWOU1Hb0NGa2ZwL3ZhWUU4REh6STNvNTF6a3VvYWpIN0dZRWt2SVBZVnNE?=
 =?utf-8?B?Z2laK3lIcUlxYllKNXdyT1NuN1A4dWhZaDBBeXEwTEtIZ0VtQ0FZazBYeE54?=
 =?utf-8?B?NVFkS1VTK2JpQkxJSkxmRjV1VjIzcFhleEkyMXY5LzRkTmpiOHpOV2o3VHQ4?=
 =?utf-8?B?ZFA3K3V2QUJaMllmSzJ6NWhyem5ETGVOSzNsRkNydXA3VDNuR1hQSS9WRVFF?=
 =?utf-8?B?bjUvOEhkZlAwbEJETlh3YnlwRG92YXYzTm5ET0wxL3NrN1RKbnB4THBUSHZJ?=
 =?utf-8?B?Y090UkxZcjFiTmJlUi9XQkFVeEl6aFdGaVEwaVRiTnR4ODd4RjZjaHJkbnZn?=
 =?utf-8?B?MVZVRGs2WGg1VkFPV1Bzbm9Od3B1VEdxcHlsRUlONnIwTVpvelZMNUdPY21h?=
 =?utf-8?B?MFJJZEw4SEo2bE1BRHJvUG1UcVBJNXJnVkJUdW9VODZkQ3Bkdm1rbEZkT1FK?=
 =?utf-8?B?ampKU3pyaTNDSDNLaW5ITTdYUGMzNnV2WUYwVWdLeC9wVGZqbithSzlSRlhs?=
 =?utf-8?B?eDNjcGVhczBmUmN1ZkV0dXpkbkxKbEIvV2I5ZDA4MzFiY0g4TzIxb29DV2g5?=
 =?utf-8?B?MUhvNDh5QmFGc3RmdXJicm9obTN4bHh3SGkvUkFjcUlkcnZmL3YyTmpWV2NY?=
 =?utf-8?B?UUwyaCtYZEtMbkhwajFOV2E0M3NFeGlxUmRUandZYlVHMldhLzFSYXNuSXNl?=
 =?utf-8?B?Zm5hREw3SjFHQjlFaE5ncWFHOUIyVHViV0xyTnVsbmYvQjc1ZEZqbUgxd2lL?=
 =?utf-8?B?MitzRlhFcTVSR0ZFMW9tZzl5aDMyZXpQSldTd2tWamx6L1N2bWNTQm96TG1D?=
 =?utf-8?B?MzNOSTZzaS9zM0FYcEV2cHQzT0pHeXh0U1VzTGhhSGpwN2VNZGNkUkhFSVhq?=
 =?utf-8?B?QTRBU3M5djNXS05DYnlvd0dLNkFWVTdMOCtBM2ozT1JnRFlVMWpJcmdOb0RZ?=
 =?utf-8?B?TmFNemdXNlhmcVlrWDNrTk95b3ZFN3lOTHQwQVFod2lJdDZJQkVTMFhJYVF2?=
 =?utf-8?B?dXpIeEdpQ011Zm9PMWVrOEkzOUVpamthU3dHUFhZcktnQ01Sb2FzdnNieGNa?=
 =?utf-8?B?NVRFYW9UUWFYRGZLRUVVK2Q4SFlBYkJTUWhvNmFnaDkvdVZ0dSs3bTZvSUtq?=
 =?utf-8?B?aUp2UHE4cGhzc0FLL2grVTJNWENTZUVZelY0S2toWEF1aDVlbElYdVp0ejBJ?=
 =?utf-8?B?K2tiaHZ3M3FzQzN6YUpPOUErdDVRZlhoN21BaFJqK3o1Vi9za2JoN3E3QmVT?=
 =?utf-8?B?ZDZzOHBoaWo0SlArYlBpZDRybGE0VkZhNUJMYlZSWG1NSC8zcWIvbjAvVjJv?=
 =?utf-8?B?eExzbFBYMWpZdEdTaFdjTVRCLzFDblVJTGZPOG9OQ1JKb2Y3ckNIQjNicUZC?=
 =?utf-8?B?a3ZsL3BxdGhLbDB4RkNPWXRMWUtmbDhpZWphOHY5TVBnSkpZVXMwdGFDUXVG?=
 =?utf-8?B?dnN3dU8zMFJnWExmSHU0Z1ZrVjZFL1I2Z1VWdmllN0krRDJGeWtPNTh0QlZv?=
 =?utf-8?B?UXZmcTFWN2Z6YWNvU2VoZUlnZ0VFUEFwK29kamkrTnZUUkU2R1h6MExtWHA0?=
 =?utf-8?B?ZnVwSVl2VnUvZE9RTHRTWmVIVHZEMXBCQUg0dm5hNTJyU2pKOElOOWQxVGl1?=
 =?utf-8?B?Zm44a2tGRmU0TERhK1NWL1NPcjY1a1dxZ2F1S09kYllhUjdvczFTcFViRFZm?=
 =?utf-8?B?WFNZa2hhNkdoZGpuclMxcGxKcEs4WGwrcDlqS3RsNUVabXJvVzg1QkZlRlJo?=
 =?utf-8?B?aENNbWoreHJDcnBiSWZpTTZrRE5TQnd2ZzZvQlE0Zk9mRjV0RGtpcWxJREE0?=
 =?utf-8?B?RGt2a010MXF3WllaazhUbmkrMWd1c2xQVE1rRUJiZHNibllNWnNrRHIvR1I3?=
 =?utf-8?B?L3FHUGRmelFxVDVzOVNOR2tOWWdqLzU0Rnc2dExYaVBNKzRScEFnZEhvYmZH?=
 =?utf-8?B?QlRBemlwSmRpSjdVaElMNEVZckp2YzV4QU5EcjZXb2Q1YStBeHVPOVFVL2FH?=
 =?utf-8?B?OHJBdGFjOUtLNHA4Z0luOG9PL2VDZ00wZ1k1V25adWpQbkxYWGFBVmUzeFdL?=
 =?utf-8?Q?zsgrmyoSn9hxtdaKbFHfaXiW3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cf0602-3723-4444-ab7e-08dbfe5c4c6a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2023 17:27:38.0093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXOdaH/X3dp7SP7xhxtys1mxpRAyHTWCbYk1IHbU0sNY2quxIJX56ShhbtFNo+IjqBUyzUA1n0+G0Ej6WESlIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107


On 13-12-2023 12:07, Dan Carpenter wrote:
> External email: Use caution opening links or attachments
>
>
> Hello Mohan Kumar,
>
> The patch 25b636225a08: "dmaengine: tegra210-adma: Support
> dma-channel-mask property" from Nov 28, 2023 (linux-next), leads to
> the following Smatch static checker warning:
>
>          drivers/dma/tegra210-adma.c:887 tegra_adma_probe()
>          warn: passing casted pointer 'tdma->dma_chan_mask' to 'of_property_read_u32_array()' 64 vs 32.
>
> drivers/dma/tegra210-adma.c
>      845 static int tegra_adma_probe(struct platform_device *pdev)
>      846 {
>      847         const struct tegra_adma_chip_data *cdata;
>      848         struct tegra_adma *tdma;
>      849         int ret, i;
>      850
>      851         cdata = of_device_get_match_data(&pdev->dev);
>      852         if (!cdata) {
>      853                 dev_err(&pdev->dev, "device match data not found\n");
>      854                 return -ENODEV;
>      855         }
>      856
>      857         tdma = devm_kzalloc(&pdev->dev,
>      858                             struct_size(tdma, channels, cdata->nr_channels),
>      859                             GFP_KERNEL);
>      860         if (!tdma)
>      861                 return -ENOMEM;
>      862
>      863         tdma->dev = &pdev->dev;
>      864         tdma->cdata = cdata;
>      865         tdma->nr_channels = cdata->nr_channels;
>      866         platform_set_drvdata(pdev, tdma);
>      867
>      868         tdma->base_addr = devm_platform_ioremap_resource(pdev, 0);
>      869         if (IS_ERR(tdma->base_addr))
>      870                 return PTR_ERR(tdma->base_addr);
>      871
>      872         tdma->ahub_clk = devm_clk_get(&pdev->dev, "d_audio");
>      873         if (IS_ERR(tdma->ahub_clk)) {
>      874                 dev_err(&pdev->dev, "Error: Missing ahub controller clock\n");
>      875                 return PTR_ERR(tdma->ahub_clk);
>      876         }
>      877
>      878         tdma->dma_chan_mask = devm_kzalloc(&pdev->dev,
>      879                                            BITS_TO_LONGS(tdma->nr_channels) * sizeof(unsigned long),
>      880                                            GFP_KERNEL);
>      881         if (!tdma->dma_chan_mask)
>      882                 return -ENOMEM;
>      883
>      884         /* Enable all channels by default */
>      885         bitmap_fill(tdma->dma_chan_mask, tdma->nr_channels);
>      886
> --> 887         ret = of_property_read_u32_array(pdev->dev.of_node, "dma-channel-mask",
>      888                                          (u32 *)tdma->dma_chan_mask,
>
> I don't think this will work on big endian systems...  Do we care about
> that?
We don't care for big endian, as all the Tegra chip which is supported 
by this adma driver is little endian. If you still have any concern we 
need to re-look on the typecasting logic.
>
>      889                                          BITS_TO_U32(tdma->nr_channels));
>      890         if (ret < 0 && (ret != -EINVAL)) {
>      891                 dev_err(&pdev->dev, "dma-channel-mask is not complete.\n");
>      892                 return ret;
>      893         }
>      894
>      895         INIT_LIST_HEAD(&tdma->dma_dev.channels);
>      896         for (i = 0; i < tdma->nr_channels; i++) {
>      897                 struct tegra_adma_chan *tdc = &tdma->channels[i];
>      898
>      899                 /* skip for reserved channels */
>      900                 if (!test_bit(i, tdma->dma_chan_mask))
>      901                         continue;
>      902
>
> regards,
> dan carpenter
