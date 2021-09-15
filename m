Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E1AC433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Sep 2021 07:37:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D293B6113E
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Sep 2021 07:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236701AbhIOHjE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Sep 2021 03:39:04 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44436
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236629AbhIOHiz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Sep 2021 03:38:55 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A829940194
        for <linux-tegra@vger.kernel.org>; Wed, 15 Sep 2021 07:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631691456;
        bh=VNhuMSVYlZ4RBI+HKhhCa21E7CHalYPb5KZF4Ga++fk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=d4PhT/B/Withgs/PtbcwedTYKqwZ+96+rmurQFdSzd2whvlt5fXix0ddUHA9eC3HV
         3+zM55Fx5wsGSZ4plwhQI2GbpSwx/G4r3d+xMqnAQufhaHUN230mxjbKRECSTsbRUG
         0GBDyH/p2n+4Z/vtCmEefKejx3W4PGvOjHSxy8G4VlEd6pGfwMjXlaawZdD2UaYBSW
         80hGv5VyCxF62VuUbAaheVfDM8MJzRG7MglRlqslA5wZvYHarloOKhjRX5fxJ4GyfP
         2z+Sx+HMss0SOPsWjUJhaTqI3GSX1RvCb7iyZbEnoNi/emY+XxtLPuU8A2bxCUSLaF
         OoeWSqcYCgtUw==
Received: by mail-ej1-f72.google.com with SMTP id b9-20020a1709063ca900b005f38ffec200so588449ejh.14
        for <linux-tegra@vger.kernel.org>; Wed, 15 Sep 2021 00:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VNhuMSVYlZ4RBI+HKhhCa21E7CHalYPb5KZF4Ga++fk=;
        b=HKhHNFCLV/oWmFbyvbRNSh478bVDpEjqGvflOF7FNZaGPWQLA+FOygnmfCFS9TtWUv
         3LyCaYK2KAatcLVnzpVkb9gkMb3MjPZ9MN0xUOkNHPYMJvbjwRnyjk52BG9eXy7nRI8W
         8rkPjOeFZqeleqL40/iShbs1ltJ6qB3B1zlcqmoFZaBuB5RSEqq6F4ww126TGit+QhFB
         MvN2KjkAf30wjCXBdtBcwg4jNAIKYdx6weBpKvc8Y83lm9XlVPf1yR0B1ssVMRGyUPGM
         Bn5mYTS70CZi7UBcLTHKGdsNpwFfa7K7NLcfut63PDekXGOWXhN3ualo7XVjY1itknpf
         a4fw==
X-Gm-Message-State: AOAM532sZZrzaKkZGhBYjaYzyRDkqWgsO6qJvdNARYhuMEplh3XoU0fQ
        aMPxVu4m7t8RS8Fpkjtmi7FprXAlS66BtwkoEGg9mUwzPhhTczn7cQzZIOX4of/tjCjcvHJB5qZ
        atQg38447SFJ1A2g/XNd9Zfk96rRRzpHFWPSArLGg
X-Received: by 2002:a05:6402:104a:: with SMTP id e10mr24334297edu.139.1631691455980;
        Wed, 15 Sep 2021 00:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSzwU3Zeg/51JAZYchT+uOWuELdhcjWBmcCJ7x2Vabn8Iq1N66iQvk09tApR5D6ty9v5slQA==
X-Received: by 2002:a05:6402:104a:: with SMTP id e10mr24334288edu.139.1631691455872;
        Wed, 15 Sep 2021 00:37:35 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d22sm5871832ejk.5.2021.09.15.00.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 00:37:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Colin King <colin.king@canonical.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: make the array list static const, makes object smaller
Date:   Wed, 15 Sep 2021 09:37:26 +0200
Message-Id: <163169144169.13297.295852962982920269.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819133155.10441-1-colin.king@canonical.com>
References: <20210819133155.10441-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 19 Aug 2021 14:31:55 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array list on the stack but instead it
> static const. Makes the object code smaller by 110 bytes:
> 
> Before:
>    text    data     bss     dec     hex filename
>   37713   21992      64   59769    e979 .../tegra/tegra210-emc-cc-r21021.o
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: make the array list static const, makes object smaller
      commit: d71b90e3633ff4af8e915ba7adc3c26f7f5edcfe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
