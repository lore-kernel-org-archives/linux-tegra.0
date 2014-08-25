From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM: tegra: Add PLL_M_UD and PLL_C_UD to tegra124-car
 binding header
Date: Mon, 25 Aug 2014 11:41:56 -0600
Message-ID: <53FB7564.7020304@wwwdotorg.org>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com> <1405088313-20048-4-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405088313-20048-4-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/11/2014 08:18 AM, Mikko Perttunen wrote:
> Add these clocks to the binding header so that EMC timings that have
> them as parent can refer to the clocks.

Peter, I assume this patch (and patch 4/8 too) will be needed by any EMC 
driver, whether it's part of this series or Tomeu Vizoso's work. Can you 
please review/ack those two patches for later reference. Thanks.
