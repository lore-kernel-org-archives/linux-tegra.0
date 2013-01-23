From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4 0/5] ARM: tegra20: cpuidle: add power-down state
Date: Wed, 23 Jan 2013 10:22:27 -0700
Message-ID: <51001C53.1030609@wwwdotorg.org>
References: <1358323807-30157-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358323807-30157-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/16/2013 01:10 AM, Joseph Lo wrote:
> This adds a "powered-down" state in cpuidle for Tegra20. It requires power
> gating both CPU cores. When the CPU1 requests to enter "powered-down"
> state, it saves its own state and then enters WFI. When the CPU0 requests
> the same state, it attempts to put the CPU1 into reset to prevent it from
> waking up. Then power down both CPUs together and turn off the CPU rail.
> 
> If the CPU1 be woken up before CPU0 entering powered-down state, then it
> needs to restore it's CPU state and waits for next chance.

I have applied this series to Tegra's for-3.9/soc branch.
