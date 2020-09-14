Return-Path: <SRS0=22zn=CX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B73C43461
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Sep 2020 19:26:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 575BC215A4
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Sep 2020 19:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TY76+G5f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgINT0G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Sep 2020 15:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgINT0D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Sep 2020 15:26:03 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18882C06174A
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2020 12:26:03 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id gr14so1630049ejb.1
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2020 12:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=sN7hBrGXTQs7f9Xs+MBasORA18XdLyEyfIp/0fZfuac=;
        b=TY76+G5fnsTGV3dzxbUSfh5DZs/YvVPvmLz0OpBeUFq52VW+JABDwA9GkhXZ7xJwqp
         0Eg0F9Wulrsg+41gkSX5/G6GiuBEXnr6Xwjmbx3POhZVDLP0WHpoQE6aWn5FkIX4Eyb8
         EfMIyCVgI+LM5kW0fOxfjFebOnXm7JeKKb8uKbgfINLVossuQIaNxxAQnmc/0rN8mjeN
         tCPDrQM+sGvkdUEaYwIQS4QWTHvkeQFaCjhJhEeHli8X4Kmqie8Ldl0IHKlGF2MlFRKG
         WltWZwqmksg2slAB7HNtu6cbF3+RoQ6wdu2dxfbGSZe9CjnJpnwJ3/PQt/CaJFWToPOv
         37JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=sN7hBrGXTQs7f9Xs+MBasORA18XdLyEyfIp/0fZfuac=;
        b=odDZqEWDAaWdV/GqL58EVG0vrg2RqN1Boau7DEJvuAQ1lCWoiAVl19JqriNMZuJDXG
         Ki6nSL72Gw/wfdboDegM33RwvIrB4y6vTekJo6heMAGJMLuYJ7j9+79TRjv6Ey7g6EFl
         NPpbg4sdV85uwhreZm3ZfnsTeQVUc/wzwVaMf/yT9RduKKTh/SptE1WFGlNEWMEnDcAy
         lUOGdFZoLEi7ml79YbgGBCqINiahoNb2im7rJ6OdI855CANRzuW+gH/GxOEdnvh+zXfI
         oiORW9XwyGxoPlxQnE4HgoERxEv5Jut+xVI/15uxVLfs4LyQL+wgOdsHJf0wt+p3XIRU
         /XmA==
X-Gm-Message-State: AOAM532RGbwzck66YGmGsrhiU6+5ez0F2eSHwmJsDHQM++q+TZ5qCM5s
        GpRPf+rK2uvR1KX6pDwANMkbQyFinYcVkUYhWMs=
X-Google-Smtp-Source: ABdhPJw8TNplwxPV48YNvJk6e0zECa58tyuBv8nE13uNF0tKaRJ9qhZcUqMSPx45Kc0BXuxXhodciuI1hXn/RP3Kwoc=
X-Received: by 2002:a17:906:af42:: with SMTP id ly2mr15581657ejb.362.1600111558558;
 Mon, 14 Sep 2020 12:25:58 -0700 (PDT)
MIME-Version: 1.0
From:   Nicolas Chauvet <kwizart@gmail.com>
Date:   Mon, 14 Sep 2020 21:25:47 +0200
Message-ID: <CABr+WT=9nqtFNOsGpT=JM6fFc703NFR5U61vRxfvKBeqBMnEvA@mail.gmail.com>
Subject: tegra-clk not found in 5.9-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

I've just discovered that tegra-clk pull-request wasn't merged in
clk-next for 5.9-rc1
Seems like only the patch from Dmitry was merged directly.

So I hope that the serie can be merged into 5.10-rc1 instead.

Sorry if that was already known.

-- 
-

Nicolas (kwizart)
