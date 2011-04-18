From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [alsa-devel] [PATCH 1/4] ASoC: Tegra: Rename harmony.c to
 tegra_wm8903.c
Date: Mon, 18 Apr 2011 13:57:49 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04973BB2DE@HQMAIL01.nvidia.com>
References: <1302630039-19514-1-git-send-email-swarren@nvidia.com>
 <20110418203228.GB13808@opensource.wolfsonmicro.com>
 <20110418203433.GC13808@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF04973BB2CD@HQMAIL01.nvidia.com>
 <20110418204640.GE13808@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110418204640.GE13808-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Monday, April 18, 2011 2:47 PM:
> On Mon, Apr 18, 2011 at 01:36:45PM -0700, Stephen Warren wrote:
> 
> > Was it due to relying on all the changes that are only in your
> > tegra branch, or something else? Perhaps for-2.6.40 moved on
> > since I made the patches?
> 
> There was other stuff, the tegra branch was merged into 2.6.40
> immediately.

OK, good; just wanted to make sure I'd made the dependencies clear this
time around.

I didn't see anyone from the Tegra side ack those changes though. I
assume the Tegra maintainers are OK with them since nobody said
otherwise...

-- 
nvpublic
