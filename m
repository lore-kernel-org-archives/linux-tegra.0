Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06030C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Sep 2021 08:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1D1F6109E
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Sep 2021 08:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235951AbhITIgC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Sep 2021 04:36:02 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56108
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235907AbhITIgA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Sep 2021 04:36:00 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EF3EF40267
        for <linux-tegra@vger.kernel.org>; Mon, 20 Sep 2021 08:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632126872;
        bh=GlnCPL/n2TbFZ5lKXBBdaGTEcyYQg+Xe+TKmdfu9J3o=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=k3NQkMTJCzpxEaXtrsQYxD1tozAA27mjEdZTmW8rk2xphZA2q53u+aisx5jCsSlnV
         32HtqlBG3ASoJMNCJav+Ga7Oat1H/j0aC9XJysVHR/YgqT0TCpC1jvne0VDdfZlhHe
         zSX344WdjePs97xnJ6rMZZe8z/sWyK7gM9ZMpHYYDKH5VYAaasTQZCmLNGSN9de+es
         4V0tJuS884SmGNfKFVTTxbIgowIM6ff6vJ4vhyj3nc90A+ndZYUoAYm3I1dFclVwDX
         qFswYj2TCAb6C0ZmkusmkbXm/Rgg29DLJttiZHTPCbYKfx122UJvBJ1rsDfFh6oyhx
         G+l0mueS42WBw==
Received: by mail-wm1-f70.google.com with SMTP id c2-20020a7bc8420000b0290238db573ab7so5466737wml.5
        for <linux-tegra@vger.kernel.org>; Mon, 20 Sep 2021 01:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GlnCPL/n2TbFZ5lKXBBdaGTEcyYQg+Xe+TKmdfu9J3o=;
        b=d6IIUL1EPNMW7JuU/vzDZMRTekFQ0JczkSCKYuQ7So2BhPyb+YLBdJ9uwob2m1xMBR
         i1avF77tYWsjn4z12gXbze5+dOq5bjzgVFA+CTZ8N3lmVVBEqCK428q33Db1yDfRljvE
         2yYb4uRiN1sjya/flUr2jF0O/zUNE6b7Kg4I1vo/0AGDqmxfffc9TCXM8EiMgmWDYZ72
         8f3FalJoUjjvo/gCqHBLXgpycr2ynZkTRnhxeVBAloWsuQQD0rB4SuhjUsm+gc6Gbh/O
         WRHxuFdd36KM+wZshl4B3+QCud85C7CDyyFTnVJvEhWfhmlkCINmCylWbbpgy9UnEyTv
         co+A==
X-Gm-Message-State: AOAM531lizfDWKVKiGtULWzfJtx2NSZ+FxSDVaL8wXWv9sQMMc4qCFcO
        lpebBlv/P36bGjHtWIWmeYVT9nIt60Xe0cjbQVqCP690Mk6pkb0XWUqE3EkMZNO4RA/R82t0WQk
        WBLBGAOwF6Z4FjeFL4jHAhvVTtE2oDG6IMnSOUh60
X-Received: by 2002:a1c:2056:: with SMTP id g83mr27578659wmg.27.1632126872640;
        Mon, 20 Sep 2021 01:34:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ9ERCT7KUv6zwsHvcBjFyA/Y/awEBukLBanBzL4Ra5L9b9at0dRM9wxlTaF4DW/RU0R/XQw==
X-Received: by 2002:a1c:2056:: with SMTP id g83mr27578645wmg.27.1632126872454;
        Mon, 20 Sep 2021 01:34:32 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id v188sm4658891wme.38.2021.09.20.01.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 01:34:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     p.zabel@pengutronix.de, viresh.kumar@linaro.org, robh@kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>, amitk@kernel.org,
        kw@linux.com, rafael@kernel.org, thierry.reding@gmail.com,
        lorenzo.pieralisi@arm.com, daniel.lezcano@linaro.org,
        rui.zhang@intel.com, jonathanh@nvidia.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 3/5] memory: tegra186-emc: Handle errors in BPMP response
Date:   Mon, 20 Sep 2021 10:34:27 +0200
Message-Id: <163212685894.112070.7948621267940223581.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210915085517.1669675-3-mperttunen@nvidia.com>
References: <20210915085517.1669675-1-mperttunen@nvidia.com> <20210915085517.1669675-3-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 15 Sep 2021 11:55:15 +0300, Mikko Perttunen wrote:
> The return value from tegra_bpmp_transfer indicates the success or
> failure of the IPC transaction with BPMP. If the transaction
> succeeded, we also need to check the actual command's result code.
> Add code to do this.
> 
> 

Applied, thanks!

[3/5] memory: tegra186-emc: Handle errors in BPMP response
      commit: 13324edbe9269e6fbca4d0f5146b18ef8478c958

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
