Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E86FCDB46E
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Oct 2023 13:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343724AbjJLNbq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Oct 2023 09:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343952AbjJLNbp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Oct 2023 09:31:45 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1854BE
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 06:31:43 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53dd3f169d8so1724995a12.3
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697117502; x=1697722302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVTuVKgrSdL1GWChEP5ZEuj52LDURodptoCTE0/xTEU=;
        b=blfgdJSpeNX+WqI13UfX5Oxpx26xXGtvwLPeMuuegHTz4lElbwynb/SKjW6HqcK081
         pht3rnTJn/wUc3CBrbz467SbeBw19BB9nH7pMsaYZ3OBe3ja0mKoCeR3mXqVnx9QYKnO
         oUSomic8Yrpk8yvbMkNqDtvx/+mzpJyfQRiElMa/kHZmMdPAMlYDz/BBirCvZucm93ZG
         n25FueyonKKZSD4UK+4LJjrRIBhV9zkjO/cfcYl4O6ikoO8joxJpZ4uPycwA1DYsDnGR
         iuLEvfhZIxfDZ+lbJ6CKbgV4vYgo3cgYYoMKmRrqUfXaEm5RXW45yjZfBmh3IUJyRgaS
         /vzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697117502; x=1697722302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVTuVKgrSdL1GWChEP5ZEuj52LDURodptoCTE0/xTEU=;
        b=ZGipK4s/CKrndb95kmTDRXJf64fNA88Bwnzl6FHL8TahYeVJqwK5g92J2kB98OnbhL
         CDDU7Qz5oc5afd30O+PYU1GKCSdbMi/F5Fh/cXEA1mTjXX2CISa+tHirYEgSOL+3gRTu
         tg1Nq22FjkTn71J/Kc04VjFzzpjHz+bzrdWODSAF+1LJaOJx0AfvGa7Ma1ILOW7PZiTI
         JNjIcZS/ZHTHJiGsWeO5HZMDiAUYO21riOBc4JcfOYi0A/aItV0kbvmLrljU4vo1Cr0K
         bQbLNb6BQ6kkoAAmQWo1238vO4iW9tBJ46q6IYJqTlkxxCy+ZJZOcEmXT5Y3I0kf8Ygd
         g11Q==
X-Gm-Message-State: AOJu0YwEGlFEhevj803TMwBeWAb2vUVBHJvI/0E9WM/D6Ky1UrUHGzqr
        6f4KJfCtoN2MsCHQHzxcaY1q2A==
X-Google-Smtp-Source: AGHT+IGiLYOpI3JbrIBwvUR3C8WmYE360FGf2xgHDPD9ETVb2pRBZnDRH4pFpODn2ZomGYaKYtT/qQ==
X-Received: by 2002:a17:906:7389:b0:9ae:406c:3420 with SMTP id f9-20020a170906738900b009ae406c3420mr20040688ejl.30.1697117502033;
        Thu, 12 Oct 2023 06:31:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id rn4-20020a170906d92400b0099bc038eb2bsm11029790ejb.58.2023.10.12.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 06:31:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Johnny Liu <johnliu@nvidia.com>,
        Ankur Pawar <ankurp@nvidia.com>
Subject: Re: [PATCH] memory: tegra: Add Tegra234 clients for RCE and VI
Date:   Thu, 12 Oct 2023 15:31:39 +0200
Message-Id: <169711749700.88067.2146884933988842578.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012104909.48518-1-jonathanh@nvidia.com>
References: <20231012104909.48518-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Thu, 12 Oct 2023 11:49:09 +0100, Jon Hunter wrote:
> Add the Tegra234 memory client entries for the Real-time Camera Engine
> (RCE) and Video Input (VI) devices.
> 
> 

Applied, thanks!

[1/1] memory: tegra: Add Tegra234 clients for RCE and VI
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9def28f3b8634e4f1fa92a77ccb65fbd2d03af34

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
