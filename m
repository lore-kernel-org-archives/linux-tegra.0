From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: tegra-devfreq hangs TK1 with R21.4 u-boot
Date: Fri, 17 Jun 2016 10:17:30 -0600
Message-ID: <5764229A.2000702@wwwdotorg.org>
References: <20160612034541.GA31426@jirafa.cyrius.com>
 <loom.20160612T175114-608@post.gmane.org>
 <20160612173106.GA31522@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160612173106.GA31522-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Cc: Shreshtha <shreshthakumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/12/2016 11:31 AM, Martin Michlmayr wrote:
> * Shreshtha <shreshthakumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [2016-06-12 17:15]:
>>> I noticed that the Jetson TK1 hangs during boot (when/before mounting
>>> the SD disk) when CONFIG_ARM_TEGRA_DEVFREQ=y is set and when u-boot
>>> from R21.4 is used (2014.10-rc2).
>>
>> I cannot find CONFIG_ARM_TEGRA_DEVFREQ in r21.4 codeline. With default
>> "tegra12_defconfig", CONFIG_PM_DEVFREQ is getting enabled.
>>
>> Can you please share some more details about CONFIG_ARM_TEGRA_DEVFREQ, which
>> file it complies and if it is really present in code or pulled from other git.
>
> Sorry for not being clear.  I'm talking about the mainline kernel from
> kernel.org:
> drivers/devfreq/Makefile:obj-$(CONFIG_ARM_TEGRA_DEVFREQ)                += tegra-devfreq.o
>
> Booting a mainline kernel with tegra-devfreq enabled will hang my machine
> during bootup when I use the u-boot from R21.4 (which I believe is the
> latest provided by NVIDIA).

Note that if you're booting a mainline kernel, there's no need to use 
the L4T U-Boot release; a mainline U-Boot release should work just fine. 
Or put another way, the "latest provided by NVIDIA" is actually mainline 
U-Boot, unless you need to boot a downstream L4T kernel which has some 
downstream-specific requirements.
