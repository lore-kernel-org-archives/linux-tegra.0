Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE16CC04A94
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 15:18:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234510AbjG0PSM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234631AbjG0PSJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 11:18:09 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BEB1BC6;
        Thu, 27 Jul 2023 08:18:07 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-986d8332f50so146787666b.0;
        Thu, 27 Jul 2023 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690471086; x=1691075886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqg1nc+MCuQ+eTAL4Wt6z2XnSkq+1XhClmAXNlVCUII=;
        b=ncVcOxXcbBBX2ZB7gWEMIlvf4QuXo2ZPrFzkH4xx52/kDO7BxNpOtO0kabRnTwzzHy
         sh/qDT1SffzkE1NwG6srMRsRyBcLos6Ii2G1Nzi+JQljnaUGtxkZFGcDE29hy5HNJykX
         tMggrnsQ4TPmor7Mos+cJSPe8vrF5WL/mKOqXXF9FdZV+kiNU/NVdiVMQij+Y3ndBadS
         0r0jWBA3z3QiNFZHtIMi2dKWz74P6nd0S/kydHZjpAP8DCdGcs23BbZBIQERpBQJT59p
         ru0jbIw23ueewRfgVfpFVJxpc9qPK/LsBplolNxqv32qHCBgitCjTdlQvwaRg1Un3x3U
         dNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690471086; x=1691075886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqg1nc+MCuQ+eTAL4Wt6z2XnSkq+1XhClmAXNlVCUII=;
        b=GnAoX+cV2ZCAxZn1uVIpysyGtipO+A2qn3MA75Rkf49RqUJt0FdhOKfQ4vGR16e5Z4
         0q4qxXFQEFPcn90lkQhKnwVDE17u5bt//R6xWs/VaHwI72d2QuPKqUvDD+NzbTxRtlqT
         vI4FrxuR/kK6Fqv2C0gCqovQdkyGQkxXmjHhDq8/41X1IaS4qWFgnTpTgi7LpP1WM3oG
         6+Bw7FhB6/MOmTTtfUqzPN8/gd+Q4TgjFVnd/zLhhnvbwzL35iZkqalpdVCgjRnopK+q
         o1ezjTT+k7cTsmiv9ht/5+3VbjM2pkpumzXgdobcJXqKtfsLXez69mDl6/pghFDuOcdY
         jLPg==
X-Gm-Message-State: ABy/qLZ6ts4F9tuDnk7pzLqWdbzAgDPXNpb8Xa05LiZYRVdsyDz3RaRO
        Bxy3X+gYXVS3UzeQB+35R8g=
X-Google-Smtp-Source: APBJJlFU4SXTr4RUTNxRWUwOV3v2O5UfHPek4X/kvWiY1mwBGIWSG7AEHCu/3AhIAhSt/D7Lhz95og==
X-Received: by 2002:a17:907:7759:b0:970:c9f:2db6 with SMTP id kx25-20020a170907775900b009700c9f2db6mr2250928ejc.63.1690471086233;
        Thu, 27 Jul 2023 08:18:06 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t19-20020a1709064f1300b00999bb1e01dfsm894832eju.52.2023.07.27.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 08:18:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Marc Dietrich <marvin24@gmx.de>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: Reuse I2C3 for NVEC
Date:   Thu, 27 Jul 2023 17:18:01 +0200
Message-ID: <169047096697.3031511.2779632884160633652.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726163008.2129659-1-thierry.reding@gmail.com>
References: <20230726163008.2129659-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Wed, 26 Jul 2023 18:30:08 +0200, Thierry Reding wrote:
> Instead of duplicating the I2C3 node and adding NVEC specific
> properties, reuse the I2C3 node, extend it with NVEC specific properties
> and drop properties that are not needed by NVEC. This results in a DTB
> that is a bit cleaner and avoids accidentally using I2C3 and NVEC which
> would have them fight over the same hardware resources.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: tegra: Reuse I2C3 for NVEC
      commit: ba9858c53a797c018a1bbc93776e7baf3ec35ebf

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
