Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B98C76196
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Mar 2023 11:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjCPLhZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Mar 2023 07:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbjCPLhV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Mar 2023 07:37:21 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A2E763F2
        for <linux-tegra@vger.kernel.org>; Thu, 16 Mar 2023 04:37:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQ7UTMyCKIUqzznKgHKHhx2mGQ77aQ1tED5tgRSzG6U67i+tZ6gepqeUdT3x9wVaHwaaz9EQxNgDurNHUqTOQJR2Jv00RI0ag5BTiGPfyvX5J4IMhAUIy+A+OKvzQ9VHYrRjos7h8NTzNbWhiQQ+K7DXbxunvhIez04i6ghjnhHSnRWLzmAcL+wCJIfOYCLvoz2cTsDoOIUmP1zZyllMFlDUd72EtygvgwW9psrxAmq8gywW9zFp8G1/Thw91A0tj5kte5p7yIKop08+udAs5upHoAe8BAjUobvZ5fcseYoLg1QFWsYKrHXm6vuxihnNw25JYUF9aN5ZKMXRPkhLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIkBVu0+Lmk3XDDym8QRy93ynHKA4tUEi2Q5Dmbe2Us=;
 b=BZVM3Yrh5orpY/++eXqkpNaA/r/2/fCIjYU5vA5bbZLvAu2llMLVKSuBpVZw26j4qVuM9I8+fLlQhEpD/VpCGqACM5dlZkDmMdeyjz8MF4eN4HiGmkSWZrteBoYEBityEe+XwezscccvDsmIEwE2s3EhxiB3guU7pEJFPLgk4e7MZnVA3AgpZO2w3J+EG03h1riIp5zjfESg4LLJ5Z4myLNOLeM4hgfxpxtsH+wNYYnQCpr95DMRKFHPJbczpR7C2C9CPkGZrQgopmXtH+p4Mz/VIXOPKWspKzpu+E9GjiBXaiRlzLROCYKyxTfKxiwHV319ffbUA/s0OkQ/0xuZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIkBVu0+Lmk3XDDym8QRy93ynHKA4tUEi2Q5Dmbe2Us=;
 b=kCPRZNPVM3zrC/10uZi70VL6eXAayH0WRRfO+AvcBnxIiI6t1NEym/y2r7ChSU4mCXdTwd3s1nUaAFP18HZLF6jNvRPf0sFslSUnGg1nPZQDtHdKpW+njYOx3E2Fb0AAKr4jWBKpzT/KaLBXYoL6iVtlKE74xNPCvh0w2qwATh5CohbeX6qPhaB76eXlJEMpPA1OvABgjyL95n8ONI21aOJqQe7t8FYMT9Up+DxIDPrMg3RhCKO1sV+onUAiXj+ekHhb608Ajce8UIg9CG4F7O2Xd5CITmueZi4HF6mzCVgk9IxEj9PbQlsi9c2c2QUWveTq5vF34KWadNtGr0XbUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH0PR12MB8462.namprd12.prod.outlook.com (2603:10b6:610:190::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Thu, 16 Mar
 2023 11:37:04 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5464:997b:389:4b07%9]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:37:04 +0000
