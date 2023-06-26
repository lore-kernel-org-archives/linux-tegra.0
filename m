Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E827EB64D7
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Jun 2023 13:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbjFZNBO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Jun 2023 09:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjFZNBM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Jun 2023 09:01:12 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADB310D
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jun 2023 06:01:11 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3113da5260dso2735273f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jun 2023 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687784470; x=1690376470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PRFMtW1n5WTYQjYvVy/I9g/WOAZN488DDgX8HS+qDGc=;
        b=Jrz1KAMAKfMtJJsQH6PyeitwpJnwbJBDFkHRjFASqFOFrua68iYG5NJNX1SZ6Lyb6t
         Vp2ecpdBSPh68DWhtDeEqY4LgYXB+1/LBxmHE8xpgfl9/8k//O04MiYqNcu3XnZA4Jty
         f3k0vA1YBFa9sMaumBZY6ff25exH4+izejZHjGQBmgxeDQJK2wlDdDUfpeSzXgBj92nD
         4/uEr4SgdvOfwFejTqapjzsoPku8niMKfS4THYXhpIRL4sdQEBJT+yUKBuTVEDyKJ9Xi
         ZjUmqJPdD9YZ0qVkh3U1Ub73VLZYreKw5pfrvwPt8nRNZB2PxpvuEcpJDeaMRBFUTe4W
         H4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687784470; x=1690376470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRFMtW1n5WTYQjYvVy/I9g/WOAZN488DDgX8HS+qDGc=;
        b=M0z/yjEbcbRcs8nlwUNVGmWDqsCnwPwIoFThQ/c4c7tekVfctrHZPC6WarOySb/qUf
         imUmKGTIMgiU/YLcEuvu1QfuLag6JXrvea9BHud/cnNU+uz79TxFJA9OaCQ9PMVdGMXk
         qUiyLwCNuKscQE3emwMs4s8TT3KD9TghV1g4EfDSUel+mlpAntWxNDkJ3cB7eurxaZzl
         RJmdB77hIz3jfoHBABLt1/B8O+x1q6A7SwdhUaq+XZ8B8wgylzudmoA5msJ/VdkhIVT+
         ry5UdPl70Y5hTlQCYO3mqAwxI7GXDoBNEhHGU6XtwQ4+tjf9JTlMoM9E9pq4jLBledVH
         ovnQ==
X-Gm-Message-State: AC+VfDzEBlh1HoOkcGkC3sPetkTgz/s9ZZvB5bt8DLkTnUH2ubBvqzQZ
        WIQoev6r8r/COpKpLjncNO83Zg==
X-Google-Smtp-Source: ACHHUZ6RIDygr3u+3XCSH//4Wvdyamoykdy3IJ7M9oTa5bNTdhSKtq/rdDRfYml9nEsfvcZsmswFMQ==
X-Received: by 2002:a5d:68c6:0:b0:313:e952:e500 with SMTP id p6-20020a5d68c6000000b00313e952e500mr2855606wrw.7.1687784469960;
        Mon, 26 Jun 2023 06:01:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i18-20020a5d5232000000b003047ae72b14sm7373703wra.82.2023.06.26.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:01:08 -0700 (PDT)
Date:   Mon, 26 Jun 2023 16:01:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Uros Milojkovic <uroshm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, marvin24@gmx.de,
        p.zabel@pengutronix.de, linux-tegra@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: udelay to usleep_range
Message-ID: <b7319d00-d8db-4e8b-9143-7926f8a34fbe@kadam.mountain>
References: <CAP=xWk6GvVQxzTJ6jS2pQ9dKvgoFFHc=m4yMma101MGKgdcm5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP=xWk6GvVQxzTJ6jS2pQ9dKvgoFFHc=m4yMma101MGKgdcm5A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Jun 25, 2023 at 02:55:35PM -0400, Uros Milojkovic wrote:
> Checkpatch pl alerts that usleep_range is preferred to udelay. The
> change is made.
> Signed-off-by: umilojkovic <uroshm@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 2823cacde130..8bb3b691d1f5 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -627,7 +627,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>          break;
>      case 2:        /* first byte after command */
>          if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -            udelay(33);
> +            usleep_range(33, 200);

These kind of patches are only allowed if you have actually tested it
on real hardware.

>              if (nvec->rx->data[0] != 0x01) {
>                  dev_err(nvec->dev,
>                      "Read without prior read command\n");

regards,
dan carpenter

