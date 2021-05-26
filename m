Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795C9C47088
	for <linux-tegra@archiver.kernel.org>; Wed, 26 May 2021 19:47:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57338613B6
	for <linux-tegra@archiver.kernel.org>; Wed, 26 May 2021 19:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbhEZTsz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 May 2021 15:48:55 -0400
Received: from mail-dm6nam11on2071.outbound.protection.outlook.com ([40.107.223.71]:34400
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231924AbhEZTsy (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 May 2021 15:48:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjZ+wSzYlBcZTAuaFTgkhz5NwfsNEtdPkd0EadE3JnqXSa2vQfV3DowIjuhqkl0Pjps2Ur7HsGm8fPMp3makCbrNudsdBzWfvmsC3vaVPaOPZ5J2MUEHeEj99jYUxM6Nsr3KJpgwcRMNx7i/syd2W7l+uhqKKu+hsTsxz7sEd4XLe/oqF+jclkTQTMuOft6FprgvKJ5uWvH86OEey3eOBwcUSTowQMMOI6Vh1Me+yWGq6HIQqqIf50DJhgPKNauM/25GQA2V/au+YoXHjZg+zd8vQbAwbOyoRhWSMD8Mo0dbAFYHzdbSmMKjfNVUsqwzq9wbhNptG64b28WF84KeyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHEYKvuQ+6s5m+KRgLIkGBlJvIx7dmOQ8POq0h13278=;
 b=cfZf68M8QOGDaZd2y+tcox+Q7gXGY8LEnJ1kH7QakZFv7DwtbqPWIUUu8eaT2vjufd+CrG1HFGDi1x5NX8dOUEnfmkRsFJvZ+6gGbOR0nocms2JxOFmM94nb1EkFfG/3OTo/P6RvakiTn+KuW/FjFgFQsqTa/nx8DfmT+IxWtGCkDReuW/MRj2NeALCq8LZi7AXlhSd7i9Cm/yrHLO9AxxbhDWks6/ryx/93ItSeKv7Mh/7YwEN/0xGLR3txvO0C7WY/G53fvOQvm9jS/mdhagSSsVerGHWNw1/8mhh5NyJYJtwxsZqVR7/Sf8QC59lyL8VRPIrtNHtslVujT8tPJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHEYKvuQ+6s5m+KRgLIkGBlJvIx7dmOQ8POq0h13278=;
 b=Zrz/K784jhBW68Qxj+ZCl6McNwtz7R3RPmwAOwkIxKj4lFUwFS6k8w6rPx1XXK3nrHmNHCKOpRFuBCOM0qGm9lcgGXZfp+Ta0nrtDTxMnBLr3UZBmb7riAm6t0G5OyW5xvsGZOkhEjDxojnnFfM9tno69jAfgo6BjsFzhqmYn1v2T6Ha4rdowURoxu4wI80HdhK4yWIPOBeirA3ui0x5OVQo0Aghonul9oQA3/9ftqIobcdasGLVLgjtGghtSn1177U9IIE6w7+2cWpn83tBXLYIsA5tMca904wUlcl+AkW5Ca6wkhMXbIslETRJ3KK9xWVhUTt03PmeyHVx8qkztw==
Received: from DS7PR03CA0292.namprd03.prod.outlook.com (2603:10b6:5:3ad::27)
 by BY5PR12MB5557.namprd12.prod.outlook.com (2603:10b6:a03:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 26 May
 2021 19:47:21 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::a0) by DS7PR03CA0292.outlook.office365.com
 (2603:10b6:5:3ad::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Wed, 26 May 2021 19:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 26 May 2021 19:47:20 +0000
Received: from [10.26.49.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 26 May
 2021 19:47:19 +0000
Subject: Re: [PATCH 2/2] arm64: Check if GMID_EL1.BS is the same on all CPUs
To:     Catalin Marinas <catalin.marinas@arm.com>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20210511182322.3830-1-catalin.marinas@arm.com>
 <20210511182322.3830-3-catalin.marinas@arm.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e30a7d50-5ee3-990a-3f0a-d5009f1e6869@nvidia.com>
Date:   Wed, 26 May 2021 20:47:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511182322.3830-3-catalin.marinas@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46726c4c-20eb-42b9-9554-08d9207f1392
X-MS-TrafficTypeDiagnostic: BY5PR12MB5557:
X-Microsoft-Antispam-PRVS: <BY5PR12MB5557DB6355D1F6251923C92ED9249@BY5PR12MB5557.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ubTvI41EUvDUQyNxAHl+tyCiXSGVbjhwQeJPZTWNOAHl7nY2S8LGXc8N7w3SN+xwLWLytQx30B/0OjuYZ9QtnT7PRLaydpevhmKVSXzvmt7JRF2N44Z7w605OQCX+45jc+r2FoSM8gcnSmwBzjipP8EsNP4QxpsdM1wgUjrsJficmVDd4Q2lPEJ1TCO0b+qOSESF1H5BH/u2TJefdBG6d6dfCRwWX9gajQb0nm45yGcrr+IH3Vy0Vns7Fj1yOOCtjr1HMzAonQZbIcwgeq5GC4szxIcHyGonYboU3i9TQZDpLnrX025h39gVUlwwlGyj5WCFm8mXO90OL8JwaSJERDokiGJCZtkhddLWbdOj2aYF8mIqZ/j73J1rwSuW91liSxLNnzUN+3wxF3QVnZ76vZJCRE6VRHUVIq1lWsk7a7xqNogoFtwzaAk6ALY97t6bw+d+EjB0aRW8vnmaiJKa3umac7CFfGShmJ+rwGU8M8UKp0T0ZJEk/r/Dra/bGLT/wEaz1n3EaegTS/r5zFzuD1A5KqhYdBjQSwbLcAsR9QGsPDFHoDcs6czNEDaYtzL0Ggk5H0GyMetJAodrWzBvU1NjFUvoe2ac/fqBv6LvX4BBpIq85FG41h/rv1ZBbKIQqpdMFoj6ZUGhIN9Ynx78BEJxh2w8CnHV+nv6Z1OYtJRX1JFdD6npPFD69VAlD/T
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(36840700001)(46966006)(16526019)(186003)(336012)(426003)(356005)(2616005)(53546011)(54906003)(82310400003)(26005)(47076005)(6666004)(86362001)(110136005)(36756003)(8676002)(2906002)(5660300002)(16576012)(8936002)(4326008)(70206006)(82740400003)(70586007)(7636003)(31696002)(36906005)(83380400001)(36860700001)(45080400002)(316002)(478600001)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 19:47:20.9935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46726c4c-20eb-42b9-9554-08d9207f1392
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5557
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 11/05/2021 19:23, Catalin Marinas wrote:
> The GMID_EL1.BS field determines the number of tags accessed by the
> LDGM/STGM instructions (EL1 and up), used by the kernel for copying or
> zeroing page tags.
> 
> Taint the kernel if GMID_EL1.BS differs between CPUs.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
> ---
>  arch/arm64/include/asm/cpu.h   |  1 +
>  arch/arm64/kernel/cpufeature.c | 17 +++++++++++++++++
>  arch/arm64/kernel/cpuinfo.c    |  1 +
>  3 files changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
> index fe5a8499ddc2..9088e72c7cf6 100644
> --- a/arch/arm64/include/asm/cpu.h
> +++ b/arch/arm64/include/asm/cpu.h
> @@ -20,6 +20,7 @@ struct cpuinfo_arm64 {
>  	u64		reg_dczid;
>  	u64		reg_midr;
>  	u64		reg_revidr;
> +	u64		reg_gmid;
>  
>  	u64		reg_id_aa64dfr0;
>  	u64		reg_id_aa64dfr1;
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index ca66a61bb396..3b9089ca52dc 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -401,6 +401,11 @@ static const struct arm64_ftr_bits ftr_dczid[] = {
>  	ARM64_FTR_END,
>  };
>  
> +static const struct arm64_ftr_bits ftr_gmid[] = {
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, SYS_GMID_EL1_BS_SHIFT, 4, 0),
> +	ARM64_FTR_END,
> +};
> +
>  static const struct arm64_ftr_bits ftr_id_isar0[] = {
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DEBUG_SHIFT, 4, 0),
> @@ -618,6 +623,9 @@ static const struct __ftr_reg_entry {
>  	/* Op1 = 0, CRn = 1, CRm = 2 */
>  	ARM64_FTR_REG(SYS_ZCR_EL1, ftr_zcr),
>  
> +	/* Op1 = 1, CRn = 0, CRm = 0 */
> +	ARM64_FTR_REG(SYS_GMID_EL1, ftr_gmid),
> +
>  	/* Op1 = 3, CRn = 0, CRm = 0 */
>  	{ SYS_CTR_EL0, &arm64_ftr_reg_ctrel0 },
>  	ARM64_FTR_REG(SYS_DCZID_EL0, ftr_dczid),
> @@ -872,6 +880,7 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
>  	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
>  	init_cpu_ftr_reg(SYS_DCZID_EL0, info->reg_dczid);
>  	init_cpu_ftr_reg(SYS_CNTFRQ_EL0, info->reg_cntfrq);
> +	init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
>  	init_cpu_ftr_reg(SYS_ID_AA64DFR0_EL1, info->reg_id_aa64dfr0);
>  	init_cpu_ftr_reg(SYS_ID_AA64DFR1_EL1, info->reg_id_aa64dfr1);
>  	init_cpu_ftr_reg(SYS_ID_AA64ISAR0_EL1, info->reg_id_aa64isar0);
> @@ -1082,6 +1091,14 @@ void update_cpu_features(int cpu,
>  	taint |= check_update_ftr_reg(SYS_DCZID_EL0, cpu,
>  				      info->reg_dczid, boot->reg_dczid);
>  
> +	/*
> +	 * The kernel uses the LDGM/STGM instructions and the number of tags
> +	 * they read/write depends on the GMID_EL1.BS field. Check that the
> +	 * value is the same on all CPUs.
> +	 */
> +	taint |= check_update_ftr_reg(SYS_GMID_EL1, cpu,
> +				      info->reg_gmid, boot->reg_gmid);
> +
>  	/* If different, timekeeping will be broken (especially with KVM) */
>  	taint |= check_update_ftr_reg(SYS_CNTFRQ_EL0, cpu,
>  				      info->reg_cntfrq, boot->reg_cntfrq);
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 4bea701117d4..cd9f2d51285b 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -359,6 +359,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	info->reg_dczid = read_cpuid(DCZID_EL0);
>  	info->reg_midr = read_cpuid_id();
>  	info->reg_revidr = read_cpuid(REVIDR_EL1);
> +	info->reg_gmid = read_cpuid(GMID_EL1);
>  
>  	info->reg_id_aa64dfr0 = read_cpuid(ID_AA64DFR0_EL1);
>  	info->reg_id_aa64dfr1 = read_cpuid(ID_AA64DFR1_EL1);


I am seeing the following undefined instruction crash on all our 
ARM64 Tegra devices on today's -next and bisect is pointing to
this patch. Reverting this patch on top of -next does fix the 
problem. Let me know if you have any thoughts.

Thanks!
Jon

[    0.000000] ------------[ cut here ]------------
[    0.000000] kernel BUG at /dvs/git/dirty/git-master_l4t-upstream/kernel/arch/arm64/kernel/traps.c:406!
[    0.000000] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.0-rc3-next-20210526-gf6b46ef27317 #1
[    0.000000] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
[    0.000000] pc : do_undefinstr+0x298/0x2b0
[    0.000000] lr : do_undefinstr+0x2a8/0x2b0
[    0.000000] sp : ffff800011cb3c10
[    0.000000] x29: ffff800011cb3c10 x28: ffff800011cc3540 x27: 0000000000000002
[    0.000000] x26: ffff800011760008 x25: ffff0001f4deccc0 x24: ffff800011cb9000
[    0.000000] x23: ffff800011fb50f8 x22: ffff800011fb5000 x21: 00000000d5390080
[    0.000000] x20: ffff800011cb3c90 x19: ffff800011cb9000 x18: ffffffffffffffff
[    0.000000] x17: 0000000000017000 x16: 0000000000000000 x15: 000000000000001e
[    0.000000] x14: 0000000000200000 x13: 0000000275e00000 x12: 0000001000000000
[    0.000000] x11: 00000000009fc580 x10: 0000000274e03a80 x9 : 0000001000000000
[    0.000000] x8 : 0000000000200000 x7 : 0000000000000003 x6 : 0000000000000000
[    0.000000] x5 : ffff800011cc5910 x4 : 0000000000000000 x3 : ffff800011fb50f8
[    0.000000] x2 : 0000000000000000 x1 : ffff800011cc3540 x0 : 0000000000000005
[    0.000000] Call trace:
[    0.000000]  do_undefinstr+0x298/0x2b0
[    0.000000]  el1_undef+0x2c/0x48
[    0.000000]  el1_sync_handler+0xb4/0xd0
[    0.000000]  el1_sync+0x74/0x100
[    0.000000]  __cpuinfo_store_cpu+0x5c/0x248
[    0.000000]  cpuinfo_store_boot_cpu+0x28/0x54
[    0.000000]  smp_prepare_boot_cpu+0x2c/0x38
[    0.000000]  start_kernel+0x1a4/0x62c
[    0.000000]  __primary_switched+0x8c/0x90
[    0.000000] Code: b5fffe40 b94047b5 17ffffca d503201f (d4210000) 
[    0.000000] random: get_random_bytes called from print_oops_end_marker+0x4c/0x68 with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---

-- 
nvpublic
