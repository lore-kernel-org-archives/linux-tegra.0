From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/2] ARM: tegra: pmc: add specific compatible DT string
 for Tegra30 and Tegra114
Date: Wed, 06 Mar 2013 14:45:59 -0700
Message-ID: <5137B917.20803@wwwdotorg.org>
References: <1361932063-13263-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361932063-13263-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/26/2013 07:27 PM, Joseph Lo wrote:
> The PMC HW is not 100% compatible across all Tegra series. We need to
> specify each of them in the DT match table.

I have applied these two patches to Tegra's for-3.10/cleanup branch.
