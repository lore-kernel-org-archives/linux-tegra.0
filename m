Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD53C47088
	for <linux-tegra@archiver.kernel.org>; Wed, 26 May 2021 22:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D536613BD
	for <linux-tegra@archiver.kernel.org>; Wed, 26 May 2021 22:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhEZWNg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 May 2021 18:13:36 -0400
Received: from mail-dm6nam10on2072.outbound.protection.outlook.com ([40.107.93.72]:31072
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229624AbhEZWNg (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 May 2021 18:13:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRD4KiZ2Fc7X+pLcauDfXZtHHH9JXnCn89eKy7xs8fg6WFHopJg830c//uD6/bVMEA1Roe+28UpkQY8aBtBtpXJRQ43Mou7AC2t3XGqxBzeXy2rsqS8bAynQK8Cbe/IDd2PDXD/OsuUv7b07Ux4ee63u5ZNH4zMdTguIZYxBEGagkyKHJBhywgJ/93igbpVTv+He7FFhbCYMlgWWo1sqR/UPvVIFbQ/4Qfc5yhfoJ3Tlt+y1QGOjnAZX3dPLGhXBd12qZlUVl0n7whNgUmgG7Dl6YCtXvFsDrQYRecO72j093VR+cbzqqTt+E+Cm9cxxLAAxiNC5GgMY+ilOSvxRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18KQBD+i7uEJtGSWsfcQFe/1Iw82u0R7eGURUY7TEoU=;
 b=cyCQT0j1v5zq1vLBZkkBJDhi1LOU0WjA1EttVcQy8Hu0gFaVdp607Y8UNaRo+nYKcADmRR3ksC1uNwMIRepOjdMCXxRtd10hMsKqh9DQUsRR7qn0e8DUI6LPS/Jw76ZRgl5TPFQMZ4Q911M34Nz1a/ozIQcEs+J+U5zH+TwDeJHrbE4NPxCgV5xxYXi45Z57Tr8fYog/U8dH0DSGnshPiG6PMYJXV/C9t0lPGbC5kwFOgYCFAKRcF+79J43NKFQVZBUsnol7+27xeAOqK049xZhBqbBmMDyjPlEm3EkX8YGMZ+EXBBp+gOxqa9pYxqHCmk8PfQ31zfM9A8GlSiC7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18KQBD+i7uEJtGSWsfcQFe/1Iw82u0R7eGURUY7TEoU=;
 b=maCNXeyzdODwq84Rg4HiQzaLxF//2utPjiUD2rqpmZIfl4hYXIc7EDTdMiv4EkkxlKDfJbF7EziyiieEU8vuGS1i4VGPIzuA3KIBGUs6vmadNR2g/HMO1iAyp7mPy/w9yG3Wbsl/jmiWlcxlKZN5Wp0gKQb3c5Ofg410y3miSo2aLTZXeLw3bGpQTnKci0LRUJC46XvvJvhW+kO1ik9uAGPXge6tb2OmR4zHFHwIFMH1FiPbds2e842P44aSTQDKrxczXOHhyIFgZvCo2bhF5yCv54aE2XV3Y6X3FLKsRhXhi0VFh1EUKFSJ7rNV4MtINrDQr1l4hHaCRlpL8ijWtg==
Received: from DM6PR07CA0041.namprd07.prod.outlook.com (2603:10b6:5:74::18) by
 BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 22:12:03 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::7d) by DM6PR07CA0041.outlook.office365.com
 (2603:10b6:5:74::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Wed, 26 May 2021 22:12:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 26 May 2021 22:12:02 +0000
Received: from [10.26.49.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 26 May
 2021 22:12:01 +0000
Subject: Re: [PATCH 2/2] arm64: Check if GMID_EL1.BS is the same on all CPUs
To:     Catalin Marinas <catalin.marinas@arm.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20210511182322.3830-1-catalin.marinas@arm.com>
 <20210511182322.3830-3-catalin.marinas@arm.com>
 <e30a7d50-5ee3-990a-3f0a-d5009f1e6869@nvidia.com>
 <20210526214815.GA5083@arm.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ed4d190b-8208-5853-f954-48d026c86057@nvidia.com>
Date:   Wed, 26 May 2021 23:11:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526214815.GA5083@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ee6a5c-bbb9-4391-2df5-08d920934a66
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4999FE86CB0E9790C4475868D9249@BY5PR12MB4999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T5kN/MM6ZvGfRTm5S3LzG6zbHPn6BBhls16IeJCt6N9m+VEbkLoWz2+WKaUQ4q5aQDO8T5Mit+oY+9vEeJjMfLEMJftDAfRZ3hvlEtosqCI4l0j/pis1jhm4czJ81y5it8/TAJ7XuoO2iSOe/eZbHXrdMOhxqmEKala510yUggTQ7EHb4fJFm2WAX5xXVkGd9rhyyVFvpbmUTs2skARcK5RNFLY4DX/jApsg8vQnqYcfJ2P+48k1RZ4hll9RxnrKW/W/K2qBFPYcgH7NXi+xO1OahD+vg94ITZG0gbZWjXsZhf8miL98HfXWs8umwaOXgpJGYF9Bp+2XBaJLXz2NkkBPWi0AqI+I+ym6ZLwR4kxkARuzsPj9Dk1nKUSvYQ3g4JwvxKB/Sc73izKAKo2rouOHcifU4XGHeQ+XMI1VN5Dx7ytZeWPUuYjFUQphH4zO0aazmJT5lhWb3iNX3z0oy+JDhRH/wJ2PbbCit5/ls4u6NENvRe2wIiTBQD5ExF3wZKVV6Uy6Y3rC87bQowkeiCI/QMBwvOECaAgoq4I0pt4t1QbnwdQACFg5Ykkj5lmYJyM1E5NvbJ/LCopaDqDYvbQHV5pTpL/EDU7ScFLUsJGxIWCl9R++IwKHqEL+kycfh7VJrlwBi/Rh/rKgWMGVLdhfCkv8WK9HUsWGHxw3UQ1Fb2OEYGEOQpUjhnZi/1kEKF28qUHWI9qaCiYxKlTZe+JfvzR8/8b7Iv7NxRTSIo3OjklAZEntu48B8v1bMHiEePyrnS4cEtoCKwPSsN8O/wp6tCWvHcaBnpgj7pxQYo/Vo/ZlImrfr3mOESU3uidQ
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(36840700001)(46966006)(70586007)(70206006)(8936002)(16576012)(356005)(966005)(31686004)(82310400003)(47076005)(31696002)(16526019)(6916009)(86362001)(426003)(186003)(83380400001)(53546011)(336012)(36756003)(26005)(36860700001)(8676002)(7636003)(82740400003)(2616005)(5660300002)(2906002)(316002)(36906005)(478600001)(54906003)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 22:12:02.9108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ee6a5c-bbb9-4391-2df5-08d920934a66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4999
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 26/05/2021 22:48, Catalin Marinas wrote:
> On Wed, May 26, 2021 at 08:47:16PM +0100, Jon Hunter wrote:
>> On 11/05/2021 19:23, Catalin Marinas wrote:
>>> The GMID_EL1.BS field determines the number of tags accessed by the
>>> LDGM/STGM instructions (EL1 and up), used by the kernel for copying or
>>> zeroing page tags.
>>>
>>> Taint the kernel if GMID_EL1.BS differs between CPUs.
>>>
>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
> [...]
>> I am seeing the following undefined instruction crash on all our 
>> ARM64 Tegra devices on today's -next and bisect is pointing to
>> this patch. Reverting this patch on top of -next does fix the 
>> problem. Let me know if you have any thoughts.
> 
> Yeah, sorry about that. Posted a new version here, better tested:
> 
> https://lore.kernel.org/r/20210526193621.21559-1-catalin.marinas@arm.com
> 
> Will should have dropped the old one from linux-next but it takes a few
> hours before Stephen re-creates the tree.


No problem. Thanks for the quick fix!

Jon

-- 
nvpublic
