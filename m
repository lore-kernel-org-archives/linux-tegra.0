From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 0/8] ARM: tegra: support LP1 suspend mode
Date: Mon, 05 Aug 2013 11:56:02 -0600
Message-ID: <51FFE732.10703@wwwdotorg.org>
References: <1375701664-14965-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375701664-14965-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/05/2013 05:20 AM, Joseph Lo wrote:
> This series adds the support of LP1 suspend mode for Tegra.
> 
> V2:
> * double confirm each patch can be built with all the combination of
>   Tegra SoCs by bisect
> * and make sure the function is still OK with above testing

Great. I assume that at any point in the middle of this series, LP2
still works perfectly on all chips; I don't need all-or-none of the
series for LP2 to still work?
