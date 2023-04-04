Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A25C761A6
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 12:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbjDDMU0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 08:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234758AbjDDMTZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 08:19:25 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CD040C4;
        Tue,  4 Apr 2023 05:14:57 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id eh3so129662355edb.11;
        Tue, 04 Apr 2023 05:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680610496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWpcdu+p0/E6sUTGVtKHFSC5GsGqtN7SMwVz/gyGBzk=;
        b=EaLkr8nP/08C55ln4iwIgp4kUL8ORZeCB7UHmYZ38ILW6MfyOhPVNxEbMUrkTgJsYj
         icEEZA1Uk3CytZZuFI4YLdrC/6NUFNWBgWW1BX0Ur8eK4r2u8c6HVCCqBv5Y4qOZXYuP
         /bfoGBfIkqjUHKNsMa/cko8I3GhKZ2XCp9DdwDTUTmARBm0kn3rcDOD/JTbr9KUW0XW9
         7/e7ON39d5Ypc41FLkrZ6HgZFmYbm0gtjdqV3eKntfQ8acj6ly2HVXNzq0HbglZVIK48
         a5WXone5j4gQx3rNfDP6uyoVcoraCzUPTQVES9zZNEwSEGWuYi6zd47w/bq7flUhefkB
         Fkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680610496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWpcdu+p0/E6sUTGVtKHFSC5GsGqtN7SMwVz/gyGBzk=;
        b=7JkeVFxt0i45w5LHwfExTB+w6Yk959rt+GHgtKS8sc5UKPpQVVe1NzibydWCVVpHtC
         F8plez0U/f0k0m2kyljbpNBDT5r08nuIy8RYEVdCacTb+NpsDmXFweoI3r6JMOOsyHcc
         6ZQ35x7jYYugXxl+jXBp+z6azv3XO8m0CKY6kzLt/rAzSB9uTVYf9FL3RgQok94Fc39C
         pRBF9rCraB3DpMSA9A9zog6oxZRkoEJsOeRZ6D9S0VKQMLKjI5raB7KVbqTZvYtONhfZ
         VcwvoFB6gcJIzy1hvBMA4W5UlvtxTRui2ExoH/477oo7JtMbiA74T5h+3ffwSHRNm3HV
         qLPA==
X-Gm-Message-State: AAQBX9cR2+PArdcFsSx+otR2K+uaoMSbpXEAvWUdHnZ+l83bO41R2P8l
        g/TRCUaBxq1SKJj9UhBJD2Y=
X-Google-Smtp-Source: AKy350YQdHuwC3/O3osGuzHIwHh+ZY6uPeVw68YRZlwwXBjBJLPXqU9IgqyL7LmE+ZofbSvbnFoPMQ==
X-Received: by 2002:a17:906:5a5e:b0:92c:138e:ff1f with SMTP id my30-20020a1709065a5e00b0092c138eff1fmr1860634ejc.18.1680610495847;
        Tue, 04 Apr 2023 05:14:55 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g17-20020a17090669d100b009334a6ef3e8sm5963490ejs.141.2023.04.04.05.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 05:14:55 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lee Jones <lee@kernel.org>, dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 09/37] drm/tegra/dc: Remove set but unused variable 'state'
Date:   Tue,  4 Apr 2023 14:14:46 +0200
Message-Id: <168061024449.2054665.1446031361966014884.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230317081718.2650744-10-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org> <20230317081718.2650744-10-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Fri, 17 Mar 2023 08:16:50 +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/tegra/dc.c: In function ‘tegra_crtc_calculate_memory_bandwidth’:
>  drivers/gpu/drm/tegra/dc.c:2384:38: warning: variable ‘old_state’ set but not used [-Wunused-but-set-variable]
> 
> 

Applied, thanks!

[09/37] drm/tegra/dc: Remove set but unused variable 'state'
        commit: 42d364ad88ee81356f0417170bafbdc894594914

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
