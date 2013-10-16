From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Remove duplicate powergate defines
Date: Wed, 16 Oct 2013 12:11:25 -0600
Message-ID: <525ED6CD.4050708@wwwdotorg.org>
References: <1381943942-30375-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381943942-30375-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 11:19 AM, Thierry Reding wrote:
> Instead of duplicating powergate defines, reuse the ones from the
> include/linux/tegra-powergate.h header file.

OK, these turned out simple enough, and CPU hotplug still works fine on
Tegra114/Dalmore. So, I've applied these to Tegra's for-3.13/soc branch.
