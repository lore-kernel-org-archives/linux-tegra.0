From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v3] ASOC: tegra: move AC97 clock handling to the machine
 driver
Date: Wed, 19 Mar 2014 00:12:44 +0100
Message-ID: <e1741f5cc6534f1af897b8817a4a8d73@agner.ch>
References: <1395174649-1493-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395174649-1493-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am 2014-03-18 21:30, schrieb Lucas Stach:
> On Tegra the convention is to have a single machine driver
> that's controlling the whole audio subsystem. This was
> introduced after the AC97 driver was merged and ever since
> AC97 has been broken.
> 
> Move the clock handling to the machine driver, to be in line
> with the other Tegra drivers and give the machine driver
> full control over the single Tegra audio PLL.

On a Colibri T20, the AC97 Codec WM9712 gets detected and I can play
audio after unmuting the right output:
amixer -c 0 set 'Left HP Mixer PCM' on
amixer -c 0 set 'Right HP Mixer PCM' on

Tested-by: <stefan-XLVq0VzYD2Y@public.gmane.org>

Lucas, did you tried once to capture input? In my test using arecord -f
cd, recorded sound is very slow (rate problem?)
