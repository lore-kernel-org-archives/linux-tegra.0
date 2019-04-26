From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add Tegra194 pinmux driver
Date: Fri, 26 Apr 2019 09:11:00 +0200
Message-ID: <CACRpkdbnzB690mPncGGe2fKMBx3kDN+RPBEbowBsvsXO23gOGw@mail.gmail.com>
References: <1556247378-3335-1-git-send-email-kyarlagadda@nvidia.com> <1556247378-3335-2-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556247378-3335-2-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, vidyas@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 26, 2019 at 4:56 AM Krishna Yarlagadda
<kyarlagadda@nvidia.com> wrote:

> Tegra194 has PCIE L5 rst and clkreq pins which need to be controlled
> dynamically at runtime. This driver supports change pinmux for these
> pins. Pinmux for rest of the pins is set statically by bootloader and
> will not be changed by this driver
>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> Signed-off-by: Suresh Mangipudi <smangipudi@nvidia.com>

Paging Stephen Warren about this patch, an ACK from Thierry would
be nice too.

Yours,
Linus Walleij
