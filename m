Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4212EC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 18:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23910611C7
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 18:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhJNS2y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Oct 2021 14:28:54 -0400
Received: from mail-dm6nam11on2082.outbound.protection.outlook.com ([40.107.223.82]:21224
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229690AbhJNS2x (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Oct 2021 14:28:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isiry+FBu2XprRRieNM93VDEyQ8lBMeNJcgAfztDngM0B8dhoqe/TCMgsgcj8rHTJCgExhWaubjiO6e+h5Lrc1s2qnKjDdewsiGrbIJg4Og6es6D6r2QKFpTSnpUqgsn2LZWoH8bGqF2W1vvEAErb2ypV9OKEemkehZQoky920eLK9/Vw1lllGqPyEwQGHGnxjJhJUyOwG7tPePTSJusxamsCiRWBjy54xEoZlPkTOn/Iw9jnOu2VzCc0QsXrMsU6u/pLaj1JHB6UqoSIUdU3aJyyeBW3yKGcU/ZecQr3UR+Ojq72OFrowug5SgUDPAJ8PHVom7XwcAsErajXNm4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHswdgeioY2kLaG0gFWRzVnk0QVfAVUq+yPpL55n0Ag=;
 b=iNjurXssalBvKqvZjcPOujja/Lw/afVwfFRHuZATvGpSlNrO8dsWh4OAifQLNbeii+Do92LJ0ArRmzZacYeosER7ukRRhJxGllB1x2tTWBikB2VTCsaTS6AWe0CaBAXLUBLzl7fESbUyI6uN6OuXxSiX6XIhmTCGeB9dnT+PE+mI088MHDmy7xeoLmO9bBCrvjj8bhUlv6g7zv1evxk0u8TwTIiSpuiyPaAzKdwGrPam30NBENVfVZSlLgrjtjuWzWnju1ZBB7tiZ9KX+Ai9ogyT+Y0HMIbK9IkIq8pZMOIsmuECP2zWNqD3mxaMzBgl7r0RXIzbBTsPaRcNWAecfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=arndb.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHswdgeioY2kLaG0gFWRzVnk0QVfAVUq+yPpL55n0Ag=;
 b=WNzxLACXfViHBeOdfYBRfnUOaZoSCKVqGhKEdutYCCrOwcBJX/4BnFsokQG1IUQCGwA2JXSpTvLqHUa+MY1t6khLpWimYrQVsUY/GcJOvAFhL9s0nClOpOtFWqcotPe+dOB9fD29G84qtXJmdpJKp+BeRE5TL5jHPSWamsimIKsU/q5KyG5afpX+hJAjBwgWmvtQIfKVx3LeUauowG8u7apm3zM2BFdoxLMLKK7mYKy3i/OWiZcEm4lteoOJjqoiMBwoEB7i/sqUiiEL6C0lReUwQsiAt3L9Y2E7hErRRsL/giZxoTjTrdafbT4rt/vWjGdpihzmNLYEpylSP4qVkA==
Received: from BN9PR03CA0353.namprd03.prod.outlook.com (2603:10b6:408:f6::28)
 by BL0PR12MB4995.namprd12.prod.outlook.com (2603:10b6:208:1c7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 18:26:46 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::87) by BN9PR03CA0353.outlook.office365.com
 (2603:10b6:408:f6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Thu, 14 Oct 2021 18:26:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 18:26:46 +0000
Received: from [10.26.49.14] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 14 Oct
 2021 18:26:42 +0000
Subject: Re: [PATCH V1] firmware: tegra: fix error application of sizeof to
 pointer
To:     <cgel.zte@gmail.com>, <thierry.reding@gmail.com>, <arnd@arndb.de>
CC:     <lv.ruyi@zte.com.cn>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Zeal Robot <zealci@zte.com.cn>
References: <20211009085900.509697-1-lv.ruyi@zte.com.cn>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <10dd0afe-432e-4798-1680-3edbd2b07bcb@nvidia.com>
Date:   Thu, 14 Oct 2021 19:26:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211009085900.509697-1-lv.ruyi@zte.com.cn>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5363ab74-fe3f-4036-cced-08d98f402e14
X-MS-TrafficTypeDiagnostic: BL0PR12MB4995:
X-Microsoft-Antispam-PRVS: <BL0PR12MB49950F9C99A18F32B0326EC9D9B89@BL0PR12MB4995.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GmL/eiQl+YyMPyH6bS7BZ7FEyE1VO93Za2HUtzD+3CXLlHtT7khDUTembkQ8UfqJ4S+UxVOUBISYgwy8dVHgZIQc+hPb7XpGRhYZjXmts26gbfSVisSSJo/tcBE2Q/OVrs5zTHvtOVxGCKAfKryXlcWOJMNmClsdT2h/GvxUfMCJ98HYxAol+oVwdOd8uRvFfGOKmMma5G2KrUPukpp9qKhm7JwLyCGkA0ish8zkPUzaOXTOXnc4gZnK0lBGL0q3laYqUQ5lwzgFVQvStQ3xbRmcROUvv9WhrK2ClkmbMGGctSWWliXIWpP0k1xTH4WZ0Y1msvPjqNWMGJS+GqTBNU7V4q4BA6R6LjSOiENM/+y2NfyaSif2YrGBLWlafh0qTPu8ljaL5oQnFDrR+5e22YksApU42kkUq7acvsJ8x/h/KrKquYNA97JD0zvyqRiVj98TRLdfMI2DiCeP+SBYlN3KtKNYAiEVwGLmC+2aVhxsOikpEjsddnsui7+XJPmMjBbUAN3+GxnvIC3rnolvYbozuX0SX8RmvSSjdazIdWkSRSctL6YuUfwn2MvwVhr698LjjjM0ff4Ue9NfKMj0wLQLymN6Yw/JvfP6fT5H3I5P2thEwziwU6u0zLdyxmDZXhjG2Ai46NmopBXhKBkVQShthBk5Y8pJ08bEeoASseP6/q8pD7i22WZgl3G90aL1llpcpE0wkVSnBCvJ1ezQHaOXQrws356ItBeEdIFmgCY=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(31696002)(70586007)(70206006)(426003)(86362001)(2616005)(2906002)(356005)(5660300002)(508600001)(54906003)(47076005)(316002)(16576012)(7636003)(53546011)(36756003)(8676002)(16526019)(83380400001)(31686004)(4326008)(186003)(82310400003)(110136005)(336012)(8936002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 18:26:46.1181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5363ab74-fe3f-4036-cced-08d98f402e14
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4995
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Lv,	

On 09/10/2021 09:59, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> Application of sizeof to pointer yields the number of bytes of the pointer,
> but it should use the length of buffer in the code.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>   drivers/firmware/tegra/bpmp-debugfs.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
> index 6d66fe03fb6a..fd89899aeeed 100644
> --- a/drivers/firmware/tegra/bpmp-debugfs.c
> +++ b/drivers/firmware/tegra/bpmp-debugfs.c
> @@ -77,13 +77,14 @@ static const char *get_filename(struct tegra_bpmp *bpmp,
>   	const char *root_path, *filename = NULL;
>   	char *root_path_buf;
>   	size_t root_len;
> +	size_t root_path_buf_len = 512;
>   
> -	root_path_buf = kzalloc(512, GFP_KERNEL);
> +	root_path_buf = kzalloc(root_path_buf_len, GFP_KERNEL);
>   	if (!root_path_buf)
>   		goto out;
>   
>   	root_path = dentry_path(bpmp->debugfs_mirror, root_path_buf,
> -				sizeof(root_path_buf));
> +				root_path_buf_len);
>   	if (IS_ERR(root_path))
>   		goto out;
>   
> 

Thanks for fixing this! I just noticed that the debugfs for BPMP is 
broken on -next right now and this fixes it. We should add the fixes tag ...

Fixes: 06c2d9a078ab ("firmware: tegra: Reduce stack usage")

Otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Arnd, do you want to pick this up?

Jon

-- 
nvpublic
