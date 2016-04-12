From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] sign.sh: Add more features
Date: Tue, 12 Apr 2016 12:01:05 -0600
Message-ID: <570D37E1.7070900@wwwdotorg.org>
References: <1460402288-19511-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460402288-19511-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/11/2016 01:18 PM, Jimmy Zhang wrote:
> 1. Use parameter <soc> to specify boot image type. ie, tegra124, tegra210.
>     Previouly sign.sh can only sign for tegra210 boot image.
>
> 2. Automatically generate signed bct, ie, tegra124.bct, tegra210.bct.
>     A signed bct is needed when flashing target.
>
> Command syntax:
>     $ ./sign.sh <soc> <bootimage> <rsa_key>
>
> Example:
>
>     $ ./sign.sh tegra124 t124.img rsa_priv.pem

Applied.
