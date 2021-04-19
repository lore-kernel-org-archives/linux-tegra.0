Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0DEC433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 13:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D0436135F
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 13:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239423AbhDSNJX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Apr 2021 09:09:23 -0400
Received: from mail-bn8nam11on2052.outbound.protection.outlook.com ([40.107.236.52]:61857
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239441AbhDSNI5 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Apr 2021 09:08:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB+L6+LAIHh4Yn41UbWOFchDBiMiQxr819X5XFD46F256IDHlFuEyyHK0Qqr0Mph3xcl3Z13++xQvJquOf74li9hLiDac4sDGsdfr1Is3tWwSw7FiWybEvk6pgrTzmEWX2UqCEKh26ZJjKNiotpblBAwDJ8gm+xY1V+uXFtFK/HqUFOlMsEg7PeEUr/LDbTRCWqdeQUnq1l7ntbF9DtUjbRnxvUn/vzbY8RFp5LLYYblBIRXP5AsLZtvOUg+su5RGWNGsQYwNx/wogZZzABU1Ebt0EpmO2MgrRYyE0h5O+08WLXISyTe1X281SzX7vC+AfAWVuwyI3Kyfdht9s1Wjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Da3mniRmcAjpSqi2VsL8nC0VvGNcWPohUCghmkCwsA=;
 b=TLdXJAjcSY7IdJKBWvIlZkhWthwuZ/DhL+st2itXeqCvkvB7aaZ8Kco8IS0pZtfH/2PIVaXNcH4NGMDTMmk4v/ZBLxgRy1iZdZLB0gAET+AeEtBglM19VsanBPTYdOu3kpjkUBlw246AkZ2zlvvMLLE5rQi5NGHV9rJdjLTJrgw3KKpk6+Li7OzZrMWfmKJgb24MpyXfypHIEtD9jSkq7iYoi38lt29G8u/547vEJSKQOzQfIcmIen5QXZtO6RSNKpYKDHULxXec4Lll1nv4GeMkK6a4HyMFvyjbva+O5YgP5gNdr0xv8wBEUx3a5HjbxzsuOYgeuuVw9nWAWPwQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Da3mniRmcAjpSqi2VsL8nC0VvGNcWPohUCghmkCwsA=;
 b=oFM0OcUqhuhEksXhi4fv5ZRr1Zls3RrhNSEjkr8yC0oLW0LLuiesvaTkrTg7FoyDjquwXE6OQzvns0oqqbGUCMwjN15mgN1GaF0U47YXtjJnB4O2nCeshiecfqsL1vTKev2I3LAj1SZ+/B3S64iHUj97HOQhF/txQH1HwvyhpS8N61P4kYR+7oKUu8eHC2D9Z3UpF6ulkPHEruQHxSD4PDDbQYa7GEMsj3Egf9tS3g0CFeAEVrwEgSQAar2XllcPsBOz1SUWmk7V4Oq/HGRj39rK5iR/wBmSxditkEPuOec0HuPT/P1+jtR9OUM151gEb6TDwR5aCGfunsZZSNN1LQ==
Received: from MWHPR14CA0045.namprd14.prod.outlook.com (2603:10b6:300:12b::31)
 by BYAPR12MB2773.namprd12.prod.outlook.com (2603:10b6:a03:72::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 13:08:18 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:12b:cafe::d6) by MWHPR14CA0045.outlook.office365.com
 (2603:10b6:300:12b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 13:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 13:08:18 +0000
Received: from [10.26.49.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr
 2021 13:08:16 +0000
Subject: Re: [PATCH v3 1/3] tracing: Show real address for trace event
 arguments
To:     Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
CC:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <160277369795.29307.6792451054602907237.stgit@devnote2>
 <160277370703.29307.5134475491761971203.stgit@devnote2>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9835d9f1-8d3a-3440-c53f-516c2606ad07@nvidia.com>
Date:   Mon, 19 Apr 2021 14:08:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <160277370703.29307.5134475491761971203.stgit@devnote2>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63bccc92-e63d-4a45-d649-08d903343357
X-MS-TrafficTypeDiagnostic: BYAPR12MB2773:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27737E8660DE6731ED4C6D0ED9499@BYAPR12MB2773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JPdZl9emr+4QpVYhFwg748NL4gAVG/qR6jPjNTpBZGHhvbYj5EXxbaHh+SP09QMGoMg7JTEpL7xiDeRWDsDqW0iyjFtA1ttvE5/D9SGGgeZZ5mLhoWmQZhXH0tQUt1RnSB5uFhkyQmGjYLW8JUFA8wvYYeF4/l2U3vE2wMhRHk70ovo9VJgBGkXoIQrPeatk3eTvhqcnZSz05QRei2XsDrC1rcFGB8YsrHWs1nvHoFfPKW7iHhis8NFWYgTi7gpkOjKZAixjrLx3V0P66aY17IzTSDoBbUXbPMmFIm6/iZpjVNR4L4dsQhGbqVk1uSySVuwdEaa8F0cFkYsrNt2caHlVOvD/WRRBc7rGckQkkGLQQUQ51ibcMK3/zQ1Ii6qEnrrVKoeeW/VOJWcvsI7aFn6NdJ4nqilGYpSIJdFqNIXeKONYK7viMcGhOTX5Z6rtYTBK141WYcFoYPbRrf1WDX5+mg6e+ySWAEe3sGRNx7leW02AgSJOeKieYBdPw/Dfbev79WrOk4XyVpt8bokJ5RozZw0K0tFRKhZZKMtEx1mqHBcVeeKfL8jLbKOubkM81jkaAZ+N8usqWIuM9VoAiIZgKVkrDHhyJm6yLEM1/vAStF28BmqUt/92kTwuI2JRCPKBx/wBxS1vq6Ygn2/gBIMPM0G/EMtwTnoM+EtMOqT+28QSSNQxhMRejL9FfsW3
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966006)(36840700001)(36860700001)(8936002)(47076005)(478600001)(53546011)(16526019)(2906002)(26005)(45080400002)(186003)(8676002)(36756003)(82310400003)(31696002)(5660300002)(4326008)(16576012)(83380400001)(2616005)(36906005)(70206006)(316002)(336012)(70586007)(31686004)(86362001)(54906003)(7636003)(356005)(110136005)(82740400003)(426003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 13:08:18.2743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bccc92-e63d-4a45-d649-08d903343357
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2773
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 15/10/2020 15:55, Masami Hiramatsu wrote:
> To help debugging kernel, show real address for trace event arguments
> in tracefs/trace{,pipe} instead of hashed pointer value.
> 
> Since ftrace human-readable format uses vsprintf(), all %p are
> translated to hash values instead of pointer address.
> 
> However, when debugging the kernel, raw address value gives a
> hint when comparing with the memory mapping in the kernel.
> (Those are sometimes used with crash log, which is not hashed too)
> So converting %p with %px when calling trace_seq_printf().
> 
> Moreover, this is not improving the security because the tracefs
> can be used only by root user and the raw address values are readable
> from tracefs/percpu/cpu*/trace_pipe_raw file.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>


I have encountered the following crash on a couple of our ARM64 Jetson
platforms and bisect is pointing to this change. The crash I am seeing
is on boot when I am directing the trace prints to the console by adding
'tp_printk trace_event="cpu_frequency,cpu_frequency_limits"' to the
kernel command line and enabling CONFIG_BOOTTIME_TRACING. Reverting this
change does fix the problem. Let me know if you have any thoughts.

[    5.731301] Unable to handle kernel paging request at virtual address
fbf80000800040f8
[    5.739215] Mem abort info:
[    5.742004]   ESR = 0x96000004
[    5.745054]   EC = 0x25: DABT (current EL), IL = 32 bits
[    5.750359]   SET = 0, FnV = 0
[    5.753408]   EA = 0, S1PTW = 0
[    5.756543] Data abort info:
[    5.759416]   ISV = 0, ISS = 0x00000004
[    5.763244]   CM = 0, WnR = 0
[    5.766205] [fbf80000800040f8] address between user and kernel
address ranges
[    5.773332] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    5.778898] Modules linked in:
[    5.781952] CPU: 5 PID: 44 Comm: kworker/5:1 Tainted: G S
    5.12.0-rc8 #1
[    5.789861] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[    5.795773] Workqueue: events deferred_probe_work_func
[    5.800913] pstate: 60000085 (nZCv daIf -PAN -UAO -TCO BTYPE=--)
[    5.806911] pc : trace_event_format+0x28/0x1a0
[    5.811353] lr : trace_event_printf+0x50/0x98
[    5.815706] sp : ffff80001230b760
[    5.819014] x29: ffff80001230b760 x28: ffff800011e99c10
[    5.824324] x27: ffff000082d9ce18 x26: ffff8000115abd30
[    5.829630] x25: 0000000000000000 x24: ffff800011f3e040
[    5.834937] x23: ffff0000800050c8 x22: ffff000080004000
[    5.840242] x21: ffff800012276e38 x20: ffff000080004000
[    5.845549] x19: ffff800011e99948 x18: ffffffffffffffff
[    5.850854] x17: 0000000000000007 x16: 0000000000000001
[    5.856161] x15: ffff800011e99948 x14: ffff000082d15688
[    5.861468] x13: ffff000082d15687 x12: 0000000000000018
[    5.866774] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f
[    5.872082] x9 : 0000000000000090 x8 : 0000000000000095
[    5.877389] x7 : 0000000000000014 x6 : ffff0000800050de
[    5.882695] x5 : 0000000000000000 x4 : 0000000000000000
[    5.888002] x3 : ffff80001230b820 x2 : 00000000ffffffd0
[    5.893308] x1 : ffff8000115abd30 x0 : fbf8000080004080
[    5.898615] Call trace:
[    5.901056]  trace_event_format+0x28/0x1a0
[    5.905147]  trace_event_printf+0x50/0x98
[    5.909151]  trace_raw_output_cpu_frequency_limits+0x48/0x60
[    5.914807]  trace_event_buffer_commit+0x1bc/0x288
[    5.919592]  trace_event_raw_event_cpu_frequency_limits+0x78/0xd0
[    5.925679]  __traceiter_cpu_frequency_limits+0x30/0x48
[    5.930899]  cpufreq_set_policy+0x15c/0x288
[    5.935079]  cpufreq_online+0x6f4/0x928
[    5.938910]  cpufreq_add_dev+0x78/0x88
[    5.942654]  subsys_interface_register+0x9c/0xf0
[    5.947266]  cpufreq_register_driver+0x170/0x218
[    5.951878]  tegra186_cpufreq_probe+0x164/0x350
[    5.956404]  platform_probe+0x90/0xd8
[    5.960061]  really_probe+0x20c/0x3e8
[    5.963720]  driver_probe_device+0x54/0xb8
[    5.967812]  __device_attach_driver+0x90/0xc0
[    5.972161]  bus_for_each_drv+0x70/0xc8
[    5.975992]  __device_attach+0xec/0x150
[    5.979825]  device_initial_probe+0x10/0x18
[    5.984002]  bus_probe_device+0x94/0xa0
[    5.987833]  deferred_probe_work_func+0x80/0xb8
[    5.992359]  process_one_work+0x1f0/0x4b8
[    5.996368]  worker_thread+0x20c/0x450
[    6.000112]  kthread+0x124/0x150
[    6.003337]  ret_from_fork+0x10/0x18
[    6.006913] Code: b4000b21 aa0003f6 f9400000 aa0103fa (b9407800)
[    6.013000] ---[ end trace eae1531f47c7c14a ]---

Thanks!
Jon

-- 
nvpublic
