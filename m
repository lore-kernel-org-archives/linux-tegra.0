From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Remove duplicate powergate defines
Date: Thu, 17 Oct 2013 10:46:55 +0800
Message-ID: <1381978015.4120.25.camel@jlo-ubuntu-64.nvidia.com>
References: <1381943942-30375-1-git-send-email-treding@nvidia.com>
	 <525ED6CD.4050708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <525ED6CD.4050708-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2013-10-17 at 02:11 +0800, Stephen Warren wrote:
> On 10/16/2013 11:19 AM, Thierry Reding wrote:
> > Instead of duplicating powergate defines, reuse the ones from the
> > include/linux/tegra-powergate.h header file.
> 
> OK, these turned out simple enough, and CPU hotplug still works fine on
> Tegra114/Dalmore. So, I've applied these to Tegra's for-3.13/soc branch.

Yes, that is because the CPU power control function was switched to use
the one in the pmc.c. FYI.
