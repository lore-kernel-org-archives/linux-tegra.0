Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F80C12002
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jul 2021 14:08:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9E9761249
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jul 2021 14:08:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhGUN1o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Jul 2021 09:27:44 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52990 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbhGUN1n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Jul 2021 09:27:43 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 9C16620341;
        Wed, 21 Jul 2021 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626876499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q55yZIwgrOMLI8+g0CE8a6c06nPPqRsHLKQZ5mZTjAc=;
        b=ms0MdtnSy8eMy3ZAo6AcdziLloi7t3ZNZv94tgEvBvDjFanP2grZFYGt1cQ3SPCzuVq5Nj
        63qZJyXCiUWT06zJyOGiump5ew0qG5WtYlvjAnYm8myg6xl9vcPtqOE/KkaRQA55ZzpnVP
        +y8WoJjKOnlSbOSkNgkxNWCL1y/LJ6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626876499;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q55yZIwgrOMLI8+g0CE8a6c06nPPqRsHLKQZ5mZTjAc=;
        b=2Cr6OZg2Ox8T/S4EehiZkei0sWAfcq7Lvk1LDxpOT6nvLMcmA10KBSSh0Lug5CGZ7ZwgE0
        Or2YhAHbmDwdV4Dg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 64DA113BE8;
        Wed, 21 Jul 2021 14:08:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id s9OyFlMq+GC3HAAAGKfGzw
        (envelope-from <ykaukab@suse.de>); Wed, 21 Jul 2021 14:08:19 +0000
Date:   Wed, 21 Jul 2021 16:08:17 +0200
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     arnd@arndb.de, gregkh@linuxfoundation.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] misc: sram: Only map reserved areas in Tegra SYSRAM
Message-ID: <20210721140817.GA140161@suse.de>
References: <20210715103423.1811101-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210715103423.1811101-1-mperttunen@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jul 15, 2021 at 01:34:23PM +0300, Mikko Perttunen wrote:
> On Tegra186 and later, a portion of the SYSRAM may be reserved for use
> by TZ. Non-TZ memory accesses to this portion, including speculative
> accesses, trigger SErrors that bring down the system. This does also
> happen in practice occasionally (due to speculative accesses).
> 
> To fix the issue, add a flag to the SRAM driver to only map the
> device tree-specified reserved areas depending on a flag set
> based on the compatibility string. This would not affect non-Tegra
> systems that rely on the entire thing being memory mapped.
> 
> If 64K pages are being used, we cannot exactly map the 4K regions
> that are placed in SYSRAM - ioremap code instead aligns to closest
> 64K pages. However, since in practice the non-accessible memory area
> is 64K aligned, these mappings do not overlap with the non-accessible
> memory area and things work out.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>

Reviewed-by: Mian Yousaf Kaukab <ykaukab@suse.de>
