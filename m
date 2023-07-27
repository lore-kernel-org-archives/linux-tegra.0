Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394B6C0015E
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 12:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbjG0MAv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 08:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbjG0MAu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 08:00:50 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607B4272B;
        Thu, 27 Jul 2023 05:00:48 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 707CF6005410;
        Thu, 27 Jul 2023 13:00:43 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id CfAhd75vu9Fh; Thu, 27 Jul 2023 13:00:41 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D673A6005415;
        Thu, 27 Jul 2023 13:00:40 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1690459241;
        bh=j8UZbxDsSPKbaSJxJxIeM6yBOjCI4G/p8UL5Mpkaguk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=MJbtlGCUJcM9OUlmbbWQ1TBim54PAMuMOb0RmYFaHah1jUr63ohwsLQV1MKcwwPNu
         KjKsyAU33do0yhNmorxiDxqbClH+6j9moJH+GO2j9Hiw2DtPbwvysM/wUYVAiRLxyl
         F1x6F5ovhvFkWcq3hxNwxg4XLMLcHWHf3hwdkMBo=
Received: from localhost.localdomain (unknown [62.156.206.15])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id EE315360075;
        Thu, 27 Jul 2023 13:00:39 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     krzysztof.kozlowski@linaro.org
Cc:     conor+dt@kernel.org, devicetree@vger.kernel.org,
        jonathanh@nvidia.com, krzysztof.kozlowski+dt@linaro.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        robh+dt@kernel.org, thierry.reding@gmail.com,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: [PATCH] arm64: dts: tegra: drop incorrect maxim,disable-etr in Smaug
Date:   Thu, 27 Jul 2023 14:00:58 +0200
Message-ID: <20230727120058.40132-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725142638.157449-1-krzysztof.kozlowski@linaro.org>
References: <20230725142638.157449-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thank you for catching this one! Just to be sure I tested it
on the Pixel C and everything is (obviously) working, so

Reviewed-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
