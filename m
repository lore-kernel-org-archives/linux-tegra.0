From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra30: clocks: fix the wrong tegra_audio_sync_clk_ops
 name
Date: Fri, 17 Aug 2012 13:26:51 -0600
Message-ID: <502E9AFB.3090205@wwwdotorg.org>
References: <1345186450-4517-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345186450-4517-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/17/2012 12:54 AM, Joseph Lo wrote:
> It should use tegra30_audio_sync_clk_ops for tegra30. It will cause
> the tegra30 use the wrong audio_sync_clk_ops when build a kernel with
> a tegra20 and tegra30 both supported kernel. And building error when
> a tegra30-only kernel.

Thanks, applied to Tegra's for-3.7/common-clk branch.
