From: Vaishali Thakkar <vthakkar1994-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: Convert to managed resources
Date: Tue, 18 Aug 2015 08:15:35 +0530
Message-ID: <CAK-LDbLCvdUiNZ17oxWwuUhC=hwtpuGeYdxXj=0Y3q48gkbzRw@mail.gmail.com>
References: <20150813072920.GA17181@localhost>
	<CAAVeFuKT1st8E1fxcDM5CV_OzUcTmvFw8UuU5oh15J1PiFJ0vA@mail.gmail.com>
	<CAK-LDbJwfuqU6ekRudms=YfjVxWf1BOREBwCnCh4v-YWY9hA_w@mail.gmail.com>
	<20150817204751.GD10748@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150817204751.GD10748-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 18, 2015 at 2:17 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Aug 17, 2015 at 03:02:29PM +0530, Vaishali Thakkar wrote:
>
>> I think you are right. I missed that. But now thing is , this patch is already
>> applied here:
>> https://git.kernel.org/cgit/linux/kernel/git/broonie/sound.git/commit/?h=topic/tegra
>
>> I am not sure if now I can change version 2 with the changes you suggested
>> or not. Although I will not be able to test it  after changing 'goto
>> err_suspend'
>> as I don't have hardware but may be someone else can test it.
>
> You can send an incremental update on top of what's there, or it may be
> more sensible to just discard the change entirely.  I suspect we're safe
> with either PM vs component ordering though since we should support !PM
> configurations anyway.

I think yes may be code was good before this. But devm_clk_put part should work
fine as call of it is before PM stuff. So, can I send a patch
reverting the change
of component part or do you want me to send a patch reverting whole change?


-- 
Vaishali
