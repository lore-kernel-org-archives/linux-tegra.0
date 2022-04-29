Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6416BC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Apr 2022 16:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378887AbiD2RCN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Apr 2022 13:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbiD2RCM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Apr 2022 13:02:12 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C33AF1F8
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 09:58:52 -0700 (PDT)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 4E83FC5317
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 16:49:37 +0000 (UTC)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 28AA04000D;
        Fri, 29 Apr 2022 16:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651250973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=EdxyoFdn7bbnBJZkp5jnhhBuwgyzjaVc1eu8lrVYZ0U=;
        b=FUrrUxOgVbWThnjLanOijRGYbi19CpBKYjLko6FoB8/s8LY/kBmN4CbLlIypgcz636WPdf
        D7D6PGvgidhvvd5YYaTvoR5/as7clUu5DK8LYhozDYQjLUCM2IY7Gh85uMrA7cjKA+xf8a
        Vdv+YkWC2RRRlfQKwlnSICNtn/YnmwlbdMZp3ibR1omZ4KmKHVLaFvrMzKbM4oE0NAgamE
        k8yeWpDvETGqbSSHNQN19fTwpxfSucd+V99DWNm0ZTBBIpZ6QridvY/jQ16/OV17X5n4ar
        6FcE+6hK9Ak6hswIH0o6ka+NGSPt6oQgCtvdVFD6/VPgzy9gcur6si5pM6Csmw==
Date:   Fri, 29 Apr 2022 18:49:31 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     linux-tegra@vger.kernel.org
Cc:     thierry.reding@gmail.com, dmitry.osipenko@collabora.com,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Tegra20 parallel video capture driver
Message-ID: <20220429184931.69591698@melee>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

I am working to implement a driver for the Tegra20 camera
interface (VI) and have it merged in mainline Linux. I have already
done part of the work, but now I'm facing some difficulties, especially
with respect to interaction with the syncpt feature of host1x. I have a
few questions that hopefully someone here can reply to, but first let
me lay some background.

First, the good news.

A good thing is I have an old reference image using a vendor kernel
based on 3.1 which works and I can capture video from a parallel smart
sensor in YUV. This is on a custom hardware.

Second, there is a (staging) video capture driver in mainline [0], but
the huge delta between 3.1 and mainline makes the two drivers not
trivial to compare.

Now to the bad news.

First, that the mainline driver only implements CSI input for
tegra210 and I only have a parallel camera and a tegra20. The
tegra20 documentation I have does not document parallel parallel video
at all.

Second, the VI is heavily based on the host1x peripheral, and
especially the Synchronization Point (syncpt) feature. Syncpts are also
barely documented and I don't have any previous experience with this
kind of device. And the syncpt (and perhaps host1x too) implementation
in the vendor kernel vs mainline is very different.

And here's my status.

The mainline staging driver is already structured to support different
SoCs, so I added tegra20 there, initially as a copy of tegra210. I did
the same to add VIP (parallel input) support in addition to CSI. Then I
filled the gaps as far as I could and now I have register access in the
mainline driver that produces pretty much the same writes as the vendor
kernel does, but it does so using the same driver structure that is in
mainline, quite cleanly.

Now I am stuck at trying to understand how to make syncpt code work. As
said the syncpt APIs are very different from what I see in the old
vendor kernel. Thus I cannot try to do make the mainline driver behave
like the old one. Moreover the mainline driver does many more calls to
syncpt code than the old one does.

And finally here are some questions.

1. Is there any good documentation on host1x, especially syncpt?

2. Is the VIP (parallel input) section of VI (video capture) for
   Tegra20 documented anywhere?

3. The old driver accesses the syncpt using fixed IDs from #defines (15
   for VI, 16 for CSI), while the mainline driver uses IDs obtained at
   runtime from host1x_syncpt_request(). Is it correct that one can use
   any of the 32 available syncpts, and the old driver using fixed
   values is just an implementation choice?

4. I am currently working on a version of tegra_channel_capture_frame()
   [1] for tegra20 VIP and other code involving syncpt. The mainline
   driver calls many different host1x_syncpt_*() functions, while the
   old driver does call very few of them. Can anybody clarify the
   meaning of the various syncpt calls?

5. In tegra_channel_capture_frame() the call to host1x_syncpt_wait()
   always returns -EAGAIN. Where would you start to investigate the
   reason of this timeout?

I think it is enough for today, thank you in advance for any feedback!

[0]
https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/tegra-video

[1]
https://elixir.bootlin.com/linux/v5.17.5/source/drivers/staging/media/tegra-video/tegra210.c#L325

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
