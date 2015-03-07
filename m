From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] pinctrl: tegra: driver layout/consistency fixes
Date: Sat, 7 Mar 2015 21:08:30 +0100
Message-ID: <CACRpkdY+3MTd0h2_N1zPsGm+QsryzmDPvyxPT9H35e-D07dF8A@mail.gmail.com>
References: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 24, 2015 at 10:00 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> Various non-semantic tweaks and layout/consistency fixes for existing
> Tegra pinctrl drivers.
>
> Move the definition of DRV_PINGROUP_REG() before the definition of
> PINGROUP() so that a future SoC driver can invoke the former from the
> latter.
>
> PINGROUP_BIT_Y(n) is just n, so replace it with n.
>
> Re-wrap the parameters to *PINGROUP().
>
> Keep various enums sorted in the Tegra124 driver.
>
> Various white-space consistency fixes.
>
> These changes aim to update existing drivers to be consistent with future
> SoC drivers. While we could ignore these tweaks to the existing drivers,
> I'd like to keep everything as consistent as possible for easy comparison.
> Besides, I auto-generate the drivers, and maintaining special-cases to
> keep the differences in place is annoying.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Patch applied.

Yours,
Linus Walleij
