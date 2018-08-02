From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/2] ARM: tegra: readd gpio-ranges properties
Date: Thu, 02 Aug 2018 13:35:46 +0300
Message-ID: <2268060.eSddBDDeqC@dimapc>
References: <20180726154025.13173-1-stefan@agner.ch> <17f1c1b1c6d3a83dd1df130420057d3b@agner.ch> <2777476.ese58fB1FL@dimapc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2777476.ese58fB1FL@dimapc>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, thierry.reding@gmail.com, jonathanh@nvidia.com, linus.walleij@linaro.org, pdeschrijver@nvidia.co, marcel.ziswiler@toradex.com
Cc: keescook@chromium.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thursday, 2 August 2018 02:11:23 MSK Dmitry Osipenko wrote:
> On Thursday, 2 August 2018 01:51:42 MSK Stefan Agner wrote:
> > On 01.08.2018 22:51, Dmitry Osipenko wrote:
> > > On Thursday, 26 July 2018 18:40:25 MSK Stefan Agner wrote:
> > >> The properties have been commented out to prevent a regression a
> > >> while ago. The first regression should be resolved by
> > >> commit 44af7927316e ("spi: Map SPI OF client IRQ at probe time").
> > >> 
> > >> The second regression is probably addressed by
> > >> commit 494fd7b7ad10 ("PM / core: fix deferred probe breaking suspend
> > >> resume
> > >> order") and/or maybe others. Readd the gpio-ranges properties to see
> > >> whether regressions still get reported.
> > >> 
> > >> This reverts commit 4f1d841475e1f6e9e32496dda11215db56f4ea73
> > >> ("ARM: tegra: Comment out gpio-ranges properties").
> > >> 
> > >> Signed-off-by: Stefan Agner <stefan@agner.ch>
> > >> ---
> > > 
> > > Unfortunately the second regression hasn't been addressed yet, this
> > > patch
> > > still breaks wake-up using GPIO key. BTW, better to spell "readd" as
> > > "re-add".
> > 
> > You do have the hardware and could test it?
> 
> Yes, I have.
> 
> > Hm, that is unfortunate. I think this was the patch which should address
> > the issue:
> > https://lkml.org/lkml/2015/9/10/218
> 
> I've tested the patch and it is still actual, i.e. it fixes the wake-up.
> Welcome back to 2015 :-)

Actually, the pinctrl-gpio probe order is easily fixable by reshuffling the 
drivers registration order within the kernel. I'll send patches.
