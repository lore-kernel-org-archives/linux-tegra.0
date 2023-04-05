Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5C0C7619A
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 11:40:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237834AbjDELk3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 07:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237708AbjDELk2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 07:40:28 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E6630FD;
        Wed,  5 Apr 2023 04:40:27 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id y4so140344724edo.2;
        Wed, 05 Apr 2023 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680694826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DxsPN6AZzv/X2o3ugirBHpwxkcBnWPEpRNGraURAvU=;
        b=p8i1buOJzPtbXvWClWsIIpxze6tojT5FD7EXPlde+YHaRLg35bZORYCPfj6N+ZO41G
         8Ete6tzczTVPT4H32Pu6GotmBef91IhssWyKSBIL0xOAq7i8DMdMb9oGsJdJqWe5UfHT
         y3d7CFQJYvERtCW4PDJFDPIBnV4pTsakDCnztC16rd7p5kT+FXRknjLRkwuxlun3YGOH
         XQnwcoyvUEiM63P+othLir65RWXht6bUXMlBD4ssG6mBADSDnqklfqiltujXnYyrSZ8+
         s1woYsjyRFMfJagt7NIFwujR1Q9rmt2lOnJYbCq5fJvnYGien3L+bNvHQPB+b7o8XMBQ
         RA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680694826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DxsPN6AZzv/X2o3ugirBHpwxkcBnWPEpRNGraURAvU=;
        b=yfzvu37udedrmixm0q6cyW2exLGUWOItrF0j472l8HnipMSa/QETuVhBvez27p3NPm
         ssH2SydN+cm1Uq3MgDZ5whMaRFik09+9MmYv/aIkjSvcaXLPGVdXa2tHVKEO6Z0k0qWd
         xO66mKInBJjaPquDqrZqwAzSoEe3xeqkg8vuipiBO8iDHppmTVyh+VHF62YdkbXSGndA
         thuiEDZbIyansoZsOAjdJZnjrff2u2jR/4IMxv5xYDp+3C890Hmb09kqsH2KOxNBmgWW
         4albvNneuz770lr3ejgR+xmf5idZkQFS5MU4KCWp/O/WaeUvUyZnWRbx/wuRo0DJ3dbL
         HO1A==
X-Gm-Message-State: AAQBX9dOHMS4wBOm1g5C9VscUxKG+aykvEFAqmdT7i0eqbgbaEnLSGUs
        nOWk5iYKHJDQr8Iy0hsI7uU=
X-Google-Smtp-Source: AKy350ZcxdQZCdOd9iXyVXN2Sznloq9VwpM0uZ7ZoCRO6zLRZWEV6cD9rzxKvFOuex42d5I7vx9KTg==
X-Received: by 2002:a17:906:edc5:b0:7e0:eed0:8beb with SMTP id sb5-20020a170906edc500b007e0eed08bebmr2794741ejb.41.1680694825977;
        Wed, 05 Apr 2023 04:40:25 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id gx20-20020a1709068a5400b00931faf03db0sm7232069ejc.27.2023.04.05.04.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:40:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wayne Chang <waynec@nvidia.com>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH V10 5/6] arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin
Date:   Wed,  5 Apr 2023 13:40:22 +0200
Message-Id: <168069480508.4035569.16318003285399611173.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230131175748.256423-6-jonathanh@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com> <20230131175748.256423-6-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Tue, 31 Jan 2023 17:57:47 +0000, Jon Hunter wrote:
> Add the USB Type-C controller that is present on the Jetson AGX Orin
> board. The ports for the Type-C controller are not populated yet, but
> will be added later once the USB host and device support for Jetson AGX
> Orin is enabled.
> 
> This is based upon a patch from Wayne Chang <waynec@nvidia.com>.
> 
> [...]

Applied, thanks!

[5/6] arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin
      commit: 16744314ee57928c24aca95aa15f1381657edcfe

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
