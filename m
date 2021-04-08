Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC44FC433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 04:38:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 748516101E
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 04:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhDHEi1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Apr 2021 00:38:27 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:10828 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhDHEi1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 8 Apr 2021 00:38:27 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4FG7mk5jtmzCg;
        Thu,  8 Apr 2021 06:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1617856695; bh=cIWowVmIstGa4XsZQf6kLscFfPr+0N/wKHkq0IDfrRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g4n904YaRWURy8BSdwGdKe3a3rVHfDrHaVJTqKkLOnbUxcMuLBFnNm9tjAO2QcWfU
         NvxF60Niu6bNiYec2QDX8vavPfqXiRt3AJnWYov4zNCtgOUEaiIEtwbvRQ5HCwXXy/
         2v9iQho5kASI77MvqVmOLKLTpP79tgYJOcqiLsBEnC8spvr/tLxINCpEGm/4h7FBhv
         FQg6a9HcaQQ4vA/qYcwysCA+7493/arzFFSDfxvg5+ygg44O/7Rdz4Ea1Li5u5qMp9
         HH9vl9Z9KPpxCs5LGw6pPBRuN+aj1u9C/aB1uaGkVgJ4nfkfXr7I9kCPu++dGH5+bz
         VE9W7tnqKlmJQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 8 Apr 2021 06:37:17 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     marvin24@gmx.de, p.zabel@pengutronix.de, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: move to use request_irq by IRQF_NO_AUTOEN
 flag
Message-ID: <20210408043717.GD19244@qmqm.qmqm.pl>
References: <1617777259-27463-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1617777259-27463-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Apr 07, 2021 at 02:34:19PM +0800, Tian Tao wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable because of requesting.
> 
> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/

This assumes that the interrupt is not shared. This could be fixed
by requesting the IRQ after init (and releasing before deinit).

Best Regards
Micha³ Miros³aw
