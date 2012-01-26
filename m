From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: dt: tegra: Enable headphone
 autodetection on PAZ00 board.
Date: Thu, 26 Jan 2012 10:45:25 +0000
Message-ID: <20120126104525.GA7695@sirena.org.uk>
References: <1327517477-29785-1-git-send-email-leon@leon.nu>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB821BE@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178CB821BE-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 25, 2012 at 02:31:06PM -0800, Stephen Warren wrote:
> Leon Romanovsky wrote at Wednesday, January 25, 2012 11:51 AM:

> > +static struct snd_soc_jack_gpio tegra_alc5632_hp_jack_gpio = {
> > +	.name = "Headphone detect",
> > +	.report = SND_JACK_HEADPHONE,

> I think that should be HEADSET not HEADPHONE, since it's a combo socket
> for both headphones and a mic isn't it? (so perhaps the name should also
> be "Headset detection"?

Unless the CODEC can do accessory detection on the mic in which case the
jack GPIO usually only reports headphone and then the CODEC detects if
it's a headset or headphone.
