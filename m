From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 0/4] ARM: tegra114: bring up secondary CPU for SMP
Date: Wed, 06 Mar 2013 14:56:22 -0700
Message-ID: <5137BB86.80200@wwwdotorg.org>
References: <1361932087-13372-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361932087-13372-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/26/2013 07:28 PM, Joseph Lo wrote:
> This series bring up secondary CPU for Tegra114. Because we are going to
> support generic power domain later, the conventional powergate driver will
> be removed. So we add the CPU power on/off function in PMC driver first.

I have applied all 4 patches in this series:

1/4: Applied V3, to Tegra's for-3.10/cleanup branch
2/4: Applied V3, to Tegra's for-3.10/cleanup branch
3/4: Applied V2, to Tegra's for-3.10/cleanup branch
4/4: Applied V2, to Tegra's for-3.10/soc branch
