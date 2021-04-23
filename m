Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C958C433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 13:43:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE341613B6
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 13:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhDWNnn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 09:43:43 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:52067 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhDWNnn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 09:43:43 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MNL2Y-1lxWPj2XBy-00Ol5w for <linux-tegra@vger.kernel.org>; Fri, 23 Apr 2021
 15:43:05 +0200
Received: by mail-wr1-f42.google.com with SMTP id c4so9569021wrt.8
        for <linux-tegra@vger.kernel.org>; Fri, 23 Apr 2021 06:43:05 -0700 (PDT)
X-Gm-Message-State: AOAM532ZBDtQv/h94AGvpPxPTtzDV7igUyGQ56RAxVERohkKAPS6Rabz
        2yXtw6upbgWfTzUwKv1veMPFseeGeZd+7DX9toY=
X-Google-Smtp-Source: ABdhPJyYEz3oAXfA6QGQ8pDBYCOWietlua8xR8+nwPHJcQITOjWTJqOWfw/bCo59vyTE1f48HCKqz3MvbCPSUfzzUTc=
X-Received: by 2002:adf:e483:: with SMTP id i3mr5013767wrm.286.1619185385314;
 Fri, 23 Apr 2021 06:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
 <20210401172622.3352990-5-thierry.reding@gmail.com> <YILD4yyPXuiYbHW1@orome.fritz.box>
In-Reply-To: <YILD4yyPXuiYbHW1@orome.fritz.box>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 23 Apr 2021 15:42:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1fDD6FXj1gL8Gwb+03ERKhm6uT94Yt7Ne2aRghn539fQ@mail.gmail.com>
Message-ID: <CAK8P3a1fDD6FXj1gL8Gwb+03ERKhm6uT94Yt7Ne2aRghn539fQ@mail.gmail.com>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree fixes for v5.12-rc6
To:     Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:F2mUT1LdohZ3q7o56675PV0qDULGoexh9R905+smYicvsjWGvB8
 b+f5M3c1dNv0/W0B4XTQG5NEgcrLrOy/FCwWK6Opbbv+aUGeIWtnNjdOCuTteKdZNETPteL
 3ft2WnQYC64AyrgnF+HSZJx1S3QT6mYsayx3p3xycdo3dDepsnLuc7C7MLOzMvVKlBtQQYX
 esmklvTtbtaaQaBd8SeJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nZGezY5rHL4=:d93/c38qorn5jRwRroH2VR
 lgxrWmV9GjM/FCASqgun+sgLJzNR1Oeyphe3wURpVXu4QT74HMmz35f4U+QlB79Rz4YeF3/U2
 EA05kqHHfD4rjaw60sMpZlPxc92UpFbkamMxyEAkRTpYjejaiaWwgmFTK5ACXcMMkGO8ZOl34
 oPqtJwbeYgDZ22JsEZUTig0g7Z4xqEXcO2bv1RH7KKxcIfy5p7AeaJuTnSUvL42TDojel1mET
 q3U2NZzKQY+FRW503qstaPS+sSVKmiUx52Sm866nlYuJ/7tOK0CcVdDZe1/h673Oxiv4jPtUf
 7DRpvbe2y9F6pV7u5CMo7iy1FmlJWd18Cfnd0JOdINq5FKFEwg1dfwKR8Hf/BfdYXktI0Sbt8
 iaXvegrzEGhL2vgsXGnEotHH5HaRcHUtHUHjFNAHxFbM111JFxW+LtkN/njHZDC89R4a+8vnW
 FIt0VJzz4EHhIZAuQArt+94TAtQpCc/PMQyqBt0bLTWTeblhHjkbQLBhsCs9ursXgvt1J+pAv
 SPfthwJuxOL8cjTXcckDrw=
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Apr 23, 2021 at 2:56 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Apr 01, 2021 at 07:26:22PM +0200, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >
> > The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> >
> >   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt
> >
> > for you to fetch changes up to 405fa9e9d8664e830982c5fbcb70f9ba8656bafc:
> >
> >   arm64: tegra: Move clocks from RT5658 endpoint to device node (2021-03-25 14:04:49 +0100)
> >
> > Thanks,
> > Thierry
>
> Hi Arnd,
>
> I noticed that v5.12-rc8 is still broken because of the missing
> fw_devlink=on patch from this PR. This PR was meant to go into v5.12,
> but it looks like you pulled it for the next release.

Indeed, I never noticed the difference between the subject line and
the tag name. I usually go by the subject to see what branch to pick
and only then check if there are any discrepancies, but I missed this one.

> In retrospect I realize that the way I sent this out was rather
> confusing. Any chance you can still pull these into v5.12 to unbreak
> the final release?

I've pulled it into the arm/fixes branch now. There is only one other fix in
the arm/fixes, but I should still be able to send it out tomorrow.

      Arnd
