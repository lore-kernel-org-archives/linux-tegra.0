Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B605C433E6
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jan 2021 16:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2401422C9E
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jan 2021 16:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbhAEQVh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Jan 2021 11:21:37 -0500
Received: from avon.wwwdotorg.org ([104.237.132.123]:57390 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbhAEQVg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Jan 2021 11:21:36 -0500
X-Greylist: delayed 412 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 Jan 2021 11:21:36 EST
Received: from [10.129.96.243] (unknown [216.228.117.191])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 52A661C08E4;
        Tue,  5 Jan 2021 09:14:03 -0700 (MST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wwwdotorg.org;
        s=default; t=1609863244;
        bh=hxkWNrM2Fdq+D64XObCeYJ9/JwlSkaAqAhF5EH0is7I=;
        h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
        b=OIWgQYiHV3uv4F6vPqY5Be6ddjpBrHkKtXQGONPIYuCJ5otx262gvojsg0hvbRe/O
         +RctiaCxqdo0DVyBXvkoOKPQkY5Rriq7eFZy9Yu5SWBDXL33uqVyO9KTlMJkmCTU9D
         JXrEZIMVXB4LRf/jL0yj5GBQ54ruu92sPE1DlHpHtamolSgonEgZcGp9ZK0or3+YGM
         PrW1XP7BOuW/3a6FbDbFmwI+m/hS6bKsby3io8QM2gwYAtbVfqRWsTWxVIMhuaE5/5
         7kEcD2IUhL6x8xbQ+BxXUbxKHSppghLBCvHWOWTltcY8uzl5W93ITEJsv7eholQGi1
         tK6/0iP6YlS8g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at avon.wwwdotorg.org
Subject: Re: Nvidia Jetson nano - gpio pin list
To:     Onuralp SEZER <thunderbirdtr@fedoraproject.org>
References: <CAHmqvyPGUPrfyKRoOQX_mdY+Nhmaegvrzy160k737CqA9a3-7A@mail.gmail.com>
Cc:     linux-tegra@vger.kernel.org
From:   Stephen Warren <swarren@wwwdotorg.org>
Autocrypt: addr=swarren@wwwdotorg.org; prefer-encrypt=mutual; keydata=
 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 emy1
Message-ID: <e11ba370-76c4-8049-1bbe-ab98f80c34fd@wwwdotorg.org>
Date:   Tue, 5 Jan 2021 09:14:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHmqvyPGUPrfyKRoOQX_mdY+Nhmaegvrzy160k737CqA9a3-7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/5/21 6:55 AM, Onuralp SEZER wrote:
> Hello;
> 
> I was testing an Nvidia Jetson nano dev board with Fedora 33 and 34 (I
> have 2 boards) and I wasn't able to control gpio pins via
> "libgpiod"(python). Because I couldn't find a proper gpio pin
> "gpiochip0" and didn't even able control LED as well.I checked
> examples(python code ) and tried with command line tools but no luck.
> Any suggestions?

You may want to use the Jetson.GPIO library from Python:
https://github.com/NVIDIA/jetson-gpio

Even if that library doesn't work for you, the source code does contain
a table of all GPIO numbers that should be useful to you.

The Jetson Hacks website has a graphical table of GPIO numbers too,
although it's based on "global" Linux GPIO numbers which can vary
depending on the base GPIO assigned to the various GPIO chips, although
in turn that rarely changes so these numbers shoudl work OK:
https://www.jetsonhacks.com/nvidia-jetson-nano-j41-header-pinout/

I believe the NVIDIA board documentation also lists GPIO numbers for the
Nano board too, although I don't immediately recall exactly which doc
contains this:
https://developer.nvidia.com/embedded/downloads
