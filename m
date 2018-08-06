From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: tegra: Move drivers registration to arch_init level
Date: Mon, 06 Aug 2018 16:38:22 +0300
Message-ID: <2282091.6Fec9mOu3z@dimapc>
References: <20180802111144.12512-1-digetx@gmail.com> <2738202.Xfnp0pFbCN@dimapc> <e60cd1f07f7c7515c117fa3446914c7f@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e60cd1f07f7c7515c117fa3446914c7f@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>, thierry.reding@gmail.com, Jon Hunter <jonathanh@nvidia.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday, 6 August 2018 16:03:01 MSK Stefan Agner wrote:
> On 04.08.2018 16:01, Dmitry Osipenko wrote:
> > On Friday, 3 August 2018 20:24:56 MSK Linus Walleij wrote:
> >> On Thu, Aug 2, 2018 at 1:31 PM Stefan Agner <stefan@agner.ch> wrote:
> >> > A while back at least using those init lists were not well received
> >> > even
> >> > for GPIO/pinctrl drivers:
> >> > 
> >> > https://lore.kernel.org/lkml/CACRpkdYk0zW12qNXgOstTLmdVDYacu0Un+8quTN+J
> >> > _az
> >> > Oic7AA@mail.gmail.com/T/#mf0596982324a6489b5537b0531ac5aed60a316ba
> >> 
> >> You shouldn't listen too much to that guy he's not trustworthy.
> 
> ;-)
> 
> >> > I still think we should make an exception for GPIO/pinctrl and use
> >> > earlier initcalls. Platform GPIO/pinctrl drivers provide basic
> >> > infrastructure often used by many other drivers, we want to have them
> >> > loaded early. It avoids unnecessary EPROBE_DEFER and hence probably
> >> > even
> >> > boots faster.
> >> 
> >> When we have the pin control and GPIO at different initlevels it makes me
> >> uneasy because I feel we have implicit init dependencies that seem more
> >> than a little fragile.
> > 
> > Yes, it is not very good.
> 
> Btw, just noticed this now:
> GPIO driver -> arch_initcall
> pinctrl driver -> subsys_initcall

I'm not sure what you're talking about, it's the other way around in the 
patches.
