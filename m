From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 4/5] ASoC: Process card->widgets after all probe routines
Date: Tue, 19 Apr 2011 23:11:27 +0100
Message-ID: <20110419221127.GA4772@opensource.wolfsonmicro.com>
References: <1303238777-14277-1-git-send-email-swarren@nvidia.com>
 <1303238777-14277-4-git-send-email-swarren@nvidia.com>
 <20110419185238.GL1765@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF04973BB49A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04973BB49A-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org" <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 19, 2011 at 12:19:37PM -0700, Stephen Warren wrote:

> Before that change, the "Int Spk" control both works fine, and when I
> modify the value in alsamixer, exit, and restart alsamixer, the value I
> set is maintained.

> However, after that change, the control works fine (i.e. mutes/umutes
> speakers while speaker-test is running in the background), but when I
> quit and restart alsamixer, the most recent set value is not shown.

> Do you have any clue what I should look at for that?

Cross-context DAPM will be broken - I already found several issues there
since I started using it myself, it's probable that there's some more in
there.
