Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF07E6FE41
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Sep 2023 15:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbjIVPAy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Sep 2023 11:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbjIVPAt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Sep 2023 11:00:49 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340791A5
        for <linux-tegra@vger.kernel.org>; Fri, 22 Sep 2023 08:00:43 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-79f96daf565so43421439f.0
        for <linux-tegra@vger.kernel.org>; Fri, 22 Sep 2023 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695394842; x=1695999642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYn6LvwErM+FWcs1ijUw0l4OdU4J9KJ6IGyuBDg5TUM=;
        b=nvLbHRZ6HX0KEiCK6ljjoii4i8lRgR2XWob3X20fw9qoVQ26w1w8wXl8mQyKsxjhYm
         ZIyhTtiVG+nkTILeUFZYteVbJ4CSUNjzh4HQdZ//MaUTXrBVuHGg6onE5kpwN5DIx7ix
         RmCBLILoMoyLFbym5jRagLB0Ad4Zo7WNrUGXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695394842; x=1695999642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYn6LvwErM+FWcs1ijUw0l4OdU4J9KJ6IGyuBDg5TUM=;
        b=T8dBirDw1s7h8xZ/0G5DFzzpElo8/rLFZhMQLZo6M+JgJFueEyj8T/7XyYN9ABX8TR
         IBxXnYK9ZGFHcVUR9CRBbEcJulEGX2CRnxdrcBetEpyaqqbOYlPZQLd5jENiguARA8Td
         vxsddtgYiHZpK5vuhIwi0Gz1fgxfToL8Zj4NHZmBvso8ltZ5qzNpeIGLZBzi4iqucld6
         p1FX60dPBdMxcaoLvSQeNo9xYRaTj2nZnxa2Y9zm12Jmikx5WvsM21lLmKpUt6bpJr/V
         3ecLOV9QUp6EKmqzZg2Wgw42tuLqSBhjB16dAj1awAdkYa7gJr2K4n22lGXrsppE4Oxz
         +psw==
X-Gm-Message-State: AOJu0YzHW8nf2jjsBluFwxqbUKjuZtYpMuBODPEkHUOVENO+AyjeLQ3n
        F6WlxGOZ3zMYN/xtR3w5z8ZZScsfISQxYAb5Y9+ERA==
X-Google-Smtp-Source: AGHT+IFbEGFXJmNzYcTCklkiBTGe0RHiphpx+QFahlodchm827xZVeRdpbGcmTnbPC8j2gcUb6dS/KP3T2t9n71A9EY=
X-Received: by 2002:a6b:e419:0:b0:799:178c:7be5 with SMTP id
 u25-20020a6be419000000b00799178c7be5mr9412049iog.17.1695394842589; Fri, 22
 Sep 2023 08:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112835.549467415@linuxfoundation.org> <79a96d41-1b79-51b4-fda0-743b853213b9@nvidia.com>
 <7e0355bd-64cd-f6c2-b720-e4643579078c@nvidia.com> <53c9f81e-55b9-b8bb-7821-cb124780d4c0@roeck-us.net>
In-Reply-To: <53c9f81e-55b9-b8bb-7821-cb124780d4c0@roeck-us.net>
From:   Rob Clark <robdclark@chromium.org>
Date:   Fri, 22 Sep 2023 08:00:31 -0700
Message-ID: <CAJs_Fx6-AWA1fxgV1u=ycn2YXm3D0GnGQeC1UR8QwVXFKDGJqw@mail.gmail.com>
Subject: Re: [PATCH 6.1 000/139] 6.1.55-rc1 review
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, patches@lists.linux.dev,
        linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, shuah@kernel.org, patches@kernelci.org,
        lkft-triage@lists.linaro.org, pavel@denx.de, f.fainelli@gmail.com,
        sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
        conor@kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 22, 2023 at 7:52=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 9/22/23 05:31, Jon Hunter wrote:
> >
> > On 22/09/2023 10:45, Jon Hunter wrote:
> >> Hi Greg,
> >>
> >> On 20/09/2023 12:28, Greg Kroah-Hartman wrote:
> >>> This is the start of the stable review cycle for the 6.1.55 release.
> >>> There are 139 patches in this series, all will be posted as a respons=
e
> >>> to this one.  If anyone has any issues with these being applied, plea=
se
> >>> let me know.
> >>>
> >>> Responses should be made by Fri, 22 Sep 2023 11:28:09 +0000.
> >>> Anything received after that time might be too late.
> >>>
> >>> The whole patch series can be found in one patch at:
> >>>     https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.1.55-rc1.gz
> >>> or in the git tree and branch at:
> >>>     git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.1.y
> >>> and the diffstat can be found below.
> >>>
> >>> thanks,
> >>>
> >>> greg k-h
> >>
> >> I am seeing some suspend failures with this update ...
> >>
> >> Test results for stable-v6.1:
> >>      11 builds:    11 pass, 0 fail
> >>      28 boots:    28 pass, 0 fail
> >>      130 tests:    124 pass, 6 fail
> >>
> >> Linux version:    6.1.55-rc1-gd5ace918366e
> >> Boards tested:    tegra124-jetson-tk1, tegra186-p2771-0000,
> >>                  tegra194-p2972-0000, tegra194-p3509-0000+p3668-0000,
> >>                  tegra20-ventana, tegra210-p2371-2180,
> >>                  tegra210-p3450-0000, tegra30-cardhu-a04
> >>
> >> Test failures:    tegra124-jetson-tk1: pm-system-suspend.sh
> >>                  tegra186-p2771-0000: pm-system-suspend.sh
> >>                  tegra20-ventana: pm-system-suspend.sh
> >>                  tegra30-cardhu-a04: pm-system-suspend.sh
> >>
> >> Bisect is underway.
> >
> >
> > Bisect for this issue is also pointing to ...
> >
> > Rob Clark <robdclark@chromium.org>
> >       interconnect: Fix locking for runpm vs reclaim
> >
> > Looks like all the Tegra issues are related to this.
> >
>
> This isn't surprising because upstream commit 136191703038 ("interconnect=
: Teach
> lockdep about icc_bw_lock order") silently fixes it without Fixes: tag. I=
f you
> look into that patch you'll see that the the missing call to mutex_unlock=
() is
> added to icc_sync_state().

Oh, indeed, it looks like that hunk ended up in the wrong commit, and
I didn't notice because both were merged at the same time

BR,
-R

> Guenter
>
