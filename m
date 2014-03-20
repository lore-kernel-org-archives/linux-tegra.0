From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [GIT PULL 5/5] ARM: tegra: defconfig updates for 3.15
Date: Thu, 20 Mar 2014 16:11:44 -0600
Message-ID: <532B67A0.30104@wwwdotorg.org>
References: <1394224088-28910-1-git-send-email-swarren@wwwdotorg.org> <1394224088-28910-5-git-send-email-swarren@wwwdotorg.org> <20140320214240.GE6649@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140320214240.GE6649-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/20/2014 03:42 PM, Olof Johansson wrote:
> On Fri, Mar 07, 2014 at 01:28:08PM -0700, Stephen Warren wrote:
>> The following options are enabled:
>> - ams AS3722 is used as system PMIC for Tegra124 based Venice2.
>> - NXP PCA9546 is used in Cardhu Tegra30 board to connect to 3 cameras.
>> - GSPCA to support the webcam on Venice2.
>> - Allocate 64 MiB for CMA by default; the default 16MiB is not enough
>>   for the majority of use-cases. This can still be overridden by the cma
>>   command-line option.
>>
>> ----------------------------------------------------------------
>>
>> The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:
>>
>>   Linus 3.14-rc1
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tegra-for-3.15-defconfig
>>
>> for you to fetch changes up to d1c912c1001fb97c1233d0ce3379d0c3f25b8312:
>>
>>   ARM: tegra: defconfig updates
> 
> Merged, thanks. Should some of these options be changed on multi_v7_defconfig
> as well, or are they already there?

Most of the options do need to be added to multi_v7_defconfig (and
multi_lpae_defconfig, which doesn't seem to be checked in). AS3722 is
already there though.
