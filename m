Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF52C6FA8B
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Sep 2022 11:13:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiINLND (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Sep 2022 07:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiINLNB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Sep 2022 07:13:01 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BB55F204;
        Wed, 14 Sep 2022 04:12:58 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id DC2D16000867;
        Wed, 14 Sep 2022 12:12:53 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id YQhThmxqhzsu; Wed, 14 Sep 2022 12:12:51 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 73BED6007C02;
        Wed, 14 Sep 2022 12:12:51 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1663153971;
        bh=TE+9CQgt2xAzeh9uyj7cWVGFcHBh3ZaeFCVNfB2arKU=;
        h=From:To:Cc:Subject:Date;
        b=MjgauRuOqrxAfQV1uxEKWkuO7RJmfdIuF7mkNoJcRCI3/78ftcHVohDOQ0r35K47G
         TnrWmZYLcQHgJIOu7T7rX6WHZ4fHKjRTwqoIlHMJ9Msssf7DLZ4Jtf2p63vP5n2Xsi
         NbU08IhI+03H73vBgcf0JHA4ajOmBtH6/iEZ+/wk=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 26821360089;
        Wed, 14 Sep 2022 12:12:51 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: tegra: smaug: Add Wi-Fi and BT DT nodes 
Date:   Wed, 14 Sep 2022 12:12:19 +0100
Message-Id: <20220914111221.862929-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

These patches add DT nodes separately for the BRCM4354 Wi-FI + BT combo
module in the Pixel C, and have both been tested on it.

Thanks!

Diogo Ivo (2):
  arm64: dts: tegra: smaug: Add Bluetooth node
  arm64: dts: tegra: smaug: Add Wi-Fi node

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

-- 
2.37.3

