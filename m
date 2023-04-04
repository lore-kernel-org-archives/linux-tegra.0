Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2867CC6FD1D
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 11:20:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbjDDLUT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 07:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234165AbjDDLUS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 07:20:18 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D46DC;
        Tue,  4 Apr 2023 04:20:17 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y20so41988628lfj.2;
        Tue, 04 Apr 2023 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680607216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xdko7jl4FcfBu5T09U5ILBtmM3jji4Qd+iEhYv/HhQ=;
        b=bpkWJKrEhdvApIWGBXI4vug3m2LCOEI8t5R5oBiOXMPmcgHrFESKo16ntIPiEpI9KO
         kfjJcnxKamO9VBtbEdW/7DaGLn0viBkssUXR4+Le83C1usgx0ZAYXi68OgI0TWAUH4/o
         VRlAtTNUhsOsPMf/6GYBt4mw3XMe1HQwwMMk9usMaTzU4cwldfNmyti04SDSOiHDkQar
         gwEmZ3BTnNA7zZ+tGcNaYtJGCg3IUK0gHJgzeNPlRtRcQN+hUrJnkxhKTL4POmgONrhU
         D9+6SnKSMoyA0iXEVvWShhCri6SIy2zFB0i7rdUH+58utoYkcnCvIMSlDaXUEW7J2WPz
         d/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680607216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xdko7jl4FcfBu5T09U5ILBtmM3jji4Qd+iEhYv/HhQ=;
        b=krCpyv3/HeP/hf6KAmeF4T7rp0kew3ryjgbHm1kqcOeiwyBElyLhp3i6/tDSmZKnXu
         uVUOLCO4UvMbvCHmi/ETeiRjwMbN9PnKfup86hEgIUnBrayWRRRTQJYnwGXUAOR8Z4Oy
         cqtYGUfaJ2A08fJHNPGVE7dHJ4Db4EGUQ90zGKPH9SljpoayB7rbPDV3TKgn/80to6Kp
         sFHZcwblSnfuL9JBLqdYjVGrM2sNMROJKfe9/i0kAr5FKSt/sZrpiMgDU58sE4Z2yWVx
         5VLNzDCXt9TMGpDwB4T4eE7r22gXXCjw5YtpInuSJd7NvYEGmnvq75diOBRAKjWTT4Tu
         bfLA==
X-Gm-Message-State: AAQBX9dVfHp6zvr7g6DCA24cZTr4l4FKzmhCThZDec3sqilggOTno7dx
        SlsS8OfcJtHTcDjxJGsTP80=
X-Google-Smtp-Source: AKy350ZAq9lNhL6JmwR0hDpQE3z8MsJosSQEJD6FaK8D/i1Prr/X8D5wHrcwhrphx/G6Yi0/jSF9VA==
X-Received: by 2002:a19:e05c:0:b0:4d8:86c1:4786 with SMTP id g28-20020a19e05c000000b004d886c14786mr6299632lfj.27.1680607215383;
        Tue, 04 Apr 2023 04:20:15 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 10-20020ac2484a000000b004a2c447598fsm2286320lfy.159.2023.04.04.04.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 04:20:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: tegra: Document Jetson Orin NX
Date:   Tue,  4 Apr 2023 13:20:14 +0200
Message-Id: <168060719503.2048989.12985869866369030936.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331162914.16922-1-thierry.reding@gmail.com>
References: <20230331162914.16922-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Fri, 31 Mar 2023 18:29:11 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Jetson Orin NX is the latest iteration in the NX family of Jetson
> products. Document the compatible strings used for these devices.
> 
> 

Applied, thanks!

[1/4] dt-bindings: tegra: Document Jetson Orin NX
      commit: 062dfd995e8cbaf47f6cbf8bcdf5525439ebaa5e
[2/4] dt-bindings: tegra: Document Jetson Orin NX reference platform
      commit: d89baa52929f00e9052f61b4eef838ccc8ebf180
[3/4] arm64: tegra: Support Jetson Orin NX
      commit: 13b0aca303e97500e6aa6fa7965c620394c67775
[4/4] arm64: tegra: Support Jetson Orin NX reference platform
      commit: e63472eda5ea84424e4bff2b809389b0ba266613

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
