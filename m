From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 4/4] soc/tegra: select pinctrl for Tegra194
Date: Sat, 1 Jun 2019 19:26:16 +0200
Message-ID: <CACRpkdYOJydUhSOh7Pn47x0xjYP1HbfNA-2+8O48AA6PnTMNoQ@mail.gmail.com>
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com> <1558007594-14824-4-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558007594-14824-4-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, vidyas@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Thu, May 16, 2019 at 1:53 PM Krishna Yarlagadda
<kyarlagadda@nvidia.com> wrote:

> Select PINCTRL_TEGRA194 by default for Tegra194 SOC needed
> for dynamically controlling PCIe pins
>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess this needs to be applied by the Tegra SoC maintainers and
go upstream through the ARM SoC tree.

If nothing happens and you lose patience, do not hesitate to poke
me back and I might just apply it to the pinctrl tree.

Yours,
Linus Walleij
