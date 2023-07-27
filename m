Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F190C001E0
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 16:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjG0Qrw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 12:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjG0Qrv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 12:47:51 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F61271B
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 09:47:50 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51e619bcbf9so1483895a12.3
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690476469; x=1691081269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtwS742If2e0anwW5A1R8s17Gkjks0dCNbZpH9kuxt8=;
        b=a3ExjyDXUhoG3cZhu6fFc5HP+N60svIVVgG5Agamupq87WkmuQhn9msUV3N/yG90rN
         Q+BuO9dAmirX9ecc/JaWSQefKBrFPQ6uoTjqjkyKl+vS2LxgtHMFZoPm8klMHNDkCtkr
         ln7Ou8TbNc+HgNdPKYNuonraZfPz0dsrdwG/Dfc6CqhI4DMrToeObyJ5IzXlf/WzaVWT
         8xvUBr3ALS+pNSk84gd6VHphL2gwLZgkIJSU91+t1bTFOCQgUzV7SelbkDlcraRh7LA8
         CqrTBf5UVSBAMMZehEi8L8W1BPvLQpd2eJ+yfNqTRPyNSYZGRpA3JGriZux4Wzdgb3xh
         Pk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690476469; x=1691081269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtwS742If2e0anwW5A1R8s17Gkjks0dCNbZpH9kuxt8=;
        b=iLF35DxEZUFirFmCgQ7Xh+4NKGFRNvY09jqLHQMFixigZrGkNXsksmpTprjP0Ut5qz
         kDc2NTVPoeDA3vchkqliNb3nOgjXBze0FpVTGyuQsczJqu6zKypZJ+4oTVwwmn3JpOss
         uuBi+D1nG80XtKr2aAZH2KDu6fIKPgKTZizG0DChuZKFV9Avgq7V0qoJPrSWztbY7qYa
         7dhqCoXPIgOVLWWvi5lFMC8/9cH/pIHzaAytqZxdZwXZLKo98JOAopILUqzU+ZmQfyOA
         feuy+HWSX1OZPCnhA0ZtP3b8L0aDeAenfYwTEgMTsR/lmlaH373saP97wN9RxOtKXcyn
         iEFw==
X-Gm-Message-State: ABy/qLY6iQAZRfDBdBpljCiLKFvZfpiHwPqgN/iRP9RmOJcgK817FFee
        /f2stld6qo/8ZfBe5PVtF7O/nJAk2rU=
X-Google-Smtp-Source: APBJJlGi2c5Q+X5T1Xit3fmkGK4Wg5vVuqBfosD9U8cYHTwhQMgYziaBfDkGLR0Wvgs7WO/lfgTwEg==
X-Received: by 2002:a17:907:8b0f:b0:991:c566:979 with SMTP id sz15-20020a1709078b0f00b00991c5660979mr2203570ejc.36.1690476468734;
        Thu, 27 Jul 2023 09:47:48 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m17-20020a170906849100b00992d70f8078sm966955ejx.106.2023.07.27.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 09:47:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: fuse: Sort includes alphabetically
Date:   Thu, 27 Jul 2023 18:47:42 +0200
Message-ID: <169047644216.3097949.17627464521911906264.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727143246.2749936-1-thierry.reding@gmail.com>
References: <20230727143246.2749936-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Thu, 27 Jul 2023 16:32:46 +0200, Thierry Reding wrote:
> The includes were slightly out of order, so sort them correctly.
> 
> 

Applied, thanks!

[1/1] soc/tegra: fuse: Sort includes alphabetically
      commit: ac60f06215fda9ea10ac0b2a3bc3a1e7ba4a8fd1

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
