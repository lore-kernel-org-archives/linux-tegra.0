Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8399C5479D
	for <linux-tegra@archiver.kernel.org>; Mon,  9 Jan 2023 15:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237092AbjAIPMd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 9 Jan 2023 10:12:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237106AbjAIPLl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Jan 2023 10:11:41 -0500
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4184B37;
        Mon,  9 Jan 2023 07:11:39 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id AA7DD6007C21;
        Mon,  9 Jan 2023 15:11:36 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id i3y2-bR02HzZ; Mon,  9 Jan 2023 15:11:33 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D22986007C12;
        Mon,  9 Jan 2023 15:11:33 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1673277093;
        bh=V7NH/2+Tt1DGOWJeFKRfxNiccQGT8X/XFRYVPg4mYrM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=JZn0KZmAOwXDJ2c/+PaipKIqhHe5PoPJJA/dsZnI3CtT2BwaA2ot4nSXHPePsAtnK
         xRxtPK+Wtj0jS3UwSWUyjWvnTwNLaDviQg9PH8Un6HsCsG3kjaL+7XN/PeZR7i1psT
         7CO+GmJe8Ah20q9Y3a5B9XX0FgtWbcumO/zr3TGo=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id B31D1360072;
        Mon,  9 Jan 2023 15:11:32 +0000 (WET)
Date:   Mon, 9 Jan 2023 15:09:34 +0000
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     thierry.reding@gmail.com, sam@ravnborg.org, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [PATCH v2 0/4] Add JDI LPM102A188A display panel support
Message-ID: <20230109150934.6aho2e6dcu4stb7d@wslaptop>
References: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Oct 25, 2022 at 04:37:43PM +0100, Diogo Ivo wrote:
> Hello,
> 
> These patches add support for the JDI LPM102A188A display panel,
> found in the Google Pixel C.
> 
> Patch 1 adds the DT bindings for the panel.
> 
> Patch 2 adds a register clear to the Tegra DSI driver, needed for the
> panel initialization commands to be properly sent.
> 
> Patch 3 adds the panel driver, which is based on the downstream
> kernel driver published by Google and developed by Sean Paul.
> 
> Patch 4 adds the DT node for the Google Pixel C. 
> 
> The first version of this patch series can be found at:
> https://lore.kernel.org/all/20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt/
> 
> Changes in v2:
>  - Patch 1: remove touchscreen reset gpio property
>  - Patch 2: clear register based on its value rather than a DT property
>  - Patch 3: tune backlight delay values
>  - Patch 4: add generic node names, remove underscores 
> 
Hello,

Gentle ping on this series.

Thank you,

Diogo
