Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC87EB64DA
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Jun 2023 08:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjFSI5O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Jun 2023 04:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbjFSI4s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Jun 2023 04:56:48 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB88211D
        for <linux-tegra@vger.kernel.org>; Mon, 19 Jun 2023 01:55:46 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 31970600298E;
        Mon, 19 Jun 2023 09:55:44 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id suiuQPfcsRF9; Mon, 19 Jun 2023 09:55:41 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id AEE22600298D;
        Mon, 19 Jun 2023 09:55:41 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1687164941;
        bh=uWwCw3HJ/zL5N/neVD0JP3iqxxFlDswM9Yurgqb/kj4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=dHno3Y0kboL0Wdyax2c/TpA5hqHNY5usRQkdxqOQu5WaeS7Q9+rv02O9FuDr2cY/n
         HowOqZlV1P23voNc1nN1SlNkbyzeJ1DE/fTjQL9EVYK6nddu+fRmKldGoQp41FtJWO
         acO7LA0PBCJeU89rw90ttAeAaQk2mzFL8CO0/zwg=
Received: from diogo-gram (unknown [IPv6:2001:8a0:6a1a:e700:94de:c9a7:b15e:7a99])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id DFACC360080;
        Mon, 19 Jun 2023 09:55:40 +0100 (WEST)
Date:   Mon, 19 Jun 2023 09:55:35 +0100
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, arnd@arndb.de,
        linux-tegra@vger.kernel.org
Cc:     diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [PATCH] arm64: dts: smaug: Add EMC frequency change tables
Message-ID: <j4e7qztbxik6bojbax3bt6y44pzstm73t6kqlzkaxip3lcv4e7@zymxtbirvs5b>
References: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Mar 19, 2023 at 07:42:55PM +0000, Diogo Ivo wrote:
> Add the reserved-memory regions of the nominal and derated tables setup by
> the bootloader so that the EMC frequency change code can access them.
> 

Hello,

Gentle ping on this patch.

Thank you,

Diogo Ivo
