From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH v2] ASoC: tegra: TrimSlice machine support
Date: Tue, 26 Apr 2011 11:14:00 +0300
Message-ID: <4DB67EC8.60601@compulab.co.il>
References: <1303381618-19730-1-git-send-email-mike@compulab.co.il> <74CDBE0F657A3D45AFBB94109FB122FF04973BB84D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04973BB84D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/21/11 20:01, Stephen Warren wrote:
> Mike Rapoport wrote at Thursday, April 21, 2011 4:27 AM:

[ snip ]

>> +	tristate "SoC Audio support for TrimSlice board"
>> +	depends on SND_SOC_TEGRA && MACH_TRIMSLICE && I2C
>> +	default m
> 
> Mark just removed all the "default" lines from Kconfig, to allow Kconfig
> to determine default policy.

I don't see the 'default' lines being removed from Kconfig in the Mark's tree.

Mark, would you prefer me to drop the 'default' or keep it for consistency with
other entries?


-- 
Sincerely yours,
Mike.
