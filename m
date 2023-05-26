Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DF5C77B73
	for <linux-tegra@archiver.kernel.org>; Fri, 26 May 2023 15:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243860AbjEZPKH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 May 2023 11:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237375AbjEZPKH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 May 2023 11:10:07 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E59189;
        Fri, 26 May 2023 08:10:03 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f60e730bf2so9371085e9.1;
        Fri, 26 May 2023 08:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685113802; x=1687705802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnO5fGYX0OkjrzTSNzA8NBOW1UoQqbvusvkT6EgNPIg=;
        b=MZ32lvxuUs2j3FpdIagFZQqmY/dYDsSxATXjrSZqwzvwyqGa2SNDHaRCrgS9thWlAj
         HAoZphmOhdYtCHGisIp9fv2Y0wVnnMFaMvdXMj9RG5gY10Hn8Q3VLQZAFoo0t9BqKYDQ
         AirVCi63vO0K8y03UJf/IeP+rlhef0qZfGkiU7zdg27DEmqlhzkPgjeK1TDDXIK3Hvhj
         jbdImZRtg93hCn9+qM1x85CwYPL0uIAlAx+JbImNvi9/Uu1TKwtjD57XXLTdqaF3zQhR
         E9gDt2tiUOtTd9aLSHm5a/eueqpkPauOeTEekInLcQ/oiIbte9nyTZeyPas2oRgFNc70
         lyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685113802; x=1687705802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnO5fGYX0OkjrzTSNzA8NBOW1UoQqbvusvkT6EgNPIg=;
        b=W0XF4jlaGTgMNaDgM7l7xgIe9ig6EcfQRAmb7S4heL+4yRCEPDpeyrmrhSGP2Abo6u
         CV64OnMqSzQT+CCtTLRXfQJTXwXmECYxERTyFdbun0KYfSAvrNoJbCMsnK7+WTLuPzxN
         KbOKa3mzixcpexNGM7OgU1DyeEdbMcwCCiEh5Scd8IEVX8w3GnOqmNOQ86OHD/84qNda
         TdZTGMvXWRsjJYglGeMGyxBpyebaXdoYcLc6eHKh588Spw28mz/FEbsVr+sHLFuGiQMA
         OsYMXQTf+AOvqN0kAqeLmbhf4s0hgCaGsPro0+kJTtCppRnkK91TT78Gms+I7OtE+GV8
         ilWA==
X-Gm-Message-State: AC+VfDzSUwy3b1PsnwUt16ptnyIz76I5Ncu7NBtPc1+KmFgZBpaWcTh6
        isddM8OcuctEqxwG3YwQ+l6X2538EBg=
X-Google-Smtp-Source: ACHHUZ4xIs70msNIdB5IESwlO1NS7MTUFp013/lGvAuBgFEdzyg6MWtg1VqEycjSwKGjpV8I4y4Qtw==
X-Received: by 2002:a7b:cc94:0:b0:3f6:2ae:230e with SMTP id p20-20020a7bcc94000000b003f602ae230emr1886582wma.3.1685113802121;
        Fri, 26 May 2023 08:10:02 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c059300b003f60119ee08sm9060414wmd.43.2023.05.26.08.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 08:10:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: tegra-xudc: Remove extraneous PHYs
Date:   Fri, 26 May 2023 17:10:01 +0200
Message-Id: <168511377238.1214401.2087728425871694222.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525094237.2846682-1-thierry.reding@gmail.com>
References: <20230525094237.2846682-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Thu, 25 May 2023 11:42:37 +0200, Thierry Reding wrote:
> The USB device controller on Tegra210 and later supports one USB 2/3
> port, so only a single pair of PHYs is needed. Drop any of the extra
> PHYs from the bindings.
> 
> 

Applied, thanks!

[1/1] dt-bindings: usb: tegra-xudc: Remove extraneous PHYs
      commit: 33f2d12d040059bce36dbd8ab9ecc7a580bd4d77

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
