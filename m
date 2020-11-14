Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0F7C5519F
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Nov 2020 19:08:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A68522252
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Nov 2020 19:08:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgKNTHw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 14 Nov 2020 14:07:52 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:54756 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgKNTHw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 14 Nov 2020 14:07:52 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 44FE0804C8;
        Sat, 14 Nov 2020 20:07:46 +0100 (CET)
Date:   Sat, 14 Nov 2020 20:07:44 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tegra: output: Do not put OF node twice
Message-ID: <20201114190744.GA3797389@ravnborg.org>
References: <20201113204157.1942919-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113204157.1942919-1-thierry.reding@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=Ikd4Dj_1AAAA:8 a=7gkXJVJtAAAA:8
        a=Zjm92R7IybE10ZX_adIA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,
On Fri, Nov 13, 2020 at 09:41:57PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The original patch for commit 3d2e7aec7013 ("drm/tegra: output: Don't
> leak OF node on error") contained this hunk, but it was accidentally
> dropped during conflict resolution. This causes use-after-free errors
> on devices that use an I2C controller for HDMI DDC/CI on Tegra210 and
> later.
> 
> Fixes: 3d2e7aec7013 ("drm/tegra: output: Don't leak OF node on error")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
Two times of_node_put() of the same pointer looks bad.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
