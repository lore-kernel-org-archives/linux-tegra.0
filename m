From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 02/21] pinctrl: tegra: Add write barrier after all
 pinctrl register writes
Date: Wed, 14 Aug 2019 10:33:39 +0200
Message-ID: <CACRpkdZ6--v6bdmn7=fjPDxiza0cbuHQN93_fyu+fTCkJpq_Gg@mail.gmail.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com> <1565308020-31952-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565308020-31952-3-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Stefan Agner <stefan@agner.ch>, Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com, Rob Herring <robh+dt@kernel.org>, Dmitry Osipenko <dig>
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 9, 2019 at 1:47 AM Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:

> This patch adds write barrier after all pinctrl register writes
> during resume to make sure all pinctrl changes are complete.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
