From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/4] of: Add NVIDIA Tegra Legacy Interrupt Controller
 binding
Date: Mon, 30 Jun 2014 14:32:08 -0600
Message-ID: <53B1C948.6050603@wwwdotorg.org>
References: <1403917351-13215-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403917351-13215-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/27/2014 07:02 PM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The Legacy Interrupt Controller found on NVIDIA Tegra SoCs is used by
> the AVP coprocessor and can also serve as a backup for the ARM Cortex
> CPU's local interrupt controller (GIC).
> 
> The LIC is subdivided into multiple identical units, each handling 32
> possible interrupt sources.

The series looks OK to me, although I guess there will be a V3 to
address Mark's comments?
