From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: tegra: error reporting cleanup
Date: Thu, 26 Apr 2012 11:03:37 +0200
Message-ID: <CACRpkdZiq1DvjpDZEw6xRe2gk_AVPrLHXD_3iXayZXQkNHHAhQ@mail.gmail.com>
References: <1335384209-23065-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1335384209-23065-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 25, 2012 at 10:03 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> Print an explicit error message in various failure cases to allow
> easier diagnosis.
>
> WARN_ON() some internal failures that users/clients shouldn't be able to
> trigger.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> Linus, I intend to take this through the Tegra tree; it most likely depends
> on other stuff in the Tegra repo's gpio-pinmux branch.

Fair enough,
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
