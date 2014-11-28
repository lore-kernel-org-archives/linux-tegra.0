From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5][resend] of: replace Asahi Kasei Corp venter prefix
Date: Fri, 28 Nov 2014 14:45:01 +0300
Message-ID: <5478603D.1080404@cogentembedded.com>
References: <878ulzx6hr.wl%kuninori.morimoto.gx@gmail.com>	<20140922130026.GK3290@leverpostej>	<CAMuHMdX22z97SbGS1HDiYfJ1PXxyEN2S8D7w4sr+4bUwD+mJZw@mail.gmail.com>	<20140922132743.GM3290@leverpostej>	<87y4rfhmgl.wl%kuninori.morimoto.gx@renesas.com>	<1415845309.4269.6.camel@perches.com>	<20141113025105.GA16652@verge.net.au>	<87vbmjhj00.wl%kuninori.morimoto.gx@renesas.com>	<20141113110740.GE3815@sirena.org.uk>	<87k32yd0bd.wl%kuninori.morimoto.gx@renesas.com>	<20141114093554.GC3810@ulmo>	<87y4ra8xac.wl%kuninori.morimoto.gx@renesas.com>	<5469CD47.3040409@cogentembedded.com>	<877fytxsde.wl%kuninori.morimoto.gx@renesas.com> <87egsob2cl.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87egsob2cl.wl%kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ALSA Development Mailing List <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello.

On 11/28/2014 3:22 AM, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

> Current vendor-prefixes.txt already has "ak" prefix for Asahi Kasei Corp
> by ae8c4209af2c(of: Add vendor prefix for Asahi Kasei Corp.)

> It went through the appropriate review process. But, almost all
> Asahi Kasei chip drivers are using "asahi-kasei" prefix today.
> (arch/arm/boot/dts/tegra20-seaboard.dts only is using "ak,ak8975",
>   but there are instances of "asahi-kasei,ak8975" in other dts files.
>   And drivers/iio/magnetometer/ak8975.c doesn't support "ak,ak8975" prefix)
> So, we made a mistake there.

> In addition, checkpatch.pl reports WARNING if it is using "asahi-kasei"
> prerfix in DT file.
> (DT compatible string vendor "asahi-kasei" appears un-documented)

> Marking it deprecated and warning with checkpatch is certainly
> preferable. So, this patch replace "ak" to "asahi-kasei" in
> vendor-prefixes.txt. (and fixup tegra20-seaboard)

> OTOH, Asahi Kasei is usually referred to as "AKM", but this patch
> doesn't care about it. Because no DT is using that today.

> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

    It's "venter" ISO "vendor" again in the subject. And you already fixed 
that in the previous posting... :-)

WBR, Sergei
