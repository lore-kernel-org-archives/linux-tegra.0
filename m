Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48152C433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 18:22:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B57960E0C
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 18:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240877AbhDSSXC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Apr 2021 14:23:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:47574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240833AbhDSSXB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Apr 2021 14:23:01 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFC0960E0C;
        Mon, 19 Apr 2021 18:22:30 +0000 (UTC)
Date:   Mon, 19 Apr 2021 14:22:29 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] tracing: Show real address for trace event
 arguments
Message-ID: <20210419142229.3ff31384@gandalf.local.home>
In-Reply-To: <9835d9f1-8d3a-3440-c53f-516c2606ad07@nvidia.com>
References: <160277369795.29307.6792451054602907237.stgit@devnote2>
        <160277370703.29307.5134475491761971203.stgit@devnote2>
        <9835d9f1-8d3a-3440-c53f-516c2606ad07@nvidia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 19 Apr 2021 14:08:14 +0100
Jon Hunter <jonathanh@nvidia.com> wrote:

> I have encountered the following crash on a couple of our ARM64 Jetson
> platforms and bisect is pointing to this change. The crash I am seeing
> is on boot when I am directing the trace prints to the console by adding
> 'tp_printk trace_event="cpu_frequency,cpu_frequency_limits"' to the
> kernel command line and enabling CONFIG_BOOTTIME_TRACING. Reverting this
> change does fix the problem. Let me know if you have any thoughts.

Thanks for the report. I was able to reproduce this on x86 as well.

It's the tp_printk that's the problem. Does this fix it for you?

-- Steve

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 66a4ad93b5e9..f1ce4be7a499 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3580,7 +3580,11 @@ static char *trace_iter_expand_format(struct trace_iterator *iter)
 {
 	char *tmp;
 
-	if (iter->fmt == static_fmt_buf)
+	/*
+	 * iter->tr is NULL when used with tp_printk, which makes
+	 * this get called where it is not safe to call krealloc().
+	 */
+	if (!iter->tr || iter->fmt == static_fmt_buf)
 		return NULL;
 
 	tmp = krealloc(iter->fmt, iter->fmt_size + STATIC_FMT_BUF_SIZE,
@@ -3799,7 +3803,7 @@ const char *trace_event_format(struct trace_iterator *iter, const char *fmt)
 	if (WARN_ON_ONCE(!fmt))
 		return fmt;
 
-	if (iter->tr->trace_flags & TRACE_ITER_HASH_PTR)
+	if (!iter->tr || iter->tr->trace_flags & TRACE_ITER_HASH_PTR)
 		return fmt;
 
 	p = fmt;
@@ -9931,7 +9935,7 @@ void __init early_trace_init(void)
 {
 	if (tracepoint_printk) {
 		tracepoint_print_iter =
-			kmalloc(sizeof(*tracepoint_print_iter), GFP_KERNEL);
+			kzalloc(sizeof(*tracepoint_print_iter), GFP_KERNEL);
 		if (MEM_FAIL(!tracepoint_print_iter,
 			     "Failed to allocate trace iterator\n"))
 			tracepoint_printk = 0;
