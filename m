From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: tegra: add a driver for Tegra210
Date: Tue, 3 Mar 2015 14:47:38 +0900
Message-ID: <CAAVeFu+LG86k+QwB2oZHbLSsVrVTtJmzd9odMbTSjpeOJ2Q3KQ@mail.gmail.com>
References: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org> <1424811651-18660-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1424811651-18660-4-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 25, 2015 at 6:00 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> From: Stephen Warren <swarren@nvidia.com>
>
> Tegra210's pinmux supports a different set of pins/options than earlier
> SoCs, so requires its own driver (well, table of pin-specific data).
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

The series, and this patch in particular,

Tested-by: Alexandre Courbot <acourbot@nvidia.com>
