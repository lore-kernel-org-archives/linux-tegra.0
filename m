Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFA0C4346E
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 06:18:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4871620BED
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 06:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUx7CMc2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgI2GS5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 02:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI2GS4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 02:18:56 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E456C061755;
        Mon, 28 Sep 2020 23:18:55 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id s14so3280173pju.1;
        Mon, 28 Sep 2020 23:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bR1c5zVE1/wtGNRr4qAxGHHpVpEDG879HmZTYWlE/G8=;
        b=fUx7CMc2F01xKbLmoLOoCpj/jkDlUK5sAdtumwTJWzrSIpPfAAEs4WVMaMmzXJfwuf
         W5W/mq16+8r6JKDur6Zdc7IehJAbBu7y2seYQWXnRhHAIMeJg4Z2ZzCgGBliT6t9N8TA
         LGTrxiKobVEpcojQg9Jv2g8paOfVdkk2NMNyGuDL4AARbl75lirK/vdu1tlkUvnIy7hJ
         Pny1ylEvtffgCTj0bSkihmjdmaBZ5DiDc+++4RbD80cxfkpsAm/0g8lXbWon62XsqxBM
         sJExeBaF7IDpPl/U+aRTX1Ltp0UNeQyyH/9Aujy/vhrC3zEd3hwYAJo7aoJyQFPtXrDl
         22Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bR1c5zVE1/wtGNRr4qAxGHHpVpEDG879HmZTYWlE/G8=;
        b=k6LmKkghcOAGriST8LAoFwTQL92bvVro73Jp+EWDO495YuFMNo/4Q3vYxB357vGnlu
         2LtmWuUxkuypfC9ZJk5TSgU1ycqN5V/87f/daiKjcvxyGSfU6Pm/Ep6OPSVyQvt18o2g
         Z7w+cQIhCplJgFknWvx0AFZ3T1qAcWgqbJHpI8vCN/13vVLD42U1phHocFIHguwolRXy
         6w3aMDGmxw0f1LFhShBHTOWadKWcRVhkllTTHtc2E7WC+zMvfFVNJbRUpF7m5Kyjq1At
         nSi0sbH7WqTlvVwUIqlNr6nall0/aMSC3g5UfgHPq2OA/RV1gmcJRCToOFFXGucv9r3r
         VVWg==
X-Gm-Message-State: AOAM532pW2aquICPOuv5CJThS6twYunfWNWqcdzwdUbQ4056sOAtlr/f
        oTOyVL70ki2PsfrWcKD5epw=
X-Google-Smtp-Source: ABdhPJzQmA4H34YEh2eRTAYZ9Szt4fmd9lwDaFSywAcg4Rghwf09cTORXan9bkhbsq+oer8yiNUXbw==
X-Received: by 2002:a17:90a:b314:: with SMTP id d20mr458540pjr.7.1601360334679;
        Mon, 28 Sep 2020 23:18:54 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id cf7sm3280562pjb.52.2020.09.28.23.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 23:18:54 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, hch@infradead.org
Subject: [PATCH v4 0/2] iommu/tegra-smmu: Two followup changes
Date:   Mon, 28 Sep 2020 23:13:23 -0700
Message-Id: <20200929061325.10197-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Two followup patches for tegra-smmu:
PATCH-1 is a clean-up patch for the recently applied SWGROUP change.
PATCH-2 fixes a potential race condition

Changelog
v3->v4:
 * PATCH-2: Fixed typo in subject
v2->v3:
 * PATCH-2: renamed "err_unlock" to "unlock"
v1->v2:
 * Separated first two changs of V1 so they may get applied first,
   since the other three changes need some extra time to finalize.

Nicolin Chen (2):
  iommu/tegra-smmu: Unwrap tegra_smmu_group_get
  iommu/tegra-smmu: Expand mutex protection range

 drivers/iommu/tegra-smmu.c | 53 ++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

-- 
2.17.1

