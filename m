From: Liam Girdwood <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 1/6] ASoC: Tegra: Harmony: Add headphone
 jack detection
Date: Tue, 08 Feb 2011 21:56:19 +0000
Message-ID: <1297202179.3314.124.camel@odin>
References: <1296766578-13988-1-git-send-email-swarren@nvidia.com>
	 <20110203223530.GA4586@opensource.wolfsonmicro.com>
	 <74CDBE0F657A3D45AFBB94109FB122FF0310C8EA93@HQMAIL01.nvidia.com>
	 <74CDBE0F657A3D45AFBB94109FB122FF0310F5FB00@HQMAIL01.nvidia.com>
	 <74CDBE0F657A3D45AFBB94109FB122FF0310F5FFA5@HQMAIL01.nvidia.com>
	 <20110208205917.GB23844@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110208205917.GB23844-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2011-02-08 at 20:59 +0000, Mark Brown wrote:
> On Tue, Feb 08, 2011 at 12:28:48PM -0800, Stephen Warren wrote:
> 
> > Mark, I'm happy to go either way on this; the SW engineer in me doesn't like
> > non-const globals and inconsistency with the rest of the state data, but
> > equally fixing this seems like it would bloat the code and might make it
> > less readable.
> 
> > Let me know which way you'd prefer it to go.
> 
> I think your current patch is fine.  Liam?

Yeah, lets go with this.

Acked-by: Liam Girdwood <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
