Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7962C77B60
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Apr 2023 12:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbjDCMfA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Apr 2023 08:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbjDCMe6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Apr 2023 08:34:58 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFBE44A6
        for <linux-tegra@vger.kernel.org>; Mon,  3 Apr 2023 05:34:57 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id b20so116722260edd.1
        for <linux-tegra@vger.kernel.org>; Mon, 03 Apr 2023 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680525296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRz0z+JkOW+ffsm9FTlOV9QzqEs4yOWOrNFHA5kxiYA=;
        b=SGMEdgLuzCGG50lGUoc64MUIDsJ1p4EHfysj5F26/SLYsYNbhvMY7oqoq4k0GHc1hc
         FJA+TKUdYVNHy1Zuzt0mxzYmzBmqbPIuSQN7REVduPLEJopYeSrmf4rg1lM6pavZ/ffZ
         ckoOAOWSeS84gbAqKdOtVV5/K35gXN6UmyrMA/7oMVJVOEby6MMEeD9cIkmmY7nE6gLY
         983m9Xq5Sa1qtK3XbW+RBmcbovdSxsTWB6Z//35zitsYiaQv8i67LEIcViwA80Jlm+iZ
         4SAtVDYFPyOL0LNGRkxEz236sJ2WgnLxHLji4R8k+ptCcqG+yygaCrLFqRq1MSl3NmhD
         nQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680525296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRz0z+JkOW+ffsm9FTlOV9QzqEs4yOWOrNFHA5kxiYA=;
        b=gnPLe8qJ95GlBKiGB5EiBxjBDF55z5Eq87gHC0lVmPGmks4ZU0Ns9adWZ22sI6uWgi
         d6cn3i1oSrX7dkUamXHUg8/wFucpbYkDntuCznj4qWp75mRwe3tf7MFeZFHpIX9zVL6l
         ouKwLJlM0ioMdaYee65dO4HTFoaGMq5cyxC7RGwIj9Mw6TMAAElyFuqYxX49xEazLWwP
         nGNMiBkYQTXGF95HWgyv8AFL3e5CAE1MjdtDBwI7a5c+aohtGunfejEuZuAmuAG8rl3w
         hXOGBuY1C+taLuv3QwKhJyab+mfFGn2mMXa4V+5K3JwM+zghlHPgY9AoTdk9FWW7qde/
         Gc9Q==
X-Gm-Message-State: AAQBX9cEdvsG30eAqPt23XIl+ebdaBzrBHohBHT/H7CR2wbHjYODkX1X
        BlQQYJAgiq9ecd+/FJJ3hvB2TtiTsbs=
X-Google-Smtp-Source: AKy350avKcUKuj7EQWXg9YCfZ0wTN1n6S1fyrLOcaJcViepPNUUg5CXWjlUCv1J9kFiysR9vLTa2sw==
X-Received: by 2002:a17:906:7214:b0:905:a46b:a725 with SMTP id m20-20020a170906721400b00905a46ba725mr16359724ejk.16.1680525295831;
        Mon, 03 Apr 2023 05:34:55 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u25-20020a170906109900b008e22978b98bsm4506797eju.61.2023.04.03.05.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 05:34:55 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Add the PMIC wake event for Tegra234
Date:   Mon,  3 Apr 2023 14:34:51 +0200
Message-Id: <168052526462.1061641.12340186102533226512.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230306150900.123616-1-jonathanh@nvidia.com>
References: <20230306150900.123616-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Mon, 6 Mar 2023 15:09:00 +0000, Jon Hunter wrote:
> Add the PMIC wake event for Tegra234 that is used to bring the device
> out of system suspend for events such as an RTC alarm.
> 
> 

Applied, thanks!

[1/1] soc/tegra: pmc: Add the PMIC wake event for Tegra234
      commit: 161e0f78b396823e8596ae5e709d93acd914dad3

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
