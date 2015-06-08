From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC 1/2] ARM: multi_v7_defconfig: Make drm support modular
Date: Mon, 8 Jun 2015 11:09:42 +0900
Message-ID: <CAAVeFuJqcye_MRoJ7vLwnyB0B1ZhEnY2Y8ZV3N50LhBV3gc4Jg@mail.gmail.com>
References: <1432905926-31606-1-git-send-email-geert@linux-m68k.org>
 <2568731.dqdEiMuDro@wuerfel> <20150605113949.GA26607@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150605113949.GA26607-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 5, 2015 at 8:39 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, May 29, 2015 at 05:41:34PM +0200, Arnd Bergmann wrote:
>> On Friday 29 May 2015 15:25:25 Geert Uytterhoeven wrote:
>> > From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> >
>> > Make drm support modular to reduce kernel size (-620 KiB):
>> >
>> >        text    data     bss     dec     hex   filename
>> >     12211122 1392076  338520 13941718  d4bbd6 vmlinux.before
>> >     11581470 1387196  338264 13306930  cb0c32 vmlinux.after
>> >
>> > Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> > ---
>> > Slightly controversial:
>> >   - Does anyone need drm for boot testing?
>>
>> Only the tegra driver is affected, so let's ask the tegra
>> maintainers.
>
> As a matter of fact I do most of the DRM testing on boot using the
> built-in driver. However I can do that easily using tegra_defconfig so
> I'm fine with this change.
>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Looks good to me to, Nouveau works better as a module anyway. :)

Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
