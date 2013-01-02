From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 0/5] ARM: tegra20: cpuidle: add power-down state
Date: Wed, 02 Jan 2013 12:05:17 -0700
Message-ID: <50E484ED.90108@wwwdotorg.org>
References: <1355797861-12759-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355797861-12759-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/17/2012 07:30 PM, Joseph Lo wrote:
> This adds a "powered-down" state in cpuidle for Tegra20. It requires power
> gating both CPU cores. When the CPU1 requests to enter "powered-down"
> state, it saves its own state and then enters WFI. When the CPU0 requests
> the same state, it attempts to put the CPU1 into reset to prevent it from
> waking up. Then power down both CPUs together and turn off the CPU rail.
> 
> If the CPU1 be woken up before CPU0 entering powered-down state, then it
> needs to restore it's CPU state and waits for next chance.

Joseph,

What's the status of this series? It looks like there are quite a few
comments on V3; I assume you'll post a new version to address those.
Will you base the new version on top of Prashant's common clock cleanup
to remove the conflicts with that?
