From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4 1/2] ARM: dt: tegra: add clock source of PMC
Date: Wed, 03 Apr 2013 15:09:37 -0600
Message-ID: <515C9A91.3040602@wwwdotorg.org>
References: <1364988688-24613-1-git-send-email-josephl@nvidia.com> <1364988688-24613-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364988688-24613-2-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/03/2013 05:31 AM, Joseph Lo wrote:
> Adding the bindings of the clock source of PMC in DT.

The series, applied to Tegra's for-3.10/soc branch.

I'd usually apply DT changes to for-3.10/dt, but since the later code
changes depend on this DT change, I included it in the same branch.
