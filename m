Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DD6C433DB
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 02:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C875A64D79
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 02:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbhBDCi2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 21:38:28 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:57890 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234266AbhBDCiZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 21:38:25 -0500
Received: from mail-lf1-f70.google.com ([209.85.167.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1l7UWc-0003cv-OC
        for linux-tegra@vger.kernel.org; Thu, 04 Feb 2021 02:37:42 +0000
Received: by mail-lf1-f70.google.com with SMTP id c2so1221192lff.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 Feb 2021 18:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=azbWs7ZD4+6Ar0t1pBb2H4Mtgu0Vsr9n0qu2CiY2eBQ=;
        b=Xk7nKy+gsbSa6p11qQIjKQsDPPB6v0CP2XkI/32BAdwn9OCdUjyLe0f1XmmwY33XQW
         A57sx2yIVa9hyi+9p5UrC8lp1l+uIGdg4NF3i8kKREYhkVGOqvk+vai33id0rm6XYkYA
         wRXkxS+lhAE2ZFG9vN/U2kkj7yj41n+PRR8OXCPDOVBTM1pmW83qNmG8EuJRuSBoPHu3
         DfZra73CNXY8VYaHiy+94k17+BamR9N2qI8TsD0zES4tYdxYkmTBlx9A8gv/wrkEQM+G
         RVaLqA8AkY5WnvnKo1CZczgmzgk0fpUt2gDA8AIJqkbnzxLGaPdmIgG/ubYjbFfSczOt
         3Z7g==
X-Gm-Message-State: AOAM530/5vcCy7pdGyfleBYVpp7TL0t0pE3fyDtnhWIAgB4wxfHccCZa
        WcPmZIp3W8wzXTJ8rxtmgvKemiOq4w/pe44VbSnKINSKmIMogKKyu7KFVkbaAOY8GPlktSFIRXe
        z27ZmYaXekjRPcfM2pm3q/XyExyfjUdvmvXdvBgKojHxZJgkg+57l2UtW
X-Received: by 2002:a2e:9bd8:: with SMTP id w24mr3423327ljj.126.1612406262243;
        Wed, 03 Feb 2021 18:37:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEVPLLXFO6iRnQdbK0dcPElIqzITbQ+eHDsyN1Bhrh8vZrbecO5E15DYaFFP78Dihi5Tyi32Y7L9+TnnLVIdY=
X-Received: by 2002:a2e:9bd8:: with SMTP id w24mr3423316ljj.126.1612406262014;
 Wed, 03 Feb 2021 18:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20201201213019.1558738-1-furquan@google.com> <e77e0569-568a-f7fb-9f0d-e64943b467f0@gmail.com>
 <CAJZ5v0jhniqG43F6hCqXdxQiQZRc67GdkdP0BXcRut=P7k7BVQ@mail.gmail.com>
 <X/2fzghPXnuDNBPU@kroah.com> <CAEGmHFEpPTuRuWFt0ba022BmGfaDmSTAgEApW9EzAa5CitmtbA@mail.gmail.com>
 <b4a931cf-5974-64d0-fdf2-693e418f3110@gmail.com>
In-Reply-To: <b4a931cf-5974-64d0-fdf2-693e418f3110@gmail.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Thu, 4 Feb 2021 10:37:29 +0800
Message-ID: <CAAd53p6PtdCRe50PFdn35S1mXHBACKUpmVVcE2qfZgVT3MKj5Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: core: Detach device from power domain on shutdown
To:     Furquan Shaikh <furquan@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Furquan,

On Wed, Jan 13, 2021 at 10:31 PM Dmitry Osipenko <digetx@gmail.com> wrote:
[snipped]
> Thank you all for addressing this problem!

Are you still working on the alternate solution? This patch can
address S5 power consumption issue for some laptops:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1912935

Kai-Heng
