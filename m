Return-Path: <SRS0=SK8g=DT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2594C43467
	for <linux-tegra@archiver.kernel.org>; Mon, 12 Oct 2020 19:05:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9411521BE5
	for <linux-tegra@archiver.kernel.org>; Mon, 12 Oct 2020 19:05:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2KU3BiT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391045AbgJLTFn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 12 Oct 2020 15:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388321AbgJLTFm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 12 Oct 2020 15:05:42 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB002C0613D7;
        Mon, 12 Oct 2020 12:05:08 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id b19so9146078pld.0;
        Mon, 12 Oct 2020 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p3cGg0vwc3FihVmBETo+InQcjCzVvWFZGiYWNMDgXHo=;
        b=R2KU3BiTA8Nmrr+K+h2kh4PXN+JdaEKRuc92/hX1rea8+M04xV2DSjJQpLRaMmFOr+
         Cb429Bwwk0r6kfUdw83y/EtX7PKpROIqCEPLVR+F/5rObYZl4l6sDlbnrLEcU85TZDS6
         9oC9WCirk8Z3FGbpYsR+i5rfPSrZFOBXkVTRdmmItGUJEevsRq5+xAYzi2Gn0s91LEfU
         a2AY00IIjvAOJLTKklCSa3Vf/Xuqs8Mgn/dot64N407SSJodWreCO9D8VIOKopXhwHYe
         GGwpGUzvi7ougmirF5pmTBJKUoKrl2yfQdXEPTNAJpAKkWqKXPtOIf6PmUblYgtpaXxw
         Xynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p3cGg0vwc3FihVmBETo+InQcjCzVvWFZGiYWNMDgXHo=;
        b=ZxVEnViCjVRGwVI0vUBjYKrR6Hqi/1+aidvaBDj7I1ksbxsQZy+GxOgv6K+TsoDzYD
         FM/SQPtRSv83jps9VczC2bSOFQ1KTL5itw0K/xg3hLLvMLw1j1eln3q8jb4MXHhUjugx
         Kda62Y9o0RnxZuHqxNKZMn3m/RBsb4nxfJiZF73JM1cpR1rKDt6W+2OlCkB97ihDOGcg
         dWCUkV8BUXJ6UqrT1cROK2HrXp7wPHjSTXh/ZyIZkZKumBDTW2sCirNfoPhQRL8yB5r4
         yMzX92jeAlBSKpLBnxHiNAo9u/BZu/ucunsfBkpU+n6Dx1Nn84vy4/O0uPX1PBXr5Ewq
         nl+A==
X-Gm-Message-State: AOAM533XK215eOmbPcsU7axSYp3lzsmoZ/7qXhHhG9sRTnWMnT/7WubM
        9wrAx6Vi6FKTtwEF8DPltxwUc9rP9lk=
X-Google-Smtp-Source: ABdhPJzjXdwKjMlIP3AJiMsod6ukBI9sxvQE+gfn2RqN7aXk0BNvM2fP+ILXyldXKpEmA5rdKmvAbQ==
X-Received: by 2002:a17:902:ee83:b029:d4:bdd6:cabe with SMTP id a3-20020a170902ee83b02900d4bdd6cabemr17253953pld.68.1602529508244;
        Mon, 12 Oct 2020 12:05:08 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id v20sm15896961pjh.5.2020.10.12.12.05.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 12:05:07 -0700 (PDT)
Date:   Mon, 12 Oct 2020 11:57:22 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] memory: tegra: Sort tegra210_swgroups by reg address
Message-ID: <20201012185721.GA17643@Asurada-Nvidia>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-4-nicoleotsuka@gmail.com>
 <20201008103258.GA16358@kozik-lap>
 <20201008202615.GA32140@Asurada-Nvidia>
 <20201012164340.GA3557@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012164340.GA3557@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 12, 2020 at 06:43:40PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Oct 08, 2020 at 01:26:16PM -0700, Nicolin Chen wrote:
> > Hi Krzysztof,
> > 
> > On Thu, Oct 08, 2020 at 12:32:58PM +0200, Krzysztof Kozlowski wrote:
> > > On Wed, Oct 07, 2020 at 05:37:44PM -0700, Nicolin Chen wrote:
> > > > This is a cleanup change to prepare for new swgroups.
> > > 
> > > What type of cleanup? Any functional change?
> > 
> > It's to sort the swgroup list by reg address as I mentioned in
> > the subject. Perhaps I should have put in commit message also.
> 
> Indeed it is sorted by regs, I missed some numbers... looks good. I can
> adjust the commit msg so no need for resend.

Thank you!
