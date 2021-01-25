Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE201C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Jan 2021 23:23:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8279621D93
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Jan 2021 23:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbhAYXW7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 25 Jan 2021 18:22:59 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58927 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732528AbhAYXWv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Jan 2021 18:22:51 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C37C11C0002;
        Mon, 25 Jan 2021 23:21:52 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/2] rtc: tps65910: Support wakeup-source property
Date:   Tue, 26 Jan 2021 00:21:52 +0100
Message-Id: <161161690471.1967860.10533898900926612948.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120211603.18555-1-digetx@gmail.com>
References: <20210120211603.18555-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 21 Jan 2021 00:16:02 +0300, Dmitry Osipenko wrote:
> TPS65910 is a PMIC MFD device and RTC is one of its functions. The
> wakeup-source DT property is specified for the parent MFD device and we
> need to use this property for the RTC in order to allow to use RTC alarm
> for waking up system from suspend by default, instead of requiring user
> to enable wakeup manually via sysfs.

Applied, thanks!

[1/2] rtc: tps65910: Support wakeup-source property
      commit: 454ba154a62c8806e82a3581c5233a5176cd7dd7

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
