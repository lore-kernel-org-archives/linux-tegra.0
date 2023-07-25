Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F1FC001DF
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jul 2023 17:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbjGYRkj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jul 2023 13:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbjGYRkj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jul 2023 13:40:39 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311FF121
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jul 2023 10:40:38 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b890e2b9b7so30098535ad.3
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jul 2023 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690306837; x=1690911637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Sv6RhhD2OJJ378oQxxX2/JYorhzYA4ysA3rgUUNTUQ=;
        b=CWhWmNbvOsKVb6ltc8xLwqSvpvXGKJeEnpA6s4wKZn0nAOObPUZ8mMcGMvy7svXVIb
         GuY9sW0N8BJaYeemnIVgEZOq0wz2xzkhogehp0qrYDJalsZPAdbiWKePplJKt4VevLOi
         FNiV2OFfAWtjZsOcUvgUqwJwslF7TaEVY1L5s51Lp9VYECZ8Nm8q83CygyLKOq5fH70K
         EZ6ELRhXdFJISawwLQDZfYwIrPOwZuLgpCW9WHUL477o6W6hoRbCze7F2/D8KLTYHOQM
         +LB09ZQum2dpdRdQ8xIXmdCW+ZbfvcdfFTkteODDXH+cYerrzmjid1kzjOlfbDh1ORwZ
         TY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690306837; x=1690911637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Sv6RhhD2OJJ378oQxxX2/JYorhzYA4ysA3rgUUNTUQ=;
        b=KAVdRELur/onJ5QPMwr+9Ny/EYX3/x9+AqXMkKH4Q5gZv6ghP2p6y1UZGePuiBuZdJ
         Lho8CIrCgcdfyAtVkxt3GRzDF47A1O+ID5nEDNKGy9W+ozXKakyAS6jc7NNnXpnIs17F
         mKpxzxlXdnKR1em7wgSgvFIi6Mf9wNPwm4b4skREjaWNRMDrdK6jCXRrmgCZvCxbc4Vh
         gIGOzlpS5xNi8pFcocPM3m4JxcCGHapRwKohh2oADPkTZAUvrkCnlxzopuH4TSp6irsf
         ffAIEAu5l6OkPnb4rbX5LnvRHUegQFl6/dsJv9OL5U4PvOIVIxgVk6L4MqEz7OTSxsmq
         RsRA==
X-Gm-Message-State: ABy/qLYIYGWwU6gD1hKc3xhXQd+sSR1HI9qy+E836Av5j2V6WXKOdtHM
        m3+0kEzH6D1gLLNs2lauo9JWBg==
X-Google-Smtp-Source: APBJJlEuDDemPZWAwnJ/la3ZQzdNd/8+GV/CGdRT2E2iwFRPz90bMYk+KylKvJVFGRYiW/3M9fuuVg==
X-Received: by 2002:a17:903:2305:b0:1b3:a928:18e7 with SMTP id d5-20020a170903230500b001b3a92818e7mr10553981plh.59.1690306837487;
        Tue, 25 Jul 2023 10:40:37 -0700 (PDT)
Received: from google.com (41.183.143.34.bc.googleusercontent.com. [34.143.183.41])
        by smtp.gmail.com with ESMTPSA id g4-20020a170902c38400b001b8b26fa6a9sm280017plg.19.2023.07.25.10.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 10:40:37 -0700 (PDT)
Date:   Tue, 25 Jul 2023 23:10:26 +0530
From:   Ajay Agarwal <ajayagarwal@google.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Nikhil Devshatwar <nikhilnd@google.com>,
        Manu Gautam <manugautam@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Sajid Dalvi <sdalvi@google.com>,
        William McVicker <willmcvicker@google.com>,
        linux-pci@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4] PCI: dwc: Wait for link up only if link is started
Message-ID: <ZMAJCmfixoZmjPVI@google.com>
References: <20230412093425.3659088-1-ajayagarwal@google.com>
 <6ca287a1-6c7c-7b90-9022-9e73fb82b564@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ca287a1-6c7c-7b90-9022-9e73fb82b564@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Jon,
This issue has been reported on a QCOM platform as well. The patch will
get reverted:
https://lore.kernel.org/all/20230706082610.26584-1-johan+linaro@kernel.org/.
Once it gets merged, I will upload a version of my patch where I would
not fail the probe if the start_link() is defined and the link still
does not come up.

Johan, is your patch set to be picked in the next release?

Regards
Ajay
