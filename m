From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: tegra: add LP1 support code for Tegra124
Date: Fri, 11 Oct 2013 15:38:09 +0800
Message-ID: <1381477089.5685.3.camel@jlo-ubuntu-64.nvidia.com>
References: <1381310411-11391-1-git-send-email-josephl@nvidia.com>
	 <1381310411-11391-5-git-send-email-josephl@nvidia.com>
	 <5255E4CD.1050509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5255E4CD.1050509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2013-10-10 at 07:20 +0800, Stephen Warren wrote:
> On 10/09/2013 03:20 AM, Joseph Lo wrote:
> > The LP1 suspend procedure is the same with Tegra30 and Tegra114. Just
> > need to update the difference of the register address, then we can
> > continue to share the code.
> > -	.rept (tegra30_sdram_pad_size - tegra114_sdram_pad_address) / 4
> > +	.rept (tegra124_sdram_pad_address - tegra114_sdram_pad_address) / 4
> 
> I assume this is intended to reserve enough space to store all the saved
> registers for the largest table of tegra30_sdram_pad_address,
> tegra114_sdram_pad_address, tegra124_sdram_pad_address. I count more
> entries in the existing Tegra114 table than the new Tegra124 table, so
> I'm not sure this part of the change is correct.
> 
> Is there no way to do a max(tegra30 size, tegra114 size, tegra124 size)
> so you don't have to pick manually which size to reserve here?

I don't have a good way to achieve this, because we may have another new
SoC that may continue re-use these codes. Hence I need to keep
maintaining the max() function.
