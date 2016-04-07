From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH v3] soc: Add support for Parked bits for
 Tegra210
Date: Thu, 7 Apr 2016 15:16:13 -0600
Message-ID: <5706CE1D.3090001@wwwdotorg.org>
References: <1460062537-26011-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460062537-26011-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/07/2016 02:55 PM, Rhyland Klein wrote:
> Tegra210 has a parked bit for each pin. Add code to express this by
> updating the kernel driver MACROs to add in parked_* fields so that
> the kernel can handle them as it sees fit.

Applied.
