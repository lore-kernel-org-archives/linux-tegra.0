Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C1CC7EE2E
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 19:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbjFITgb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 15:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbjFITga (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 15:36:30 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E6D2139
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 12:36:29 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51475e981f0so3668031a12.1
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 12:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686339387; x=1688931387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqt4+ldB36U6xUlL2P3+WilBRNY/yfoNAfD8ECtvKv8=;
        b=KxkRdy7zWG6PkO+HLfwXa5oQ8uG/V+rXVxD1ShMYAWiADkaDefyAa/anT3cS5ql5zg
         2dcklywBbrNWXRBSTH0mmkeOCtb2UQhgHO1MPYNeGMB/9sr38rLReRz+tKNiVrjgZMMw
         e6uiF780Tbg2F8Yqi2BMMI68cbEu9jwSp2GO/uAlNeFiS1UuHnxb4Pbj8XLAX3eteqlp
         Xx2ixMYWVx7HHJ906dHkUMiCcw3dBcMDNqYmURqG+Yf5cZj6RizrLlQaxeVYa+bJfeCR
         SnACMp5r+RJxyhq5GKNXmrpBQI2l76BVOybsHjQzswk8x0zpm/LzVaEZ8zKJCP6jmD2B
         Y8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339387; x=1688931387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqt4+ldB36U6xUlL2P3+WilBRNY/yfoNAfD8ECtvKv8=;
        b=dseVEzr5hqZbIjwAIBFRvAw8W6B1VTnpwVFtPcna/xWmoy3kc0fLifmFnNG3tD9+ot
         eoh28tdOyTIRr/PvZ1puXK6/sd4u0dXz7rKaFdGH1WEt1yf1J/fSZg9cgx3M4zT0EqRZ
         iR+ZZoMuOKLKknOFlAwXEcODKJikB91t5InrDxOSdrX7VAvNnNeqPNSRrXou5TrEjS8m
         YJfU8sQbJpAJ0iGlcF6rMdOgS6pSgWLDXY8E/+8kmrkjFWyl0DSMjqb1NUSZZGzKH8hi
         qs3dtD4gu68aWw6XlP7UyAZe976MtWRMUr4n14IETKzfr8oN7vWoGdu+9jmHlBPc3QcJ
         nCEQ==
X-Gm-Message-State: AC+VfDzhTcys+lvSTje5GTU3PD5IZAh2HrZSmhOXhvoqin6D+Qktse7M
        5GAXlc9yNzfQ/ZJKjDQ4CsszJcCoeGk=
X-Google-Smtp-Source: ACHHUZ5cNYsyo0Pael7g5Cr+ko0Z0jRFoiI+oDoV5n0zWzreUXeeehUEh2ubIeqbNmXmTnANCQC6HA==
X-Received: by 2002:a50:fb12:0:b0:514:9df0:e3f3 with SMTP id d18-20020a50fb12000000b005149df0e3f3mr2355840edq.0.1686339387602;
        Fri, 09 Jun 2023 12:36:27 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ca15-20020aa7cd6f000000b00514a5f7a145sm2075693edb.37.2023.06.09.12.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 12:36:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] firmware: tegra: Changes for v6.5-rc1
Date:   Fri,  9 Jun 2023 21:36:16 +0200
Message-Id: <20230609193620.2275240-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609193620.2275240-1-thierry.reding@gmail.com>
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.5-firmware

for you to fetch changes up to 2abd484ca48f2e160c8d9c7241627c34855b621e:

  firmware: tegra: bpmp: Add support for DRAM MRQ GSCs (2023-06-09 17:17:23 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.5-rc1

This adds support for using system memory as shared memory between the
CPU and the BPMP, which will be needed for Tegra264 support.

----------------------------------------------------------------
Peter De Schrijver (1):
      firmware: tegra: bpmp: Add support for DRAM MRQ GSCs

 drivers/firmware/tegra/bpmp-tegra186.c | 204 +++++++++++++++++++++++----------
 drivers/firmware/tegra/bpmp.c          |   4 +-
 2 files changed, 147 insertions(+), 61 deletions(-)
