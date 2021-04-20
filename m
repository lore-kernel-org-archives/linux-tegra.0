Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8884C433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 11:16:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C05D6101D
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 11:16:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhDTLR0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 07:17:26 -0400
Received: from mail-dm6nam11on2084.outbound.protection.outlook.com ([40.107.223.84]:25601
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230290AbhDTLR0 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 07:17:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyyQ0qyGdV19BSOW7jQes7cxPoekmkH2WFzwu3aC7R+lCYpv+vKc97wfkfMM70G/mL4E8MNSWOZvojRQCQ4lGoSh2cG12yvJe5V0gnkTLw4o6ttoMOJ2ImLlJv69lpwOIbCwylNxiiMbvKy1ukmILWoPEmilQ4JHWa96xHSEI+XRlvCfNJSdV+/xlhDeL8cUGhEgP4Hq+XLkWwA9dW8FeuF7w4+oX9pT0L/WOKMcResH6PCKWJ8/Bb5ylb4HXyCVV0p7xuOUlwbz5jBTLkvSj7vNpbTiS82x6GWwK5rHGQ69nwQtnH+aVn3i+2Ok5is4dAE6rvNf5GLnvIAKQnOP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgv0wgZ/MlAwgGBvRPdj2nU1jOPL4COrBo4iaxOdH+w=;
 b=cKV55njXU8sd6jTGl5BRD/3Kf3qhaRXwXSX5YDHNbnUrNS3kSs+urncrvI5WVieShdhN/e9ajatZe2HXXo+eqSaDimuPZDg0SAEHqOANP3wadLQuuS0BtoyE0IiPGX73NmBrwOf4Pnc27tE9MbvoHuj4Aoin+77X1F3aenIG4iobtZB5vzCNsGtMAi6E8LgatdhQ1vLWrjZYKVRwDxo7rKGSdO9cLeTIQQ1zoNaNR94OXDnAJFUep864kDxOYHdiUdbXM8oH0yfrdCJavdl+17hqh5pOronIlEz+YV25rLPnwpM6lyv6+3imaiFDqoBiSekeLivF+2WIsb0jtHhRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgv0wgZ/MlAwgGBvRPdj2nU1jOPL4COrBo4iaxOdH+w=;
 b=nzSAq0zt3IRQJ3GbturcMvGgFPm8ZfUnKgyb3cTgmhGsC21T0yahpn/ideXsmshSdburoGUVrtqeiF3PcIY8cPHBwKPu/k2FAjA7QhVKIBkZ8LzPde5NjiIixcoFDVvFq2uzM/LgYX7xhbBLkehrgJLqzZzJsJOZfmiX8/1O9EdXXJiTkiV8Z4Zm5SC8MlJKwM+tIGoOv4R3ghSload5wMJMBHCWLxIuRnvFVLTPilGEd5j6aaOMTr2ks4F3cS8OGNrO7kV9W+KnB3VGIrogv++7aGMloZw31t2gBhbzQk3hw6obWVz63pVZ4IaYm9Og3yWYX2Of/Zm8dAuGVXYxiQ==
Received: from MW4PR03CA0042.namprd03.prod.outlook.com (2603:10b6:303:8e::17)
 by MWHPR12MB1501.namprd12.prod.outlook.com (2603:10b6:301:f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 11:16:53 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::53) by MW4PR03CA0042.outlook.office365.com
 (2603:10b6:303:8e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Tue, 20 Apr 2021 11:16:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:16:51 +0000
Received: from [10.26.49.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Apr
 2021 11:16:50 +0000
Subject: Re: [PATCH v3 1/3] tracing: Show real address for trace event
 arguments
To:     Steven Rostedt <rostedt@goodmis.org>
CC:     Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <160277369795.29307.6792451054602907237.stgit@devnote2>
 <160277370703.29307.5134475491761971203.stgit@devnote2>
 <9835d9f1-8d3a-3440-c53f-516c2606ad07@nvidia.com>
 <20210419142229.3ff31384@gandalf.local.home>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b5425a21-cc6d-e9a7-1408-3db12192a3a2@nvidia.com>
Date:   Tue, 20 Apr 2021 12:16:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419142229.3ff31384@gandalf.local.home>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e0cf68a-188a-4135-d62f-08d903edcc3d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1501:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1501DD61410AB35649731BA3D9489@MWHPR12MB1501.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vN0LXkOypksXRbYWu/d0bQG3q73plQjleObuajreeR6L5dinv+5gunj2CDHSDCdO2SI2/AO7BTS7T7g+GK+slcx+F+g0SIEMzigakQmfpRD/KO0UKt4dBpgWsSkICKVCa4v6yOBOukBTAAK9VMFsIVvRPoCPWlzyXF8ldKOT8uqsoFYhLt4OljLHBRCnXbVLGQyu+PriYmi2zZ4s+Q/vOw8+obGJX/dO5N6IIqAGSTd/4UrL1nhZyfrVQsaQFn7wl2F+6Sjs/BCpu9A5+cynj29AoX/7fdSuiF37SLREPjV76jgUOn1W5QHdp7MUCH89tKijFJcUx8T74gfHh/zVSBeLgm1CMiOTIdA1RYALAg5d96iOmnqGkJ9hyafWOR+Iah+0mjTGNOtXpTHmati4cVRmeVgNBh8EbiioEQXxArrfdNfND/At6zC/o1Tk6ZORvffjEsyFebg/uRPQzZEw92z+a6ZVNqf6A2QjB2mU6BeBDf0eFWRmQQ3oHaLqw473wj4KmN7fx6F2y5YnHfXZf0jXwFeTzjQDUMlOlRpTKj0tSQoD++0t3DHn6gtPn9RX64A5bxez2Sw5+WCKn8/vbWF4SkFmNtF+SqMbabPvB6CjooJiR9kPiHqagR9+wvxxtMUW8Zy1ttmJ46vALZWvmpT/NlPGQGziZHXabMWcSlD27u+7WGGUTJBr17T8mLJ8
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(36840700001)(46966006)(82740400003)(36906005)(316002)(31696002)(82310400003)(8936002)(2906002)(86362001)(16576012)(4326008)(36860700001)(36756003)(8676002)(5660300002)(6916009)(70206006)(26005)(31686004)(70586007)(336012)(186003)(53546011)(54906003)(16526019)(7636003)(47076005)(356005)(6666004)(83380400001)(426003)(478600001)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:16:51.7213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0cf68a-188a-4135-d62f-08d903edcc3d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1501
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 19/04/2021 19:22, Steven Rostedt wrote:
> On Mon, 19 Apr 2021 14:08:14 +0100
> Jon Hunter <jonathanh@nvidia.com> wrote:
> 
>> I have encountered the following crash on a couple of our ARM64 Jetson
>> platforms and bisect is pointing to this change. The crash I am seeing
>> is on boot when I am directing the trace prints to the console by adding
>> 'tp_printk trace_event="cpu_frequency,cpu_frequency_limits"' to the
>> kernel command line and enabling CONFIG_BOOTTIME_TRACING. Reverting this
>> change does fix the problem. Let me know if you have any thoughts.
> 
> Thanks for the report. I was able to reproduce this on x86 as well.
> 
> It's the tp_printk that's the problem. Does this fix it for you?
> 
> -- Steve
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 66a4ad93b5e9..f1ce4be7a499 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -3580,7 +3580,11 @@ static char *trace_iter_expand_format(struct trace_iterator *iter)
>  {
>  	char *tmp;
>  
> -	if (iter->fmt == static_fmt_buf)
> +	/*
> +	 * iter->tr is NULL when used with tp_printk, which makes
> +	 * this get called where it is not safe to call krealloc().
> +	 */
> +	if (!iter->tr || iter->fmt == static_fmt_buf)
>  		return NULL;
>  
>  	tmp = krealloc(iter->fmt, iter->fmt_size + STATIC_FMT_BUF_SIZE,
> @@ -3799,7 +3803,7 @@ const char *trace_event_format(struct trace_iterator *iter, const char *fmt)
>  	if (WARN_ON_ONCE(!fmt))
>  		return fmt;
>  
> -	if (iter->tr->trace_flags & TRACE_ITER_HASH_PTR)
> +	if (!iter->tr || iter->tr->trace_flags & TRACE_ITER_HASH_PTR)
>  		return fmt;
>  
>  	p = fmt;
> @@ -9931,7 +9935,7 @@ void __init early_trace_init(void)
>  {
>  	if (tracepoint_printk) {
>  		tracepoint_print_iter =
> -			kmalloc(sizeof(*tracepoint_print_iter), GFP_KERNEL);
> +			kzalloc(sizeof(*tracepoint_print_iter), GFP_KERNEL);
>  		if (MEM_FAIL(!tracepoint_print_iter,
>  			     "Failed to allocate trace iterator\n"))
>  			tracepoint_printk = 0;
> 


Yes that works for me thanks!

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic
