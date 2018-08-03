From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] pinctrl: tegra: Move drivers registration to
 arch_init level
Date: Fri, 3 Aug 2018 19:24:56 +0200
Message-ID: <CACRpkda+t=0aJMSKre+U-GHN2d47pV3b_g13PcinXScP_UX5Ng@mail.gmail.com>
References: <20180802111144.12512-1-digetx@gmail.com> <20a52a0461e32e776e526171c250551a@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20a52a0461e32e776e526171c250551a@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 2, 2018 at 1:31 PM Stefan Agner <stefan@agner.ch> wrote:

> A while back at least using those init lists were not well received even
> for GPIO/pinctrl drivers:
>
> https://lore.kernel.org/lkml/CACRpkdYk0zW12qNXgOstTLmdVDYacu0Un+8quTN+J_azOic7AA@mail.gmail.com/T/#mf0596982324a6489b5537b0531ac5aed60a316ba

You shouldn't listen too much to that guy he's not trustworthy.

> I still think we should make an exception for GPIO/pinctrl and use
> earlier initcalls. Platform GPIO/pinctrl drivers provide basic
> infrastructure often used by many other drivers, we want to have them
> loaded early. It avoids unnecessary EPROBE_DEFER and hence probably even
> boots faster.

When we have the pin control and GPIO at different initlevels it makes me
uneasy because I feel we have implicit init dependencies that seem more
than a little fragile.

My recent thinking has involved the component method used in DRM drivers
such as drivers/gpu/drm/vc4/vc4_drv.c where a few different component
subdrivers are linked together at bind time (not probe time!) into a master
component.

Rob was no big fan of this but the DRM people like it and I was thinking to
make a try at it.

This way we could at least probe and bind the pin control and GPIO drivers
at the *same* initlevel and express the dependencies between them
somewhat.

> This should definitely go in, at least as a stop gap solution.

Agreed. (And patch applied.)

Yours,
Linus Walleij
