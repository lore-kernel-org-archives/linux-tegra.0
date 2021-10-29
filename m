Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46246C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 22:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 292D060F9B
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 22:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhJ2WKR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Oct 2021 18:10:17 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:33655 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhJ2WKQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Oct 2021 18:10:16 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MVe1U-1mEz1q2UWy-00RbHc; Sat, 30 Oct 2021 00:07:46 +0200
Received: by mail-wr1-f47.google.com with SMTP id i5so11186586wrb.2;
        Fri, 29 Oct 2021 15:07:46 -0700 (PDT)
X-Gm-Message-State: AOAM530zAxCjMicpBTuhGaAjAnYNseOVkB9Nksq6wOPF8UaslfSeDTo3
        QdsQQJ9r3bX7kNaocYvZriWTLrCMCy5FKRsAxzM=
X-Google-Smtp-Source: ABdhPJy9q83Q+zKzP+mpNHspSVrW4Epj1qDhMuhA5GsfdBs7+QZy8b+7FEdVbub5PxTREyNTQwzh6qYmt5/gpc7nXqo=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr14763784wmj.98.1635545266183;
 Fri, 29 Oct 2021 15:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211029205945.11363-1-julianbraha@gmail.com>
In-Reply-To: <20211029205945.11363-1-julianbraha@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 30 Oct 2021 00:07:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Q65mw+sXm977sxk6XWfAnhe9HQyVC62n8Hd-PERr_TA@mail.gmail.com>
Message-ID: <CAK8P3a2Q65mw+sXm977sxk6XWfAnhe9HQyVC62n8Hd-PERr_TA@mail.gmail.com>
Subject: Re: [PATCH] soc/tegra: fix unmet dependency on DMADEVICES for TEGRA20_APB_DMA
To:     Julian Braha <julianbraha@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        fazilyildiran@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:JlXsj6c0EG0JRrUm8B5KQmIaoiCwi73iMHkYZu8xCASD5PIJpDw
 KgzXnHk+yt3rBec9hlsbYj70Ohx/n5IKfGejILAemXryicdtWZQqnsE34bXdYpFSHeudSSq
 kmOnBEL9k2r6iAQjOc/Y7w32mHD4G3t5QWmUEgskLKXMFwu1TkqCUBTUO/b+9R0oOWmkk2s
 FVmE/q/PC21VN7aUqwV+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w1kyWTyRmq4=:VgDwXDzS9YSr5oToaZ6MtV
 xgtsV75G0GmaNAhoQE3YpT/OhR1AkV9zVDBMSWqOLSDkoWoI2wSU90xZwm90Y1pOmbZPJQRdU
 B8v/xxr5LTqFCf8ib0HIxP7qicCUX0d2YJtME55BscNOaBUzzK5Vn+xFTPit+i+goWlu2evvX
 bXXt/dbKqstlbzGO/3+//fSQuYNhoLAG2EBHPcCZyJSdqUmRRSulhMLKR6XV8skjlA6eDXBGn
 VwISvRtWr4gT/0RO3gzlfTHlrC/bgWNYEMyiffXqPKMWF/sRgaAv/ZVf/RrlhiYDM4mdCI3o7
 CfB5ggjjDnaeI1TisD7EO4tp5uJkHOsmRLHez4n3uudlgMIhVL5kSLboJqP/+k446IVRcm4Js
 f+1ZQ9K7IoQrEzNniS1bDnHY3ofZd8iUue4xCSAUmNMIrOdhPy4zv2LS4YWEgO/lGMaMux6x2
 hbiA4WthQTn3+pQj5G9lqIglCEbvgT+49vWjCi9eSi+9isX+TnU5g0ggZHLKuwSd+19RQ8PJx
 mxfv5Ik+xrRZyOQ47/vsPU5CT2D1vtKewWT0ivpYzaixoTEEADYpDxI7IBUTSVqGe/kYWjvnM
 sjjyntr5lUnzZCo7qdjiJVm5eTJI0h0Rd7RktyWQsl/xzHirGgAlgxJ7AQUwPbpKtqlItkcuO
 IM9XTWGtv3knLa+7hWPCTuOrshZ641n84sg5xCtN/Ht3e+9BG27BEMPyBPN17bQho9wKM+sq0
 pa4IIIZ64LoyLsoRHKTjxjBCSUoEiXSxyBwSD8o1yegDA6WrNNnYsw7xnqN0Jysw64mrdcSN+
 MIaCddEerGyWVepiGyI630jNoXbi0ajbxohAIr/EQwG0NssTb0=
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 29, 2021 at 10:59 PM Julian Braha <julianbraha@gmail.com> wrote:
>
>  drivers/soc/tegra/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index 8b53ed1cc67e..ee7f631933c2 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -136,7 +136,7 @@ config SOC_TEGRA_FUSE
>         def_bool y
>         depends on ARCH_TEGRA
>         select SOC_BUS
> -       select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC
> +       select TEGRA20_APB_DMA if DMADEVICES && ARCH_TEGRA_2x_SOC
>

Is this actually a compile-time dependency? If the fuse driver merely
uses DMA and assumes that the TEGRA20_APB_DMA driver is the one
providing this functionality, the 'select' should be removed here.

        Arnd
