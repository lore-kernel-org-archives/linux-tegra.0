From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: tegra: define GPIO compatible node per SoC
Date: Sun, 29 Jul 2018 23:37:40 +0200
Message-ID: <CACRpkda2SouLeKO8UrRxwQOwKtwsiUctE0cu3YKKj8C2SViSbw@mail.gmail.com>
References: <20180726154025.13173-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726154025.13173-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.co>, Dmitry Osipenko <digetx@gmail.com>, Kees Cook <keescook@chromium.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 26, 2018 at 5:40 PM Stefan Agner <stefan@agner.ch> wrote:

> Tegra 2 uses a different GPIO controller which uses "tegra20-gpio" as
> compatible string.
>
> Make the compatible string the GPIO node is using a SoC specific
> property. This prevents the kernel from registering the GPIO range
> twice in case the GPIO range is specified in the device tree.
>
> Fixes: 9462510ce31e ("pinctrl: tegra: Only set the gpio range if needed")
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Patch applied.

Yours,
Linus Walleij
