From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: clean up the CPUINIT section
Date: Fri, 04 Jan 2013 12:35:15 -0700
Message-ID: <50E72EF3.5020200@wwwdotorg.org>
References: <1357291942-32433-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357291942-32433-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/04/2013 02:32 AM, Joseph Lo wrote:
> There are some redundant codes in the CPUINIT section that was caused by
> some codes not be organized well in "headsmp.S". Currently all the codes
> in "headsmp.S" were put into CPUINIT section. But actually it doesn't
> need to be loacted in CPUINIT section. There is no fuction access them
> in CPUINIT section and we will relocate them to IRAM.
> 
> These codes also caused some unnecessary functions that access these
> codes been put into CPUINIT section too. This patch clean it up and put
> them into normal text section.

Applied to Tegra's for-3.9/soc branch.
