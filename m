From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra30: fix power up sequence for boot_secondary
Date: Thu, 03 Jan 2013 10:19:33 -0700
Message-ID: <50E5BDA5.6040505@wwwdotorg.org>
References: <1357198291-16500-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357198291-16500-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/03/2013 12:31 AM, Joseph Lo wrote:
> The power up sequence is different on the cold boot CPU and the CPU
> that resumed from the hotplug. For the cold boot CPU, it was been power
> gated as default. To power up the cold boot CPU, the power should be
> un-gated by un toggling the power gate register manually.
> 
> For the CPU that resumed from the hotplug, after un-halted the CPU. The
> flow controller will un-gate the power of the CPU. No need to manually
> control, just wait the power be resumed and continue the power up
> sequence after the CPU power is ready.
> 
> Based on the work by:
> Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to Tegra's for-3.9/soc branch.
