From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: tegra: add flow controller to support suspend
 for Tegra124
Date: Wed, 09 Oct 2013 17:21:14 -0600
Message-ID: <5255E4EA.8060002@wwwdotorg.org>
References: <1381310411-11391-1-git-send-email-josephl@nvidia.com> <1381310411-11391-3-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381310411-11391-3-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/09/2013 03:20 AM, Joseph Lo wrote:
> Enable the configuration of flow controller to support the last CPU
> (CPU0) suspend function with cluster power down.

I'd be tempted to squash together patches 2 and 3 since they're
basically doing the same kind of thing and are pretty trivial.
