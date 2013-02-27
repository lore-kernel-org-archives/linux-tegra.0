From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 4/4] ARM: tegra114: bring up secondary CPU for SMP
Date: Wed, 27 Feb 2013 11:58:33 -0700
Message-ID: <512E5759.70605@wwwdotorg.org>
References: <1361932087-13372-1-git-send-email-josephl@nvidia.com> <1361932087-13372-5-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361932087-13372-5-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/26/2013 07:28 PM, Joseph Lo wrote:
> The secondary CPU can be brought up by toggling the power in PMC. Then
> the flow controller will release CPU to go by clearing the reset and
> clamp signal automatically.

Patches 3 and 4 look fine as-is.
