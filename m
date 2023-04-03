Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87003C76188
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Apr 2023 14:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbjDCOYO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Apr 2023 10:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbjDCOYK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Apr 2023 10:24:10 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EAA63128E;
        Mon,  3 Apr 2023 07:24:00 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ew6so117988883edb.7;
        Mon, 03 Apr 2023 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680531838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBCxiuC+gyqJNlyUk0XbBNwlob5y05A7OfTHHRJLFvE=;
        b=gvPKnl3r2PLxZoT8h90GZRxYawFoVClhlheHV6sOJSNID61I9DzWcjId4R4mW5Yytm
         0fhVg0XptEaZK8eivDo0yO9yj8wGW7IlRZMY6lWOygot/RojiAgnxnB+Iu/9eYPy9EmK
         BWOLi+FXt3hjPN/kygwdrDHks1rm11YqhGhOns4V3X8bdiB85CKCbGa1rnAnFR0m9K8S
         l6kcchkD60WU2F/529NtWfq58+rHxp+VulRI674fvHTYdTknifYTxDsfCe32ki91DyN7
         Kn122SNOq8aKwuoqFyx84yTSUBKXPT3bRgrnlxbV5By188CJ8ovUxE4yz2TPLX8+n2b0
         Klkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680531838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBCxiuC+gyqJNlyUk0XbBNwlob5y05A7OfTHHRJLFvE=;
        b=bO4hxmZwcaxJAclWzZDI0PGnSi7ZNWI+PWqLa9v7Z97MOCfWm9maU5+uS1QYboC3kD
         6laM/tSKlNYsrbensxkDucRlg/jJrewLxxBBXk9i9bR/uRzlpJZ2o5BS8SC4N6qbQc81
         WaEtgvJRy5Zkp0DorNE0DQZ8FkWn1jkhxjL6+lD4fvlKjV7wQ41i2t3usONARD6usZvL
         nItXzMTTjU/u1YSpDf/jU+YYsmdLKL6dSeX8XO86JRNLQ/iUD22yfEGQ4mIAK6gxujH4
         AVy2S+RGSsIcE9ohGNMFcyJVF/f6JmRZSmCTp63bmckKuOIu+STaKRbjs4gKxNSNl4xs
         pQJw==
X-Gm-Message-State: AAQBX9ccWbdHKw9b2mrqTK8ndmqWLH3sr6x7v0z4psxgMssMSUyMO9ff
        EwHWCKl12VHNqhR+/vxaolWDNMfjonc=
X-Google-Smtp-Source: AKy350YTiuFcgV3gzn7Cd9wNojQEnrlUfaD6YeGaL2dsUns7COy/mkFyhQosOu4rMb6YPJ2bp5NZ9g==
X-Received: by 2002:aa7:cb03:0:b0:502:7eeb:edb2 with SMTP id s3-20020aa7cb03000000b005027eebedb2mr9188801edt.26.1680531838608;
        Mon, 03 Apr 2023 07:23:58 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g29-20020a50d0dd000000b004c0239e41d8sm4713185edf.81.2023.04.03.07.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 07:23:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Add DSU PMUs for Tegra234
Date:   Mon,  3 Apr 2023 16:23:55 +0200
Message-Id: <168053182387.1336231.14712971615107054390.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230306150157.122897-1-jonathanh@nvidia.com>
References: <20230306150157.122897-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Mon, 6 Mar 2023 15:01:57 +0000, Jon Hunter wrote:
> Populate the DynamIQ Shared Unit (DSU) Performance Monitor Unit (PMU)
> devices for Tegra234 which has one DSU PMU per CPU cluster.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Add DSU PMUs for Tegra234
      commit: 1e7861b8ea94096fcecbaaa34bfdf9925de67747

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
