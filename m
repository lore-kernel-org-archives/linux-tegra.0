From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/6] ASoC: Tegra: Harmony: Add headphone jack detection
Date: Fri, 4 Feb 2011 12:32:14 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0310F5FB00@HQMAIL01.nvidia.com>
References: <1296766578-13988-1-git-send-email-swarren@nvidia.com>
 <20110203223530.GA4586@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF0310C8EA93@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0310C8EA93-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Thursday, February 03, 2011 4:25 PM:
> 
> Mark Brown wrote at Thursday, February 03, 2011 3:36 PM:
> > On Thu, Feb 03, 2011 at 01:56:13PM -0700, Stephen Warren wrote:
> >
> > > +static struct snd_soc_jack harmony_hp_jack;
> > > +
> >
> > Since you've changed to using a platform device you should really be
> > dynamically allocating this I guess.  But this isn't actually a
> > practical problem so not worth caring about.
> 
> Uggh. The code may as well be consistent. I'll fix this up and resubmit
> if you haven't already applied it.

Hmm. Looking at this a bit more, solving it fully is kinda nasty; I'd have
to move not only that jack definition, but also all the pins and gpios into
struct tegra_harmony, since snd_soc_jack_add_{pins,gpios} modify all of
those structures. But, there would still have to be static const "template"
copies of those data structures to initialize the copies in struct
tegra_harmony.

The same thing then applies to some of the subsequent changes, for the
mic jacks etc.

That seems like a lot of overhead, both code-wise, and runtime space-wise,
to solve a problem that as you mention isn't a practical concern.

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
