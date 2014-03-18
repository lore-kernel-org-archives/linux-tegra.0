From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: Colibri T20 AC97 initialization issue
Date: Tue, 18 Mar 2014 10:26:18 +0100
Message-ID: <1395134778.2067.1.camel@tellur>
References: <7362b9cc4df940c2f27de6996f897e7f@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7362b9cc4df940c2f27de6996f897e7f-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Sonntag, den 16.03.2014, 00:56 +0100 schrieb Stefan Agner:
> Hi,
> 
> Just tried to run v3.14-rc6 on a Colibri T20. Anybody knows whats going
> on here?
> 
> [    3.308695] tegra-snd-wm9712 sound.3: ASoC: CPU DAI (null) not
> registered
> [    3.317927] tegra-snd-wm9712 sound.3: snd_soc_register_card failed
> (-517)
> [    3.325352] platform sound.3: Driver tegra-snd-wm9712 requests probe
> deferral
> 
> I noticed that Lucas removed cpu_dai_name in a recent commit
> (58e354be337dff43dbb66c4564bb9479354cc5dd), however even with that
> property ASoC core claims that the DAI is not registred. I checked the
> configuration, CONFIG_SND_SOC_TEGRA20_AC97 and
> CONFIG_SND_SOC_TEGRA_WM9712 is set...
> 
You'll need my second patch to move the clock handling to the machine
driver for AC'97 to work. I keep forgetting to resend and follow up on
this. I will send out another version today, if not please ping me
again.

Regards,
Lucas
