Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EB7C6377D
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jul 2021 17:23:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E32B56128D
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jul 2021 17:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhGVQm3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jul 2021 12:42:29 -0400
Received: from mail-mw2nam10on2071.outbound.protection.outlook.com ([40.107.94.71]:41825
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229453AbhGVQm3 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jul 2021 12:42:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qm9IjCPCjA9B2zCsQayjtTFOTg2iFcWzTJKFHVCOj5pVBAzhiNxUXmVZCXb6ww4Boo/uvus1wF+pzZvX0l9vIs3aihZEM4WJqRYG4l7uBGdqKlSIHNfoGEKwUI23HkfgroTUKuZGVSpWXFdSq0eDfess5O17CcqW7SCtLMrnv+2q+yUjtKnA5hN30rrTA6EVMtQU7nlDM5sfIJN+ViIs0O65imy4xIce6TJop2EG5ALNxEMoQQ/oyCYR0r8eqekkZW/yPG0MOtajGnM/ZfTmEaEg5jYbRJpWMJNV2c7x+vIeJwLOC5Zgb9nCRmiLuGCnajOC6yWtwOQr4Ir1Z2SitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPBsGasY24YVR4aWVX1PXSwoQjhYfRNwd51+ZHzLW6Q=;
 b=KNndA+CYIOA3jrIcsLQ5MiW4Jlr8O+H/19zDETwHpTclZSP22mDVL0yGKDQBTyulPZDT85zicKMwoicy0Z81XKa3CgZuYZx/uvuhR6PH1TnTQUttsNMiJoELzYSi4YCkMk9UwbXR9cR3jfzpNebcqmD28OZhoR9Xd5IrOuLHR2MMecRh19HrGFelMzYEt1L/cQeetZEJ8D3C/pW1PLskWoJeYiaJK3/XnmnUsWG73+/QF/RE+pAYQuU0tt/zevAnJybbUo69JUk+RuY5ma+6FqAO7b/3CqDAskc2ADppOxfMS/CxdF/1YDyNBZyFyxQMAxMtizVHXrmYXgxBoqy9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPBsGasY24YVR4aWVX1PXSwoQjhYfRNwd51+ZHzLW6Q=;
 b=p+eOli7cbq+vkNgE3eSRxQ54TnAY7bM1SKassOvlUol2G4g/9UnF5jpDsahFxrRdLNzjxn6AfDSBHIAnT5GNLHMlf9k6I6BNWZoWgGZ3r7wle4jbGEE5g05sQjBnurjMNWW8ydQZz+ZkT2REkgTEacz6i9j3k7IRWwTLsYuH/1gIhdYTskcQT7wuaIeL+PY/H6n+fraXLBqGhLUEioXyPLyzC5fLaAGc2zGNQGH5VKW6Br9mkDBHKMo64HtjML2ZELpLlKX1ayjSFo7plDFoDqjPtL6Zrq+08ZgRCZ5pacnP5CRYwue0iL8GqKHGLjizrnTI7UblERV9UhL03kJaZQ==
Received: from MWHPR10CA0052.namprd10.prod.outlook.com (2603:10b6:300:2c::14)
 by MWHPR12MB1759.namprd12.prod.outlook.com (2603:10b6:300:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Thu, 22 Jul
 2021 17:23:01 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::19) by MWHPR10CA0052.outlook.office365.com
 (2603:10b6:300:2c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Thu, 22 Jul 2021 17:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 17:23:01 +0000
Received: from [10.26.49.10] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Jul
 2021 17:22:59 +0000
Subject: Re: [PATCH] memory: tegra: fix unused-function warning
To:     Arnd Bergmann <arnd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Arnd Bergmann <arnd@arndb.de>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20210722090748.1157470-1-arnd@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <84920cc2-f5ba-133b-8b2c-f7d2c69eaad3@nvidia.com>
Date:   Thu, 22 Jul 2021 18:22:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722090748.1157470-1-arnd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3587c724-51fc-4a1a-a967-08d94d355b87
X-MS-TrafficTypeDiagnostic: MWHPR12MB1759:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1759035D6B13B4C2EBB7CD65D9E49@MWHPR12MB1759.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1UmrCKl2cgWvq16DR0lZDXP+PySc+ry0fY9GeEoXjAr7UToaR/7FACIv7YFbtm5Sj1eM9fkUtmTJb7BTvItXCYUFRzdnZmGXSzrx2pkyw0tC6zfUipJUuvwPFex/vXg9tYw3H8othxBJEw31qDcBM2T09tH1PTAbbMH0IZuCoM7fZf6BijvNp+0ZfUXT5R4WCaP4zdcPeLaUbNDovBIsUgoAO2A++udA1yk1PGuLoDfB2mgqYRA/dNwwFCUcTGprc+C8VSyM6IfuR3Uc3JGj2xNEAyr+hHZonQB0r+ZkXrSDnR/Si0xajI8p5wi8Y6lzTRfQcJYDeLUJ2LucRc702XJffNTzwpGC4sPL6zsaGx2CHp1MAwq9Dbfj7BNP5M4WfFsWeUlwgkksk9Rb4GBpakvQF6S1fkIfvzOSxAtiTZncYfIm2bFYwQKZqJy+HJybOBQUUhhRbizpQV+mY22vWsyN8jKPo+8sjJ7ID41K1bkNyqu21F/b8HBVdtFVsLfK2qYntLwvhMyo6afM3MIIM3uoSsPOVG412EL8exqzece1h6dlxtWlO7SQ2pO1g8xd7fXKKBL5+x7Bsej0PMQYNVRgOgw4eaOLi4BD9i6Bbtg+dMTGu1hUKh9uxfH8+/dw2jviprS7utJwE3L/1JSxWcJJ1IJ13cYe8HbC/UwkN7bzOQa7/EDeFHCJdrwJwRlVmBQ32a0P21N+mpPdPVVtuor6M3zi+AC5IlwfT308IvU=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(36840700001)(46966006)(4326008)(31686004)(82310400003)(36860700001)(82740400003)(70206006)(26005)(31696002)(7636003)(5660300002)(186003)(2616005)(356005)(54906003)(86362001)(8936002)(478600001)(53546011)(16576012)(316002)(16526019)(70586007)(8676002)(36756003)(47076005)(110136005)(426003)(2906002)(336012)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 17:23:01.2619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3587c724-51fc-4a1a-a967-08d94d355b87
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1759
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 22/07/2021 10:07, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The tegra186_mc_client_sid_override() is only called from
> an #ifdef block:
> 
> drivers/memory/tegra/tegra186.c:74:13: error: 'tegra186_mc_client_sid_override' defined but not used [-Werror=unused-function]
>    74 | static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add another #ifdef around the called function.
> 
> Fixes: 393d66fd2cac ("memory: tegra: Implement SID override programming")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/memory/tegra/tegra186.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
> index e65eac5764d4..3d153881abc1 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -71,6 +71,7 @@ static int tegra186_mc_resume(struct tegra_mc *mc)
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_IOMMU_API)
>  static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
>  					    const struct tegra_mc_client *client,
>  					    unsigned int sid)
> @@ -108,6 +109,7 @@ static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
>  		writel(sid, mc->regs + client->regs.sid.override);
>  	}
>  }
> +#endif
>  
>  static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
>  {
> 


Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for fixing!

Jon

-- 
nvpublic
