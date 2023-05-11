Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775E4C7EE24
	for <linux-tegra@archiver.kernel.org>; Thu, 11 May 2023 08:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjEKIh0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 May 2023 04:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234868AbjEKIhX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 May 2023 04:37:23 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9BF46B6;
        Thu, 11 May 2023 01:37:18 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 4F7AD6001424;
        Thu, 11 May 2023 09:31:09 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id lv32afTCMC3r; Thu, 11 May 2023 09:31:06 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id BA6D3600140C;
        Thu, 11 May 2023 09:31:06 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1683793866;
        bh=lR2mJAWJEBdHmig4HgaXEsj6P7lJAZFIeKzXrZu0rb4=;
        h=From:To:Subject:Date;
        b=u/R8Flyt7pFOdAwDAvF802kIeBDa+JsblRBqsXS7I+JH3TCO5ljNDouagrArlEHcT
         QqS9S9CUtk9GDP/LDa0vDnyvtaTj9tclMGYJsyRAnvmn26ZMfTO3v7IEeUqWb2rqt9
         dB3Qs3hFCbM93q79nRVd7XMJA/x5he6+QaQcYZkU=
Received: from wslaptop.Home (unknown [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 6D396360072;
        Thu, 11 May 2023 09:31:06 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, diogo.ivo@tecnico.ulisboa.pt,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 0/2] Enable GPU on Smaug
Date:   Thu, 11 May 2023 09:30:59 +0100
Message-Id: <20230511083101.78516-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

This patch series enables the use of the GM20B GPU in the
Google Pixel C.

Patch 1 adds the needed regulator DT node for the GPU.

Patch 2 enables the GPU in the DT.

Best regards,

Diogo Ivo (2):
  arm64: dts: tegra: smaug: add GPU power rail regulator
  arm64: dts: tegra: smaug: add GPU node

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.40.1

