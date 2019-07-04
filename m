From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
Date: Thu, 4 Jul 2019 09:26:45 +0200
Message-ID: <CACRpkdYfuNK4rShCqpf7hyKDzL_1JgiW=k8Y=CMs_Hx-+vnmVQ@mail.gmail.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com> <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stefan Agner <stefan@agner.ch>, Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com, Rob Herring <robh+dt@kernel.org>, Dmitry Osipenko <dig>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 28, 2019 at 4:13 AM Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:

> This patch adds support for Tegra pinctrl driver suspend and resume.
>
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Looks good.

Can I just apply this patch or does it need to go in with
the other (clk) changes?

Yours,
Linus Walleij
