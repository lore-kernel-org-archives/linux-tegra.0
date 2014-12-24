From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/11] ARM: tegra: add function to control the GPU rail
 clamp
Date: Wed, 24 Dec 2014 16:52:17 +0300
Message-ID: <549AC511.5040507@gmail.com>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com> <1419331204-26679-2-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419331204-26679-2-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I think "ARM: tegra:" is wrong prefix for this patch and "soc: tegra:" should be
used instead to show that it belongs to SoC driver, not arch code.

-- 
Dmitry
