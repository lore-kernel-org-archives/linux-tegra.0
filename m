Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5579C4167B
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Dec 2020 20:19:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76C2523C19
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Dec 2020 20:19:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388284AbgLIUQT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Dec 2020 15:16:19 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38997 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388112AbgLIUQM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Dec 2020 15:16:12 -0500
Received: by mail-ot1-f65.google.com with SMTP id d8so2661225otq.6;
        Wed, 09 Dec 2020 12:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HkZkOlvU17tWN9kGhwEHEyzk6vBPnUYvFHyetdZXKVA=;
        b=tA/i7RnmWDmwrK7r+NW9/AQrGHqd/VxnZG/MQmFiulzPxS6ihR2PIXOZSwo4a3bP55
         85X/FJ4mQzH6EU8haMSo/o5mKzZ8CE2Vw8Uv9aJSyX/537Qe3ZXlYCfRsZgeG+jAtPbf
         oNWZWDTJJqUkfO+Or1fsdbsurD6x3qMFYttJxuCiZgOK3R2WHmqarw6NlTCAFN5yjz/t
         wtXYdDBdCSFgkw8Qj5smSEJK8Xf4mpdo1ApqligZesDhlaKBJbZVRRj3QM9Y5e6DAGUs
         P6gPlHtYSQp+XOGg6ALh2JkwDybd6QsdkYRiewFsc0bYi9PvLe7ejuTCPLqMutcsGhq3
         Plrw==
X-Gm-Message-State: AOAM532iYVHRNtFTp1ZWbZ0K/HaCh5YV8VZud1CLP0IchFL8qe6YC5xk
        z5u4GquODPWqAvaECC9KLDz7pFtuyA==
X-Google-Smtp-Source: ABdhPJz6SA76JGYn9n/Qh4vb6FiikJm900RuCu35Bj3qJ5ugpBm0a7qioElUowlY/gcxRlS7VcXqAQ==
X-Received: by 2002:a9d:7f84:: with SMTP id t4mr3198018otp.302.1607544930935;
        Wed, 09 Dec 2020 12:15:30 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i1sm518487ool.43.2020.12.09.12.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 12:15:29 -0800 (PST)
Received: (nullmailer pid 867331 invoked by uid 1000);
        Wed, 09 Dec 2020 20:15:28 -0000
Date:   Wed, 9 Dec 2020 14:15:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
        linux-tegra@vger.kernel.org, sharadg@nvidia.com,
        linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [RESEND PATCH 1/2] dt-bindings: tegra: Convert HDA doc to
 json-schema
Message-ID: <20201209201528.GA867274@robh.at.kernel.org>
References: <1607006202-4078-1-git-send-email-spujar@nvidia.com>
 <1607006202-4078-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607006202-4078-2-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 03 Dec 2020 20:06:41 +0530, Sameer Pujar wrote:
> Convert Tegra HDA doc to YAML format.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra30-hda.txt          | 35 --------
>  .../bindings/sound/nvidia,tegra30-hda.yaml         | 98 ++++++++++++++++++++++
>  2 files changed, 98 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
