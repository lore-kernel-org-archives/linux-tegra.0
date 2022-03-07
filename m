Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2C1C433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Mar 2022 18:23:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234691AbiCGSY3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Mar 2022 13:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbiCGSY3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Mar 2022 13:24:29 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C9144762
        for <linux-tegra@vger.kernel.org>; Mon,  7 Mar 2022 10:23:34 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id bg10so33898911ejb.4
        for <linux-tegra@vger.kernel.org>; Mon, 07 Mar 2022 10:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=grJHan079spBD1xr3tK9eEAF9VeWYCL6jyr/bfrYsbI=;
        b=lGy9Giku8oWRY3wD/gGSjrt2mWKxeYFtkDi23+qneIJF+i+a18Yw+cWqqLa1wjiHKh
         5Hz5PTKPf/g6bpIUfvwmDliodWl7GaqNkVAHoMOcSMUvBf/q32GhN7op9BWW33uwut7D
         U/4/WcqaMrOQ4bALdGf81QOQc1L6hgWHjpBbRMoDskpWfW+8S979/C6ZWpGEw8KhfCt4
         eJbDpkfcpwpIZX5zD3NUdfBsbhZo7p/D3MuR503ga2tH+n22JSZw22BPse1sNZTCvEVC
         I6Jc4F9g4piFrOVQCaLOhb8dfPtT9pxjLUIfno/P3rLB5UyW4pWsKOnO6eQVoIJHVNjj
         CV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=grJHan079spBD1xr3tK9eEAF9VeWYCL6jyr/bfrYsbI=;
        b=hDLPj0+KM7Y55z5Z1kG1EAdF/k+9uNHVYlFNDQhg11t0082rs9uPuTVFyIyeG4Qizr
         fUsx946YIHaiC888IyVWC8bT6z/G0EMQL5SBoE9QqMiM3C/ra09Z6NTst42ieT5/uEin
         IHXNJvPtoASyMjz/EPtbD91qLLM67GGMkIZJw7/C880rilk3aux6WjGe4GUJdJugJjpd
         AtMviH+Ah/AGuKtpSI3VF6JCFJsAHjAknchBctnt17c1Tq81rVC3nfnbMCndLhYt6FrB
         6erit6HR1MlNCZdbqMZKRO8EqUisYZwnb9fuPzUQbJchncgW4m3znFrTBF9sUGoxdgeD
         MxNQ==
X-Gm-Message-State: AOAM530/+oLwlU5d6c1VLo/c4uQc6bzsMc0NGjeHb55VGrjUR1ZWrJSB
        GeiFCQw15BgGEs1xZoxnruc=
X-Google-Smtp-Source: ABdhPJw6nCk3FR84fF8EPc5TTVAUIb/ZICsm7M8xvO3upk3MyqS5kFWG1L/Sud/tp7uk9rt0xRPhqA==
X-Received: by 2002:a17:906:7947:b0:6da:892f:2503 with SMTP id l7-20020a170906794700b006da892f2503mr10009329ejo.710.1646677412571;
        Mon, 07 Mar 2022 10:23:32 -0800 (PST)
Received: from localhost (pd9e51a48.dip0.t-ipconnect.de. [217.229.26.72])
        by smtp.gmail.com with ESMTPSA id q11-20020a170906144b00b006cf61dfb03esm5062042ejc.62.2022.03.07.10.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 10:23:31 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.17
Date:   Mon,  7 Mar 2022 19:21:20 +0100
Message-Id: <20220307182120.2169598-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 914ed1f56581f99094035f1cc989ab4498104e94:

  arm64: tegra: Add host1x hotflush reset on Tegra210 (2021-12-17 14:58:58 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm64-dt-fixes

for you to fetch changes up to ebea268ea583ba4970df425dfef8c8e21d0a4e12:

  arm64: tegra: Disable ISO SMMU for Tegra194 (2022-01-27 18:35:39 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.17

This contains a single, last-minute fix to disable the display SMMU by
default because under some circumstances leaving it enabled by default
can cause SMMU faults on boot.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Disable ISO SMMU for Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
