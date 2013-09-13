From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH 2/2] Add config files for Venice2 board
Date: Fri, 13 Sep 2013 10:19:02 -0600
Message-ID: <52333AF6.9060208@wwwdotorg.org>
References: <1378943336-9263-1-git-send-email-swarren@wwwdotorg.org> <1378943336-9263-2-git-send-email-swarren@wwwdotorg.org> <523101EA.7020704@wwwdotorg.org> <20130913132252.GN30013@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130913132252.GN30013-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/13/2013 07:22 AM, Peter De Schrijver wrote:
> On Thu, Sep 12, 2013 at 01:51:06AM +0200, Stephen Warren wrote:
>> On 09/11/2013 05:48 PM, Stephen Warren wrote:
>>> This board is currently disabled by default due to lack of U-Boot support
>>> in the mainline repository. If you wish to test this, do as follows:
>>>
>>> cd u-boot
>>> git checkout some-branch-with-venice2-support
>>> cd ../scripts
>>> ./build --boards venice2 build
>>
>> Peter, do you have a Venice2 yet? If so, could I trouble you to apply
>> the tegrarcm Tegra124 support patches from Allen, the cbootimage-configs
>> and tegra-uboot-flasher-scripts patches from me, grab a downstream
>> Venice2 U-Boot branch, and validate that it all works?
>>
> 
> It builds all fine, but flashing as such fails with:
> 
> U-Boot SPL 2013.04-g4e07053 (Sep 13 2013 - 16:11:40)
> 
> 
> U-Boot 2013.04-g4e07053 (Sep 13 2013 - 16:11:40)

OK, the fact that U-Boot started booting at all means that at least the
BCT is fine, since the code executed from DRAM OK.

...
> SF: Unsupported manufacturer fc
> Failed to initialize SPI flash at 0:0
> No SPI flash selected. Please run `sf probe'
> No SPI flash selected. Please run `sf probe'

Hmm. I assume if you just "exec" U-Boot rather than "flash" it (or if
you run U-Boot through some mechanism other than
tegrarcm/tegra-uboot-flasher), the "sf probe 0" fails in the same way?
That sounds like (that branch of) U-Boot simply doesn't have SPI flash
support yet, or doesn't support the specific chip on the board. So,
there's /probably/ nothing wrong with the flasher scripts either.

> ## Resetting to default environment
> Saving Environment to MMC...
> Writing to MMC(0)... done
> resetting ...

Oh. U-Boot is saving the environment to eMMC... That's odd considering
the BCT is set up for SPI boot. I would expect the two to be consistent.
Do you know if the fuses/straps are set up for SPI or eMMC boot?
