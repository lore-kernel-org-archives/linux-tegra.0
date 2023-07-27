Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10532C0729B
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 15:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbjG0PSM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234627AbjG0PSH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 11:18:07 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F132E19BA;
        Thu, 27 Jul 2023 08:18:06 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so1929793e87.3;
        Thu, 27 Jul 2023 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690471085; x=1691075885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pds1Vy2+pwsRJRkXlFVbHEDst9llli3Uzlt9C1boHh0=;
        b=F38F4xUuHs3DLGHROrGvlfe0XfKSbVlc0PdeQYFgp5ibV8BKmmlVmdA2keBGfGkSEk
         8C3WuVqM+HyXQylRhA9Rpu/3uR1fMB9tGCAqn2cHNBC8Axt/chns6nW7QBKMm6xywSZi
         tlrVdeXLHZMogeT6IuUuhG2FSPkdIQqAw4pKbvkmk+PKLTkOU8DeGRBx8MJRgv6j8K3g
         RgAa2ewXbhMdr+SufVuYuAb08nj8KN6YxVvuTRvrk3uPNnLqNfUMMfM9gwVN7+inAYxB
         xfQOy+INH3HXpoVPjI16Si1tuZeFPDUh3OfY4figrR0z4r2REZT2Hj7SnNncXpEB8wC7
         Jqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690471085; x=1691075885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pds1Vy2+pwsRJRkXlFVbHEDst9llli3Uzlt9C1boHh0=;
        b=Cn4+KWgLZCUPZSEHSFj8jtA1mV6CbuksZPhxt1Dv9uBPNvqS+kwxHELp2SH6JMQdeh
         7aTPY+HnAdt3YlQurt53nGAlW1rdCv6DwVXQj9iz1GEFqtrAk23A1OdAwa5jyDi0xUix
         yG9x2dmSD2o2yZMpD/ajpBAjFm1zDoFSUhp5jrTrG7WeO5scwv0xu6cvWYoEVEIWi2Kd
         6yBjv/6MFSl+P9sjBLVqRh3lxcqtc/39J4xcblFuPfkVYADjRwq2DMtfq4vtIMiOt/P2
         IWHD2haoo1QxRYxBJTQtBzPRUmShLoOVRAViPU1cK5B8/e0W2GO6ijLj9Zas6+PhQCCI
         bA1Q==
X-Gm-Message-State: ABy/qLbLj7CbN5fBlYJ2fMgCFxIMzy/0jZ8bds21PsH1WqodWCqHTnmi
        jwGfi5WyC6MXjGla3oiBzRw=
X-Google-Smtp-Source: APBJJlF4UNubx9KCg9zR1Y9DiqzxUEKRVmaWwggVoyGb23W9jr0nMOIS+lLGfn2/dyx3DDtdKanrlg==
X-Received: by 2002:a05:6512:15a4:b0:4fb:be3c:d8b7 with SMTP id bp36-20020a05651215a400b004fbbe3cd8b7mr2361173lfb.51.1690471085058;
        Thu, 27 Jul 2023 08:18:05 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id va16-20020a17090711d000b00992aea2c55dsm882182ejb.153.2023.07.27.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 08:18:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] dt-bindings: display: panel: Move HannStar HSD101PWW2 to LVDS
Date:   Thu, 27 Jul 2023 17:18:00 +0200
Message-ID: <169047096701.3031511.2458289034154287387.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726184857.2294570-1-thierry.reding@gmail.com>
References: <20230726184857.2294570-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Wed, 26 Jul 2023 20:48:55 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The HannStar HSD101PWW2 is an LVDS panel, so move it to the correct
> bindings file.
> 
> 

Applied, thanks!

[3/3] ARM: tegra: Use Hannstar HSD101PWW2 on Pegatron Chagall
      commit: b28d3af99ac4885f136f6330fec6499b15ad5b25

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
