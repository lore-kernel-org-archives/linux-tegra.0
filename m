Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBB3C4361B
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Dec 2020 20:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECFAC23E51
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Dec 2020 20:52:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390469AbgLJUwy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Dec 2020 15:52:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:53860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728068AbgLJUws (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Dec 2020 15:52:48 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607633527;
        bh=bVzwago/zTNfjtYXgW8Bjn6iqFByrlvVO9nFcDREw2Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ELI4B5EcqeAcKPenSyDQ2Lhl/nb8gOAUR4w3Ll7NKajDv+o2K/snuXfbZy+4nIHwl
         5T4wdEL8zpeMNIZcbgFVPhgOt9/9SHhqF0LP96tintIkQ93q4Wa5G17A0YlBQu1hIM
         /z1hR+cvYJ34y9Tvth9Ap+bcnF40AY5bwAYkSFcigG37FeC+HUhJQHqFsrlUa7/h5E
         cv2+Zd0110tNA8dNHKmvR/CfzAclcpfxYLykbgvgrrs1eEqYJT4A3zLpuP6yhmx56W
         yVwrD9dViS47DR0CyEiyoG3+PeO2HOd5XrQk7epIuJMXHTEMHL/eOzLr9C2OD+ayCO
         z4p+lHjnjPp7A==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201025224212.7790-1-digetx@gmail.com>
References: <20201025224212.7790-1-digetx@gmail.com>
Subject: Re: [PATCH v1] clk: tegra: Fix duplicated SE clock entry
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Thu, 10 Dec 2020 12:52:06 -0800
Message-ID: <160763352606.1580929.6412866058143652858@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2020-10-25 15:42:12)
> The periph_clks[] array contains duplicated entry for Security Engine
> clock which was meant to be defined for T210, but it wasn't added
> properly. This patch corrects the T210 SE entry and fixes the following
> error message on T114/T124: "Tegra clk 127: register failed with -17".
>=20
> Fixes: dc37fec48314 ("clk: tegra: periph: Add new periph clks and muxes f=
or Tegra210")
> Tested-by Nicolas Chauvet <kwizart@gmail.com>
> Reported-by Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next
