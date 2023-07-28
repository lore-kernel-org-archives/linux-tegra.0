Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A09C00528
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Jul 2023 09:41:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbjG1Jlg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Jul 2023 05:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233520AbjG1Jlf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Jul 2023 05:41:35 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44F612C
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jul 2023 02:41:34 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52229f084beso2750607a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jul 2023 02:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690537293; x=1691142093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E3R4wjBnDBMtOFENnE25FnGBV6r3mcWK08y5v73y74o=;
        b=rqARx47UfymMOYmczBXyKBnvWA0E2hC+5Dah5oW3rOCSMSmhd6Y49Y6f+E6u83ZxXm
         2vRj+AN93RZ1WnpAwDUXECvBF1Q4jYyv0B+I7XD4/9Wtirp2g5eyG4tWWijoar0gJazF
         8iTsaL86sOBbj5mEkUmPRIvaIpNCgMyiCaDAzscy2U5GnCCAD8yf8/mVgKSgal3Co9hI
         7UTLFgI2iVr1hALUKPuyFjFy6iY3hyIhXakNjT+SefSXggdT8sK9qahS5jAmmDWwHxm5
         PPjejlGjmn3hWPbb92wvbEBXQwdqdCjQMZnRfdx9+XzZuK9yD1v5wvmjxnpkpbb13HEH
         yx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537293; x=1691142093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3R4wjBnDBMtOFENnE25FnGBV6r3mcWK08y5v73y74o=;
        b=Q8LGIZpmRjaQU2SfzrK0dtUQQBYhU5su9BaWrfkSTflLeWctVfry18QntlubXDvmHH
         /bxmw3Bx3z1gEKtX5FAs7FfrV3D79zUXOviDqMTKd5l+C/VX0wr6E95OXXllyCNXWAf0
         TLVoQa5om2xaCjbCqRkEkexdKCpi4f5MUGYQcJQoea5WO25/hpx+GASQahGTaqI0lcCG
         Ky44/3IDdlGSxxb8LusSA+DwKBpSppS8oiTTZr3kE0KOAiGo5XEtdBXn1Dsx7yu0kGp/
         VEyhpUZ5fPm0q9mfWNotM3uayZROhXDq3Vyl84SW+GrZqs+5z5uH6m60lhqalKwwbMJw
         y9Sw==
X-Gm-Message-State: ABy/qLacgGKN3SrMB84yDLUKRsyNpxQBMrKzXzUmA8ZoeqIilwCsjJ+o
        XRvMzWPPr1WQC/RAPnNKFtA=
X-Google-Smtp-Source: APBJJlEDOX6YqWMymx/XeVyFp1/FBsxAmn1xCe5AQCPwQYymOBAKKg/VrTTWbk2IsdMQ7Uq2tQkVpA==
X-Received: by 2002:a05:6402:10c1:b0:522:200f:cc50 with SMTP id p1-20020a05640210c100b00522200fcc50mr1795924edu.19.1690537292887;
        Fri, 28 Jul 2023 02:41:32 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u19-20020aa7d993000000b005222aee9ef9sm1567322eds.97.2023.07.28.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:41:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] soc/tegra: Changes for v6.6-rc1
Date:   Fri, 28 Jul 2023 11:41:25 +0200
Message-ID: <20230728094129.3587109-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.6-soc

for you to fetch changes up to 10f975f8b0e8e563bf1e5c2f5e4ebada29fa7edc:

  soc/tegra: cbb: Remove unnecessary print function dev_err() (2023-07-27 18:46:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.6-rc1

This contains a selection of minor cleanups.

----------------------------------------------------------------
Jiapeng Chong (1):
      soc/tegra: cbb: Remove unnecessary print function dev_err()

Rob Herring (1):
      soc/tegra: Explicitly include correct DT includes

Thierry Reding (1):
      soc/tegra: fuse: Sort includes alphabetically

Yangtao Li (2):
      soc/tegra: fuse: Use devm_platform_get_and_ioremap_resource()
      bus: tegra-gmi: Convert to devm_platform_ioremap_resource()

 drivers/bus/tegra-gmi.c                |  4 +---
 drivers/soc/tegra/cbb/tegra-cbb.c      | 12 ++----------
 drivers/soc/tegra/cbb/tegra194-cbb.c   |  4 +---
 drivers/soc/tegra/cbb/tegra234-cbb.c   |  3 ---
 drivers/soc/tegra/fuse/fuse-tegra.c    |  9 +++------
 drivers/soc/tegra/fuse/fuse-tegra20.c  |  2 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c  |  2 --
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  4 ++--
 8 files changed, 10 insertions(+), 30 deletions(-)
