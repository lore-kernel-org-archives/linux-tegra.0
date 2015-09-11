From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [GIT PULL 9/9] ARM: tegra: Default configuration updates for
 v4.3-rc1
Date: Fri, 11 Sep 2015 15:08:32 +0100
Message-ID: <55F2E060.9080106@nvidia.com>
References: <20150819091358.GA26627@ulmo>
 <1439977724.4135.90.camel@collabora.co.uk> <20150819103305.GF26627@ulmo>
 <CANMBJr6DSXW-h8P8__LKBu-Xv77T35JwxHWvarvqy1keVrtVQQ@mail.gmail.com>
 <CAMAWPa_rus4z+Sg3Uff7ndqrpB8dF1c1rQBVQ9r7vXh6PFcVkQ@mail.gmail.com>
 <55F2AF45.5040706@nvidia.com> <20150911123759.GA8473@ulmo>
 <55F2D3D4.5090608@nvidia.com> <20150911132113.GA21673@ulmo>
 <55F2D995.50906@nvidia.com> <20150911135738.GA23109@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150911135738.GA23109-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 11/09/15 14:57, Thierry Reding wrote:

[snip]

> Then I did the following:
> 
> 	-sh-4.3# modprobe snd-hda-tegra
> 	[ 2243.786143] hdaudio hdaudioC0D3: Unable to bind the codec
> 	-sh-4.3# lsmod
> 	Module                  Size  Used by
> 	snd_hda_tegra           4764  0 
> 	snd_hda_codec          75955  1 snd_hda_tegra
> 	snd_hda_core           26603  2 snd_hda_codec,snd_hda_tegra
> 	snd_pcm                69108  3 snd_hda_codec,snd_hda_tegra,snd_hda_core
> 	snd_timer              17264  1 snd_pcm
> 	snd                    42248  4 snd_timer,snd_pcm,snd_hda_codec,snd_hda_tegra
> 	soundcore                858  1 snd
> 	nouveau              1302185  0 
> 	tegra_devfreq           5375  0 
> 	ttm                    65238  1 nouveau
> 	-sh-4.3# modprobe snd-hda-codec-hdmi
> 	-sh-4.3# modprobe -r snd-hda-tegra
> 	-sh-4.3# modprobe snd-hda-tegra
> 	[ 2263.934328] input: tegra-hda HDMI/DP,pcm=3 as /devices/soc0/70030000.hda/sound/card0/input4
> 
> So all worked just fine.

That's interesting. For me (as per my earlier email), I did not see the
"unable to bind the codec" and modprobe attempted to load
snd-hda-codec-hdmi after snd-hda-tega. Puzzled.

Jon
