Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6027FC433DB
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jan 2021 13:55:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CB3922AB0
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jan 2021 13:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbhAENz4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Jan 2021 08:55:56 -0500
Received: from mail-il1-f173.google.com ([209.85.166.173]:37064 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728373AbhAENz4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Jan 2021 08:55:56 -0500
Received: by mail-il1-f173.google.com with SMTP id k8so28640813ilr.4
        for <linux-tegra@vger.kernel.org>; Tue, 05 Jan 2021 05:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=D4c6IgH3t/M66q5vOZVA/b0EesECm8skC9SpXtd96kk=;
        b=R7zJLYJITFmewFgKiLwm+uIsDrYOlvzGG1Ww74Ki9tN9+/Q1JZtb5MgqP0bthgbVXx
         mCgBOu+1O2hxG75GMRjSe9b6wKPY3+UbIxRhsNSNuCNmjJh3BPrN/H6Skbo8744pOUTS
         o53xqaBqzVRd38nHXEmPyAJ5aX5sXESNuw11zBaceP/puWPxjQQSDVxvhoyLzmVHjaHo
         IAj/XUTc/3+aYd/10TyJ7l/AnMqFVtdypveIGk6LqHCES9/BBIwfmmwnASMOBxzlITig
         OVr6VDOt5Lt/DGy3gexKO6nwveW9fhfYLG0tKXFNYKDh82RTkcezvkS+ctkUyDDnvZCf
         Z+yQ==
X-Gm-Message-State: AOAM532bB0WXR4lGwwol0/Cm0Hr+Rg6AsNMNsTq0Qi2OOkC2arXn1Rzm
        YCaIXbOE5ujzM6b+qdtVqNsWqy0sW7IRlMK731CdKbIXTQsK2g==
X-Google-Smtp-Source: ABdhPJyVkfJq03sfflqigsADYSp/bOi+BFsbIYRQKC5EoHnsFIgoCIGq3Um8Qwf2/piUaGSErfe2dcoz0X2bPSyUmJE=
X-Received: by 2002:a05:6e02:b28:: with SMTP id e8mr76313659ilu.240.1609854915437;
 Tue, 05 Jan 2021 05:55:15 -0800 (PST)
MIME-Version: 1.0
From:   Onuralp SEZER <thunderbirdtr@fedoraproject.org>
Date:   Tue, 5 Jan 2021 16:55:04 +0300
Message-ID: <CAHmqvyPGUPrfyKRoOQX_mdY+Nhmaegvrzy160k737CqA9a3-7A@mail.gmail.com>
Subject: Nvidia Jetson nano - gpio pin list
To:     linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello;

I was testing an Nvidia Jetson nano dev board with Fedora 33 and 34 (I
have 2 boards) and I wasn't able to control gpio pins via
"libgpiod"(python). Because I couldn't find a proper gpio pin
"gpiochip0" and didn't even able control LED as well.I checked
examples(python code ) and tried with command line tools but no luck.
Any suggestions?



Thank you. Regards
----------------------
Onuralp SEZER
Fedora Ambassadors EMEA Member / Turkey
