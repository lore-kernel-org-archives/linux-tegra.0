From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: defer probe if pinctrl cannot be found
Date: Tue, 28 Jul 2015 12:23:29 +0200
Message-ID: <CACRpkdakiFxdqOhmdoBjTxxnv7mk3Qz6fdeGS+bw8VMLQoG7vA@mail.gmail.com>
References: <1436862596-27730-1-git-send-email-tomeu.vizoso@collabora.com>
	<1436862596-27730-2-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436862596-27730-2-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 14, 2015 at 10:29 AM, Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:

> When an OF node has a pin range for its GPIOs, return -EPROBE_DEFER if
> the pin controller isn't available.
>
> Otherwise, the GPIO range wouldn't be set at all unless the pin
> controller probed always before the GPIO chip.
>
> With this change, the probe of the GPIO chip will be deferred and will
> be retried at a later point, hopefully once the pin controller has been
> registered and probed already.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>
> Changes in v2:
> - Don't defer probe if the pinctrl node is disabled

Sorry for the delay.

This looks like the right thing to do, I was just worried that it would have
undesired semantic or probe order effects on some platforms, but I think
this is one of these cases where I just have to apply this and see what
happens when people test it in linux-next.

So, patch applied.

Yours,
Linus Walleij
