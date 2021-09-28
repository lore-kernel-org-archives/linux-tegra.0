Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F98AC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Sep 2021 16:15:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36E4F60FE3
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Sep 2021 16:15:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241645AbhI1QRP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 28 Sep 2021 12:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241523AbhI1QRO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Sep 2021 12:17:14 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC72C06161C
        for <linux-tegra@vger.kernel.org>; Tue, 28 Sep 2021 09:15:33 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id m70so32918535ybm.5
        for <linux-tegra@vger.kernel.org>; Tue, 28 Sep 2021 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=SS56s1Nm4wcCF7mLNIAXRUKXVLxKzviCYlc6632WMvc=;
        b=elvFL0/xzb7AfAA7Q11iMoqmqVU2UHAeQPKOefpxBC2j3kRZHS7x4iOzItc8TY3XOB
         xcRSc6chobQ7mWlK7t1C0cnPvbFKbKUE5p8c3frnaGUlLInzg1kE4z9Kcuuq6esbvR5b
         ooSEyvB5/vnPW7WYymDxGOXGZV62qrAUoE7koH5UEQuj1GTp4/zHKHzGD5zQFpv7sNd+
         1L4xPXRVhK6/9bAvZHPuDM0Eq9uCLTRLPlis7JziTdNSIro81ahmRuK0v+5U/S9dpFQJ
         fbZiZUmr5ocoutnPdO+W/fIHNiX8TuG1TZvUXLxB37pfsgYHyiOFtAKi2HDhOXalNDbj
         G0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=SS56s1Nm4wcCF7mLNIAXRUKXVLxKzviCYlc6632WMvc=;
        b=oyoaqwoVO3rTJgdkCjbYAmlKcqYhyTJYYZ5bjTZ+aVgNr10m+pkfZDMOKVvlL2+jZ2
         NkUNZWAjYCS80WTQ2q6xMAGxRsVt0pRB56MrFV4ToIledRC6nhIE1yotV09Z3Z2AAZRi
         9QYF69a+takeQfGCkYtd5+uSowQeSQIcyguHHk/UZvIv3JDna7czt1NfGH04aago9FJJ
         rKVs3vJOQULCj+RE9xQaaQsk9ZsB/d7/HJ+mUEHvraTHJW7E5TJrmCjQ+et6BreQtw8H
         BmtVJMueV7Qlu9RyBM4qRyVmdB07+/E4WvMWze3YAGXYibxIggBwvoVufsC58P0sbEi3
         1Tsg==
X-Gm-Message-State: AOAM532V+Zw7sBjbtzsofSKL6CckFmTusyGSnrho8lCCxsrtVGEpcXE/
        b8zs+2sCS8Lh3wMvbjnIEzONd9Vt42aIoQDjVJkrCpepPaA=
X-Google-Smtp-Source: ABdhPJxzBoElmjzhJhA1k7PA8RJXs75VUlrdEIyzpoCp4LWYUV2SCbd+HTWcSq3K8JGviRfOaBYWwmLgZNw/H77aahI=
X-Received: by 2002:a25:59d5:: with SMTP id n204mr3266450ybb.189.1632845732874;
 Tue, 28 Sep 2021 09:15:32 -0700 (PDT)
MIME-Version: 1.0
Reply-To: xlazom00@gmail.com
From:   Michal Lazo <xlazom00@gmail.com>
Date:   Tue, 28 Sep 2021 18:15:22 +0200
Message-ID: <CAPoNHOedRjPz_RmpZNEg8UDV-WhpkTAKpfVq6=nYgfq2bQkysg@mail.gmail.com>
Subject: tegra_drm: Display end in stand-by mode on jetson nano board
To:     linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello
I have NVIDIA Jetson Nano Developer Kit
Monitor 2560x1440 connected with displayport or HDMI
OS Armbian(armbian.com) ubuntu 21.04
linux 5.15.0-rc2
and tegra_drm driver isn't working from time to time (after cold boot
or restart)
All works fine with L4T
kernel log
https://pastebin.com/raw/U9AYq5Vg

I also made issue on gitlab
https://gitlab.freedesktop.org/drm/nouveau/-/issues/117

Best regards
Michal Lazo
xlazom00@gmail.com
