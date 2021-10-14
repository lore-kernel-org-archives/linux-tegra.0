Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FEDC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 18:31:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAEFA61037
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 18:31:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhJNSdg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Oct 2021 14:33:36 -0400
Received: from mail-dm6nam12on2063.outbound.protection.outlook.com ([40.107.243.63]:15299
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230225AbhJNSdf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Oct 2021 14:33:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEWP1rhbz38kD1pPIBb+TzJmxbQpUq5vcMYEUh0W6tuf47hpS9ldtelRBU/SFMUQxYIvrSaFRq6+jwrEq8hybYQGuVx9VQaNi0uQ3J956fhDNkeRydkg4VpsA7ckH/KVSVL7SKP6H3DBiTZbUbMuyjTeuBldh+3lerrPaXYbywQG4munB3TSFLWtA0BcKIMGX9McrQoDTa+1hUsA2mVnbrYtHNOL6Fe/7+z9pm10T3AICauOrvgGQH1YUA+fj+5ZbzBMMhfT/dIjv4XbBS8masRAzXNFt4O4UGo6jJI6RXUltHE5P6iQSoGS1Q7AIztosEE+k5kjwn6y9N6A2Se1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n46MAC2BObdvCGsc63sawkD7OwMukZEWO/Zo/fOxyII=;
 b=S41OwpX2cSx55z7dvvrhXK8CfBC57BeG6WEH8u8X5vw4ttKoWrONox0VEhYZ6PGSG9FilFzzzzrVkOTSHj5gxjNmt4PY6MeH1E/UvomF25voFXdR2bi5K9aP2cIsX+e96O0YMDLjLbt51u52ZghLAz7OAGPLnvSVkeqblAYOgoD892NLdk1UqRdajv9PTsriVy71cz4RLU2JVj+I3IZ9WQNIU7P40gDjCalxy2hpEXhUH5ZYPG0ey/YUdn6NxE05gP+1kmhVWy9xG4Hho3qnQVA8crNzrDmSDae/vJ7aJ3dNByO4CNfNI7U7mX88E8Z+fGL9e/z7tYuYtGnzDhnoMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=arndb.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n46MAC2BObdvCGsc63sawkD7OwMukZEWO/Zo/fOxyII=;
 b=qmpvvVJUh40C7NgmyTv7hw7oZrVKJAeNKgejrPWvwVrm5sclcHLYDRqC3NWCKycogdd5SLBEWa0uRvg4aN9Z542YfjWpOMUyCIR3vMLQqTObqaF5kbnu9yp8wjgGVf3VMhS1kyhM1kmaquRdzUSi/r0SFcA19tLey6paLG/uLStH9K5QOB0uyz0x0r/Uj4MdgH3QPWBbTma8AAhipP/TR27TVZQX3AZ2/UeiYdXJAJeIrQkw7lg3DMoAi4P4qTlkmWcc4+E0SwOGmCi6DbD2IruUSMihS87EILF+CHjwidDnrMVWkuEOjO9LFpJ3nnWXTBybQyePDg8B+gNirmuX+g==
Received: from DM5PR13CA0049.namprd13.prod.outlook.com (2603:10b6:3:117::11)
 by CY4PR1201MB0022.namprd12.prod.outlook.com (2603:10b6:910:1e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 18:31:29 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:117:cafe::2d) by DM5PR13CA0049.outlook.office365.com
 (2603:10b6:3:117::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Thu, 14 Oct 2021 18:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 18:31:29 +0000
Received: from [10.26.49.14] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 14 Oct
 2021 18:31:25 +0000
Subject: Re: [PATCH V1] firmware: tegra: fix error application of sizeof to
 pointer
From:   Jon Hunter <jonathanh@nvidia.com>
To:     <cgel.zte@gmail.com>, <thierry.reding@gmail.com>, <arnd@arndb.de>
CC:     <lv.ruyi@zte.com.cn>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Zeal Robot <zealci@zte.com.cn>
References: <20211009085900.509697-1-lv.ruyi@zte.com.cn>
 <10dd0afe-432e-4798-1680-3edbd2b07bcb@nvidia.com>
Message-ID: <32c183a5-01bb-f86a-a614-ea46ad405de1@nvidia.com>
Date:   Thu, 14 Oct 2021 19:31:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <10dd0afe-432e-4798-1680-3edbd2b07bcb@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad8ff414-e1d9-400c-e7ac-08d98f40d6a7
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0022:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00224EA4E7957BBA6A27536CD9B89@CY4PR1201MB0022.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aXrJj9rTGh7UWIjSI6J30T1/qTx1ClFykD8DUorlfhQci+nHq+twi9v21QvOgBkp46OP+rk6UlR9yQplaTuNe95LoArlXuIan07svH/Uz4ua40XcyFblTQOnurRzf5/Piz4jxbh8MhdWkPsrDNVWLRpfT9VopQr6DKwX3lqiQv1AchrgLByyT1DKjHEbPNbJmvid3J2HMcnVLqvnm0ugzxT+hzMZWJMFg+mjnpABCSCHVS7If5ZAA6RRyCX30HYX3mCzqGL11j7+HIg47QNo4W8WJQg+UKpuffGSdQoKftyw5SaTtf1nshXu8NmpISJ+z6JEYpdIzhOzbAXPmza7bbXuNyEkbW6LcJ6MjInxrSmY9libZzUevIaQKSOOBw651fbReHQyQjK9vNPh4ORYZNCjTm7B8eMsWQUfYxjzsOvkXMVliPpNHN6T/qOS+rCOJXZfrsruIeEkpCW77lhpoxDCyHsBKz3JVcjPCxnI0CJtA65VHogbHm/8wrZ020uNikn8UhVG2c8Igx7Mk48Cccb+FZxLeuXvc8G2drXFeOx0iUagGNSOy30SgFLRCbzhkImDGFhfanJeKcGJzrKVYruhAiqGNiv5pV2YADpOA/6savKLmPiGp2cI0T3otEH1g0/ZOjsj0UD9EpsBGc+JmWdZPldVPq5nEZSwZdd0WNIrNAfMk0jHgwmO7NAqt0hcczTuP72SvfOxElVcP1jMG38wPZBM74iU8PJDIxZX9wU=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(86362001)(8936002)(53546011)(83380400001)(36756003)(47076005)(82310400003)(31696002)(426003)(36860700001)(16576012)(26005)(5660300002)(4326008)(16526019)(186003)(2906002)(110136005)(54906003)(70206006)(31686004)(36906005)(2616005)(70586007)(6666004)(336012)(8676002)(7636003)(508600001)(316002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 18:31:29.0593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8ff414-e1d9-400c-e7ac-08d98f40d6a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0022
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 14/10/2021 19:26, Jon Hunter wrote:
> Hi Lv,
> 
> On 09/10/2021 09:59, cgel.zte@gmail.com wrote:
>> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>>
>> Application of sizeof to pointer yields the number of bytes of the 
>> pointer,
>> but it should use the length of buffer in the code.
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
>> ---
>>   drivers/firmware/tegra/bpmp-debugfs.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/tegra/bpmp-debugfs.c 
>> b/drivers/firmware/tegra/bpmp-debugfs.c
>> index 6d66fe03fb6a..fd89899aeeed 100644
>> --- a/drivers/firmware/tegra/bpmp-debugfs.c
>> +++ b/drivers/firmware/tegra/bpmp-debugfs.c
>> @@ -77,13 +77,14 @@ static const char *get_filename(struct tegra_bpmp 
>> *bpmp,
>>       const char *root_path, *filename = NULL;
>>       char *root_path_buf;
>>       size_t root_len;
>> +    size_t root_path_buf_len = 512;
>> -    root_path_buf = kzalloc(512, GFP_KERNEL);
>> +    root_path_buf = kzalloc(root_path_buf_len, GFP_KERNEL);
>>       if (!root_path_buf)
>>           goto out;
>>       root_path = dentry_path(bpmp->debugfs_mirror, root_path_buf,
>> -                sizeof(root_path_buf));
>> +                root_path_buf_len);
>>       if (IS_ERR(root_path))
>>           goto out;
>>
> 
> Thanks for fixing this! I just noticed that the debugfs for BPMP is 
> broken on -next right now and this fixes it. We should add the fixes tag 
> ...
> 
> Fixes: 06c2d9a078ab ("firmware: tegra: Reduce stack usage")
> 
> Otherwise ...
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Arnd, do you want to pick this up?

Nevermind I see that Thierry queued up the offending patch and so I will 
ask Thierry to pick this up.

Jon

-- 
nvpublic
