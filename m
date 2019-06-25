From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 03/18] gpio: tegra: use resume_noirq for tegra gpio resume
Date: Tue, 25 Jun 2019 15:38:29 +0200
Message-ID: <CACRpkda0=HeRco8kExdf6TmiLOnCec3Ek06s-MdjNJvVGw3ZNQ@mail.gmail.com>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com> <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stefan Agner <stefan@agner.ch>, Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com, Rob Herring <robh+dt@kernel.org>, Dmitry Osipenko <dig>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 24, 2019 at 5:03 AM Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:

> During SC7 resume, PARKED bit clear from the pinmux registers may
> cause a glitch on the GPIO lines.
>
> So, Tegra GPIOs restore should happen prior to restoring Tegra pinmux
> to keep the GPIO lines in a known good state prior to clearing PARKED
> bit.
>
> This patch has fix for this by moving Tegra GPIOs restore to happen
> very early than pinctrl resume.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Can this patch be applied in isolation from the other patches?

WOuld be nice to have at least Thierry's ACK on it before I
apply it.

Yours,
Linus Walleij
