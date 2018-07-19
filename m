From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH 2/3] ARM: tegra: apalis-tk1: Add SPDX license (GPL-2.0 OR
 X11) identifiers
Date: Thu, 19 Jul 2018 18:44:11 +0200
Message-ID: <CAOFm3uFPGDKBjr2TKmsqZKdCLSU8YY+mprNe0ozGzkORXbHYSg@mail.gmail.com>
References: <20180718194824.3704-1-krzk@kernel.org> <20180718194824.3704-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718194824.3704-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Krzysztof,

On Wed, Jul 18, 2018 at 9:48 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Three files dual-licensed were missing the SPDX license identifiers.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/tegra124-apalis-emc.dtsi | 38 +-----------------------------
>  arch/arm/boot/dts/tegra124-apalis-eval.dts | 38 +-----------------------------
>  arch/arm/boot/dts/tegra124-apalis.dtsi     | 38 +-----------------------------
>  3 files changed, 3 insertions(+), 111 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
> index ca2c3a557895..cdbbb3562fb9 100644
> --- a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
> +++ b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
> @@ -1,42 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0 OR X11
>  /*
>   * Copyright 2016 Toradex AG
> - *
> - * This file is dual-licensed: you can use it either under the terms
> - * of the GPL or the X11 license, at your option. Note that this dual
> - * licensing only applies to this file, and not this project as a
> - * whole.

This is weirdly enough not what is called an X11 license [1] even
though it is named this way here... but this is an  MIT license [2]
with a small variation. (See below)

> - *
> - *  a) This file is free software; you can redistribute it and/or
> - *     modify it under the terms of the GNU General Public License
> - *     version 2 as published by the Free Software Foundation.
> - *
> - *     This file is distributed in the hope that it will be useful
> - *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *     GNU General Public License for more details.
> - *
> - * Or, alternatively
> - *
> - *  b) Permission is hereby granted, free of charge, to any person
> - *     obtaining a copy of this software and associated documentation
> - *     files (the "Software"), to deal in the Software without
> - *     restriction, including without limitation the rights to use
> - *     copy, modify, merge, publish, distribute, sublicense, and/or
> - *     sell copies of the Software, and to permit persons to whom the
> - *     Software is furnished to do so, subject to the following
> - *     conditions:
> - *
> - *     The above copyright notice and this permission notice shall be
> - *     included in all copies or substantial portions of the Software.
> - *
> - *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND

The MIT standard text [2] has a few extra commas and states instead:

THE SOFTWARE IS PROVIDED "AS IS",

Here "AS IS" is omitted. I am not sure this is material but IMHO it
would be good to get Toradex signoff on this.

> - *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> - *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> - *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> - *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> - *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - *     OTHER DEALINGS IN THE SOFTWARE.
>   */

<snip>


With all this said, I think that your expression should be this
instead (and this applies to other places too):

SPDX-License-Identifier: GPL-2.0 OR MIT

[1]  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES/other/X11?h=v4.18-rc5
[2]  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES/preferred/MIT?h=v4.18-rc5

-- 
Cordially
Philippe Ombredanne
