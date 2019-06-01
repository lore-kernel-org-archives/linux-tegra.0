From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 2/4] pinctrl: tegra: Support 32 bit register access
Date: Sat, 1 Jun 2019 19:22:32 +0200
Message-ID: <CACRpkdb9swUxO9GBvZQMVu0t0-77Pr9W5RivuiVhgrM1eBGtdA@mail.gmail.com>
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com> <1558007594-14824-2-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558007594-14824-2-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, vidyas@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Thu, May 16, 2019 at 1:53 PM Krishna Yarlagadda
<kyarlagadda@nvidia.com> wrote:

> Tegra194 chip has 32 bit pinctrl registers. Existing register defines in
> header are only 16 bit.
> Modified common pinctrl-tegra driver to support 32 bit registers of
> Tegra 194 and later chips.
>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>

Patch applied.

Yours,
Linus Walleij
