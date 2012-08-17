From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: clocks: separate tegra_clk_32k_ops from Tegra20
 and Tegra30
Date: Fri, 17 Aug 2012 13:26:41 -0600
Message-ID: <502E9AF1.2000701@wwwdotorg.org>
References: <1345186281-3859-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345186281-3859-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/17/2012 12:51 AM, Joseph Lo wrote:
> Currently the tegra20 and tegra30 share the same symbol for
> tegra_clk_32k_ops. This will cause a compile error when building
> a tegra20-only kernel image. Add tegra_clk_32k_ops for tegra20 and
> modify tegra30_clk_32k_ops for tegra30.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied to Tegra's for-3.7/common-clk branch.
