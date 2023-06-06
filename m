Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE33C77B73
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Jun 2023 13:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238148AbjFFNNU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Jun 2023 09:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238128AbjFFNNJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Jun 2023 09:13:09 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E311FDF;
        Tue,  6 Jun 2023 06:12:04 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51456392cbbso14749441a12.0;
        Tue, 06 Jun 2023 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686057123; x=1688649123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0CGQqG20YTOK9LtWqZipWk8Qea+usdqMmamyt9olJQ=;
        b=kCfc++5woXhXDsKwdJGD7o1GoiNdpJvwOZBcc9rWclcEP9mVRbi2TzgJCbBumFdorz
         GBQN/5K8/gY/x0GC/n8K026i1rgdp7qtb1LPOwh8BTaG8FKmSnTzQ44gq8OrBkg/jBhM
         tGBdf2w2eFxAVsITJwg5fp7cJO7Zqngbk/Px6YhTg/eZ9o4WoSYkpuZ79SzM+QDwmJGS
         UaGk1htiOzcru+TyUg/N/sUnUPZi8iWgkyRGMcdqyZfw047TRz01By+BNTRKRA6MgJ2j
         zPisCL1g+cuTIcktIQa9uqMRSGljFICnnYgohl8hmQJvYMO8PqLtE0KSW//OOBXNuYrm
         zhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057123; x=1688649123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0CGQqG20YTOK9LtWqZipWk8Qea+usdqMmamyt9olJQ=;
        b=F9/10j5F8/jv9oeEbqclFCDYlW36eC6r2B2Ttrkoo/ajNu1capKjI+m3BwhJB9Hr6s
         pVrKiKddcYfWsRbV+m3GWRcaCPeBnoIgFaoVpJ8G0OTcyOlR/LgYEkP9/0dTnGa+72wa
         N98pDnho6y8ZxTHJmxj1P27Q8IOnyELTiaB7uIBsaqHGrrCYC22ABKqHw7N7hoSdmEVN
         R2iBW9wbITm9wdyrm4PRe0ArVWy18Nd8UU6RByA3JJmAYD5bMwN9VySg6CeAjMuTIoLQ
         qYYcBsfbEIS6SRianfmR9O+EXjGzuwPL898vlHr7JCTpECtn6SP8JrFA2lDw4SrE4q8P
         1p0g==
X-Gm-Message-State: AC+VfDzg88qAZhePF8YXutoPEE3pu90LhAaYhH6V1aqjNoCyIFv+31Yb
        hhJbMCWXvHngaKKfGAqex7k=
X-Google-Smtp-Source: ACHHUZ5RIERdp9ITRhu3Mx9yKlN745/O2iK+/1eCC17frhA/GMWA92Y1cLKumsLL7TO6pDeiygbMxA==
X-Received: by 2002:a05:6402:2713:b0:514:8eb1:1aaa with SMTP id y19-20020a056402271300b005148eb11aaamr14434647edd.11.1686057122864;
        Tue, 06 Jun 2023 06:12:02 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b11-20020a05640202cb00b005147f604965sm5082399edx.24.2023.06.06.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:12:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: tegra: Enable USB device for Jetson AGX Orin
Date:   Tue,  6 Jun 2023 15:12:02 +0200
Message-Id: <168605710403.2916503.121426897498738904.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530140232.53854-1-jonathanh@nvidia.com>
References: <20230530140232.53854-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Tue, 30 May 2023 15:02:31 +0100, Jon Hunter wrote:
> Enable USB device support for the Jetson AGX Orin platform and update
> the mode for the usb2-0 port to be on-the-go.
> 
> 

Applied, thanks!

[1/2] arm64: tegra: Enable USB device for Jetson AGX Orin
      commit: 620405856d591ef95b01ee3e275af3a636c05010
[2/2] arm64: tegra: Update USB phy-name for Jetson Orin NX
      commit: 86d24f98b75d3a58503554e8d1dd277ae7386966

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
