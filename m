From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 01/20] pinctrl: tegra: Add suspend and resume support
Date: Mon, 5 Aug 2019 11:20:56 +0200
Message-ID: <CACRpkdZVR-i1c5eATL2hSPbLXcX1sR8NgXwa4j259XXUi57xug@mail.gmail.com>
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com> <1564607463-28802-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564607463-28802-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stefan Agner <stefan@agner.ch>, Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com, Rob Herring <robh+dt@kernel.org>, Dmitry Osipenko <dig>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 31, 2019 at 11:11 PM Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:

> This patch adds support for Tegra pinctrl driver suspend and resume.
>
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Patch applied to the pinctrl tree.

This patch seems finished.

Also if the rest don't get merged for v5.4 then at least this is so
your patch stack gets more shallow.

I hope it's fine to merge this separately, else tell me and I'll
pull it out.

Yours,
Linus Walleij
