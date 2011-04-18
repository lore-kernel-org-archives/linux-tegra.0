From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: TrimSlice machine support
Date: Mon, 18 Apr 2011 15:40:50 +0100
Message-ID: <20110418144050.GC1765@opensource.wolfsonmicro.com>
References: <1303043988-21933-1-git-send-email-mike@compulab.co.il>
 <74CDBE0F657A3D45AFBB94109FB122FF04973BB176@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04973BB176-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Apr 17, 2011 at 08:45:22AM -0700, Stephen Warren wrote:

> Also, I renamed harmony.c to be tegra_wm8903.c since there are a number of
> boards using Tegra with that codec. I wonder if we'll have the same
> situation with this codec, such that this new combination should be e.g.
> SND_SOC_TEGRA_TLV320AIC2x and tegra_tlv320aic2x.c?

I'm not a massive fan of this if people aren't cloning a single
reference design - it seems better to factor out the code when we see
it's being shared and that there's not lots of side warts that cause
hassle.

> // First line cribbed from tlv320aic3x.c.
> // Yes, that's not the codec here, but the logic applies I think.
> fsref = (srate % 11025 == 0) ? 44100 : 48000;
> mclk = 256 * fsref;

That's pretty much illegible due to the ternery operator and...

> ... although the rate calculations in tlv320aic23.c are more complex, so
> I could be persuaded otherwise.

...it's for a completely different CODEC with different requirements and
features.

> > +static const struct snd_soc_dapm_route trimslice_audio_map[] = {
> > +	{"Headphone Jack", NULL, "LOUT"},
> > +	{"Headphone Jack", NULL, "ROUT"},

> Isn't this "Line Out" if LOUT/ROUT are correct. Or, should this be
> LHPOUT/RHPOUT if this is a headphone out.

Depends on what the jack is labelled as.  Headphone and line outputs are
typically at the same level and many line outputs will drive headphone
loads just fine.
