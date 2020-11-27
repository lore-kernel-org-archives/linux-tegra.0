Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5EBC63798
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDE2322240
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBlnwK92"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730916AbgK0Oni (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Nov 2020 09:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730899AbgK0Onh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Nov 2020 09:43:37 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988F0C0613D1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:37 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id k14so5853344wrn.1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KEKSlpfgpbLCs7hwatanNSP8US33gujVVxIHTOMhDYo=;
        b=sBlnwK92jyAt/OQ350OygpGMZnhlU48PAlUqKkAjF66DgKP4v+G6YcpCEng54vcb40
         20KzalTs5LizLFMhwEpbAEzuWGrx7cKQxSFEgSDOG2tC2RCaL1d2rNtiQIP4EjmjCOK2
         N8hf93NzX5pNnqbXPcrIu4eAztOyS+MYjrYFOfnCLqDaUVddZf1cVSyybhX6XFKCOTPs
         f9S0OqpsokQrziT1AT9amePClJILR2fMvVUjctHsk19pItAINMRweIbpDBwO9BpOcA7p
         etmQ1iy+QSK6yHVtkOc8+62+cUbvoyHOyEGx+QSAHdhLZxJasfpwHJEaOoq0hivHgV85
         5Npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KEKSlpfgpbLCs7hwatanNSP8US33gujVVxIHTOMhDYo=;
        b=F5026uORFyVT6Db/tuikOuPbvxBfO1YXiE7CKYyoS3fFtsi+D6ggsifu6r4owXF7nw
         Kj4T7rCh5f7sHrqgGxMGfDWHmnC2he7CH7yfcpNyRvvw1UEuuczUE0t3UwfjMwRpPhEg
         JF+ctm29f206k+Wp5Vg9cVqTU1Xask6kcTZlgM5xqaF8qxzaOv+7w9Uhc35i7ULSo1Rm
         /m5CcVw5+HKthEk8JA1ny+xJKUZEFKjzl3UfQXKAcGt6mpfxGoCvAvcZd2nmhezszZFb
         3wl/e15ay1zDLLV7hd+rDLQH7F7RyX3kfxkLLX8yUzedfQkD9FBLvlla4PmwzFaCuIVL
         qaPA==
X-Gm-Message-State: AOAM531QwnRU9lVRxI9ywy+2uba0kBV3//muZaRcw5esyFK9zQp4V/J4
        pYk6hDvg3af3FrDl9RGHVKQ=
X-Google-Smtp-Source: ABdhPJwpGWTkgzcQN4p6Qs7NL384aOExPblrvngk8bGoyYH3HKpuBmjn4V3udouj2HkRyHehxLR/tw==
X-Received: by 2002:a5d:4604:: with SMTP id t4mr10867775wrq.411.1606488216389;
        Fri, 27 Nov 2020 06:43:36 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f18sm14839458wru.42.2020.11.27.06.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:43:35 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] firmware: tegra: Changes for v5.11-rc1
Date:   Fri, 27 Nov 2020 15:43:26 +0100
Message-Id: <20201127144329.124891-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-firmware

for you to fetch changes up to 9294996f0be40e9da818ed891c82397ab63c00d0:

  firmware: tegra: fix strncpy()/strncat() confusion (2020-11-10 20:15:17 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.11-rc1

Contains a single fix for a strncpy()/strncat() issue that some versions
of GCC are reporting.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: tegra: fix strncpy()/strncat() confusion

 drivers/firmware/tegra/bpmp-debugfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
