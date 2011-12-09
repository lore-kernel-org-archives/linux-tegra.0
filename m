From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 1/3] pinctrl: add a driver for NVIDIA Tegra
Date: Sat, 10 Dec 2011 00:49:11 +0100
Message-ID: <CACRpkdaco=967cKHUcj9VNKc_HyT7Mw30Z9HVdfgsUsHbps8bQ@mail.gmail.com>
References: <1323382390-14892-1-git-send-email-swarren@nvidia.com>
	<1323382390-14892-2-git-send-email-swarren@nvidia.com>
	<CACRpkdYDn0V7SeQuFiFDMxGkybvg6PGf7jxid8ECGB7Azkj3zw@mail.gmail.com>
	<20111209170722.GO31337@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111209170722.GO31337@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Stephen Warren <swarren@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 9, 2011 at 6:07 PM, Tony Lindgren <tony@atomide.com> wrote:

> - We currently have hard time supporting pin groups with pins
> =A0coming from multiple pinmux driver instances

Pin groups are per definiton per-controller inctance. That is a
given side effect of not having a global pin space.

But you can create two groups of the same name on two
pin controllers so that e.g. pinctrl.0 and pinctrl.1 have
a group named "foo", then map both to a certain device
in the board pinmux map.

You will have to request them individually however, like
with two hogs or two pinmux_get() calls specifying the
name of each map, else you will just get the first one.

Not that I've tried it, but that's how it's supposed to work...

Yours,
Linus Walleij
