Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C74EB64DD
	for <linux-tegra@archiver.kernel.org>; Tue, 18 Jul 2023 18:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbjGRSyd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 Jul 2023 14:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbjGRSyc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jul 2023 14:54:32 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7461A8
        for <linux-tegra@vger.kernel.org>; Tue, 18 Jul 2023 11:54:17 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51e57870becso8062267a12.2
        for <linux-tegra@vger.kernel.org>; Tue, 18 Jul 2023 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689706456; x=1692298456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QzAKitk3M/tN75cEvJiwBGx+1rjMeU/r6c+9hcTI2Q=;
        b=wHiBnqi7Vx9r8u8s557orKE86gCcAIC0d9/7U1tS7zTC+Ucvm22e/Od5MjZKGa39bB
         ak3RRizdhmCmbePS75G87CH3y5Q9fh7wLriwlsvgxIrvw/bWiUNnBU43SaAgrw/z3cRV
         7KWVHvezokyY6I34Qn4iUug88zEKWV6vYBNbEdwyL29BhFYEU989t0tNwFca6mw28bak
         3ALzVfVs2uYnQKxF9/2R4yoOpb6nfeQqvUpJoB6nTc0oq2Lze8SCNx0u5ZU6xMAPs+Ci
         ZkPdM0BjYiScnBj7ubpqJga6xvgu43nFnNuoXIz9ujETIOjyWPo4xL8g8qI3OjCl3CBA
         P1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689706456; x=1692298456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QzAKitk3M/tN75cEvJiwBGx+1rjMeU/r6c+9hcTI2Q=;
        b=DHM+Yb5SLxu2XQJegIEtG7LHJMY3uPMv+AotKspOz9wnAX6EQEpNrU/060YaOH8HjZ
         sNbyy0LtUNsa/AoujZpzBU7CbuOcwnUwLWiipVZA6Zj+IXFPsybmtaYxveyYVfdV+mjO
         a6jsCFIKEtgpR/zlU0iMjhqxSc4Cgj9ONV4umS7xsD8fbzR6b3sm/BhhG7o9LZp5bfGV
         Ec5lj1S57wH9ppp+UBLg+oWs+HPhyWYCYPQKPWiwKc6U0gVc2Lv+veKBAsD3A+iaS6Q4
         +C8TPfEb/uYTGwvtWBwYYUCefqhvS7t5HKkQL1lFovt6qmc2V/HqXtiMgi+ZnrhvH0Lj
         VEvQ==
X-Gm-Message-State: ABy/qLZXZbfb2Rjg9Gpx/AHIO0PVXgIqJTfB7zymB3Ii/3h3UhP6fxWy
        dH+6V1jmmqdfD2fmPELNeJkREg==
X-Google-Smtp-Source: APBJJlHD3W8eXwA+SxkLrNtZe1CbFOTUDJIxZyaynp3KQUx904kSrREvv8IvO4Wib73xTYg66B+DgQ==
X-Received: by 2002:aa7:d991:0:b0:521:775b:ec9e with SMTP id u17-20020aa7d991000000b00521775bec9emr644143eds.17.1689706456229;
        Tue, 18 Jul 2023 11:54:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id z11-20020aa7cf8b000000b0051df13f1d8fsm1608611edx.71.2023.07.18.11.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 11:54:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sumit Gupta <sumitg@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: Prefer octal over symbolic permissions
Date:   Tue, 18 Jul 2023 20:53:56 +0200
Message-Id: <168970643386.118933.11425570509753211683.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714150116.2823766-1-thierry.reding@gmail.com>
References: <20230714150116.2823766-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 14 Jul 2023 17:01:16 +0200, Thierry Reding wrote:
> checkpatch recommends using octal permissions instead of symbolic
> permissions. Switch the debugfs files to use the former to silence
> these warnings.
> 
> 

Applied, thanks!

[1/1] memory: tegra: Prefer octal over symbolic permissions
      https://git.kernel.org/krzk/linux-mem-ctrl/c/f54abe0132e405cd482b8cad355cd680e3aec810

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
