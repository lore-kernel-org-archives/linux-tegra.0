Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01373C77B7A
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Jun 2023 13:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237627AbjFFNDn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Jun 2023 09:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237650AbjFFNDn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Jun 2023 09:03:43 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C12012F;
        Tue,  6 Jun 2023 06:03:40 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1ac373c9eso58038411fa.0;
        Tue, 06 Jun 2023 06:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686056618; x=1688648618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppUEUXlfyDGcaV0Jk4+G607lI9ilV+0ZgoY188YnfSQ=;
        b=Ut6Ha7/oKQLGtaZcztB4EZThpCKpwD1mPBhMjYcbC90aMnBsY+CE5/RZf0TdBX3kuv
         /zN73+kZjhXDsEHIr3aaDJXpuKVXsNkuEHII/iq8pX6hmGzzgQuWYDX+6x4HvmUoGK/8
         2o4Mc0vCZ9VuzCNJymNexG/sz4mw3BxsKYU4TSsXuupPV3qjBTsDpUsMMFvqnL/rbFo2
         KQoklukO+7yNDzKbONPJo9b51t5We52YXoGhg6CFlxgrIcJIVlZK/i2wFJA2L7262CRv
         renGC8gO7LTaraMXRCiDOU+kaF3YIo5/E3FJ+UiR5KZWDIDYoJ+9tdvtKlNIg/dXJiXe
         IQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686056618; x=1688648618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppUEUXlfyDGcaV0Jk4+G607lI9ilV+0ZgoY188YnfSQ=;
        b=Uk/ryi+BPMPNuUyhqUo5lpl2p/2Vw/mh0wjikbWP4qf4TJfZZXN7rMXZgZFgyPsx+4
         U6PXu6yL8H2vFpRC4PCFz4+xTT3mNC84czceZV18kylAcG0k2mzmzynU3ycXe2UhIIoP
         ssBU4KIKMrrITAAuNx7QCkYMJ9s8Hsdi9HaLa6FlhVsRAH+l2q280PNfZOuzl5AVvKwM
         6CV3jDxhDhIEt8xa7bbE7OGzjAkYXPbSTdfrzyoW2hdajzt+VEqfiS1Z1s/Qo0B3q9Z4
         7oLzhbhR4vW+QsymCYWxraUJsk/bJCBeR3nR/tWX8SfXTf6HR4wV/ToZzQa4kSRXa7lX
         Mccg==
X-Gm-Message-State: AC+VfDzlr1hbeYYfcXFfy3gQDE8SyEbk8DrD5IEEdukjOkxctfkkZglN
        20+CQnE/ISOz+aBMdVacyZc=
X-Google-Smtp-Source: ACHHUZ7c5v7ZUuZzUT2aRx9lo+JMnfZDIoxL3gPXVn+mYZ8BIM9S0INRJYrfcgSBOqnTW4JCIEw65Q==
X-Received: by 2002:a2e:8e8d:0:b0:2b0:497a:2029 with SMTP id z13-20020a2e8e8d000000b002b0497a2029mr1229759ljk.23.1686056618099;
        Tue, 06 Jun 2023 06:03:38 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b15-20020a056512024f00b004ec8b638115sm1452891lfo.193.2023.06.06.06.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:03:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/3] arm64: tegra: Support Jetson Orin Nano Developer Kit
Date:   Tue,  6 Jun 2023 15:03:32 +0200
Message-Id: <168605652835.2915879.11202169691767509843.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516095850.2426604-1-thierry.reding@gmail.com>
References: <20230516095850.2426604-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Tue, 16 May 2023 11:58:47 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> this series documents the compatible strings for the Jetson Orin Nano
> module and the corresponding developer kit.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: tegra: Document Jetson Orin Nano
      commit: b4032e1726648cb156f45ae756c8730d6d39a5de
[2/3] dt-bindings: tegra: Document Jetson Orin Nano Developer Kit
      commit: 5f027147e4796e9fc11083b2ad50a91c1ac36ede

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
