From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1 2/3] Documentation: gpio: Add details of open-drain configuration
Date: Wed, 15 Feb 2012 23:25:41 +0100
Message-ID: <CACRpkdZzcN5oi0ejeTQn3BNJ_w6XHsBQ_RoQMvpf8Lt2bOARAg@mail.gmail.com>
References: <1329114588-15430-1-git-send-email-ldewangan@nvidia.com>
	<1329114588-15430-3-git-send-email-ldewangan@nvidia.com>
	<20120213211809.GI11077@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120213211809.GI11077@ponder.secretlab.ca>
Sender: linux-doc-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: dunlap@xenotime.net, lrg@ti.com, broonie@opensource.wolfsonmicro.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 13, 2012 at 10:18 PM, Grant Likely
<grant.likely@secretlab.ca> wrote:

> Linus mentioned that this should be part of pinctrl instead of the gpio API,
> but I think there is an argument for making it part of the gpio API,
> particularly since open-drain is pretty much a universal concept that all
> gpio controllers can support (unlike driver strength)

Actually pinctrl is engineered to be used as back-end for gpiolib
so thinking about it I'm pretty happy with this arrangement, the gpiolib
driver can very well call down to pinctrl to have the actual setting
done if needed. So it's no big deal.

It is also a case for making some of the pin config business
generic, which I have failed at in the past.

> Have you though about support for lines that are pulled low instead of
> high?  Those aren't as common, but it is conceivable that some
> hardware would need it.

So if the idea is (if I get it correctly) that this thing is an input
sometimes and open drain/collector output sometimes, then
open source/emitter for the inverse situation is an equally valid
case right? In that case I think it'd be best to add both.

The COH901 driver for U300 supports open source/emitter
BTW.

Yours,
Linus Walleij
