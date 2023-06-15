Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1FEEB64DB
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Jun 2023 01:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbjFOB0E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jun 2023 21:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjFOB0D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jun 2023 21:26:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640E3211D;
        Wed, 14 Jun 2023 18:26:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F2BD8621FB;
        Thu, 15 Jun 2023 01:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E54C433C0;
        Thu, 15 Jun 2023 01:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686792362;
        bh=7S7Rzbu6lV/dWzWop2zTJWDhseXeW8iAWppBn9/g84Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rCpu35ii9PVSq5ryfHQumrrjxcRWNMQmxNegDCQPRZ72uXt6ADhtqt9RCeBWTNHeg
         KGdbtDIlQBo24rtU2yhuKe+qzdRa9SxOQQ7BqRomXsQ6aSIIMusfNF2BVosUCvvmlS
         /6F2NT5X8QBXsjH/zR3ir41UuFwp1wfXEdktxczsK5abQt4TVjpGsaMp5hxm9g/MeJ
         TIeuUk0QkGm6u8atAEgzmuDxnyXBYjvdRF2XM91VdPgB62y5YGqCv3BNBsoUy2ajOG
         mc3PZhc4hc3PR+/zX6Ob04mRWeqOvvygkqHp3U2hUtLFFnm8a0KBatB+V46h1+z8E+
         FkS+j0zqXNZYA==
Message-ID: <b569aa8e6732f7b0382499d0b9cfa98d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221209094124.71043-1-yuancan@huawei.com>
References: <20221209094124.71043-1-yuancan@huawei.com>
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Fix potential memory leak
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     yuancan@huawei.com
To:     Yuan Can <yuancan@huawei.com>, jonathanh@nvidia.com,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        mperttunen@nvidia.com, mturquette@baylibre.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        thierry.reding@gmail.com, tomeu.vizoso@collabora.com
Date:   Wed, 14 Jun 2023 18:26:00 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Yuan Can (2022-12-09 01:41:24)
> The tegra and tegra needs to be freed in the error handling path, otherwi=
se
> it will be leaked.
>=20
> Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---

Applied to clk-next
