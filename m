Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7A4C433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 21:16:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52AD86140A
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 21:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhENVRQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 May 2021 17:17:16 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:58942 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231945AbhENVRP (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 May 2021 17:17:15 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4FhhCQ0FZsz4w;
        Fri, 14 May 2021 23:16:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1621026962; bh=li55lGDO2GrPKLCNo9+gsmtWn3R9e7IO3cLh0c4NkYQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VtQ3TfkA2B4wA5zn6P70Lc9Wrup+ow437GAFHLAnmODi2cfZtGtzuM6X24HbTn2rK
         7tgga6wEBmMkZBWAGwqjG5qJO16cJ8sbKknkht/XYfNNCgubMxLo+wg/yxVNyL955O
         lgocRwhop70I9pMaH4E8qKGVKUiv/Ho+MAQtv7SLV6NGvLk5bjFnk5Cx8gHbnQnqrZ
         gFomyxCsvrLFpuCcfNIxaTB4QIt610tBAlX4tht9Nx4sMUyuCQFViNMiE7cW1KVn6j
         +0dyv+P0Vf/00u9SN6jZRBsfX4b/RrGWLaz2SJGcZiOWLA8++/1PpbhmuvJKZ0dw7U
         66VhSvyHGMvyQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.2 at mail
Date:   Fri, 14 May 2021 23:16:01 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/10] ARM: tegra: acer-a500: Bump thermal trips by 10C
Message-ID: <20210514211601.GA1969@qmqm.qmqm.pl>
References: <20210510202600.12156-1-digetx@gmail.com>
 <20210510202600.12156-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210510202600.12156-4-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, May 10, 2021 at 11:25:53PM +0300, Dmitry Osipenko wrote:
> It's possible to hit the temperature of the thermal zone in a very warm
> environment under a constant load, like watching a video using software
> decoding. It's even easier to hit the limit with a slightly overclocked
> CPU. Bump the temperature limit by 10C in order to improve user
> experience. Acer A500 has a large board and 10" display panel which are
> used for the heat dissipation, the SoC is placed far away from battery,
> hence we can safely bump the temperature limit.

60^C looks like a touch-safety limit (to avoid burns for users). Did you
verify the touchable parts' temperature somehow after the change?

Best Regards
Micha³ Miros³aw
