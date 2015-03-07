From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] pinctrl: tegra: some bits move between registers
Date: Sat, 7 Mar 2015 21:09:28 +0100
Message-ID: <CACRpkdbEEtfaVzmjqbBBJ6voL8TX1rgHqqhd=2dJg8GoAbyMng@mail.gmail.com>
References: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
	<1424811651-18660-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1424811651-18660-2-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 24, 2015 at 10:00 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> Some of the pinmux configuration bits that exist in "drive group"
> registers in Tegra30..Tegra124 move to the "pinmux" registers on future
> chips. Add a flag to support this.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Patch applied.

Yours,
Linus Walleij
