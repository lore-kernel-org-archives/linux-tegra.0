From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 3/4] pinctrl: tegra: Add Tegra194 pinmux driver
Date: Sat, 1 Jun 2019 19:24:46 +0200
Message-ID: <CACRpkdYyOxYkiYXufUVVm3-v2a6xUGxS=DnqzAR_bdARspW5Sg@mail.gmail.com>
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com> <1558007594-14824-3-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558007594-14824-3-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, vidyas@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Thu, May 16, 2019 at 1:54 PM Krishna Yarlagadda
<kyarlagadda@nvidia.com> wrote:

> Tegra194 has PCIE L5 rst and clkreq pins which need to be controlled
> dynamically at runtime. This driver supports change pinmux for these
> pins. Pinmux for rest of the pins is set statically by bootloader and
> will not be changed by this driver
>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> Signed-off-by: Suresh Mangipudi <smangipudi@nvidia.com>
> ---
> Changes in V3:
> Fix build issue observed with previous version

Patch applied with Vidya's Test tag.

If the maintainers have comments they had two weeks to answer
to the patch and if there are still issues I am pretty sure they can
be fixed with follow-up patches in that case.

Yours,
Linus Walleij
