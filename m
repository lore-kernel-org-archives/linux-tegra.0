From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: gpio: tegra: Maintain endianness
Date: Wed, 11 Mar 2015 18:46:10 +0900
Message-ID: <CAAVeFuLBz0UJsVEi=EYPbGd2x3Q6_JOELb4SHspR+w=tBS8mZw@mail.gmail.com>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk>
 <1420817231-8346-3-git-send-email-bob.mottram@codethink.co.uk> <20150311094324.GH19577@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150311094324.GH19577-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 11, 2015 at 6:43 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jan 09, 2015 at 03:27:09PM +0000, Bob Mottram wrote:
>> Replace the _raw-writel with writel_relaxed to fix issue with
>> running tegra in big-endian. Tested on Jetson TK1.
>>
>> Signed-off-by: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
>> ---
>>  drivers/gpio/gpio-tegra.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Linus, Alex,
>
> would you prefer to take this through the GPIO tree or shall I take it
> into the Tegra tree along with the rest of this series. In case of the
> former:
>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> I see that the patch wasn't Cc'ed to linux-gpio or Linus so, for
> reference, here's a link to it in patchwork:
>
>         http://patchwork.ozlabs.org/patch/427142/

Please take it in the Tegra tree, that way the patches of this series
will appear sequentially in the git log instead of being spread across
various trees without any hint about their relation.
