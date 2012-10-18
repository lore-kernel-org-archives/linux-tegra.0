From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpuidle: replace LP3 with ARM_CPUIDLE_WFI_STATE
Date: Thu, 18 Oct 2012 14:26:40 -0600
Message-ID: <50806600.4000803@wwwdotorg.org>
References: <1349691856-30590-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1349691856-30590-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2012 04:24 AM, Joseph Lo wrote:
> The Tegra CPU idle LP3 state is doing ARM WFI only. So it's same with
> the common ARM_CPUIDLE_WFI_STATE. Using it to replace LP3 now.

Applied to Tegra's for-3.8/cpuidle branch (I created that branch in
anticipation of there being a bunch of other cpuidle work for 3.8).
