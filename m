Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79EEEB64D8
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jun 2023 14:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbjFVOoZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jun 2023 10:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbjFVOoN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jun 2023 10:44:13 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0A726B7
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jun 2023 07:43:42 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31129591288so5496582f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jun 2023 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687445020; x=1690037020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=od/xtJOmkVNZD4Emxi52MEHI4/IuSoCynJgTaPaI908=;
        b=uoo7Suk0yL3A6EhQk7KjrD85XfGLA7s8Cz2CjVg8Tz5bxp7t/Z79aD+doebqJsjQS9
         wKUxXS63cC26Rw7YvaJq38snDl8IKSgTYL2i0u/aml7fauDvzzq70wRCvhvA3YDGeY4r
         3XM20xGrA1ANkVJF4NJ6UU6RjJjBLKJ7+zbRmFzsQNKDD3aqcUGI4xPwGBNCqXDAI2Ah
         Jkk4gNP2iUBsV+PZRPdCfOdK2NQgI0eSgSOUGb6NHdyLot2fAXuUyZdoB3iHRo4+WorW
         sK6ReRm2I/ktMdFurhCqQjlZQbp/In92HUS70QWsbfhBz8kEKCKObCWjpiEELHI8A0sv
         ewqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687445020; x=1690037020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=od/xtJOmkVNZD4Emxi52MEHI4/IuSoCynJgTaPaI908=;
        b=DvD6A2gmBgZ3NNCbvb0cwhPTNJD9BiMGSuPM4HmPhnV1vvPFvcyurYcN6BXntSOSJR
         fEJ2pvF6sbHiSHbOnZLD6xm/tV0O3TsZXhADEJHpT5qfyAmaTfzSgJfLfgch9T6oynej
         xkA/kIv6OYbMzJ961JU5bfgP+9vAmucWqJVma/sxJJhmOkTT/MMGAVC0g7t/KleZ9kPE
         3KSdbk2HVjhKZfVi6m96ZY0gd2a4/FZwOEeGjgwtvW28T+4A155V8kMz6sCRETEUjZ2n
         1mHVYil0NGSB4gcAiwF3fXa6IHhYKeQ8OExmoVbEuKjvVwZ7O2NGPqpfhUtkD5MeEWDB
         y6xw==
X-Gm-Message-State: AC+VfDwCeRDn9m7NY5gDAFjyLljGRPCRAHyBxV7YI0WhZmYIUFUrQAH8
        kfHJGi6ktR70et/8vqeiGTNpOA==
X-Google-Smtp-Source: ACHHUZ63mh9BZsQQ6IvTLnC9jWlx2wvtyzVVdcd+MaPU1tsWrzs7FL7761XzjGOto3k3ncpdd51S0w==
X-Received: by 2002:adf:f7cb:0:b0:305:ed26:8576 with SMTP id a11-20020adff7cb000000b00305ed268576mr12953282wrq.9.1687445020153;
        Thu, 22 Jun 2023 07:43:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x7-20020a5d54c7000000b0031270cf1904sm7256321wrv.59.2023.06.22.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:43:37 -0700 (PDT)
Date:   Thu, 22 Jun 2023 17:43:34 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [bug report] usb: gadget: tegra-xudc: Fix error check in
 tegra_xudc_powerdomain_init()
Message-ID: <313cf91e-708e-4409-9a5b-92061c45f616@kadam.mountain>
References: <8cbe7273-edd2-40c7-8339-1c05d8d74555@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cbe7273-edd2-40c7-8339-1c05d8d74555@moroto.mountain>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Ok, Tang Bin's email address is dead.  I'll take care of these.  There
was one other one I reported earlier as well.

0f6e8d8c94a8 (venus: pm_helpers: Fix error check in vcodec_domains_get())

regards,
dan carpenter


