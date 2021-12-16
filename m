Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F19C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Dec 2021 10:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235842AbhLPKOu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Dec 2021 05:14:50 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:36296 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235826AbhLPKOu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Dec 2021 05:14:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8935FCE2081;
        Thu, 16 Dec 2021 10:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACC4C36AE4;
        Thu, 16 Dec 2021 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639649686;
        bh=/ZiLDlmi2f12Qwy8kaam4zOnhb9YHUmbNrmWsYEr5b8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pp1beYL0/tJhyXihvcEe2YHA2YaAKFnobic9QQ7kH7ssl6/z8HYLVy38jEvmy5MSj
         TQiqlwwF5e3uEvho9PkNIyX5A+dT5BbZaXQj87Me5DZXZmHvejERhVnKFnX4jouzQx
         oKCbnE6hjqZeRNCUrfp05QDKf8lhh7hBYssBXACd1exgqR2JQTMa1CCnrLikpn+2Ka
         pPhgwx4MkrTPOO9RAfZ9aZWgITDhuZrLepoqirirFsIBpVonab5uNKBxyHjdSOpuHn
         zDwCdnMmaCXanFu2sgnQPsbTS/ISBG7FBAiyEdtua9oWX+gadn3JHHkNpmZPPLtiDb
         ML7IXMVzbGdvw==
Date:   Thu, 16 Dec 2021 18:14:41 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
Cc:     robh+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, qiangqing.zhang@nxp.com
Subject: Re: [PATCH v3] arm64: dts: imx8mp-evk: configure multiple queues on
 eqos
Message-ID: <20211216101438.GL4216@dragon>
References: <20211216092448.35927-1-xiaoliang.yang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216092448.35927-1-xiaoliang.yang_1@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 16, 2021 at 05:24:48PM +0800, Xiaoliang Yang wrote:
> Eqos ethernet support five queues on hardware, enable these queues and
> configure the priority of each queue. Uses Strict Priority as scheduling
> algorithms to ensure that the TSN function works.
> 
> The priority of each queue is a bitmask value that maps VLAN tag
> priority to the queue. Since the hardware only supports five queues,
> this patch maps priority 0-4 to queues one by one, and priority 5-7 to
> queue 4.
> 
> The total fifo size of 5 queues is 8192 bytes, if enable 5 queues with
> store-and-forward mode, it's not enough for large packets, which would
> trigger fifo overflow frequently. This patch set DMA to thresh mode to
> enable all 5 queues.
> 
> Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
> Reviewed-by: Joakim Zhang <qiangqing.zhang@nxp.com>

Applied, thanks!
