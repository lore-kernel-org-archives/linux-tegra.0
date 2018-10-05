From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 33/36] dt-bindings: arm: Convert Tegra board/soc bindings
 to json-schema
Date: Fri, 5 Oct 2018 18:36:17 -0500
Message-ID: <CAL_Jsq+pV6HMs25JxFKwfX7_Cj1z2vT1eGWvqPzx7+Wu3-SPeQ@mail.gmail.com>
References: <20181005165848.3474-1-robh@kernel.org> <20181005165848.3474-34-robh@kernel.org>
 <1538777991.28477.6.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538777991.28477.6.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Grant Likely <glikely@secretlab.ca>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Jonathan Cameron <jic23@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Tom Rini <trini@konsulko.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, Kumar Gala <kumar.gala@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 5, 2018 at 5:20 PM Marcel Ziswiler
<marcel.ziswiler@toradex.com> wrote:
>
> Hi Rob
>
> On Fri, 2018-10-05 at 11:58 -0500, Rob Herring wrote:
> > Convert Tegra SoC bindings to DT schema format using json-schema.
> >

[...]

> Are you aware that -next already features a few updating commits
> thereof from around the beginning of September one of which even bears
> your reviewed-by.

I'm not targeting 4.20, but rather early in the 4.21 cycle. So I'll be
rebasing on rc1 and will update with any changes. I've been doing that
a couple of cycles already.

Rob
