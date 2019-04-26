From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] amba: tegra-ahb: mark PM functions as __maybe_unused
Date: Fri, 26 Apr 2019 17:50:22 +0200
Message-ID: <CAK8P3a0d7yoEhxf+-TcUfmsR5kj3KmZ_JwzfTkzcoTTcAHaJ7g@mail.gmail.com>
References: <20190426145617.2342824-1-arnd@arndb.de> <20190426152033.GB19559@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426152033.GB19559@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 26, 2019 at 5:20 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Fri, Apr 26, 2019 at 04:56:03PM +0200, Arnd Bergmann wrote:
> > clang warns about an unused variable when CONFIG_PM is disabled,
> > since it is only referenced from an #ifdef:
> >
> > drivers/amba/tegra-ahb.c:97:18: error: variable 'tegra_ahb_gizmo' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
> >
> > Rather than trying to get the #ifdef right, remove it and
> > use __maybe_unused here, which is less error prone.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/amba/tegra-ahb.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
>
> Shouldn't tegra_ahb_gizmo have the same annotation, then? I do see that
> it's "used" in tegra_ahb_probe() as part of an ARRAY_SIZE() expression,
> but that technically doesn't mean that it would need to be emitted, but
> it might be enough to shut up clang?

It would be enough to annotated tegra_ahb_gizmo as __maybe_unused,
but I don't like the idea of using both __maybe_unused and #ifdef to
deal with the CONFIG_PM issue, so I was try to make this more consistent.

> Or does the __maybe_unused not get propagated?
>
> Looking at the code, I guess we could save a bit of memory if we didn't
> allocate memory for the zero-length "ctx" array for !PM since that's no
> longer needed. But then again, we've recently changed 32-bit Tegra to
> forcefully enable PM, just like we did for 64-bit Tegra, so that's moot
> anyway.

Right

> Do you want me to pick this up, or would you rather stash it into ARM
> SoC directly? If the latter:

Olof is currently doing the merges and I forgot to Cc him, so I'd prefer
if you could forward the patch to him or include it in a later pull
request.

        Arnd
