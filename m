From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Colibri T20 AC97 initialization issue
Date: Sun, 16 Mar 2014 00:56:58 +0100
Message-ID: <7362b9cc4df940c2f27de6996f897e7f@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

Just tried to run v3.14-rc6 on a Colibri T20. Anybody knows whats going
on here?

[    3.308695] tegra-snd-wm9712 sound.3: ASoC: CPU DAI (null) not
registered
[    3.317927] tegra-snd-wm9712 sound.3: snd_soc_register_card failed
(-517)
[    3.325352] platform sound.3: Driver tegra-snd-wm9712 requests probe
deferral

I noticed that Lucas removed cpu_dai_name in a recent commit
(58e354be337dff43dbb66c4564bb9479354cc5dd), however even with that
property ASoC core claims that the DAI is not registred. I checked the
configuration, CONFIG_SND_SOC_TEGRA20_AC97 and
CONFIG_SND_SOC_TEGRA_WM9712 is set...

--
Stefan
