Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A8FECAAD8
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Sep 2022 10:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbiIPKgi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Sep 2022 06:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbiIPKgI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Sep 2022 06:36:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686CCB69F1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Sep 2022 03:20:44 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z21so30813472edi.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Sep 2022 03:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qRPxEH0BmsasFGXf0kFOuTMDaUftPRO1xOsInmi8dN4=;
        b=GVLcNnbVQx9Z3Z/kgLLbR++GR8NMvtqseEy5zKva63x2uyB4XsJgUbL2leZNA0FMWk
         dp7h5VsiwfnksZ4V2niCoQZJ1KPVtSzflXALo84ZWTvsKUvZRIKOivz2C30Ls/a72SJG
         /2nbgnwKxU2QTxmw3FwvEeC3KrI/s3eGAS9a6gGccNCdxTTjRarY0RuRqPo5nm1RX3ur
         ARABAZI1hJxN2SptHI+Ls37OA0MGVjpAgbusY23ePI18crvu9WyhwWo9vZUZcpT2YmLr
         S6HLnnEPdKKKCDtKEo9CC5LGgYqEkv8n2uqN41lZYDcbYW7P3F/XcdiHcyjL26+ImYQH
         bE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qRPxEH0BmsasFGXf0kFOuTMDaUftPRO1xOsInmi8dN4=;
        b=isab3DfclodZk2EjAm2vMjjuqJvVNUCaRwIZR/VTTWPWwwdWeMTwcPQ6VLZ1j2D8Wg
         /LwM2FCHK1Nqe5rdJeGasRcukzavozoxOkbO8RL4S+y4Alq7zYCEiIfiFHbkngNuy9I/
         Bv0Tk2wq//GRyuY2rYjLV92afJJ5GhElsiDRH0c/vjT7SiqKmCfHzN4Tk72vlImmftYg
         dlB7/nD5WaKa3kZGWGL7n0HJFfAfqNWTrVeQ8+4GZ3OjxYJc3OYXMU0ZdPsQByqY5kfE
         kQSiAS0/tEtIMpo2NZq88k477+FjCt0YANpGZ1o/d+YnCXVt2qHPqc6rZDcagwNu95N/
         z1qQ==
X-Gm-Message-State: ACrzQf1bFZHw41ShKZtCSgHJph2CWBpysFBzegWSdzdRYEIIeDLG1tjB
        sd0pshl8HdrFmLWHbdmqXa0=
X-Google-Smtp-Source: AMsMyM4mAAK0cfGaBzKvbXxnntafEP7K7LsD4z/SWhiWdekUK57oayChelRyx6ilxNA71Q8jPX+7jQ==
X-Received: by 2002:a05:6402:5243:b0:451:6d52:5928 with SMTP id t3-20020a056402524300b004516d525928mr3389755edd.328.1663323606786;
        Fri, 16 Sep 2022 03:20:06 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906308c00b0077fbef08212sm5707741ejv.22.2022.09.16.03.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:20:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] dt-bindings: Changes for v6.1-rc1
Date:   Fri, 16 Sep 2022 12:19:55 +0200
Message-Id: <20220916101957.1635854-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220916101957.1635854-1-thierry.reding@gmail.com>
References: <20220916101957.1635854-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.1-dt-bindings

for you to fetch changes up to cc99f95d49b3ee4617bb4154e32ae7ac14755fe2:

  dt-bindings: Add Host1x context stream IDs on Tegra234 (2022-09-15 14:05:42 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.1-rc1

Adds device tree bindings for the MGBE found on Tegra234 SoCs, as well
as stream IDs for the shared host1x context devices.

----------------------------------------------------------------
Bhadram Varka (1):
      dt-bindings: net: Add Tegra234 MGBE

Mikko Perttunen (1):
      dt-bindings: Add Host1x context stream IDs on Tegra234

 .../bindings/net/nvidia,tegra234-mgbe.yaml         | 162 +++++++++++++++++++++
 include/dt-bindings/memory/tegra234-mc.h           |  10 ++
 2 files changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
