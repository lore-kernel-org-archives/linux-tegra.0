From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/3] ASoC: Tegra: WM8903: Allow re-insertion of module
Date: Tue, 9 Aug 2011 08:36:36 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04A068726C@HQMAIL01.nvidia.com>
References: <1312497884-1599-1-git-send-email-swarren@nvidia.com>
 <1312497884-1599-2-git-send-email-swarren@nvidia.com>
 <20110809004346.GA22795@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110809004346.GA22795-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Monday, August 08, 2011 6:44 PM:
> On Thu, Aug 04, 2011 at 04:44:43PM -0600, Stephen Warren wrote:
> > Two issues were preventing module snd-soc-tegra-wm8903.ko from being
> > removed and re-inserted:
> 
> I've applied all three but please be a bit clearer with your patch
> descriptions - this isn't a patch for WM8903 at all, it's a patch for
> the tegra-wm8903 machine driver.

OK, but what's the correct tag then? I explicitly wrote Tegra in the
commit subject and not just WM8903...

Thanks.

-- 
nvpublic
