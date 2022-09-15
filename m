Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EEAECAAA1
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Sep 2022 17:28:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiIOR25 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Sep 2022 13:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiIOR24 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Sep 2022 13:28:56 -0400
X-Greylist: delayed 108957 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Sep 2022 10:28:53 PDT
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14C49C1E9;
        Thu, 15 Sep 2022 10:28:53 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 130CD600877D;
        Thu, 15 Sep 2022 18:28:51 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id Iz1jkrXv98L6; Thu, 15 Sep 2022 18:28:48 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 98B476008777;
        Thu, 15 Sep 2022 18:28:48 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1663262928;
        bh=mnGCfMED2lxDnun/7mMj+BV+IXlh6vYMUbEN10N5x10=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=nSXDkOus+D3A8GgGdGQMukCCKNoKeoEAjULrD+QB1aBWwjkkg6WsTH7TEgkQTEb07
         WoSWB5fXiXbvVj9sfmMq115jxodQyU5afVPO3IM3BbY8LjYmAGYUTO7i//IDgyQY97
         w4vYRBw+BpwKwSwIzRXqEA+qqk/UrKKHxxNPZDvQ=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 5EEDB360095;
        Thu, 15 Sep 2022 18:28:48 +0100 (WEST)
Date:   Thu, 15 Sep 2022 18:29:06 +0100
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: tegra: smaug: Add Wi-Fi and BT DT nodes
Message-ID: <20220915172906.rjcxhxx53kdcmwuh@wslaptop>
References: <20220914111221.862929-1-diogo.ivo@tecnico.ulisboa.pt>
 <YyL+DmHdJBdoy5KU@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyL+DmHdJBdoy5KU@orome>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 15, 2022 at 12:27:26PM +0200, Thierry Reding wrote:
> Both patches applied, thanks!
> 
> Given that this is a rather old device that we rarely see third party
> contributions for, would you mind sharing some details on your setup?
> Are you running any of the after market OSes on this?
> 
> Thierry

Hello,

I am running the latest Arch Linux ARM image on it, and the 5.19 kernel,
which allow the device to be used from the TTY, since there are
some bugs in the graphics stack preventing a full desktop environment.

Best regards,
Diogo
