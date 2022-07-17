Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF6FC433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Jul 2022 21:32:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiGQVb7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 17 Jul 2022 17:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiGQVb6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 17 Jul 2022 17:31:58 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333301145B;
        Sun, 17 Jul 2022 14:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1658093507;
        bh=f4FfzIpkBTHPOg+j4ipx8biOOkNxFkZwARYVG5NtFms=;
        h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:References;
        b=Do8rbAcDILkg69XLI7KSPaqCPCDkRLstFlxJl7QZ5ejNcz9eesYnk4TzGRVKXtsfx
         ZezdpNEAlBeXpBa+/AEbsMqFnFIsHlS0ka42CxN0wujGU8a05qxBSB5G5HW2ee7gvB
         yZhmqxZaNks+4rlIfAH9Xb+LUv5Iw7dXcJro341U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from MacBookPro.fritz.box ([88.130.11.201]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MfpOd-1ncB5v3grp-00gHsY; Sun, 17 Jul 2022 23:31:46 +0200
Date:   Sun, 17 Jul 2022 23:31:46 +0200 (CEST)
From:   Marc Dietrich <marvin24@gmx.de>
To:     Thierry Reding <thierry.reding@gmail.com>
cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marc Dietrich <marvin24@gmx.de>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: arm: tegra: nvec: Convert to
 json-schema
In-Reply-To: <20220711152020.688461-3-thierry.reding@gmail.com>
Message-ID: <a8af39d5-e656-1e5e-4809-1b168bca3eda@gmx.de>
References: <20220711152020.688461-1-thierry.reding@gmail.com> <20220711152020.688461-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:qgXuojO2d/XpMr3wVkvDzxXA9aMI18xf2Z3YeCCIUd+08YqppiQ
 eWqSn8UvLrUmF4+v5MFmG5YCAkyHyM0BAFWGiUbAi8B2ewXILMAifduwz1L+YhaHu6ewB8l
 NCRnuyt8VmWFiHcDhoJ3pdBw9cAxgZ8rbczQvJBgMoNivh0NpKQ8zgCG9PptpGi9CI3B9sY
 fYeLCH3m+7rk6D2BxNHAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9aeTu9FjRqM=:TpOvQbpdytyGtI1pq8gFeh
 HAuUBl3PgqtSmC5CeqtCv0ax6q8qfO+oAf/2bhLgL5J9rc1zIsXEmcJFi6XsXfxoQjVxsQ2cG
 YAXOthKXTgBx8W9UtKqfuxjY4SGbHb8PWiRAYRZHLI58JTUm4RmLDgwIH0YM19Da3T5WupioK
 Sb+fVn+nGnNeACpL/8hDm/0AQlm7y6ictbJwrZGWrBE8Bp7uNrLv/oqCQ6/iKndFAM/j54545
 g+NWS4XR9ZH2HBQHqA6sTN79oYNpc5uyoaYyozNWW8X1bTiu8oii/mBowW2fn3CXvyR/O0Rz7
 yKr8CO8LkclOvJJY/c8qMJ+6Nw7Ma8wy4l+bxjta5Yz7eF/kJz8BKv3HQmh7H5JGrLbXoKIuF
 dL7iE0RHCa98j9BCCxEWW2RBDLguEwYG+TtNyB/HVEaudVMZT86ZCxPKZKAKxL6cp0VZ7Bfa9
 vp1sup/gWCl9t4JjEiqOUz8rYxwsa7mGFG/fhx+EhGUwypcsLVRrZYnO7bL78l06nxOsDrol/
 tA7TZk89ALF3zF3ovrVMDH914m1aEnW7XUS+dfLddYQNJkiBX1Qu3D3I5ZWV00rNhQtz2pyiZ
 WIR/FUD8GDOeqWRVIXCrj0LkQTZzu8V5aTMq/UYlz2JV78SnluxpKNg7eiQ/98qZwj+oakC3O
 gutQGFtJbQbb3YC24cddD4m10F5sWMnAWmu1UKc28oz0jJpwjImkUuH/V9+0xftsT0QYwjNxj
 RBtLsnpXxHRcTElRzkuuuIOJINO/cvZmAR7NsOrmC46MlAXFHjpETH7BMRy6mHwawB2MbnwRK
 Jb32EyzGrjgOj2rteI+GiKyj1y4OpWv1SEARhyNKNndDyu6tiD9K+pHw8g8r9IVO/ImL6lOvN
 397gpZY+K9V9ypZUoMXSqjN+XFTvH5FukMVfBZ2E9veg3IDaar1rbjkUPvbqqE971LEkJi6HS
 bsLJDeMP+bPf3CTD08gmluf2obAOXwJ5Xj354sRBsFh1HwZUq6mliy2Wj3jgfdAFy2jmQqlTn
 GbXE3qlRB9DRHnm7fuTZLA1Mw6zr5koIE1IljPNQxxLgOVpbvxxjAXrLcpa0Pf8YPHyFwvpgu
 fPZZee7sE05pdvwR2JyZ3Ass4ibke85iVwq2X/xrbUt1oK9Kusf2JhcvA==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Thierry,

On Mon, 11 Jul 2022, Thierry Reding wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Convert the NVIDIA embedded controller bindings from the free-form text
> format to json-schema.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Marc,
>
> you authored this binding a long time ago, which makes the default
> license for this GPL-2.0. However, the preference is for DT bindings to
> be dual-licensed under the more permissive GPL-2.0-only OR BSD-2-Clause
> as done in this patch. Do you have any objections to relicensing?

yeah, that was almost 11 years ago - how fast time can pass ...
I'm ok with relicensing (and also for the conversion to yaml) - thanks for
taking care!

Acked-by: Marc Dietrich <marvin24@gmx.de>

Marc


> Thierry
>
> .../bindings/arm/tegra/nvidia,nvec.txt        | 21 -----
> .../bindings/arm/tegra/nvidia,nvec.yaml       | 94 +++++++++++++++++++
> 2 files changed, 94 insertions(+), 21 deletions(-)
> delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,nv=
ec.txt
> create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,nv=
ec.yaml>
....

