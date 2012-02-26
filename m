From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: select required CPU and L2 errata options
Date: Sun, 26 Feb 2012 14:25:23 -0800
Message-ID: <20120226222523.GH11189@quad.lixom.net>
References: <1329251979-14805-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1329251979-14805-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 14, 2012 at 01:39:39PM -0700, Stephen Warren wrote:
> The ARM IP revisions in Tegra are:
> Tegra20: CPU r1p1, PL310 r2p0
> Tegra30: CPU A01=r2p7/>=A02=r2p9, NEON r2p3-50, PL310 r3p1-50
> 
> Based on work by Olof Johansson, although the actual list of errata is
> somewhat different here, since I added a bunch more and removed one PL310
> erratum that doesn't seem applicable.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Olof, should this be CC: stable?

Sounds reasonable. I've added the patch to for-3.4/cleanups_and_fixes and added
the cc. Given that it's not a refression I'm hesitant to send a fix for 3.3 at
this point in the release cycle.


-Olof
