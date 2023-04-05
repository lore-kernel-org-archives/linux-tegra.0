Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD76C7619A
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 13:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238108AbjDENTR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 09:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237448AbjDENTQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 09:19:16 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122A026A4
        for <linux-tegra@vger.kernel.org>; Wed,  5 Apr 2023 06:19:15 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id j24so36237602wrd.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Apr 2023 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680700753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoUF4C1letzvecR9wUyLOyUPJHILnc+JWSZeFZnrERk=;
        b=oWlqsuMpGv5fZjiqtfl1p1ZBle0gKFpyKpcdI0bT3+Vqw+b0/DQ0COfFaAUgRPTQb2
         5+FcU52YPPCdXibrLUzZphnu2+doqNvaD6WQA04w+LT+5pBESJybJNcVNCB3GzcNbbdO
         0oniys4Mi+Eh+Yc8PU06+LD52p6i1Z3zWe7kdY3zrOEZEkLcQ2b2puf5mKv6A3cTFZsn
         HdRutLLeFdmPs9Z+j3lExWt74xuBAbvC8X7eBWcJ2ugyvPv5rDolp8mO2Y53rPhIV9vx
         CioQYGRfIJpJLpOqR8073+AspqdTMJKBEIqaMUhuteEnTXOdXTyLtopSzruxqUAvCt7J
         /7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680700753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoUF4C1letzvecR9wUyLOyUPJHILnc+JWSZeFZnrERk=;
        b=BPxHjDH5Yjg4KzvH2MvmrBBqZeoXLiwhvvI2wYxfb1YxS19VTYBiyB/3wwnI3qplNR
         HNXy0ob+1Ss8r9kAE/DlDDRRuA+gkFr22x9/EkwRBCtYEXeqh7geRoBAXztvplkdZoJc
         oSsIZlVZKJPsRSbgSTa7WlzQBcvmTCtblxWr5eNg17K+/fRWqMK9SSyA+i2QdkWgZo/m
         KunxPcKmyQTKO9hJWjOzeWruLoMNg0JDQylnpQ+5rKyPJclCCezhCAYQtSZ8ACIWwF46
         g5nmJlJcpxrkSaweVB0nUV5eghGvhdZ9tSYQIYZaz9NgaU9w6UX3MIz2yQWvJ2vYnQ06
         9sEg==
X-Gm-Message-State: AAQBX9fxGMF69erY6nIoPnxeGGOpel2/MRsX9eAWfLcW1SCBKWGR34cS
        LZbwO9vci8UgWqTmNJwqRdKbjoXPuCs=
X-Google-Smtp-Source: AKy350ZUjR82qii8mJ1979gHbllW2I4gqt4bcMXNPaI8DQMA61I4Oiy5b7DC//9vB0VygDvRJa4Kjw==
X-Received: by 2002:a05:6000:192:b0:2d8:4e4:8cf1 with SMTP id p18-20020a056000019200b002d804e48cf1mr4157046wrx.21.1680700753629;
        Wed, 05 Apr 2023 06:19:13 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d5002000000b002cfe0ab1246sm15050606wrt.20.2023.04.05.06.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 06:19:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-tegra@vger.kernel.org
Cc:     jonathanh@nvidia.com, thierry.reding@gmail.com
Subject: Re: [PATCH -next] soc/tegra: cbb: tegra194: use of_address_count() helper
Date:   Wed,  5 Apr 2023 15:19:11 +0200
Message-Id: <168070074190.4045154.11804704235653901147.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20221027065625.1443750-1-yangyingliang@huawei.com>
References: <20221027065625.1443750-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Thu, 27 Oct 2022 14:56:25 +0800, Yang Yingliang wrote:
> After commit 16988c742968 ("of/address: introduce of_address_count() helper"),
> We can use of_address_count() to instead of open-coding it.
> 
> 

Applied, thanks!

[1/1] soc/tegra: cbb: tegra194: use of_address_count() helper
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
