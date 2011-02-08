From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [alsa-devel] [PATCH 6/6] ASoC: Tegra: Harmony: Support both	int
 and ext mics
Date: Tue, 8 Feb 2011 15:32:00 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0310F60084@HQMAIL01.nvidia.com>
References: <1296766578-13988-1-git-send-email-swarren@nvidia.com>
 <1296766578-13988-6-git-send-email-swarren@nvidia.com>
 <20110203225235.GD4586@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF0310C8EB68@HQMAIL01.nvidia.com>
 <20110207111310.GA31475@sirena.org.uk>
 <74CDBE0F657A3D45AFBB94109FB122FF0310F5FFAC@HQMAIL01.nvidia.com>
 <20110208205848.GA23844@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110208205848.GA23844-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Tuesday, February 08, 2011 1:59 PM:
> On Tue, Feb 08, 2011 at 12:34:09PM -0800, Stephen Warren wrote:
> 
> > Maybe I should just not implement mic detection for Harmony due to these
> > issues? In which case, I'd just let mic bias be enabled whenever capture
> > was active, just like the speaker enable GPIO.
> 
> It certainly seems way more trouble than it's worth: as soon as the
> on board mic is used the jack detection will get confused as it'll see
> it.  Of course, the internal mic is actually plugged in to a header on
> the main board so it may be absent too (I believe a lot of units were
> shipped without a case...) which means detecting the internal mic might
> actually be useful :)

Well, one other option is to completely ignore (and disable) the internal
mic, and just support the external mic (jack). Then, mic detection could
be implemented. The advantage here is similarity to other boards without
the mic bias sharing issue. Plus, the jack is probably far more useful
than the internal mic on this board:

I honestly don't know how many boards (if any) actually have anything
plugged into the internal mic header on the board. Mine certainly
didn't originally; I used a PC speaker I stole from somewhere else as
the internal mic;-)

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
