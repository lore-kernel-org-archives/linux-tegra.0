Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFADC433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:51:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 038EF611CE
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhIUJwn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 05:52:43 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37548
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231536AbhIUJwn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 05:52:43 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 995AB4025C
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632217873;
        bh=ANyVFwa8/cSt4LiPU1T6EcsddAoJy9awAm8594hSheg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=o+ZhixaJEC81CZAoNEXB7W1IyNYWsQBwWM5gVKZsBx46nKXiL5bkywbQOrfhnAGBh
         j5ZIjD6E/6/z3F8SHZoQeJIxH80DggaDiYmlbGXrfvVSh+r8clvp8gNpiTW7Z961F0
         AZVaxNS5QWmxDfG4t4UDBNvLgDDAnipPWPEaM3k97mlvEKfoitD/hTbGw5fKMuxMTE
         sdco5sxk5LbRM+qk0Fem8DFfQ4pKRbQwDF+xnX+mHqUTg0t4Phzr9JXRBWU9tS5ix0
         mf+Vr/eYoxjxpeim/SU0HJnIlOjc3eCIto4rT4I3agIe4COJOfXIvMr7bjdO2ELGzd
         Q4+UL0j2NSgwA==
Received: by mail-wr1-f69.google.com with SMTP id z2-20020a5d4c82000000b0015b140e0562so8378203wrs.7
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 02:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ANyVFwa8/cSt4LiPU1T6EcsddAoJy9awAm8594hSheg=;
        b=5hvX2LeqeGD/jbSSpY2813rfwsOQleTcXT8NcoVsiiB2hHlQuOrgYPR4WT063TGZC0
         Lf/vsnTJ/S5OsQ0bSWdJcL/lAEHPTAHkVi0w//u6OCuR3D7x17lYxO5Tk82rCtG1C6Cv
         tAdrNTjr70Gt3rtb/mFPZ4hn/YCFBSzUWLAw/lOWvDFti5QktYZ9ApIT8BOVwv4wH8BQ
         IrIuoU/RGVEVzWoaHxgLYPuExb5UieHOPkrr29O1MnyZKcql6gXDG1PGvZBfwbiZeSKT
         t6OKiIlHy3I/YpQLdvR5tjPCc3m9ZdytGbB97EI7gKMSjVg+nlBNrw5ctzCr8XVXo1H0
         8NYQ==
X-Gm-Message-State: AOAM531NZOOV2rXahONaeFHH9wnvptW23B4VPRCtdvCibYtb1ODWbItx
        p6Sn/TDEHpnP6mhnmbTVsztpdK8BuUfUQd1g/vN++hl+4K7mAyhfe978pqy/OHzrJ7b33vL/8i1
        mTK28jUsK0pUmo88NZLrGx4opuFJYXNptjbKd4274
X-Received: by 2002:a1c:210a:: with SMTP id h10mr3660096wmh.117.1632217872136;
        Tue, 21 Sep 2021 02:51:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaD4ttkkbvIoXdYO3QkoQKEbWCzyZA83Qx0shJpz/rWqDxNHrBU0ogPqjDK6L54QUP/fwE2Q==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr3660066wmh.117.1632217871940;
        Tue, 21 Sep 2021 02:51:11 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id x21sm2264969wmc.14.2021.09.21.02.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 02:51:11 -0700 (PDT)
Subject: Re: [PATCH V1 2/3] trace: events: tegra_apb_dma: add SPDX license
 identifier
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
References: <20210921094206.2632-1-bbiswas@nvidia.com>
 <20210921094206.2632-3-bbiswas@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <17f1827a-5919-271d-ef00-d2e95d046226@canonical.com>
Date:   Tue, 21 Sep 2021 11:51:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921094206.2632-3-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/09/2021 11:42, Bitan Biswas wrote:
> Add GPL license in Tegra apb dma trace header file.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  include/trace/events/tegra_apb_dma.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/trace/events/tegra_apb_dma.h b/include/trace/events/tegra_apb_dma.h
> index 971cd02d2daf..fe10897b00b8 100644
> --- a/include/trace/events/tegra_apb_dma.h
> +++ b/include/trace/events/tegra_apb_dma.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Looks good, but you should Cc the copyrights holder (Ben) to be nice and
friendly.

Best regards,
Krzysztof
