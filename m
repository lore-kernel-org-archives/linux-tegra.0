From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] ARM: tegra: enable gpio-keys on dalmore
Date: Mon, 15 Jul 2013 10:49:47 -0600
Message-ID: <51E4282B.5040905@wwwdotorg.org>
References: <1373439643-16633-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373439643-16633-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/10/2013 01:00 AM, Laxman Dewangan wrote:
> Dalmore have the keys mounted on board which are connected
> to different pins of Tegra.
> 
> Add the keys entry in DTS file to enable key functionality.
> This will enable KEY_POWER, KEY_HOME, KEY_VOLUMEUP and
> KEY_VOLUMEDOWN.

I have applied this to Tegra's for-3.12/dt branch.
