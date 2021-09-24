Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02D8C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 19:01:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA39260F70
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 19:01:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345873AbhIXTDF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 15:03:05 -0400
Received: from mail-dm6nam10on2067.outbound.protection.outlook.com ([40.107.93.67]:59265
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343938AbhIXTDE (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 15:03:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLo5002AKpLcPHz2O2W2pMaKTEi4+zCJojXqxB7JxzyOUNEzSGh+Hdep2FskXgZs9OYJtlPpHUxUJFH7Ipv3DTy05ulibmR/qygHqhfnZd59KaVwRwWro4c45USMOZEunMJrVCXnDepwy9SuINpCuFCc3yYx7Dyp6iF7mSZcRQrghNOzPno+lBAhEWbL2uds2AtEAKYmf1LMmk7Qmg4klREZW2qSUbMZMhW4xxymdDZ2ethP5/y/Sg4DYoO0HdGE9UlSdvyCdtTDn94WcMmNGHNR4tl2BTBAJpq3BAeSgDkEDaULC9F0LsD+N7eKC0Dt7hl9fEF2kvGP9+8BzCOQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=U7VZF6YrEfGw2XjmiXIn+rGObu3BBSmAxapM3LwRTyk=;
 b=Nl+UXyq9Gyc8bhakk6otc2ctKZ/5HCwrKC/awqwQ+lRIetU3c2u+7vvDPSkqIfro8/JJfkzgc0Ia1rEJKRJRLeiXukTd7eO8sJGD3PbgSSYw3MvKQg1b8rjK3h5ey5KqpoGeZANi9ivcK5YaY4DjIlwOnLA3cFleuMZ3vT0ROnpExivEef/G9cclzpPo1m3sP4PXPZxJOMpgr9KqKcsV0qeIyf1OnDAO7HkbBp2icIbXTkQXGYD8iTrCz8HanikcG2l5gdZ5tIIqbv5cF2WqqGIk+Xi83yeSl1wAYMlborPTO6l6kov1U8hpYxsiF4QlxLd1kREN+6pxmP4p/i+P3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7VZF6YrEfGw2XjmiXIn+rGObu3BBSmAxapM3LwRTyk=;
 b=WK1GXU8gno665hNYl2InsMZJ9kT45w1V/D0auSo3s8NB6iTuFbOmmnOvDIYjCSGYinh8w+gKBJagu+MBnW4BcENbsFo8Rg9sVyCg0WU3R/2ikG1yEG6qsru6TQpRlfGNsCy7vbLtcjlJA717DqxzBTqgJL6ymZ1rpes9FPDS3zD7HeHtpummDxLkwm9t/bjr5SbpewTLDfBFal2lq4LZ6kh9sadCB9X2NG6kUdnea4OX7cccwAxAZ7Nq3WJAYiDg+bpNtti8w5TbNJ9qrHROSNMqFgyTJe0xpp/+tSEmjMzkIUBEUPSz0DS9CSsMkMZUTo2U+pwSTbM9sutUX4xhlQ==
Received: from CO2PR07CA0075.namprd07.prod.outlook.com (2603:10b6:100::43) by
 SN1PR12MB2493.namprd12.prod.outlook.com (2603:10b6:802:2d::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14; Fri, 24 Sep 2021 19:01:29 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:100:0:cafe::1d) by CO2PR07CA0075.outlook.office365.com
 (2603:10b6:100::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 19:01:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 19:01:28 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 12:01:28 -0700
Received: from [10.26.49.14] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 19:01:26 +0000
Subject: =?UTF-8?B?UmU6IEJ1aWxkIGVycm9yOiDigJhFTV9SSVNDVuKAmSB1bmRlY2xhcmVk?=
To:     Stefan Wahren <stefan.wahren@i2se.com>, <miles.chen@mediatek.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
CC:     <linux-tegra@vger.kernel.org>
References: <e8965b25-f15b-c7b4-748c-d207dda9c8e8@i2se.com>
 <78cf3af71e035a79d021d17c6fd8a09dd1e4984d.camel@mediatek.com>
 <cf7eea1d-a628-c6c4-270f-fa9895192b24@nvidia.com>
 <277d1f76-c105-5fc4-6658-058286f503f0@nvidia.com>
 <e52cfbdc-40cd-9b84-036b-4c9dc8449b72@i2se.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <bcf57e67-98e2-b4b1-cb62-a2d2829df142@nvidia.com>
Date:   Fri, 24 Sep 2021 20:01:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e52cfbdc-40cd-9b84-036b-4c9dc8449b72@i2se.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07f5f973-fe52-46a2-efc8-08d97f8db744
X-MS-TrafficTypeDiagnostic: SN1PR12MB2493:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2493EB080F8455CF13ADA932D9A49@SN1PR12MB2493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZhBna04DUaAt+7wV//SY5tSuo9Tesf2fGFaP5cHtzphPQgU2OCI1RTTZN0Zv2tAsJ4kKxDCeA7KvtLGrGu0cb1qrcH81HuVpN8xWBRINlzIRcdtPgE5xFHW6Y4G+8OIHCk/PtSGhKw87woX7yBUWbLYaFQCwde36fwWMzuMUOpX+fTCZHrqAu/sE5MuNOTnF/Wn1659tZ63FkwGRgRtOBgN/1N3YFNEYC+/h9syWNyhvocZ7Kc0Z9xeJwECnZExB7+jcZM+s1Q8b49T27TI1Lf8O/e5lw7xP2kQBz1oXZALZqr44f1m7/VvTMJabaMQ6SYjsM06Cz510D72y/hRVunI1xZv2HuP+on3f7OMwFcL/wZzVgijQq87ArU74DIKKDvThZRywMv98bEuGSyVvUIMWbS+4qVr5tQ2g+mMfAHfBhpsjwAgpKDEjvhr7sqfCx/2fyXL8yQZAlFAs9JrPVg7LY4LJSWLus2hKs8IAnDvNMpw6IFyOGWJZsKVlRRGmJWXIL1d9uTsfYg9Qs9k1al3t5gCES47rjUNDTDisolQD/GmUVZwxafMPIJrhTghYe93nHGkeAYnnaHaKI0fgZEkCpOl+CwXaiZVXLFMh83ack8iYPqwI6j6yUOOkKyrL140b/xODTUoRga3PvZyIfVMg5McWXh3Il1PgDF/D8MMBRNo1PfdVerpxC+bMM1pyB3wCnbxvjQ6zSkJ5GgDxyzdglGJSMuVIg9qWulMkEw=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(4744005)(82310400003)(7636003)(2906002)(86362001)(47076005)(356005)(31686004)(53546011)(426003)(2616005)(8936002)(36860700001)(4326008)(31696002)(70586007)(508600001)(26005)(36756003)(70206006)(186003)(336012)(316002)(110136005)(83380400001)(16526019)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 19:01:28.9711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f5f973-fe52-46a2-efc8-08d97f8db744
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2493
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 24/09/2021 19:05, Stefan Wahren wrote:
> Hi,
> 
> Am 24.09.21 um 14:55 schrieb Jon Hunter:
>>
>>
>> On 24/09/2021 13:15, miles.chen@mediatek.com wrote:
>>> From: Jon Hunter <jonathanh@nvidia.com>
>>>
>>>
>>>> This is still broken in the mainline. Any plans to get this fix
>>>> merged there? I believe it has now been broken for nearly 2 weeks.
>>>
>>> the fix [1] is in linux-next now, thanks.
>>
>> Yes I know that. However, we need it in the mainline. It has been
>> broken for nearly 2 weeks now and all our automation for mainline is
>> not running because we cannot build. Please get this fix into mainline
>> as soon as possible.
> 
> as stated in [1], you can try to update you build environment.

These are farm build machines so not that easy or quick to update. Given 
the change that introduced the breakage is in the mainline, the fix also 
need to be merged into the mainline. Otherwise we need to revert the 
initial change.

Jon

-- 
nvpublic
