Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28DFC43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 15:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81D6C22274
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 15:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQn4Nuki"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIPPa3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 11:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgIPPaW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 11:30:22 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77FAC0D941C;
        Wed, 16 Sep 2020 07:57:17 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id u21so10821342eja.2;
        Wed, 16 Sep 2020 07:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BavzM8dqao5JCiPkWFEijbjqferuuSqIJ7QT/mKoTAQ=;
        b=nQn4NukiiRCo18F4AEpFB+HOHN7WOI+rKirSQpjyRP4nmmO3697PAVTWv092GNG/k8
         kp3TKYaL+GKVqBfEzVKELXgdIhndqS+7gDH5LIOf2Awcr9rvxKba0usL6+NprjZo59y+
         WPWNlD8cFafBUra2EOCbqnFw5K8p4HazPUNbBx+UU7RTWsr2sOYeaViwGv3XqS3yoQ9Y
         wHAtetcNTyjbmz+LG2Dz6SNBVd2uvIpFilSf7/A4ZgdNIWZil1NME8GVqVzLN4LBnn49
         7HxREZ2eCGJCkwRIWfMDIZftQX42C8n5ywKYWOEo6MLVN2Me+zduyJ0lBaAdPEgYMMHZ
         fi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BavzM8dqao5JCiPkWFEijbjqferuuSqIJ7QT/mKoTAQ=;
        b=TXub0/Tn8OvBj2iPPdr9MNdkiIiTNOGQkzps7I/i3kMaUDA1/oe4uNHdUipIaIeeal
         ec9TNUhi6jmOwXuX4hFUheVZH9iplzl3/uONhaDhbzwPAZyGvbP13ZAIaNOIvnqemrRi
         TKg+ZK+OEP96tzSkeFY6Kt5hpPswk9vwidNcoL/+hpMOqR4zp9ZeG23gX30HXi+p3N39
         /MVUKN6aSb2Y730brJywTwW16+o6fjDBR0+l6TuZOe1Lke9whhjQhuY/qdJpQLPYvULb
         5dagtYNl34bPB0O6oRc9/+LMZqcHFAi182Sfk1Zh4d9bgLBo061uuTxh4E2AUIHel+Or
         Es2A==
X-Gm-Message-State: AOAM531uCLbaL21YydSXQ72P2U9HPWvMSgfM2OQ3PJW032bkKg5/LekS
        OnAgRWHhQyTNWVBLr8f+wTIFSr/Ykg29Tckp/ZU=
X-Google-Smtp-Source: ABdhPJx9FNTjCittOjxhqVQ8Y3/Ji00bVrlyO0GKfHoEdHIMHs+TI34YOUrZdyDTCMX0SDNkYsvmR37O4kEsPhGUX2M=
X-Received: by 2002:a17:906:c1c6:: with SMTP id bw6mr26850175ejb.374.1600268236393;
 Wed, 16 Sep 2020 07:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200916122247.534374-1-pgwipeout@gmail.com> <20200916122247.534374-2-pgwipeout@gmail.com>
 <3cdcb877-e4c7-aab8-b7f9-0c88f2247d03@gmail.com>
In-Reply-To: <3cdcb877-e4c7-aab8-b7f9-0c88f2247d03@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 16 Sep 2020 10:57:04 -0400
Message-ID: <CAMdYzYrKHBrh47PMrj=TP_FPttFOkRO2J_wrDr7oEyBNnyexAA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: tegra: Add device-tree for Ouya
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 16, 2020 at 10:17 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 16.09.2020 15:22, Peter Geis =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > The Ouya was the sole device produced by Ouya Inc in 2013.
> > It was a game console originally running Android 5 on top of Linux 3.1.=
10.
> >
> > This patch adds the device tree supporting the Ouya.
> > It has been tested on the original variant with Samsung ram.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  arch/arm/boot/dts/Makefile         |    3 +-
> >  arch/arm/boot/dts/tegra30-ouya.dts | 4498 ++++++++++++++++++++++++++++
> >  2 files changed, 4500 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts
>
> Hello, Peter! Very nice work!

Thanks!

>
> Could you please clarify how many variants of the board exist?

It is unknown how many exist in reality.
At least three RAM variants are supported in the downstream kernel,
Samsung, Hynix M, and Hynix A.
Two variants in storage capacity, the original had 8GB eMMC while the
new variant had 16GB eMMC.

>
> What are the differences between the variants?

Aside from the RAM and storage changes there should be no functional
differences.
It is unknown at which point the RAM changes were cut in with the eMMC chan=
ge.

>
> Is this device-tree suitable for all variants?

This device tree should support all variants, but I haven't been able
to locate anyone with the newer variants who can test it yet.

>
> How user could determine the board's variant?

On upstream:
The tegra emc driver will output the RAM code detected in the kernel log:
tegra30-emc 7000f400.memory-controller: got 6 timings for RAM code 0
(min 25MHz max 800MHz)
The mmc-core will output the storage capacity in the kernel log:
mmcblk1: mmc1:0001 MMC08G 7.19 GiB

On downstream:
The ram variant is output in the kernel log:
DDR Strap Pin AD4: 0
DDR Strap Pin AD5: 0
Init DFS table for Samsung DDR
The mmc-core outputs the storage capacity in the kernel log:
mmcblk0: mmc0:0001 MMC08G 7.18 GiB
