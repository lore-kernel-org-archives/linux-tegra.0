Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D8FC433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 09:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242124AbhK2JRn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 04:17:43 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59954
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241926AbhK2JPn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 04:15:43 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5BF503F044
        for <linux-tegra@vger.kernel.org>; Mon, 29 Nov 2021 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638177145;
        bh=xL3cwvRjtg5iZMory+31gLHybfwEMgxutZRdlC/JHuI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=VbvFw+yB2JgGyEJz5KxKpMJGqcz7g9vmDROC9gQfAa9zVNjrrBTQkvCPhTLpGh+Is
         OyugE4OlMUV7h6UnsTMzi8KHVL8upRCkvGm/K+Txsi2MeE38q68Pn6TMvkJa2HCysv
         2hDJ2VSyvRbSiEzNx7fJbUvSYWmdL+y3YPLMA34YBrf0ExCQ5KyvY/z4IySQmO6Wnk
         hceDzwtD/1Kr/qPvNaZfC+JFsNxTtg+Xn2u4C0UDYAJ9N03sn1gGOs+sOmnL/vVgIf
         +7viArhO5xAcfc6czyi1EnRyKXmCvh94JSAi8/Vu2QuxKKtY8+0n4b7yLeVA/+3CKj
         whRP6fxdVyyrw==
Received: by mail-lj1-f199.google.com with SMTP id k24-20020a2e9a58000000b00218c7914524so6566027ljj.17
        for <linux-tegra@vger.kernel.org>; Mon, 29 Nov 2021 01:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xL3cwvRjtg5iZMory+31gLHybfwEMgxutZRdlC/JHuI=;
        b=CANl0EdHoKG6OFIpDBgYPxvSVyc7iIo47er9S6MBh+pwGmEc7j0bTFBOtFipm3O73w
         u3daLd65+LmhKtcVaLkIA5l4ETcFvfG9MkmatK5sX1bTuZqUOynBdDInTeIPZPqUH0UD
         2kdVFwMu3ET3l8+8aLoVP2lV1qFoXoRoYTytbcdLUoQjhTS8CQkBxT0FX1Jku6gFrfLZ
         myrQtlBu2sDV5UdWdCvco4AbVTQuKmwOSkXg0OmGRbD6+Cdr4FKEwNyslr6JufEaO4hA
         8yBRc2lOxrE87ZVdW+w7xfcc1r7tR7u3npUR1Cxel57Bgw0GmEEOcxynVFLSqLQRNZkj
         0lvw==
X-Gm-Message-State: AOAM5311Wpkkhx8oYSXd17TDvdkyOkRzYak4mnofvGxz2SiZrWwSbqut
        fIsm+EG6zUyes5zGQzx5Gc1jDUCWYjRjOmcj+tuOfv2hG6WZ9ZL90FhVdQS3VkmBkEx00kgJeDG
        fENs2dr7jNrJxRSfWwUMlx93LtS4K+oqPRS/ZF3DK
X-Received: by 2002:ac2:55b2:: with SMTP id y18mr44689107lfg.63.1638177143394;
        Mon, 29 Nov 2021 01:12:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7gbNto9BPWB6Xc1Rpw7eBAG+LURrXG89GxHn4ELAZQbZdwtQ+0AvRPZElUJ+4liEROyhslw==
X-Received: by 2002:ac2:55b2:: with SMTP id y18mr44689086lfg.63.1638177143193;
        Mon, 29 Nov 2021 01:12:23 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id p3sm1273815lfo.162.2021.11.29.01.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 01:12:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jing Yangyang <jing.yangyang@zte.com.cn>,
        Kai Song <songkai01@inspur.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] memory: tegra: Constify struct thermal_cooling_device_ops
Date:   Mon, 29 Nov 2021 10:11:46 +0100
Message-Id: <163817710354.21425.9622697114945269603.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211128204158.19544-1-rikard.falkeborn@gmail.com>
References: <20211128204158.19544-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 28 Nov 2021 21:41:58 +0100, Rikard Falkeborn wrote:
> The only usage of tegra210_emc_cd_ops is to pass its address to
> devm_thermal_of_cooling_device_register() which is a pointer to const
> struct thermal_cooling_device_ops. Make it const to allow the compiler
> to put it in read-only memory.
> 
> 

Applied, thanks!

[1/1] memory: tegra: Constify struct thermal_cooling_device_ops
      commit: 56985dc4f437d7a77d4abede73191da20cf11429

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
