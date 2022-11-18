Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FC6C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 12:16:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235220AbiKRMQT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 07:16:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiKRMQS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 07:16:18 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A195D8433E
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 04:16:17 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id v1so8926910wrt.11
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 04:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6xYxrdgg7kHc9dVUV3Wt8PZSVz1mE/x85HmVohO2UuI=;
        b=eQSiTmDGqok7KcCLhd923mgK8KBY5N1rAKEsz/t+dg7vNHvdJwWkX+3c6Ad7pu/8Le
         ls4gvLoy5FexFqD2IjwFGy9oJYndEkR4Dvb9IRGC1BjybU09/tycC5YXpWB2YJ492jFD
         kUZ6inJQ7T/PcFaxO5KxvxKXHXXpyA+2Ao6TyARiKfnOZ8Z6RD4s0T7GXcZ8RlFR8/dG
         TG59BeXuX2VEWy86Qez+/iFNo6zDB3SCLSt06BEN54SfoY2/x3qLw6oIHqG3OpvhN2RL
         aBTONhUyVI1qj7Nwo/OK8cemypXswgTidGG+Ms8UOcAo4waRDP5az7yz5FBViiDSslvq
         hJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6xYxrdgg7kHc9dVUV3Wt8PZSVz1mE/x85HmVohO2UuI=;
        b=K8Omg2CxnSR7gjY22ZcJkRjsuruqFOUezIFnZvKbnFl6LPNdibvcb/VRJb5zfEBwjs
         PiqEAmp/klYWOOhg8Gt0dztgIf/Ghrzp7lnU+X6Xh++EEVPk/HUvrVUHBvv27v9YQjgR
         AXOQkJR6n7KMIrt5q5Fozm2AWiCp1sOIVS+THKAsVzbFng0kOSnzyTWhAtV0VuR5XIJV
         AWIFmpm6AYoIjepHPYxg+qSWyIh0OlMGKC13c8RpFF9KJ99iTyFQjR6eQPJNcs++QHiv
         sgjLsUpTGf9nQrYcvyxhwZRSeeAA1EtwAITt0t2KM5rKef3wq74CdRLASDgf6v2oOaHk
         ZhhA==
X-Gm-Message-State: ANoB5pn3IJhawPM0Nbygep2XDNWc6TLAyummBKRWLxcOT80EBYKd0ykG
        61OlIV3GqTtFD+hpv55F7KgPAFMuMio=
X-Google-Smtp-Source: AA0mqf406NGnh6OSMy16COVi7kAaSZweiyf5iBaetxBjX7GJpAlgQuVeyBaEmgXIUFCRIeX2f0wmFg==
X-Received: by 2002:adf:f849:0:b0:236:57e8:c79a with SMTP id d9-20020adff849000000b0023657e8c79amr4377484wrq.321.1668773775901;
        Fri, 18 Nov 2022 04:16:15 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i3-20020a1c5403000000b003cfc02ab8basm9057976wmb.33.2022.11.18.04.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:16:15 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL v2] drm/tegra: Fixes for v6.1-rc6
Date:   Fri, 18 Nov 2022 13:16:14 +0100
Message-Id: <20221118121614.3511110-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave, Daniel,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.1-rc6

for you to fetch changes up to c2418f911a31a266af4fbaca998dc73d3676475a:

  gpu: host1x: Avoid trying to use GART on Tegra20 (2022-11-18 09:33:20 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v6.1-rc6

This contains a single fix that avoids using the GART on Tegra20 because
it doesn't work well with the way the Tegra DRM driver tries to use it.

----------------------------------------------------------------
Robin Murphy (1):
      gpu: host1x: Avoid trying to use GART on Tegra20

 drivers/gpu/drm/tegra/drm.c | 4 ++++
 drivers/gpu/host1x/dev.c    | 4 ++++
 2 files changed, 8 insertions(+)
