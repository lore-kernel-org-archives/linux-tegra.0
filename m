Return-Path: <SRS0=p7a/=DE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FD6C4346E
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Sep 2020 16:53:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D08B2389F
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Sep 2020 16:53:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgI0QxR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Sep 2020 12:53:17 -0400
Received: from smtprelay0247.hostedemail.com ([216.40.44.247]:34942 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726265AbgI0QxR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Sep 2020 12:53:17 -0400
X-Greylist: delayed 473 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Sep 2020 12:53:16 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave07.hostedemail.com (Postfix) with ESMTP id B78601802ACCB
        for <linux-tegra@vger.kernel.org>; Sun, 27 Sep 2020 16:45:23 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 7ECF818225E17;
        Sun, 27 Sep 2020 16:45:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: gate88_5f0387d2717a
X-Filterd-Recvd-Size: 1695
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf05.hostedemail.com (Postfix) with ESMTPA;
        Sun, 27 Sep 2020 16:45:20 +0000 (UTC)
Message-ID: <4bff3adc94d909be7132151b1af211ed862b4126.camel@perches.com>
Subject: Re: [PATCH v2] Staging: nvec: nvec: fix double next comment
From:   Joe Perches <joe@perches.com>
To:     Ryan Kosta <ryanpkosta@gmail.com>, gregkh@linuxfoundation.org
Cc:     marvin24@gmx.de, p.zabel@pengutronix.de, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Date:   Sun, 27 Sep 2020 09:45:19 -0700
In-Reply-To: <20200927163504.7546-1-ryanpkosta@gmail.com>
References: <20200927163504.7546-1-ryanpkosta@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 2020-09-27 at 09:35 -0700, Ryan Kosta wrote:
> Changes since v1:
>  * Made commit message more clear
>  * Added description
> Note: previous patch named
>  "[PATCH] fix double next comment in drivers/staging/nvec/nvec.c"
> > 8------------------------------------------------------8<
> Fixes a comment typo.

Hi Ryan.

That comment should be _below_ the --- separator line

There's no need to double the nvec: word in the subject either.
And please use the imperative.

So the email message should look something like:

---------------------------------------------------------

From: <you>

Subject: [PATCH V2] staging: nvec: Remove repeated word typo in a comment

Fix a comment typo.

Signed-off-by: <you>
---

V2: Add a commit description

<patch>


