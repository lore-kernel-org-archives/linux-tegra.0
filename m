Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F50EB64D9
	for <linux-tegra@archiver.kernel.org>; Mon, 10 Jul 2023 13:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbjGJNSM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 Jul 2023 09:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjGJNRx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Jul 2023 09:17:53 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D23C4
        for <linux-tegra@vger.kernel.org>; Mon, 10 Jul 2023 06:17:51 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id E66CB6021004;
        Mon, 10 Jul 2023 14:17:48 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id a_pajrhNfQhg; Mon, 10 Jul 2023 14:17:46 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 82E3D6021013;
        Mon, 10 Jul 2023 14:17:46 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1688995066;
        bh=6tkdS9CDFBIvWkpqxkuqHqU3qSlWpFGhtkPgpQda7Zk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=YJ2/3cs3IvdvHFH5WvbfT/6nTqVLv5UKdQmiU3L3GK6fw0Uqyp13I2FuStsJAPWdJ
         W3gZmIa35Jz67IpyCkkgm0tuAfQIokw2x1S73Ysx7hQ7JYUSIMr/0pnLBGoMYczhu2
         Qm3DsL9zydiQfRo3svP/VbIYOV6LaE1va8SMoZMk=
Received: from archlinux (unknown [62.156.206.10])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A9453360075;
        Mon, 10 Jul 2023 14:17:45 +0100 (WEST)
Date:   Mon, 10 Jul 2023 14:18:04 +0100
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, arnd@arndb.de,
        linux-tegra@vger.kernel.org
Cc:     diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [PATCH] arm64: dts: smaug: Add EMC frequency change tables
Message-ID: <d42hi6lhwt4vmashrftdf7lsdsd4rgwfnr6uludhosz2zlu66f@klxrat4ok4zc>
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
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

Hello,

Gentle ping on this patch.

Thank you,
Diogo Ivo
