From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] pinctrl: tegra: support nvidia,io-hv DT property
Date: Sat, 7 Mar 2015 21:10:31 +0100
Message-ID: <CACRpkdYtUZOjEZYdOJt2NjtDBuo=Brp0babpRZVYdhic+US0Pg@mail.gmail.com>
References: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
	<1424811651-18660-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1424811651-18660-3-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 24, 2015 at 10:00 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> Both nvidia,io-hv and nvidia,rcv-sel represent the fact that a particular
> pin's IO buffers are configured to accept "high voltage" input signals.
> The TRM for different chips names the register field rcv-sel on older
> SoCs and io_hv on newer SoCs. Add the new naming option into the pinctrl
> driver so that DT files can use naming consistent with the TRM.
>
> This new property name will be documented in the patch that adds support
> for the new SoC.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Patch applied.

Yours,
Linus Walleij
