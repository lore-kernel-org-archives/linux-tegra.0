From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: TrimSlice machine support
Date: Thu, 21 Apr 2011 09:53:11 +0300
Message-ID: <4DAFD457.30805@compulab.co.il>
References: <1303043988-21933-1-git-send-email-mike@compulab.co.il> <74CDBE0F657A3D45AFBB94109FB122FF04973BB176@HQMAIL01.nvidia.com> <20110418144050.GC1765@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110418144050.GC1765-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/18/11 17:40, Mark Brown wrote:
> On Sun, Apr 17, 2011 at 08:45:22AM -0700, Stephen Warren wrote:
> 
>> // First line cribbed from tlv320aic3x.c.
>> // Yes, that's not the codec here, but the logic applies I think.
>> fsref = (srate % 11025 == 0) ? 44100 : 48000;
>> mclk = 256 * fsref;
> 
> That's pretty much illegible due to the ternery operator and...
> 
>> ... although the rate calculations in tlv320aic23.c are more complex, so
>> I could be persuaded otherwise.
> 
> ...it's for a completely different CODEC with different requirements and
> features.
> 

I've run several tests and the codec seems to be pretty happy when
mclk = 128 * srate
so I'd prefer to keep things simple and green :)


-- 
Sincerely yours,
Mike.
