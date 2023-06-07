Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6F1C7EE23
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Jun 2023 09:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239588AbjFGJj7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Jun 2023 05:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239894AbjFGJjt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Jun 2023 05:39:49 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B423EB;
        Wed,  7 Jun 2023 02:39:47 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 081A26003C00;
        Wed,  7 Jun 2023 10:39:45 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id KLn4ceMhBpz2; Wed,  7 Jun 2023 10:39:42 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 93FDE600301C;
        Wed,  7 Jun 2023 10:39:42 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1686130782;
        bh=qzbtfG/1orL98pYWmgO/19VHpMxqF1o1TCM6v97C44A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=NFQw/reZmv8Udweim8jTuOAAaCg8M5kC7AGZLRhb67uXRQJkqwKHDOwR4knPYdAWY
         xc2dKg8dCsB5kqDlmdHS6Shbo53t/iHriH+She9+j9xebeejNWDn6l9XDZfjLodY8f
         OBkRNl7UDgONfu+rFCnF9f0ZgPeuodKKk2Nm1XfE=
Received: from wslaptop (unknown [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id BD773360075;
        Wed,  7 Jun 2023 10:39:40 +0100 (WEST)
Date:   Wed, 7 Jun 2023 10:39:36 +0100
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        arnd@arndb.de, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [PATCH v2 0/2] Enable GPU on Smaug
Message-ID: <x3ifhffuxyyxpgmy6m3d4xzpglihovfzrfp5vudinccepzkwma@hxvtze36gszi>
References: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 16, 2023 at 09:28:27AM +0100, Diogo Ivo wrote:
> Hello,
> 
> This patch series enables the use of the GM20B GPU in the
> Google Pixel C.
> 
> Patch 1 adds the needed regulator DT node for the GPU.
> 
> Patch 2 enables the GPU in the DT.

Hello,

Gentle ping on these patches.

Thank you,

Diogo Ivo
