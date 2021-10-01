Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EC1C433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Oct 2021 20:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE76D61AA4
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Oct 2021 20:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354891AbhJAUgl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Oct 2021 16:36:41 -0400
Received: from ixit.cz ([94.230.151.217]:32840 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229975AbhJAUgl (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 1 Oct 2021 16:36:41 -0400
Received: from [192.168.0.80] (ip-89-176-24-98.net.upcbroadband.cz [89.176.24.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id B8ED623B26;
        Fri,  1 Oct 2021 22:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1633120492; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type; bh=LxJABzFsb0lVTDgUqaK2592wVa6aZVe5gxm/fjD4+MY=;
        b=SC8hNQocNMGDi5ThbTlI82KcrlbB0HFchni2PKEyd0QKWY//bSz//7SY/8DqRVAx93pLUQ
        4S1v8InXUzXJ02IZadL81KjHR5W1ckUId2cCi+CM7ov59amEM1mApHbHh/q8pK1sogiXjD
        xji9qSryFFgCURC/PG+NcLZIxnitnRY=
Date:   Fri, 01 Oct 2021 22:33:24 +0200
From:   David Heidelberg <david@ixit.cz>
Reply-To: 20210621141559.2881667-1-thierry.reding@gmail.com
Subject: Re: [1/2] dt-bindings: clock: tegra: Fix USB controller nodes in
 examples
To:     Thierry Reding <treding@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Message-Id: <ORFB0R.JLGA7D3O2JCT2@ixit.cz>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch should go in regardless of 2/2.

Reviewed-by: David Heidelberg <david@ixit.cz>
Best regards
David Heidelberg


