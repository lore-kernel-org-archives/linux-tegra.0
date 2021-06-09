Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09868C48BDF
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 11:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E19B661359
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 11:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239543AbhFILuC convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 07:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239499AbhFILtC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 07:49:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09978C06175F
        for <linux-tegra@vger.kernel.org>; Wed,  9 Jun 2021 04:47:05 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqwfn-0004A1-KW; Wed, 09 Jun 2021 13:47:03 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqwfm-0006Ua-Rk; Wed, 09 Jun 2021 13:47:02 +0200
Message-ID: <3bf7b5a82072484362fae4af946381e1ae846917.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: Add compile-test stubs
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 09 Jun 2021 13:47:02 +0200
In-Reply-To: <20210609112806.3565057-3-thierry.reding@gmail.com>
References: <20210609112806.3565057-1-thierry.reding@gmail.com>
         <20210609112806.3565057-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

On Wed, 2021-06-09 at 13:28 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add stubs for the reset controller registration functions to allow
> building reset controller provider drivers with the COMPILE_TEST
> Kconfig option enabled.
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Thank you, I've applied patch 2 to reset/next.

regards
Philipp
