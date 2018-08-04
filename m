From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: tegra: Move drivers registration to arch_init level
Date: Sat, 04 Aug 2018 17:01:48 +0300
Message-ID: <2738202.Xfnp0pFbCN@dimapc>
References: <20180802111144.12512-1-digetx@gmail.com> <20a52a0461e32e776e526171c250551a@agner.ch> <CACRpkda+t=0aJMSKre+U-GHN2d47pV3b_g13PcinXScP_UX5Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda+t=0aJMSKre+U-GHN2d47pV3b_g13PcinXScP_UX5Ng@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Agner <stefan@agner.ch>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Friday, 3 August 2018 20:24:56 MSK Linus Walleij wrote:
> On Thu, Aug 2, 2018 at 1:31 PM Stefan Agner <stefan@agner.ch> wrote:
> > A while back at least using those init lists were not well received even
> > for GPIO/pinctrl drivers:
> > 
> > https://lore.kernel.org/lkml/CACRpkdYk0zW12qNXgOstTLmdVDYacu0Un+8quTN+J_az
> > Oic7AA@mail.gmail.com/T/#mf0596982324a6489b5537b0531ac5aed60a316ba
> You shouldn't listen too much to that guy he's not trustworthy.
> 
> > I still think we should make an exception for GPIO/pinctrl and use
> > earlier initcalls. Platform GPIO/pinctrl drivers provide basic
> > infrastructure often used by many other drivers, we want to have them
> > loaded early. It avoids unnecessary EPROBE_DEFER and hence probably even
> > boots faster.
> 
> When we have the pin control and GPIO at different initlevels it makes me
> uneasy because I feel we have implicit init dependencies that seem more
> than a little fragile.

Yes, it is not very good.

> My recent thinking has involved the component method used in DRM drivers
> such as drivers/gpu/drm/vc4/vc4_drv.c where a few different component
> subdrivers are linked together at bind time (not probe time!) into a master
> component.
> Rob was no big fan of this but the DRM people like it and I was thinking to
> make a try at it.
> 
> This way we could at least probe and bind the pin control and GPIO drivers
> at the *same* initlevel and express the dependencies between them
> somewhat.

Sounds interesting, maybe you could help to convert Tegra drivers to a such 
method and others will follow afterwards.

> > This should definitely go in, at least as a stop gap solution.
> 
> Agreed. (And patch applied.)

The best solution will be to fix the deferred probing, it's awkward that it 
could break suspend-resume order. Hopefully somebody with a good knowledge of 
driver/base will manage to fix it eventually.
