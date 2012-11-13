From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra: retain L2 content over CPU suspend/resume
Date: Tue, 13 Nov 2012 12:58:09 +0100
Message-ID: <20121113115809.GA18622@elf.ucw.cz>
References: <1352772288-2290-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1352772288-2290-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue 2012-11-13 10:04:48, Joseph Lo wrote:
> The L2 RAM is in different power domain from the CPU cluster. So the
> L2 content can be retained over CPU suspend/resume. To do that, we
> need to disable L2 after the MMU is disabled, and enable L2 before
> the MMU is enabled. But the L2 controller is in the same power domain
> with the CPU cluster. We need to restore it's settings and re-enable
> it after the power be resumed.

Is it good idea to retain L2 over suspend? I guess this is
power-vs-speed balance...?

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
