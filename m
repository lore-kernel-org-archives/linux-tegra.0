From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v3 00/10] Add tegra30 support for secondary cores
Date: Sun, 26 Feb 2012 13:59:25 -0800
Message-ID: <20120226215925.GD11189@quad.lixom.net>
References: <1328831277-21002-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1328831277-21002-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 10, 2012 at 01:47:40AM +0200, Peter De Schrijver wrote:
> This patchset introduces support for secondary cores on tegra30. It also
> introduces some functions for the flowcontroller and adds basic support for
> tegra30 powerdomains.

Thanks, I've applied this series in a new for-3.4/t3-smp branch: It depends and
pulls in both for-3.4/soc and for-3.4/soc-drivers, but I didn't want to just
add it on top of soc-drivers on the same topic.

I added the comment to headsmp.S that Colin had a nit about, besides that it
was just a couple of minor trivial context conflicts that I fixed up.

Please follow up with separate patches for the shutdown issues, etc.


Thanks!


-Olof
