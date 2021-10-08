Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD3FC433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1636E60F93
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhJHUNc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 16:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbhJHUNb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 16:13:31 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFBA3C061570
        for <linux-tegra@vger.kernel.org>; Fri,  8 Oct 2021 13:11:35 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e12so33066747wra.4
        for <linux-tegra@vger.kernel.org>; Fri, 08 Oct 2021 13:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qLFCopQKc/vCOx+24oqmh4K8/QaELpGj1J/iZZrBdiU=;
        b=VWTBdZeXIfwaJM+X2owISYfzG64lPdTepaEgnRDgMR93R4gfIWiFXIgIY43mlbPHQ7
         SolmlIsZzjJJm+h5ZDeWYARZ2rbSzsezoOPu6OXy++Q3B0obVwY7mfTvkk+2h7nRKMuI
         /60S7cKILdfuaCN9tg2GYfXTMZ0ADAT+VixN8fZgLR3I5HDnJ7redcA/IQB1WOC+IXJs
         HQ6NRKOiRkaDNgzzAWk2SgJFTzo88n5RUifTaTEQQBGPLmWT2hmMewGh2l/4ra4+d85j
         K3dkDJ6EQz9xHZf9bpklhpACGCL3aIWeWP5Wf3JG40bo3wXy7iaVE3DBJN4WDwNICq0h
         408w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qLFCopQKc/vCOx+24oqmh4K8/QaELpGj1J/iZZrBdiU=;
        b=D4/vO7pE2+px0Rxk86mNU+hBJB8ahYJVJjHQGlwgYineJSsZXc1rJxHkgeTHjwRq8w
         TTAzACM1pEHuD5eH7sqKfrI7MV+pfdlIHvHum1o5nY/oLtOJ1iNRFFjcQOu6tcJB14N9
         XCAOLubNRiWEgbgxnjNbtEuPm9qwNsWN0Or5pa0plNjPansDcpD0jqsMFvq4sAH4EyPN
         2ZI8RlZux5v9+vbnol7bkiky1OlBPKf6qL9ancPfiCYzAPso3Tx6syjCJEhXjOfxoeky
         86c45J3/6LJbL0JiiE/2oX/CIBSP+us23djUwXmPwsuKJ2xF2/Lk53+p3q8INHkUMuRa
         dVHg==
X-Gm-Message-State: AOAM532WfGb0KAgCEvlLTs2vh5s3WSBfK7vCeIDLBB/bR6T6ySD4oFmw
        JL+2uvLqiDaC9dWe7H7XT5w=
X-Google-Smtp-Source: ABdhPJzLOc3FiX7dmOXgt/JXpVgkQmOXYZ/fKRhgqMZZTkGvCQ8IBUvJF21hDW4S6o/5g3uW/x10lg==
X-Received: by 2002:a1c:2:: with SMTP id 2mr5692258wma.87.1633723894408;
        Fri, 08 Oct 2021 13:11:34 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id z17sm150277wml.24.2021.10.08.13.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:11:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 0/7] NVIDIA Tegra changes for v5.16-rc1
Date:   Fri,  8 Oct 2021 22:11:25 +0200
Message-Id: <20211008201132.1678814-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

here's the set of Tegra pull requests for v5.16-rc1. I'm sending them
out a week earlier than usual because I'm out of the office next week
and want to make sure they don't miss the v5.15-rc6 deadline.

These patches have all gone through at least one iteration of linux-next
and I haven't heard of any issues so far. If anything should come up
nevertheless, I'll be back online shortly after v5.15-rc6 and can help
fix things up. If anything urgent happens before that, Jon should be
able to fill in for me.

Thanks,
Thierry
