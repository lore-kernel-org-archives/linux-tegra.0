From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: moving tegra_bct_strapping to tegra-soc.h
 for global visibility
Date: Tue, 17 Dec 2013 15:53:35 -0700
Message-ID: <52B0D5EF.5090703@wwwdotorg.org>
References: <1387272400-4689-1-git-send-email-josephl@nvidia.com> <1387272400-4689-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387272400-4689-2-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/17/2013 02:26 AM, Joseph Lo wrote:
> This patch moves the tegra_btc_strapping variable to the tegra-soc.h for
> the global visibility that the other Tegra device driver can access it.
> It also a preparation that we can move out the Tegra20 EMC driver from
> mach-tegra to the drivers folder.

Rather than introduce yet more dependencies between the Tegra tree and
other trees for 3.14, I'd like to see the two clock changes in this
series taken into the clock tree for 3.14, and the other 2 patches
deferred for 3.15.

Joseph, I assume that if patches 2/4 and 4/4 are applied without patches
1/4 and 3/4, there will be no issues?

This patch looks fine, I think ...
