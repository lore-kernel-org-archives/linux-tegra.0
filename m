Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0856FC63777
	for <linux-tegra@archiver.kernel.org>; Sun, 22 Nov 2020 11:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C43352100A
	for <linux-tegra@archiver.kernel.org>; Sun, 22 Nov 2020 11:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgKVLHQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 22 Nov 2020 06:07:16 -0500
Received: from mail-ej1-f67.google.com ([209.85.218.67]:43646 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbgKVLHP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Nov 2020 06:07:15 -0500
Received: by mail-ej1-f67.google.com with SMTP id k27so19188186ejs.10;
        Sun, 22 Nov 2020 03:07:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7nL5vldHVk+TCSj72rQnEoC/jas4L51w1DvQQNmn4zA=;
        b=Oq845lR0VjIaynXJbjQw2jTQjAWprzXK16LOptkVDcOpXN2rD0WLJYEMZczkkBdgOY
         ZvnN2NAggDFyX4aKXuKtQQOL7d//FDy+u4O3w+i3+NbU1S34vmMmI9ebV9FmZezHPOzL
         A3Vn72iBvINPlxbRnI0pQB/ExMgJOYaM69XVu3jg6mHzlE4VEPG7HmFiTNC8A5f3j0fQ
         L6hKgOtYfSDMHjJVYtKyDKtO/waCU3QsGreeRvJz0BHYcwNr8NJYsPWYWR2+6DOeX7cC
         o1a4nVB/7qqIl4fHI4z+jNrYO4KGi9mZmEgupKD4yh7BfaWCK5QrPXFAmhnRPXoI8oc+
         JJVg==
X-Gm-Message-State: AOAM530Z74T8/dte77SXhtJuR3PgMIZG7iHNknaIZca9Gbav4bL6soXG
        UNn8EDPC0t2pqYaWuARQe8uNWH+68cs=
X-Google-Smtp-Source: ABdhPJzqsQLj9qbzj7FFuDuHTc+bpHEFaIDlnY5oK0pfsSNMjB8U6JC2O5gSJa2FOkPMaOY2Z8VUPg==
X-Received: by 2002:a17:906:5cb:: with SMTP id t11mr12849903ejt.295.1606043233154;
        Sun, 22 Nov 2020 03:07:13 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id q15sm3446644edt.95.2020.11.22.03.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 03:07:11 -0800 (PST)
Date:   Sun, 22 Nov 2020 12:07:10 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] memory: tegra: Complete tegra210_swgroups
Message-ID: <20201122110710.GA5415@kozik-lap>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-6-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201008003746.25659-6-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 07, 2020 at 05:37:46PM -0700, Nicolin Chen wrote:
> According to Tegra X1 TRM, there are missing swgroups in the
> tegra210_swgroups list. So this patch adds them to the list.
> 
> Note that the TEGRA_SWGROUP_GPU (in list) should be actually
> TEGRA_SWGROUP_GPUB (in TRM), yet TEGRA_SWGROUP_GPU (in TRM)
> is not being used -- only TEGRA_SWGROUP_GPUB (in TRM) is. So
> this patch does not add TEGRA_SWGROUP_GPU (in TRM) and keeps
> TEGRA_SWGROUP_GPU (in list) as it is.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/memory/tegra/tegra210.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

