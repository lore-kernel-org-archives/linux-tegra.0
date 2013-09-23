From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/9] irqdomain: Introduce __irq_create_mapping()
Date: Mon, 23 Sep 2013 21:14:30 +0200
Message-ID: <CACRpkdYo8knzZ+Z-tc7fyEGwX5bt4RvMU3TR3k3UrOj0KRJocw@mail.gmail.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
	<1379320326-13241-3-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379320326-13241-3-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 16, 2013 at 10:31 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> This is a version of irq_create_mapping() that propagates the precise
> error code instead of returning 0 for all errors. It will be used in
> subsequent patches to allow further propagation of error codes.
>
> To avoid code duplication, implement irq_create_mapping() as a wrapper
> around the new __irq_create_mapping().
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Surprise! I don't like this.

I think it is better to first go over the call sites and make them
all handle negative return numbers rather than pushing the
obscure __interface.

I know from patch 0 that you think it's too much to change these
127 call sites but I don't think so, and I'm happy to merge one
big patch changing all the 20 users in drivers/gpio.

Likewise with the 11 consumers in drivers/pinctrl.

It's just a a few archs+subsystems and it's just plain work.

So do that first.

Yours,
Linus Walleij
