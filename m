Return-Path: <SRS0=iMCN=CY=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C34CC43461
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 19:52:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03AA82078D
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Sep 2020 19:52:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oBvuEWmS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbgIOTw1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Sep 2020 15:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbgIORHz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 13:07:55 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D525AC06121C;
        Tue, 15 Sep 2020 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=+jWJSJfIQz6E28jxk5SjJ1O4Do640g9wF9++nJ8QJbg=; b=oBvuEWmSMaP//CD+lK6BSucaOk
        X5NA+PnSUua3gdMPV+nLEjGcUObTtayoysR+P7fS1oKAMfYgx4S4o8vKH6kVXO8f8hP9xH16mdoj3
        94IiRKRC7ym6tbSK9OjCL9UO7g3XXTcersFR1fHZuupjM3zcIylxNoMUqQeSy+WLq0xQ/jDjSrVOQ
        PZ7tGuRdtjG99mqE7Nqx6wPOTLglGArwMCqQQrqA+2/BAMMoP6u5ymytCMdXtf4XILlX82m3dtl0x
        cKUpKzGtBCyhNmrsem6v77I5ZQeXBaNI8DE6Fo8mNSu3NdWLKISuUlbt6qGIE2hzCKRSbrKMnNuYu
        3eQrA3QA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIEJi-0007bp-Pq; Tue, 15 Sep 2020 17:00:31 +0000
Subject: Re: [BUG] slab: double free detected in cache 'kmalloc-128', objp
 daff5780
To:     Peter Geis <pgwipeout@gmail.com>, Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <CAMdYzYoRFBOA0b8tZgZpvbWkrtNrcyDXt9zHCF7yqtm2heYSXQ@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6be9a256-697d-b991-294e-95282a53f10a@infradead.org>
Date:   Tue, 15 Sep 2020 10:00:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMdYzYoRFBOA0b8tZgZpvbWkrtNrcyDXt9zHCF7yqtm2heYSXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/15/20 4:41 AM, Peter Geis wrote:
> [33633.566567] [<c0111a6c>] (unwind_backtrace) from [<c010b95c>]
> (show_stack+0x10/0x14)

Hi Peter,

In the future, could you prevent long lines from being line-wrapped?
E.g., the 2 lines above should all be on one line.
It is much harder to read as it was posted.

thanks.
-- 
~Randy

