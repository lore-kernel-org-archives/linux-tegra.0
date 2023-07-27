Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AE8C001DC
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 14:49:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234101AbjG0Otc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 10:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234163AbjG0OtM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 10:49:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1109B2D54
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 07:48:52 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso71061866b.1
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 07:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690469330; x=1691074130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbLzEhTo1lrmJmJN+lSWIA8CKDomMFjl3FjK7/BIt70=;
        b=BK44O9+gRvTetVIVPHvHIaUUxKgt5JN/xI6XlQHyXQM8QmXRW1nKHW4fLLzxsoBiAz
         AnrhjSISO3CKC8CB6nWhJqqBQT7ZMxMIwu94cHKDQN9hvFeozAOUGJ32aZcjzQYotVfD
         4wYXVQYAOJ5KXrPg9O44DEy5O+OE9VQ7k87EGo25cP04jgzPjIPX7pIlzlSe7w7xns0D
         /zC55GgvEwNYkfSxMbJWHop81H3uKzIg0QFtu/ylgR6PSAnG5OPZnT9CxH9U6SekIw2O
         2hUeB13630vDKDAuil/slktS5E1ptR2JBsq5MGgXXPgAdxJ6U5xk1J8wTPXIKNbqjDNw
         MttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690469330; x=1691074130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbLzEhTo1lrmJmJN+lSWIA8CKDomMFjl3FjK7/BIt70=;
        b=Oh2EEun09vB0lmiM+zO7SPQHjE9C9POJc5x7jPnFdyrOmFvDNB4WG1scA+MsUk9kpU
         yVKhfL4nkYN3iqp/xtnYRwkdvp0rAzgbzKt1EcsQxlX8xGA3jCBQHQrwRGINYZf0AiX/
         8zi/KGLW4Mh2xDK3hVuksXobiPzUTiS5e0LD08BvfvZmrRwfYF3w9Dfpg588YnkMSGvg
         0B5JD16thizZh7ob6nZ37taEiaR7nhmPMRcSprhx7huhe69mygByWBZ8AeLTMhcPanHS
         c/0To3xTKSwEYro6/4kPCJ8nZWmQCMBjcRtdzOnwmVXVYinh/HBK5CkceUgSzOZYbUqv
         eXaA==
X-Gm-Message-State: ABy/qLbdreIL8Yw+czx3ZCVntsy4Ilk0kAPeWhd478OoRLps+jmkwG5Q
        esKZW186BeWMQmhQIskU7gI=
X-Google-Smtp-Source: APBJJlEKblSC2vTKPvPACcQDK6rhCN456jx2lienpb6IiqhMJHJK1c6udOf7DZp9QqRuBSFmSGsCKQ==
X-Received: by 2002:a17:907:a057:b0:997:decf:11e7 with SMTP id gz23-20020a170907a05700b00997decf11e7mr2211058ejc.12.1690469330210;
        Thu, 27 Jul 2023 07:48:50 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id br9-20020a170906d14900b0099bc8bd9066sm847133ejb.150.2023.07.27.07.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:48:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Add blank lines for better readability
Date:   Thu, 27 Jul 2023 16:48:47 +0200
Message-ID: <169046931555.2753072.15216484759861506773.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726182532.2291302-1-thierry.reding@gmail.com>
References: <20230726182532.2291302-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Wed, 26 Jul 2023 20:25:32 +0200, Thierry Reding wrote:
> Add a few blank lines to visually separate blocks in the Jetson AGX Orin
> device tree.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Add blank lines for better readability
      commit: d7fb6468ec9f18db52ef3c84eb44a9025021c830

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
