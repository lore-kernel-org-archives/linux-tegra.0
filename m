Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2E2C001E0
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 14:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbjG0Otc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 10:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbjG0OtN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 10:49:13 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145A82D5D;
        Thu, 27 Jul 2023 07:48:53 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so4834618a12.1;
        Thu, 27 Jul 2023 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690469331; x=1691074131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vloA2isMyxI7aS0XNNyJjobfeNZEdizCBFfkCUSfiq0=;
        b=Oickxo9oblvx0EA24/d9J9LYjIxozOVfC7Vi8/NxmqtKR4Fr3NVgGnp6QOMz7qHnFe
         3vRsTUoyj489GW7B/JHGxXmj1HuG4WEljaWp5a+QOveSTRg0EyQcCdzG6QTsLvTb2Tf0
         QS03xlcSsGfijDbN4phwwt0XySlmq8DKvZDV2uC98NX5pfW6MGKEVlTFkpdz/9LAPLCF
         V+7v+ZbJNq8Yi0mHy2YFS2weq8ManGlHnfLSU1i6MqhhGa+x8NNpWDJ2norYStRlN2ab
         uf8pmpFj5XbEENA7W269lZ5UBxwBjKx/RlLHqTljqZYK9IYV8VzsG7T7OkQd/vu/FCHz
         9KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690469331; x=1691074131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vloA2isMyxI7aS0XNNyJjobfeNZEdizCBFfkCUSfiq0=;
        b=emBgrQeZNG3iO7NvyTPYk2HT9N2TXKLrj9KNaKBUpgGtbsyL6YMriEPhiXUSQidG4c
         U+EuL+LugrybydeuXCFi1U9UCe5nQcxFE4HI2lLlG5sXXhPP1u+ZdrvPODokzfmyc6dx
         gM5AmZKUzWCC4LbR9rRJ4qO5LBhM2TWFzwaCsRGwdYbRnYsLMnqDm88HO2MlW6TZbocD
         jA/l1W67U7HvalPrTsXYqModBS2z+Ibl0z9990YgQBJHN09qOsVkGrdNsAJmpE7GgGxz
         lVE7ZAj8WC+4VQDKM+VCqkkrSrIpDGvbT7JybmIEh6o6u8fnmfkcA6uUJyo7ZuIqqCuo
         pN4A==
X-Gm-Message-State: ABy/qLYS2FMF3FxlcwTmO/6B+z++R9fsAdgS8+NAsFV8CIaRUrNmiTtu
        5zaly3AhQk5DBjmX928YzIU=
X-Google-Smtp-Source: APBJJlF7AavxtdletEcIOMLFle+5V6sNQJTXLUASWQOGQ6sgiV36FaptbdeumSF47ik9x+qj+qrARg==
X-Received: by 2002:a05:6402:34c5:b0:51e:4218:b91b with SMTP id w5-20020a05640234c500b0051e4218b91bmr2904063edc.1.1690469331356;
        Thu, 27 Jul 2023 07:48:51 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e12-20020a50ec8c000000b0051e0eba608bsm718172edr.19.2023.07.27.07.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:48:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Remove {clock,reset}-names from VIC powergate
Date:   Thu, 27 Jul 2023 16:48:48 +0200
Message-ID: <169046931555.2753072.5032719991681297028.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726164318.2172859-1-thierry.reding@gmail.com>
References: <20230726164318.2172859-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Wed, 26 Jul 2023 18:43:18 +0200, Thierry Reding wrote:
> According to the device tree bindings, the powergate definition nodes
> don't contain clock-names and reset-names properties, so remove them.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Remove {clock,reset}-names from VIC powergate
      commit: 6e752d4a2f5abfda9d395eec5ac28085e36e5c81

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
