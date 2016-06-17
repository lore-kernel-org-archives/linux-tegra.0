From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: tegra-devfreq hangs TK1 with R21.4 u-boot
Date: Fri, 17 Jun 2016 10:30:07 -0600
Message-ID: <5764258F.3060207@wwwdotorg.org>
References: <20160612034541.GA31426@jirafa.cyrius.com>
 <20160616161611.GC19360@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160616161611.GC19360-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <srwarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/16/2016 10:16 AM, Thierry Reding wrote:
> On Sat, Jun 11, 2016 at 08:45:41PM -0700, Martin Michlmayr wrote:
>> I noticed that the Jetson TK1 hangs during boot (when/before mounting
>> the SD disk) when CONFIG_ARM_TEGRA_DEVFREQ=y is set and when u-boot
>> from R21.4 is used (2014.10-rc2).
>>
>> The hang does not occur when I disable tegra-devfreq or when I use
>> tegra-devfreq in combination with u-boot 2016.03 (from DENX upstream,
>> built by Debian).
>>
>> Steps to reproduce:
>>
>> ARCH=arm make multi_v7_defconfig
>> Set CONFIG_ARM_TEGRA_DEVFREQ=y
>> Boot from an external SD card and it will hang when/before mounting the
>> SD card.
>
> Stephen, any ideas what might be going on here?

I can't think of anything obvious, and the commit history of the L4T 
U-Boot is constructed in such a way that's it's essentially impossible 
to follow, so I can't easily tell what changes exist in the L4T U-Boot 
release that weren't upstream or vice-versa. If simply using mainline 
U-Boot works and is an option for you, I'd suggest that.
