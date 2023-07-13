Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB9EC001E0
	for <linux-tegra@archiver.kernel.org>; Thu, 13 Jul 2023 15:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjGMPau (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 Jul 2023 11:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbjGMP1s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jul 2023 11:27:48 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE1C3A96;
        Thu, 13 Jul 2023 08:27:17 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3143798f542so971005f8f.2;
        Thu, 13 Jul 2023 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689262012; x=1691854012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdH/m7h/MNAU1FeEEW8i3XaU9ld39R41tJa+AFaiGOU=;
        b=QKtrsey3zpXfpgm3Bv4t0y5Sjb7NZi0bcH2pjxyVei0u6jR/YK2hg2bdRjyJybG+Lz
         YdB8wRY08AhHpZO+xir0li1X+N6PUYzRgY+tIuCi3MK2fOjcvxMzj9ZvV+7MY1F70u4I
         sysOAaECbrYzGLBMKpI41OgeOUFUnQsfqxOPzxcMPY2yTKavUe3b6cvWZh8dinU5YsZp
         3Dz25ZOgFfo1hFSNOOW+99WfW+vMnj7WWs/mCunx9nfKBd4mXkC5HsDewYMdGCI3Mymf
         fLsapIhGVdzQzApa8O/yXGdiCBELz+gadB8PZJJUQnr7yDZtIF9lWIo1lzbNnHxCgXFn
         7/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689262012; x=1691854012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdH/m7h/MNAU1FeEEW8i3XaU9ld39R41tJa+AFaiGOU=;
        b=blTiMswT6Xgd2sZz/6Z29kkuAbbv5bYWJ/UrKBhRTDAt8SrinRWA6fioQKBCpm1TnD
         BbRXkJEOW99FwnNmExZ5vVstdrWD4ZW9Pc1MVB3O3IA6xkCzG8WuLwCsgpmb9EPKzevd
         hN7vr14UDtZS1lVPGeDY0ZRk3jj1d69dCOJ8SnyXtpg1ec1GX22J5n19TKNX6i7MNVeY
         veDYrrcJ8HaaOnuMJctMJI/zTcC62JQn8pmwZhFc+ge2SIjNFWJwUrtA7gkASEKbWDF4
         ID/1taKXxHc5RlPO03tFRxZgyahltXTd24DkjMW1O2ASCkeTgaFpRHuM4h9TUG6n757b
         zRrg==
X-Gm-Message-State: ABy/qLay1qkonNuT45FbiyoIepKdl1iQSOSa8n8OAST6vBN+2SUt7/j/
        /xWMzR0sw7y/aqOtSJsDgfs=
X-Google-Smtp-Source: APBJJlHpvF7de7ncFCMbaiMA7VYeMWiwnN+HiaO/nViZCKuUW0/BItsvs6A4kHxx4csUhhuUtH7Lmg==
X-Received: by 2002:adf:e8cf:0:b0:313:eb29:4436 with SMTP id k15-20020adfe8cf000000b00313eb294436mr2078230wrn.67.1689262012287;
        Thu, 13 Jul 2023 08:26:52 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j1-20020a5d4641000000b0031434936f0dsm8219592wrs.68.2023.07.13.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:26:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Add missing alias for NVIDIA IGX Orin
Date:   Thu, 13 Jul 2023 17:26:49 +0200
Message-ID: <168926199654.2340273.3393121273193873802.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703113537.75152-1-jonathanh@nvidia.com>
References: <20230703113537.75152-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Mon, 03 Jul 2023 12:35:37 +0100, Jon Hunter wrote:
> The following error is seen on boot for the NVIDIA IGX Orin platform ...
> 
>  serial-tegra 3100000.serial: failed to get alias id, errno -19
> 
> Fix this by populating the necessary alias for the serial device.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: tegra: Add missing alias for NVIDIA IGX Orin
      commit: d97966df30ed8c7df0350b8ff6662e38ee88c39f

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
