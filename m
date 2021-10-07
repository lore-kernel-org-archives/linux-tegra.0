Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C00C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:43:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C9F361130
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:43:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243740AbhJGSpO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:45:14 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52296
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243729AbhJGSpN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 7 Oct 2021 14:45:13 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E44DB3FFEF
        for <linux-tegra@vger.kernel.org>; Thu,  7 Oct 2021 18:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633632198;
        bh=ptxZJ8VNZrNpirAGT41r1c4NveVYb2EiW6bFIw3Tqoc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=CdV9d4Q0arxsKxI0b7VQQtCFjkYfa5UqiQ+t+vuWZQEyYQ99pSNv+MVXsrhnl7QQo
         lLvTtmBbLGLkLerOxVT3Axi5VPq57/nE2YtuVNIrxaZpurHR+RjE61jaWdfW7dl4Pa
         h9DHftAT/yKJBPQo3Ipfjjg3XUr4MK2QOpiAsXmdhPKPcwrtI82sNb+qsbnA/M/Fmi
         ayllTxfAYfEBFvUXh93eKUGhGC6/9WdCaIcVeyWUiq67tgia/9qZfwYct6ZKb06ZXF
         p/U+a9MxEmLIsQwkh6HXym1MZdxZvw0PPy85PIhWBIVUf4eEkeqz6T0iceRZDR7587
         AkXOUZ1oF0A+g==
Received: by mail-ed1-f72.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so4741184edy.14
        for <linux-tegra@vger.kernel.org>; Thu, 07 Oct 2021 11:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ptxZJ8VNZrNpirAGT41r1c4NveVYb2EiW6bFIw3Tqoc=;
        b=Q6zKivbvDwaJLALhgVc340119UAxU135zNMUEvvfKWDBfJgxxcxcW4HntGDphFURUw
         3TLcrkQ9W/QSllD+LcUTCjU5ctvI+REwbjc7cKFVvwcqpwT2/CIHNGKjHXOVde0xLDT6
         Eu/sZmRZAhWQ0fFm2gqAFJkHoymhtjPx8R/JQlvn0EUH1EnvPaxwjcS6XKoO4S/CijXV
         FZtqF5KE+rMBG7vwSiKgtGlauolmb65jOCT2dku+Ds8EEMrqqxAOtCt44bB5H52Uetr7
         /W4Fi/ERQBvgrQbaO5Y8CRf9ZKgO7FQWeIaIsTPe8T8TD/NEgxa6bWvfjrFw9DOpe/Qc
         sO5g==
X-Gm-Message-State: AOAM532Er+QcolmYgpN3EdjmBwVP6pvFOc48TMPedJ/oG1WK+anl0a+c
        PyrFYMo276cznZfW0/ZQbJMyXcfbN2Md+ieQDLJcjUEn2+0FWLC5n2Or602rF5jEW6tHxik2xO0
        1gfWQRGilZrkjwvAnf/LaNFcQAze7JGbdILUmeYmb
X-Received: by 2002:a50:e08c:: with SMTP id f12mr8346831edl.178.1633632198329;
        Thu, 07 Oct 2021 11:43:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqBk+3H/3Ehaw/Ez5UgF30KaaOiCloLHyhpj2coChIm44e5d0hod35eSnVULWrl9lMHAxk0w==
X-Received: by 2002:a50:e08c:: with SMTP id f12mr8346818edl.178.1633632198222;
        Thu, 07 Oct 2021 11:43:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id t19sm70612ejb.115.2021.10.07.11.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:43:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        mperttunen@nvidia.com
Subject: Re: [PATCH -next v2] memory: tegra186-emc: Fix error return code in tegra186_emc_probe()
Date:   Thu,  7 Oct 2021 20:42:46 +0200
Message-Id: <163363216362.76978.14525648587170770072.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928021545.3774677-1-yangyingliang@huawei.com>
References: <20210928021545.3774677-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 28 Sep 2021 10:15:45 +0800, Yang Yingliang wrote:
> Return the error code when command fails.
> 
> 

Applied, thanks!

[1/1] memory: tegra186-emc: Fix error return code in tegra186_emc_probe()
      commit: 982ca19a09ac0365ad1409f919da43596d2a2276

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
