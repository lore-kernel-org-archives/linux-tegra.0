Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140CDC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 19:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6D0661260
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 19:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhKRTQi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Nov 2021 14:16:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233353AbhKRTQh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 14:16:37 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2342CC061574
        for <linux-tegra@vger.kernel.org>; Thu, 18 Nov 2021 11:13:37 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id u3so31012227lfl.2
        for <linux-tegra@vger.kernel.org>; Thu, 18 Nov 2021 11:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tyvrVQ6HAAc8RNdhaLQn5bJB2W5wrxWYBIeg7TY3onc=;
        b=nFa54ZvqWRYjaaeZ2eIgOMMQfJzWmcyrCw+3T4fRXhfMCygQuAoxkrZ8/SLhAdRdai
         iJcVFj5LCQZ2PdsuE+Zrg7w8TyQk0dssHB4RGHgxTeb77WLp1RyAW7uArUi1wmMyluF6
         05aKSb/XTpckRad9Ad4cUpzdvVx40Qu62G5SoCvCgXPlS4QJiIEsqYJcskYXsJmkluRM
         5H/44slsfeZLKv0E/rI+DNZHxkM4KMYn4k3sNETPykFrbe8vUVwwIVrr7TnzUn4bIax4
         oe9VeSFRvsqFcQXGkv+qNTsxp3uLWWEr9QBb4mowsRYpJ70Ft0WD+UpLCTlzQQvz9Znc
         kudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tyvrVQ6HAAc8RNdhaLQn5bJB2W5wrxWYBIeg7TY3onc=;
        b=FlRoNycv2b9iJ5wnK34v8Gp+kNGrqfbQ6lKlhnWtuxrGhh6WOKm9Y41UNFjwE5N7W/
         6Lp+BtYh/doeJMXWqVHufs1mowXOEy8n8Flk6AZcfL/Khe2BQ1uxYZbfioMbWYGDsF9T
         PYMTCsSxpX7AwIGOwXNYvibcuwmYbdyjuf27tzVT/TQNNWooerA43HwUNXeHiSSxav0a
         XAfS/eHo5iO/9yoxPlaz5hldNFPc+it95aY0UP7wHKEc6f+F6dKdIy4OF42tA6z1Eb7B
         0XGc6CqP4glTuzaT7RFVHoo5ybYoGiLY5dhKKmM1L1Z6aPPET2iwKnZJgwVF8bBk/vz5
         Mo4g==
X-Gm-Message-State: AOAM5331xVajwYsgubxouCfp1ldBVU6hmB8lGMhoPivmtgZq0uksX3to
        dExFxVABjPgJRjWP6CHDGWt8Vfi27uw=
X-Google-Smtp-Source: ABdhPJyMchatDvJEdhsJC+lurmLOH2UxZS60ya4EvrodDObBgJ/XSA3qw0vL0dpNRrTaWisRZkqJLA==
X-Received: by 2002:a2e:95cb:: with SMTP id y11mr19795974ljh.431.1637262814961;
        Thu, 18 Nov 2021 11:13:34 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id x27sm88208lfq.192.2021.11.18.11.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 11:13:34 -0800 (PST)
Subject: Re: [PATCH] soc/tegra: pmc: Add reboot notifier
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
References: <20211115113208.237296-1-jonathanh@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b0274558-7ad3-bc56-01ea-eb9f89716c24@gmail.com>
Date:   Thu, 18 Nov 2021 22:13:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115113208.237296-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.11.2021 14:32, Jon Hunter пишет:
> -static int tegra_pmc_restart_notify(struct notifier_block *this,
> -				    unsigned long action, void *data)
> +static void tegra_pmc_program_reboot_reason(const char *cmd)
>  {
> -	const char *cmd = data;
>  	u32 value;
>  
> +	if (!cmd)
> +		return;

There is no explanation of this change in the commit message. Previously
scratch register was cleared if command is NULL, now it's not. Why?
