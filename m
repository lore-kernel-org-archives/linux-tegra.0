From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: tegra: move pinconf-tegra.h content into drivers/pinctrl
Date: Wed, 5 Sep 2012 10:26:24 +0200
Message-ID: <CACRpkdaDQtHvtH-gqps5T5c=EZOzFkMVkg0QbOabzT1zQ1kBdQ@mail.gmail.com>
References: <1346798370-28795-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1346798370-28795-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 5, 2012 at 12:39 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> Now that Tegra's pinmux is configured solely from device tree, there's
> no need for the pinconf types to be defined in arch/arm/mach-tegra/.
> Move it into the pinctrl directory to clean up mach-tegra, as a pre-
> requisite for single-zImage.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> I'll need to take this through the Tegra tree, since it depends on some
> patches that remove inclusion of the deleted header.

Go for it:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
