Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA77C001DB
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Aug 2023 04:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjHJE7V (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Aug 2023 00:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbjHJE7U (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Aug 2023 00:59:20 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83D12115
        for <linux-tegra@vger.kernel.org>; Wed,  9 Aug 2023 21:59:19 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-307d20548adso511370f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 09 Aug 2023 21:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691643558; x=1692248358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=euAie5sbhK9BZf83ob1dTMY0SFdxl8s8/ookcEMMCEs=;
        b=I+PAaO+y1JB40rnflIsP6qBHBb7+RnISJLYhNDdFx/8rkwSCvoaZCc9WUcfgKVmo9O
         36xL2Axim6NdRpTxC7LOXn+MCe57LcPQwiKMaGU+6b5iQDiFueAJ3QkN8pfTcz40G4eV
         mBtdYd4xjLoyp3tiS3Mgdvsvy2gRrYYdComQMx9D1KHS598qJomyTYFKrnlkXN0paRfQ
         uSP2N5O6ucvbMYPUubns+lOLKg6xDYOJmDenW29Kwd2dFUDo5SHyXLTi1CXoVtXQ04TM
         mMYdyq9+lWKvOljC/jKm7kODtA5Nh8Svg+YsXwgjEbaZYjxfW4qCOqXUmVoOtsp5CIRE
         TDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691643558; x=1692248358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euAie5sbhK9BZf83ob1dTMY0SFdxl8s8/ookcEMMCEs=;
        b=TT0gTpnvflRWOzN9x38bEMufwnJICqQWVmgiU6nhSwrmsEzJmQWj0/dgYAJYyZhB0f
         OMu5yrOj/s/ccis2bw4qi3e9Mgy0LVDltX8P3ENe57yu3Bs8l/clwzC2At2YJJZ3mX0S
         7syCiMQzM66Ed7eIV6ezlbJIgWzM8ZW3hXvOR6p3EMf/vzPNF1+oKt6fvDEiQK3gXJ1S
         vrm/t+ztl+xXZnNBShI8cMkCFS0lp6f5/lzVLQNyXNh513ol6wkKQz/hHvkfBBJAFNLW
         yEQCEoGUKQYzZHElI+O3N5ERx6fjxuPv3olkBxNm+1T6wWsi/hpu9hOcQolRCp4K8jUg
         VC/g==
X-Gm-Message-State: AOJu0YwXUiTRALHO00oQzCj7AQUMc6V0f1egI8rHFPEM/7eQ1fZ0LEnx
        rEicOuDx5tLw/m6qfxov+TV24g==
X-Google-Smtp-Source: AGHT+IE3qMjYxsryjuXtRo6j6co1x8mQdJoIMUPhdqd9mvnf9/A15YHII3zIiOejSOGEayfI8ONtNg==
X-Received: by 2002:adf:d0c2:0:b0:315:a043:5e0a with SMTP id z2-20020adfd0c2000000b00315a0435e0amr1029294wrh.56.1691643558126;
        Wed, 09 Aug 2023 21:59:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d4388000000b0030647449730sm779008wrq.74.2023.08.09.21.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 21:59:17 -0700 (PDT)
Date:   Thu, 10 Aug 2023 07:59:15 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-tegra@vger.kernel.org, ac100@lists.launchpad.net,
        gregkh@linuxfoundation.org, marvin24@gmx.de, alex@shruggie.ro
Subject: Re: [PATCH] staging: nvec: paz00: remove unneeded call to
 platform_set_drvdata()
Message-ID: <fb1cc561-926e-478d-a6ce-9d97fa0dd0e1@kadam.mountain>
References: <20230809154211.15741-1-aboutphysycs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809154211.15741-1-aboutphysycs@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 09, 2023 at 06:42:11PM +0300, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Also,
> the private data is defined in this driver, so there is no risk of it being
> accessed outside of this driver file.
> 
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---

I think you are right, but why are we doing this?  That one line is
hardly a huge eyesore.  It's all risk and no reward.

Have you tested this change on real hardware?

regards,
dan carpenter

