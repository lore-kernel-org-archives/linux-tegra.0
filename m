From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: tegra30: common: enable csite clock
Date: Tue, 09 Oct 2012 16:38:53 -0600
Message-ID: <5074A77D.9080500@wwwdotorg.org>
References: <1349691981-31038-1-git-send-email-josephl@nvidia.com> <1349691981-31038-5-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1349691981-31038-5-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2012 04:26 AM, Joseph Lo wrote:
> Enable csite (debug and trace controller) clock at init to prevent it
> be disabled. And this also the necessary clock for CPU be brought up or
> resumed from a power-gate low power state (e.g., LP2).

Does it make sense to enable this clock only when entering LP2? Or do we
really need to keep it on 100% of the time?
