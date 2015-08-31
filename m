From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Revert part of "ASoC: tegra: Convert to managed resources"
Date: Mon, 31 Aug 2015 14:27:14 +0900
Message-ID: <CAAVeFuJ4Mt7R3TSKyytW=5UNsJMxT_c+4dqG_qzHq8i3JmhT1w@mail.gmail.com>
References: <20150818115645.GA3345@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150818115645.GA3345@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaishali Thakkar <vthakkar1994-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 18, 2015 at 8:56 PM, Vaishali Thakkar
<vthakkar1994-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Revert the problematic part of commit 470805eb9f31 ("ASoC: tegra:
> Convert to managed resources"). Before this commit, PM cleanup was
> performed after the component was unregistered. But returning
> directly will skip PM cleanup. So, to be on safe side it is better
> to use snd_soc_register_component instead of
> devm_snd_soc_register_component.
>
> Signed-off-by: Vaishali Thakkar <vthakkar1994-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I'm probably late for the party, but FWIW:

Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
