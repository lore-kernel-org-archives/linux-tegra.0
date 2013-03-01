From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 2/4] ARM: tegra: pmc: add power on function for secondary
 CPUs
Date: Fri, 01 Mar 2013 12:29:37 -0700
Message-ID: <513101A1.7050007@wwwdotorg.org>
References: <1362123131-3339-1-git-send-email-josephl@nvidia.com> <1362123131-3339-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362123131-3339-2-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/01/2013 12:32 AM, Joseph Lo wrote:
> Adding the power on function for secondary CPUs in PMC driver, this can
> help us to remove legacy powergate driver and add generic power domain
> support later.

OK, I think these look good. I'll apply them for 3.10 when I can.

Note: you reposted 2 out of 4 patches. It'd be best to repost all the
patches in the series. While I understand that the other 2 didn't
change, not reposting them makes it a bit harder to track down which
patches fit together into a series, since I have to find some "V2" and
some "V3" and stick them together. That said, given you've already
posted the patches, there's no need to repost them again to fix them
this time; just a note for next time.