Message-ID: <ddac1870-dbd4-e49a-abb5-148457549bf0@nvidia.com>
Date:   Thu, 16 Mar 2023 11:36:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v6.3-rc1
Content-Language: en-US
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Thierry Reding <thierry.reding@gmail.com>
References: <20230302094213.3874449-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230302094213.3874449-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0538.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::8) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH0PR12MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8b0886-bda4-4228-f2d7-08db2612c41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NzKXGaIBeA/JLdS8KdF6Ac4USbhL5EjdmgnPW5g3T6H7ChLNU+5AA7ZffW7pMkqs02heanFRYMQkCObybp2itcxOZcWw1uo/hNnJ0jUTgNe2SvACbI3Cm9bH8MOsW3f5ORDabFJes0V62aGbNdCTivm5g162nyqKvSgU9BoytkQnIXxN6pTn0wyeTPGQN+d6VXiVO1YI+pSDLOit7poWpuOqRAYKKt/DjkKSLZ7943v3Rrx0qDJU6nkwZwL3aaMxHOcEtnZD5MhKs+y+7sTzaya0ABkj6rdu//OxLmYfCmz267F1mt6glQArY2iBg2vnOAPYi5yG9e2cMxxEE4dFfyP2iB6bol1dDf0vjEBgQljwfZMGOVnlOMADn9hQP9l/BwuZnHmk8TcFS7XlCnkwXKoaw3UMBvHs3ILKenE2m8ENoU+73Rbpm9r349C1D90WTn3/NgFJZoledHwNpn1nq6+tHRVJhJ/dWHPO2mbiA8ApmcO2ClaeiY1ED7D3K0qCx40r4g+s8+fOFiIz5hx3ZrBL7Znvm4l2ATqz195+vMteKLW1wC11gPW3WV7OuS828gSXeW6WWPi7YxBdCxQ8Qmx02KDsL8MMBjYVmpMUYA+v1aLPkLb8vKb4Y/BZQPTEn86sA57ztYwWZcxxWa6UsbkjDqdo5ycEktEUp/VERozZ0GicI3X5DqZ076Pker6wn5Suhee296Mk4viXIIjkn8eDKLpO2RbzuBcbfgBDBtLno08k1ByEI5UdxKzJmgTgc3ledB/Nzb035lbZxZ/3MQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199018)(31686004)(2906002)(36756003)(86362001)(31696002)(38100700002)(186003)(53546011)(6512007)(2616005)(55236004)(26005)(5660300002)(6506007)(6666004)(6486002)(478600001)(41300700001)(83380400001)(66946007)(66476007)(316002)(4326008)(8936002)(8676002)(66556008)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzRwbENneDFNd1FNT2pQdmxVWExqaWxxUUtudWhzUm1Kd3hCU3JaQjV0Z0Zo?=
 =?utf-8?B?SmN3dTA1Rlh1emdVTDcyZGVRaW5zbld6WmNpYkU5UURQTUUvSHM5TXpKbXEv?=
 =?utf-8?B?WUNsbHFKTUllUU5oNzljVitkK3grNGNzeEkzUVo1T1hiNmtONVRndGZ3eFpi?=
 =?utf-8?B?ODFYZmppNGlWa0QwNkJmOVZrZlFFd290aFN4TlJuQi9QVUZscEpYelU3V2tO?=
 =?utf-8?B?a015RlhYNFdHZjZBKzVVSksrTVlrK2R4S2FCa3pncGQ3RVJhTER5OXVHWDhG?=
 =?utf-8?B?K2F1cURJbWxMSDY3NnRYNWhaYkRyQnhxN0U4NStZWkR1OUR5SnJQUU43SlRp?=
 =?utf-8?B?OExTNjAxRURaRDJmK2FCMWpwQVdKU3lKTEtBN2FwdmE0OVZublA3ZkJ5MFp4?=
 =?utf-8?B?Zy9BZnA5VzJycm02eVFzSURTSWVRVTBCV1RoN0MxY055K1RsK3B0a2QvbGk1?=
 =?utf-8?B?VlA2aTgrUm5uL1R4RmNRb2tkVEJNdGZzaC9WWTd4VFVTemlvdWl1NWx1ZExu?=
 =?utf-8?B?bUZ0KzdSbCtxRFBXMHBLQnhiL3Nnb0JsaWRJM1R5amQweEtlN1lRTDd2Q01l?=
 =?utf-8?B?TjByWVROR2dkSlV5SlgrNzk5UmpsdlB1ZENwVjkxbStDWnZXQWZnQjliUUNF?=
 =?utf-8?B?WVFaQlVGTllzYTJLTGNvMEZ2R0g5QnJ2dFRKR1drSjgrVU84ZFoxbzhpT1BW?=
 =?utf-8?B?ZklMSUtuZW9QTGs0LzAvRERiamdsa2hjemFua09sanZmc2tRMHBUNWkyOW1s?=
 =?utf-8?B?bUJHMmZFbGhwODN1aDIrRnVOQjZUT1VwSDA5ODBwaUdHZHdRL0xkV3hmTkZC?=
 =?utf-8?B?bmlFSDVsVTdtaGEvNVJ5M25wZGp5aHhEQVdaa3NMZUQ4QWM3aENsNnh5bkdR?=
 =?utf-8?B?M3p4dHVQSkJQcE5MM1dRekFaNE50YndNZVQvRFpia3hVQnFpc2VQVVVmbFpl?=
 =?utf-8?B?b05JMVZqRU1zeEhHTm56NkxPTGlxYjZPR25lMVh2U2dmOVpScE1HYmQ4WVU4?=
 =?utf-8?B?VlJQK3VjcTRTLzRDbFByVDZDMVNDbXZtQThxS1o3UGVTbHRPQmVMbUZOakJF?=
 =?utf-8?B?NXhrR1U4VHdvYnlZTlp1THBqQ2huNGdoMnFEcHE3OGgzVGN3OGIvdGN4Vjdr?=
 =?utf-8?B?MVMybGhBR2hNV1dnVks5a1QxYXZSdTBhak85L0RYUURUTGYvclAxbDdCcDJH?=
 =?utf-8?B?REVSRVNxWFJjQ2txTTJhT2RreVNTclIyeElQVXlRWXRadjBZWGpKbkhYbm84?=
 =?utf-8?B?Z0FhU1JiOStZaFhyT2RuR28vNFRMSjlHRXJnU2V3bXdDSXRZMnZYajNXeWxa?=
 =?utf-8?B?M0kvR3VieXRDQ1hta0hqME4vRi9WUHVDVkdEc0I4WmxUTUNIOXBEVHJ6K2w3?=
 =?utf-8?B?TVVSSXA3MENoZHZvSTFPTmxQMXhDK3pvQnRneFA5R0tjVmtxN2lmY2VscXZQ?=
 =?utf-8?B?VkdBL0pSQmxoV1ZFelFhRUxwaW44eUQxaVlxa0doOTNNaGxrNHgrdjZ1QTNq?=
 =?utf-8?B?QlkrRjA0SHBZVkRIRzdMQzI2Um5IK0Qrb1pmWU1MSW4rTi83d3ZTNzEvNVZ4?=
 =?utf-8?B?UlhueldWTVlyOTB1V2JSdjNaQVJBMGdsSXowUVcvMFBRUExKTEI5Z0hFT1NB?=
 =?utf-8?B?SVIvV0FQRmFRRW5YTW9tVDZTSVJ6Yk1leVR4L1pKUDRLQVMxOVMza3J3YXBN?=
 =?utf-8?B?SjU4NUV6M3hDNTUzTmJNcWJNNXliV3JDVWpBRDFYYS9HdUVLWUY4ZllmNkRJ?=
 =?utf-8?B?Yk5yczlhdy9Cc2MxRXV3UTNKZE4yeFZyL0VjMWl1WDlYVVVRc2crZFZFZ3ZW?=
 =?utf-8?B?RzFUeTRNdzdPY3RPV0dXOGFlU1dRbjNOdkNKZDMyM2liSnlnOXE3S0pxM3Mv?=
 =?utf-8?B?UUZzd1pNS2dGVk5VUUc0bitvZ0tWbkthcEZqVHg3QlRKbkovNFhRbnN2dFBJ?=
 =?utf-8?B?aWlqVHFCTUF6Wkh3K1JaUnNIRGtIQ3gyREc3Nk82VzhvUHJnTEYxU05KUnFG?=
 =?utf-8?B?eThDNTRzNkMxaTBGdzFKekxjS0pKOWNwZ0dIOXVLdjd0RUJTZ1lFNWlFQk9G?=
 =?utf-8?B?MkFlamVkVDl2Mk1pNno1ai85cDhPZGFtTWhQSExTSE8yZXVLbElkdFY1K25s?=
 =?utf-8?B?R25vaWM2NlN1bGxBS3FmMEllNmRqNUEvWVMzd3dzUFUxK3d0UldwM2diUU9h?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8b0886-bda4-4228-f2d7-08db2612c41f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 11:37:04.7251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3w43OtVZOs0UsC2pENZYkterxfoquaO8B3AV6UaEekORBUFeYDYBv9p0z6GEu0DtYtrnNk/cxqI6LZ7FOwgzgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8462
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi all,

