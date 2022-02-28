Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45412C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Feb 2022 06:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbiB1GwO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Feb 2022 01:52:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbiB1GwN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Feb 2022 01:52:13 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9402D673D0
        for <linux-tegra@vger.kernel.org>; Sun, 27 Feb 2022 22:51:34 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id gb39so22780971ejc.1
        for <linux-tegra@vger.kernel.org>; Sun, 27 Feb 2022 22:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KV1JbAhuNJTz+C0DM9/emDJPo6FVaVp0kLIz6S7VmPE=;
        b=obAbKdYyq7nhBGXksSdwDXMC+AOppFf3t3FR/4OgFpoA0SSxyJw5Dqt5vgY+rLAWsK
         7VFY0tAoNHkhp9CZDR73I+Vb+GNrVdEvkDA8ojQP5ifaNOyPKcAuR1lOfnVYcO2vc7qo
         v91LV+o1RHC/URnQwJGjoycBwAf0YubvOE9pL9+jNseK9J0U3hcaND/kOQyfUCFY7Yv+
         L1YFwpQFqhgDYxJp/WhlfhhCXrgUs1vPzvF2MNTOGhF5+KjmzO8vuDwdnAtZ6jfa2TUe
         7kG/yZEPjQxV8bEFOoum/qReqC7CLz3TV2n+e0rIKhJgV+3N/ZKczfle7D8aainvC9CT
         +UYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KV1JbAhuNJTz+C0DM9/emDJPo6FVaVp0kLIz6S7VmPE=;
        b=vJhOVLvA1ayKIdGTG3BTsF0cuikKFoFK8LBPyiSA+zthI/9D7legX7airseM6EL46d
         WuOq98fIjx5aZ/KqEhDxDxT8eeBWG9NTYOBetanKXd3mnAuNbO9rEKIU5FoHIwchtO9y
         I6xPl/J5bY7tJO/kMkG1yvaZCHXCGF1J4E5q6GSLZnazUqolGsUZiIHn6QT1V1f8UqVU
         BmzP1Un2Xs6MJYfbw+2NDM8TguCIeElsUXjt3m4NuHAVMPoK6OLlDxPnF/+J+MmzPEbt
         UERi1+AjSu45uO6rSfcIduqd9jfXkSkY3EjfhSbu/2stY+hC65jPsqTdWk4AUUpbZQCj
         u/1w==
X-Gm-Message-State: AOAM533K8W0J2rD4cP0N0rdcF80TdDV7ecWDWAROE2/WJKt5WJdUVkV7
        FuuyB4Rew5epkTePuZbCYq7nDG8OQteRtZ8dWoc=
X-Google-Smtp-Source: ABdhPJwB9Sb4/CjGLWD5bUE/RRpRyGSfzqrgJ+wBZ2l1he+hHz/gx/Zr0GoryWF8c6D7yq4+m2Trm0ek+OVh6H0CYes=
X-Received: by 2002:a17:906:c59:b0:6b9:59d8:263e with SMTP id
 t25-20020a1709060c5900b006b959d8263emr14489489ejf.770.1646031093129; Sun, 27
 Feb 2022 22:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20220225163250.1063101-1-thierry.reding@gmail.com>
In-Reply-To: <20220225163250.1063101-1-thierry.reding@gmail.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Mon, 28 Feb 2022 16:51:22 +1000
Message-ID: <CAPM=9tzr0LSnkHHwP0rUOz+AFwQwtTs38vu+6B-d8VAN=x+BPg@mail.gmail.com>
Subject: Re: [GIT PULL] drm/tegra: Changes for v5.18-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

dim: d65e338027e7 ("gpu: host1x: Fix an error handling path in
'host1x_probe()'"): SHA1 in fixes line not found:
dim:     e3166698a8a0 ("drm/tegra: Implement buffer object cache")

not the same as

 1f39b1dfa53c84b56d7ad37fed44afda7004959d
Author: Thierry Reding <treding@nvidia.com>
Date:   Fri Feb 7 16:50:52 2020 +0100

    drm/tegra: Implement buffer object cache

Please fix that up.

Dave.

On Sat, 26 Feb 2022 at 02:32, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> Hi Dave, Daniel,
>
> The following changes since commit 8913e1aea4b32a866343b14e565c62cec54f3f78:
>
>   drm/tegra: dpaux: Populate AUX bus (2022-02-23 13:00:37 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.18-rc1
>
> for you to fetch changes up to b53c24f69199b88671293de503f1f999a762f4f9:
>
>   drm/tegra: Support YVYU, VYUY and YU24 formats (2022-02-25 16:37:40 +0100)
>
> Thanks,
> Thierry
>
> ----------------------------------------------------------------
> drm/tegra: Changes for v5.18-rc1
>
> This contains a couple more minor fixes that didn't seem urgent enough
> for v5.17. On top of that this improves YUV format support on older
> chips.
>
> ----------------------------------------------------------------
> Christophe JAILLET (2):
>       gpu: host1x: Fix an error handling path in 'host1x_probe()'
>       gpu: host1x: Fix a memory leak in 'host1x_remove()'
>
> Dmitry Osipenko (1):
>       drm/tegra: Use dev_err_probe()
>
> Miaoqian Lin (1):
>       drm/tegra: Fix reference leak in tegra_dsi_ganged_probe
>
> Thierry Reding (3):
>       drm/tegra: Fix planar formats on Tegra186 and later
>       drm/tegra: Support semi-planar formats on Tegra114+
>       drm/tegra: Support YVYU, VYUY and YU24 formats
>
> chiminghao (1):
>       drm/tegra: dpaux: Remove unneeded variable
>
>  drivers/gpu/drm/tegra/dc.c    | 50 ++++++++++++++++++-----------
>  drivers/gpu/drm/tegra/dc.h    |  7 +++++
>  drivers/gpu/drm/tegra/dpaux.c |  3 +-
>  drivers/gpu/drm/tegra/dsi.c   |  4 ++-
>  drivers/gpu/drm/tegra/hdmi.c  | 34 ++++++--------------
>  drivers/gpu/drm/tegra/hub.c   | 24 ++++++++------
>  drivers/gpu/drm/tegra/plane.c | 73 ++++++++++++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/tegra/plane.h |  2 +-
>  drivers/gpu/host1x/dev.c      |  8 +++--
>  9 files changed, 140 insertions(+), 65 deletions(-)
