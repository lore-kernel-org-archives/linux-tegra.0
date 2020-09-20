Return-Path: <SRS0=7Ofp=C5=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2C1C43465
	for <linux-tegra@archiver.kernel.org>; Sun, 20 Sep 2020 16:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1386214F1
	for <linux-tegra@archiver.kernel.org>; Sun, 20 Sep 2020 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600621109;
	bh=NQ+lZzxXAzST6cnDH4xHGLhmPBKf3E+9aaNC2DsP0PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kpAjGdhjAGgQNIJ6zqAaAB2vNWgJSJdbKdziaFptUF8UECaI1WPTBYGg3ke8hbt+b
	 N/m7xqedsQWogNwKFadmrRYkBHYpHgLqFTDJNqxad34b6TaLd+FtE4hGnj4tor5LuL
	 /ynElLU/Lg7+jHe2ILDkpFPs0OYulWstxvqQPVrs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgITQ62 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 20 Sep 2020 12:58:28 -0400
Received: from mail-ed1-f44.google.com ([209.85.208.44]:32871 "EHLO
        mail-ed1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITQ62 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 20 Sep 2020 12:58:28 -0400
Received: by mail-ed1-f44.google.com with SMTP id g4so10667288edk.0;
        Sun, 20 Sep 2020 09:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G7PP4OA5h+VeBS1TXw05HVcb3ojvGYkEGg/p0Yu3hd8=;
        b=b5sVP0P4r864PPsb1VeL3qZwdNlutnTa/j+PDShHuEkX7jnqyBeWOO5RnHyUk0GvdY
         G+0Yrrjh3bbSH8YPe61s2kuY1RI6lFu8uJozMO4/dQg//IL3oeZrC6n+bM7kbwr1f7EN
         aVLFl0bkAt0zFKDwbM/yhc8Lg0WtJRbHlseSYowr/YOdkmT5f5yTwCtfTw338hE7OA1G
         6/DfECc21RyoOhUPljvlrxH+FqPq+3wxz+LpIin+cZ98ZkcFTOdKf8hUTeXQ0mNiwO2W
         YlADxI4oAV1dssAire8QW1NSamDwx86PNKYiMqFBKqnoCf+VhG5s/2/dCw0+9SWd3q1K
         KkGg==
X-Gm-Message-State: AOAM532JUER7IxxJAUdz5M/sTNy1IV6zGBTp42/h4rssagrj4PE1NcAk
        IZu1cc/wI9cqOi5Sm3IKuLywZcwm258=
X-Google-Smtp-Source: ABdhPJwEbO/L/KDyGZvHvJrSymsA0Q05HYFDRNkZ6EAvYOehe930ufmwvHcHtV2WZvd+Br88exA5Zw==
X-Received: by 2002:aa7:da16:: with SMTP id r22mr49764666eds.132.1600621106759;
        Sun, 20 Sep 2020 09:58:26 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id z23sm6950619eja.29.2020.09.20.09.58.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 09:58:25 -0700 (PDT)
Date:   Sun, 20 Sep 2020 18:58:23 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next v2] memory: tegra: Convert to DEFINE_SHOW_ATTRIBUTE
Message-ID: <20200920165823.GA16677@kozik-lap>
References: <20200917125114.103598-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200917125114.103598-1-miaoqinglang@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 17, 2020 at 08:51:14PM +0800, Qinglang Miao wrote:
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
> v2: based on linux-next(20200917), and can be applied to
>     mainline cleanly now.
> 
>  drivers/memory/tegra/tegra124-emc.c | 14 +-------------

Thanks, applied.

Best regards,
Krzysztof

