Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD65C001E0
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Jul 2023 10:56:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbjGXK4J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Jul 2023 06:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233156AbjGXK4J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Jul 2023 06:56:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85373F3;
        Mon, 24 Jul 2023 03:56:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F28926108A;
        Mon, 24 Jul 2023 10:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08952C433D9;
        Mon, 24 Jul 2023 10:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690196167;
        bh=EoRhPCwOhIgNGtTWNhayTE1OcOkV4Jof8HdiNSSHfPc=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=ngSQXJ7x44/0jmVK4kzF4Z/QSelxB/d+6mgKtdcMzfRWIgBw+6JLZzZ2nF1bWTaoY
         YpmgxPo1PRjjbf+a+oDrRU2Q3JmxUcArnNQNVSMoBMIxepwLno/UDvF/weOHSAJL6F
         CBDtBW/OQUseLrRv35YDzxLUN2W8HMdOm5/5Kig1vYDG4+CyYeNO86vQPGkic+6/hy
         hEaBsVNAQLrVJfP8gGQHPwlCAMjShTyO5ZSEEB+42dfptJgKJbj/5ouFSzmRS8a46M
         p0wFXTjmBmksjHSo4N9RxSGj8QLiZtwJQSuO1iaLV46lg4VvXBA77h+xnHILw5Jmzh
         WjIm18P0zL29A==
From:   Vinod Koul <vkoul@kernel.org>
To:     jckuo@nvidia.com, Yang Li <yang.lee@linux.alibaba.com>
Cc:     kishon@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
In-Reply-To: <20230719003614.5506-1-yang.lee@linux.alibaba.com>
References: <20230719003614.5506-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] phy: Remove duplicated include in xusb.c
Message-Id: <169019616467.466601.4012488093184234530.b4-ty@kernel.org>
Date:   Mon, 24 Jul 2023 16:26:04 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Wed, 19 Jul 2023 08:36:14 +0800, Yang Li wrote:
> ./drivers/phy/tegra/xusb.c: linux/platform_device.h is included more than once.
> 
> 

Applied, thanks!

[1/1] phy: Remove duplicated include in xusb.c
      commit: f5a8ecef3c6b840673d08342045c3014d674555f

Best regards,
-- 
~Vinod


