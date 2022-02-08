Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1535AC43217
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Feb 2022 02:40:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234938AbiBHCJG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Feb 2022 21:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345517AbiBHCG2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Feb 2022 21:06:28 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2223DC061A73
        for <linux-tegra@vger.kernel.org>; Mon,  7 Feb 2022 18:06:27 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id c36so24196388uae.13
        for <linux-tegra@vger.kernel.org>; Mon, 07 Feb 2022 18:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GfyiwO2AVOWs7V8ARFBIOI0IFCwTKGrQjrE/3zF6upU=;
        b=BXwarvKwCUk8uMCc7JUjUQo1GvGoWAv6TLEy/XyIauAvOc/9/61lE8sOKw/k/jB8uS
         UH+Bp59Wxfd4TGJX9WhfE2DjpucPvJ+lN9p/+i2XOLGlAX/tlG/9tYqEh+Qxo/VMYpRr
         h8AlRQ+a0nNh3fKMTSLj1ENIQSuyiIgL5A55s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GfyiwO2AVOWs7V8ARFBIOI0IFCwTKGrQjrE/3zF6upU=;
        b=16lxc8XxRfvEHWNsjaNGWALhoVmDW/e6NAw/KBJi52kFM93/f7JRaM7MkgeCck3IHb
         8oJeNGV/we+N5YPGhAixA8yvgiNBc7CIYve6v2T3jeBXvNgT+paYiFE27JF5W+vlkbj9
         oZ984RlPmRswUus/bN6xJtnLa5xfEY7qora+kuCzYHJGNiuB7i3qHxsbwlJ27XWRjWhG
         2qYhpuzTGvDHy2slhSnq6s+hZA108EmFh5OOoGezAFcwGG4mGFMxpNET20+808KjmQyX
         elb8YDodxJ5T+svChzh7jWg9AUbwczBF2DeA7TYhovYXzFRw3M99BMAyYrjWfjhfEQGt
         wYEQ==
X-Gm-Message-State: AOAM530ywUd0CIe13q0HD89L8Zcnj1h5ZjJ0sWhwV5ovttjN3+bWGkE2
        fdA2SDucBx2atAp26o4UEzeLxhuxalTe84EO4OB+dg==
X-Google-Smtp-Source: ABdhPJzZii52HRAKxoAOaCOsULJSpqRaRBcmWqyFYN1WC42KxDRVsTykmhKtcTYTiJdMuY6EUdFhEusq8xkOEm9SVcQ=
X-Received: by 2002:a9f:21ea:: with SMTP id 97mr866652uac.2.1644285986126;
 Mon, 07 Feb 2022 18:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20211006224659.21434-1-digetx@gmail.com> <20211006224659.21434-4-digetx@gmail.com>
 <YWimShkkxkR+bQLK@robh.at.kernel.org>
In-Reply-To: <YWimShkkxkR+bQLK@robh.at.kernel.org>
From:   Julius Werner <jwerner@chromium.org>
Date:   Mon, 7 Feb 2022 18:06:15 -0800
Message-ID: <CAODwPW-2othAhTC9a_joBdHScA86iqs-FkZJZDrK5LxrJm8F8Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] dt-bindings: memory: lpddr2: Add revision-id properties
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Apologies for only noticing this a couple of months too late... but
this patch added the same thing to the "jedec,lpddr2" bindings that
were previously added by
https://www.spinics.net/lists/devicetree/msg413733.html to
"jedec,lpddr3", but in a slightly incompatible manner. Should we
adjust it to make them consistent (two bytes in one property, rather
than a separate property for each)? Or is it too late to change that?
