Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0847AC4167B
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Dec 2022 09:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbiLVJmj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Dec 2022 04:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235100AbiLVJmi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Dec 2022 04:42:38 -0500
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C19E63F7;
        Thu, 22 Dec 2022 01:42:37 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 02E88600877F;
        Thu, 22 Dec 2022 09:42:34 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id iG2wuaXYaeqi; Thu, 22 Dec 2022 09:42:31 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C6A30600877B;
        Thu, 22 Dec 2022 09:42:30 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1671702151;
        bh=+NcjhbdWRVou5QHBVIRCejY4JUQXV0259TVu5+bQdmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=gEHd8R4sXKnYFMG3qPhYTD0fCmkVgGjcaWhVUDD3x8IQ7HhwlyVXFFZ1R8MC0VivV
         qNg1AF5KKMwtq8Ru0Hj5orRDRNoBoh0731XnT2ixgopXovdnCVpDTLQNldaDxPbBeP
         Geczbrft6q7D2tXXoKnANTtdpB6eKQ442wdagJJk=
Received: from wslaptop (unknown [IPv6:2001:8a0:fbe7:6700:65be:d034:d2ec:60ff])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 56B5B360083;
        Thu, 22 Dec 2022 09:42:29 +0000 (WET)
Date:   Thu, 22 Dec 2022 09:41:08 +0000
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     diogo.ivo@tecnico.ulisboa.pt
Cc:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        arnd@arndb.de, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 0/4] Add JDI LPM102A188A display panel support
Message-ID: <20221222094108.vfpyi4jrleuq6yqc@wslaptop>
References: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Nov 28, 2022 at 04:28:48PM +0000, Diogo Ivo wrote:
> Hello,
> 
> These patches add support for the JDI LPM102A188A display panel,
> found in the Google Pixel C.

Hello,

Gentle ping on this series.

Thank you,

Diogo Ivo