On 02/03/2023 09:42, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 682e1c498ae793ad90587171c93c1f7ec87aa208:
> 
>    arm64: tegra: Drop I2C iommus and dma-coherent properties (2023-01-27 17:08:58 +0100)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.3-arm64-dt-fixes
> 
> for you to fetch changes up to 4bb54c2ce48ffb3a06133ac0fb4086f7b48d9109:
> 
>    arm64: tegra: Bump CBB ranges property on Tegra194 and Tegra234 (2023-03-02 10:35:11 +0100)
> 
> This single fix is also available in patchwork if you prefer to pick
> this up as a standalone patch:
> 
> 	http://patchwork.ozlabs.org/project/linux-tegra/patch/20230214140549.3340395-1-thierry.reding@gmail.com/
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Device tree fixes for v6.3-rc1
> 
> This contains a fix for the CBB bus' ranges property on Tegra194 and
> Tegra234 that restores proper translation of PCI addresses.
> 
> ----------------------------------------------------------------
> Thierry Reding (1):
>        arm64: tegra: Bump CBB ranges property on Tegra194 and Tegra234
> 
>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)



I have not seen this land in the mainline yet. If you already have this 
queued up for v6.3 then ignore this, but if not, please can we get this 
pulled in?

Thanks!
Jon
-- 
nvpublic
