From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] ARM: dt: tegra114: add PWM nodes
Date: Tue, 12 Mar 2013 12:50:05 -0600
Message-ID: <513F78DD.6080401@wwwdotorg.org>
References: <1363045695-28874-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363045695-28874-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/11/2013 05:48 PM, Andrew Chew wrote:
> This patch adds device tree nodes for the four PWM controllers present
> on Tegra114.

Applied to Tegra's for-3.10/dt branch.

I changed the patch subject to:
ARM: tegra: add PWM nodes to Tegra114 DT

tegra114: isn't a valid sub-system tag; it's tegra:. I tend not to
include dt: now.
